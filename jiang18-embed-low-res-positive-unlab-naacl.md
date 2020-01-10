Learning Word Embeddings for Low-resource Languages by PU Learning
Chao Jiang, Hsiang-Fu Yu, Cho-Jui Hsieh, and Kai-Wei Chang
2018 naacl

#Abstract

* this paper [learn a word embedding] on a corpus with only a few million ws
* zero entries in the co-occurrence matrix also provide valuable information
  We ... design a Positive-Unlabeled Learning (PU-Learning) approach to
  factorize the co-occurrence matrix and
* validate the proposed approaches in four different languages
  * [translation of the] word similarity task and the word analogy task

#Introduction

* Positive-Unlabeled Learning (PU-Learning) in collaborative filtering applica-
  tions (Pan et al., 2008; Hu et al., 2008; Pan and Scholz, 2009;
  Qin et al., 2010; Paquet and Koenigstein, 2013; Hsieh et al., 2015)
* proposed PU-Learning framework can be trained efficiently and effectively
  * square loss to model the unobserved terms
  * efficient update rule based on linear algebra operations
  * We tailor the coordinate descent algorithm (Yu et al., 2017b)
    for solving the corresponding optimization problem

#2 Related work

##Positive and Unlabeled (PU) Learning:

* Positive and Unlabeled (PU) learning (Li and Liu, 2005) is proposed for
  training a model when the positive instances are partially labeled and the
  unlabeled instances are mostly negative
* Recently ...  used in many classification and collaborative filtering
  * “implicit feedback” in many recommendation systems—
    users usually only provide positive feedback (e.g., purchases, clicks) and
    it is very hard to collect negative feedback
* idea is to assign a small uniform weight to all the missing or zero entries
  and factorize the corresponding matrix
* Yu et al. (2017b) proposed an efficient algorithm for matrix factorization
  with PU-learning, such that the weighted matrix is constructed implicitly

#3 PU-Learning for Word Embedding

1. Follow the literature (Levy and Goldberg, 2014a), we use the PPMI metric
2. PU-Learning approach ... to factorize the [mx to word] and context
3. final embedding vector ... by combining the word ... and the context vector

##3.2 PU-Learning for Matrix Factorization

###Weighting function

* [the learning objective] is
  * very similar to the one used in ... GloVe,
    but we propose a new way to set the weights `C_ij`
  * the time complexity of [the GloVe weighting] is proportional to number of
    nonzero weights ..., thus they have to
    * set zero weights for all the unobserved entries ..., or
    * incorporate a small set of unobserved entries by negative sampling
* We propose to set the weights for Ω + and Ω − differently
```
C ij =
  (Q_ij / x_max)^\alpha if Q ij ≤ x max , and (i, j) ∈ Ω +
  1                     if Q ij > x max , and (i, j) ∈ Ω +
  ρ,                    if (i, j) ∈ Ω −
```
* For entries in Ω + , we set the non-uniform weights as in GloVe
  * assigns larger weights to context word that [co]appears more often ..., but
    also avoids overwhelming the other terms
* In our experiments,
  * we set x max = 10, α = 3/4 according to (Pennington et al., 2014), and let
    ρ be a parameter to tune. Experiments show that adding weighting function
    * we find that ρ = 0.0625 achieves the best results in general
  * improves the performance especially on analogy tasks

###Bias term

* Unlike previous work on PU matrix completion
  (Yu et al., 2017b; Hsieh et al., 2015)
* Yu et al. (2017b) design an efficient columnwise coordinate descent algorithm
  for solving the PU matrix factorization problem
* To incorporate the bias term in (3), we propose [a] training algorithm based
  on the coordinate descent approach

#4 Experimental Setup

* low-resource setting, we train word embedding models on
  Dutch, Danish, Czech and, English data sets collected from Wikipedia
  * we sub-sample the Wikipedia corpora and create a subset of
    64 million ws tokens for Dutch and Czech and a subset of
    32 million tokens for English
