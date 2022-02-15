Effects of Parameter Norm Growth During Transformer Training:
  Inductive Bias from Gradient Descent
William Merrill, Vivek Ramanujan, Yoav Goldberg, Roy Schwartz, Noah Smith
EMNLP 2021

* The capacity of the widely adopted transformer is high
* they learn successfully due to inductive bias in the training routine,
  typically a variant of gradient descent (GD)
* To better understand this bias, we study the
  tendency for transformer parameters to grow in magnitude (ℓ2 norm) during tra
  * its implications for the emergent representations
    within self attention layers
* Empirically, we document norm growth in the training of transformer LMs,
  including T5, during its pretraining
* we prove: As the parameters grow in magnitude,
  the network approximates a discretized network with saturated activation func
  * Such "saturated" networks are known to have a reduced capacity
    compared to the full network family that can be described in terms of
    formal languages and automata
  * suggest: saturation is a new characterization of an inductive bias
    implicit in GD of particular interest for NLP
* We leverage the emergent discrete structure in a saturated transformer to
  analyze the role of different attention heads, finding that
  * some heads focus locally on a small number of positions, while
  * other heads compute global averages, allowing counting
* We believe understanding the
  interplay between these two capabilities may shed further light on the struct
  of computation within large transformers
