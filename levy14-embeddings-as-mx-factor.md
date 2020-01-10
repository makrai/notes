Omer Levy and Yoav Goldberg
Neural Word Embedding as Implicit Matrix Factorization
nips 2014

#Abstract

* [skip-gram with negative-sampling] is implicitly factorizing a word-context
  matrix, whose cells are the pointwise mutual information (PMI) of the
  respective word and context pairs, shifted by a global constant
* NCE is implicitly factorizing a similar matrix, where each cell is the
  (shifted) log conditional probability of a word given its context
* using a sparse Shifted Positive PMI word-context matrix to represent words
  * improves results on two word similarity tasks and one of two analogy tasks
* dense low-dimensional vectors, exact factorization with SVD
  * at least as good as SGNS’s solutions for word similarity tasks
  * On analogy questions SGNS remains superior to SVD. We conjecture that this
    stems from the weighted nature of SGNS’s factorization
