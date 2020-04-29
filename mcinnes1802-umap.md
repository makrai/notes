Leland McInnes, John Healy, James Melville
UMAP: Uniform Manifold Approximation and Projection for Dimension Reduction
arXiv:1802.03426 [stat.ML]

# Abstract

* theoretical framework based in Riemannian geometry and algebraic topology
* competitive with t-SNE for visualization quality, and
  arguably preserves more of the global structure with superior run time
* no computational restrictions on embedding dimension

# 1 Intro

* two categories of Dimension reduction algorithms
  * preserve the [global/local] distance structure within the data
  * global: PCA [22], MDS [23], and Sammon mapping [41]
  * local: t-SNE [50, 49], Isomap [47], LargeVis [45],
    Laplacian eigenmaps [5, 6] and diffusion maps [14]
* mathematical foundations [of UMAP] related to
  the work of Belkin and Niyogi on Laplacian eigenmaps
  * We address the issue of uniform data distributions on manifolds
    through a combination of Riemannian geometry and the work of D Spivak [43]
    in category theoretic approaches to
    geometric realization of fuzzy simplicial sets
* t-SNE is the current SOTA for dimension reduction for visualization
* UMAP has ... widespread use in the fields of
  * bioinformatics [4, 15, 37, 2, 36, 13],
  * materials science [27, 19], and
  * machine learning [8, 20, 17, 38] among others

# 2 the theory underlying the algorithm

* necessary to understand both the theory underlying why UMAP works and the
  motivation for the choices that where made in developing the algorithm
* reader without a background (or interest) in
  topological data analysis, category theory or the theoretical underpinnings
  should skip over this section and proceed directly to 3
* strong theory and mathematically justified algorithmic decisions are of
  particular importance in the field of unsupervised learning

# 3 computation description of UMAP 12

* Appendix C contrasts UMAP against the more familiar algorithms t-SNE and
  LargeVis, describing all these algorithms in similar language
