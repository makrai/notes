Sense2vec: a fast and accurate method for WSD in ... embed
Andrew Trask & Phil Michalak & John Liu
2015

# Abstract

* supervised disambiguation,
* disambiguate both
  * contrastive senses such as nominal and verbal senses as well as
  * nuanced senses such as sarcasm. We further evaluate
* Part-of-Speech disambiguated embeddings on neural dependency parsing,
  * greater than 8% average error reduction in unlabeled attachment scores
    across 6 languages

# 1 Introduction

* distributed representations ... for a wide variety of NLP tasks including
  * Part-of-Speech tagging, Named Entity Recognition,
    Analogy/Similarity Querying, Transliteration, and Dependency Parsing
    (Al-Rfou+ 2013; Al-Rfou+ 2015; Mikolov+ 2013a;b; Chen & Manning, 2014)
* incorporating features such as
  * character (compositional) information,
  * word order information, and
  * multi-word (phrase) information
    (Ling+ 2015; Mikolov+ 2013c; Zhang+ 2015; Trask+ 2015)

# 2

## 2.5 Clustering convolutional context embeddings

* Chen+ (2015) select the number of word clusters for each word
  based on the number of definitions for a word in the WordNet Gloss
  (unlike other approaches that commonly pick a fixed number of clusters)
