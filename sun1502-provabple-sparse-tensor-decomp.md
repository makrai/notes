Will Wei Sun, Junwei Lu, Han Liu, Guang Cheng
Provable Sparse Tensor Decomposition
arXiv:1502.01425v3 [stat.ML] 2 May 2016

# Abstract

* We propose a novel sparse tensor decomposition method, namely
  Tensor Truncated Power (TTP) method, that
  * incorporates variable selection into the estimation of decomposition comps
  * sparsity is achieved via an efficient truncation step
    embedded in the tensor power iteration
  * applies to a broad family of high dimensional latent variable models,
    including high dimensional Gaussian mixture and mixtures of sparse
    regressions
* theoretical investigation is further conducted.  In particular, we show that
  the final decomposition estimator is guaranteed to achieve a local
  statistical rate, and further strengthen it to the global statistical rate by
  * a proper initialization procedure
* In high dimensional regimes, the obtained statistical rate significantly
  improves those shown in the existing non-sparse decomposition methods
* empirical advantages of TTP are confirmed in
  * extensive simulated results[,]
  * click-through rate prediction and
  * high-dimensional gene clustering

# Introduction

* Tensor ... used in industry (Carroll and Chang 1970; Bro and Kiers 2003),
  * machine learning (Karatzoglou+ 2010; Rendle and Schmidt-Thieme, 2010;
    Zheng+ 2010; Chi and Kolda, 2012; Liu+ 2013) and
  * statistics (Zhou+ 2013; Yang and Dunson, 2013; Yuan and Zhang, 2014)
  * decomposition (Signoretto+ 2014; Anandkumar+ 2014b)
    * Anandkumar, A., Ge, R., Hsu, D., Kakade, S. M. and Telgarsky, M
      Tensor decompositions for learning latent variable models
      Journal of Machine Learning Research 15 2773–2832 (2014b)
    * Signoretto, M., Dinh, Q., Lathauwer, L. and Suykens, J
      Learning with tensors:
        A framework based on convex optimization and spectral regularization
      Machine Learning 93 303–351 (2014)
  * personalized recommendation
    * To incorporate the contextual information into [recommendation systems]
    * user-item-context tensor
    * For example, in online advertising, users’ click behaviors on a jacket
      advertisement in the winter could be different from those in the summer
*  We refer readers to Kolda and Bader (2009a) for a thorough overview of
   tensor decompositions and their applications
* a ... method that can simultaneously perform tensor decomposition and select
  informative features is in need
  * non-sparse regime: where the decomposition components include all features
  * in high dimensional tensor cases, many features in the components
    essentially contain no information about the tensor structure, and thus the
    performance of tensor structure recovery may not be desirable
  * in many applications, it is important to identify which features are
    crucial
  * tensor decomposition is applicable for clustering (Anandkumar+ 2014b)
  * In high-dimensional gene clustering problem, recognizing the relevant genes
    for clustering is of great interest for scientific discovery
* In this paper, we propose a new sparse tensor decomposition method called
  Tensor Truncated Power (TTP) that
  encourages the sparsity of each decomposition component by incorporating a
  truncation step into the tensor power iteration step
  * in each iteration,
    * the decomposition components are first updated via a tensor power method
      (Lathauwer+ 2000; Anandkumar+ 2014c), and then
    * truncated to only preserve the entries of s largest magnitudes. Here the
    * s is much smaller than the maximal dimension d in all modes, and
      can be tuned in a data-driven manner. This truncation step efficiently
* This statistical rate can be decomposed into two parts, where the
  * sample error captures the noise level of the observed tensor and the
  * model error measures the complexity in decomposing the true tensor
* we employ our method to two statistical problems:
  * high-dimensional clustering (Hsu and Kakade, 2013) and
  * mixture of sparse regressions (Chaganty and Liang, 2013)

## 1.1 Comparison with Related Work

* the robust tensor decomposition method with non-sparse decomposition
  components proposed by Anandkumar+ (2014c)
* the convex relaxation of the low rank tensor decomposition and completion
  problem
* sparse tensor decomposition,
  * Morup+ (2008) develops a sparse non-negative Tucker decomposition approach
    by matricizing the tensor and 
    employing the `l_1` norm penalty as the sparsity constraint
  * to reduce computationally intensivity and memory requirement,
    Allen (2012) directly adds an `l_1` penalty on the decomposition vectors in
    the rank-1 best approximation optimization problem and solves it via
    alternative soft thresholding update, while
  * Liu+ (2012) suggests to solve the sparse non-negative tensor factorization
    via a coordinate descent method
  * good empirical performance in variable selection,
  * no theoretical analysis on these sparse estimators is available
  * Chi and Kolda (2012) propose a nonnegative decomposition algorithm for
    tensors whose entries are sparse and their theoretical analysis requires
    that the tensors are generated from a Poisson distribution
  * TTP method is the first sparse tensor decomposition method with guaranteed
    local and global statistical rates

# 2 Our sparse tensor decomposition method TTP and its implementation

# 3 The local and global statistical rates of the proposed TTP method

# 4 practical selections of tuning parameters

# 5 simulation results, followed by

# 6 a real application in

# online supplementary material

* explains affiliated steps in our main algorithm,
* discusses applications of the TTP method to high-dimensional latent variable
  models, and includes
* additional experimental results and
  all technical proofs for the theoretical developments
