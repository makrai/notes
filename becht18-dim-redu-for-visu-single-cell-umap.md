E Becht, L McInnes, J Healy, C Dutertre, IWH Kwok, LG Ng, F Ginhoux & EW Newell
Dimensionality reduction for visualizing single-cell data using UMAP
Nature Biotechnology volume 37, pages 38–44(2019)Cite this article

* Comparing the performance of UMAP with five other tools
  * UMAP provides the fastest run times, highest reproducibility and the
    most meaningful organization of cell clusters

# Main

* number of parameters analyzed in single-cell cytometry and transcriptome
  * ∼20 for flow cytometry, ∼40 for mass cytometry and
    >20,000 in single-cell RNA sequencing (scRNAseq)
* Dimensionality reduction techniques have been pivotal to visualize
* Nonlinear dimensionality reduction techniques
  * avoid overcrowding of the representation, wherein distinct clusters are
    represented on an overlapping area
  * include Isomap [2], Diffusion Map [3] and t-SNE
* t-SNE is currently the most commonly used technique in single-cell analysis
  * efficiently reveal local data structure and is widely used to identify
    distinct cell populations in cytometry and transcriptomic data
  * limitations such as
    * loss of large-scale information (the intercluster relationships),
    * slow computation time and
    * inability to meaningfully represent very large datasets
* uniform manifold approximation and projection (UMAP) has been recently
  * preserve as much of the local and more of the global data structure
  * shorter run time [than] Barnes–Hut t-SNE, much faster than scvis, and
    comparable to FIt-SNE
* we test these claims on three well-characterized single-cell datasets 9,10,11
  * visually and quantitatively compare UMAP with
    * [t-SNE variants]
      * the widely used Barnes–Hut implementation of t-SNE [12]
      * heavily optimized Fourier-interpolated t-SNE,
        with or without late exaggeration (FIt-SNE l.e. or FIt-SNE, resp)
    * autoencoder neural network scvis [14]
      * currently offers the advantage of being
        able to append new data points to an existing embedding

# Results

## Quantitative analysis of UMAP, t-SNE and scvis outputs

* alternatives to UMAP
  * Linderman+ recently optimized t-SNE to decrease its run time by using
    Fourier interpolation to speed up the convolution step (FIt-SNE)
    * late-exaggeration parameter that
      magnifies gaps between distinct clusters (FIt-SNE l.e.)
  * Ding+ recently published the autoencoder neural network scvis algorithm
* [we] quantitatively benchmark computational aspects of UMAP
  * dataset:
    * large (300,000–800,000 cells) and high-dimensional (38–100) datasets,
    * including two mass cytometry datasets and one scRNAseq dataset
  * We report on the
    * [run time] on data subsamples of various sizes
    * abilities to represent distinct cell clusters in a non-overlapping
    * reproducible clusters and to
    * preserve distances
* how reproducible the embeddings were on a local scale
  * k-means clustering on the [UMAP] embeddings of
    three data subsamples of size 200,000, as well as on the [full] embedding
    * (with k = 100 to obtain small clusters)
  * how informative the [clustering] of the subsamples were to predict the
    [clustering] of the full datasets (Fig. 4b)
  * normalized mutual information coefficients
    * UMAP nonetheless ranked first on two datasets and second on the third one
      * between 0.4 and 0.5
    * with FIt-SNE with late exaggeration appearing second best
* Finally, we analyzed how each algorithm dealt with global data structure by
  * comparing distances between random pairs of points in the original or
    embedded data
    * each algorithm consistently preserved distances on a small scale
    * t-SNE-based algorithms appeared to ignore distances on a moderate scale
    * scvis and UMAP both appeared to better preserve large-scale distances
    * scvis appeared marginally better than UMAP in that regard
  * quantifying the reproducibility of embeddings
    * we measured the correlation of coordinates
      on random subsamples of varying sizes versus embeddings of the full dtset
      up to symmetries across the axes
    * t-SNE-based methods appeared poorly reproducible across datasets and
      subsample sizes. scvis and UMAP both appeared more reproducible, with
      UMAP ranking first for most sample sizes across all datasets
    * consistent with the idea that both UMAP and scvis perform optimizations
      that are sensitive to global features of the data, thus reaching similar

# Discussion
