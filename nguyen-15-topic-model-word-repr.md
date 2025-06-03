Dat Quoc Nguyen, Richard Billingsley, Lan Du, and Mark Johnson
2015  TACL
Improving Topic Models with Latent Feature Word Representations

https://github.com/datquocnguyen/LFTM

# Abstract

* Probabilistic topic models are widely used to discover latent topics in
  document collections, while
* latent feature vector representations of words ... in many NLP tasks
* In this paper, we
  * extend two different Dirichlet multinomial topic models by
  * incorporating latent feature vector representations of words trained on
    very large corpora to
  * improve the word-topic mapping learnt on a smaller corpus
* Experimental results
  * significant improvements on topic coherence, document clustering and
    document classification tasks,
  * especially on datasets with few or short documents

# 1 Introduction

* Topic modeling algorithms,
  * such as
    * Latent Dirichlet Allocation (Blei et al., 2003) and
    * related methods (Blei, 2012), are often used to
  * learn a set of latent topics for a corpus, and
    * predict the probabilities of each word in each document belonging to each
      topic
* external knowledge
  * when the training corpus of documents is small or when the documents are
    short
  * Sahami and Heilman (2006) employed
    * web search results to improve the information in short texts
  * Phan et al. (2011) assumed that
    * the small corpus is a sample of topics from a larger corpus like
      Wikipedia, and then use the topics discovered in the larger corpus
    * However, if the larger corpus has many irrelevant topics, this will “use
      up” the topic space of the model. In addition,
  * Petterson et al. (2010) proposed
    * an extension of LDA that uses external information about word similarity,
      such as thesauri and dictionaries, to smooth the topic-to-word
      distribution
  * latent feature (LF) vectors
    * Salakhutdinov and Hinton, 2009
    * Srivastava et al., 2013
    * Cao et al., 2015)
      * Ziqiang Cao, Sujian Li, Yang Liu, Wenjie Li, and Heng Ji.
      * 2015 AAAI
      * A Novel Neural Topic Model and Its Supervised Extension
* we explore how to
  * take advantage of both
    * latent feature representation trained on a large external corpus to
    * multinomial topic model estimated from a smaller corpus
  * two Dirichlet multinomial topic models: a
    * Latent Dirichlet Allocation (LDA) model (Blei et al., 2003) and a
    * one-topic-per-document Dirichlet Multinomial Mixture (DMM) model
      * (Nigam et al., 2000)
  * Specifically, we replace the topic-to-word Dirichlet multinomial component
    which generates the words from topics in each Dirichlet multinomial topic
    model by a two-component mixture of a Dirichlet multinomial component and a
    latent feature component

# 2 Background

## 2.1 LDA model

* represents
  * each document d as a probability distribution θ d over topics, where
  * each topic z is modeled by a probability distribution φ z over words
* Gibbs sampling algorithm for estimating LDA topic models as described by
  Griffiths and Steyvers (2004)

## 2.2 DMM model for short texts

* topic models for short or few documents for text clustering is more
  challenging because of data sparsity and the limited contexts in such texts
  * approaches
    * combine short texts into long pseudo-documents before training LDA
      * (Hong and Davison, 2010; Weng et al., 2010; Mehrotra et al., 2013)
    * assume that there is only one topic per document
      * (Nigam et al., 2000; Zhao et al., 2011; Yin and Wang, 2014)
* Dirichlet Multinomial Mixture (DMM) model (Nigam et al., 2000), each
  document is assumed to only have one topic
