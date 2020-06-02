What are the Goals of Distributional Semantics?
Guy Emerson
ACL arXiv:2005.02982 [cs.CL]

# Abstract

* explicit long-term goals. In this paper, I take a broad linguistic perspectiv
  looking at how well current models can deal with various semantic challenges.
* stark differences between models proposed in different subfields, a broad
  * how we could integrate them. I conclude that, while linguistic insights can
    guide the design of model architectures, future progress will require
* balancing the often conflicting demands of 
  linguistic expressiveness and computational tractability. 

# 1 Intro

* In assessing progress in semantics, Koller (2016) contrasts “top-down” and
  * top-down approach begins with an overarching goal, and tries to build a
  * bottom-up approach begins with existing models, and tries to extend them
    * intrinsically unfalsifiable...  We won’t know where distributional
* linguistic perspective, where the top-down goal is to characterise the
  meanings of all utterances in a language. This is an ambitious goal, and a
* I will elaborate on several crucial aspects of meaning
  * For each aspect: plausible goal; possible models, existing work ; evaluate

# 3 Meaning and the World

Language is always _about_ something. In this section, I discuss challenges in
connecting a semantic model to things in the world.

## 3.1 Grounding

## 3.2 Concepts and Referents

# 4 Lexical Meaning

## 4.1 Vagueness

## 4.2 Polysemy

## 4.3 Hyponymy

# 5 Sentence Meaning

## 5.1 Compositionality

## 5.2 Logic

## 5.3 Context Dependence

# 6 Conclusion

* A common thread among all of the above sections is that reaching our semantic
  goals requires structure beyond representing meaning as a point in space.
  * represent the meaning of a word as a region of space or as a classifier,
    and to work with probability logic.
* trade-off between expressiveness and learnability: the more structure we add,
  the more difficult it can be to work with our representations. To this end,
* neural architectures for working with structured data, such 
  * dependency graphs (for example: Marcheggiani and Titov, 2017) or 
  * logical propositions (Rocktäschel and Riedel, 2017; Minervini+ 2018).  To
* computationally [efficiency] in probabilistic models, there are promising new
  * amortised variational inference, used in the Variational Autoencoder
    (Kingma & Welling, 2014; Rezende+ 2014; Titsias & Lázaro-Gredilla, 2014)
* My own recent work in this direction has been to develop the 
  * Pixie Autoencoder (Emerson, 2020a)
