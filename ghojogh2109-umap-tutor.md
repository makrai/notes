Uniform Manifold Approximation and Projection (UMAP) and its Variants: Tutorial and Survey
Benyamin Ghojogh, Ali Ghodsi, Fakhri Karray, Mark Crowley
arXiv:2109.02508 To appear as a part of an upcoming textbook on dim redu &
  manifold learning

* UMAP algorithm
  * we explain probabilities of neighborhood in the input and embedding spaces,
    optimization of cost function, training algorithm, derivation of gradients,
    and supervised and semi-supervised embedding by UMAP. Then, we introduce
* theory behind UMAP by algebraic topology and category theory.  Then, we
* UMAP as a neighbor embedding method and compare it with t-SNE and LargeVis
* negative sampling and repulsive forces in UMAP's cost function
* DensMAP is then explained for density-preserving embedding. We then introduce
* parametric UMAP for embedding by deep learning and
* progressive UMAP for streaming and out-of-sample data embedding

# 1 Intro

* Dimensionality reduction methods can be divided into three categories which
  * spectral methods, probabilistic methods, and neural network-based methods
  * within probabilistic methods, neighbor embedding methods where the
    * probabilities of neighborhoods are used in which
    * attractive and repulsive forces are utilized for neighbor and non-neigh
    * t-SNE (van der Maaten & Hinton, 2008; Ghojogh+ 2020a), LargeVis (Tang+
      2016), and UMAP, McInnes+ 2018)
* UMAP is that it assumes and approximates that the data points are uniformly
  distributed on an underlying manifold. The term “projection” in the name of
* The theory behind UMAP is based on algebraic topology and category theory
  * constructing fuzzy topological representations for both high-dimensional
    data and low-dimensional embedding of data and
    * changing the embedding so that its fuzzy topological representation
      becomes similar to that of the high-dimensional data. UMAP has been
* widely used for DNA2 and single-cell data visulization and feature extraction
  (Becht+ 2019; Dorrity+ 2020). It is noteworthy that t-SNE has also been used
  * visualizing deep features (Carter+ 2019),
  * art (Vermeulen+ 2021), and
  * visualizing BERT features in NLP (Coenen+ 2019; Levine+ 2019). This paper

# 2 details of UMAP algorithm

# 3 the category theory and algebraic topology behind UMAP

# 4 UMAP as neighbor embedding and comparison with t-SNE and LargeVis

# 5 repulsive forces, negative sampling, and effective cost function of UMAP

# 6 DensMAP

* UMAP and t-SNE both assume that points are uniformly distributed on an
  underlying low-dimensional manifold
* Hence, UMAP ignores the density of data around every point by canceling the
  effect of density with binary search for scales of points
* DensMAP (Narayan+ 2021) regularizes the cost function of UMAP to take into
  account and add back the information of density around each point

# 7 parametric UMAP

# 8 progressive UMAP

# 9 concludes the paper
