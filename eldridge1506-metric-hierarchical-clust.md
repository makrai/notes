Justin Eldridge, Mikhail Belkin, Yusu Wang
Beyond Hartigan Consistency: Merge Distortion Metric for Hierarchical Clust
arXiv:1506.06422 [stat.ML]

# hdbscan.readthedocs.io/en/latest/how_hdbscan_works.html#transform-the-space

* [this paper demonstrates] that mutual reachability distance as a transform
  works well in allowing single linkage clustering to 
  more closely approximate the hierarchy of level sets

# Abstract

* Hierarchical clustering ...  associates a tree to a dataset. 
* Hartigan consistency [is] a framework to analyze such clustering algorithms
  from a statistical point of view. Still, as we show in the paper, 
* problems with Hartigan consistency
  * a tree which is Hartigan consistent with a given density can look very
    different than the correct limit tree. Specifically, Hartigan consistency
  * two types of undesirable configurations which we term 
    over-segmentation and improper nesting. Moreover, 
  * Hartigan consistency is a limit property and does 
    not directly quantify difference between trees.  
* In this paper we identify 
  * two limit properties, separation and minimality, which address both
    over-segmentation and improper nesting and together imply Hartigan cons
  * introduce a merge distortion metric between hierarchical clusterings 
    * convergence in our distance implies both separation and minimality. We
      also prove that uniform separation and minimality imply convergence in
      the merge distortion metric.  Furthermore, we show that our merge
    * stable under perturbations of the density.  Finally, we demonstrate
      applicability of these concepts by proving convergence results 
* for two clustering algorithms. First, we show convergence (and hence
  * of the recent robust single linkage algorithm of Chaudhuri and Dasgupta (2010)
  * on manifolds for topological split tree clustering. 

# 1 Introduction

* When data are sampled from a probability distribution, one needs to study the
  relationship between trees obtained from data samples 
  to the infinite tree of the underlying probability density. This question was
  * first explored in Hartigan (1975), which 
    introduced the notion of high-density clusters.  Specifically, 
  * given density function f : X → R, the 
    high-density clusters are defined to be 
    the connected components of {x ∈ X : f (x) ≥ λ} for some λ. The set of all
  * hierarchical structure known as the density cluster tree of f . The natural
  * Hartigan (1981) consistency for finite density estimators:
    any two high density clusters are also separate 
    in the finite tree given enough samples.
* In this paper we identify two distinct undesirable configuration types
  * both of these result from clusters merging at the wrong level. To address
* We proceed to introduce a merge distortion metric on clustering trees and
  show that convergence in the metric implies both separation and minimality.
  Moreover, we demonstrate that uniform versions of these properties are in
  fact equivalent to metric convergence. We note that the introduction of a
  quantifiable merge distortion metric also addresses another issue with
  Hartigan consistency, which is a limit property of clustering algorithms and
  is not quantifiable as such. We also prove that the merge distortion metric
  is robust to small perturbations of the density.

Still, attempts to formulate some intuitively desirable properties of
clustering have led to wellknown impossibility results, such as those proven
by Kleinberg (2003). In order to show that our definitions correspond to actual
objects, and, furthermore, to realistic algorithms, we analyze the robust
single linkage clustering proposed by Chaudhuri and Dasgupta (2010). We prove
convergence of that algorithm under our merge distortion metric and hence show
that it satisfies separation and minimality conditions. We also propose a
topological split tree algorithm for hierarchical clustering (based on the
algorithm introduced by Chazal et al. (2013) for flat clustering) and
demonstrate its convergence on Riemannian manifolds.
