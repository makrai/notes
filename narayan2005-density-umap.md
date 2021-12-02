Density-Preserving Data Visualization Unveils Dynamic Patterns of Single-Cell
  Transcriptomic Variability
Ashwin Narayan, Bonnie Berger, Hyunghoon Cho
Nature Biotechnology doi: 10.1038/s41587-020-00801-7

# Abstract

* Nonlinear data-visualization methods, such as t-SNE and UMAP
  * staple tools for summarizing the complex transcriptomic landscape of single
    cells in 2D or 3D
  * hE, neglect the local density of data points in the original space, often
    resulting in misleading visualizations where densely populated
    subpopulations of cells are given more visual space even if they account
    for only a small fraction of transcriptional diversity within the dataset
* We
  * present den-SNE and densMAP, our density-preserving visualization tools
  * demonstration: visual interpretation of single-cell RNA-seq data
    * On recently published datasets
    * we newly reveal significant changes in transcriptomic variability within
      a range of biological processes, including cancer, immune cell
      specialization in human, and the developmental trajectory of C. elegans

# Introduction

* Exploratory analyses of large-scale biological datasets typically begin with
  visualizing the data in low dimensions, in the hopes of revealing high-level
  structural insights that can be probed in downstream analyses
  * especially critical in single-cell transcriptomics
    * rapidly emerging field
    * high-throughput single-cell RNA sequencing (scRNA-seq) technologies are
      empowering researchers to study gene expression at an unprecedented
      resolution across diverse tissues, organisms, and biological conditions
    * high-dimensionality of scRNA-seq datasets (1000s of transcripts per cell)
    * large-scale (hundreds of thousands of cells)
    * 2D or 3D data visualizations for quickly and intuitively
      * finding structural patterns (e.g. clusters or trajectories) and
      * communicating relevant biological findings with the scientific comm
* t-SNE and UMAP
  * t-stochastic neighborhood embedding 3 (t-SNE) and
  * uniform manifold approximation and projection 4 (UMAP)
  * widely adopted in scRNA-seq data analysis pipelines 5, 6
  * nonlinear embedding of the original space
  * iterative algorithms
  * preserve the original local neighborhood of each data point in the visu,
    * more permissive of distortions in long-range distances
  * good empirical performance in
    elucidating sophisticated manifold structures and clustering patterns
  * hE, both methods neglect information about the local density of data points
    * apparent size of a cluster largely reflects the number of points
    * rather than its underlying heterogeneity, as we demonstrate
    * heterogeneity corresponds to the variability of gene expression within
* we introduce density-preserving data visu methods den-SNE and densMAP
  * both t-SNE and UMAP construct their embeddings iteratively
  * we augment the objective function with an
    auxiliary term that measures the distortion of local density at each data
    point in the visualization
  * we develop a general, differentiable measure of local density, local radius
    * intuitively represents the average distance to the nearest neighbors
    * enables efficient optimization of the density-augmented visu objective
* To demonstrate the utility of density-preserving visualization
  * a range of published scRNA-seq datasets from
    lung cancer patients 7 , human peripheral blood cells 8 and
    embryonic roundworm Caenorhabditis elegans 9
  * the UK Biobank human genotype profiles and the canonical
  * MNIST hand-written digit images
* Our density-preserving methods capture additional information beyond existing
  * biological insights others miss, including immune cell transcriptomic
    variability in tumors
  * specialization of monocytes and dendritic cells
  * temporally modulated transcriptomic variability across developmental
    lineages of C. elegans
  * validated our key findings from the lung cancer and peripheral blood data
    on additional datasets

# Results

## Overview of density-preserving data visualization

* t-SNE and UMAP both create a nearest-neighbors graph and
  * preserve only the distances between points that are neighbors in this
  * We use the same  graphs to calculate a local radius around each point,
  * original objective function quantifies the agreement between a given
    embedding and the original nearest-neighbors graph
* see Methods, Supplementary Notes 1–3

## Visualizing the heterogeneity of immune cells in tumor

