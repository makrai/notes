ND Sidiropoulos, LD Lathauwer, X Fu, K Huang, EE Papalexakis, and C Faloutsos
Tensor Decomposition for Signal Processing and Machine Learning
IEEE Transactions on signal processing 2017

# Abstract

* This overview focuses on fundamentals and motivation (using various
  application examples), aiming to balance of breadth and depth
* algorithms ranging from alternating optimization to stochastic gradient;
  statistical performance analysis
* applications ranging from source separation to collaborative filtering,
  mixture and topic modeling, classification, and
  multilinear subspace learning

# 1 Introduction

* applications in
  * signal processing (speech, audio, communications, radar, biomedical),
  * machine learning (clustering, dimensionality reduction,
    latent factor models, subspace learning), and well beyond
  * historically
    * two important application areas driving theo and algo
      * Psychometrics (mathematical methods for the analysis of personality)
      * Chemometrics (likewise, for chemical data)
    * Signal processing followed, in the 90’s, but
    * the real spark came when the computer science community discovered
      the power of tensor decompositions (Kolda+ 2005; Acar+ 2005, 2009)
  * nowadays many hundreds, perhaps thousands of papers published each year
    * Signal processing applications include, e.g.,
      * unsupervised separation of unknown mixtures of speech signals 4 and
      * code-division communication signals without knowledge of their codes 5;
      * emitter localization for radar, passive sensing, and communication
    * Machine learning applications include
      * face recognition, mining musical scores, and
        detecting cliques in social networks – see 10–12
      * latent variable models, particularly topic models 13, and
      * connections between orthogonal ~ and the method of moments for LDA
* tutorials and overviews that offer different points of view
  * Kolda and Bader (2009)
    * basic models and algorithms (as of that time), but it does not go
      deep into uniqueness, advanced algorithmic, or estimation-theory
    * tutorials
      * Cichocki (2015+) with many figures that help three-way thinking
      * Comon (2014) views tensors as mappings rather than  use in science
  * large-scale numerical computations (Grasedyck+ 2013; Hackbusch 2012)
    * Vervliet (2014) more accessible
    introduction.  A gentle introduction to tensor
  * Chemometrics tutorial 19 – a bit outdated but clear
  * book 20. Finally, 21 is an upcoming
  * tutorial with emphasis on scalability and data fusion (Papalexakis+ 16)
    * it does not go deep into tensor rank, identifiability,
      decomposition under constraints, or statistical performance benchmarking
* signal processing (SP) and machine learning (ML) points of view
  * In the context of the canonical polyadic decomposition (CPD)
    * SP researchers (and Chemists) typically focus on the columns of the
      factor matrices A, B, C and the associated rank-1 factors
      because they are interested in separation
    * ML researchers often focus on the rows of A, B, C, because they
      think of them as parsimonious latent space representations
      * For a user × item × context ratings tensor, for example,
        a row of A represents the corresponding user in latent space, and
        a row of B (C) representats the corresponding item (context)
        in the same latent space
    * interested in model identifiability
      * SP because it guarantees separability;
      * ML to be able to interpret the dimensions of the latent space
  * In co-clustering applications, on the other hand, the
    rank-1 tensors `a_f \ocirc b_f \ocirc c_f` capture latent concepts
    * SP researchers seek optimal solutions, which is conceivable for small
      to moderate data; they tend to use computationally heavier algorithms
    * ML researchers are nowadays trained to think about scalability

# 2 matrix preliminaries 3

including matrix rank and low-rank approximation, and a review of some useful
matrix products and their properties

# 3 rank and rank decomposition for tensors: CPD/PARAFAC 4

* bounds on tensor rank,
  multilinear (mode-) ranks, and
  relationship between tensor rank and multilinear rank
* typical, generic, and border rank, and discuss
* why low-rank tensor approximation may not be well-posed in general
* Tensors can be viewed as data or _as multi-linear operators_

## A. Low-Rank Tensor Approximation 5

* Alternating Least Squares (ALS)

# 4 uniqueness of low-rank tensor decomposition 9

* two stepping-stone proofs: one based on eigendecomposition, the other bearing
  Kruskal’s mark (“down-converted to baseband” in terms of difficulty)

# 5 The Tucker model and multilinear SVD 12

connections with rank decomposition

# 7 algorithmic aspects 16

* how different types of constraints can be handled,
  how to exploit data sparsity,
  scalability, how to handle
  missing values
* In addition to basic alternating optimization strategies
  * gradient descent, line search, Gauss-Newton, alternating direction method
    of multipliers, and stochastic gradient approaches. The next topic is
* statistical performance analysis, focusing on the widely-used
  Cramér-Rao bound and its efficient numerical computation

# 8 Cramér-Rao bound 21

* a lower bound on the variance of any unbiased estimator (and thus on mean
  square error of unbiased estimators), which is expressed in terms of the
  (pseudo-)inverse of the Fisher information matrix

# 9 applications 23

* signal processing (communication and speech signal separation,
  multidimensional harmonic retrieval)
* machine learning (collaborative filtering, mixture and topic modeling,
  classification, and multilinear subspace learning)

# 9.E Gaussian Mixture Parameter Estimation 25

# 10 Software, demos, history, and what lies ahead 28

* Matlab provides native support for tensor objects, but `...`
* freely available toolboxes:
  1. The n-way toolbox http://www.models.life.ku.dk/ nwaytoolbox
    * based on ALS (+Gauss-Newton, line-search and other methods as an option)
    * many non-parametric types of constraints, such as non-negativity;
  2. The tensor toolbox
    http://www.sandia.gov/ ∼tgkolda/TensorToolbox/index-2.6.html by
    Kolda+ 138, 139 was the first to provide support for sparse,
    dense, and factored tensor classes, alongside standard ALS and all-at-once
    algorithms for CPD, MLSVD, and other factorizations;
  3. Tensorlab http://www.tensorlab.net/ by De Lathauwer+ 140, builds
     upon the complex optimization framework and offers numerical algorithms
     for computing CPD, MLSVD and more general block term decompositions. It
    * includes a library of constraints and regularization penalties and offers
    * jointly factorize dense, sparse, structured and incomplete tensors.  It
      provides special routines for large-scale problems and visualization
  4. SPLATT http://glaros.dtc.umn.edu/gkhome/splatt/ overview by Smith+
    * a high-performance computing software toolkit for parallel sparse tensor
      factorization
    * memory and operation-efficient algorithms that allows it to compute
      PARAFAC decompositions of very large sparse datasets
    * written in C and OpenMP
  5. The TensorPackage
    http://www.gipsa-lab.fr/∼pierre.  comon/TensorPackage/tensorPackage.html by
    Comon+ which includes various algorithms for CPD and employs enhanced
    line search 94
  * supplementary material
    * educational “plain-vanilla” programs
      (CPD-ALS, MLSVD, ⊥-Tucker-ALS, CPD-GD, CPD-SGD), and
    * demos (multichannel speech separation, and faces tensor compression)
* opportunities and challenges ahead, we see the need for
  * more effective and tractable tensor rank detection criteria, and
  * flexible and scalable algorithms that can handle very big datasets while
    offering identifiability, convergence, and parameter RMSE performance
    guarantees – at least under certain reasonable conditions
  * Data fusion, in the form of coupled decomposition of several tensors
  * Tensor decomposition in higher rank blocks
  * multilinear models such as tensor trains as “universal approximants”
    * as a way to get away from the “curse of dimensionality”
