Evaluating the Stability of Embedding-based Word Similarities
Maria Antoniak and David Mimno
naacl 2018

# Abstract

* including specific documents in the training set can result in substantial
  variations ... more prominent for smaller training corpora

# 1 Introduction

* Word embeddings are ... used by researchers in unexpected ways
  in fields such as digital humanities and computational social science
  (Hamilton+ 2016; Heuser, 2016; Phillips+ 2017)
* factors such as the presence of specific documents, the size of the documents
* simply averaging over multiple bootstrap samples is sufficient
  to produce stable, reliable results in all cases tested
* embeddings as direct evidence about the language and culture of the authors
  (Bolukbasi+ 2016; Hamilton+ 2016; Heuser, 2016)
  * used as if they were simulations of a survey
* small corpora are common in digital humanities and computational social sci
* We
  * examine four different algorithms and six datasets, and we
  * manipulate the corpus by shuffling the order of the documents and
    taking bootstrap samples of the documents
* Smaller corpora and larger document sizes increase this variation

# 2 Related Work

* [embed in digital humanities and computational social sci]
  * Hamilton+ (2016) ... measure semantic shifts, and
  * Heuser (2016) uses embeddings to characterize discourse about
    virtues in 18th Century English text
  * variation of language across
    * geographical areas (Kulkarni+ 2016; Phillips+ 2017) and
      time (Kim+ 2014)
  * Each of these studies seeks to reconstruct the mental model
* implicit bias in word embeddings
  * e.g. associations between occupations and genders (Bolukbasi+ 2016)
  * From a downstream-centered perspective, [ bias ] should be filtered out
  * from a corpus-centered perspective, [ bias is] a means of measurement,
* BTW
  * Noam Shazeer, Ryan Doherty, Colin Evans, and Chris Waterson
    2016
    Swivel: Improving Embeddings by Noticing What’s Missing
* evaluating the stability of word embeddings
  * Levy+ (2015) focus on the hyperparameter settings
  * Hellrich and Hahn (2016) examine the effects of word
    frequency, word ambiguity, and the number of training epochs on [skip-gram]
  * Tian+ (2016) explore the robustness of SGNS and GloVe

# 3 Corpora

* We [explore] size, vocabulary, and other parameters of the training corpus
* datasets
  * In order to better model ... corpus-centered research, these corpora are
  ... much smaller than the standard corpora typically used
* bootstrap sampling ... operates by removing or multiplying the presence of
  documents

# Corpus Parameters

## Order and presence of documents

* three different methods to sample the corpus:
  FIXED, SHUFFLED, and BOOTSTRAP
  * FIXED setting includes each document exactly once
  * BOOTSTRAP: BAA, CAB, BBB
* Algorithmic variability may arise from ... initializations ... negative
  sampling, or ... subsampling of tokens within documents

## Size of corpus

* for each corpus, we curate a smaller sub-corpus that contains 20%
  * contiguous sequences of documents at the beginning of each training

## Length of documents

* We use two document segmentation strategies. In the first setting,
 1. each training instance is a single document . In the second setting,
 2. each training instance is a single sentence
  * [for] the BOOTSTRAP setting
  * Documents are often characterized by “bursty” words that are
    locally frequent but globally rare (Madsen+ 2005)
  * Sampling whole documents with replacement should magnify the[ir] effect
  * Sampling sentences with replacement should have less [such] effect

# 5 Algorithms

* four categories of algorithms
* online stochastic updates [including] word2vec and fastText packages
  * We focus on SGNS as a popular and representative example
* batch stochastic updates, in which the algorithm
  ... first collects a matrix [then] stochastic optimization
  * We select the GloVe algorithm (Pennington+ 2014)
* matrix factorization ... we include PPMI (Levy and Goldberg, 2014)
* to test whether word order is a significant factor we include a
  document-based LSA (Deerwester+ 1990; Landauer and Dumais, 1997)

# 6 Methods

* To establish statistical significance bounds for our observations, we train
  50 LSA models, 50 SGNS models, 50 GloVe models, and 50 PPMI models
  for each of the three settings (FIXED , SHUFFLED, and BOOTSTRAP),
  for each document segmentation size, for each corpus
* For each corpus, we
  * select a set of 20 relevant query words
    from high probability words from an LDA topic model (Blei+ 2003)
    trained on that corpus with 200 topics
  * creating a similarity ranking of all the words [to each query word ]
  * calculate the mean and standard deviation of the cosine similarities
  * select the 20 words most closely related to the set of query words and
    compare the mean and standard deviation of those pairs across settings. We
    calculate the Jaccard similarity between top-N [closely related ws]
  * average changes in rank within those lists
  * examine these metrics across different algorithms and corpus parameters

# 7 Results 7

* FIXED setting. For example, we can see the effect of
  the random SVD solver for LSA and ... random subsampling for PPMI
* We do not observe a consistent effect for document order in ... SHUFFLED
* BOOTSTRAP setting causes large increases in variation across all algorithms
  (with a weaker effect for PPMI) and corpora
  * the presence of specific documents in the corpus can significantly affect
* GloVe and LSA produce the least variable cosine similarities, while
  PPMI produces the most variable cosine similarities for all settings. The
  presence of specific documents has a significant effect on all four
  algorithms (lesser for PPMI), consistently increasing the standard deviations
* document segmentation size 11
