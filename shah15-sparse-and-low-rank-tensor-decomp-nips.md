Parikshit Shah, Nikhil Rao, Gongguo Tang
Sparse and Low-Rank Tensor Decomposition
NIPS 2015

# Abstract

* Motivated by the problem of robust factorization of a low-rank tensor
* We present an
  * efficient computational algorithm that modifies Leurgans' algoirthm for
    tensor factorization. Our method relies on a
  * reduction of the problem to sparse and low-rank matrix decomposition via
    the notion of tensor contraction. We use well-understood convex techniques
    for solving the reduced matrix sub-problem which then allows us to perform
    the full decomposition of the tensor. We delineate
  * situations where the problem is recoverable and provide
  * theoretical guarantees for our algorithm. We validate our algorithm with

# Introduction

* Tensors [representat]
  * graphical models with latent variables [1],
    1. A. Anandkumar , R. Ge , D. Hsu , AND S. M. Kakade
      A tensor approach to learning mixed membership community models,
      Journal of Machine Learning Research, 15 (2014), pp. 2239–2312.
    * audio classification [20],
    * psychometrics [8], and
    * neuroscience [3]. One concrete example proposed in [1] involves topic
* machine learning tasks,
  such as Independent Component Analysis [11], and
  learning Gaussian mixtures [2]
  are reducible to that of tensor decomposition.  While
* most tensor problems are computationally intractable [12] there has been
  * tractable and principled approaches [4, 5, 12, 15, 19, 21, 24–27].
* In this paper we consider the problem of performing tensor decompositions
  when a subset of the entries of a low-rank tensor X are corrupted
  adversarially, so that the tensor observed is Z = X +Y where Y is the
  corruption
  * One may view this problem as the tensor version of a sparse and low-rank
    matrix decomposition problem as studied in [6, 9, 10, 13].
  [6] E. J. CANDÈS , X. LI , Y. MA , AND J. WRIGHT
  Robust principal component analysis?,
  Journal of the ACM, 58 (2011), pp. 11–37.
  [9] V. CHANDRASEKARAN , S. SANGHAVI , P. A. PARRILO , AND A. S. WILLSKY ,
  Rank-sparsity incoherence for matrix decomposition,
  SIAM Journal on Optimization, 21 (2011), pp.  572–596.
  [10] Y. CHEN , H. XU , C. CARAMANIS , AND S. SANGHAVI ,
  Robust matrix completion and corrupted columns
  Proceedings of the 28th International Conference on Machine Learning
  (ICML-11),
  [13] D. HSU , S. KAKADE , AND T. ZHANG ,
  Robust matrix decomposition with sparse corruptions,
  Information Theory, IEEE Transactions on, 57 (2011), pp. 7221–7234.
* We develop an algorithm for performing such a decomopsition and provide
theoretical guarantees as to when such decomposition is possible.
