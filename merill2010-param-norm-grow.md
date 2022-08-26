Effects of Parameter Norm Growth During Transformer Training:
  Inductive Bias from Gradient Descent
William Merrill, Vivek Ramanujan, Yoav Goldberg, Roy Schwartz, Noah Smith
EMNLP 2021

https://github.com/viking-sudo-rm/norm-growth

# Abstract

* transformers learn successfully due to inductive bias in the training routine
  * typically a variant of gradient descent (GD)
* To better understand this bias, we study the
  tendency for transformer parameters to grow in magnitude (ℓ2 norm) during tra
  * its implications for the emergent reprs within self attention layers
* Empirically, we document norm growth in the training of transformer LMs,
  including T5, during its pretraining
* we prove: As the parameters grow in magnitude,
  the network approximates a discretized network with saturated activation func
  * Such "saturated" networks are known to have a reduced capacity
    compared to the full network family that
    * can be described in terms of formal languages and automata
  * suggest:
    saturation is a new characterization of an inductive bias implicit in GD
    * of particular interest for NLP
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
  the linguistic biases of transformers, and the types of reprs they acquire
* We start by making a potentially surprising empirical observation (§3)
  * norm growth: growing parameter norm during training
  * the parameter l 2 norm grows proportional to √t (where t is the timestep)
    during the training of T5 (Raffel+ 2019) and other transformers
  * Previous work has analyzed norm growth in simplified classes of feedforward
    (Li and Arora, 2019; Ji and Telgarsky, 2020)
  * not thoroughly demonstrated or studied in transformers
* Our main contribution (§4) is
  analyzing the effect of norm growth on the reprs in the transformer
  * norm growth which control the network’s grammatical generalization
  * With some light assumptions, we prove that
    any network where the parameter norm diverges during training
    approaches a saturated network (Merrill+ 2020)
    * a restricted network variant whose discretized reprs are understandable
      in terms of formal langs & automata
  * Empirically, we find that internal representations of pretrained
    transformers approximate their saturated counterparts, but for randomly
    initialized transformers, they do not
    * suggests that the norm growth implicit in training guides transformers to
      approximate saturated networks =>
    * studying saturated networks (Merrill, 2019) is a way to analyze the ling
      biases of NLP architectures and the structure of their representations
* saturation permits two useful types of attention heads within a transformer:
  (Merrill, 2019; Bhattamishra+ 2020)
  * one that locally targets a small number of positions, and
  * one that attends uniformly over the full sequence,
    enabling an “average” operation
* Empirically, we find that both of these head types emerge in trained
  transformer language models
  * These capabilities
    reveal how the transformer can process various formal languages, and could
    also suggest how it might represent the structure of natural language
* Combined, our theoretical and empirical results shed light on the linguistic
  inductive biases imbued in the transformer architecture by GD, and could
  serve as a tool to analyze, visualize, and improve transformers
* we discuss potential causes of norm growth in §5
  * We prove transformers are approximately homogeneous (Ji & Telgarsky, 2020)
    * a property that has been extensively studied in deep learning theory
  * With some simplifying assumptions, we then show
    how homogeneity might explain the √t growth observed for T5

# 2 Background and Related Work

## 2.1 GD and Deep Learning Theory

* parameters do not converge to a finite local minimum during GD training
  * the once conventional wisdom challenged
  * A simple case for generalization properties of GD is matrix factorization
    (Gunasekar+ 2017; Arora+ 2019; Razin and Cohen, 2020)
    * deep matrix factorization leads to low-rank matrix solutions
    * Razin and Cohen (2020) argued theoretically that this bias of GD cannot
      be explained as an implicit regularizer minimizing some norm
      * cases where all parameter norms diverge during GD
  * Similar ideas have emerged in recent works studying feedforward networks
    * biasless ReLU networks with cross-entropy loss, Poggio+ (2019, 2020) show
    * the magnitude (l 2 norm) of the parameter vector continues to grow during
      GD, while its direction converges
  * Li and Arora (2019) present a similar argument for scale-invariant
    networks, meaning that scaling the parameters by a constant does not change
    the output
  * homogeneous networks, Ji and Telgarsky (2020) show that the gradients
    become aligned as t → ∞ ie their direction converges to the parameter
    direction. This means
  * the norm will grow monotonically with t
  * these suggests that GD follows a norm-increasing trajectory along which
    network behavior stabilizes. These analyses motivate investigation of this
    trajectory-driven perspective of training
