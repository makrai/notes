Top2Vec: Distributed Representations of Topics
Dimo Angelov
arXiv:2008.09470 [cs.CL]

https://github.com/ddangelov/Top2Vec

# Abstract

* Topic modeling is used for discovering latent semantic structure
  in a large collection of documents
* The most widely used methods are probabilistic generative models
  * Latent Dirichlet Allocation and Probabilistic Latent Semantic Analysis
  * weaknesses
    * often require the number of topics to be known,
    * custom stop-word lists, stemming, and lemmatization
    * bag-of-words representation of documents which ignore the ordering
* Distributed representations of documents and words have gained popularity
* 𝚝𝚘𝚙𝟸𝚟𝚎𝚌 leverages joint document and word semantic embedding, find topic vec
  * not require stop-word lists, stemming or lemmatization
  * automatically finds the number of topics
  * topic vectors are jointly embedded with the document and word vectors
* experiments demonstrate that 𝚝𝚘𝚙𝟸𝚟𝚎𝚌 finds topics which are significantly
  more informative and representative of the corpus trained on than
  probabilistic generative models
* hierarchical topic reduction, see the Discussion

# 1 Intro

* organize, search and summarize a large volume of text is a ubiquitous problem
  * Topic modeling is often used
  * discover the latent semantic structure, or topics, present in the documents
  * Topics can then be used to find
    high level summaries of a large collection of documents,
    search for documents of interest, and group similar documents together
* Topics are often thought of as discrete values, such as politics, science
  * hE, any of these topics can be further subdivided into sub-topics
  * a topic like politics can overlap with other topics, such as health
    * both share the sub-topic of health care
  * topics, their combinations or variations can be
    described by a weighted set of words
  => topics are continuous, as there are infinitely many combinations of
  weighted words which can be used to represent a topic
  * each document has its own topic with a value in that continuum
  * topic is the set of weighted words that are most informative
    * can be a combination of the colloquial discrete topics

* the remainder of this sectoin:
  related work and distributed representations of topics

## 1.1 Traditional Topic Modeling Methods

## 1.2 Distributed Representations of Words and Documents

* distributed representation means each concept learned by the network is
  represented by many neurons
  * Each neuron therefore participates in the representation of many concepts
  * generalization of the concepts learned
  * central to learning vector representations of words and documents
* distributional hypothesis, JR Firth
* skip-gram and continuous BOW models [8, 9] known as word2vec
* word2vec embraces the idea of distributional semantics
* skip-gram version of word2vec is implicitly factorizing a word-context PMI mx
  * Shifted Positive PMI word-context representation of words.  This has
  * GloVe [13], which learn context and word vectors by factorizing a global
  * word2vec explicitly maximizes the dot product between word vectors for words
  * non-neural methods achieve results on certain tasks that are on-par with neu
    by replicating hyper-parameters of neural methods like word2vec
    * hE cannot scale to large corpora
* distributed paragraph vector was proposed with doc2vec [17]
  * extends word2vec by adding a paragraph vector to the learning task
  * can learn distributed representations of varying lengths of text, from
    sentences to documents. The doc2vec model outperforms BOW models
  * many works on general language models [19, 20, 21]
    * Devlin+ 2018 Bert: Pre-training of deep bidirectional transformers for NLU
    * Kevin+ 2020 Electra: Pre-training text encoders as discriminators
    * Radford+ 2018 Improving language understanding by generative pre-training

## 1.3 Distributed Representations of Topics

* doc2vec model can learn document and word vectors that are
  jointly embedded in the same space
  * improves the quality of the learned document vectors [18]
  * This property can be used for information retrieval
    * word vectors can be used to query for similar documents
    * find which words are most similar to a document, or most representative
* We argue that
  the semantic space itself is a continuous representation of topics, in which
  each point is a different topic best summarized by its nearest words
  * a dense area of documents can be interpreted as many similar documents
* The top2vec model produces jointly embedded topic, document, and word vectors
  * vector algebra demonstrated with word2vec [8, 9] can be used between the
    word, document and topic vectors

# 2 top2vec: Model Description

## 2.1 Create Semantic Embedding

* To learn jointly embedded document and word vectors we use doc2vec [17, 24]
  * two versions of the model: the Paragraph Vector with Distributed Memory (DM)
    and Distributed Bag of Words (DBOW)
  * DM model uses context words and a document vector to predict the target word
  * DBOW model uses the document vector to predict words within a context window
    in the document
    * a simpler model but it performs better [18]. Our experiments confirm these
* DBOW architecture is very similar to the word2vec skip-gram
  * This similarity allows for the training of the two to be interleaved, thus
    simultaneously learning document and word vectors which are jointly embedded
