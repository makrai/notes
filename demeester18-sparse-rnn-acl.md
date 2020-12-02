Predefined Sparseness in Recurrent Sequence Models
Thomas Demeester, Johannes Deleu, Fréderic Godin, Chris Develder
CoNLL 2018

# Abstract

* Inducing sparseness while training neural networks ... starting from a dense
  * advantage does not hold during training
* We propose techniques to enforce sparseness upfront
  * in LM, we show how to increase hidden state sizes in recurrent layers
    without increasing the number of parameters, leading to more expressive modl
  * for sequence labeling, we show that word embeddings with predefined
    sparseness lead to similar performance as dense embeddings, at a fraction of
    the number of trainable parameters
