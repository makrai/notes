Justin Eldridge, Mikhail Belkin, Yusu Wang
Beyond Hartigan Consistency: Merge Distortion Metric for Hierarchical Clustering
arXiv:1506.06422 [stat.ML]

# hdbscan.readthedocs.io/en/latest/how_hdbscan_works.html#transform-the-space

* [this paper demonstrates] that mutual reachability distance as a transform
  [allows] single linkage clustering to
  more closely approximate the hierarchy of level sets

# Abstract

* Hierarchical clustering ... associates a tree to a dataset
* Hartigan consistency [is] a framework to analyze such clustering algorithms
  from a statistical point of view
* problems with Hartigan consistency
  * a tree which is Hartigan consistent with a given density can look very
    different than the correct limit tree
  * two types of undesirable configurations which we term
    over-segmentation and improper nesting
    * both of these result from clusters merging at the wrong level
  * Hartigan consistency is a limit property and does
    not directly quantify difference between trees
* In this paper we identify
  * two limit properties, separation and minimality, which address both
    over-segmentation and improper nesting and together imply Hartigan cons
  * introduce a merge distortion metric between hierarchical clusterings
    * convergence in our distance implies both separation and minimality
    * uniform separation and minimality imply convergence in [this] metric
    * stable under perturbations of the density
* for two clustering algorithms
  * the recent robust single linkage algorithm of Chaudhuri and Dasgupta (2010)
  * on manifolds for topological split tree clustering
    * We propose a topological split tree algorithm for hierarchical clustering
      (based on the algorithm introduced by Chazal+ (2013) for flat clustering)
      and demonstrate its convergence on Riemannian manifolds
    * despite well-known impossibility results 
      [related to desirable properties of clustng] (Kleinberg 2003)

# 1 Introduction

* When data are sampled from a probability distribution, one needs to study the
  relationship between trees obtained from data samples
  to the infinite tree of the underlying probability density
  * first explored in Hartigan (1975), which
    introduced the notion of high-density clusters
  * given density function f : X → R, the
    high-density clusters are defined to be
    the connected components of {x ∈ X : f (x) ≥ λ} for some λ
  * hierarchical structure known as the density cluster tree of f
  * Hartigan (1981) consistency for finite density estimators:
    any two high density clusters are also separate
    in the finite tree given enough samples