* hyper-parameters that have a large impact on the performance of doc2vec [18]
  * window size is the number of words left and right of the context word. A
    * 15 has been found to produce the best results [18]
    * [18] Jey Han Lau and Timothy Baldwin
      An empirical eval of doc2vec with practical insights into doc embed gen
      2016 1st Workshop on Representation Learning for NLP, pages 78–86, Berlin,
    * our experiments support. The doc2vec model can use
  * negative sampling or hierarchical softmax as its output layer. These are
    * efficient approximations of the full softmax [9]. We found that
    * in our experiments the hierarchical softmax produces better document vecs
  * sub-sampling threshold, the most important hyper-parameter [18]
    * the probability of high frequency words being discarded from a context win
    * suggested value is 10 5
    * The smaller this number is, the more likely it is for a high frequency
      word to be discarded from the context window [9, 18]
  * minimum count, related to the sub-sampling threshold
    * discards all words that have a total frequency that is less
    * we found 50 to work best, however this value
    * hE largely depends on corpus size and its vocabulary
  * The vector size is the size of the document and word vectors
    * suggested vector size is 300 [18], with larger data sets larger values
  * The number of training epochs suggested by [18] is 20 to 400
    * higher values for smaller data sets
    * We found 40 to 400 training epochs to be a good range

## 2.2 Find Number of Topics

* In order to find the dense areas of documents in the semantic space,
  density based clustering is used on the document vectors, specificall HDBSCAN
* hE, the "curse of dimensionality" introduces two main problems
  * the high-dimensional semantic embedding space is very sparse
  * difficult to find dense clusters
  * high computational cost [28]
  * we perform dimension reduction on the document vectors with UMAP [29, 30]

### 2.2.1 Low Dimensional Document Embedding

* UMAP has several hyper-parameters
* Perhaps the most important parameter is the number of nearest neighbours,
  which controls the balance between preserving global structure versus local
  * Larger values put more emphasis on global over local structure
  * Since the goal is to find dense areas of documents
    which would be close to each other in the high dimensional space,
    local structure is more important in this application
  * 15 gives the best results, as this value gives more emphasis on local
* Another related parameter is the distance metric, which is
  used to measure the distance between points in the high dimensional space
  * often used for the document vectors: cosine similarity [8, 9]
* embedding dimension
  * 5 dimensions give the best results for density based clustering

### 2.2.2 Find Dense Clusters of Documents

* The main hyper-parameter that needs be chosen for HDBSCAN is
  minimum cluster size
* at the core of how the algorithm finds clusters of varying density [26]
* represents the smallest size that should be considered a cluster
* 15 gives the best results in our experiments
* larger values have a higher chance of merging unrelated document clusters

## 2.3 Calculate Topic Vectors

### 2.3.1 Calculate Centroids in Original Dimensional Space

* There are a number of ways that the topic vector can be calculated
  * The simplest method is to calculate the centroid, i.e. the arithmetic mean
  * other reasonable options such as the
    * geometric mean or
    * using probabilities from the confidence of clusters created by HDBSCAN
* these techniques resulted in very similar topic vectors,
  * almost identical nearest-neighbour word vectors
  * may be due to the sparsity of the high dimensional space

## 2.4 Topic Size and Hierarchical Topic Reduction

# 3 Results

## 3.1 Topic information gain and our experiments

* how well the topics describe the documents
* We propose using mutual information [31] to measure the information gained
* topics correspond to words

## 3.2 LDA, PLSA and Top2Vec Topic Information Gain

### 3.2.1 News Groups Dataset

### 3.2.2 Yahoo Answers Dataset

# 4 Discussion

* the semantic space is a continuous representation of topics that
  allows for the calculation of
  * topic vectors from dense areas of highly similar documents,
  * topic size, and for
  * hierarchical topic reduction
  * comparing similarity between words, documents and topics based on distance
* We have proposed a novel method for evaluating topics that
  * uses mutual information to calculate how informative topics are of docs
    * a képletben igazából Kullback-Leibler Divergence
  * measures the amount of information gained about the documents
    when described by their topic words
  * measures both the quality of topic words & the assignment of topics to doc
* Our results show that top2vec consistently finds topics that are
  more informative and representative of the corpus than LDA and PLSA,
  for varying sizes of topics and number of top topic words
* advantages of top2vec over traditional topic modeling methods
  * automatically finds the number of topics and finds
  * topics that are more informative and representative of the corpus
  * stop-word lists are not required to find informative topic words, making it
  * alleviates several challenges of traditional methods that use BOW
* Traditional topic modeling techniques like LDA and PLSA are
  * generative models
  * topics that recreate the original documents word distri with minimal loss
  * This necessitates these models to place uninformative words in topics with
    high probability, as they make up a large proportion of all documents
  * no guarantee that they will find topics that are representative of the corp
  * they can find topics that are extremely specific or overly broad
* the words closest to top2vec topic vectors are the most information words
  * learning task generates joint document and word vectors, which
  * predicts the document a word came from
  * document vectors are placed close to the words
    that are most informative of the documents
  * topic vectors to be calculated from dense areas of those documents
  * topics are the words that are most informative of a document
