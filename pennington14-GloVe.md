GloVe: Global Vectors for Word Representation
Jeffrey Pennington, Richard Socher, Christopher Manning
EMNLP 2014

# Abstract

* fine-grained semantic and syntactic regularities captured using vector arith-
  * origin of these regularities has remained opaque
* We analyze and make explicit the model properties needed for such regularities
  * global logbilinear regression model that
  * combines the advantages global matrix factorization and local context window
    * a specific weighted least squares model that trains on global word-word
* efficient by training only on the nonzero elements in a word-word co-occurr mx
* evidenced by its SOTA performance of 75% on a recent word analogy task. It also
  outperforms related models on similarity tasks and named entity recognition

# 1 Introduction

* Mikolov+ (2013c) introduced a new evaluation scheme based on word analogies
  * probes the finer structure: various dimensions of vecotr difference. For
  * dimensions of meaning, thereby capturing the multi-clustering idea of
    distributed representations (Bengio, 2009)
* two main model families for learning word vectors are:
  1. global matrix factorization methods, such as (LSA, Deerwester+ 1990) and
  2. local context window methods, such as the skip-gram model of Mikolov+ (13c)
    * poorly utilize the statistics of the corpus since they train on separate
      local context windows instead of on global co-occurrence counts

# 3 The GloVe Model

* first page: motivation of the log-bilinear model
* rare co-occurrences are noisy and carry less information
  * similar fractional power scaling to Mikolov+ (2013a)

# 4 Experiments

## 4.4 Model Analysis: Vector Length and Context Size

* diminishing returns for vectors larger than about 200 dimensions. In (b) and
* syntactic subtask for small and asymmetric context windows
* Semantic information: more of it is captured with larger window

## 4.5 Model Analysis: Corpus Size

* In Fig. 3, we show performance on the word analogy task for 300-dimensional
* syntactic subtask, there is a monotonic increase in performance as the corpus
* semantic: models trained on the smaller Wikipedia corpora do better than those
  * likely due to the large number of city~ and country-based analogies in the
  * Wikipedia has fairly comprehensive articles for most such locations

## 4.6 Model Analysis: Run-time

* The total run-time is split between
  * populating X and
    * depends on many factors, including window size, vocabulary size, and
      corpus size. Though we did not do so, this step
    * could easily be parallelized across multiple machines (see, e.g., Lebret
      and Collobert (2014) for some benchmarks)
  * training the model
    * depends on the vector size and the number of iterations

## 4.7 Model Analysis: Comparison with word2vec

* A rigorous quantitative comparison of GloVe with word2vec is complicated by
  the existence of many parameters that have a strong effect on performance
* We control for the main sources of variation that we
  * vector length, context window size, corpus, and vocabulary size
* The most important remaining variable to control for is training time
  * For GloVe, the relevant parameter is the number of training iterations
  * For word2vec, the
    * obvious choice would be the number of training epochs.  Unfortunately, the
      code is currently designed for only a single epoch: it specifies a
    * number of negative samples: effectively increases the number of training
      words seen by the model, so in some ways it is analogous to extra epochs
* word2vec’s performance actually decreases if the number of negative samples
  increases beyond about 10. Presumably this is because the negative sampling
  method does not approximate the target probability distribution well. 9
* For the same corpus, vocabulary, window size, and training time, GloVe
  consistently outperforms word2vec. It achieves better results faster, and also
  obtains the best results irrespective of speed
