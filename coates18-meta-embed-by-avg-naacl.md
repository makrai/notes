Frustratingly Easy Meta-Embedding
  Computing Meta-Embeddings by Averaging Source Word Embeddings
Joshua Coates, Danushka Bollegala
arXiv:1804.05262 NAACL-HLT 2018

#Abstract

* Creating accurate meta-embeddings from pre-trained source embeddings
  * received attention lately. Methods based on
  * global and locally-linear transformation and concatenation have shown to
    produce accurate meta-embeddings
* In this paper, we show that the
  * arithmetic mean of two distinct word embedding sets
    * comparable or better than more complex meta-embedding learning methods
    * counter-intuitive
    * We give insight into why averaging can still [be] accurate
* word embeddings ... exhibit strong performance on a variety of NLP tasks
  (Turian+ 2010; Zou+ 2013)
  * Joseph Turian, Lev Ratinov, and Yoshua Bengio. ACL 2010
    Word representations: a simple and general method for semi-supervised
  * Will Y Zou, Richard Socher, Daniel M Cer, and Christopher D Manning
    EMNLP 2013
    Bilingual word embeddings for phrase-based machine translation. In
* methods ... for the production of word embeddings
  (Collobert and Weston, 2008; Mnih and Hinton, 2009; Huang+ 2012;
  Pennington+ 2014; Mikolov+ 2013a). Comparative work has illustrated a
* variation in performance between methods across evaluative tasks
  (Chen+ 2013; Yin and Schütze, 2016)
* “meta-embedding” ... first proposed by Yin and Schütze (2016),
  * conduct a complementary combination of information from an ensemble
  * each trained using different methods, and resources
* methods have been proposed
  * 1`TO`N (Yin and Schütze, 2016) ... employs a linear neural network to learn
    a set of meta-embeddings along with K global projection matrices, such that
    through projection, for every word in the meta-embedding set, we can
    recover its corresponding vector within each source word embedding set
  * 1TON+ (Yin and Schütze, 2016), extends this method [to words not in] the
    intersection of the source word embedding sets. An
  * unsupervised locally linear meta-embedding approach (Bollegala+ 2017)
    * representation as a linear combination of its nearest neighbours is
    * The local reconstructions within each source embedding set are then
      projected to a common meta-embedding space
* The simplest approach considered to date, has been to concatenate
  (Yin and Schütze, 2016)
  * good baseline of performance for metaembedding
* In this paper
  * averaging can provide an approximation of the performance of concatenation
* empirical results demonstrating the quality of average meta-embeddings

#2 Analysis

* To evaluate semantic similarity between word embeddings we consider ... the
  Euclidean distances of pairs of words in the source embedding sets and their
  corresponding Euclidean distances in the meta-embedding space 
* we can obtain a view as to how the meta-embedding procedure is combining
  semantic information. We begin by examining concatenation through this lens,
  before moving on to averaging.  
  
##2.1 Concatenation
