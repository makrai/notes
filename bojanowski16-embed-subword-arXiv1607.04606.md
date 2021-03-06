Enriching Word Vectors with Subword Information
arXiv:1607.04606v1 [cs.CL] 15 Jul 2016
Piotr Bojanowski , Edouard Grave, Arm, Joulin, and Tomas Mikolov
Facebook AI Research

# Három cikk és két repó

|skip-gramwi	  |arxiv/1607.04606|Enriching Word Vectors|szovektorokrol	       |
|fastText	      |arxiv/1607.01759|Bag of trick for Effic|az osztalyozásról	   |
|RNN (ICLR 2016)|arxiv/1511.06303|Alternative structures|modellek tomoriteserol|

https://github.com/facebookresearch/fastText
https://github.com/facebook/Conditional-character-based-RNN

# Abstract

* each word is represented as a bag of character n-grams
* A vector representation is associated to each character n-gram,
  words being represented as the sum of these representations
* Our method is fast, allowing to train models on large corpus quickly
* We evaluate the obtained word representations on
  * five different languages, on
  * word similarity and analogy tasks

# 1 Introduction

* continuous representations of words
* long history (Rumelhart+ 1988)
* typically derived from large unlabeled corpora using co-occurrence stat
  (Deerwester+ 1990; Schütze, 1992; Lund and Burgess, 1996)
* distributional semantics, have studied the properties of these methods
  (Turney+ 2010; Baroni and Lenci, 2010)
* neural network community (Collobert and Weston 2008)

# 2 Related work

## Morphological word representations

* incorporate morphological information into word representations
* Alexandrescu and Kirchhoff (2006) introduced factored neural LM
  * words are represented as sets of features.  These features might include
    morphological information, and this technique was succesfully
  * applied to ... Turkish (Sak+ 2010)
* different composition functions (Lazaridou+ 2013; Luong+ 2013;
  Botha and Blunsom, 2014; Qiu+ 2014)
  * These ...  rely on a morphological decomposition of words, while ours not
* [joint] embeddings for Chinese words and characters (Chen+ 2015)
* Cui+ (2015) constrain morphologically similar words to have similar vectors
* Soricut and Och (2015) ... vector representations of
  morphological transformations, allowing to obtain representations for unseen
  words by applying these rules
* representations trained on morphologically annotated data were
  introduced by Cotterell and Schütze (2015)
* Closest to our approach, Schütze (1993) learned
  representations of character fourgrams through SVD, and
  derived representations for words by summing the fourgrams representations

## Character level features for NLP

* recurrent neural networks, applied to
  * language modeling (Mikolov+ 2012; Sutskever+ 2011;
    Graves, 2013; Bojanowski+ 2015)
  * text normalization (Chrupała, 2014),
  * part-of-speech tagging (Ling+ 2015) and
  * parsing (Ballesteros+ 2015)
* convolutional neural networks trained on characters were applied to
  * part-of-speech tagging (dos Santos and Zadrozny, 2014),
  * sentiment analysis (dos Santos and Gatti, 2014),
  * text classification (Zhang+ 2015) and
  * language modeling (Kim+ 2016)
* Sperr+ (2013)
  * LM based on restricted Boltzmann machine
  * words are encoded as a set of character n-grams
* MT use subword units to obtain representations of rare words
  (Sennrich+ 2016; Luong and Manning, 2016)

# 4 Experiments

## Datasets and baseline

* First, we compare our model to the C implementation of
  the skip-gram and CBOW models from the word2vec package
* Wikipedia data in five languages:
  English, Czech, French, German and Spanish
* datasets of three different sizes: small (50M tokens), medium (200M tokens)
  and full (the complete Wikipedia dump)

## Implementation details

* on English data, our model with character n-grams is approximately
  1.5× slower to train than the skip-gram baseline

## Human similarity judgement

* effect of using character n-grams is significantly more important
  * for German than for English or Spanish
  * on smaller datasets
* English rare words dataset (RW), our approach also outperforms the baselines

## Word analogy tasks

* morphological information significantly helps for the syntactic tasks, our
  approach outperforming the baselines on en-syn.
* In contrast, it degrades the performance on semantic tasks for small training
  datasets. Second, we observe that
* for Czech, a morphologically rich language,
  using subword information strongly improves

## Comparison with morphological representations

* We also compare our approach to previous work on incorporating subword
  information in word vectors, on word similarity tasks
* methods used are:
  * recursive neural network of Luong+ (2013),
  * morpheme CBOW of Qiu+ (2014) and the
  * morphological transformations of Soricut and Och (2015)
* our results are comparable
