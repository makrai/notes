TensorLy: Tensor Learning in Python
JeangKossaifi, Yannis Panagakis, and Maja Pantic
NIPS Tensor-Learn Workshop. 2016

#Intro

* Example[ for signal processing and machine learning applications]
  * Anima Anandkumar, Rong Ge, and Majid Janzamin. “
    Analyzing Tensor Power Method Dynamics:
      Applications to Learning Overcomplete Latent Variable Models”
    CoRR abs/1411.1488
* research in establishing connections between tensor decompositions, the
  method of (high-order) moments, and compositional function spaces
  in order to
  * learn latent variable models (e.g., mulitiview mixture model,
  Gaussian mixtures, Independent Component Analysis) [3],
  * train deep neural networks with theoretical guarantees (Janzamin+ 2015).,
  * theoretically analyze their impressive empirical performance [8]
* surveys in the topic, which focus range
  * basics of multilinear (tensor) algebra and
  * overview of different established tensor decompositions [17, 29],
  * algorithmic advances [7, 19, 10, 6, 26] and applications [1]
* libraries for tensor operations and decompositions, accessible from
  programming languages (e.g., Python, Java, Scala, etc) that data scientists
  and practitioners are familiar with. Even though some libraries exist for
  handling tensors, these are implemented in
  * non-free platforms (e.g. MATLAB’s TensorToobox [5] and TensorLab [21]) or
  * low-level languages like C++ (e.g.  TH++) and the
  * deep learning libraries e.g., Tensorflow and Torch can only suboptimally
    handle tensors
* Python is emerging as a language of choice for machine learning, as witnessed
  * exisiting [libraries] (e.g., scikit-tensor) offer only limited algorithms
    (e.g., decomposition only) and/or have restrictive licenses. For
* TensorLy 1 introduces several contributions over the existing libraries:
  *  state of the art tensor learning including core tensor operations,
    tensor decomposition and tensor regression methods
  *  it is open source and BSD licensed
  *  it comes with extensive tests and documentation; and
  *  it depends exclusively on numpy and scipy

#TensorLy functionality and implementation

* TensorLy’s current functionalities in term of tensor operations
  * Tensor unfolding (X [n] ), folding and vectorisation (vec( X̃ ))
  * Tensor multiplication (n-mode matrix/vectorisation product)
  * Matrix Kronecker (⊗) and Khatri-Rao ( ) products
  * Hadamard product (∗) is inherited from the standard numpy structure
  * Kruskal (JU (1) , · · · , U (N) K) and Tucker operators
  * Computation of Higher-Order moments (E[x ⊗ x ⊗ x])
  * Proximal operators for the ` 1 norm and the nuclear norm
* core tensor decomposition and tensor regression methods
  * CANDECOMP-PARAFAC (CP) decomposition e.g. [17])
  * Non-Negative CP decomposition [28])
  * Tucker decomposition (Higher-Order SVD) (e.g. [17])
  * Non-Negative Tucker decomposition [16])
  * Tensor Ridge regression (Tucker and Kruskal) [11, 32, 18]
* operations are optimised for speed: tensor operations have been redefined

#3 Experiments

* In TensorLy, tensors are simply numpy mutli-dimensional arrays which are
  passed directly to the various methods, decomposition or regression. This
* competitive performance even though the library is implemented in a
  high-level, interactive language

##Tensor regression

#4 Conclusion and future work

* Going forward we will further extend the available decompositions with other
  state-of-the-art methods such as PARAFAC2, DEDICOM, etc and also include
  robust tensor decomposition [4, 9]
  * Animashree Anandkumar et al
    ... Robust Tensor Decomposition under Block Sparse Perturbations
    CoRR abs/1510.04747 (2015)
  * Donald Goldfarb and Zhiwei (Tony) Qin. “
    Robust Low-Rank Tensor Recovery: Models and Algorithms”
    SIAM Journal on Matrix Analysis and Applications 35.1 (2014), pp. 225–253