* we calculate two complementary measures of local density in the visualization
  * local radius and
    * intuitively, the local radius captures the size of a neighborhood that
      contains a fixed number of nearest neighbors,
    * consistent with how our algorithms model visual density for effic optim
  * neighborhood count (see Methods)
    * captures the number of points within a fixed radius around each point
    * arguably a more direct notion of density
      previously used in the literature on visual perception 10
  * we assess their correlation with the local radii computed in the orig space
    * den-SNE (R 2 = 0.650 for local radius; average R 2 = 0.657 for neighbor
      compared to t-SNE (R 2 = 0.004; R 2 = 0.023) (Figure 3c; Supplementary
    * densMAP (R 2 = 0.590 for local radius; average R 2 = 0.632 for neighbor)
      and UMAP (R 2 = 0.045; R 2 = 0.008) are analogous (Supplementary Figures)

## Visu immune cell specialization and diversification in peripheral blood

## Visualizing time-varying transcriptomic heterogeneity in C. elegans devel 13

* To explore embryo development at high-resolution, Packer+ (2019) performed
  scRNA-seq profiling of C. elegans to create an atlas of gene expression at
  almost every cell division of the embryo 9 . Given that visualizing these
  data illustrates trajectories of development and differentiation, we asked
  whether density-preserving visualization could better capture the
  diversification (or lack thereof) of different developmental lineages,

# General applicability of density-preserving data visualization

* The UK Biobank 26 (UKBB) is an ambitious project collecting extensive
  genotypic and phenotypic data from British individuals
  * skew in ethnicity of the British population, most of the individuals
    self-identify as white (94% of the 534k individuals)
  * t-SNE and UMAP show the cluster corresponding to whites disproportionately
    large, unlike the clusters corresponding to Asian and black people
  * den-SNE and densMAP results in a more balanced representation
    * five subgroups with comparable diversity
* MNIST dataset, a dataset of handwritten digit images (Methods)
  * t-SNE and UMAP generate ten evenly sized clusters;
  * den-SNE and densMAP visualizations
    * hE, cluster 1 is strikingly less variable than the other digits

## Density-preserving visualization is almost as efficient as existing approach

* our density-pres methods have the same asymptotic scaling as t-SNE and UMAP
* the additional computations are O(n) in dataset size
* O(n log n) complexity of t-SNE (with the standard Barnes-Hut approximations)
* densMAP largely retains the computational efficiency of UMAP by
  * similarly leveraging stochastic gradient descent (Methods)
  * relative overhead of densMAP remains constant as the dataset becomes larger
    (Supplementary Figure 13)
* memory requirement of
  * den-SNE is virtually identical to that of t-SNE and
  * densMAP uses about 150MB more peak memory across the range of data sizes
    (20k to 86k) we profiled (Supplementary Figure 13)

# Discussion

* Our techniques for augmenting density information are also broadly applicable
  to other visualization algorithms, including
  * recent extensions of t-SNE 30, 31 and
    * 30. Linderman G. C; Rachh M; Hoskins J. G; Steinerberger S. & Kluger Y.
      Fast interpolationbased t-SNE for improved visualization of single-cell
      Nature Methods 16, 243–245 (2019)
    * 31. Cho, H., Berger, B. & Peng, J.
      Generalizable and scalable visualization of single-cell data using neural
      Cell systems 7, 185–191 (2018).
  * force-directed layout embedding 32, 33 (FDLE)
    * 32. Eades, P.
      A Heuristic for Graph Drawing. Congressus Numerantium 42, 149–160 (1984)
    * 33. Harel, D. & Koren, Y.
      A fast multi-scale method for drawing large graphs
      Intl Symposium on Graph Drawing, 183–196 (Springer, Heidelberg, 2000)
* further research for analyzing single-cell datasets
  * local density measures for noise reduction, as
  * they often reveal fine-grain structure within a cell type, 
    * typically a dense “core” surrounded by a sparse cloud of cells with more
      divergent expression patterns
    * By focusing on only this core, one could obtain crisper canonical reprs
  * k-nearest neighbor-based methods may also benefit from information about
    local variability
    * density-augmented algorithms for clustering, trajectory analysis, and
      data integration that could better exploit the true underlying structure

# Methods 20

## Review of t-SNE and UMAP. The most widely-used nonlinear visualization

## Adaptive length-scale selection in t-SNE and UMAP erases density info 22

## Our approach: capturing density information using the local radius 24

* dense region if its nearest neighbors are very close to it, and in a sparse
* we use average distance to nearest neighbors as a measure of density
* we require two components: 
  * a pairwise distance function d(x i , x j ), and 
  * a probability distribution ρ j|i that weighs each x j based on its distance
    from x i , with faraway points having lower weights. We define the 
* local radius `R_o` at an original x i , denoted R ρ (x i ),
  as the expectation of the distance function over x j with respect to ρ j|i ,
  thus capturing the average distance from x i to nearby points: 
* In the following, we let the distance function be the squared Euclidean dist,
* In den-SNE and densMAP, we take advantage of the probability distributions P
  t-SNE and P UMAP which already capture local relationships; for the local
* this representation of 
  * density (inversely- related) scales with the variance of a range of
    data-generating distributions and 
    increases when the length-scale term σ i increases (Supplementary Note 3).  
* local radius `R_e` in the embedding. Let y i be the embedding coordinates of
  * We need a distribution analogous to P for calculating the expected distance
  * adaptive length-scales like P would present a major hurdle for optimization
  * we leverage the embedding distribution Q computed by t-SNE and UMAP as an
    approximation for the adaptive scheme. It is worth noting that, in the case

## Augmenting the visualization objective to induce density preservation 26

## Optimizing the embedding with respect to density-augmented objectives 27

## Implementation details 29. To ensure that our methods find good local optima

## Quantitative evaluation of density preservation 30
