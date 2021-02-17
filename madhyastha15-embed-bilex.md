Pranava Swaroop Madhyastha, Xavier Carreras, Ariadna Quattoni
Tailoring word embeddings for bilexical predictions: an experimental comparison
2015

https://github.com/f00barin/bmaps/tree/master/pybmaps

* 2015 vs 2014:
  * skip-gram is added
  * prepositional relations are omitted
* nálam melyikben legyen valségi eloszlás?
* is the corpus balanced to financial texts?

# Abstract

* Our learning algorithm takes an existing lexical vector space and compresses
  it such that the resulting word embeddings are good predictors for a target
  bilexical relation. In experiments we show that task-specific embeddings can
  benefit both the quality and efficiency

# 1 Introduction

* vectors
  * Sahlgren, 2006
  * Turney & Pantel, 2010
  * Mikolov+ 2013
  * Pennington+ 2014
  * Baroni+ 2014
  * Bansal+ 2014
    * Mohit Bansal, Kevin Gimpel, and Karen Livescu.
      Tailoring continuous word representations for dependency parsing
      ACL, 2014
* In this work we ... employ the formulation by Madhyastha+ (2014)

# 2 Formulation

* Q: query words, C: context words
* the log-linear models by Madhyastha+ (2014) that
  * given a query word q
    compute a conditional distribution over candidate words c
* semi-supervised learning
  * to learn φ from unlabeled data, ... we experiment with two approaches:
    * a simple distributional approach
      where we represent words with a bag-of-words of contextual words; and
    * the skip-gram model by Mikolov+ (2013)
  * To learn W we assume access to labeled data
* low-rank
  * With φ fixed, we
    learn W by minimizing the negative log-likelihood of the labeled data
  * using a regularized objective,
    * regularizers that induce low-rank parameters W
  * we can interpret U and V as
    task-specific compressions of the original embedding
  * minimizing the rank of a matrix is hard,
    * we employ a convex relaxation
      based on the nuclear norm of the matrix `l*`
      * the l1 norm of the singular values, see Srebro+ (2005)
        * N Srebro, J Rennie, TS Jaakkola
          Maximum-margin matrix factorization
          NIPS 2005
      * i. e. the nuclear norm regularizer serves as
        a convex relaxation to the rank function
  * we compare the low-rank approach to `l1` and `l2` regularization penalties,
  * For all settings we use the
    * forward-backward splitting (FOBOS) optimization algorithm
      by Duchi & Singer (2009)
      * John Duchi and Yoram Singer
        Efficient online and batch learning using forward backward splitting
        Journal of Machine Learning Research, 10:2899–2934, 2009
* the inner product of the embeddings is the spec case
  * when we set W to be the identity matrix

# 3 Experiments with syntactic relations

* six bilexical syntactic relations
  * using the Penn Treebank corpus (Marcus+ 1993), following the
* experimental setting by Madhyastha+ (2014)
* pairwise accuracy
  * percentage of compatible/non-compatible pairs of modifiers where the
  * former obtains higher probability
* the bag-of-words is an uncompressed representation, while the
  skip-gram embeddings are a neural-net-style compression
* complexity [efficiency of computing predictions]
  * For [`l_2` and `l_1` it] is a function of the non-zero entries in W , while
  * for [`l_*`,] it is the rank k of W
  * We also test a baseline unsupervised approach, a low-dimensional SVD model

# 4 Results and discussion

* Table 1 vs Figure 1: best among different computation costs
