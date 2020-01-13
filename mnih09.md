Mnih & Hinton
A scalable hierarchical distributed language model embedding HLBL
2009

itt egy szónak még csak egyféle vektora van

# Abstract

* Morin and Bengio have proposed a hierarchical language model
  * two orders of magnitude faster than the non-hierarchical model it was 
  * word tree created using expert knowledge. 
* We introduce a fast hierarchical language model along with a simple
  feature-based algorithm for automatic construction of word trees
  * outperform non-hierarchical neural models [and] the best n-gram models

# Introduction

* n-gram language models are the most popular statistical language models 
  * smoothing methods available for n-gram models [4]. In spite of the
  * Class-based n-gram models [3] aim to address [similaritis between words]
* alternative ... is to represent each word using a real-valued feature vector 
  * Most models ... use a feed-forward neural network (e.g. [12], [5], [9]).
  * Perhaps the best known [vecor `n`-gram] model is the 
    Neural Probabilistic Language Model NPLM (Bengio et al 2003)

# 2 The hierarchical neural network language model

* normalization is costly
* One way to speed up the process is [a specialized importance sampling] 
  to approximate the gradients required for learning (Bengio and Senécal 2003)
  * testing remains computationally expensive
* hierarchical neural probabilistic language model (Morin and Bengio 2005)
  * one `N`-way normalization is replaced by 
    a sequence of `O(log N)` local (binary) normalizations
  * The tree was obtained by starting with the WordNet IS-A taxonomy and
    converting it into a binary tree through a combination of manual and
    data-driven processing
* Our goal
  * replace this procedure by an [unsupervised] method for building trees 
  * trees where each word can occur more than once

# 3 The log-bilinear language model 

* log-bilinear language model (LBL) (Mnih and Hinton 2007.) 

# 4 The hierarchical log-bilinear model 3

* based on the hierarchical model from (Morin & Bengio 05). 
* The distinguishing features of our model are
  * log-bilinear language model for computing the probabilities at each node
  * the ability to handle multiple occurrences of each word in the tree.
* Each of the non-leaf nodes in the tree also has a feature vector associated
  with it that is used for discriminating the words in the left subtree form
  the words in the right subtree of the node
* the probability of making a decision at a node depends only on the predicted
  feature vector, determined by the context, and the feature vector for that
  node,
* Allowing multiple codes per word can allow better prediction of words that
  have multiple senses or multiple usage patterns
* az utolsó két bekezdést nem értettem meg

# 5 Hierarchical clustering of words

* It is also not clear that using expert knowledge, even when it is available,
  will lead to superior performance. :-)
* Since we would like to cluster words for easy prediction of the next word
  based on its context, it is natural to describe each word in terms of the
  contexts that can precede it
* similar to ... class-based n-gram models, for which a large number of
  algorithms has been proposed 
  * We considered several of these algorithms before 
  * deciding to use our own algorithm
  * we restricted our attention to the top-down hierarchical clustering algos
    * scale better than their agglomerative counterparts [7]
  * (JG McMahon and FJ Smith 1996) produces exactly the kind of binary trees we
    need, except that its time complexity is cubic in the vocabulary size. 2 We 
  * distributional clustering algorithm (Pereira Lee 1993)
    * difficulties ... in using contexts of more than one word for clustering.
* bootstrapping procedure: we generate a random binary tree of words, train an
  HLBL model based on it, and use the distributed representations it learns to
  represent words when building the word tree
* trees for hierarchical language models [need to be] X [so that the models] Y
  1. well-supported by the data [so that models] generalize well
  2. reasonably well-balanced so that [models] are fast to train and test
  * To explore the trade-off ... we tried several splitting rules in our
    tree-building algorithm. The rules are based on the observation that 
  * the responsibility of a [GMM] component for a datapoint can be used as a
    measure of confidence about the assignment of the datapoint 
  * Thus, when the responsibilities of both components for a datapoint are
    close to 0.5, we cannot be sure [of the assignment]
  * splitting rules we tried
    1. simplest ... to produce a BALANCED tree at any cost. It sorts the
    2. ADAPTIVE splits well-supported by the data even if ... unbalanced
       * by assigning the word to the component with the higher responsibility
    3. ADAPTIVE(ǫ), an extension of the second rule, modified to 
      * assign a point to both components whenever both responsibilities are
        within ǫ of 0.5, for some pre-specified ǫ. This rule is designed to

        produce multiple codes for words that are difficult to cluster. We will
        refer to the algorithms that use these rules as BALANCED, ADAPTIVE, and
         respectively.  Finally, as a baseline for comparison with
        the above algorithms, we will use an algorithm that generates 
    4. RANDOM balanced trees. It starts with a random permutation of the words

# 6 Experimental results

# 7 Discussion and future work

* the words with the largest numbers of codes (i.e. the word that were
  replicated the most) were not the words with multiple distinct senses
  Instead, the algorithm appeared to replicate the words that occurred
  relatively infrequently and were therefore difficult to cluster. 
  * The “sense multimodality” of context distributions would be better captured
    by using a small set of feature vectors found by clustering the contexts.

