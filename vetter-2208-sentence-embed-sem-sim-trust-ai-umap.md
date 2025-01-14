Using Sentence Embeddings and Semantic Similarity for Seeking Consensus when Assessing Trustworthy AI
Dennis Vetter, Jesmin Jahan Tithi, Magnus Westerlund, Roberto V. Zicari, Gemma Roig
arXiv:2208.04608 [cs.IR]

# Abstract

* Assessing the trustworthiness of artificial intelligence is interdisciplinary
  * diff concepts and words with different meanings, or even use the same words
  * challenge: identify when experts from different disciplines talk about the
    same problem but use different terminologies. In other words, the problem
    * group problem descriptions (a.k.a. issues) with the same semantic meaning
* we show how we employe sentence embeddings and semantic textual similarity,
  * domain: assessing the trustworthiness of an AI system used in healthcare.

## 2.3

* In our use-case, feature extraction is performed by creating sentence embeds
  * dimensionality reduction, as clustering algorithms are known to have
    problems when working with high-dimensional vectors. We used UMAP [22] to

## 3.3

* The best results were achieved with a two-step dimensionality reduction with
  * from 768 dimensions of the sentence embeddings to 15 and then to 2.
  * clustering with the HDBSCAN algorithm [29], as this algorithm can find a
    good number of clusters from the data and does not need the desired number
