Continuous multilinguality with language vectors
Robert Östling and Jörg Tiedemann
2017 ACL

# Abstract

* Most existing models for multilingual natural language processing (NLP)
  treat language as a discrete category
* we
  * continuous vector representations of language. We show that these can be
    * learned efficiently with a character-based neural language model
    * improve inference about language varieties not seen during training
  * experiments with 1303 Bible translations into 990 different languages
  * genetic relationships between languages

# 1 Introduction

* Neural language models (Bengio+ 2003; Mikolov+ 2010; Sundermeyer+ 2012)
* we
  * real-valued vectors to indicate the language used
  * empirical evaluation using nearly a thousand languages
* motivation of combining languages into one single model
  * languages are related and share many features and properties
  * data sparseness for most languages in the world and also for most domains

# 2 Related Work

* Multilingual language models is not a new idea (Fugen et al., 2003)
* Ammar et al. (2016)
  * Waleed Ammar, George Mulcaire, Miguel Ballesteros, Chris Dyer, Noah Smith.
    Many languages, one parser.
    2016 TACL
  * one-hot language identifiers as input to a multilingual word-based
    dependency parser, based on multilingual word embeddings
  * higher accuracy than using features from a typological database,
  * it is a reasonable guess that their system learned language vectors which
    were able to encode syntactic properties relevant to the task
  * Universal Dependencies treebanks
    * relatively large and diverse sample of languages represented
* automatic language classification, by Wichmann et al. (2010) among others
  * However, our purpose is not to detect genealogical relationships

# 3 Data

* Bible translations crawled from the web
  * from various sources and periods of times
  * same genre and roughly the same coverage for each language involved
  * easy to divide the data into training and test
* alphabet size is below 1000 symbols, which was satisfied by choosing
  only translations in Latin, Cyrillic or Greek script
* size
  * 500 million tokens in total, with
  * most languages having only one translation of the New Testament each, with
    roughly 200 thousand tokens
  * around ten contain only portions of the New Testament
* high overlap of named entities
  * can lead to some unexpected effects when using nonsensical language
    vectors, as the model will then generate a sequence of random names
* historical versions of languages (with their own ISO 639-3 code) are treated
  as distinct languages

# 4 Methods

* Our model is based on a standard stacked character-based LSTM
  (Hochreiter and Schmidhuber, 1997) with two layers, followed by a hidden
  layer and a final output layer with softmax activations
* language embedding vectors are concatenated to the inputs of the LSTMs at
  each time step and the hidden layer before the softmax. We used
  * three separate embeddings for these levels, in an
    * attempt to capture different types of information about languages
    * using the same embedding everywhere gives similar results

# 5 Results

* hierarchical agglomerative clustering [of the language vector space]
  for visualization.
* For measuring performance, we use cross-entropy on held-out data. For this,
  we use a set of the 128 most commonly translated Bible verses

## 5.2 Structure of the language space

* Germanic languages ... closely matches the established genetic relationships
  in this language family
* more remote relationships (say, connecting the Germanic languages to the
  Celtic) is difficult for the model
