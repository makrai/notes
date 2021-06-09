Felix Hill, Kyunghyun Cho, Anna Korhonen, Yoshua Bengio
Learning to Understand Phrases by Embedding the Dictionary
2016 acl

* We propose using the definitions found in everyday dictionaries as a means of
  bridging this gap between lexical and phrasal semantics.
* two applications of these architectures
  * "reverse dictionaries" that return the name of a concept given a definition
  * general-knowledge crossword question answerers
* models trained on definitions from ... freely-available lexical resources
  perform as well or better than existing commercial systems

# Introduction

* we experiment with two broad classes of neural language models (NLMs)
  * Recurrent Neural Networks (RNNs), which naturally encode [word] order
  * simpler (feedforward) bag-of-words (BOW) embedding models
* approach can be [ extended to produce ] cross-lingual reverse dictionary.
  * by exploiting ... bilingual word representations
    (Vulic et al., 2011; Klementiev et al., 2012; Hermann and Blunsom, 2013;
    Gouws et al., 2014)
