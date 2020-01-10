Inducing Language Networks from Continuous Space Word Representations
Bryan Perozzi, Rami Al-Rfou, Vivek Kulkarni, Steven Skiena
2014 Complex Networks

* We explore two techniques to create language networks from learned features
* for two popular word representation methods
  * Polyglot and SkipGram
* induced networks differ from other methods of creating language networks
* meaningful community structure. 

#2 Continuous Space Language Models

##2.1 Polyglot

* [learning] procedure similar to the one proposed by Collobert et al.  [11]

#3 Word Embedding Networks

* desirable properties for a language network. Specifically, we are seeking to
  1. Is Connected
  2. Has Low Noise - Minimizing the spurious correlations 
  3. Has Understandable Clusters
* distance in the embedding ... we found that Euclidean distance worked well.
* We 
  * examine two approaches for constructing graphs from word embeddings, 
  * induce networks for the 20, 000 most frequent words

##3.1 k-Nearest Neighbors

* we convert it to an undirected one.
* few disconnected components, even for small values of k. In addition, 
* there is an obvious GCC which quickly emerges. 
* In this way, the embeddings are similar to the network induced on random
  points (which is fully connected at k = 2). We performed an investigation of
* smaller connected components when k was small, and found them to contain
  dense group[s] with very similar usage characteris- tics e.g. Roman numerals
* clustering coefficient initially grows quickly as we add edges to our network
  (k ≤ 6), but has leveled off by (k = 20).  This tendency to 
  * bridge new clusters together, rather than just expand existing ones, 
  * may be related to the 
    instability of the nearest neighbor (Beyer+ 99) in high dimensional spaces
    * K. Beyer, J. Goldstein, R. Ramakrishnan, and U. Shaft. 1999
    “When is “nearest neighbor” meaningful?” In: Database Theory—ICDT Springer
* highly modular community structure.

##3.2 d-Proximity

* link each word to all those within a fixed distance d of it
* We find that [these] networks ... do not bridge distant groups together. They
  * large number of connected components
* number of connected components is closely related to the average distance
  * (around d =(3.25, 3.80, 2.28) for (SkipGram, Polyglot, Random)). 
* we add triangles at a fast rate than using the k-NN method
