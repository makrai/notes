Robyn Speer, Joshua Chin, Catherine Havasi
ConceptNet 5.5: An Open Multilingual Graph of General Knowledge
AAAI 2017

# Abstract

* [ConceptNet]
  * knowledge graph i.e. connects words and phrases with labeled edges. Its
  * collected from many sources that include expert created resources,
    crowd-sourcing, and games with a purpose. It is
  * designed to represent the general knowledge involved in understanding
    language, improving natural language
  * When ConceptNet is combined with word embeddings, it provides understanding
    that they would not acquire from distributional semantics alone, nor from
    narrower resources such as WordNet or DBPedia. We demonstrate this with
* SOTA results on
  * intrinsic evaluations of word relatedness that translate into improvements
  * applications of word vectors, including solving SAT-style analogies

# 1 Introduction

* original release of ConceptNet (Liu and Singh 2004) was intended as
  * a parsed representation of Open Mind Common Sense (Singh 2002), a
    crowd-sourced knowledge project. This paper describes the release of Con-
* 5.5: lexical and world knowledge from many different sources in many languages
* ConceptNet represents relations between words such as:
  * A net is used for catching fish
  * “Leaves” is a form of the word “leaf”
  * The word cold in English is studený in Czech
  * O alimento é usado para comer [Food is used for eating]
* “ConceptNet Numberbatch”: a word embeddings that learns using a generalization
  of the “retrofitting” method (Faruqui+ 2015)
* evaluations of word relatedness, and this increase in performance translates
  * analogies. On a corpus of
  * SAT-style analogy questions (Turney 2006), its accuracy of 56.1% outperforms
    * ties the previous best overall system, Turney’s LRA
    * only slightly lower than the performance of the average human test-taker
* organization:
  * related work
  * ConceptNet 5.5 and its features
  * how to use ConceptNet alone as a semantic space and a measure of word
    relatedness
  * the hybrid system ConceptNet Numberbatch described and evaluated on these
    various semantic tasks
