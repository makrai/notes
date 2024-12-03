GLU Variants Improve Transformer
Noam Shazeer
arXiv:2002.05202 [cs.LG]

# Abstract

* Gated Linear Units (Dauphin+ 1612) consist of the
  * component-wise product of two linear projections,
    one of which is first passed through a sigmoid function
* Variations on GLU are possible, using
  different nonlinear (or even linear) functions in place of sigmoid
* We test these variants in the feed-forward sublayers of the Transf seq-to-seq
* some of them yield quality improvements over the typically-used ReLU or GELU

# 1 Introduction

* The Transformer [Vaswani+ 2017] sequence-to-sequence model
  alternates between multi-head attention, and what it calls
  "position-wise feed-forward networks" (FFN)
* The FFN takes a vector x (the hidden representation at a particular position
  in the sequence) and passes it through two learned linear transformations,
  (represented by the matrices W1 and W2 and bias vectors b1 and b2 ).
* rectified-linear (ReLU) [Glorot+ 2011] activation function applied between
  the two linear transformations
  ```
FFN(x, W1 , W2 , b1 , b2 ) = max(0, xW1 + b1 )W2 + b2
```
* Following the T5 codebase [Raffel+ 2019] 1 , we use a version with no bias:
```
FFNReLU (x, W1 , W2 ) = max(xW1 , 0)W2
```
* replacing the ReLU with other nonlinear activation functions such as
  * Gaussian Error Linear Units, GELU(x) = xΦ(x) [Hendrycks and Gimpel, 2016],
  * Swishβ (x) = xσ(βx) [Ramachandran+ 2017]

# 4 Conclusions

* We have extended the GLU family of layers and proposed their use in Transfor
* In a transfer-learning setup, the new variants seem to produce better
  * perplexities for the de-noising objective used in pre-training, as well as
  * results on many downstream language-understanding tasks
* simple to implement, and have no apparent computational drawbacks
* We offer no explanation as to why these architectures seem to work; we
  attribute their success, as all else, to divine benevolence
