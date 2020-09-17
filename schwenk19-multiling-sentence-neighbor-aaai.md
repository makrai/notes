Analysis of Joint Multilingual Sentence Representations and
Semantic K-Nearest Neighbor Graphs
Holger Schwenk, Douwe Kiela, Matthijs Douze
The Thirty-Third AAAI Conference on Artificial Intelligence (AAAI-19)

# 1 Introduction

* how dense are the k nearest neighbors?

# 2 related work

# 3 approach for learning a multilingual joint sentence representation space 2
and describe efficient ways to calculate an k-nn graph over 566M sentences

## 3.1 Multilingual sentence representations

## 3.2 Creating the multilingual k-nn graph

* removal of sentences with 
  * email addresses or references to WEB pages, and
  * less than 4 or more than 60 words. This is motivated by the fact that 
    it is very unlikely to find similar long sentences. This totals to 566M
    sentences and roughly 10 billion words (see Table 1). For each sentence, we
* the k-nn graph by finding the 20 closest sentences in the embedding space,
  * These k closest sentences can come from different languages
* sentence embeddings are of dimension 1024 and are stored as floating point
  * A brute force approach to obtain the k-nn graph, 
    i.e., calculating the L 2 -distance between all vectors and 
    keeping the k smallest values, 
    would require at least 566M 2 × 1024 ≈ 3.3 × 10 20 floating point op
* We tackle this computational challenge with the 
  highly optimized FAISS library for efficient similarity search and clustering
  of dense vectors (Johnson, Douze, and Jégou 2017). 6 FAISS is 
  * mainly used for indexing and searching in huge image collections, but it
* setting: the collection of vectors is split up with k-means into 16 384
  well-balanced clusters, and compressed with OPQ (Ge+ 2013) to 32 bytes.  This
  * “OPQ32,IVF16384,PQ32” in FAISS terms
  * we reduce the storage requirement: a hundred times smaller than the embed.
* The k-nn graph is built in bruteforce fashion: 
  each vector in turn is used as a query. 
  * To query a vector, a subset of 512 clusters is visited and 
    queryto-distance codes are computed without decompressing the codes 
    (Jegou, Douze, and Schmid 2011)

# 4 qualitative analysis of the learned representations 3

# 5 quantitative results, including comparison with other works

# 6 conclude this paper with directions for future research
