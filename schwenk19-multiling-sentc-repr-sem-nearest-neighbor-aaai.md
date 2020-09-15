Analysis of Joint Multilingual Sentence Representations and 
                                              Semantic K-Nearest Neighbor Graphs
Holger Schwenk, Douwe Kiela, Matthijs Douze
The Thirty-Third AAAI Conference on Artificial Intelligence (AAAI-19)

## 3.2 Creating the multilingual k-nn graph

* is very unlikely to find similar long sentences.
* For each sentence, we create the k-nn graph by finding the 20 closest
  sentences in the embedding space, i.e., k=20. These k closest sentences can
  come from different languages 
  * the highly optimized FAISS library for efficient similarity search and
    clustering of dense vectors (Johnson, Douze, and Jégou 2017). 6 FAISS is
    mainly used for indexing and searching in huge image collections, but it can
    operate on any type of ob-
* PCA ... is unlikely to offer space reductions larger than 10 times. After
  * we found a good compromise with the following setting: the collection of
    vectors is split up with k-means into 16 384 well-balanced clusters, and
    compressed with OPQ (Ge+ 2013) to 32 bytes
  * By these means, we were able to reduce the storage requirement of the index
    over the 566M sentences to 22 GB, i.e. a hundred times smaller than all the
* The k-nn graph is built in bruteforce fashion: each vector in turn is used as