* statistical perspective
  * the implications of these training dynamics for margin maximization
    (Poggio+ 2019; Nacson+ 2019; Lyu and Li, 2019)
  * works vary in the networks they consider and their assumptions, they
  * conclusions: GD follows trajectories diverging in the direction of a
    max-margin solution
    * As margin maximization produces a simple decision boundary, this property
      suggests better generalization than an arbitrary solution with low
      training loss
    * This point of view partially explains why growing norm is associated with
      better generalization performance

## 2.2 NLP and Formal Language Theory

* Past work characterizes the capacity of infinite-norm networks in terms of
  formal languages and automata theory
  * saturation (Merrill 2019; Merrill+ 2020) a framework for theoretical
    analysis of the capacity of NLP architectures.  A network is analyzed by
    assuming it saturates its nonlinearities, which means replacing functions
    like σ and tanh with step functions
  * definition of the saturated network sf (x; θ) is
    `sf (x; θ) = lim_{c→∞} f (x; cθ)`,  where the limit exists, and undefined els
* reduces continuous neural networks to discrete computational models
  resembling automata or circuits, making some kinds of
  * formal linguistic analysis easier
  * For many common architectures, the saturated capacity is known to be
    significantly weaker than the full capacity of the network with rational-va
  * eg one can hand-construct an RNN or LSTM encoding a stack in its recurrent
    memory (Kirov and Frank, 2012)
    * Stacks are useful for processing compositional structure in linguistics
    * saturated LSTM does not have enough memory to simulate a stack (Merrill)
      * resemble classical counter machines (Merrill, 2019): automata
      * limited in their ability to model hierarchical structure (Merrill, 20)
    * Experiments suggest that
      * LSTMs trained on synthetic tasks learn to implement counter memory
        (Weiss+ 2018; Suzgun+ 2019a), and that they
      * fail on tasks requiring stacks and other deeper models of structure
        (Suzgun+ 2019b)
      * LSTM language models trained on natural language data acquire saturated
        representations approximating counters (Shibata+ 2020)
* Merrill (2019) and Merrill+ (2020) extend saturation analysis to transformers
  * Saturated attention heads reduce to generalized hard attention, where the
    attention scores can tie
  * In the case of ties, the head output averages the positions with maximal sc
  * power is not fully understood, saturated transformers
  * can implement a counting mechanism similarly to LSTMs (Merrill+ 2020)
  * In practice (Bhattamishra+ 2020), transformers
    * can learn tasks requiring counting, and
    * they struggle when more complicated structural representations required
* attention patterns of certain heads can emulate bounded stacks, but that this
  ability falls off sharply for longer sequences (Ebrahimi+ 2020)
* Thus, the abilities of trained LSTMs and transformers appear to be predicted
  by the classes of problems solvable by their saturated counterparts
* Merrill+ (2020) conjecture that the saturated capacity might represent a
  class of tasks implicitly learnable by GD, but it is unclear a priori why
  this should be the case
  * This work aims to put this conjecture on more solid theoretical footing
  * approximate saturation arises in transformers as a result of norm growth
    during training. 4

# 3 Norm growth in transformers

* Fig. 1 shows that the T5 norm follows a t trend, where t is time in training
  * top right of Fig. 1 breaks down the growth trend by layer. Generally, the
    norm grows more quickly in later layers than in earlier √ ones, although
    always at a rate proportional to t. 5 Next, in the
  * bottom row of Fig. 1, we plot the cosine similarity between each parameter
    checkpoint θ t+1 and its prede θ t
    * rapidly approaches 1, suggesting the “direction” of the parameters (θ t
      /kθ t k) converges. The trend in
      * similar across layers
* We also train smaller transformer language models with 38M parameters on
  Wikitext-2 (Merity+ 2016) and the Penn Treebank (PTB; Marcus+ 1993). We
  * two variants of the transformer: pre-norm and post-norm, which vary in the
    relative order of layer normalization and residual connections (Xiong+
    2020). Every model exhibits norm growth over training
* remainder of this paper, we will discuss the
  * implications of this phenomenon for the linguistic biases of transformers,
  * causes of the trend rooted in the optimization dynamics

# 4 Effect of Norm Growth 3

* Prop 1: uniform norm growth across the network guides GD towards saturated
* If every scalar parameter θ t i diverges at the same rate up to a constant,
  then f converges pointwise to a saturated network
