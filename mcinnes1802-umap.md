Leland McInnes, John Healy, James Melville
UMAP: Uniform Manifold Approximation and Projection for Dimension Reduction
arXiv:1802.03426 [stat.ML]

# Abstract

* theoretical framework based in Riemannian geometry and algebraic topology.
* competitive with t-SNE for visualization quality, and 
  arguably preserves more of the global structure with superior run time
* no computational restrictions on embedding dimension, making it viable as a

# 1 Intro

* two categories of Dimension reduction algorithms
  * preserve the [global/local] distance structure within the data and those
  * global: PCA [22], MDS [23], and Sammon mapping [41]
  * local: t-SNE [50, 49], Isomap [47], LargeVis [45], 
    Laplacian eigenmaps [5, 6] and diffusion maps [14]
* mathematical foundations [of UMAP] related to 
  the work of Belkin and Niyogi on Laplacian eigenmaps. We seek to address the
  issue of uniform data distributions on manifolds through a combination of
  Riemannian geometry and the work of David Spivak [43] in category theoretic
  approaches to geometric realization of fuzzy simplicial sets. 
* t-SNE is the current SOTA for dimension reduction for visualization. Our 
* UMAP has ... widespread use in the fields of 
  bioinformatics [4, 15, 37, 2, 36, 13], 
  materials science [27, 19], and
  machine learning [8, 20, 17, 38] among others.

# 2 the theory underlying the algorithm. 

* necessary to understand both the theory underlying why UMAP works and the
  motivation for the choices that where made in developing the algorithm. A
* reader without a background (or interest) in 
  topological data analysis, category theory or the theoretical underpinnings
  should skip over this section and proceed directly to 3.  
* strong theory and mathematically justified algorithmic decisions are of
  particular importance in the field of unsupervised learning. This is, at

# 3 computation description of UMAP. 

* Appendix C contrasts UMAP against the more familiar algorithms t-SNE and
  LargeVis, describing all these algorithms in similar language. This section
* not [UMAP's] theoretical underpinnings

# 4 implementing the UMAP algorithm. This includes a more detailed algorithmic

* hyper-parameters involved and their practical effects.

# 5 results on real world datasets as well as scaling experiments to

* compared with other dimension reduction algorithms.

## 5.2 Embedding Stability

* stochastic 
  * approximate nearest neighbor search, and stochastic 
  * gradient descent with negative sampling for optimization, the
* resulting embedding is necessarily different 
  from run to run, and under subsampling of the data. This is potentially a
* In this subsection we compare the stability under subsampling 
  of UMAP, LargeVis and t-SNE

# 6 weakenesses of the algorithm, and applications for which UMAP [is not best]

# 7 potential extensions of UMAP that are 

* made possible by its construction upon solid mathematical foundations.
* include semi-supervised learning, metric learning and 
  heterogeneous data embedding
