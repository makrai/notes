Collobert+
NLP (Almost) from Scratch
2011

# Abstract

* embedding SENNA
* lehetséges feladat: kerssünk egyre nagyobb dimenziós `T_1,T_2,\dots`
  szintaktikai és `M_1,M_2\dots` szemantikai altereket, amelyek, ha minden jól
  megy, direktösszeadandók

# 1 Introduction

* we reach good performance levels in most of the tasks by transferring
  intermediate representations discovered on large unlabeled data sets to
  task-specific features

# 2 The Benchmark Tasks

* describes the benchmark tasks of interest
*	(Palmer+ 2005) formalism for Semantic Role Labeling
* benchmark system: systems which avoid usage of external data

# 3 The Networks

* describes the unified model and reports benchmark results obtained with
  supervised training
* architecture: a neural network takes the input sentence words are fed to our
  architecture as indices taken from a finite dictionary `D` lookup table: for
  each word `w \in D`, an internal `d_{wrd}`-dimensional feature vector
  `LT_W (w) =\langle W\rangle_w^1`

### extending to any discrete features

`w \in \D^(1)}\times\dots\times\D^{(K)}`
`W^(k)}`
(2)-ben `[w_i]_j` helyett esetleg simán `[w_j]`?

## Extracting Higher Level Features from Word Feature Vectors

* We consider two common approaches which tag one word at the time: a window
  approach, and a (convolutional) sentence approach
* Each output can be then interpreted as a score of the corresponding tag
  (given the input of the network), _thanks to a carefully chosen cost
  function_ that we will describe later in this section

### sentence approach

* window approach fails with SRL, where the tag of a word depends on a verb
* solution: convolutional approach, first introduced by Waibel+ (1989) and also
  called Time Delay Neural Networks

## 3.4

* two ways of interpreting neural network outputs as probabilities
* window approach is described in Section 3.3.1 and in Figure 1

# 4 Lots of Unlabeled Data

* leverages large unlabeled data sets (∼ 852 million words) to train the model
  on a language modeling task. Performance improvements are then demonstrated
  by transferring the unsupervised internal representations into the supervised
  benchmark models
* We then use these improved embeddings to initialize the word lookup tables of
  the networks described in Section 3.5
* az embeddingek tehát nem-feladatspec nyelvmodellek, a nyelvmodellbe beleértve
  a szemantika modellezését is

## .5 Semi-supervised Benchmark Results

* Our approach simply consists of initializing the word lookup tables of the
  supervised networks with the embeddings computed by the language models
* operator grammars (Harris, 1968)

# 5 Multi-Task Learning

# 6 The Temptation

* evaluates how much further improvement can be achieved by incorporating
  standard NLP task-specific engineering into our systems. Drifting away from
  our initial goals gives us the opportunity to construct an all-purpose tagger
  that is simultaneously accurate, practical, and fast

## .6 Word Representations

convex machine learning algorithms

# Critical Discussion
