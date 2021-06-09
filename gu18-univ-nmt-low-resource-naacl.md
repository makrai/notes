Universal Neural Machine Translation for Extremely Low Resource Languages
Jiatao Gu, Hany Hassan, Jacob Devlin, Victor O.K. Li
naacl 2018

# Intro

* simulated “zero-resource" settings, our model can
  consistently outperform a strong multi-lingual NMT baseline

# 2 Motivation

## 2.1 Challenges

## Lexical-level Sharing

* Conventionally, a multilingual NMT model has a vocabulary that represents the
  union of the vocabularies of all source languages
  * multi-lingual words do not practically share the same embedding space
* solution is to share the surface form of all source languages through sharing
  sub-units such as
  * subwords (Sennrich+ 2016b) or
  * characters (Kim+ 2016; Luong and Manning, 2016; Lee+ 2017).
* However, for an arbitrary low-resource language we cannot assume significant
  overlap in the lexical surface forms compared to the high-resource languages.
  The low-resource language may not even share the same character set
  It is crucial to create a shared semantic representation across all languages
* each source word `e_x` is represented as a mixture of universal tokens M
