Nenad Tomašev and Dunja Mladenić
Hub Co-occurrence Modeling for Robust High-dimensional kNN Classification
2013

#Abstract

* we
  * adapted the Hidden Naive Bayes (HNB) model to the problem of modeling
    neighbor occurrences and co-occurrences in high-dimensional data
  * Hidden nodes are used to aggregate all pairwise occurrence dependencies
  * the Augmented Naive Hubness Bayesian k-nearest Neighbor (ANHBNN)
    * a novel kNN classification method ... for intrinsically high-dimensional
  * Neighbor co-occurrence information forms an important part of the model and
    * analysis reveals ... the influence of hubness
      on the shape of the co-occurrence distribution
* tested in ... object recognition from images in class-imbalanced data and the
* results show ... clear benefits when compared to the other hubness-aware kNN

#Introduction

* basic k-nearest neighbor classification rule (Fix and Hodges, 1951)
* extensions
  * in conjunction with kernels [3]
  * large margin learning [4],
  * multi-label classification [5],
  * adaptively determine the neighborhood size
* ideal for classification under class imbalance [8;9]
* medical diagnostic systems, spam filters, intrusion detection
* state-of-the-art in time series classification
* might also be quite appropriate for object recognition in images [11]
* curse of dimensionality (Bellman, 1961)
  * Most standard distance measures concentrate [13]
    * the overall contrast is reduced
  * The very concept of what constitutes nearest neighbors in
    high-dimensional data has rightfully been questioned in the past
    (Hinneburg, 2000)
* Hubness is a recently described consequence of high intrinsic dimensionality
  * first noticed in music retrieval and recommendation systems [16],
    * The initial thought was that this might be an artefact of the metric or
      the feature representation
  * the occurrence distribution asymptotically approaches a power law as the
    dimensionality increases
* learning from past occurrences and hub profiling can be successfully
  employed for improving the overall kNN classifier performance
  * Radovanović, M., Nanopoulos, A., Ivanović, M
    * Nearest neighbors in high-dimensional data:
      The emergence and influence of hubs
    * 2009 ICML
  * Tomašev, N., Radovanović, M., Mladenić, D., Ivanović, M
    * Hubness-based fuzzy measures for high-dimensional k-nearest neighbor cl
    * 2011
  * Tomašev, N., Radovanović, M., Mladenić, D., Ivanovicć, M
    * A probabilistic approach to nearest neighbor classification:
      Naive hubness bayesian k-nearest neighbor
    * 2011
  * Tomašev, N., Mladenić, D
    * Nearest neighbor voting in high-dimensional data
      Learning from past occurrence
    * 2011, 2012
* Hubness-aware metric learning also seems to be helpful
  * Schnitzer, D., Flexer, A., Schedl, M., Widmer, G.:
    * Using mutual proximity to improve content-based audio similarity
    * 2011
  * Tomašev, N., Mladenić, D.:
    * Hubness-aware shared neighbor distances for high-dimensional k-nearest
      neighbor classification
    * 2012, 2013
* in the unsupervised context as well [28;29]
* The Naive Bayesian interpretation of the observed k-neighbor occurrences
  (NHBNN) [23] was shown to be quite promising in high-dimensional data
  classification, especially in the context of learning from class imbalanced
  data [20].  Yet, NHBNN naively assumes independence between neighbor
  occurrences in the same k-neighbor set,
