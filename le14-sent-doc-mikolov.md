Quoc Le and Tomas Mikolov
Distributed Representations of Sentences and Documents
31 st International Conference on Machine Learning, 2014

# Abstract

* we achieve new SOTA on several text classification and sentiment analysis ts

# Introduction

* bag-of-words or bag-of-n-grams (Harris, 1954)
* we concatenate the paragraph vector with several word vectors from a
  paragraph and predict the following word in the given context
* recent work in learning vector representations of words using neural networks
  (Bengio+ 2006; Collobert & Weston, 2008; Mnih & Hinton, 2008; Turian+ 2010;
  Mikolov+ 2013a;c)
* beyond word level
  (Mitchell & Lapata, 2010; Zanzotto+ 2010; Yessenalina & Cardie, 2011;
  Grefenstette+ 2013; Mikolov+ 2013c)
* approach
  * weighted average
  * combining the word vectors in an order given by a parse tree of a sentence,
    using matrix-vector operations (Socher+ 2011b)

# 2. Algorithms

## 2.1. Learning Vector Representation of Words

* previous methods for learning word vectors
* hierarchical softmax
* word vectors attractive for
  * language modeling (Bengio+ 2006; Mikolov, 2012),
  * natural language understanding (Collobert & Weston, 2008; Zhila+ 2013),
  * statistical machine translation (Mikolov+ 2013b; Zou+ 2013),
  * image understanding (Frome+ 2013) and
  * relational extraction (Socher+ 2013a)

## 2.2. Paragraph Vector: A distributed memory model

* The paragraph vectors are also asked to contribute to the prediction task of
  the next word given many contexts sampled from the paragraph
* In the experiments, we use concatenation as the method to combine the vectors
* prediction time, one needs to perform an inference step to
  compute the paragraph vector for a new paragraph (never seen before)
