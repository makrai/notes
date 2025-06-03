Crowdsourcing a word–emotion association lexicon
Saif M. Mohammad and Peter D. Turney
Computational Intelligence, Volume 29, Number 3, 2013

This paper expands on work first published in Mohammad and Turney (2010)

# Abstract

* large, high-quality, word--emotion and word--polarity association lexicon
* solutions in emotion annotation in a crowdsourcing scenario
  in addition to questions about emotions associated with terms
  * a word choice question can discourage malicious data entry
  * identify when the annotator may not be familiar with the target term
  * obtain annotations at sense level (rather than at word level)
  * asking if a term is _associated_ with an emotion leads to markedly higher
    interannotator agreement than that obtained by asking if a term _evokes_ it

# 1 Introduction

* emotions in text, automatic analysis
  * facial expressions (Aristotle 1913; Russell 1994)
* either a word or a phrase
* entry in this lexicon includes a term, an emotion, and a measure of assoc
* existing limited-coverage lexicons for a handful of languages, for example,
  * WordNet Affect Lexicon (WAL; Strapparava and Valitutti 2004)
  * General Inquirer (GI; Stone+ 1966)
  * Affective Norms for English Words (ANEW) (Bradley and Lang 1999)
* our NRC Emotion Lexicon (EmoLex for short), is
  * an order of magnitude larger than the WAL
  * We focus on the emotions of joy, sadness, anger, fear, trust, disgust,
    surprise, and anticipation
    * argued by many to be the basic and prototypical emotions (Plutchik 1980)
  * terms in EmoLex are carefully chosen
    * some of the most frequent English nouns, verbs, adjectives, and adverbs
    * In addition to unigrams, EmoLex has many commonly used bigrams as well
    * words from the GI and the WAL to allow comparison of annotations
* extensive analysis of the annotations to answer several questions, including
  1. How hard is it for humans to annotate words with their associated emos?
  1. How can emotion-annotation questions be phrased
  1. Are emotions more commonly evoked by nouns, verbs, adjectives, or adverbs?
     How common are emotion terms among the various parts of speech?
  1. How much do people agree on the association?
  1. Is there a correlation between
    the polarity of a word and the emotion associated with it?
  1. Which emotions tend to go together
* Our lexicon now has close to 10,000 terms

# 2. Applications
