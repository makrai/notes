Parametric UMAP: learning embeddings with deep neural networks for representation and semi-supervised learning
Tim Sainburg, Leland McInnes, Timothy Q Gentner
rejected from ICLR 2021

# Abstract

* UMAP is a non-parametric graph-based dimensionality reduction algorithm using
  applied Riemannian geometry and algebraic topology to find low-dimensional
  * two steps:
    1. Compute a graphical representation of a dataset (fuzzy simplicial compl)
    2. Through stochastic gradient descent, optimize a low-dimensional
       embedding of the graph.
* we replace the second step of UMAP with a deep neural network that learns a
  parametric relationship between data and embedding. We demonstrate that our
* performs similarly to its non-parametric counterpart while conferring the
  benefit of a learned parametric mapping (e.g. fast online embeddings for new
  data).  We then show that
* UMAP loss can be extended to arbitrary deep learning applications, for
  * e.g. constraining the latent distribution of autoencoders, and
  * improving classifier accuracy for semi-supervised learning by capturing
    structure in unlabeled data
