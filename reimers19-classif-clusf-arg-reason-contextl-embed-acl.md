Nils Reimers, B Schiller, T Beck, J Daxenberger, C Stab, I Gurevych
Classification and Clustering of Arguments [érvek] with Contextualized W Embeds
ACL 2019

Code and models available:
https://github.com/UKPLab/acl2019-BERT-argument-classification-and-clustering

# Abstract

* We experiment with ... ELMo and BERT)
* of open-domain argument search. For the first time, we show how to leverage
* classify and cluster, [impressive results on both tasks and] multiple dataset
  * classification, we improve the SOTA for the
    * UKP Sentential Argument Mining Corpus by 20.8 percentage points and for
    * IBM Debater Evidence Sentences dataset by 7.4 percentage points.  For
* clustering,
  * we propose a pre-training step which improves by
    * we introduce a novel corpus on aspect-based argument clustering
      * 7.8 percentage points over strong baselines
    * 12.3 percentage points for the Argument Facet Similarity (AFS) Corpus

#1 Intro

* Argument mining methods have been applied to different tasks such as
  * reasoning structures (Stab and Gurevych, 2014), assessing the
  * quality of arguments (Wachsmuth+ 2017), or
  * linking arguments from different documents (Cabrio and Villata, 2012)
* approach argument mining from the
  * discourse-level perspective (aiming to analyze local argumentation)
    * single documents or document collections (Eger+ 2017),
  * open-domain argument search aka. information-seeking perspective
    * seeking arguments relevant to a topic
    * heterogeneous sources and topics (Shnarch+ 2018) and also face
    * the problem of redundancy ...  calls for a subsequent clustering step,
    * aggregate similar arguments for the same topic
    * this work
* example of arguments ...  differently phrased
  1. The ultimate goal is fast, affordable, open Internet access for everyone,
  2. If this does not happen, ... only users able to pay for privileged access
* Contextualized word embeddings, especially
  * ELMo (Peters+ 2018) and BERT (Devlin+ 2018) could offer a viable solution
* We thus analyze ELMo and BERT in a cross-topic scenario for the tasks of
  argument classification and clustering
* We frame the problem of open-domain argument search as a combination of
  topic-dependent argument classification and clustering and discuss

# 2 Related work

## Argument Classification

* identify topic-related, sentence-level arguments from (heterogeneous) docs
* Ran Levy, Yonatan Bilu, Daniel Hershcovich, Ehud Aharoni, and Noam Slonim
  2014. Context dependent claim detection. In Proceedings of COLING 2014, the
* Rinott+ (2015) : a pipeline of feature-based models that
  find and rank supporting evidence from Wikipedia for the CDCs. However,
* Shnarch+ (2018)
  * automatically generated training sets + manually annotated data as init
  * BiLSTM with GloVe embeddings and integrate the topic via attention
* Stab+ (2018b) deploy a modified LSTM-cell that is able to integrate topic

### Argument Clustering

* Previous research in this area mainly used feature-based approaches in
  combination with traditional word embeddings like word2vec or GloVe
  * Boltužić and Šnajder (2015) applied hierarchical clustering [on a two-side]
  * Wachsmuth+ (2018) experimented with different word embeddings techniques
  * Misra+ (2016) presented a new corpus on argument similarity on 3 topics
    * Support Vector Regression model using different hand-engineered features
  * Trabelsi and Zaı̈ane (2015) used an augmented LDA to [ extract ] expressions
    * constrained clustering to group similar viewpoints of topics
* we apply ... a dataset containing both relevant and non-relevant arguments
  for a large number of different topics which is ... more realistic

## Contextualized word embeddings compute a representation for a target word

* ELMo (Embeddings from Language Models Peters+)
  * character-based CNN with two bidirectional LSTM layers. The ELMo
    representation is then derived from all three layers
* BERT (Bidirectional Encoder Representations from Transformers) uses a
  * deep transformer network (Vaswani+ 2017) with 12 or 24 layers to derive
  * two new pre-training objectives:
    the “masked language model” and the “next sentence prediction” objectives
    * They [fine-tune] for sentence classification and sentence-pair classif

# 3 the four different datasets used in this work in Section 3, before we

# 4 classification and

# 5 clustering 6

## 5.1 Clustering Method

* We use agglomerative hierarchical clustering (Day and Edelsbrunner, 1984) to
  * average linkage criterion to compute the P similarity P between two
  * stopping threshold which is determined on the train set
* We also tested the k-means and the DBSCAN clustering algorithms, but we found
  that agglomerative clustering generally yielded better performances in
  preliminary experiments
* We propose and evaluate various similarity metrics in two setups

## 5.2 Experimental Setup
