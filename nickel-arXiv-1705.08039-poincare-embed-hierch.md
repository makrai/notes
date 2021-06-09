Poincaré Embeddings for Learning Hierarchical Representations
Maximilian Nickel and Douwe Kiela
https://arxiv.org/abs/1705.08039

# Abstract

* we introduce a new approach for learning hierarchical representations of
  symbolic data by embedding them into hyperbolic space – or
  * more precisely into an n-dimensional Poincaré ball
* parsimonious representations
  * simultaneously capturing hierarchy and similarity
* efficient algorithm to learn the embeddings based on Riemannian optimization

# Intro

* symbolic data such as text, graphs and multi-relational data
  * word embeddings such as Word2vec [17], GloVe [23] and FastText [4]
  * embeddings of graphs
    * such as
      * latent space embeddings (Hoff+ 2002)
      * NODE2VEC (Grover and Leskovec. 2016) and
      * DeepWalk (Perozzi, Al-Rfou, and Skiena. 2014)
    * applications for community detection and link prediction in social netwks
  * Embeddings of multi-relational data such as
    * RESCAL [19], TransE[6], and Universal Schema [27] are being
      [27] Sebastian Riedel, Limin Yao, Andrew McCallum, and Benjamin M Marlin.
      Relation extraction with matrix factorization and universal schemas
      NAACL-HLT 2013
    * used for knowledge graph completion and information extraction
* power-law distributions in datasets can often be traced back to hierarchical
  structures [25]
  * examples ... include natural language and scale-free networks such as
    social and semantic networks (Steyvers and Tenenbaum. 2005)
  * many real-world networks exhibit an underlying tree-like structure
    (Adcock+ 2012)
* any finite tree can be embedded into a finite hyperbolic space such that
  distances are preserved approximately [10]
  * a particular model of hyperbolic space, i.e., the Poincaré ball model
    * well-suited for gradient-based optimization
* Experimentally, we show that our approach can provide
  * high quality embeddings of large taxonomies ... with and without missing
    data
  * embeddings trained on WordNet provide SOTA performance for lex entailment
  * On collaboration networks, ... in predicting links in graphs
* organized as follows:
  2. hyperbolic geometry and ... related work [on] hyperbolic embeddings
  3. introduce Poincaré embeddings and discuss how to compute them
  4. evaluate our approach

# 2 Embeddings and Hyperbolic Geometry

* hyperbolic space has recently been considered to model complex networks.  For
  * hyperbolic geometry for greedy routing in geographic communication
    networks (Kleinberg 2007)
  * hyperbolic embeddings of the AS Internet topology [and] greedy shortest
    path routing (Boguñá 2010)
  * Krioukov+ [16] developed a framework to model complex networks
    * typical properties such as heterogeneous degree distributions and strong
      clustering emerges
  * Adcock+ [1] proposed a measure based on Gromov’s δ-hyperbolicity [10]
    to characterize the tree-likeness of graphs
* in ML, in addition to the methods discussed in Section 1,
  * Paccanaro and Hinton (2001) proposed one of the first embedding methods to
    learn from relational data
  * More recently, Holographic [21] and Complex Embeddings [29] have shown
    state-of-the-art performance in Knowledge Graph completion
  * In relation to hierarchical representations, Vilnis and McCallum [31]
    proposed to learn density-based word representations
  * Given [hierarchical relations,] Vendrov+ [30] proposed Order
    Embeddings to model visual-semantic hierarchies over words, sentences, and
    images

# 3 Poincaré Embeddings

* we consider the task of inferring the hierarchical relationships fully
  unsupervised,
* Geodesics in B d are then circles that are orthogonal to ∂B (as well as all
  diameters)
* In our method, we [use dim > 2] for two main reasons:
  * multiple latent hierarchies can co-exist
  * decrease the difficulty for an optimization method to find a good embedding

## 3.1 Optimization

* scales well to large datasets, as the
  * computational and memory complexity of an update depends linearly on the
    embedding dimension.  Moreover, the algorithm is
  * straightforward to parallelize via methods such as Hogwild [26], as the
    updates are sparse (only a small number of embeddings are modified in an
    update) and collisions are very unlikely on large-scale data

# 4 Evaluation

* **Translational [distance]** For asymmetric data, we also include the score
  function `d(u, v) = |u − v + r|^2` , as proposed by Bordes+ [6] for
  modeling large-scale graph-structured data. For this score function, we also
  learn the global translation vector r during training
  * has, due to its asymmetry, more information about the nature of an
    embedding problem than a symmetric distance when the order of (u, v)
    indicates the hierarchy of elements. This is, for instance, the case for
    is-a(u, v) relations in taxonomies

## 4.3 Lexical Entailment

* outperforms all state-of-the-art methods evaluated in
  * Vulić, Daniela Gerz, Douwe Kiela, Felix Hill, and Anna Korhonen
    Hyperlex: A large-scale evaluation of graded lexical entailment
    arXiv preprint arXiv:1608.02117, 2016
* achieved a state-of-the-art accuracy of 0.86 on W BLESS [33, 14], which
  evaluates non-graded lexical entailment

# 5 Discussion and Future Work

* future work, we intend, to both expand the applications of Poincaré
  * multi-relational data
  * models that are tailored to specific applications such as word embeddings
    * Furthermore, we have shown that already
      produces very good embeddings and scales to large datasets
* a full Riemannian optimization [instead of] natural gradient based optim
    * can further increase the quality ... and lead to faster convergence