* not [UMAP's] theoretical underpinnings

# 4 Implementation and Hyper-parameters 14

* hyper-parameters involved and their practical effects

## 4.1 Algorithm description 15

## 4.2 Implementation 18

## 4.3 Hyper-parameters 19

1. `n`, the number of neighbors to consider when approximating the local metric
2. `d`, the target embedding dimension;
3. `min-dist`, the desired separation between close points in the embedding
4. `n-epochs`

* The effects of the parameters d and n-epochs are largely self-evident, and
  * the effects of the number of neighbors n and of min-dist are less clear
* number of neighbors `n` as
  the local scale at which to approximate the manifold as roughly flat, with
  * manifold estimation averaging over the n neighbors. Manifold
  * features that occur at a smaller scale than within the n nearest-neighbors
    of points will be lost, while
  * large scale manifold features that cannot be seen by patching together
    locally flat charts at the scale of n nearest-neighbors may not be well
    detected. Thus n represents some degree of
  * trade-off between fine grained and large scale manifold features —
  * smaller values will ensure detailed manifold structure is captured, while
  * larger values will capture large scale manifold structures, but at a loss
  * With smaller `n` the manifold is broken into many small connected comps
    * [then] care needs to be taken with the spectral embedding for init
* min-dist is a hyperparameter directly affecting the output, as it
  * controls the fuzzy simplicial set construction from the low dim repr. It
  * [replaces] the distance to the nearest neighbor used to ensure local
    connectivity. In essence this
  * determines how closely points can be packed together in the low dim repr
    * Low values on min-dist will result in potentially densely packed regions,
      but will likely more faithfully represent the manifold structure
    * Increasing the value of min-dist will force the embedding to
      spread points out more, assisting visualization (avoiding overplotting)
    * essentially aesthetic parameter, governing the appearance

# 5 results on real world datasets as well as scaling experiments 22

* compared with other dimension reduction algorithms
* datasets were considered:
  * Pen digits [1, 10] is a set of 1797 grayscale images of digits
  * COIL 20 [34] is a set of 1440 greyscale images consisting of
    20 objects under 72 different rotations spanning 360 degrees. Each image is
  * COIL 100 [35] is a set of 7200 colour images consisting of 100 objects
  * Mouse scRNA-seq [11] is profiled gene expression data for 20,921 cells from
  * Statlog (Shuttle) [28] is a NASA dataset: positions of radiators in the
    space shuttle, including a timestamp. The dataset has 58000 points
  * MNIST [25] is a dataset of 28x28 pixel grayscale images of handwritten dig
  * F-MNIST [53] or Fashion MNIST is a dataset of 28x28 pixel grayscale images
    of fashion items (clothing, footwear and bags). There are 10 classes and
  * Flow cytometry [42, 9] is a dataset of flow cytometry measurements of CDT4
    cells comprised of 1,000,000 samples, each with 17 measurements
  * GoogleNews word vectors [33] is a dataset of 3 million words and phrases

## 5.1 Qualitative Comparison of Multiple Algorithms 23

* UMAP is comparable to t-SNE when reducing to two or three dimensions. For
* UMAP has captured more of the global and topological structure of the
  * More of the loops in the COIL20 dataset are kept intact, including the
    intertwined loops. Similarly the
  * global relationships among different digits in the MNIST digits dataset are
    * 1 and 0 at far corners of the embedding space, and 4,7,9 and 3,5,8
  *  In the Fashion MNIST dataset the distinction between clothing and footwear
   * word vectors

## 5.2 Embedding Stability 23

* stochastic
  * approximate nearest neighbor search, and
  * gradient descent with negative sampling for optimization
* resulting embedding is necessarily different
  from run to run, and under subsampling of the data
* In this subsection we compare the stability under subsampling
  of UMAP, LargeVis and t-SNE
* we make use of the normalized Procrustes distance between distributions
  Given two datasets X = {x 1 , . . . , x N } and Y = {y 1 , . . .  , y N }
  such that x i corresponds to y i , we can define the Procustes distance
  between the datasets d P (X, Y ) in the following manner. Determine Y 0 = {y
  * optimal translation, uniform scaling, and rotation of Y that minimizes the
    squared error
* stability under sub-sampling by considering the normalized Procrustes dist
  between the embedding of a sub-sample, and the corresponding sub-sample of an
  embedding of the full dataset
  * As the size of the sub-sample increases
    the average distance ... should decrease, potentially toward some
    asymptote of maximal agreement under repeated runs
  * Ideally this asymptotic value would be zero error, but
    for stochastic embeddings such as UMAP and t-SNE [zero d] is not achievable
* Flow Cytometry dataset due its large size, interesting structure, and low

## 5.3 Computational Performance Comparisons 26

### 5.3.1 Scaling with Embedding Dimension 28

* UMAP is significantly more performant than t-SNE 2 when embedding into d > 2
  * e.g. clustering or anomaly detection rather than merely for visualization
  * far more efficient than t-SNE, even for d = 6 or 8 (see Figure 5). This is
  * [because] not require global normalisation [and]
    space trees —such as the quad-trees and oct-trees that t-SNE uses [49]—
    Such space trees scale exponentially in dimension, resulting in t-SNE’s

### 5.3.2 Scaling with Ambient [környező i.e. orig?] Dimension 30

* UMAP: combination of the local-connectivity constraint and the approx NN srch
* python implementation also supports input in sparse matrix format, allowing

### 5.3.3 Scaling with the Number of Samples 31

* superior scaling performance in comparison to Barnes-Hut t-SNE, even when
* Asymptotic scaling of UMAP is comparable to that of FIt-SNE (and LargeVis)

# 6 weakenesses, applications for which UMAP [is not best] 35

* interpretability of the reduced dimension results [may be important]
  * interpretable: PCA, Non-Negative Matrix Factorization (NMF). In particular
  * [no] equivalent of factor loadings that linear techniques such as PCA, or
* UMAP can  find manifold structure within the noise of a dataset – similar to
  * [like] the human mind finds structured constellations among the stars. As
* UMAP axiom: local distance is of more importance than long range distances
  * if global structure is of primary interest then UMAP may not be the best
    choice for dimension reduction
    * While we believe that UMAP can capture more global structure than other
* approximations are made. This
  * can have an impact on the results of UMAP for small (less than 500 samples)
  * approximate nearest neighbor algorithms, and the negative sampling used in
    optimization, can result in suboptimal embeddings. For this reason we
* future: A slower but exact implementation of UMAP for small datasets is a

# 7 potential extensions of UMAP that are 39

* made possible by its construction upon solid mathematical foundations
* include semi-supervised learning, metric learning and
  heterogeneous data embedding
* (semi-)supervised dimension reduction, and dimension reduction for datasets
  with heterogeneous data types
  * Each data type (or prediction variables in the supervised case) can
    * be seen as an alternative view of the underlying structure,
    * [have] a different associated metric – for example
      categorical data may use Jaccard or Dice distance, while
      ordinal data might use Manhattan distance. Each view and metric can be
  * include semi-supervised clustering, and interactive labelling tools
* add new unseen data points into an existing embedding
* the combination of supervision and the addition of new samples
  rovides avenues for metric learning. The
  * addition of new samples would [make UMAP] a feature engineering tool as
    part of a general machine learning pipeline for clustering or classif
* generative model similar to some use cases for autoencoders. Finally, there
* many use cases for metric learning; see [54] or [7] for example
* detect and mitigate against potentially spurious embeddings,
  particularly for small data cases. The addition of such techniques would make

# 8 Conclusions 40
