Considerably Improving Clustering Algorithms Using UMAP: A Comparative Study
Allaoui M, Kherfi ML, Cheriet A (2020)
Image and Signal Processing. ICISP 2020. Lecture Notes in Computer Science

# Abstract

* Dimensionality reduction is widely used in machine learning and big data
  * analyze and to visualize large, high-dimensional datasets
* tasks like data clustering and classification
* embedding methods have emerged as a promising direction for clustering
  * preserve the local structure and simultaneously reveal the global structure
* we investigate how to improve the performance of several clustering algos
* Uniform Manifold Approximation and Projection or UMAP
  * based on Riemannian geometry and algebraic topology
* We compare the results of many well-known clustering algorithms
  * k-means, HDBSCAN, GMM and Agglomerative Hierarchical Clustering
  * on several _image_ datasets
* UMAP improves each of the clustering algorithms studied on each dataset consi
  * can reach 60% Accuracy improvement

# 1 Introduction

* non-linear manifold learning methods can be categorized: finding local/global
  * Isomap
    * Tenenbaum, De Silva, Langford, J.C. (2000) A global geometric framework
    * well known globally focused method
  * T-SNE [8] is considered as locally focused method. More recently manifold
  * UMAP showed better performance to preserve both the local and global struct
* UMAP exactly meets our needs [16, 18]
  * McConville, R., Santos-Rodriguez, R., Piechocki, R.J., Craddock, I.:
    N2D: (Not Too) deep clustering
      via clustering the local manifold of an auto encoded embedding
    arXiv preprint arXiv:1908.05968 (2019)
  * Becht et al: Dimensionality reduction for visualizing single-cell (2019)
* we measuring the improvement thanks to the application of UMAP embedding
  * five datasets. We empirically observe that this method
* UMAP allows to the clustering algorithms to be competitive with SOTA techs

# 2 UMAP technique in Sect.  2. In Sect

# 3 we introduce our idea

# 4 experimental results in five image datasets. Section

* 4.1 Datasets: five diverse image datasets, including standard datasets used
* MNIST [2], Fashion MNIST [3], USPS [13], Pen Digits [4] and UMIST Face
  Cropped [12].  Table 1 summarizes the main characteristics of each dataset.

# 5 concludes our work
