CompLex: A New Corpus for Lexical Complexity Prediction from Likert Scale Data
Matthew Shardlow, Michael Cooper, Marcos Zampieri
1st Workshop on ... REAding DIfficulties (READI) arXiv:2003.07008 [cs.CL]

# Abstract

* Predicting which words are considered hard to understand
  * applications such as text simplification. This task is commonly referred to
  * Complex Word Identification (CWI). With a few exceptions,
  * previous studies have approached the task as a binary classification task in
  * all CWI datasets compiled so far have been annotated using a binary
* Our paper: the first English dataset for continuous lexical complexity
  * 5-point Likert scale scheme to annotate complex words in texts from three
    sources/domains: the Bible, Europarl, and biomedical texts.  This resulted
  * 9,476 sentences each annotated by around 7 annotators.

# 1 Introduction

* machine learning classifier to determine whether a word is complex or not
  (Paetzold and Specia, 2016; Yimam+ 2018).
* factors can be considered to affect lexical complexity prediction. We may
  * context in which a word is found will affect its understandability. If a
  * reader’s familiarity with the genre of the text may affect the perceived
* The role of the individual user cannot be overlooked when considering LCP and
  * It may be the case that some words have a high variability (i.e., some
    readers find them easy and some find them hard), whereas the complexity
    value of other words is more stable
* effect of multi word expressions on lexical complexity. For example, if I know

# 2.  Related Work

## 2.1.  Lexical Complexity

* second iteration of the CWI shared task at the BEA workshop (Yimam+ 2018). In
  * multilingual dataset was made available containing
    * English, German, and Span training and testing data for monolingual
    * French test set for multilingual predictions.  It featured
  * two sub-tasks:
    * a binary classification task, similar to the CWI 2016 setup, where
    * probabilistic classification task where participants were asked to
      * continuous complexity: the proportion of annotators that found w complex

# 4 open questions as described above (Section 4.) We report our

# 5 results and discuss our findings throughout (Section 5.)

* hand crafted word features such as length, frequency and syllable count, we
  are able to predict complexity with a mean absolute error of 0.0853. Our
* word embeddings performed at a similar level of accuracy (0.0875) to the hand
* sentence embeddings did not turn out to be good predictors of lexical complext
* classifier, we chose a linear regression. We also used Glove embeddings and
