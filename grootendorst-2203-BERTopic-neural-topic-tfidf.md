BERTopic: Neural topic modeling with a class-based TF-IDF procedure
Maarten Grootendorst
arXiv:2203.05794 [cs.CL]

python implementation

# Abstract

* BERTopic generates document embedding with pre-trained transformer-based LMs,
  clusters these embeddings, and finally, generates topic representations with
  the class-based TF-IDF procedure
  * coherent topics
* competitive across a variety of benchmarks involving classical models and
  those that follow the more recent clustering approach of topic modeling

# 1 Intro

* Conventional models
  * eg
    * Latent Dirichlet Allocation (LDA) (Blei+ 2003) and
    * Non-Negative Matrix Factorization (NMF) (Févotte and Idier, 2011),
  * describe a document as a bag-of-words and
    model each document as a mixture of latent topics
  * hE disregard semantic relationships among words
    * not account for the context of words in a sentence, the bag-of-words
* text embedding techniques have rapidly become popular in the NLP field
  * BERT (Devlin+ 2018) and its variations (eg Lee+ 2020; Liu+ 2019; Lan+ 2019)
* topic modeling
  * Sia+ (2020) demonstrated the viability of clustering embeddings with
    centroid-based techniques, compared to LDA
    * From these clustered embeddings, topic representations were extracted by
      embedding words and finding those that are in close proximity to a
      cluster’s centroid
  * Top2Vec leverages Doc2Vec’s word~ and document representations to learn
    jointly embedded topic, document, and word vectors
    (Angelov, 2020; Le and Mikolov, 2014)
    * Comparable to Sia+ (2020)’s approach, documents are clustered and
      topic representations are created by finding words close to a cl centroid
    * Interestingly, although
      the topic representations are generated from a centroid-based perspective
      the clusters are generated from a density-based perspective, namely by
      leveraging HDBSCAN (McInnes and Healy, 2017)
  * both assume that words in close proximity to a cluster’s centroid are most
    representative of that cluster, and thereby a topic
    * hE a cluster will not always lie within a sphere around a clust centroid
    * Sia+ (2020) attempt to overcome this issue by re-ranking topic words
      based on their frequency in a cluster,
      hE the initial candidates are still generated from a centroid-based persp
* In this paper, we introduce BERTopic, a topic-model that leverages
  clustering techniques and a class-based variation of TF-IDF
  to generate coherent topic representations
  1. create document embeddings using a pretrained language model
    to obtain document-level information
  2. reduce the dimensionality of document embeddings before creating
     sem similar clusters of documents that each represent a distinct topic
  3. to overcome the centroid-based perspective, we develop
    a class-based version of TF-IDF to extract the repr for each topic
  * These three independent steps allow for a flexible topic model that
    can be used in a variety of use-cases, such as dynamic topic modeling
