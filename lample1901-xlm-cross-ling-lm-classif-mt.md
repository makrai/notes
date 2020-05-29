XLM: Cross-lingual Language Model Pretraining
Guillaume Lample, Alexis Conneau
NeurIPS 2019, arXiv:1901.07291 [cs.CL]

# Abstract

* SOTA results on cross-lingual classification, unsupervised and supervised MT

# 1 Intro

* learn and eval cross-lin sentence reprs in many langs (Conneau+ 2018b)
* aim: build universal cross-lingual encoders  into a shared embedding space
* In this work, multiple cross-lingual understanding (XLU) benchmarks
* contributions:
  1. cross-lingual language modeling and investigate two monolingual pret objs
  2. new supervised learning objective that improves cross-lingual pretraining
     when parallel data is available
  3. significantly outperform the previous SOTA on
    cross-lingual classif, unsupervised and supervised MT
  4.  significant improvements on the perplexity of low-resource languages

# 3 Cross-lingual language models

* three language modeling objectives we consider throughout this work
  * Two of them only require monolingual data (unsupervised)
  * third one requires parallel sentences (supervised)

## 3.2 Causal Language Modeling (CLM)

Our causal language modeling (CLM) task con-
