Yanfeng Sun, Junbin Gao, Xia Hong, Bamdev Mishra and Baocai Yin
Heterogeneous Tensor Decomposition for Clustering via Manifold Optimization
IEEE transactions on pattern analysis and machine intelligence 2015

#1 Introduction

* tensorial data structure is exploited in 
  * computer vision applications [13], [14] and 
    14. Y. Tang, R. Salakhutdinov, and G. Hinton, 
      “Tensor analyzers,”
      ICML 2013.
  * machine learning [15], [16].  
    15. A. Shashua and T. Hazan, 
      “Non-negative tensor factorization 
        with applications to statistics and computer vision,”
      ICML, 2005
    16. M. Morup, 
      “Applications of tensor factorizations and decompositions in data mining
      Wiley Interdisciplinary Reviews 2011 
* tensor clustering tasks are formulated as optimization problems on specific
  tensor decomposition models [29], [30], [31], [32]
  29. M. Vichi, R. Rocci, and H. Kiers
    Simultaneous component and clustering models for three-way data: 
      Within and between approaches
      Journal of Classification, vol. 24, no.  1, pp. 71–98, 2007
  30. E. Acar and B. Yener
    Unsupervised multiway data analysis: A literature survey
    IEEE Transactions on Knowledge and Data Engineering, vol. 21, no. 1 2009
  31. W. Peng and T. Li
    Tensor clustering via adaptive subspace iteration
    Intelligent Data Analysis, vol. 15, pp. 695–713, 2011.
  32. Y. Sun, J. Gao, X. Hong, Y. Guo, and C. J. Harris
    Dimensionality reduction assisted tensor clustering
    JCNN 2014
  * constraints, like orthogonality in the HOOI algorithm [19], the resulting
    problems reduce to optimization over matrix manifolds [33]. In the case of
    the HOOI algorithm for the HOSVD decomposition, the resulting optimization
    problem is on the Stiefel manifold [33, Section 3.3]).  While the
* significant development of Riemannian optimization algorithms on matrix
  manifolds such as the Stiefel manifold, the Grassmann manifold, and the
  manifold of positive definite matrices [33], [35], [36] 
* applications of the Riemannian optimization framework in machine learning,
  computer vision and data mining, include 
  * low rank optimization [34], [35], [36], 
  * estimation [37], 
  * Riemannian dictionary learning [38], [39], and 
  * computer vision tasks [40], to name a few.

#2 Heterogeneous Tucker decomposition model for clustering

##2.1 notations for tensor representation and operations used in this paper 

##2.2 the clustering scheme based on ... heterogeneous Tucker

##2.3 optimization problems

#3 the Riemannian geometry for the multinomial manifold 

and develops all the necessary optimization-related ingredients.  Section 4

#4 algorithm procedure for the tensor clustering 

including the proposed Riemannian trust-region algorithm. Section 5 shows

#5 numerical experimental results 

on both synthetic tensorial data and real-world datasets.  Finally Section 

#6 concludes the paper.
