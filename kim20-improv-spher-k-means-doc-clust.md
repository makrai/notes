Improving spherical k-means for document clustering:
  Fast init, sparse centroid projection, and efficient cluster labeling
Han Kyul Kim, Sungzoon Cho
Expert Systems with Applications Volume 150, 15 July 2020, 113288

# Abstract

* spherical k-means has drawbacks that need to be addressed for effeciency
  * Without well-dispersed initial points, spherical k-means slowly converges
  * dense centroid vectors needlessly incorporate the impact of infrequent and
    less-informative words, thereby distorting the distance calculation between
    the document vectors
* we propose practical improvements on spherical k-means to overcome these
  * Our proposed initialization method
    * guarantees dispersed initial points
    * up to 1000 times faster than previously well-known init, eg k-means++
  * we enforce sparsity on the centroid vectors by using a
    data-driven threshold that is capable of dynamically adjusting its value
    depending on the clusters
  * unsupervised cluster labeling method that effectively extracts keywords
* tested on seven text datasets that include both new and publicly available
  * significantly reduced computation time
  * qualitatively verified the performance of the proposed cluster labeling

# 1 Intro

* spherical k-means algorithm (Dhillon & Modha, 2001) is often used for doc clu
  * cosine similarity is effective in clustering sparse vectors (Huang, 2008)
  * especially effective in clustering sparse document vectors
    (Buchta, Kober, Feinerer, Hornik, 2012, Dhillon, Guan, Kogan, 2002)
  * convergence rate and the results is heavily influenced by the initial cents
* we
  * propose a computationally faster and well-dispersed initialization
  * preserve the sparsity of the centroid vectors, and suggest a
  * cluster labeling method for intuitively interpreting the document clusters
* we limit our exploration to sparse document vectors
  * TF-IDF (KS Jones 1972) and Bag-of-Concepts (BOC, Kim, Kim, & Cho, 2017)

# 2 issues of the spherical k-means clustering algorithm, and previous attempts

# 3 our new methods to overcome these problems

# 4 performance

* For each of our enhancements on document clustering, we validate their
  performances based on numerous criteria listed in Table 2
  * Dispersed init: Initialization speed, Stability of the clustering result
  * Centroid sparsity:
    * Sparsity of centroids
    * Stability of the clustering result after applying sparse centroid repr
  * Cluster labeling ∗ Qualitative analysis
