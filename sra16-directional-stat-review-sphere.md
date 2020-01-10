Directional Statistics in Machine Learning: a Brief Review
Suvrit Sra
Book Chapter 2016 in [Directional Statistics]  (eds. C. Ley and T. Verdebout)

* we briefly review
  * common mathematical models
  * software, applications, and open mathematical challenges

#1 Intro

* in classical information retrieval ... for analyzing and clustering text
  * to remove the biases induced by the length of a document [36, 37]
  * spherical k-means (spkmeans) algorithm [16] that runs k-means with cosine
    * work well for text clustering and a variety of other data
    * Another widely used similarity measure is Pearson correlation
      * is [a] cosine similarity between
  * domains where ... cosine, Jaccard or Dice [33] are more effective [26]
* This chapter recaps
  * basic statistical models for directional data
    * some basic distributions on the unit hypersphere, and then discuss
    * two of the most commonly used ones: the von Mises-Fisher and Watson
      * von Mises-Fisher distribution [is] the “Gaussian” of the hypersphere
    * maximum likelihood estimation as well as mixture modeling via the EM
    * a brief pointer to recent literature on applications of directional
* no new theory is developed in this chapter, [but] an easy introduction
  * based on the author’s thesis [38], and the three papers [5, 39, 40]
    * [40] S. Sra and D. Karp.  JMVA 2013 The multivariate Watson distribution
      * also describes asymptotic estimates of the concentration parameter

#2 Basic Directional Distributions

##2.3 Watson distribution

* multivariate Watson distribution [28]
* the vectors ± x ∈ S {p − 1} are equivalent. This constraint is also denoted
* x ∈ P p − 1 , where P p − 1 is the projective hyperplane
* parametrized by a mean-direction μ ∈ P p − 1 , and a concentration parameter

#3 Related work and applications

* classical references on directional statistics are [26, 27, 46]
* more recent, updated reference is [28]
* manifolds, a good starting point is [11]
* high-dimensional application of directional statistics was [5],
  * key application was clustering of text and gene expression data 
    using mixtures of vMFs
* other applications and settings where hyperspherical or manifold data arise
  * feature extraction based on correlation in [19]
  * topic modeling for normalized data [4, 34]
  * semi-parametric setting using Dirichlet process mixtures ... [41]
  * directional data clustering settings include:
    * depth images using Watson mixtures [20]
    * a k-means++ [3] style procedure for mixture of vMFs [29]
    * clustering on orthogonal manifolds [10]
    * mixtures of Gaussian and vMFs [23]
* biomedical (imaging) applications: [30], fMRI [24],
  white matter supervoxel segmentation [9], & brain imaging [35]
* signal processing ... to spatial fading using vMF mixtures [25] and
  speaker modeling [44]
* the Angular Gaussian distribution [45] ... to model natural images [22]

#5 Mixture models

##5.3 Application: clustering using movMF

* Mixtures of vMFs have been ... used in text clustering; see overview [6]
* TODO
* The key characteristic of text data is its high dimensionality
  * for modeling clusters ..., the approximate computation of the 
    concentration parameter κ as discussed in Sec. 4.1 is of great importance
    ... due to floating point difficulties

###Performance evaluation

* normalized mutual information (NMI) [42]
  * also previously used to assess movMF based clustering [5, 6])
  * defined as NMI ( Y, Ŷ ) : = I ( Y, Ŷ ) / H ( Y ) H ( Ŷ ) where
    * I (· , ·) denotes the usual mutual information and
    * H denotes the entropy [13]
    * higher values of NMI are better
* We report performance of our implementation of ... EM for movMF
  against Latent Dirichlet Allocation (LDA) [8] and
  an Exponential-family Dirichlet compound multinomial model (EDCM) [17]

#Conclusion

* we hope to see more exploration of directional models in
  Bayesian models, Hidden Markov Models using directional models, and 
  deep generative models
