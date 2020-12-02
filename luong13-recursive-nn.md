Minh-Thang Luong, Richard Socher, Christopher D. Manning
Better Word Representations with Recursive Neural Networks for Morphology
CONLL 2013

rare dataset

# Abstract

* building representations for morphologically complex words 
  from their morphemes

# 1 Introduction

* deep neural network models (Collobert+ 2011)
* conventional feature-based models (Koo+ 2008; Ratinov and Roth, 2009)
* neural models
  * feed-forward networks (Bengio+ 2003)
  * hierarchical models (Morin, 2005; Mnih and Hinton, 2009)
  * recurrent neural networks (Mikolov+ 2010; Mikolov+ 2011)
* Clark (2003)
  * model [encourages] words ending with the same suffix to appear in the same
    class
  * not capture the relationship between a word and its derived forms
* we treat each morpheme as a basic unit in the RNNs
* our models can blend well syntactic information, i.e., the word structure,
  and the semantics in grouping related words
  * detailed analysis in Section 6

# 2 Related Work

* history
  * morphological inflections was a very central problem in early work in the
    parallel distributed processing paradigm and criticisms of it 
    (Rumelhart and McClelland, 1986; Plunkett and Marchman, 1991)
  * later work developed more sophisticated models of morpholog[y]
    (Gasser and Lee, 1990; Gasser, 1994)
* the work closest to ours in terms of handing unseen words
  * factored NLMs (Alexandrescu and Kirchhoff, 2006)
    * Our work combines [vectors of morphemes] using RNNs, which captures
      morphological compositionality
  * compositional distributional semantic models (DSMs, Lazaridou+ 2013)
    * their models [do] not support recursive morpheme composition
    * just stem + aff
    * és az ilyen egyszerűeken melyik a jobb?
  * Mikolov+ (2013) showed syntactic and semantic regularities
    * We believe that these relationships will not hold for rare words

# 3 Morphological RNNs

* We assume access to a dictionary of morphemic analyses of words

## 3.1 Context-insensitive Morphological RNN

* squared Euclidean distance

## 3.2 Context-sensitive Morphological RNN

* itt már az embeddinget is kompozícionálisan tanulják
* az előbbinél a ritka szavaknál rossz a tanulóadat
* build representations for complex words from their morphemes
  * a kontextust csak úgy tudom érteni, hogy 
    a morfnak a szavakon felüli disztribúcióját is tükrözi az embedding
  * a Conclusion-ben "word context"

# 5 Experiments

* we initialize our models with existing word representations
  * [Collobert+ (2011, denoted as C&W)](http://ronan.collobert.com/senna/)
    * 50-dimensional
  * Huang+ (2012, referred as HSMN)
  * [multi-prototype approach](http://wwwnlp.stanford.edu/~ehhuang/)

## 5.1 Word Similarity Task

### 5.1.1 Rare Word Dataset

* Pair construction

# 6 Analysis

* qualitative analysis: nearest neighbors of several complex words
* cosine similarity
* szerintem nem cél, hogy a legközelebbi szomszéd morfológiailag hasonló legyen
