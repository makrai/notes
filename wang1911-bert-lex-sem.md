How Can BERT Help Lexical Semantics Tasks?
Yile Wang, Leyang Cui, Yue Zhang
arXiv:1911.02929 [cs.CL]

# Abstract

* with dynamic embeddings as word representations, train static embeddings
* improvements over traditional static embeddings on lexical semantics tasks,
  obtaining the best reported results on seven datasets

# 1 Intro

* Word embeddings are useful in two broad aspects
  * directly, to solve lexical semantics tasks, such as word sim and analogy
    * large interest to computational linguistic research
      (Faruqui+ 2015; Kiela+ 2015a; Artetxe+ 2018)
  * as input representations to downstream tasks,
    * addressing sparsity issues of one-hot or indicator feature functions
* contextualized word representation such as
  * ELMo (Peters+ 2018)
  * GPT (Radford+ 2018, 2019)
  * BERT (Devlin+ 2019)
  * XLNet (Yang+ 2019) and
  * RoBERTa (Liu+ 2019) has been shown a more effective input representation
* "parameterization" of contextualized embeddings: In addition to a lookup,
  * a sequence encoding network such as RNN and SAN is also used
* several cheap methods to obtain static embeddings from dynamic embeddings
  * averaged over a large corpus
  * word vector parameters from the token embedding layer
  * these simple methods do not necessarily outperform traditional static embeds
* We consider integrating dynamic embeddings into the training process of static
  * we integrate BERT and skip-gram by using
    BERT to provide dynamic embeddings for center words during the training of a
    skip-gram model
  * advantage over skip-gram training is at least two-fold
    * polysemous words are represented using BERT embeddings, thereby resolving
      word sense ambiguities (Coenen+ 2019)
    * syntactic and semantic information over the entire sentence is integrated
      into the center word representation (Jawahar+ 2019; Clark+ 2019)
* Experiments over a range of lexical semantics datasets show that
  our method outperforms the existing SOTA methods for training static embeds
