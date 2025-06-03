R Navigli SOFSEM 2012: Theory and practice of computer …, 2012 Springer
A quick tour of word sense disambiguation, induction and related approaches

# Introduction

* see [53] for a complete survey
  * Navigli, R.: Word Sense Disambiguation: A survey. ACM Computing Surveys
    2009
* organization
  * Sections 2 and 3 we illustrate the main topics in WSD and WSI, resp
  * Section 4 we introduce the lexical substitution approach
  * Section 5 we discuss other techniques for text understanding
  * concluding remarks in Section 6.

# 3 Word Sense Induction p7

## 3.1 Techniques

* Context clustering:
* Word clustering:
  * Lin’s algorithm [36], which exploits syntactic dependencies
  * Clustering By Committee [64] also uses syntactic contexts, but exploits a
    similarity matrix to encode the similarities between words and relies on
    the notion of committees
* Co-occurrence Graphs:
  * However, successful approaches such as HyperLex [75] – a graph algorithm
    based on the identification of hubs in co-occurrence graphs – have to cope
    with the need to tune a large number of parameters [2].  To deal with this
    issue a graphbased algorithm has recently been proposed which is based on
    simple graph patterns, namely triangles and squares [54]. The patterns aim
    at identifying meanings using the local structural properties of the
    co-occurrence graph.
* Probabilistic clustering
  * generative model. First, for each ambiguous word a distribution of senses
    is drawn.  Then, context words are generated according to this
    distribution. Different senses can thus be obtained which have different
    word distributions.
* approach based on latent semantic word spaces [11], which finds latent
  dimensions of meaning using non-negative matrix factorization, uses these
  dimensions to distinguish between different senses of a target word, and then
  proceeds to disambiguate each given instance of that word.
  * 11
    * de Cruys, T.V., Apidianaki, M.:
    * Latent semantic word sense induction and disambiguation
    * ACL 11

## 3.2 Evaluation
* a specific instance of clustering
* Unsupervised evaluation
* Supervised evaluation:
  * the output of WSI is evaluated in a WSD task
* Within an application:

# 6 Conclusion

* improve the state of the art in fields such as search result clustering
  [54,13] and lexicography [20].