* uniform norm growth, ie no parameter can asymptotically dominate any other
* uniform growth implies directional convergence. Accepting uniform growth for
* we expect the growth trend to depend heavily on the learning rate schedule
  * As we will discuss later in §5

## 4.1 Saturated Transformers

* we now empirically measure the saturation levels in T5 and other transformers

### Large transformers are highly saturated

* We compare the pretrained transformers against a randomly initialized baselin
* similarity is higher for the pretrained network than the randomly initialized
  network, which, except for T5, is ∼0.  For T5 and XLNet, the similarity in
  the final layer is ≥0.9, whereas, for RoBERTa, the final similarity is 0.65
* For T5 and XLNet, similarity is higher in later layers, which is potentially
  surprising, as one might expect error to compound with more layers. This
  * may relate to the fact that the norm grows faster for later layers in T5
* why the similarity for BERT is lower than these models
  * As RoBERTa is architecturally similar to BERT besides longer training, we
    hypothesize that RoBERTa’s higher similarity is due to longer pretraining

### Small transformers reach full saturation

* ∗ -small transformers tended to be more saturated than the ∗ -base models
* Other possible explanations include differences in the initialization scheme,
  optimizer, and training objective (masked vs. next-word modeling)
  * See §A for full hyperparameters

## 4.2 Power of Saturated Attention

* theoretical background about saturated attention, largely by Merrill (2019)
  * Let H (sequence length n by model dimension d) be the input representation
    to a self attention layer. We assume a standard self attention mechanism
    with key, query, and value matrices K, Q, V. 8
  * Saturated attention resembles standard attention where softmax is
    constrained to a generalization of “argmax” (Merrill, 2019):
    s attn(H; Q, K, V ) = arg max(HQK^T H^T )HV

* define vectorized arg max(A) as a uniform distribution over all tied position
  * Saturated attention can retrieve the “maximum” value in a sequence
    according to some similarity matrix

* It is also capable of restricted counting (Merrill+ 2020)
  * two computational operations that are reducible to saturated self attention
    argmax and mean. Let h i represent the input representation at each time
    step 1 ≤ i ≤ n
  1. Argmax: Set V = Id. Then the
    * self attention mechanism computes a function recovering the element of H
      that maximally resembles h i according to a quadratic form M = KQ^T . If
      there is a tie for similarity, a uniform average of the maximal entries
  2. Mean: Parameterize the head to attend uniformly everywhere. Then the
    * Due to the summation in (1), the mean operation (or near variants of it)
      can be used to implement counting, which allows recognizing languages
      like a n b n c n (Merrill+ 2020). Empirically, Bhattamishra+ (2020)
      find trained networks can learn to recognize counter languages that rely
      on computing means, failing on more complicated languages like Dyck-2
      Our findings partially justify why transformers can learn these
      languages: they lie within the capacity of saturated transformers

## 4.3 Learned Attention Patterns

* We will evaluate if the saturated attention heads manifest the argmax and
  mean constructions from §4.2
* Are both patterns acquired in practice by our models?
  * We plot the distribution of the number of positions attended to by each
    head in the saturated PTB models in Fig. 3.  The distribution is
  * bimodal, with one mode at 1, and the other around 41, representing the mean
    sequence length of a 83-length encoder with positional masking to prevent
    lookahead
  * In the pre-norm transformer, which performs substantially better,
    there are also a small number of heads lying between the two modes
    * the function of these heads: future work

# 5 Explanation for Norm Growth

* grounded in results about norm growth from deep learning theory
* We do not analyze specific optimizers directly; instead,
  we analyze norm growth within simplified models of training dynamics taken
  from the literature
* We then evaluate how these candidate dynamics models fit T5’s training

## 5.1 Setup

* gradient flow to refer to GD's continuous relaxation, specified by an
  analogous differential equation:

## 5.2 Homogeneity

* homogeneous network well-studied in deep learning theo (Ji & Telgarsky, 2020)
* A function f (x; θ) is k-homogeneous in θ iff, for all c ≥ 0,
  f (x; cθ) = c^k f (x; θ)
  * homogeneous iff there exists some k such that f is k-homogeneous
* Many common components of modern neural networks are homogeneous
  (Li and Arora, 2019)

* various computations within a neural network preserve homogeneity (§C),
=> some full networks are also homogeneous. An example of a fully homogeneous
eg a feedforward ReLU network without bias terms


