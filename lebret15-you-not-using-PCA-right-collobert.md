Rémi Lebret, Ronan Collobert
Word Emdeddings through Hellinger PCA
EACL 2014

# Abstract

We compare [to pre-Mikolov] on named entity recognition and movie review tasks

# 1 Introduction

* distributed approaches based on neural network language models (NNLM)
  * Collobert and Weston, 2008
  * Huang and Yates, ACL 2009 handling sparsity in supervised sequence-labeling
  * Turian+ 2010
  * Collobert+ 2011
* For supervised tasks relying more on the semantic aspect as sentiment
  classification, it is usually helpful to adapt the existing embeddings to
  improve performance (Labutov and Lipson, 2013). We show in this paper that
  such embedding specialization can be easily done via neural network

# 2 Related Work

* Connectionist approaches[,] distributed representations which
  encode the structural relationships between words
  (Hinton, 1986; Pollack, 1990; Elman, 1991). More recently, a neural network
* Dimensionality reduction techniques such as Singular Valued Decomposition
  (SVD) are widely used (e.g. LSA (Landauer and Dumais, 1997), ICA (Väyrynen
  and Honkela, 2004)). However, word co-occurence statistics are discrete
  distributions. An information theory measure such as the Hellinger distance
  seems to be more appropriate than the Euclidean distance over a discrete
  distribution space.
* [we] compare the Hellinger PCA against the classical Euclidean PCA and the
  Low Rank Multi-View Learning (LR-MVL) method, which is
  another spectral method based on Canonical Correlation Analysis (CCA) to
  learn word embeddings (Dhillon+ 2011).
* embeddings can be too generic to perform well on ... tasks such as sentiment
