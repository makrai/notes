Dependency Based Embeddings for Sentence Classification Tasks
Alexandros Komninos, Suresh Manandhar
NAACL 2016

Our embeddings and code are available at https://www.cs.york.ac.uk/nlp/ extvec

# Abstract

* We compare different word embeddings from a
  * standard window based skipgram model, a
  * skipgram model trained using dependency context features and a
  * skipgram variant that utilizes additional information from dependency
* for word similarity and sentence classification tasks. We consider
  * three common sentence classification tasks:
    * question type classification on the TREC dataset,
    * binary sentiment classification on Stanford’s Sentiment Treebank and
    * semantic relation classification on the SemEval 2010 dataset.  For each
* three different classification methods: a
  * Support Vector Machine, a
  * Convolutional Neural Network and a
  * Long Short Term Memory Network
* dependency based embeddings outperform standard window based embeddings in
  most of the settings, while using dependency
  * context embeddings as additional features improves performance in all tasks

# 5 Sentence Classification

# 5.3 Datasets and Results

# 5.3.3 SemEval 2010 Relation Identification task (Hendrickx+ 2009) considers

* classification of semantic relations between pairs of nominals into 9 x 2 + 1
* 9 types of relations (e.g.  cause-effect, component-whole, ...) with
  directionality taken into account and an extra OTHER class.
* We only used the shortest dependency path between the two nominals as the
  input to classifiers.  In table 4, we report results using the official
* macro-averaged F1-Score for (9+1)-way classification, taking directionality
