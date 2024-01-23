Character-level Convolutional Networks for Text Classification
(former: Text Understanding from Scratch arXiv:1502.01710v1)
Xiang Zhang and Yann LeCun
nips 15

# Abstract

* deep learning from character-level inputs all the way up to abstract
  * using temporal convolutional networks (LeCun+ 1998, ConvNets)
* We
  * apply ConvNets to various large-scale datasets, including
    * ontology classification, sentiment analysis, and text categorization
  * astonishing performance
    * without the knowledge of words, phrases, sentences
  * both English and Chinese

# 1. Introduction

* Text understanding (Norvig, 1987)
* apply word2vec or similar techniques with an _engineered language model_
  * Frome+ 2013
  * Gao+ 2013
  * Y. Shen, X. He, J. Gao, L. Deng, and G. Mesnil
    A latent semantic model with convolutional-pooling structure for info retriv
    ACM Information and Knowledge Management 2014
  * Le & Mikolov, 2014
  * Mikolov+ 2013a
  * Pennington+ 2014
* with little structural engineering
  (Collobert+ 2011b, Kim, 2014, Johnson & Zhang, 2014, dos Santos & Gatti, 2014)
* In this article without artificially imbedding knowledge about words,
  phrases, sentences or any other syntactic or semantic structures
  1. working with characters
  2. not require knowledge of syntax or semantic structures –
    inference directly to high-level targets
* inspired by ConvNet’s success in computer vision
  * outstanding performance in various image recognition tasks
    (Girshick+ 2013, Krizhevsky+ 2012, Sermanet+ 2013)
  * end-to-end ConvNet model (Girshick+ 2013, Zeiler & Fergus, 2014)

# 2. ConvNet Model Design

## 2.1. Key Modules
## 2.2. Character quantization
## 2.3. Model Design
