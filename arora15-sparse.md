Sanjeev Arora, Rong Ge, Tengyu Ma, Ankur Moitra ;
Simple, Efficient, and Neural Algorithms for Sparse Coding
2015 Proceedings of The 28th Conference on Learning Theory, PMLR 40:113-149,

# Abstract

* Sparse coding is a basic task in many fields including signal processing,
  neuroscience and machine learning
* standard formulation is as a non-convex optimization problem which is solved
  in practice by heuristics based on alternating minimization.
* Recent ... algorithms for sparse coding with provable guarantees, but
  ... these are outperformed by the simple alternating minimization heuristics.
* Here we give
  * a general framework for understanding alternating minimization which we
  * analyze existing heuristics and to design
  * new ones also with provable guarantees.  Some of these algorithms seem
    * implementable on simple neural architectures, which was the original
      motivation of Olshausen and Field in introducing sparse coding. We also
  * the first efficient algorithm ... that works almost up to the
    information theoretic limit for sparse recovery on incoherent dictionaries.
    * All previous algorithms [run in time exponential in some] parameter.
  * improve upon the sample complexity of existing approaches

# Intro

* sparsity
  * In neuroscience, sparse representations are believed to improve energy
    efficiency of the brain by allowing most neurons to be inactive
  * In machine learning ... to avoid over-fitting. Additionally, methods for
  * in image processing such as segmentation, retrieval, de-noising and
    super-resolution (see references in Elad (2010))
  * for deep belief networks (Ranzato, Boureau, and LeCun nips 2007)
* Olshausen and Field (1997b) (and also Lewicki and Sejnowski (2000)) places
  sparse coding in a more familiar generative model setting
* simple algorithms work well in practice
  * local search/gradient descent on the energy function (1) with hard
    constraints
  * MOD Aharon et al.  (2006) and
  * k-SVD Engan et al. (1999)

## Efficient Algorithms vs Neural Algorithms.

* Recently [progress on designing polynomial time algorithms] provable
* it can be much more challenging to analyze the behavior of an empirically
* the .. heuristics are important for [being] implementable in neural

## 1.1. Recent Work

* generative model
* Spielman et al. (2012) gave an algorithm that succeeds when m ≤ n) which
* overcomplete setting. Arora et al. (2014) and Agarwal et al. (2013, 2014)
  * assuming that A ∗ is μ-incoherent (which we define in the next section).
  * works up to sparsity `...`
* we only require an O(1/ log n)-close initialization
