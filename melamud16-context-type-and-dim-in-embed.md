The Role of Context Types and Dimensionality in Learning Word Embeddings
Oren Melamud, David McClosky, Siddharth Patwardhan, Mohit Bansal
2016 naacl

# Abstract

* how using different types of context to learn skip-gram word embeddings
  affects performance on a wide range of intrinsic and extrinsic NLP tasks
* intrinsic tasks exhibit a clear preference to
  particular types of contexts and higher dimensionality,
* more careful tuning is required for finding the optimal settings for most of
  the extrinsic tasks that we considered
* for these extrinsic tasks, we find that
  once the benefit from increasing the embedding dim is mostly exhausted,
  simple concatenation of word embeddings, learned with different context
  types, can yield further performance gains
* we propose a new variant of the skip-gram model that learns word embeddings
  from weighted contexts of substitute words

# 1 Intro

* Bansal+ (2014) and Levy and Goldberg (2014) 
  * using syntactic contexts rather than window contexts in word2vec captures
    functional similarity (as in lion:cat)
    rather than topical similarity or relatedness (as in lion:zoo). Further,
  * Bansal+ (2014) and Melamud+ (2015b) showed the benefits of such
    modified-context embeddings in dependency parsing and lexical substitution
  * hE, no extensive evaluation of the effect of multiple, diverse context
    types on a wide range of NLP tasks
* Intrinsic tasks mostly include predicting human judgments of semantic re-
  lations between words, e.g., as in WordSim-353 (Finkelstein+ 2001),
* extrinsic tasks include various ‘real’ downstream NLP tasks, such as
  coreference resolution and sentiment analysis
* correlation is not very reliable (Schnabel+ 2015; Tsvetkov+ 2015)
* In this work, we provide
  * the first extensive evaluation of word embeddings learned with different
    types of context, on a wide range of
    * intrinsic similarity and relatedness tasks, and
    * extrinsic NLP tasks, namely dependency parsing, named entity recognition,
      coreference resolution, and sentiment analysis
  * contexts based of different word window sizes, syntactic dependencies, and
    a lesser-known substitute words approach (Yatbaz+ 2012)
  * experiment with combinations of the above word embeddings,
    comparing two approaches:
    * simple vector concatenation that offers a wider variety of features for a
      classifier to choose and learn weighted combinations from, and
    * dimensionality reduction
      via either Singular Value Decomposition or Canonical Correlation Anal,
      * tries to find a smaller subset of features
