The Curse of Dense Low-Dimensional Information Retrieval for Large Index Sizes
Nils Reimers, Iryna Gurevych
arXiv:2012.14210 [cs.IR]

# Abstract

* InfoRetrieval using dense low-dimensional representations
  recently became popular and out-performed traditional sparse-reprs like BM25
  * hE, no previous work on how dense reprs perform with large index sizes
  * We show theoretically and empirically that the
    performance for dense representations decreases quicker than sparse reprs
    for increasing index sizes
  * In extreme cases, this can even lead to a tipping point (index size)
    where sparse representations outperform dense representations
  * tightly connected to the number of dimensions of the representations: The
    lower the dimension, the higher the chance for returning false positives
* from the conclusion:
  * The empirically found error rates far exceeded the mathematical lower-bound
    * indicating that
      only a small fraction of the available vector space is effectively used

# 1 Introduction

* Information retrieval
  * traditionally sparse representations like TF-IDF or BM25
    * suffer from the lexical gap problem (Berger+ 2000)
  * dense representations have been proposed (Gillick+ 2018):
    * Queries and documents are mapped to a dense vector space and e.g. cosine
    * Out-performance over sparse lexical approaches for various datasets
      (Gillick+ 2018; Guo+ 2020; Guu+ 2020; Gao+ 2020)
    * Previous work only for fixed, rather small indexes
      * The largest dataset where it has been shown is the
        MS Marco (Bajaj+ 2018) passage retrieval dataset, where retrieval is
        done over an index of 8.8 million text passages
    * in production scenarios, index sizes quickly reach 100 millions of docs
* with a larger index of several million documents, the sparse approach can
  outperform the dense approach

# 2 Related Work

* dense retrieval: finetune a transformer network like BERT (Devlin+ 2018) on a
  given training corpus with queries and relevant documents
  (Guo+ 2020; Guu+ 2020; Gao+ 2020; Karpukhin+ 2020; Luan+ 2020). Recent work
* combining dense approaches with sparse, lexical approaches can further boost
  (Luan+ 2020; Gao+ 2020). While the approaches have been
  * tested on various information and question answering retrieval datasets, the
  * only evaluated on fixed, rather small indexes
    * Guo+ (2020) evaluated approaches for eight different datasets having index
      sizes between 3k and 454k documents
* Luan+ 2020 systematically studies the connection between encoding size and
  document length for dense approaches

# Theory

* approximate nearest neighbor (ANN) index methods as implemented in FAISS are
  * As ANN introduces another source of error, we consider in this paper only
    exact search. The shown results are transferable for ANN
* Using as few dimensions as possible is desirable, as it
  * decreases the memory requirement to store (an index) of millions of vectors
  * faster retrieval. However, as we show, lower-dimensional representations
    work well only for smaller index sizes. The larger the index, the better it
    is to use more dimensions
* a low dimensional representation might work well for small index sizes
  * hE, with more indexed documents, the probability of false positives
    increases faster for low dimensional representations than for higher dim
    * Hence, at some index size, higher dimensional representations might
      outperform the lower-dimensional representation
