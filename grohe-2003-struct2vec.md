word2vec, node2vec, graph2vec, X2vec:
  Towards a Theory of Vector Embeddings of Structured Data
Martin Grohe
arXiv:2003.12590 [cs.LG]

* Vector representations of graphs and relational structures,
  * hand-crafted feature vectors or learned representations,
  * enable us to apply standard data analysis and machine learning techniques to
  * wide range of methods for generating such embeddings have been studied in
    the machine learning and knowledge representation literature. However,
  * relatively little attention from a theoretical point of view.  Starting with
* we
  * a survey of embedding techniques that have been used in practice, in this
  * two theoretical approaches that we see as central for understanding the
  * connections between the various approaches and suggest directions for future

# 1 Introduction

* application areas such as social network analysis, knowledge graphs,
  chemoinformatics, computational biology, etc. Therefore, we need to be
* little work has been done on embeddings of relational data beyond the binary
  relations of knowledge graphs. Throughout the paper, I will try to point out
* we can use vector embeddings, trained to perform well on certain machine
  learning tasks, to define semantically meaningful distance measures on our
  original objects: the distance measure induced by the embedding f
* In this paper, the objects X ∈ X we want to embed either are graphs,
  * possibly labelled or weighted, or more generally relational structures, or
    * graph embeddings or relational structure embeddings;
  * nodes of a (presumably large) graph or more generally elements or
  * tuples appearing in a relational structure. When we embed entire graphs or
    * node embeddings. These two types of embeddings are related, but there are
* The key theoretical questions we will ask about vector embeddings of objects
  in X are the following
  * Expressivity:
    * Which properties of objects X ∈ X are represented by the embedding?
    * What is the meaning of the induced distance measure? Are there geometric
      geo properties of the latent space that represent meaningful relations?
  * Complexity: What is the
    * computational cost of computing the vector embedding?  What are
    * efficient embedding algorithms? How can we
    * efficiently retrieve semantic information of the embedded data, for
      e.g. answer queries?
  * relates to both expressivity and complexity is what dimension to choose for
    * In general, we expect a trade-off between expressivity and dimension, but
    * there may be an inherent dimension of the data set. It is an appealing
    * “natural” data sets appearing on a low dim manifold [98]
      * Then we can regard the dimension of this manifold as the inherent dim
* theoretically Reasonably well-understood are node embeddings of graphs that
  aim to preserve distances between nodes, that is, embeddings f : V (G) → R d
  * where dist G is the shortest-path distance in G
  * substantial theory of such metric embeddings (see [64])
  * In many applications of node embeds, metric embeds are indeed what we need
  * metric is arguably not the most important aspect from a database perspective
* graph embeddings: there is no metric to start with
  * we are concerned with structural vector embeddings of graphs, rel structures
* Two theoretical ideas that have been shown to help in understanding and even
  * Weisfeiler-Leman algorithm and various concepts in its context, and
  * homomorphism vectors, which can be seen as a general framework for defining
    “structural” (as opposed to “metric”) embeddings. We will see that these

# 2 embedding techniques in the LM and KR literature, a very brief survey

# 3 the Weisfeiler-Leman algorithm

* originally a graph isomorphism test, turns out to be
* an important link between the embedding techniques and the theory of homomor-
  phism vectors, which will be discussed in detail in

# 4 the theory of homomorphism vectors (discussed in detail)

# 5 similarity measures for graphs and structures
