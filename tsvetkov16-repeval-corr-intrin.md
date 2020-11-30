Yulia Tsvetkov, Manaal Faruqui, Chris Dyer
Correlation-based Intrinsic Evaluation of Word Vector Representations
2016 repeval

# Abstract

* We introduce QVEC CCA
  * an intrinsic evaluation metric for word vector[s]
    based on correlations of learned vectors
    with features extracted from linguistic resources
  * an effective proxy for a range of extrinsic semantic and syntactic tasks

# Intro

* vector-space representations ... as features in downstream applications
  * Turian+ 2010
    Joseph Turian, Lev Ratinov, and Yoshua Bengio. 2010 ACL
    Word representations:
      a simple and general method for semi-supervised learning
  * Lazaridou+ 2013
    Angeliki Lazaridou, Eva Maria Vecchi, and Marco Baroni. 2013
    Fish transporters and miracle homes:
      How compositional distributional semantics can help NP parsing
  * Socher+ 2013
  * Bansal+ 2014
    Mohit Bansal, Kevin Gimpel, and Karen Livescu.  2014
    Tailoring continuous word representations for _dependency parsing_
  * Guo+ 2014)
    Jiang Guo, Wanxiang Che, Haifeng Wang, and Ting Liu. 2014
    Revisiting embedding features for simple semi-supervised learning
* properties of an intrinsic evaluation measure of word embeddings?
  * computationally efficient intrinsic evaluation that correlates
  * enables interpretation and analysis of [dimensions]
  * a range of related downstream tasks allows to assess generality
* Tsvetkov+ (2015) QVEC
  * correlate distributional word vectors with linguistic word vectors
    constructed from rich linguistic resources, annotated by domain experts
  * can easily be adjusted to specific downstream tasks (e.g., POStagging) 
    by selecting task-specific linguistic resources (e.g., POS annotations).
  * two weaknesses
    * not invariant to linear transformations of the embeddings’ basis, whereas
      the bases in word embeddings are generally arbitrary (Szegedy+ 2014)
    * unnormalized score
      * the more dimensions in the embedding matrix the higher the score
      * This precludes comparison of models of different dimensionality
* this paper, we introduce QVEC-CCA, which simultaneously addresses both
  problems, while preserving major strengths of QVEC

# 2 QVEC and QVEC-CCA

* QVEC
  * Each word vector is a distribution of the word over P linguistic properties,
    based on annotations of the word in the database
  * mxs aligned to maximize the cumulative correlation
    between the aligned dimensions of the two matrices
    * one distributional dimension is aligned to
      at most one linguistic dimension
* QVEC-CCA
  * instead of cumulative dimension-wise correlation we employ
  * canonical correlation analysis (Hardoon+ 2004, CCA)
    * finds two sets of basis vectors, one for X and the other for S,
      such that the correlations between the projections of the matrices onto
      these basis vectors are maximized
  * ensures invariance to the matrices’ bases’ rotation, and since it is a
    single correlation, it produces a score in [−1, 1]

# 3 Linguistic Dimension Word Vectors

* Resources that capture more coarse-grained, general properties can be used
  instead, for example,
  * WordNet for semantic evaluation (Fellbaum, 1998), or
  * Penn Treebank (Marcus+ 1993, PTB) for syntactic evaluation
* Since these properties are not an exact match to the task, the 
  intrinsic evaluation tests for a necessary (but possibly not sufficient) set
  of generalizations

# 4 Experiments

* We first train 21 word vector models:
  * variants of CBOW and Skip-Gram models (Mikolov+ 2013)
  * their modifications CWindow, Structured Skip-Gram, and CBOW with Attention
    (Ling+ 2015b; Ling+ 2015a)
  * GloVe vectors (Pennington+ 2014)
  * Latent Semantic Analysis (LSA) based vectors (Church and Hanks, 1990)
  * and retrofitted GloVe and LSA vectors (Faruqui+ 2015)
* intrinsic
* extrinsic
  * text classification tasks. Our semantic benchmarks are
    * four binary categorization tasks from the 20 Newsgroups (20NG)
    * sentiment analysis task (Socher+ 2013, Senti)
    * metaphor detection (Tsvetkov+ 2014, Metaphor)
  * two syntactic benchmarks
    * POS tagging; we use the LSTM-CRF model (Lample+ 2016), and the
    * dependency parsing (Parse), using the stack-LSTM model of Dyer+ (2015)
* Pearson’s correlation coefficient r

# 5 Conclusion

* future work: exploit existing resources to construct better ling mxs
  * semantic, syntactic, morphological, and
  * typological
    * universal dependencies treebank (Agić+ 2015) and
    * WALS (Dryer and Haspelmath, 2013))
      Chris Dyer, M Ballesteros, Wang Ling, Austin Matthews, Noah A. Smith
      2015
      Transition-based dependency parsing with stack long shortterm memory
  * multilingual resources (e.g., Danish supersenses (Martínez Alonso+ 2015))
