Yanfeng Sun, Junbin Gao, Xia Hong, Yi Guo and Chris J. Harris
Dimensionality Reduction Assisted Tensor Clustering
2014 IJCNN July 6-11, 2014, Beijing, China

# Abstract

* based on tensor Tucker decomposition models
* an extra tensor mode is formed
* We design two types of clustering models (Depending on different constraints)
  * PCA Tensor Clustering model and
  * Non-negative Tensor Clustering model [with] different regularizations
* optimization ... based on the alternative coordinate scheme
* experiments ... yield comparable or even better performance
  compared to most recent clustering algorithms based on matrix factorization

# 1 Intro

* trend in tensor decomposition research is to introduce more structures in
  decomposition models
  * Tri-ONTD (Tri-favctor _orthogonal_ non-negative tensor decomposition)
    * Zhang+ [24]
    * discover the common characteristics of a series of matrix data
    * application of Tri-ONTD is to identify cluster structures of the dataset
    * based on the centroid-based clustering algorithms such as ...  K-means
  * applications in image representation
    25. J. Liu, J. Liu, P. Wonka, and J. Ye
      Sparse non-negative tensor factorization using columnwise coordinate desc
      Pattern Recognition, vol. 45, pp. 649–656, 2012
* This paper: a tensor factorization based clustering algorithm DRATC
  (Dimensionality Reduction Assisted Tensor Clustering)
* contributions of this paper are summarized as follows
  1. a Tucker tensor decomposition model with specific core structures
    * centroid tensors are of lower dimensionality along each tensor mode
  2. The standard centroid based clustering algorithms are unsupervised
    * we extend [our] tensor clustering algorithms to semi-supervised learning
  3. both learning stages are [simultaneous]

# 2 reviewing the concepts of tensors and introducing necessary notations

# 3 algorithm for each proposed model

# 4 numerical experiments over synthetic data and real world data

# 5 Further analysis and conclusion
