Omer Levy, Steffen Remus, Chris Biemann, and Ido Dagan
Do Supervised Distributional Methods Really Learn Lexical Inference Relations?
NAACL 2015

mindig csak igen-nem?

# Abstract

* hypernymy and entailment

# 1 Introduction 

* inference relations between two words (x and y), such as
  * causality (flu → fever)
  * hypernymy (cat → animal), and
  * other notions of lexical entailment
* methods of recognizing lexical inference
  * unsup
    * replace cosine similarity with an asymmetric similarity function 
      (Weeds and Weir, 2003; Clarke, 2009; Kotlerman+ 2010; Santus+ 2014)
  * sup
    * perform better
    * learn the asymmetric operator
    * Baroni+ (2012) use concatenation ~x ⊕ ~y
    * the vectors’ difference
      (Roller+ 2014; Weeds+ 2014; Fu+ 2014)
    * based on contextual features
      (Turney and Mohammad, 2014; Rimell, 2014)
    * we argue that these supervised methods memorizing 
      ... whether y is a “prototypical hypernym” (i.e. a category)

# 2 Experiment Setup

* previously reported results
* we
  * implement some
  * observe similar trends to previously published results, and
  * make the dataset splits available for replication

# 2.1 Word Representations

* over Wikipedia (1.5 billion tokens)
* the cross-product of 3 types of contexts and 3 representation models

# 2.1.1 Context Types

* Bag-of-Words
  * w = 5
  * subsampling (Mikolov+ 2013a), to increase the impact of content words
* Positional w = 2
* Dependency
  * (Lin, 1998; Padó and Lapata, 2007; Baroni and Lenci, 2010)
  * the same parsing apparatus as in (Levy and Goldberg, 2014)

# 2.1.2 Representation Models

* PPMI (Niwa and Nitta, 1994)
* SVD to k = 500
* Skip-grams with negative sampling (Mikolov+ 2013b) with
  * 500 dimensions and 5 negative samples
  * using a modified version of word2vec that allows different
  * context types (Levy and Goldberg, 2014)

# 2.2 Labeled Datasets

* (Kotlerman+ 2010)
  * Manually annotated lexical entailment of distributionally similar nouns
* (Baroni and Lenci, 2011) a.k.a. BLESS
  * unambiguous word pairs and their semantic relations from WordNet
  * negative
    * Following Roller+ (2014)
    * meronyms, noun cohyponyms, and random noun pairs as negative
* (Baroni+ 2012)
  * like BLESS
  * Hypernym ... permutated to generate negative examples
* (Turney and Mohammad, 2014)
  * Based on a crowd-sourced dataset of 79 semantic relations
    (Jurgens+ 2012)
* (Levy+ 2014)
  * Based on manually annotated entailment graphs of
  * subject-verb-object tuples (propositions)
  * Noun entailments were extracted from entailing tuples that were
  * identical except for one of the arguments
  * This dataset is the most realistic [entailment in context]

# 2.3 Supervised Methods

* 4 compositions for representing (x, y) as a feature vector:
  * concat (~x ⊕~y ) (Baroni+ 2012)
  * diff (~y − ~x )
    * (Roller+ 2014; Weeds+ 2014; Fu+ 2014)
  * only x (~x ), and
  * only y (~y )
* classifiers
  * logistic regression with L 1 or L 2 regularization, and
  * SVM with a linear kernel or quadratic kernel
* + preliminary experiments
* TODO
* applying the JoBimText framework for scalable distributional thesauri
  * (Biemann and Riedl, 2013) using
* Google’s syntactic N-grams (Goldberg and Orwant, 2013) as a corpus

# 3 Negative Results: no relation

* Lexical Memorization
  * y = animal
  * Similar findings ... by Roller+ (2014) and Weeds+ (2014)
  * Table 2
  * in our following experiments, we split each dataset into train and test
    ... with zero lexical overlap
* Supervised vs Unsupervised
  * supervised methods ... better than unsupervised ones: not always
  * baseline: cosine
    * outperforms all supervised methods in 2 out of 5 datasets
  * Ignoring x’s Information
    * difference in performance is less than 5 points
    * Weeds+ (2014) reported a similar result
  * Table 3

# 4 Prototypical Hypernyms

* whether y is a likely “category” word – a prototypical hypernym –
  * and, to a lesser extent, whether x is a likely “instance” word
* extends to other inference relations, such as meronymy

## 4.1 Testing the Hypothesis

* measure on mismatched pairs
  * (banana, animal)
  * -> synthetic examples S
* We therefore expect it to classify a similar proportion of T+ and S as [good]

## 4.2 Prototypical Hypernym Features

* interpretable features: PPMI
* dataset-specific: psychosomatic −1
* domain-independent indicators of category, e.g
  * any −1 , every −1 , and kinds −2
* relics of the Hearst (1992) pattern in all datasets
  * other −1 , such +1 , including +1 , etc.
  * and their analogues
    * e.g. such −2

# 5 Analysis of Vector Composition

* in the setting of a linear SVM

# 6 Adding Intra-Pair Similarity

* radial basis function (RBF) kernel with diff
* slightly reduce match error (false positive with \in S pairs)

# 7 The Limitations of Contextual Features

* requiring ... features, such as textual patterns that connect x with y
  * bib
    * Rion Snow, Daniel Jurafsky, and Andrew Y Ng (2005)
      Learning syntactic patterns for automatic hypernym discovery
    * Peter D Turney (CL 2006)
      Similarity of semantic relations
