Joseph Reisinger and Raymond J. Mooney
Multi-Prototype Vector-Space Models of Word Meaning
2010

# 1 Introduction

* unsupervised word sense discovery (WSD) (Schütze, 1998)
  * clusters the contexts in which a word appears

# 2 Background

* In previous work, vector-space lexical similarity and word sense discovery
  have been treated as two separate tasks
* Psychological concept models
* multi-prototype vector space model for lexical semantics ... that
  * generalizes
    * prototype (K = 1) and
    * exemplar (K = N , the total number of instances)
  * widely studied in the Psychology literature
    * Griffiths et al., 2007;
      * TL Griffiths, KR Canini, AN Sanborn, and Daniel.  J.  Navarro
      * Unifying rational models of categorization
        * via the hierarchical Dirichlet process
      * 2007 In Proc. of CogSci-07
    * Love et al., 2004;
      * Bradley C. Love, Douglas L. Medin, and Todd M.  Gureckis
      * 2004. Psych. Review, 111(2):309–332
      * SUSTAIN: A network model of category learning
    * Rosseel, 2002)
      * Yves Rosseel. 2002. Mixture models of categorization
      * J. Math. Psychol., 46(2):178–210
* Unsupervised word-sense discovery
  * Agirre and Edmond, 2006;
    * Eneko Agirre and Phillip Edmond. 2006
    * Word Sense Disambiguation: Algorithms and Applications
      * (Text, Speech and Language Technology)
    * Springer-Verlag New York, Inc., Secaucus, NJ, USA
  * Schütze, 1998
    * Hinrich Schütze. 1998
    * Automatic word sense discrimination
    * Computational Linguistics, 24(1):97–123
  * Most work has also focused on corpus-based distributional approaches,

# 3 Multi-Prototype Vector-Space Models

# 3.1 Clustering Occurrences

* clusters correspond to _..._
  * we do not assume that clusters correspond to traditional word senses
  * Rather, we only rely on clusters to capture meaningful 
    variation in word usage
* clustering
  * method
    * a mixture of von Mises-Fisher distributions (movMF) clustering method
      with first-order unigram contexts (Banerjee et al., 2005)
  * Feature vectors v(c) are
    * composed of individual features I(c, f ), taken as all unigrams occurring
      f ∈ F in a 10-word window around w
  * movMF compared to spherical k-means (Dhillon and Modha, 2001)
    * both [use] cosine similarity
    * movMF introduces an additional per-cluster concentration parameter
      * controlling its semantic breadth, allowing it to more accurately 
        model non-uniformities in the distribution of cluster sizes
    * preliminary experiments comparing various clustering methods
      * movMF gave the best results

# 4 Experimental Evaluation

* comparisons to human judgements of semantic similarity for
  * both isolated words as well as words in sentential contexts

# 5 Discussion and Future Work

* ways it could be improved
  * Feature representations
  * Nonparametric clustering
  * Cluster similarity metrics
  * Comparing to traditional senses
    * Compared to WordNet, 
      our best-performing clusterings are significantly more fine-grained
  * Joint model

# 6 Conclusions