* Transformers are not homogeneous, but they are almost homogeneous. We formali
  * A scalar 11 function f (x; θ) is approximately k-homogeneous in θ iff
    there exist d, ρ s.t., for c ≥ 1 and ||θ|| ≥ ρ,
    |f (x; cθ) − c^k f (x; θ)| ≤ exp(−d||θ||)
  * In other words, as kθk grows, f approximates a homogeneous function with
    exponentially vanishing error
  * transformer encoders without biases are approximately 1-homogeneous (§D)
* In Fig. 4, we compare the cosine similarity of transformers with and without
  biases to their saturated variants, as a function of a constant c scaling
  their weights
  * An approximately homogeneous function 11 rapidly approach 1.0 as c increase
  * similar curves for transformers with and without biases, suggesting
    biasless transformers are similarly homogeneous to transformers with biases
  * footnote: Lyu and Li (2019) find similar results for feedforward ReLU
    * puzzle why networks with biases appear similarly homogeneous to those
      without biases
* Since multiplying two homogeneous functions adds their homogeneity, a
  transformer encoder followed by a linear classifier is approximately 2-
  homogeneous. A key property of homogeneous functions is
* Euler’s Homogeneity Theorem: the derivative of a k-homogeneous function is (k
  − 1)-homogeneous.  Thus, we will assume the gradients of the linear
  classifier output are roughly 1-homogeneous, which under simple GD implies:
* Assumption 1 Let θ t include all encoder and classifier parameters. Let ∝ ∼
  mean “approximately proportional to”. For large enough t during transformer
  training, ||δ t || ∝ ∼ η t ||θ t ||

## 5.3 Aligned Dynamics

* the first candidate dynamics model: aligned dynamics (Ji and Telgarsky, 2020)
* homogeneous networks with an exponential binary classification loss and
  gradient flow,
  * the parameters converge in direction, and that the gradients become aligned
    meaning that θ t ^T · δ t → ||θ t || ||δ t || (Ji and Telgars||y 2020)
* unclear whether transformers will follow aligned dynamics,
  * we entertain this as one hypothesis
  * Under Ass. 1, alignment implies Z t X ∝ kθ t k ≈ kδ i k ∼ η t kθ t kdt
  * With the η t = 1/ √t schedule  used by T5 (Raffel+ 2019), kθ t k ∝ exp t
  * This is asymptotically faster than the observed √t growth,
    suggesting an alternate dynamics might be at play

## 5.4 Misaligned Dynamics

* Our second candidate model of training is misaligned dynamics, which follows
* assuming the gradients are misaligned (i.e., θ t ^T · δ t = 0), which
  hold for scale-invariant networks (Li and Arora, 2019) and
    in expectation for random normal gradients. Misalignment implies (derived
* reduces to ||θ t || ∼ √t, as observed empirically for T5
* We now further test whether misaligned dynamics are a good fit for T5

## 5.5 Evaluation

* We measure the gradient alignment over the course of training T5. Our
  * left of Fig. 5, the alignment
    * initially rapidly increases to ∼0.15, and then
    * decays to near 0
    * This supports the hypothesis that the T5 dynamics are misaligned, since
      the similarity is never high, and may be approaching 0
* right of Fig. 5, we plot step size over training
  in order to evaluate the validity of Ass. 1
  * At the beginning of training, a chaotic step size seems reasonable, as it
    is hard to predict the dynamics before approximate homogeneity takes hold
  * For large t, Ass. 1 combined with the T5 learning rate schedule predicts
    step size should be roughly constant
    * 13 This is not exactly what we find: for large t,
      ||δ t || grows gradually with t
    * However, the absolute change in step size is small:
      < 20 across 220M parameters
* Thus, we believe Ass. 1 is not unreasonable
  * hE it would be interesting to understand
    what properties of the optimizer can explain the slight growth in step size

## 5.6 Weight Decay

* One feature of practical training schemes not considered in this section is
* When applied to standard GD, weight decay
  can be written δ t = −η t ∇ θ t L − λθ t
* Intuitively, it might hinder norm growth if λ is large
* Common wisdom says that
  weight decay improves generalization by keeping kθ t k small
* hE Goldblum+ (2020)
  challenges the assumption that a bias towards small norm is beneficial
  * suggesting the benefit of weight decay may arise from
    more subtle effects on the GD trajectory
* In §F, we report
  preliminary experiments testing the effect of weight decay on norm growth
  Indeed, if λ is set too large, weight decay can prevent norm growth, but
  within the standard range of values for λ, we find norm growth
* However, it is possible these results may change if the optimizer or other
  hyperparameters are varied

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
