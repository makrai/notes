Finding Universal Grammatical Relations in Multilingual BERT
Ethan A. Chi, John Hewitt, Christopher D. Manning
ACL 2020

# Abstract

* we extend recent work on finding syntactic trees in internal representations
  to the multilingual setting
* syntactic tree distances in languages other than English, and that these
  subspaces are approximately shared across languages. Motivated by these
  results, we present an unsupervised analysis method that provides evidence
  mBERT learns representations of syntactic dependency labels:
* clusters which largely agree with the Universal Dependencies taxonomy

# 1 Intro

* linguistic structure in masked language models such as BERT (Devlin+ 2019):
  (Liu+ 2019; Tenney+ 2019a,b)
* large multilingual masked language models
  Multilingual BERT (mBERT) and XLM (Conneau and Lample, 2019; Conneau+ 2019)
  * tasks like XNLI (Lample and Conneau, 2019; Williams+ 2018) and
    dependency parsing (Wu and Dredze, 2019)
* analysis has been motivated by a desire to explain monolingual downstream
  * now: crosslingually
* Figure 1: English and French dependencies exhibit cross-lingual clustering
  that largely agrees with UD dependency labels
* In this paper, we examine the extent to which Multilingual BERT learns a
  cross-lingual representation of syntactic structure
  * probe trained on recreating dependency tree structure), but also
  * use the probe as a window into understanding the repr of dependency labels
  * method of Hewitt and Manning (2019), which probes for syntactic trees:
    * distance in dependency parse is approximated by the squared-distance
      between their model representation vectors under a linear transformation
* structural probe defining a syntactic subspace (Figure 2)
  * optimized to recreate syntactic tree distances, it has
    no supervision about edge labels (such as adjectival modifier or nsubject)
* contributions:
  * 10 languages, extending the structural probe result to a multilingual
  * some syntactic features in syntactic subspaces that overlap between langs
    * probes trained on one language can recover syntax in other languages
      (zeroshot)
  * clusters that largely overlap with the dependency taxonomy of UD (Nivre+20)
    * allows for fine-grained analysis of the distinctions made by mBERT that
      disagree with UD
    * detecting linguistic properties we have no training data for
* Our analysis sheds light on the cross-lingual properties of Multilingual BERT
  * zeroshot cross-lingual structural probe experiments and
  * novel unsupervised dependency label discovery experiments which
    * treat the probe’s syntactic subspace as an object of study
  * mBERT induces universal grammatical relations, which
    largely agree with the dependency labels of Universal Dependencies

# 4

## 4.2 Joint Syntactic Subspace

## 4.4 Subspace Similarity

# 5 mBERT Dependency Clusters Capture Universal Grammatical Relations

## 5.4 Finer-Grained Analysis

* Visualizing syntactic differences in the syntactic space provides a
  surprisingly nuanced view of the native distinctions made by mBERT. In 
* Figure 6, these differences are colored by gold UD dependency labels. A

### Adjectives 

* Universal Dependencies categorizes all adjectival noun modifiers under the
  amod relation. However, we find that 
* mBERT splits adjectives into two groups: 
  * prenominal adjectives in cluster (b) (e.g., Chinese 獨 特 的 地理) and
  * postnominal adjectives in cluster (u) (e.g., French applications
    domestiques)

### Nominal arguments 

* mBERT 
  * maintains the UD distinction between subject (nsubj) and object (obj).
  * Indirect objects (iobj) cluster with direct objects Interestingly, mBERT
  * adjunct arguments (obl) generally group with 
    nsubj if near the beginning of a sentence and obj otherwise

### Relative clauses 

* In the languages in our dataset, there are two major ways of forming relative
  clauses. 
  * Relative pronouns (e.g., English _the man who is hungry_ are classed by
    Universal Dependencies as being an nsubj dependent, while 
  * subordinating markers (e.g., English _I know that she saw me_) are classed
    as the dependent of a `mark` relation 
* However, mBERT groups both of these relations together, clustering them
  distinctly from most nsubj and mark relations

### Negatives 

* Negative adverbial modifiers (English not, Farsi Q « , Chinese 不) are not
  clustered with other adverbial syntactic relations (advmod), but form their
  own group (h). 14

### Determiners (det)

* split into definite articles (i), indefinite articles (e), possessives (f),
  and demonstratives (g). Sentence-initial definite articles (k) cluster
  separately from other definite articles (j)

### Expletive subjects 

* in UD, with the separate relation expl, expletive subjects, or 
* third-person pronouns with no syntactic meaning (
* e.g English _It is cold_, French _Il faudrait_, Indonesian _Yang menjadi masalah
  kemudian_), 
* cluster separately (k) from other nsubj relations 
  (small cluster in the bottom left)

### Overall, mBERT draws slightly different distinctions from UD

* some are more fine-grained than UD, 
  others appear to be more influenced by word order, 
  separating relations that most linguists would group together
* Still others are valid linguistic distinctions not dis-
