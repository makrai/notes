Geoffrey Zweig
2014 tech report
Explicit Representation of Antonymy in Language Modeling

Ötlet: antonímalista nélkül a fosztóképzőkből tanulva

# 1 Introduction

* Continuous space word representations [for]  machine translation 
  (Auli et al., 2013; Kalchbrenner and Blunsom, 2013; Son et al., 2012; 
  Schwenk et al., 2006)
* Previous approaches cannot distinguish between words like “hot” and “cold”
  because they are distributionally similar

# 2 Related Work

* More recently [than Mikolov et al 2013 Efficient...], Lebret et al. (2013)
  show that good representations can be learned with a fairly simple
  cooccurrence model
* vector offset method: unit vectors
* in learning antonyms, [...] the work of Yih et al. (2012) is closest to ours
* utolsó két mondatothoz lás még 3.3 első bekezdését is

# 3 Model

* solutions to the normalization problem:
  * hierarchical output layer
  * Noise Contrastive Estimation
* jól le van írva a Log Bilinear Model
* 3.2 Maximum Entropy Features
  * maximum entropy features [are] an effective addition to a continuous space
    language model (Mikolov et al., 2011a)
* 3.3 Modeling Antonymy
  * semantic regularization

# 5 Comparison with Vector Offset Method

* after training with antonym constraints, we found that the vector offset
  method performs poorly
  * In future work we plan to explore methods of maintaining the vector offset
    property where it does well, while augmenting it in other cases such as
    antonymy
* [vector offset works only when] the negated form of a word (e.g.
  “illogical”) always follows the non-negated form

# References

* Wen-tau Yih, Geoffrey Zweig, and John C Platt (2012) Polarity inducing LSA
