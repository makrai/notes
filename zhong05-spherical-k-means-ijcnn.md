Efficient Online Spherical K-means Clustering
Shi Zhong
IJCNN 2005

#Abstract

* spherical k-means algorithm,
  * i.e., the k-means algorithm with cosine similarity, is a
  * popular method for clustering high-dimensional text data.  In this
    algorithm, each document as well as each cluster mean is represented as a
    high-dimensional unit-length vector
* However, it has been mainly used in batch mode. That is,
  * i.e. each cluster mean vector is updated, only after all document vectors
    being assigned, as the (normalized) average of all the document vectors
    assigned to that cluster
* This paper investigates an online version of the spherical k-means algorithm
  * significantly better clustering results than the batch version,
    especially when an annealing-type learning rate schedule is used. We also
  * heuristics to improve the speed, yet almost without loss of ...  quality
