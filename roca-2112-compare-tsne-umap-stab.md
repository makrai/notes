A Cross Entropy test allows
  quantitative statistical comparison of t-SNE and UMAP representations
CP Roca1, OT Burton, J Neumann, S Tareen, CE Whyte, S Humblet-Baron, A Liston
arXiv:2112.04172 [q-bio.QM]

* high dimensional single cell data in the biomedical sciences has
  * necessary: dimensionality-reduction tools. t-SNE and UMAP are the two most
  * t-SNE and UMAP have largely remained data visualisation tools due to the
    lack of robust statistical approaches available
* we have derived a statistical test for evaluating the difference between
  dimensionality-reduced datasets, using the
  * Kolmogorov-Smirnov test on the distributions of cross entropy of single
    cells within each dataset
  * capable of distinguishing between true biological variation and rotational
  * a valid distance between single cell datasets, allowing the
    => organisation of multiple samples into a dendrogram
  * ie potential of dimensionality-reduction tools for biomedical data analysis
    beyond visualisation

# 1 Intro

* Traditional approaches, such as
  Principle Components Analysis (PCA) and multidimensional scaling (MDS)
  * linear-scaled low-dimensional representations, which are of high utility
    for comparing datapoints that are most different from each other
  * hE the structure of most single cell experiments places the emphasis on
    identifying cells that are highly similar to each other; for these
    processes non-linear approaches provide superior resolution

* t-Distributed Stochastic Neighbor Embedding (t-SNE) is the most commonly used
  * starts with the single cells distributed at random points, along a Gaussian
    distribution, in transformed space
  * iterative process the cells move along a cost gradient, which provides a
    penalty for mismatch between the distances between two cells in the
    original high-dimensional space versus the representational low-dimensional
    space 3. When sufficient iterations have occurred to reach stability, the
    outcome produces clusters of similar cells, based on the input data
    * Membership of a cluster indicates shared properties, however the
      non-linear nature of the penalty cost does not allow relationships to be
      inferred by the relative positioning of the clusters

* alternative non-linear dimensionality-reduction tools
  * Uniform manifold approximation and projection (UMAP) takes a
    * similar iterative approach in positioning cells based on mismatch between
      high-dimensional and low-dimensional data, however it uses a
    * distinct mathematical basis for the calculations
    * Cell positions are calculated in topological space, with mismatch between
      manifolds driving the iterative process 4
    * results are broadly consistent with t-SNE visualisation, UMAP
    * has superior run times and is
    * argued to better preserve the global distances between cell clusters 4,
      * this is due to the choice of initialisation defaults rather than the
        UMAP algorithm 5
  * den-SNE and densMAP are modifications of t-SNE and UMAP, respectively,
    * attempt to solve the problem inherent to these approaches whereby
      cluster size is driven by the number of cells in the cluster
    * auxiliary function to optimise cell density
      between high-dimensional and low-dimensional space
    * the size of clusters in the resulting low-dimensional plots reflecting
      the degree of heterogeneity present in the cluster 6
  * TMAP 7, to deal with limitations of t-SNE when applied beyond the single
    cell space. The near-ubiquity of t-SNE or analogous tools in the
    visualisation of single cell sequencing data demonstrates the utility of
    low-dimensional representations of complex data. Despite this, t-SNE is
    generally not used as an analytical tool, with downstream analysis most
    commonly based on subsetting data and treating as pseudo-bulk populations
* Here we have developed a Cross Entropy test allowing robust statistical
  comparisons of t-SNE representations.  The test has appropriate sensitivity,
  with the identification of biological differences and the
  dismissal of difference in technical replicates, biological replicates or
  repeat t-SNE runs. The test
  * responds to differences in either inter-cluster frequency or intra-cluster
    phenotype shifts, and differences between multiple t-SNE plots can be
    quantified for the production of dendrograms.  The Cross Entropy test is
    broadly applicable to single cell technologies, including flow cytometry,
    mass cytometry and single cell sequencing, and can be performed on either
    t-SNE and UMAP transformations, providing a highly versatile statistical
    tool to the single cell toolkit

# Results

## A Cross Entropy test provides a robust statistical test for t-SNE comparison

* We sought to derive a statistical test capable of
  * distinguishing biological differences in single cell t-SNE representations,
  * robust against false detection of differences in technical replicates or
    the seed-dependent variation in t-SNE generation. As the t-SNE algorithm is
    driven by the cross entropy of the individual cells in the dataset, and the
    t-SNE fixes the average point entropy, each t-SNE can be considered a
    distribution of cross entropy divergences. Deriving a distribution of cross
    entropy divergences per t-SNE plot therefore allows the use of the
    Kolmogorov-Smirnov (KS) test to evaluate the degree of difference between
    two, or more, t-SNE plots (see Methods)

* A robust t-SNE statistical test should:
  1. reliably fail to detect differences when comparing technical replicates;
  1. reliably fail to detect differences when comparing biological replicates;
  1. reliably identify differences when comparing different biological samples;
  1. not get fooled by different t-SNE runs on the same sample
* The Cross Entropy test was beta-tested by collaborating immunologists on >130
  datasets over the course of 24 months of validation. We initially focused on
  flow cytometry datasets, as the very high cell number achievable by flow
  cytometry provides superior ability to challenge and validate a statistical
  test. As an example of the robustness observed, we present here a
  high-dimensional flow cytometry dataset based on immunological profiling of
  lymphocytes from the lymph nodes, spleen and tissues from the C57BL/6 inbred
  mouse strain (MUS dataset). This design allows us to compare technical
  replicates (splitting a single sample), biological replicates (comparing
  analogous samples from different mice) and biological samples (comparing
  lymphocytesfrom different tissues of the same mice)
1. First, to test for robustness in technical replicates, we compared the t-SNE
   plots generated by splitting a single sample of splenocytes, with FlowSOM
   clustering allowing comparative visualisation of cell identity (Figure 1A)
   * Visually similar plots were generated, with Cross Entropy test values
     showing p values of 0.370 to 1, supporting the null hypothesis of no
     difference (Figure 1A)
2. Second, to test for robustness in biological replicates, we compared the
   t-SNE plots generated by multiple samples of splenocytes from
   age-/sex-matched mice. Again, visually similar plots were generated, with
   the Cross Entropy test p values of 0.202 to 0.636 supporting the null
   hypothesis (Figure 1B)
3. Third, to test for the capacity to identify true biological differences, we
   compared the t-SNE plots generated on lymphocytes profiled from the spleen,
   lymph node and tissues of mice
   * Lymphocytes from the lymph nodes and spleen are phenotypically similar,
     but the relative proportions of each population vary between the sites,
     while non-lymphoid tissue lymphocytes are phenotypically distinct. t-SNE
     visualisations mirrored this biological background knowledge, with highly
     significant Cross Entropy test values across each comparison (Figure 1C)
4. Fourth, we produced independent runs of t-SNE generation on the lymph node
   sample, generating similar t-SNE plots with the characteristic rotational
   symmetry (Figure 1D)
   * visual disparity being greater than the highly significant spleen-lymph
     node comparison,
   * n: Cross Entropy test gave a test p value of 0.585, supporting the null
     hypothesis (Figure 1D).  Multiple runs of this false comparison gave an
     appropriate sensitivity of the Cross Entropy test, with neither over~ nor
     under-reporting of false positives (Figure 1E)
* Together, this example dataset demonstrates the robust ability of
  the Cross Entropy test to distinguish biological signal from noise
