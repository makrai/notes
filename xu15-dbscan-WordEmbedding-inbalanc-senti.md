Word Embedding Composition for Data Imbalances in Sentiment and Emotion Classif
Ruifeng Xu, Tao Chen, Yunqing Xia Qin Lu, Bin Liu, Xuan Wang
Cogn Comput (2015) 7:226–240

# Abstract

* sampling methods reducing the imbalance ratio between training classes
  * data sparseness and _the small disjunct problem_ remain obstacles
* we present an oversampling method based on word embedding compositionality
* a compositional algorithm based on recursive neural tensor networks is used
  to construct sentence vectors based on the word embedding model
* Finally, we use the SMOTE algorithm as an oversampling method

# Intro

* Chinese emotion corpora e.g. Ren-CECps and NLPCC2013 datasets
  * eight and seven emotion categories, and the
  * the largest emotion category are about 10 and 11 times the size of the slst
* methods proposed to address this problem three major groups [29]:
  * algorithmic modification [42],
  * cost-sensitive learning [41], and
    * adds a training penalty cost for majority classes with
  * data sampling [17]
    * under-sampling, oversampling and hybrid methods [29]
    * Synthetic Minority Oversampling TEchnique (SMOTE) [15] is the most
      * variants including Borderline-SMOTE [24], Safe-Level-SMOTE [7], and
        DBSMOTE [8]
    * Hybrid methods [16] not commonly used in opinion analysis
* for text sentiment and emotion classification, Bag-of-[ngram] space
  may be sparse and have small disjuncts [27, 41]
  * Small disjuncts lead to more specific decision regions following
    oversampling which can lead to over-fitting [8]
* we propose Word Embedding Compositionality with Minority Oversampling
  TEchnique (WEC-MOTE)
  * sentence vectors are constructed by recursive neural tensor network
    (RNTN) [39]
    * The sentence vectors are
      * lower in dimension, and thus dense
      * used as the input for oversampling using the SMOTE algorithm
* evaluated on two datasets
  * one generated from the Stanford sentiment treebank
    containing only polarity labels at the sentence level
    * We purposely selected an imbalanced subset to evaluate our method
  * the NLPCC2013 Chinese micro-blog data with
    seven discrete emotion labels at the sentence level
* machine learning algorithms we experimented with are the
  Naive Bayes method and the support vector machine (SVM) method. The
  * baseline system uses BOW as features with no sampling. We also test
  * linear word embedding and compositional word embedding
    using different oversampling methods

# Related Work

# Word Embedding Compositionality-Based Oversampling

* the WEC-MOTE algorithm

# Performance Evaluation

# Conclusion and Future Directions
