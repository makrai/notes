Latent Dirichlet Allocation
David M. Blei, Andrew Y. Ng, and Michael I. Jordan
Journal of Machine Learning Research 3 (2003) 993-1022

# Abstract

* latent Dirichlet allocation (LDA)
  * generative probabilistic model
    for collections of discrete data such as text corpora
  * three-level hierarchical Bayesian model, in which
    * each item of a collection is modeled
      as a finite mixture over an underlying set of topics
    * Each topic is, in turn, modeled
      as an infinite mixture over an underlying set of topic probabilities
  * In the context of text modeling, the
    topic probabilities provide an explicit representation of a document
  * efficient approximate _inference_ techniques
    * based on variational methods and an EM algorithm for empirical Bayes
      parameter estimation
* results in
  * document modeling,
  * text classification, and
  * collaborative filtering,
    * a technique used by recommender systems
  * comparing to a
    * mixture of unigrams model and the
    * probabilistic LSI model
      * In the context of application to information retrieval, LSA is
        sometimes called Latent Semantic Indexing (LSI).[2]
