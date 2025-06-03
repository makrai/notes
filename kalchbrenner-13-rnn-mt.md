Nal Kalchbrenner, Phil Blunsom
2013
Recurrent Continuous Translation Models

Code and models available at nal.co

# Abstract

* do not rely on alignments or phrasal translation units
* generation and a conditioning
  * generation is modelled with a target Recurrent Language Model
  * conditioning on the source sentence is modelled with a Convolutional
    Sentence Model
  * perplexity with respect to gold translations that is > 43% lower than
    that of SOTA alignment-based translation models

# 1 Introduction

* In most statistical approaches to machine translation
  * models count phrase pairs and their occurrences as distinct if the surface
    forms of the phrases are distinct
* Continuous representations
  * sensitivity to conditioning information (Mikolov and Zweig, 2012)
* character-level language models demonstrating notable language
  generation capabilities (Sutskever+ 2011)
* Phrase-based continuous translation models
* We describe Recurrent Continuous Translation Models (RCTM)
  * a recurrent language model for the generation of the target
  * translation (Mikolov+ 2010)
    * In contrast to other n-gram approaches, the recurrent language model
      makes no Markov assumptions about the dependencies of the words in the
      target sentence
  * The two RCTMs differ in the way they condition
    1. convolutional sentence model (Kalchbrenner and Blunsom, 2013)
      * transform the source word representations into a representation for the
        source sentence
      * source sentence representation constraints the generation of tg words
    2. intermediate representation
  * efficiently computable
  * evaluation
    * SOTA variant of the IBM Model 2 (Brown+ 1993; Dyer+ 2013)
    * sensitive to word position and order
    * SOTA translation system cdec

# 2 Framework

* 2.1 Recurrent Language Model
  * h_i is defined in 3a, and \sigma is a component-wise sigmoid
* RCTMs may be thought of as RLMs, in which the predicted distributions for
  each word f_i are conditioned on the source sentence e. We next define two
  conditioning architectures each giving rise to a specific RCTM

# 3 Recurrent Continuous Translation Model I

* does not make use of an explicit parse tree,

# 5 Experiments

## 5.2 Perplexity of gold translations

* We compare the perplexities of the RCTMs with the perplexity of the
  * IBM Model 1 (Brown+ 1993) and of the
  * Fast-Aligner (FA-IBM 2) model that is a SOTA variant of IBM
    Model 2 (Dyer+ 2013). We add as baselines the
  * unconditional target RLM and a 5- gram target language model with modified
    Kneser- Nay smoothing (KN-5)

# 6 Conclusion

* potential advantages and extensions
  * morphologically rich languages through character-level recurrences
