Karl Moritz Hermann and Phil Blunsom
Multilingual Models for Compositional Distributed Semantics
2014

http://www.karlmoritz.com/resources
https://github.com/karlmoritz/bicvm
sentence aligned text

# Abstract

* joint-space embedding
* leverage parallel data
* learn to
  * strongly align the embeddings of semantically equivalent sentences, while
  * maintaining sufficient distance between those of dissimilar sentences
* do not rely on word alignments or any syntactic information
* learn semantic representations at the document level, too
* We 
  * evaluate these models on 
    two cross-lingual document classification tasks
    * outperforming the prior state of the art
  * capture semantic relationships across languages without parallel data
    * qualitative analysis and the study of pivoting effects

# 1 Introduction

* experiments on two corpora
  * cross-lingual document classification on the Reuters RCV1/RCV2 corpora
    * we outperform the prior state of the art (Klementiev+ 2012)
  * classification results on a massively multilingual corpus
    * which we derive from the TED corpus (Cettolo+ 2012)
    * [good] results on this task, in comparison with ... strong baselines,
* multilingual objective function that uses a 
  noise-contrastive update between semantic representations of different langs
* we use a compositional vector model (CVM, henceforth) to compute 
  semantic representations of sentences and documents
  (Clark and Pulman, 2007; Mitchell and Lapata, 2008; 
  Baroni and Zamparelli, 2010; Grefenstette and Sadrzadeh, 2011; Socher+ 2012;
  Hermann and Blunsom, 2013)
* we only require sentence-aligned parallel data
  * [no] need for
    * syntactic parse trees,
    * word alignment,
    * semantic signals such as sentiment or topic-labels
* semantic grounding
  * Language acquisition [is] grounded in sensory-motor experience
    (Bloom, 2001; Roy, 2003)
  * attempts at using multi-modal data for learning better vector[s]
    (Srivastava and Salakhutdinov 2012)
* transferring linguistic knowledge into low-resource languages
  (Klementiev+ 2012; Zou+ 2013; Lauly+ 2013)

# 3 Approach

* bilingual (and trivially multilingual) energy
* l2 between parallel sentences
* noise-constrastive large-margin update
  * ensures that the representations of non-aligned sentences 
    observe a certain margin from each other

## 3.1 Two Composition Models

* add
* bi(gram)
  * sum tanh(x_{i-1} + x_i)

## 3.2 Document-level Semantics

# 4 Corpora

# 5 Experiments

# 6 Related Work

# 7 Conclusion
