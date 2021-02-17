Eric H. Huang, Richard Socher, Christopher D. Manning, Andrew Y. Ng
ACL2012
Improving Word Representations via Global Context and Multiple Word Prototypes

The dataset and word vectors can be downloaded at http://www.socher.org

# Abstract

* We present a new neural network architecture which
  1. learns word embeddings [incorporating global context], and
  2. accounts for homonymy and polysemy

# 1 Introduction

* Reisinger and Mooney (2010b) introduced a
  multi-prototype VSM [learned from] sense-labeled words
* We introduce a
  * new neural-network-based language model that distinguishes and uses
    both local and global context
  * new dataset with human judgments on similarity between pairs of words
    in sentential context

# 2 Global Context-Aware Neural Language Model

# 2.1 Training Objective

* Given a word sequence s and document d in which the sequence occurs,
  our goal is to discriminate the correct last word in s
  from other random words (Collobert and Weston 2008)

# 2.2 Neural Network Architecture

* two scoring components
  * local context
  * For the score of the global context, we represent the document also
    as an ordered list of word embeddings, d = (d1, d2, ..., dk)

# 2.3 Learning

# 3 Multi-Prototype Neural Language Model

* word sense discrimination (Schütze, 1998)
* learn multiple prototypes
  * gather the fixed-sized context windows of all occurrences of a word
    * 5 words before and after the word occurrence
  * Each context is represented by a weighted average of the context
    * idf-weighting
  * spherical k-means to cluster
    * model[s] semantic relations well (Dhillon and Modha, 2001)
  * each word occurrence in the corpus is re-labeled
* Similarity between a pair of words
  * similarity between two vectors [...] can be
    any of the distance functions presented by Curran (2004)

# 4 Experiments

* preproc
  * we keep the frequent numbers intact and
    replace each digit of the uncommon numbers to “DG”

# 4.1 Qualitative Evaluations

* Center Word & Nearest Neighbors

| bank`_1` | corporation, insurance, company
| bank`_2` | shore, coast, direction

| star`_1` | movie, film, radio
| star`_2` | galaxy, planet, moon

# 4.2 WordSim-353

* We also found that correlation can be further improved by removing stop words
  * Thus, each window of text (training example) contains more information

# 4.3 New Dataset: Word Similarity in Context

1. human judgments on pairs of words presented in sentential context,
2. word pairs and their contexts are chosen to
  reflect interesting variations in meanings of homonymous and polysemous words
3. verbs and adjectives are present in addition to nouns

# 5 Related Work

* Andriy Mnih and Geoffrey Hinton. 2007.
  Three new graphical models for statistical language modelling
* ranking-loss training objective proposed by Collobert and Weston (2008),
* The multi-prototype approach has been widely studied in models of
  categorization in psychology (Rosseel, 2002; Griffiths et al., 2009),
  * Yves Rosseel. 2002. Mixture models of categorization
    * matematikai jellegű. a pszichóra csak hivatkozik
  * Thomas L Griffiths, Kevin R Canini, Adam N Sanborn, Daniel J Navarro
     2009.  Unifying rational models of categorization
       via the hierarchical Dirichlet process
    * tiszta matematika
* Schütze (1998) used clustering of contexts to perform
  word sense discrimination
* Reisinger and Mooney (2010b) combined the two approaches
  and applied them to vector-space models
