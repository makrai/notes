Flattening the Density Gradient for Eliminating Spatial Centrality
  to Reduce Hubness.
Kazuo Hara, Ikumi Suzuki, Kei Kobayashi, Kenji Fukumizu, Milos Radovanovic
AAAI, 2016

# Abstract

* Spatial centrality, whereby samples closer to the center of a dataset tend to
  be closer to all other samples, is regarded as one source of hubness. Hubness
  is well known to degrade k-nearest-neighbor (k-NN) classification. Spatial
  centrality can be removed by centering, ie, shifting the origin to the global
  center of the dataset, in cases where inner product similarity is used.
  However, when Euclidean distance is used, centering has no effect on spatial
  centrality because the distance between the samples is the same before...
* we propose a solution for the hubness problem when Euclidean distance is
  considered. We provide a theoretical explanation to demonstrate how the
  solution eliminates spatial centrality and reduces hubness. We then present
  some discussion of the reason the proposed solution works, from a viewpoint
  of density gradient, which is regarded as the origin of spatial centrality
  and hubness. We demonstrate that the solution corresponds to flattening the
  density gradient. Using real-world datasets, we demonstrate that the proposed
  method improves k-NN classification performance and outperforms an existing
  hub-reduction method.

# Introduction

* k-nearest neighbor (k-NN) classifier is vulnerable to the hubness problem,
  which is a phenomenon that occurs in high-dimensional spaces
  * Radovanović, Nanopoulos, and Ivanović 2010
    * Hubs in space: Popular nearest neighbors in highdimensional data.
  * Schnitzer et al. 2012
    * Local and global scaling reduce hubs in space
  * Suzuki et al. 2013
    * Centering similarity measures to reduce hubs
  * Tomašev and Mladenić 2013
    * Hub co-occurrence modeling
      for robust high-dimensional kNN classification.
    * Jožef Stefan Inst
