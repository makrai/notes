Naive Bayes Word Sense Induction
Do Kook Choe and Eugene Charniak
2013

Code used for experiments is available at http://cs.brown.edu/~dc65/

# Abstract

* extended naive Bayes model for word sense induction (WSI)
* idea: words closer to the target word are more relevant in predicting sense
* The proposed model is very simple yet effective
* evaluated on SemEval-2010 WSI data

# 1 Introduction

# 2 Related Work

* Bayesian WSI systems
  * Brody and Lapata (2009)
    * apply Latent Dirichlet Allocation (LDA, Blei+ 2003) to WSI
    * They run a topic modeling algorithm on texts
      * with some fixed number of topics that correspond to senses and
      * a cluster: target words assigned to the same topic
      * evaluated on SemEval-2007 noun data (Agirre and Soroa, 2007)
  * Lau+ (2012)
    * apply a nonparametric model, Hierarchical Dirichlet Processes (HDP),
    * to SemEval-2010 data (Manandhar+ 2010)
    * their system assigns many senses (about 10) to each word,

# 3 Model

* naive Bayes model for WSI and
* inference schemes for the model
* Following Yarowsky (1995), we assume that a word in a document has one sense

# 3.1 Naive Bayes

# 3.2 Distance Incorporated Naive Bayes

# 4 Inference

# 5 Experiments

* we evaluate the model on SemEval-2010 data

# 5.4.1 Short Descriptions of Other WSI Systems Evaluated on SemEval-2010

* UoY runs a clustering algorithm on a graph
  * with words as nodes and co-occurrences between words as edges
  * (Korkontzelos and Manandhar, 2010)
* Hermit
  * approximates co-occurrence space with Random Indexing and
  * applies a hybrid of k-means and Hierarchical Agglomerate Clustering to
    co-occurrence space (Jurgens and Stevens, 2010)
* NMF_lib
  * factors a matrix using nonnegative matrix factorization and
  * runs a clustering algorithm on test instances represented by factors
  * (Van de Cruys+ 2011)
