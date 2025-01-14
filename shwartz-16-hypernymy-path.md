Improving Hypernymy Detection
  with an Integrated Path-based and Distributional Method
Vered Shwartz, Yoav Goldberg, Ido Dagan
2016 acl

  Our code and data are available in: https://github.com/vered1986/HypeNET

# Abstract

* Detecting hypernymy relations is a key task in NLP, which is addressed in the
literature using two complementary approaches.
  * Distributional methods, whose supervised variants are the current best
    performers, and
  * path-based methods, which received less research attention.
* We suggest an improved path-based algorithm, in which the dependency paths
  are encoded using a recurrent neural network, that achieves results
  comparable to distributional methods. We then extend the approach to
  integrate both path-based and distributional signals, significantly improving
  upon the state-of-the-art on this task.

# 1 Intro

* For instance, knowing that Tom Cruise is an actor
* For a couple of decades, this task has been addressed by two types of
  approaches: distributional, and path-based.
  * path-based methods base the decision on the lexico-syntactic paths
    connecting the joint occurrences of x and y in a corpus.
    * Hearst (1992) identified a small set of frequent paths that indicate
      hypernymy, e.g. Y such as X.
    * Snow+ (2004) represented each (x, y) term-pair as the multiset of
      dependency paths connecting their co-occurrences in a corpus, and
      trained a classifier to predict hypernymy, based on these features.
  * Though these approaches seem complementary, there has been rather little
    work on integrating them
      (Mirkin+ 2006; Kaji and Kitsuregawa, 2008)
* Inspired by recent progress in relation classification, we use a long
  shortterm memory (LSTM) network (Hochreiter and Schmidhuber, 1997) to encode
  dependency paths.  In order to create enough training data for our network,
  we followed previous methodology of constructing a dataset based on
  knowledge resources.

# 2 Background

We
  * introduce the two main approaches for hypernymy detection: distributional
    (Section 2.1), and path-based (Section 2.2)
  * discuss the recent use of recurrent neural networks in the related task of
    relation classification (Section 2.3).

## Distributional Methods

* Earlier methods developed unsupervised measures for hypernymy,
  * symmetric similarity measures (Lin, 1998), and followed by
  * directional measures based on the distributional inclusion hypothesis
    (Weeds and Weir, 2003; Kotlerman+ 2010).
  * (Santus+ 2014; Rimell, 2014) introduce new measures,
    * based on the assumption that the most typical linguistic contexts of a
      hypernym are less informative than those of its hyponyms.
* supervised
  * methods ... used to represent term-pairs as a combination of each term’s
    embeddings vector:
    * concatenation x \oplus y (Baroni+ 2012),
    * difference y − x (Roller+ 2014; Weeds+ 2014), and
    * dot-product x · y
  * good results
    * Baroni+ 2012;
      * Marco Baroni, Raffaella Bernardi, Ngoc-Quynh Do, and Chung-chieh Shan.
        Entailment above the word level in distributional semantics
        EACL 2012 pages 23–32.
    * Roller+ 2014
      * Stephen Roller, Katrin Erk, and Gemma Boleda. 2014.
        Inclusive yet selective: Supervised distributional hypernymy detection
        COLING, pages 1025–1036.

## Path-based Methods

## RNNs for Relation Classification

* classify the relation that is expressed between two target terms in a given
  sentence to one of predefined relation classes
  * example from the SemEval-2010 relation classification task dataset
    (Hendrickx+ 2009):
    * “The [apples] e 1 are in the [basket] e 2 ”.
    * Content--Container(e 1 , e 2 ).
* shortest dependency paths between the target entities were shown to be
  informative for this task (Fundel+ 2007). Recently, deep learning
  techniques showed good performance in capturing the indicative information
  in such paths.

# 3 LSTM-based Hypernymy Detection

# 4 Dataset

# 5 Baselines

# 6 Results

# 7 Analysis

# 8 Conclusion
