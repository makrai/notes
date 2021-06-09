Collobert+
NLP (Almost) from Scratch
2011

* lehetséges feladat: kerssünk egyre nagyobb dimenziós `T_1,T_2,\dots`
  szintaktikai és `M_1,M_2\dots` szemantikai altereket, amelyek, ha minden jól
  megy, direktösszeadandók

# Abstract

* embedding SENNA

# 1 Introduction

* good performance levels in most of the tasks by transferring intermediate
  representations discovered on large unlabeled data sets to task-specific
  features

# 2 The Benchmark Tasks

* describes the benchmark tasks of interest
*	(Palmer+ 2005) formalism for Semantic Role Labeling
* benchmark system: systems which avoid usage of external data

# 3 The Networks

* describes the unified model and reports benchmark results obtained with
  supervised training
* architecture: a neural network takes the input sentence words are fed to our
  architecture as indices taken from a finite dictionary `D` lookup table:
  for each word `w \in D`, an internal `d_{wrd}`-dimensional feature vector
  `LT_W (w) =\langle W\rangle_w^1`

### extending to any discrete features

`w \in \D^(1)}\times\dots\times\D^{(K)}`
`W^(k)}`
(2)-ben `[w_i]_j` helyett esetleg simán `[w_j]`?

## 3.3 Extracting Higher Level Features from Word Feature Vectors

* We consider two common approaches which tag one word at the time:
  a window approach, and a (convolutional) sentence approach
* Each output can be then interpreted as a score of the corresponding tag
  (given the input of the network), _thanks to a carefully chosen cost
  function_ that we will describe later in this section

### 3.3.2 sentence approach

* window approach
  * performs well for most NLP tasks we are interested in. However this approach
  * fails with SRL, where the tag of a word depends on a predicate
  * If the verb falls outside the window
  * requires the consideration of the whole sentence. When using
  * neural networks, the natural choice to tackle this problem in a convolution
  * convolutional approach,
    * first introduced by Waibel+ (1989) and
    * also called Time Delay Neural Networks (TDNNs) in the literature.
* It is thus necessary to encode in the network architecture which verb we are
  considering in the sentence, and which word we want to tag. For that purpose,
  * features encode the relative distances i − pos v and i − pos w with respect
    to the chosen verb at position pos v , and the word to tag at position pos w
* Convolutional Layer
  * a generalization of a window ap- proach:
  * given a sequence represented by columns in a matrix f θ l−1,
    a matrix-vector operation is applied to each window of successive windows in
    the sequence.  where the weight matrix W l is the same across all windows t
  * Convolutional layers extract local features around each window
  * convolutional layers are often stacked to extract higher level features. In
* Max Layer. The size of the output (6) depends on the number of words
  * Local feature vectors extracted by the convolutional layers have to be
    combined to obtain a global feature vector, with a fixed size,
    in order to apply subsequent standard affine layers.
  * Traditional convolutional networks often apply an
    average (possibly weighted) or a max operation over the “time” t
  * average operation does not make much sense in our case, as in general
    most words in the sentence do not have any influence on the semantic role of
    a given word to tag
  * Instead, we used a max approach
This fixed sized global feature vector can be then fed to standard affine
* we then finally produce one score per possible tag for the given task.
  * As in the window approach

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
