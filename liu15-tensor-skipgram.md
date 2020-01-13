Pengfei Liu, Xipeng Qiu and Xuanjing Huang
Learning Context-Sensitive Word Embeddings with Neural Tensor Skip-Gram Model
IJCAI 2015

nem találtam kódot http://nlp.fudan.edu.cn/

# Abstract

* We present a general architecture to learn the word and topic embeddings
  efficiently, which is an
  extension to the Skip-Gram model and can
  model the interaction between words and topics simultaneously
* The experiments
  * tasks
    * word similarity and
    * text classification
  * outperforms state-of-the-art methods

# 1 Introduction

* distributed representations are widely used for NLP tasks, such as
  * syntax [Turian+ 2010; Collobert+ 2011; Mnih...]
  * semantics [Socher+ 2012]
    * Semantic compositionality through recursive matrix-vector spaces
  * morphology [Luong+ 2013]
    * Better ... with recurive neural networks for morphology
* adress ambig
  * Reisinger and Mooney, 2010;
  * Huang+ 2012;
  ! Tian+ 2014;
    * Fei Tian, Hanjun Dai, Jiang Bian, Bin Gao, Rui Zhang, Enhong Chen..
    * A probabilistic model for learning multi-prototype word embeddings
    * In Proceedings of COLING,
  * Neelakantan+ 2014
  * locality ignores the correlations among words as well as their contexts
  * Liu+ (2015) introduced
    * [Liu+ 2015]
      Yang Liu, Zhiyuan Liu, Tat-Seng Chua, and Maosong Sun
      Topical word embeddings
      In AAAI, 2015
      * másik liu!. A második szerző chen14-nek is második szerzője
    * latent topic model [Blei+ 2003] to
      globally cluster the words into different topics models
    * do not model clearly the interactions among ... topics and contexts
* the context-sensitive word embedding (also called topical word embedding)
  should be obtained by integrating word vector and topic vector
* this paper, we propose
    * a neural tensor skip-gram model (NTSG) to learn the distributed
      representations of words and topics
    * an extension to the Skip-Gram model
    * replaces the bilinear layer with a tensor layer
    * capture more interactions between word and topic

# 2 Neural Models For Word Embeddings

# 3 Neural Tensor Skip-Gram Model

* we introduce latent topics and assume that
  each word has different embeddings under different topics
* tensor-based model have been widely used in a variety of tasks
    [Socher+ 2013a]
    * Richard Socher, Danqi Chen, Christopher D Manning, and Andrew Ng
    * Reasoning with neural tensor networks for knowledge base completion
    * In Advances in Neural Information Processing Systems, 2013
    [Socher+ 2013b]
    * R Socher, A Perelygin, J Wu, J Chuang, Ch D Manning, A Ng, Ch Potts
    * Recursive deep models 
      for semantic compositionality over a sentiment treebank
    * In EMNLP, 2013
* energy-based function

# 3.1 Tensor Factorization

# 3.2 Related Models and Special Cases

* Skip-Gram
* Topical Word Embeddings Liu+ 2015]

# 4 Experiments

# 4.2 Contextual Word Similarity

* to obtain word topics
  * The widely used collapsed Gibbs sampling LDA
    * [Blei+ 2003; Griffiths and Steyvers, 2004]
* other multi-prototype models
  * Huang+ 2012;
  * Tian+ 2014;
  * Neelakantan+ 2014;
  * Liu+ 2015
