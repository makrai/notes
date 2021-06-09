Samuel Brody and Mirella Lapata
Bayesian Word Sense Induction
2009

# Abstract

* Bayesian: modeling the contexts of the ambiguous word as samples from a
  multinomial distribution over senses which are in turn characterized as
  distributions over words

# 1 Introduction

* induced senses can lead to improved performance in
  * machine translation (Vickrey+ 2005) and
  * information retrieval (Véronis, 2004)
  * areas where methods based on a fixed sense inventory have ...  failed
    (Carpuat and Wu, 2005; Voorhees, 1993)
* Our work is related to Latent Dirichlet Allocation (LDA, Blei+ 2003),
  * a probabilistic model of text generation
  * LDA models each document using a mixture over K topics, which are in turn
    characterized as distributions over words
* local topic
  * Whereas LDA generates words from
    global topics corresponding to the whole document,
    our model generates words from
    local topics chosen based on a context window around the ambiguous word
* multiple information sources [with the same] underlying probabilistic model
  * (besides) lexical information
  * parts of speech or
  * dependencies
* We evaluate our model
  * on a recently released benchmark dataset (Agirre and Soroa, 2007)
  * improvements over the state-of-the-art

# 2 Related work

* context
  * first or second order co-occurrences
    (Purandare and Pedersen, 2004; Schutze, 1998)
  * parts of speech (Purandare and Pedersen, 2004), and
  * grammatical relations (Pantel and Lin, 2002; Dorow and Widdows, 2003)
  * size of the context window
    * two words before and after the target word
      (Gauch and Futrelle, 1993),
    * the sentence within which the target is found (Bordag, 2006), or
    * 20 surrounding words on either side of the target
      (Purandare and Pedersen, 2004)
