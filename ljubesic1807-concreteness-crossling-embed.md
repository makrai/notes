Nikola Ljubešić, Darja Fišer, Anita Peti-Stantić
Predicting Concreteness and Imageability of Words
  Within and Across Languages via Word Embeddings

concreteness and imageabililty ... in the 77 languages are available at
http://hdl.handle.net/11356/1187

# Abstract

* concreteness and imageability, traditionally important in psycholinguistics,
  * are gaining significance in semantic-oriented natural language processing
* we investigate the[ir] predictability [via supervised learning, using] embeds
  * both within and across languages
    by exploiting collections of cross-lingual embeddings
* concreteness and imageability are highly predictable both within and across
  * moderate loss of up to 20% in correlation when predicting across languages
  * transfer via word embeddings is more efficient than ...  bilingual dicts

# Intro

* theory (Paivio, 1975, 2010)
  * double, verbal and non-verbal, modality of representation ... in the mental
    lexicon, contrasted to single verbal representation of abstract words
* often correlated with concreteness, imageability is not a redundant property.
  * e.g. _torture_ calls up an emotional and even visual image. There are
  * _abbey_ is harder to visualize than _banana_ (Tsvetkov+ 2014).
* Both notions have proven to be useful in computational linguistics as well.
  * Turney+ (2011) present a supervised model that [classifies] adjective-noun
    pairs as having literal or non-literal meaning.
  * Tsvetkov+ (2014) ... perform metaphor detection
    on subject-verb-object and adjective-noun relations, correctly classifying

# Related work

* successful transfers within a language based on word embeddings
  (Tsvetkov+ 2014; Rothe and Schütze, 2016)
* the only cross-lingual transfer was based on ... bilingual dictionaries
  (Tsvetkov+ 2014). In this paper we compare the effectiveness of cross-lingual
* A byproduct of this research is a lexical resource in 77 languages containing
  per-word estimates for concreteness and imageability.

## 3.2 Embeddings

* aligned [collection]
* fastText embeddings (Bojanowski+ 2016)
  * trained on Wikipedia dumps, with embedding spaces
  * aligned ... with a linear transformation learned via SVD (Smith+ 2017) on a
    bilingual dictionary of 500 out of the 1000 most frequent English words,
    obtained via the Google Translate API 3 .
* Conneau+ (2017) obtaining similar results and backing all our conclusions.
  * recent work [suggests that the[ monolingual and bilingual signal is more
    important [than[ underlying architecture (Levy+ 2017; Ruder+ 2017). Given

# 4 Experiments

## 4.1 Setup

* [our] in-language experiments are always based on supervised learning, in
* cross-lingual experiments we compare two transfer approaches:
  * based on a simple dictionary transfer, and another on
  * supervised learning on the word embeddings in the source language, and
    performing predictions on word embeddings in the target language, with the

# 5 Conclustion

* in-language experiments: arithmetic mean of both notions is much easier to
  predict than their standard deviation, the latter probably encoding word
  ambiguity, type of information not directly present in word embeddings.
