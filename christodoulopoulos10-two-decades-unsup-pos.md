Christodoulopoulos, Goldwater, Steedman:
Two Decades of Unsupervised POS induction: How far have we come?
2010

# Introduction

* POS induction systems, where no prior knowledge is available, in contrast to
  * POS disambiguation systems which use a dictionary to provide possible tags
    for some or all of the words in the corpus, or
  * prototype-driven systems which use a small set of prototypes for each tag
    class, but no dictionary
* difficulty in evaluating POS induction systems is that there is
  no straightforward way to map the clusters found by the algorithm
  onto the gold standard tags;
  * most recent papers have used mapping-based performance measures
* we argue that the entropy-based V-Measure (Rosenberg and Hirschberg, 2007)
    is more useful in many cases
  * more stable across different numbers of found and true clusters, and
  * avoiding several of the problems with Variation of Information (Meilă, 2003)
    * another commonly used entropy-based measure
* the oldest system tested (Brown+ 1992) produces the best prototypes,
  and that using these prototypes as input to Haghighi and Klein’s system
  yields state-of-the-art performance on WSJ and improvements on seven of the
  eight non-English corpora

# POS Induction Systems

# Evaluation Measures

## [many-to-1]

* tends to yield higher scores as `|C|` increases,
  * assigning each word to its own class yields a perfect score

## [1-to-1] difficult to compare solutions with different values of `|C|`

## [s-fscore] does not require a gold standard tagging

## Variation of Information (Meilă, 2003)

* regards the system output `C` and the gold standard tags `T` as two separate
  clusterings, and evaluates the amount of information lost in going from `C`
  to `T` and the amount of information gained, i.e., the sum of the conditional
  entropy of each clustering conditioned on the other
* How about simply `H(T|C)`?

# Empirical results (the behavior of different evaluation methods)

* s-score assigns a lower score to the supervised system than to brown,
  indicating that words in the supervised clusters (which are very close to the
  gold standard) are actually less substitutable than words in the unsupervised
  clusters. This is probably due to the fact that the gold standard encodes
  “pure” syntactic classes, while substitutability also depends on semantic
  characteristics
* If a gold standard is available, then many-to-1 and 1-to-1 are the most
  intuitive measures, but should not be used when `|C|` is variable,

# System comparison

* because most of the systems were initially developed on WSJ corpus, and often
  evaluated only on it, there is a question of whether their methods and/or
  hyperparameters are overly specific to the domain or to the English language
* clark, feat, (brown)

# Learning from induced prototypes

* Using the most frequent words in each gold standard class as prototypes, the
  authors report 80.5% accuracy
* brown system produces the best prototypes
* clark+proto actually performs worse than clark

# Noun-supervis POS tagging

* noun-supervision: label non-noun
* Hungarian: feat or feat+proto
* Christos Christodoulopoulos, Sharon Goldwater, Mark Steedman:
  A Bayesian Mixture Model for Part-of-Speech Induction Using Multiple Features
* Reichart, Fattal (2010)
  Improved unsupervised POS induction
  using intrinsic clustering quality and a Zipfian constraint
