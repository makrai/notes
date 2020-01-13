Will Y. Zou, Richard Socher, Daniel Cer, Christopher D. Manning
2013
Bilingual Word Embeddings for Phrase-Based Machine Translation

# Abstract

* bilingual word embeddings
* utilizing MT word alignments to constrain translational equivalence
* significantly out-perform baselines in word semantic similarity
* results of NIST08 Chinese-English machine translation task
  * A single semantic similarity feature induced with bilingual embeddings
    adds near half a BLEU point

# 1 Introduction

* semantic similarities of phrase-pairs
* curriculum training (Bengio+ ICML 2009)
  * Y. Bengio, J. Louradour, R. Collobert and J. Weston
    Curriculum Learning 
* bilingual distributed representations which lie in the same feature space
* semantic relationships across bilingual embeddings were 
  further improved through unsupervised learning on a large unlabeled corpus

# 2 Review of [Distributed word representations]

* useful in NLP applications such as
  * information retrieval (Pasca+ 2006; Manning+ 2008),
  * search query expansions (Jones+ 2006), or
  * representing semantics of words (Reisinger+ 2010)
* continuous models
  * Collobert+ (2008) contrastive estimation technique
  * Mnih and Hinton (2008), Morin and Bengio (2005) hierarchical
  * Turian+ (2010)
    * systematically compare embeddings, in state-of-the-art NLP benchmarks
  * Huang+ (2012)
    * global document context and multiple word prototypes
  * Luong+ (2013) morphology, Recursive Neural Networks
* Bilingual word representations have been explored
  * with hand-designed vector space models
    * Peirsman and Padó, (2010); Sumita, (2000)
  * unsupervised algorithms such as LDA and LSA
    * Boyd-Graber and Resnik, (2010); Tam+ (2007); Zhao and Xing, (2006)
  * continuous space models been applied to machine translation (Le+ 2012)
  * bilingual distributioned word represenations to improve MT
    * little work has been done
  * we learn bilingual word embeddings
    * which achieve competitive performance on semantic word similarity,
    * apply them in a practical phrase-based MT system
* Only recently applied to machine translation (Le+ 2012)

# 3 Algorithm and methods

## 3.1 Unsupervised training with global context

* embedding learning formulations in Collobert+ (2008)
* We incorporate the global context information as in Huang+ (2012),

# 4 Experiments

# 5 Conclusion

* initialization and optimization constraint using MT alignments
* improve NIST08 end-to-end machine translation results 
  by just below half a BLEU point
