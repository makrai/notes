Yanzhou Huang, Deyi Xiong, Xiaodong Shi, Yidong Chen, ChangXing Wu, Guimin Huang
Adapted competitive learning on continuous semantic space for WSI
Neurocomputing, 2016

# Abstract

* The majority of existing WSI algorithms are not applicable to capture
  both lexical semantics and syntactic relations
  * without involving excessive task-specific feature engineering
  * determining the number of word senses for the polysemous words
* In this paper, we
  * learn continuous semantic space representations for the ambiguous instances
  * recursive context composition
  * capture lexical semantics and syntactic relations simultaneously
  * adapt _rival penalization competitive learning_
    * to conduct instances based word sense clustering
    * determine the number of word senses
* We validate the effectiveness of our method
  on the SEMEVAL-2010 WSI dataset, improv[ing] the quality of word sense
  clustering over several competitive baselines

# 1 Introduction

* Conventional
  * simple vector addition or component-wise multiplication in context
  * not sufficient to capture complex linguistic knowledge and phenomenon
* Bayesian methods such as [5]
  * Latent Dirichlet Allocation (LDA) [3] to induce the sense distributions of
    ambiguous instances without resorting to labeled resources
    * bag-of-words (BoW) assumption which
      ignores the syntactic structures of the contexts
* non-parametric Bayesian method [19]
  * [19] JH Lau, P Cook, D McCarthy, D Newman, T Baldwin,
         Word sense induction for novel sense detection,
         EACL, 2012
  * uses Hierarchical Dirichlet Processes (HDP) [33] to
  * induce the number of word senses automatically
  * hE tends to generate almost twice the number of gold standard sense
    * on SEMEVAL-2010 WSI dataset [19]
* our proposed WSI framework runs in two steps:
  1. learning a continuous semantic space representation
    * for each ambiguous _instance_, and
    * via a recursive autoencoder (RAE) based method [31]
      * In contrast to BOW
      * representations of ambiguous instances under BoW
      * work in a bottom-up and unsupervised manner (Section 3)
      * allowing our method to capture lexical semantics and syntactic
        relations within the contexts simultaneously
  2. conducting word sense induction to the ambiguous instances
    * without specifying the number of word senses
    * via a rival penalization competitive learning (RPCL) based method [9],
    * capable of gradually eliminating redundant sense clusters (Section 4)
  * Hence, for a polysemous word,
    * the number of remaining sense clusters is [that of] senses, and
    * the centroids of the remaining sense clusters
      are considered as the representations of the induced word senses
  * without resorting to any external resources

# 2 Related work

* In this section, we give an overview on previous works of WSI and
  highlight the differences from our framework
* Bayesian methods
  * can discover latent topic distributions from contexts
  * without involving excessive feature engineering
  * [5] applies parametric LDA [3] to WSI task
    * The contexts of ambiguous instances are regarded as pseudo documents,
    * induced topic distributions are considered as the sense distributions
  * [35] uses non-parametric HDP [33]
    * to learn the sense distributions
    * this method can obtain the number of word senses automatically for
    * [while] LDA methods  require the number of word senses to be
      assigned in advance
  * the HDP model is superior to LDA model
    * on the SEMEVAL-2010 WSI dataset
  * [19] incorporate position features in the HDP model
    * improvement in supervised F-score
  * [7] extends the naive Bayes model based on the
    * idea that the more closer a word to the target word, the more
      relevant this word will be in WSI
    * the extended naive Bayes model is simple yet effective on the
      SEMEVAL-2010 WSI dataset
  * our proposed method is not trained under the BoW assumption
* recursive deep learning as we use RAE in our WSI framework
  * Early works on using neural networks to learn phrase representations [13]
  * R Socher, EH Huang, J Pennin, CD Manning, AY Ng,
    Dynamic pooling and unfolding recursive autoencoders
      for paraphrase detection
    Advances in Neural Information Processing Systems, 2011, pp. 801–809
  * R Socher, B Huval, CD Manning, AY Ng,
    Semantic compositionality through recursive matrix–vector spaces,
    EMNL-CoNLL 2012
  * R Socher, J Pennington, EH Huang, AY Ng, CD Manning,
    Semi-supervised RAEs for predicting sentiment distributions
    EMNLP 2011, pp. 151–161
  * R Socher, A Perelygin, JY Wu, J Chuang, CD Manning, AY Ng, C Potts,
    Recursive deep models for sem compos over a sentiment treebank
    EMNLP 2013
  * P Li, Y Liu, M Sun,
    Recursive autoencoders for itg-based translation
    EMNLP 2013
  * we,
    * instead of only using the word representations to initialize the RAE
      model
    * use the representations of words and word clusters simultaneously,
    * better generalization ability to the test data

# 6. Conclusion and future work

1. RAE based method is
  * superior to a simple vector average method
  * capable of capturing both lexical semantics and syntactic relations
2. Given a proper similarity threshold (larger than 0.6 in our experiment), our
   retraining-based method is capable of improving the semantic representations
   of ambiguous instances because of better generalization ability
3. In word sense clustering, our  learning achieves the
  best performance in supervised evaluation
  * 25% target words are predicted correctly, and
    80% target words fall into a variation interval
