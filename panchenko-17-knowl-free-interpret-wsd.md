Unsupervised, Knowledge-Free, and Interpretable Word Sense Disambiguation
Alexander Panchenko, Fide Marten, Eugen Ruppert, Stefano Faralli,
  Dmitry Ustalov, Simone Paolo Ponzetto, and Chris Biemann
2017 emlnp

https://github.com/uhh-lt/wsd
demo: http://jobimtext.org/wsd

# Intro

* Unsupervised knowledge-free approaches, eg
  (Di Marco and Navigli, 2013; Bartunov+ 2016),
* this paper is the first system for word sense induction interpretable
* based on the WSD approach of Panchenko+ (2017)

# 2 Related Work

## Knowledge-Based and/or Supervised Systems

* IMS (Zhong and Ng, 2010) is a supervised all-words WSD system that allows
  users to integrate additional features and different classifiers. By default,
  the system relies on the linear support vector machines with multiple
  features. The AutoExtend (Rothe and Schütze, 2015) approach can be used to
  learn embeddings for lexemes and synsets of a lexical resource. These
  representations were successfully used to perform WSD using the IMS.
* DKPro WSD (Miller+ 2013) is a modular, extensible Java framework for
  word sense disambiguation. It implements multiple WSD methods and also
  provides an interface to evaluation datasets. PyWSD 3 project also provides
  implementations of popular WSD methods, but these are implemented in the
  Python language.
* Babelfy (Moro+ 2014) is a system based on the BabelNet that
  * implements a multilingual graph-based approach to entity linking and WSD
    * based on the densest subgraph heuristic
    * interpretable visualization of the disambiguation results.

## Knowledge-Free and Unsupervised Systems

* Neelakantan+ (2014) proposed a multi-sense extension of Skip-gram
* AdaGram (Bartunov+ 2016) is  a Bayesian extension of the Skip-gram
* SenseGram (Pelevina+ 2016) is a system that transforms word embeddings
  to sense embeddings via graph clustering and uses them for WSD

# 3 Unsupervised Knowledge-Free Interpretable WSD

## 3.1 Induction of the WSD Models
