TensorD: A tensor decomposition library in TensorFlow
Liyang Hao, Siqi Liang, Jinmian Ye, Zenglin Xu
Neurocomputing Volume 318, 27 November 2018, Pages 196-200

https://github.com/Large-Scale-Tensor-Decomposition/tensorD

# Abstract

* The TensorD toolbox is a Python tensor library built on TensorFlow. It provides
* tensor decomposition methods as well as basic tensor operations. In addition,
  * GPU compatibility, high modularity of structure, and open source. It

# 1. Introduction

* applications, such as
  * compressing models in deep neural networks [5], [6], [7],
  * integrated context information in recommendation systems [8], [9], [10],
    [11], [12], and processing
  * high dimensional visual data in computer vision [13], [14]. Though there
* existing tensor decomposition libraries will be discussed in Section 2), it is
* In 2016, TensorFlow [15] was proposed for latest research needs and GPU
  * widely used and various third-party packages [16], [17], [18], [19] have
  * still lacks an out-of-the-box tensor decomposition package, harming research

# 2 tensor libraries in literature.

* Tensor Algebra Compiler (taco) [20] provides optimized tensor computation
  kernel and a novel code generation for tensor expressions [21], but suffers
  from lack of friendly programming interfaces for high level tensor applic. The
* Tensor [22] provides multiple precision computation, optimized tensor
  contraction operation and allowing MATLAB-style programming.
* High-Performance Tensor Transpose (HPTT) library [23] is a C++ library which
  also contributes to high-performance tensor transposition but CPU-oriented.
* high-level tensor algorithms like tensor decomposition or tensor regression.
  * Sandia National Laboratories released TensorToolbox version 2.6 in 2015 [24].
  * Another MATLAB library is MATLAB Tensor Tools (MTT) released in 2014 [25],
  * both of these two are easy to use and install, they all have
    difficulties in large-scale deployments
    * MATLAB is not a license-free platform.
* Tensorly, focusing on tensor decomposition, was implemented in 2016 [26]. It
  enables tensor computation on GPU with MXNet backend, but it still does not
  work on TensorFlow. In 2021, it does.
* Pretty Tensor [27] offers high-level API for Fluent Networks in TensorFlow,
  but it does not contain any decomposition algorithms.
