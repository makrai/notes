Batch Clustering for Multilingual News Streaming
Mathis Linger, Mhamed Hajaiej
Third Workshop on Narrative Extraction From Texts arXiv:2004.08123 [cs.CL]

# Abstract

* arrange high amount of multilingual news into stories
* previous works on Topic Detection and Tracking
* we look for monolingual local topics
  which are then linked across time and languages
* we introduce a novel "replaying" strategy
  to link monolingual local topics into stories
* new fine-tuned multilingual embedding using SBERT to create crosslingual
* SOTA results
  * monolingual on dataset of Spanish and German news and
  * crosslingual on English, Spanish and German news

# 1 Introduction

* two-steps streaming system called newsLens [LH17]
  to group articles into stories
  * not support multilingual articles
* We show that multilingual documents are best represented through
  fine-tuned DistilBERT [SDCW19] multilingual model
  using SBERT [RG19] triplet network structure

### 3.1.1 Article representation

* Miranda+ [MZCB18] and Staykovski+ [SBCMN19]
  * inefficiency of dense features to cluster documents of a sinle language
  => articles are represented using sparse TF-IDF features
* Monolingual representations for each document consist of 9 TF-IDF weighted
  bag of words sub-vectors, corresponding to the entities, lemmas and tokens
  contained in the title, body and title+body of each document
* Contrary to previous work, we do not use any time feature, time being
  implicitely taken into account by the per-batch procedure

## 4.1 Dataset

* We assess the effectiveness of our proposed approach
  on the standard multilingual dataset introduced by Miranda+ [MZCB18]
  * a collection of 33,807 news articles in three languages: English, Spanish
    and German
  * articles are labeled by language and by story. Stories are multilingual,
  * training set contains 20,803 articles and the test set 13,004 articles
    * We further divide the training set in two:
      * train part to learn the β weights of the linear combinations to
        aggregate similarities between articles (1) and a
      * development part to set the hyper parameter T 1 and the resolution
        parameter of the Louvain algorithm (Section 3.1) as well as threshold T
        2 (Section 3.2). In order to set these parameters, we perform a
      * grid search maximizing the average between standard and BCubed F1
* Table 1 presents descriptive statistics of the dataset.

# 5 Conclusion and Future Work

* In future work, we plan to challenge the TF-IDF based representation of
  monolingual articles using fine-tuned SBERT [RG19] embeddings
