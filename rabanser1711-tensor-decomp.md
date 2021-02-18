Introduction to Tensor Decompositions
  and their Applications in Machine Learning
Stephan Rabanser, Oleksandr Shchur, and Stephan Günnemann
2017

# Abstract

* tensors first emerged in the psychometrics community in the 20th century
* we are going to discuss
  * why tensors are more rigid than matrices 
    with respect to the uniqueness of their decomposition
  * most important factorization algorithms and their properties
  * examples of tensor decomposition applications in machine learning
  * a case study on tensor-based estimation of mixture models
  * software libraries

# 1 Introduction

* Fueled by increasing computing capacity and a 
  better understanding of multilinear algebra especially during the last decade
* we will turn to some of the most widely used tensor decompositions,
  CP and Tucker, and the theory behind them
* uncovering underlying hidden low-dimensional structure in the tensor
* to tackle typical machine learning problems
* two concrete examples of a tensor-based parameter estimation method for
  spherical Gaussian mixture models (GMMs) and single topic models
  * can extract all needed information from low-order moments
    to learn simple GMMs and topic models in an efficient way
* organization
  4. a rather theoretical treatment
  5., 6. practical applicability

# 3 Introduction to tensors 2

## 3.1 Basics

* comprehensive reviews of Kolda & Bader (2009) and Sidiropoulos+ (2016)

### 3.1.5 Tensor Rank

* factor matrices hold the combination of the vectors from the rank-one
  components as columns
* `λ_r` is often used to absorb the respective weights during normalization
  of the factor matrices’ columns. This usually means normalizing the sum of
  the squares of the elements in each column to one
  * useful once turn to
    * machine learning applications of tensor decompositions in Section 5 and
    * the Tucker decomposition in Section 4.2

## 3.2 Tensor Reorderings

### 3.2.2 Matricization

* `X_(3)` hibás

## 3.3 Important Matrix/Tensor Products

### 3.3.1 Kronecker product between two arbitrarily-sized matrices is a
generalization of the outer product of vectors
### 3.3.2 Khatri-Rao product between two matrices corresponds to the
column-wise Kronecker product
### 3.3.3 Hadamard product between two same-sized matrices
* element-wise matrix product
### 3.3.4 n-mode product of a tensor and a matrix
az n-edik mód mentén való mxszorzat
### 3.3.5 Multilinear Tensor Transformation
  * A tensor X can be transformed on multiple dimensions by hitting each of the
    vectors producing the tensor with a transformation matrix (or vector) from
    the left side [1]
    * Hitting a tensor X with a matrix M i on the i-th dimension
      corresponds to a matrix-vector multiplication between M i and the vector
      on the i-th dimension, M i T a (i)
    * valuable in the tensor-based estimation of mixture models in Section 6
    * hitting a tensor X with a vector v i on the i-th dimension corresponds to
      an inner product between v i and the vector on the i-th dimension, hv i ,

## 3.4 Tensor Uniqueness and Rigidness

* A low-rank tensor is not just a collection of low-rank planes, but
  there exist interrelations between these slices

# 4 Tensor decomposition algorithms 4

* there is no single generalization of the SVD concept, but we will discuss
  two decompositions that feature different generalized properties
* Both are outer product decompositions, but very different structure
* rule of thumb it is usually advised to use
  * CPD for latent parameter estimation and
  * Tucker for subspace estimation, compression, and dimensionality reduction
* Just like in Section 3, we will introduce these decompositions from
  Sidiropoulos+ (2016) and Kolda+ (2009), which also provide deeper theory

## 4.1 Canonical Polyadic Decomposition (CPD) 5

* The most prominent rank decompositions are the
  CANonical DECOMPosition (CANDECOMP) and the
  PARAllel FACtors (PARAFAC) decomposition
* independently discovered many times, but same principles
* we will refer to this type of decomposition as CPD
* two of the most popular algorithms to compute CPD of a tensor

### 4.1.1 Jennrich’s Algorithm
* If A, B, and C are all linearly independent (i.e. have full rank) [23, 24]
* does not use the full tensor structure
* requires good eigen-gap on the eigen-decompositions of the factor matrices,

### 4.1.2 Alternating Least Squares (ALS) Algorithm. An other way
* the work-horse of modern tensor decomposition approaches
* idea is to fix all factor matrices except for one in order to optimize
* stopping criterion
* requires the rank as an argument [38]
* cons
  * might take several steps to converge and
  * might also not converge to a global optimum

### 4.1.3 Tensor Power Method
* for the special case of all identical factor matrices and if the `a_r`s are
  all orthogonal

### 4.1.4 Uniqueness

