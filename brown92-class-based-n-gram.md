Class-Based n-gram Models of Natural Language
Peter F Brown, Peter V de Souza, RL Mercer, VJ Della Pietra, Jenifer C Lai
1992

#Abstract

* the problem of * predicting a word from previous words in a sample of text
* We
  * n-gram models based on classes of words. We also discuss
  * several statistical algorithms for assigning words to classes
    based on the frequency of their co-occurrence with other words
  * extract classes that have the flavor of
    either syntactically based groupings or semantically based groupings,
    depending on the nature of the underlying statistics

#1. Introduction

* noisy channel
  * In a number of natural language processing tasks, we face the problem of
    recovering a string of English words after it has been garbled by passage
    through a noisy channel.  To tackle this problem successfully, we must be
    able to estimate the probability with which any particular string of
    English words will be presented as input to the noisy channel
* organization
  2. language model and ... a definition of n-gram models
  3. subset of n-gram models in which the words are divided into classes
    * We show that for n = 2 the maximum likelihood assignment of words to
      classes is equivalent to the assignment for which the average mutual
      information of adjacent classes is greatest
    * two algorithms for finding a suboptimal assignment
  4. we apply mutual information to two other forms of word clustering
    1. find pairs of words that function together as a single lexical entity
    2. find classes that have some loose semantic coherence

#3. Word Classes 4

* the partition that maximizes L(\pi) is, in the limit,
  the [one] that maximizes the average mutual information of adjacent classes
* no practical method for finding one [such] partition
* greedy algorithm
  * Initially, we assign each word to a distinct class
  * then merge that pair of classes for which the loss in average mutual
    information is least
  * cycle through the vocabulary moving each word to the class for which the
    resulting partition has the greatest average mutual information
  * Eventually [végül "is"] no potential reassignment of a word leads to a
    partition with greater average mutual information. At this point, we stop
  * It may be possible to find a partition with higher average mutual
    information by simultaneously reassigning two or more words, but
    we regard such a search as too costly to be feasible
* we can make the computation of the average mutual information remaining after
  a merge in constant time, independent of V
* Beyond 5,000 words this algorithm also fails of practicality
  * we proceed as follows
  * assign each of the [C most frequent] words to its own, distinct class
  * [k = 1 .. V-C] At the k th step of the algorithm, we assign the (C + k) th
    most probable word to a new class ... and we ... merge that pair for which
    the loss in average mutual information is least

#4. Sticky Pairs and Semantic Classes 10

* At the expense of a slightly greater perplexity, the 3-gram model with word
  classes requires only about one-third as much storage as the 3-gram LM
