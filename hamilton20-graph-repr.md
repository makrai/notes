Graph Representation Learning
William L. Hamilton
2020 Morgan & Claypool Publishers

# Abstract

* relational inductive biases in deep learning architectures are crucial
* graph representation learning, including techniques for
  * deep graph embeddings,
  * generalizations of convolutional neural networks to graph-structured data,
  * neural message-passing approaches inspired by belief propagation
* led to new SOTA results in chemical synthesis, 3D-vision,
  recommender systems, question answering, and social network analysis
* this book: a synthesis and overview of graph representation learning
  * the goals of graph representation learning
  * key methodological foundations in graph theory and network analysis
  * node embeddings, including random-walk based methods and
    applications to knowledge graphs
  * a technical synthesis and introduction to graph neural network (GNN)
  * a synthesis of recent advancements in deep generative models for graphs
    * a nascent, but quickly growing subset of graph representation learning

# Preface

* from 2013, deep learning methods for “embedding” graph-structured data
  * development of the standard graph neural network paradigm 
  * deep generative models of graph-structured data
  * one of the fastest growing sub-areas of deep learning
    * from a small subset of researchers working on a relatively niche topic
* understanding of the methods and theories underlying graph repr learning has
  also stretched backwards through time
  * the “node embedding” methods as well-understood extensions of classic work
    on dimensionality reduction
  * graph neural networks evolved—somewhat independently—from 
    spectral graph theory, harmonic analysis, variational inference, and the
    theory of graph isomorphism
    * historically rich lines of work
    * my attempt to synthesize and summarize these methodological threads in a
      practical way, introduce the reader to the current practice of the field,
      while also connecting this practice to broader lines of historical
      research in machine learning and beyond

# 1 Introduction

* network analysis independent of machine learning is the subject of entire
  textbooks and will not be covered in detail here [Newman, 2018]

## 1.1 What is a graph?

### 1.1.1 Multi-relational Graphs

* one adjacency matrix A τ per edge type. We call such graphs multi-relational,
* the entire graph can be summarized by an adjacency tensor A ∈ R |V|×|R|×|V| ,
* Two important subsets of multi-relational graphs: heterogeneous and multiplex

# 2 Background and Traditional Approaches

* Our tour will be roughly aligned with the different learning tasks on graphs
  * basic graph statistics, kernel methods, and their use for node and graph
    classification tasks
  * measuring the overlap between node neighborhoods
    * the basis of strong heuristics for relation prediction
  * spectral clustering using graph Laplacians
    * one of the most well-studied algorithms for
      clustering or community detection on graphs

## 2.3. GRAPH LAPLACIANS AND SPECTRAL METHODS

* we now turn to
  * the problem of learning to cluster the nodes in a graph
  * motivate the task of learning low dimensional embeddings of nodes

### 2.3.1 Graph Laplacians

L = D A

1. It is symmetric (L T = L) and positive semi-definite: x^T Lx ≥ 0, ∀x ∈ R^|V|
2. The following vector identity holds: `x^T L x = \sum_(u, v) (x[u] x[v])^2`
3. L has |V | non-negative eigenvalues: 0 = λ |V| ≤ λ |V|−1 ≤ ... ≤ λ 1
* Theorem 2. The geometric multiplicity of the 0 eigenvalue of the Laplacian
  L corresponds to the number of connected components in the graph
