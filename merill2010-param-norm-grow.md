Effects of Parameter Norm Growth During Transformer Training:
  Inductive Bias from Gradient Descent
William Merrill, Vivek Ramanujan, Yoav Goldberg, Roy Schwartz, Noah Smith
EMNLP 2021

https://github.com/viking-sudo-rm/norm-growth

* The the widely adopted transformer has high capacity
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
    compared to the full network family that
    * can be described in terms of formal languages and automata
  * suggest: saturation is a new characterization of an inductive bias
    implicit in GD of particular interest for NLP
* We leverage the emergent discrete structure in a saturated transformer to
  analyze the role of different attention heads, finding that
  * some heads focus locally on a small number of positions, while
  * other heads compute global averages, allowing counting
* We believe understanding the interplay between these two capabilities may
  shed further light on the structure of computation within large transformers

# 1 Intro

* Overparameterized transformers are unversal approximators (Yun+ 2020),
  suggesting their generalization performance ought to rely on
  useful biases or constraints imposed by the learning algorithm
  * attempts to study these biases in transformers
    (Rogers+ 2020; Lovering+ 2021)
  * remains an interesting open question what the biases are, or even
    how to characterize them in a way relevant to the domain of language
* thoroughly understanding the dynamics of gradient descent (GD) might clarify
  the linguistic biases of transformers, and
  the types of representations they acquire
* We start by making a potentially surprising empirical observation (§3)
  * norm growth: growing parameter norm during training
  * the parameter l 2 norm grows proportional to √t (where t is the timestep)
    during the training of T5 (Raffel+ 2019) and other transformers
  * Previous work has analyzed norm growth in simplified classes of feedforward
    (Li and Arora, 2019; Ji and Telgarsky, 2020)
  * not thoroughly demonstrated or studied in transformers (complicated, pract)
* Our main contribution is
  analyzing the effect of norm growth on the representations within the
  transformer (§4), which control the network’s grammatical generalization
  * With some light assumptions, we prove that
    any network where the parameter norm diverges during training
    approaches a saturated network (Merrill+ 2020):
    a restricted network variant whose
    discretized reprs are understandable in terms of formal langs & automata
  * Empirically, we find that
    internal representations of pretrained transformers approximate their
    saturated counterparts, but
    for randomly initialized transformers, they do not
    * suggests that the norm growth implicit in training
      guides transformers to approximate saturated networks =>
      * studying the latter (Merrill, 2019) is a way to analyze the linguistic
        biases of NLP architectures and the structure of their representations
* saturation permits two useful types of attention heads within a transformer:
  (Merrill, 2019; Bhattamishra+ 2020)
  * one that locally targets a small number of positions, and
  * one that attends uniformly over the full sequence,
    enabling an “average” operation
* Empirically, we find that
  both of these head types emerge in trained transformer language models
  * These capabilities reveal
    how the transformer can process various formal languages, and could also
    suggest how it might represent the structure of natural language
* Combined, our theoretical and empirical results shed light on the
  linguistic inductive biases imbued in the transformer architecture by GD, and
  could serve as a tool to analyze transformers, visualize them, and improve th
* we discuss potential causes of norm growth in §5
  * We prove transformers are approximately homogeneous
    (Ji and Telgarsky, 2020)
    * a property that has been extensively studied in deep learning theory
  * With some simplifying assumptions, we then show
    how homogeneity might explain the √t growth observed for T5

# 6 Conclusion

* We empirically found that ||θ t|| grows ∝ √t during T5 pretraining
  * may be caused by the approximate homogeneity of the transformer
  * We proved that norm growth induces saturation
  * empirically, T5 and other large transformers become approximately saturated
    through their pretraining
  * in highly saturated transformer language models, we found the
    attention heads largely split between two distinct behaviors that
    can be roughly interpreted as argmax and mean operations
* no precise formal characterization of “semi-saturated” transformers,
  * we conjecture their capacity resembles that of the saturated models
  * further analyzing the capabilities of saturated attention may clarify
    the linguistic biases that emerge in transformers through training, and
    the mechanisms they use to represent linguistic structure
