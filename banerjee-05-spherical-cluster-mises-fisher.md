Clustering on the Unit Hypersphere using von Mises-Fisher Distributions
Arindam Banerjee, Inderjit S. Dhillon, Joydeep Ghosh, Suvrit Sra
Journal of Machine Learning Research 6 (2005)

# Abstract

* high-dimensional data that is also
  * inherently directional in nature
    * the vector direction is relevant, not its magnitude
  * Often ... L^2 normalized
* (mixtures of) multi-variate Gaussians are inadequate for ... such data
* This paper proposes a generative mixture-model approach
  based on the von Mises-Fisher (vMF) distribution, which
  arises naturally for data distributed on the unit hypersphere
  * two variants of the Expectation Maximization (EM) framework
    for estimating the mean and concentration parameters of this mixture
  * two clustering algorithms corresponding to the[se] variants
  * theoretical basis for the use of cosine similarity that has been
    widely employed by the information retrieval community, and
  * spherical kmeans algorithm (kmeans with cosine similarity)
    as a special case of both variants
  * Empirical results on ... text and gene-expression data ... yields
    * superior results,
      especially for difficult clustering tasks in high-dimensional spaces

# 1 Introduction

* generative (also known as parametric or probabilistic)
  (Smyth, 1997; Jaakkola and Haussler, 1999)
  * vs discriminative (non-parametric) (Indyk, 1999; Schölkopf and Smola, 2001)
  * often provide greater insight into the anatomy of the clusters
  * A lot of domain knowledge can be incorporated
  * often involve ... the EM algorithm
    (Dempster+ 1977; McLachlan and Krishnan, 1997)
    on a properly chosen statistical generative model
  * mixture of multivariate Gaussians
    * analogous to the use of Euclidean or Mahalanobis type distances
      as the chosen measure of distortion from the discriminative perspective
* in information retrieval applications
  * cosine similarity to be a more effective measure of similarity
  * normalizing the data vectors helps to remove the
    biases induced by the length of a document and provide superior results
    (Salton and McGill, 1983; Salton and Buckley, 1988)
  * spherical kmeans (spkmeans) algorithm (Dhillon and Modha, 2001)
    * work well for text clustering
  * similarity measures such as cosine, Jaccard or Dice (Rasmussen, 1992) are
    more effective than measures derived from Mahalanobis type distances
* other important domains such as
  bioinformatics (Eisen+ 1998), collaborative filtering (Sarwar+ 2001)
  * the Pearson correlation coefficient ... is [a] cosine similarity

## 1.1 Contributions

* our generative model has the same relation to spkmeans
  as a model based on a mixture of unit covariance Gaussians has
  to classical kmeans that uses squared Euclidean distances
* computational needs for hard assignments are lower than what is required for
  the standard soft assignments (E-step) for these models

# 2. Preliminaries

# 3. EM on a Mixture of vMFs (moVMF)

* We now consider a mixture of k vMF (moVMF) distributions
* Let X ... be a data set of n independently sampled points

# 4. Handling Large and High-Dimensional Data Sets 8

* critical issues [related to] the mixture model outlined in section 3
  * How to compute κ from (3.6) for high-dimensional data? 4.1
  * Is it possible to significantly reduce computations? hard assignments, 4.2

## 4.2 Analysis of Hard Assignments

* For hard assignments, [computing the partition function] is not required
  * substantially faster running times.  In particular,
  * hard-assignments need O(k) computations in high-precision per iteration
  * soft-assignments need O(nk) computations in high-precision per iteration

# 8. Conclusions and Future Work

* further study of such models. For example, one can consider
  * a hybrid algorithm that employs
    soft-moVMF for the first few (more important) iterations, and then
    switches to hard-moVMF for speed, and
    measure the speed-quality tradeoff that this hybrid approach provides
  * online version of the EM-based algorithms
    * along the lines of Neal and Hinton (1998).  Online algorithms are
    * particularly attractive for dealing with streaming data
      when memory is limited, and
      for modeling mildly non-stationary data sources. We could also adapt a
  * local search strategy such as the one in Dhillon+ (2002a), for incremental
    EM to yield better local minima for both hard and soft-assignments
* The vMF distribution ... is one of the simplest parametric distributions
  * The iso-density lines of the vMF distribution are circles on the [sphere],
  * In some applications, more general iso-density contours may be desirable.
    e.g. Bingham distribution, the Kent distribution, the Watson distribution,
    the Fisher-Bingham distribution, the Pearson type VII distributions
    (Shimizu and Iida, 2002; Mardia and Jupp, 2000)
