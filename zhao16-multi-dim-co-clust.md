Hongya Zhao , Debby D. Wang , Long Chen , Xinyu Liu, Hong Yan
Identifying Multi-Dimensional Co-Clusters in Tensors
  Based on Hyperplane Detection in Singular Vector Spaces
PLOS Published: September 6, 2016

#Abstract

* higher-order singular value decomposition (HOSVD)
  transforms a tensor into a core part and a singular vector matrix along each
  mode, whose
  row vectors can be clustered by a linear grouping algorithm (LGA). Meanwhile,
  hyperplanar patterns are extracted and successfully supported the
  identification of multi-dimensional co-clusters
* favorable performance ... on noisy or overlapped data

#1 Intro

* series of efficient approaches, such as
  sub-dimensional clustering, linear grouping and co-clustering [2, 4–10]
  2. Cheng Y, Church GM. Biclustering of expression data
  4. Lam BS, Yan H
    Subdimension-based similarity measure for DNA microarray data clustering
  5. Van Aelst S, Wang XS, Zamar RH, Zhu R
    Linear grouping using orthogonal regression
  6. Gan X, Liew AW, Yan H
    Discovering biclusters in gene expression data
      based on high-dimensional linear geometries 2008;
  7. Zhao H, Liew AWC, Xie X, Yan H
    A new geometric biclustering algorithm based on the Hough transform
  8. Zhao H, Chan KL, Cheng LM, Yan H
    A probabilistic relaxation labeling framework
      for reducing the noise effect in geometric biclustering of gene express
    2009; 42 (11)
  9. Wang DZ, Yan H. A graph spectrum based geometric biclustering algorithm
  10. Chen HC, Zou W, Tien YJ, Chen JJ
    Identification of bicluster regions in a binary matrix and its applications
* biclustering
  * coherent rows and columns are accordingly regarded as a bicluster, which
    corresponds to a specific coherent pattern
  * with constant value, coherent value, and coherent evolutions [12]
  * quite challenging, especially for large-scale data sets [12–17]
* algos
  * Cheng and Church developed an efficient node-detection algorithm (CC) to
    find valuable submatrices in yeast or human experssion data, based on _mean
    squared residue scores_ [2]
  * in a document-word matrix was novelly transferred into a _bipartite graph
    partitioning_ problem by Dhillon [18], and a spectral algorithm (BSGP) was
    proposed to give a reasonable partitioning solution
  * Bergmann+ defined a transcription module ... by _iteratively_
    searching for co-clusters until a threshold was reached (ISA) [19]
    * perform well when applied to large-scale data
  * a simple binary reference model was provided for comparing and validating
    biclustering methods [20], and meanwhile a fast
  * divide-and-conquer algorithm (BiMax: http://www.tik.ee.ethz.ch/sop/bimax)
    was proposed. As another classic co-clustering method,
  * FABIA (Factor Analysis for Bicluster Acquisition) is a multiplicative
    model depending on _linear dependencies_ between gene expression and
    experimental conditions [21]
* tensor
  * Banerjee+ (2007) proposed a tensor co-clustering method by describing all
    the known relations between the different entity classes with a
    _relation graph model_ [27]
  * multilinear decomposition with sparse latent factors
      Papalexakis EE, Sidiropoulos N, Bro R
      From k-means to higher-way co-clustering:
        Multilinear decomposition with sparse latent factors
      Signal Processing, IEEE Transactions on. 2013;61(2):493–506
  * our work ... conjunction of
    * higher-order singular value decomposition (HOSVD) [23] and
    * linear grouping algorithm (LGA) [5, 31]
  * Huang+ (2008/9?) has also employed HOSVD [23], toghther with K-Means in
    their co-cluster method. However, the K-Means algorithm could only form
    clusters around “object” centers in the singular vector spaces, which is
    * mainly related to constant biclusters
  * On the contrary, LGA could find linear structures (lines, planes and
    hyperplanes) in the singular vector spaces
    * These linear structures correspond to other types of co-clusters
      (constant-row/column, additive and mulitplicative co-clusters)
      in addition to constant ones in the original data
* our method,
  1. generalized from the SVD of a matrix, a truncated HOSVD is implemented on
     an Nth-order tensor, resulting in a core tensor and a series of singular
     vector matrices along each mode
  2. LGA is subsequently applied to reveal the linear patterns embedded in
     singular vector matrices, with biclusters along each mode detected
  3. through combining the detected linear structures of all the modes and
     defining a scoring function, we can successfully identify significant
     co-clusters in the tensor

#Conclusion

* future
  * use of several other decomposition methods
    e.g. the dominant multidimensional subspace in tensor data can be found
    using higher order orthogonal iteration of tensors (HOOI) [50]. As
    discussed above, PARAFAC with sparse latent factors [29] has good
    performance for detecting co-clusters of rank 1 with low SNR
