Problems With Evaluation of Word Embeddings Using Word Similarity Tasks
Manaal Faruqui, Yulia Tsvetkov, Pushpendre Rastogi, Chris Dyer

# 1 Introduction

* The origin of word similarity tasks
  * Rubenstein and Goodenough (1965) who constructed a list of 65 word pairs
    with annotations of human similarity judgment. They created this dataset to
    validate the veracity of the distributional hypothesis (Harris, 1954)
    * They found a positive correlation between contextual similarity and
      human-annotated similarity of word pairs

# 2 Problems

## 2.2 Subjectivity of the task

## 2.3 Semantic or task-specific similarity?

## 2.4 No standardized splits & overfitting

## 2.5 Low correlation with extrinsic evaluation

* [with] tasks like text classification, parsing, sentiment analysis
  (Tsvetkov+ 2015; Schnabel+ 2015)

## 2.6 Absence of statistical significance

## 2.7 Frequency effects in cosine similarity

* frequent words ... are longer as they are updated more often during training
  (Turian+ 2010)
* Ideally the relatively small number of
  * frequent words should be evenly distributed through the space, while
  * rare words should cluster around related, but more frequent words
* vector-spaces contain hubs, which are
  * vectors that are close to a large number of other vectors in the space
    (Radovanović+ 2010)
  * in word vector-spaces, in the form of words that have high cosine similarity
    with a large number of other words (Dinu+ 2014)
* Schnabel+ (2015) further refine this hubness problem to show
  * power-law relationship between the frequency-rank 5 of a word and the
    frequency-rank of its neighbors
  * the average rank of the 1000 nearest neighbors of a word follows: nn-rank ≈
    1000 · word-rank^0.17

## 2.8 Inability to account for polysemy

* there has been progress on obtaining multiple vectors per word-type 
  to account for different word-senses
  * Reisinger and Mooney, 2010
  * Huang+ 2012
  * Neelakantan+ 2014
  * Jauhar+ 2015;
    Sujay Kumar Jauhar, Chris Dyer, and Eduard Hovy
    2015 NAACL
    Ontologically grounded multi-sense ... vector space models
  * Rothe and Schütze, 2015)
    Sascha Rothe and Hinrich Schütze
    ACL 2015
    Autoextend: ... embeddings for synsets and lexemes
