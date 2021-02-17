Jiwei Li and Dan Jurafsky
Do Multi-Sense Embeddings Improve Natural Language Understanding?
2015 EMNLP

jiweil/mutli

# Abstract

* ‘multi-sense’ methods
  * proposed and tested on artificial word-similarity tasks,
  * we don’t know if they improve real natural language understanding tasks
* In this paper we introduce
  * a pipelined architecture for incorporating multi-sense embeddings into NLU
  * test the performance of a state-of-the-art multi-sense embedding model
    * (based on Chinese Restaurant Processes)
  * We apply the model to
    * part-of-speech tagging, named entity recognition, sentiment analysis,
      semantic relation identification and semantic relatedness
  * We find that
    * — if we carefully control for the number of dimensions —
    * sense-specific embeddings
      * introduce slight performance boost in semantics-related tasks
        * semantic similarity for words and sentences,
        * semantic relation identification,
        * part-of-speech tagging
      * is of little in others
        * that depend on correctly identifying a few *key words* such as
        * sentiment analysis
        * named entity extraction

# 1 Introduction

* embeddings could model aspects of word sense (Kintsch, 2001)
* models that represent each word type by different senses
  * Kintsch, 2001;
    * adjust the predicate to the argument
  * Reisinger and Mooney, 2010;
  * Neelakantan+ 2014;
  * Huang+ 2012;
  * Chen+ 2014;
    * Xinxiong Chen, Zhiyuan Liu, Maosong Sun
    * A Unified Model for Word Sense Representation and Disambiguation
    * 2014 EMNLP
  * Pina and Johansson, 2014;
  * Wu and Giles, 2015;
    * ...using wikipedia
  * Liu+ 2015
    * Yang Liu, Zhiyuan Liu, Tat-Seng Chua, and Maosong Sun
    * Topical word embeddings
    * AAAI 2015
* We find
  2. Some of the improvements for multi-sense embeddings are no longer visible
     when using more sophisticated neural models like LSTMs which have more
     flexibility in filtering away the informational chaff from the wheat
  4. the most straightforward way to yield better performance on these tasks is
     just to increase embedding dimensionality

# 2 Related Work p2

* Reisinger and Mooney (2010) and Huang+ (2012)
  * pre-clustering the contexts of each token to create a fixed number of senses
* Neelakantan+ (2014)
  * words may have different number of senses
  * a threshold to decide when a new sense cluster should be split off
* Liu+ (2015) learns
  * sense/topic specific embeddings by
  * combining neural frameworks with LDA topic models
* Wu and Giles (2015) disambiguate sense embeddings from Wikipedia
  * by first clustering wiki documents
* Chen+ (2014)
  * a distinct representation for every sense defined by the Wordnet dictionary
* Qiu+ (2014) who maintains
  * separate representations for different part-of-speech tags of the same word

# 3 Learning Sense-Specific Embeddings p2

* Chinese Restaurant Processes (CRP) (Blei+ 2004; Teh+ 2006)
  * have been applied in the related field of word sense induction
  * decision is made by measuring
    * semantic relatedness ... and
    * the number of customers already sitting at that table

# 3.1 Chinese Restaurant Processes

* can be viewed as a practical interpretation of
  * Dirichlet Processes (Ferguson, 1973) for nonparametric clustering

```
Pr(t_w = t) ∝
  N_t P (w|d t ) if t already exists
  γP (w|d new ) if t is new
```

where
  * `N_t` denotes the number of customers already sitting at table t
    * useful “rich get richer” property
  * `P(w|d_t )`: probability of assigning the current data point to cluster `d_t`
  * γ: hyper parameter controlling the preference for sitting at a new table

# 3.2 Incorporating CRP into Distributed Language Models

* footnote 2:
  * models that predict succeeding words ...  models that predict words using
    both left and right contexts
* once the sense label is decided (line7), the model will adjust the embeddings
  for neighboring words, both global word vectors and sense-specific vectors

# 4 Obtaining Word Representations for NLU tasks p4

* decide sense labels for tokens in context
  * inference procedure for sense labels where
    * all global word embeddings and sense-specific embeddings are kept fixed
* Greedy Search
  * Assign each token the locally optimum sense label and represent the current
    token with the embedding associated with that sense
* Expectation
  * Compute the probability of each possible sense for the current word, and
    represent the word with the expectation vector:

# 5 Word Similarity Evaluation p4

* the standard artificial task for matching human word similarity judgments
* Early work used similarity datasets like
  * WS353 (Finkelstein+ 2001) or
  * RG (Rubenstein and Goodenough, 1965), whose
  * context-free nature makes them a poor evaluation
* We adopt
  * Stanford’s Contextual Word Similarities (SCWS) (Huang+ 2012)
  * words in context

# 6 Experiments on NLP Tasks

# 6.1 The Tasks

* NER
* POS
* Sentence-level Sentiment Classification (Pang+ 2002)
* Sentiment Analysis–Stanford Treebank
* Semantic Relationship Classification
  * SemEval-2010 Task 8 (Hendrickx+ 2009)
* Sentence Semantic Relatedness

# 6.2 Discussions

* EXPECTATION can be viewed as another form of one-word-one-vector models,
  just one where different senses are entangled but weighted to emphasize the
  important ones

# 7 Conclusion p8

# 8 Appendix

* represent the input at a sentence or phrase level
  * In sentiment classification and sentence semantic relatedness tasks,
  * classification models require embeddings that
    * represent the input at a sentence or phrase level
  * We adopt
    * recurrent networks (standard ones or LSTMs) and
    * recursive networks
