Xinxiong Chen and Lei Xu and Zhiyuan Liu and Maosong Sun and Huanbo Luan
Joint Learning of Character and Word Embeddings
2015

* IDEA minden szóhoz egy kompizicionalizást kifejező szám?

# Abstract

* Chinese, a word is usually composed of several characters
* character-enhanced word embedding model (CWE)
* character ambiguity and non-compositional words, we propose multiple-
  prototype character embeddings

#  Introduction

* Distributed word representation, also known as word embedding, was first
  proposed in [Rumelhart+ 1986]
* tasks
  * language modeling [Bengio+ 2003; Mnih and Hinton, 2008],
  * word sense disambiguation [Chen+ 2014],
  * semantic composition [Zhao+ 2015],
  * entity recognition and disambiguation [Turian+ 2010; Collobert+ 2011],
  * syntactic parsing [Socher+ 2011; 2013] and
  * knowledge extraction [Lin+ 2015]
* difficulties
  * (1) Compared with words, Chinese characters are much more ambiguous
  * (2) Not all Chinese words are semantically compositional,
    such as transliterated words
* rise to these challenges
  * (1) several methods for multiple-prototype character embeddings:
    * position-based, cluster-based and nonparametric method
  * (2) non-compositional words: wordlist in advance
* expansibility in two aspects
  * it can be easily integrated in various word embedding methods,
  * to various languages in which words contain rich internal information

#  Our Model

#  Experiments and Analysis

#  Related Work

* Some work tries to reveal morphological compositionality
  * [Alexandrescu and Kirchhoff, 2006] proposed a factored neural language model
    * each word is viewed as a vector of factors
  * [Lazaridou+ 2013] explored the application of compositional distributional
    semantic models, originally designed to learn phrase meanings, for
    derivational morphology
  * [Luong+ 2013] proposed an RNN to model morphological structure of words
  * [Botha and Blunsom, 2014] proposed a scalable method for integrating
    compositional morphological representations into a log-bilinear LM
  * These models are mostly sophisticated and task-specific

#  Conclusion and Future Work
