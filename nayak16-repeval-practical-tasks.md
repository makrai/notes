Evaluating Word Embeddings
  Using a Representative Suite of Practical Tasks
Neha Nayak, Gabor Angeli, Christopher D. Manning
2016 repeval

http://www.wordvectors.org

# 1 Intro

* certain embeddings may excel at
  * syntactic tasks, or on sequence modeling tasks, whereas others may capture
  * semantics of a word better, or work better for classification tasks

# 3 Motivation

* extrinsic evaluation remains the de-facto proving ground for novel [embeds]
  * Pennington+ 2014;
  * Dhillon+ 2012)
    Paramveer Dhillon, Jordan Rodu, Dean Foster, and Lyle Ungar
    Two step cca: A new spectral method for estimating vector models of words
    arXiv preprint arXiv:1206.6403
* we opt to use uncontroversial off-the-shelf neural models for each task
* Although none of the models achieve SOTA results, we only care about relative
  scores
* [we] minimize the number of hyperparameters

# 4 Tasks

* syntactic properties of the word embeddings
  * Part-of-speech tagging is carried out on the
    * WSJ dataset described in Toutanova+ (2003)
    * In order to simplify the task and avoid hand-coded features, we evaluate
    against the universal part-of-speech tags proposed in Petrov+ (2012)
  * For chunking, we use the dataset from the
    * CoNLL 2000 shared task (Tjong Kim Sang and Buchholz, 2000), derived from
    the Wall Street Journal
* Four tasks test the semantic properties of the word embeddings
  * word level: 4-class Named Entity Recognition task, PERSON, LOC, ORG, MISC,
  * the CoNLL 2003 dataset (Tjong Kim Sang and De Meulder, 2003), and IOB
  * sentence level, we include two tasks –
    * binary sentiment classification using the Stanford Sentiment Treebank
    dataset, and the
    * coarse-grained question classification task described in
      Li and Roth (2006).  Finally,
  * above the word level, phrase-level natural language inference, derived from
    a dataset presented in Ganitkevitch+ (2013)
    * Juri Ganitkevitch, Benjamin Van Durme, and Chris Callison-Burch. 
      PPDB: The paraphrase database
      HLT-NAACL 2013

# 5 Models

* For tasks with word-level labeling, we use a
  window-based model akin to that in Collobert+ (2011)
  * Features for each token in a sequence are constructed
    by concatenating the word embeddings [in a window] centered on the token
  * two-layer neural network, followed by a softmax classifier
* For tasks with sentence-level labeling, sentence representations are
  constructed using a basic LSTM. Classification is then carried out by passing
  through a one-layer neural network, followed by a softmax classifier
* the NLI task requires representations for both the premise and hypothesis
  * Embeddings for each sequence are constructed as described in the sentence
    embedding tasks, using two separate LSTMs. These embeddings are
    concatenated, and similarly passed through a onelayer neural network and
    softmax classifier

# 6 Evaluation metrics

* F1 score for NER, and accuracy for the rest of the tasks
* the primary metric we report is not accuracy or F 1 , but rather the relative
  error reduction as compared to the SVD baseline.  This allows us to calculate
  a meaningful aggregate, averaging relative error reduction over tasks
* For backwards compatibility with prior work, we also report correlations on
  WordSim-353, as well as precision at 1 for the analogy task presented in
  Mikolov+ (2013)

# 7 Experimental methodology