* Kruskal rank of a matrix M corresponds to
  the maximum number k such that any k columns are linearly

### 4.1.5 Tensor Rank Peculiarities
* to determine the rank of a tensor the problem is NP-hard [12]
* there are tensors that can be approximated arbitrarily well by a lower-rank
  factorization, called degenerate

## 4.2 Tucker Decomposition

# 5 Tensor applications in machine learning 7

## 5.1 Temporal Data

* Whenever some kind of relationship can be represented as a matrix
  (e.g. user preferences in a recommender system, adjacency matrix of a graph),
  tensors provide a straightforward way to model the temporal component
* patterns [40], predicting evolution [9] and anomalies [31]
* temporal communities, that come into existence and subsequently disappear [4]
* in a never-ending continuous stream [37]
* structural constraint to the tensor, restricting arbitrary permutations

## 5.2 Multi-relational Data

* word representation learning (Jenatton NIPS 12), community detection [32],
  coherent subgraph learning [6]
* analysis of knowledge networks
  * e.g. Google Knowledge Graph, YAGO or Microsoft Academic Graph [8]
  * a special case of multilayer networks
  * used to
    * store facts about relationships between real-world entities
    * inferring new relations between objects given the existing data
    * tensor decomposition approaches provide state-of-the art performance
      in terms of both quality and efficiency (Nickel+ 2012; Padia+ 2016)
    * applications such as question answering and entity resolution [36]

## 5.3 Latent Variable Modeling

* significant traction over the last decade is inference in latent space
* successfully applied to hidden Markov models [14],
  independent component analysis [5] and topic models [3]
* we are given a (generative) probabilistic model with hidden variables
  * inference problem lies in determining the hidden variables
* Classic algorithms such as maximum likelihood estimation are
  asymptotically consistent, but usually do
  not perform well in very high dimensions
* Tensor decomposition methods are based on the method of moments [33]
  * main idea lies in finding the latent variables 
    that would give rise to similar moments under the given model
  * in many popular probabilistic models, 
    the low-order moment tensors exhibit a specific structure [1]
  * effective and efficient algorithms for solving such problems
  * scale well to larger problems and in general do
    not suffer much from the curse of dimensionality [28]
* We will show how the method of moments can be used to perform
  inference in Gaussian mixture model and topic model

# 6 Case study: estimation of mixture models 8

* Most of the following content is heavily based on Anandkumar+ [1],
  which also has additional insights on the computational efficiency and
  numerical aspects
* two main challenges in such settings
  1.  Conditions for identifiability
  2.  Efficient learning of latent variable models
    * maximum likelihood estimation (MLE)
      * nice properties such as asymptotic optimality and consistency
      * NP-hard in its derivation for a variety of different problem settings
      * iterative algorithms like expectation maximization (EM) are often used
      * slow convergence and local optima, no consistency guarantees [34]
    * the presented way to learn GMMs and topic models is efficient in
      computational complexity and the number of data points needed
* two different mixture models, a Gaussian mixture model and a topic model

## 6.2 Topic model

* explain words in a document through hidden topics (see Figure 11)
  in order to classify documents or to summarize them
* The most general treatment is latent Dirichlet allocation (LDA),
  where the probability distribution over the latent variable h is
  given by the Dirichlet distribution

## 6.3 Algorithm Overview

## the method of moments,

which we will use to construct data moments up to order 3

## 6.5 Orthogonalization Through Whitening

derive the wanted parameters from the third order moment by first whitening it

## 6.6 Decomposition Through Tensor Power Method

finding an eigendecomposition

## 6.7 Algorithm Summary

* Matlab and Python scripts for estimating GMMs
  https://github.com/steverab/tensor-gmm
* Matlab code for estimating exchangeable hidden variable models
  https://bitbucket.org/kazizzad/tensor-power-method

# 7 Available software libraries

* a few popular tensor libraries provide a more optimized way of
  storing and treating tensors, as well as
  techniques for efficiently decomposing them using the algorithms in Sec 4
* most libraries are still only available for e.g. Matlab
* Table 1

# 8 Current research

* two main questions [10]
  * formulate other machine learning problems as tensor decompositions?
    * like neural networks [15]
  * tensor decompositions under weaker assumptions
    * usually weak conditions for uniqueness, but
      strong for effectively using them in machine learning settings
    * for example that the GMM estimation in Section 6 requires k ≤ d, which is
      a rather strong limitation

# 9 Conclusions

* we introduced two of the most widely used tensor decomposition approaches,
  the CP decomposition and the Tucker decomposition
  * computed often through an ALS algorithm
  * uniqueness conditions
  * ML example of estimating Gaussian mixture models and simple topic models
    by using the method of moments and the tensor power method
