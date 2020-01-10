Empirical Evaluation of Four Tensor Decomposition Algorithms
Peter D. Turney
2007 Technical Report; arXiv

#Abstract

* This paper evaluates four algorithms
  * Higher-Order Singular Value Decomposition (HO-SVD aka Tucker),
  * Higher-Order Orthogonal Iteration (HOOI),
  * Slice Projection (SP), and
  * Multislice Projection (MP)
* We
  * measure the time (elapsed run time), space (RAM and disk space), and
    fit (tensor reconstruction accuracy) of the four
  * find that standard implementations of HO-SVD and HOOI do not scale up
  * recommend HOOI for tensors that are small enough for the available RAM and
    MP for larger tensors

#1 Intro

* Singular Value Decomposition (SVD) [has] success in
  information retrieval (Deerwester+ 1990), collaborative filtering
  (Billsus and Pazzani, 1998), computational linguistics (Schütze, 1998),
  computational vision (Brand, 2002), and genomics (Alter+ 2000)
* Our main concern is the ability of the four algorithms to scale up

#applications for higher-order tensors

* In any field where SVD has been useful,
  there is likely to be a third or fourth mode that has been ignored

#3 notation

* We follow the notational conventions of Kolda (2006)

#4 presents the four algorithms, HO-SVD, HOOI, SP, and MP

* tool
  * For HO-SVD and HOOI, we used the implementations given in the MATLAB Tensor
    Toolbox (Bader and Kolda, 2007a; Bader and Kolda, 2007b)
  * For SP and MP, we created our own MATLAB implementations

#5 evaluation

* four groups of experiments

##how the algorithms scale

* random sparse third-order tensors as input
* HOOI provides the best fit, followed by MP, then SP, and lastly HO-SVD

##sensitivity of the fit to the balance in the ratios of the core sizes

* the fit of the four algorithms follows the same pattern as in the first group
* SP is particularly sensitive to unbalanced ratios of the core sizes

##varying ratios between the size of the input tensor and the size of the core

* we move ... to fourth-order tensors. The algorithms are tested with random
* input tensor size fixed while the core sizes vary. The
* fit of the algorithms follows the same pattern as in the previous two groups

##Performance with Real [linguistic] Data

* answering multiple-choice synonym questions from the TOEFL test
  * target words x all words x patterns
* fit follows the same pattern as in the previous three groups of experiments
* the differences in fit are reflected in the performance on the given task
