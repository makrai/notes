Top2Vec: Distributed Representations of Topics
Dimo Angelov
Cite as: 	arXiv:2008.09470 [cs.CL]

https://github.com/ddangelov/Top2Vec

# Abstract

* Topic modeling is used for discovering latent semantic structure in a large
  collection of documents
* The most widely used methods are probabilistic generative models
  * Latent Dirichlet Allocation and Probabilistic Latent Semantic Analysis
  * weaknesses
    * often require the number of topics to be known,
    * custom stop-word lists, stemming, and lemmatization. Additionally these
    * bag-of-words representation of documents which ignore the ordering
* Distributed representations of documents and words have gained popularity
* 𝚝𝚘𝚙𝟸𝚟𝚎𝚌 leverages joint document and word semantic embedding, find topic vec
  * not require stop-word lists, stemming or lemmatization, and it
    automatically finds the number of topics
  * topic vectors are jointly embedded with the document and word vectors with
* experiments demonstrate that 𝚝𝚘𝚙𝟸𝚟𝚎𝚌 finds topics which are significantly
  more informative and representative of the corpus trained on than
  probabilistic generative models

# 2 Model Description

## 2.2 Find Number of Topics

* In order find the dense areas of documents in the semantic space,
  density based clustering is used on the document vectors, specificall HDBSCAN
  * hE, the "curse of dimensionality" introduces two main problems
    * In the high-dimensional semantic embedding space is very sparse. The
    * difficult to find dense clusters and doing so comes at a
    * high computational cost [28]. In order to alleviate these two problems,
    * we perform dimension reduction on the document vectors with UMAP [29, 30]

### 2.2.1 Low Dimensional Document Embedding

* UMAP has several hyper-parameters
  * Perhaps the most important parameter is the number of nearest neighbours,
    which controls the balance between preserving global structure versus local
    * Larger values put more emphasis on global over local structure
    * Since the goal is to find dense areas of documents which would be close
      to each other in the high dimensional space, local structure is more
      important in this application.  We find that setting number of nearest
    * 15 gives the best results, as this value gives more emphasis on local
  * Another related parameter is the distance metric, which is used to measure
    the distance between points in the high dimensional space. The often used
    distance metric for the document vectors is cosine similarity [8, 9],
  * embedding dimension must be chosen
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
