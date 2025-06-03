Efficient Nonnegative Tucker Decompositions: Algorithms and Uniqueness
Guoxu Zhou, Andrzej Cichocki, Qibin Zhao, Shengli Xie
IEEE Transactions on Image Processing, 2015

* extraction of nonnegative parts-based and physically meaningful latent
  components from high-dimensional tensor data while
  * preserving the natural multilinear structure of data
  * hE, as the data tensor often has multiple modes and is large-scale,
    existing NTD algorithms suffer from a very high computational complexity
    in terms of both storage and computation time, which has been one major
* we show how low (multilinear) rank approximation (LRA) of tensors is able to
  significantly simplify the computation of the gradients of the cost function,
  upon which a family of efficient first-order NTD algorithms are developed
  * dramatically reducing the storage complexity and running time, the new
  * quite flexible and robust to noise because any well-established LRA
    approaches can be applied. We also show how
* nonnegativity incorporating sparsity substantially improves the uniqueness
  * partially alleviates the curse of dimensionality of Tucker
* Simulation results on synthetic and real-world data justify the
  high efficiency of the proposed NTD algorithms

# 1 Introduction

* the great success of blind source separation (BSS) techniques [1]. In these
  * latent components possess specific diversities such as
    statistical independence, a temporal structure, sparsity, and smoothness. By
* data are more naturally represented by tensors, e.g.,
  color images, video clips, and fMRI data
* Tucker decomposition has been applied to pattern recognition [2], [3],
  clustering analysis [4], image denoising [5], etc. and has achieved great
* Very often, the observation data and latent components are naturally nonneg,
  e.g., text, images, spectra, probability matrices, the adjacency matrices of
  graphs, web data based on impressions and clicks, and financial time series
  * components may lose most of their physical meaning if negative
* nonnegative matrix factorization (NMF) has been demonstrated to be a powerful
  * local parts of objects [6]. As a result, NMF has received
  * extensive study in the last decade [4], [6]
  * applications including clustering analysis [7]–[9], sparse coding [10],
    dependent source separation [11]
* nonnegative Tucker decomposition (NTD) has also
  * gained importance in recent years [4], [12], [13]. NTD not only
  * inherits all of the advantages of NMF but also
  * provides an additional multiway structured representation of data.  Fig.1
  * give a parts-based representation of face images included
* Unconstrained Tucker decompositions are often criticized for the
  * lack of uniqueness and the
  * curse of dimensionality, which indicates that the
    * size of the core tensor increases exponentially with the dimension
  * NTD is more likely to be unique and provides physically meaningful comps
  * the core tensor in NTD is often very sparse, which
    * allows us to discover the most significant links between components and to
    * partially alleviate the curse of dimensionality.  Unfortunately,
* existing algorithms are generally performed by directly applying the NMF
  update rules without fully exploiting the special multilinear structure
  * very high computational complexity in terms of both space and time,
    especially when the data tensor is large-scale
* unconstrained Tucker decompositions are significantly faster than NTD,
* we propose a new framework for efficient NTD that is based on an unconstrained
  * frequent access to the original big tensor is avoided, thereby leading to a
  * based on a proceeding low (multilinear) rank approximation (LRA)
    * briefly introduced in our recent overview paper [14], the
    * now detailed derivations with new results on the uniqueness of NTD
* notation used in this paper is listed in TABLE I, and
  more details can be found in [4], [15]

# II basic notation and NTD models

# III the first-order NTD algorithms reviewed

# IV flexible and efficient NTD algorithms based on the low-rank approximation

# V unique and sparse NTD is discussed

* nonnegativity can help overcome the two limitations of Tucker decompositions,
  particularly by incorporating sparsity.  To our best knowledge, although
* several NTD algorithms have been developed [4], a
* theoretical analysis of the uniqueness of NTD is still missing

## A. Uniqueness of NTD

### Nonnegative Rank: The nonnegative rank of a nonnegative matrix Y

* the minimal number of R such that Y = AB^T, where A ∈ R × M and B ∈ N × R
* Obviously, `rank(Y) ≤ rank_+ (Y)`

### Multilinear rank and nonnegative multilinear rank:

* The vector r = (R 1, R 2, ..., R N ) is called the multilinear .  rank of Y,
  where R n = rank(Y (n)), ∀n
* The vector r + = (R 1, R 2, ..., R N ) is called the nonnegative multilinear
  rank of a nonnegative tensor Y, if R n = rank + (Y (n) )

### Essential uniqueness

* We call the NTD Y = G × n∈I N A (n) essentially unique, if A (n) = ÂP (n) D
  (n), ∀n, holds for any other NTD Y = Ĝ × n∈I N Â (n), where
* P (n) is a permutation matrix, and D (n) is a nonnegative diagonal matrix
* the uniqueness of NTD has a very close relation with the uniqueness of NMF
  * results on the uniqueness of NMF (see [38]– [40] for a comprehensive review)
    most of which are based on the sparsity of factor matrices
* the most popular uniqueness conditions for NMF [11], [41]–[43] is the
  pure-source-dominant condition [11], [41], which means
  * for each signal there exists at least one instant
    at which only this signal is active or strongly dominant
* separable NMF, which gained popularity very recently, as it proved to be
  * highly scalable and
  * applications include
    * topic discovery and the
    * clustering analysis of large-scale datasets [42], [43]
* the pure-source-dominant condition essentially requires that
  at least one factor matrix of NMF should be sufficiently sparse
  * In NTD, it requires that the core tensor or all component matrices are
    sufficiently sparse.
  * sparsity is not only a key factor of the uniqueness of NTD,
    it also reflects the learning-parts ability of NTD, as
    many zeros often exist in the factors

## B. NTD with Sparse Core Tensors

* partially break the curse of dimensionality, as it
  only keeps the most significant connections between the components
* improves the uniqueness feature of the results
* if G is all-zero except g i,i,...,i > 0 for i = 1, 2, ..., min(R 1, R 2,
  ..., R N ), NTD is essentially reduced to nonnegative polyadic decomp (NPD)
  * NPD is essentially unique under very mild conditions
    (even if A (n) is not sparse) [44]
* we focus on how to improve the sparsity of the core tensor
  by imposing suitable constraints, which
  can also be applied to improve the sparsity of component matrices

## C. NTD with Sparse Mode Matrices

# VI Simulations on synthetic and real-world data

# VII conclusions

* we proposed a family of first-order NTD algorithms based on a preceding LRA of
  the data tensors. The proposed algorithms
  * use only the first-order information (gradients) and are
  * free of line search to search update steps (learning rates)
  * LRA significantly reduces the computational complexity of the subsequent
    nonnegative factorization procedure in terms of both time and space and also
    substantially improves the robustness to noise and the flexibility
  * incorporating various well-established LRA techniques, the proposed NTD
    algorithms could be seamlessly implemented to analyze contaminated data
* error bounds on LRA-based NTD were briefly discussed
* preliminary results on the essential uniqueness of NTD were provided with a
  focus on the relationship to the uniqueness of NMF
  * how sparsity is able to improve the uniqueness of NTD and to
  * sparsity partially alleviates the curse of dimensionality of Tucker decomps
* Simulations justified the efficiency of the proposed LRA-based NTD algorithms
  * promising applications in clustering analysis
