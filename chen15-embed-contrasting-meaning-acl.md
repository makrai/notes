Revisiting Word Embedding for Contrasting Meaning
Z Chen, W Lin, Q Chen, X Chen, S Wei, H Jiang, X Zhou
2015 ACL

# Abstract

* 92% on the widely-used, publicly available dataset, the GRE “most contrasting
  word” questions (Mohammad+ 2008)
  * the highest performance seen [before Ono+ naacl15] on this dataset
  * our best result relying solely on lexical resources (Roget’s and
    WordNet)

# Intro

* Lexical contrast [modeled] (Lin and Zhao, 03; Mohammad+ 08; Mohammad+ 13).
* embedding spaces, leading to stateof-the-art performances. For example,
  * Yih+ (2012)
    * polarity-primed LSA used to initialize a neural network
    * F-score of 81% on the same GRE “most contrasting word” questions
      (Mohammad+ 2008)
    * The Encarta thesaurus [is] used [which] is not publicly available
    so we did not use it in our experiments.
  * Zhang+ (2014) proposed a tensor factorization approach
    * multidimensional semantic information, relations, 
      unsupervised data structure information in tensor factorization, and
      F-score of 82% on the GRE questions
  * These methods employed both lexical resources and corpora statistics
* we constructed our study in a framework that examines a number of basic
  concerns in modeling contrasting meaning

# 2 Related Work

* terms contrasting, opposite, and antonym have different definitions in the
  literature, while sometimes they are used interchangeably
  * Following (Mohammad+ 2013), in this paper we refer to
  * opposites as word pairs that “have a strong binary incompatibility relation
    with each other or that are saliently different across a dimension of
    meaning”, e.g., day and night
  * Antonyms are a subset of opposites that are also gradable adjectives, with
    same definition as in (Cruse, 1986) as well
  * _Contrasting_ [has] the broadest meaning, word pairs having _some ... difference_
* semantic differentials (Osgood+ 1957)

## Word Embeddings

* stochastic neighbor embedding (SNE) (Hinton and Roweis, 2002), which explic-
  itly enforces that in the embedding space, the distribution of neighbors of
  a given word to be similar to that in the original, uncompressed space. SNE
  can learn multiple senses of a word with a mixture component

## Modelling Contrasting Meaning

* sentiment contrast may be viewed as
  * a specific case of more general semantic contrast or
  * Tang+ (2014) learned sentiment-specific embedding

# 3 The Models

* aim of the models is to enforce that in the embedding space, the word pairs
  with higher degrees of contrast will be put farther from each other than
  those of less contrast

## 3.5 Semantic Differential Reconstruction (SDR)

* Using factor analysis, Osgood+ (1957) identified three dimensions
  * evaluative (good-bad), potency (strong-weak), and activity(active-passive)
  * We hypothesize that such information should help reconstruct contrasting
    meaning
  * The General Inquirer lexicon (Stone1966) represents these three factors but
    has a limited coverage. 
  * We used the algorithm of Turney and Littman (2003) to extend the labels to
    more words with Google one billion words corpus
    * to obtain the evaluative score for a candidate word w, the point-wise
      mutual information (PMI) between w and a set of seed words eval+ and
      eval− are computed respectively, and

# 5 Results

## 5.2 Roles of Lexical Resources

* target-gold-answer pairs in the GRE test set are connected by short paths
  (with length between 1 to 3).  More specifically, based on breadth-first
  search, we found the nearest paths that connect target- gold-answer pairs, in
  the graph formed by Word-Net and Roget’s—each word is a vertex, and con-
  trasting words and semantically close words are
