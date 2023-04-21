Position Information in Transformers: An Overview
Philipp Dufter, Martin Schmitt, Hinrich Schütze
Computational Linguistics, Volume 48, Issue 3 September 2022

# Abstract

* Transformers are arguably the main workhorse in recent NLP research
  * hE invariant with respect to reordering of the input
* we provide an overview and theoretical comparison of existing position meths
  * a vibrant and extensive research area; 
  * unified notation and systematization of different approaches
    along important model dimensions; 
  * characteristics of an application for selecting a position encoding; and 
  * provide stimuli for future research

# 1 Intro

* position information can be added by using
  position embeddings, manipulating attention matrices, or alternative methods
  such as preprocessing the input with a recurrent neural network. Overall,
  * absolute or relative position information to Transformer models.
* many papers analyze and compare a subset of position embedding variants.
  * no broad overview of relevant work on position information in Transformers
* we provide a theoretical comparison of over 30 Transformer position models
  * systematization of different approaches along important model dimensions,
    * eg number of learnable parameters, and elucidate their differences by
    * unified notation
    * not to identify the best way to model position information in Transformer
    * common components and blind spots of current research efforts

# 2. Background

## 2.4 Encoder–Decoder

* different set-ups for using a Transformer model. One common possibility is to
  * encoder only. For example, BERT (Devlin+ 2019) uses a Transformer model
    T(X) as encoder to perform masked language modeling.  In contrast, a
  * traditional sequence-to-sequence approach by adding a decoder
    * The decoder works almost identically to the encoder with two exceptions:
      * The upper triangle of the attention matrix A is usually masked
        in order to block information flow from future positions
        during the decoding process. 
      * The output of the encoder is integrated through a cross-attention layer
        inserted before the feed-forward layer. See Vaswani+ (2017) for details
    * differences between an encoder and encoder–decoder architecture are
      mostly irrelevant for the injection of position information and many
      architectures rely just on encoder layers
    * for the sake of simplicity we will talk about Transformer encoder blocks
      in general for the majority of the article
    * See §4.4 for position encodings that are tailored for encoder–decoder
     
# 3. Recurring Concepts in Position Information Models 4

## 3.1 Reference Point: Absolute vs. Relative Position Encoding

* absolute position of a unit within a sentence vs relative to other units.
* never been shown conclusively that relative position encoding outperforms an
  * both systems continue to co-exist— even in the most recent works (see Table
* Learnable relative position embeddings do have the undeniable disadvantage
  that they have to consider twice as many different positions (for relative
  positions to the right and to the left of a word). Hence, in general, they
  * more parameters. Table 1 refers to this distinction as reference point .

## 3.2 Injection Method

### Adding Position Embeddings (APE). One common approach is to

* add position embeddings to the input
  before it is fed to the actual Transformer model: If U ∈ Rtmax ×d is the
  matrix of unit embeddings, a matrix P ∈ Rtmax ×d representing the position
  information is added and their sum is fed to the Transformer model: T(U + P).

### Modifying Attention Matrix (MAM). Instead of adding position embeddings,

* directly modify the attention matrix
  * eg by adding absolute or relative position biases to the matrix (fig 2)
    (see Figure 2)
* matrix A can then be decomposed into
  unit–unit interactions as well as unit–position and position–position
  * we omit the scaling factor for the attention matrix for simplicity.

### `***`

* we make a distinction between these two approaches
for multiple reasons: 
  * While adding position embedding results, among other effects, in a modified
    attention matrix, MAM only modifies the attention matrix. 
  * APE involves learning embeddings for position information whereas
    MAM is often interpreted as adding or multiplying scalar biases
    to the attention matrix A (see Figure 2). 
  * APE is often tied to individual positions and
    * interactions between two positions are computed based on parameters by
    * MAM often directly models the interaction of two positions.

* methods using relative position encodings exclusively rely on MAM, not APE.
  * because relative position encodings consider pairs of positions and their
    relation to each other and an attention matrix already models pairs of
    positions and their interaction
  * APE relies on the fact that
    every input unit can be assigned a unique position embedding
    * As each unit has a different relative position to each other’s unit,
      APE is inherently incompatible with relative position information.
  * absolute position information is, in principle, compatible with MAM
    (see Shaw, Uszkoreit, and Vaswani 2018), there is also a 
    nL strong correlation between absolute position encodings and APE.
    * Probably, this is because
      absolute position encodings consider only a single time step at a time,
      => more intuitive to model position information at the unit level and
      directly assign position embeddings one unit at a time.

## 3.3 Recurring Integration

* In theory, there are many possibilities for integrating position information
  into a Transformer model, but
  in practice the information is either
  integrated in the input, at each attention matrix, or
  directly before the output
* When adding position information at the beginning, it only affects the first
  layer and thus has to be propagated to upper layers indirectly.  Therefore,
  * reminding the model of position information in each layer seems desirable.
  * de[priv]es the model the flexibility of choosing how strong position
    information should influence word representations in higher layers
* Often, APE is only added at the beginning, and
  MAM approaches are used for each layer and attention head.  There is,
  * no theoretical reason to pair these approaches in that manner.
* The `recurring` column in Table 1: position info is added in each layer anew.

## 3.4 Fundamental Model Properties

* three other properties per model in Table 1: 
* `Learnable`: whether the position information model is learned from data
* `#Param` provides the number of (trainable) parameters the position
  information model uses. And 
* `Unbound` concerns the (theoretical) ability of a position info model to
  generalize beyond the longest input it has seen during training.
  * more flexibility to adapt the position representations to the task. On
  * hE adds parameters, which can lead to overfitting
  * For trainable position information models, there is a notable
    trend toward cutting the number of parameters while maintaining good
    performance; see for example Raffel+ (2020)
  * often bounded values can suffice in practice.
  * Schemes where high length values are clipped, which means that 
    * ie high position values are not distinguished anymore, are
    * also considered bounded even though inputs of any length can be processed

# 4. Current Position Information Models 8

* term
  * position information model = a method that integrates position information;
  * position encoding refers to a position ID associated with units,
    * eg numbered from 0 to t, or assigning relative distances
    * a numerical vector associated with a position encoding.  For the sake of
* subsections along two dimensions: reference point and topic. We chose
  * reference point as it reflects a foundational design choice for each
    * This dimension can have the values absolute, relative, or both.  Further,
  * the prevalent topic of each paper as second dimension, that is,
    generic, sinusoidal, graphs, decoder, crosslingual, and analysis. The
    * not to create a mutually exclusive or exhaustive classification. Given
    * each paper usually deals with multiple aspects of position information
      * sometimes proposes multiple models, this would be challenging/impossib.
    * eg a reader interested in encoder–decoder models or decoder-only models
      will find relevant papers in the topic “Decoder.” Conversely,
    * papers listed in other topics might be applicable or relevant for
    * Table 2 shows which papers were assigned to which categories

## 4.1 Generic

* papers discussed here exhibit a great variety ranging from
  * learned absolute position embeddings in the original Transf (Vaswani+ 2017)
  * complex-valued embeddings (Wang+ 2020) to
  * adding a recurrent neural network layer before the Transformer
    (Neishi and Yoshinaga 2019). All these works do
* no particular mathematical characteristic or a specific theme, such as
  * the most fundamental and original position information models as well as
    later ones that are equally general for processing sequential data structs.

### 4.1.1 Absolute Position Encodings

* The original Transformer paper considered absolute position encodings. One of
  * one of the two approaches proposed by Vaswani+ (2017) follows Gehring+
    (2017) and learns a position embedding matrix P ∈ Rtmax ×d corresponding to
    the absolute positions 1, 2, ... , tmax − 1, tmax in a sequence. This
    matrix is simply added to the unit embeddings U before they are fed to the
    Transformer model (APE).
  * In the simplest case, the position embeddings are randomly initialized and
    then adapted during training of the network (Gehring+ 2017; Vaswani+ 2017;
    Devlin+ 2019). Gehring+ (2017) find that adding position embeddings only
    helps marginally in a convolutional neural network. A Transformer model
    without any position information, however, performs much worse for some
    tasks—see for example Wang+ 2019, Wang+ 2021.
* axial
  * For very long sequences, that is, large tmax , the number of parameters
    added with P is significant
  * Kitaev, Kaiser, and Levskaya (2020) proposed
  * a more parameter-efficient factorization called
    axial position embeddings.  Although their
  * method is not described in the paper, a descript can be found in their code
  * Intuitively, 2 embeds
    * one embedding that marks a larger segment and a
    * second embedding that indicates the position within each segment; see
  * Figure 3 Overview of the structure of P with axial position embeddings by
  Kitaev, Kaiser, and Levskaya (2020). They use two position embeddings, which
  can be interpreted as encoding a segment (bottom, P(2) ) and the position
  within that segment (top, P(1) ). This factorization is more
  parameter-efficient, especially for long sequences.
  * More specifically, the matrix P gets split into two embedding matrices P(1)
* Liu+ (2020) argue that position embeddings should be parameter-efficient,
  data- driven, and should be able to handle sequences that are longer than any
  sequence in the training data. They propose a new model called flow-based
  Transformer (or FLOATER), where they model position information with a
  continuous dynamic model.  More specifically, consider P as a sequence of
  timesteps p1 , p2 , ... , ptmax . They suggest modeling position information
  as a continuous function p : R+ → Rd with

                  Z t p(t) = p(s) + s ␁ h τ, p(τ ), θh dτ (6)

for 0 ≤ s < t with some initial value for p(0), where h is some function, for
example, a neural network with parameters θh . In the simplest case they then
define pi := p(i∆t) for some fixed offset ∆t. They experiment both with adding
the information only in the first layer and at each layer (layerwise APE). Even
though they share parameters across layers, they use different initial values
p(0) and thus have different position embeddings at each layer. Sinusoidal
position embeddings (see §4.2) are a special case of their dynamic model.
Further, they provide a method to use the original position em- beddings of a
pretrained Transformer model while adding the dynamic model during finetuning
only. In their experiments they observe that FLOATER outperforms learned and
sinusoidal position embeddings, especially for long sequences. Further, adding
position information at each layer increases performance.

* Another approach to increase the Transformer efficiency both during training
  and inference is to keep tmax small. The Shortformer by Press, Smith, and
  Lewis (2021) caches previously computed unit representations and therefore
  does not need to handle a large number of units at the same time. This is
  made possible by what they call position-infused attention, where the
  position embeddings are added to the keys and 742Dufter, Schmitt, and Schütze
  queries, but not the values. Thus, the values are position independent and
  representa- tions from previous subsequences can seamlessly be processed.
  More specifically, they propose | Ã ∼ (U + P)W(q) W(k) (U + P)| (7)

M̃ = SoftMax(Ã)UW(v)

The computation of the attention matrix Ā still depends on absolute position
encod- ings in Shortformer, but M̄ does not contain it, as it is only a weighted
sum of unit embeddings in the first layer. Consequently, Shortformer can attend
to outputs of pre- vious subsequences and the position information has to be
added in each layer again.  Press, Smith, and Lewis (2021) report large
improvements in training speed, as well as language modeling perplexity.

* While the former approaches all follow the APE methodology, Wang+ (2020)
  propose an alternative to simply summing position and unit embeddings.
  Instead of having one embedding per unit, they model the representation as a
  function over positions. That is, instead of feeding Ut + Pt to the model for
  position t, they suggest modeling the embedding of unit u as a function g(u)
  : N → Rd such that the unit has a different embedding depending on the
  position at which it occurs. After having pro- posed desired properties for
  such functions (position-free offset and boundedness), they introduce
  complex-valued unit embeddings where their k-th component is defined as
  follows: ␐ ␑ (u) (u) (u) g(u) (t)k = rk exp i(ωk t + θk ) (8)

Then, r(u) , ω(u) , θ(u) ∈ Rd are learnable parameters that define the unit
embedding for the unit u. Their approach can also be interpreted as having a
word embedding, pa- rameterized by r(u) , that is, component-wise multiplied
with a position embedding, parameterized by ω(u) , θ(u) . The number of
parameters dedicated to the position model therefore does not depend on the
number tmax of considered positions but rather on the vocabulary size n. In
total, 3nd trainable parameters are used compared to nd parameters of a
traditional lookup table. We thus mark the number of parameters of the position
model alone as 3nd − nd = 2nd in Table 1 because this difference is responsible
for covering position information. Wang+ (2020) test their position-sensitive
unit embeddings not only on Transformer models, but also on static embeddings,
LSTMs, and CNNs, and observe large performance improvements.

### 4.1.2 Relative Position Encodings

* Among the first, Shaw, Uszkoreit, and Vaswani (2018) introduced an
  alternative method for incorporating both absolute and relative position

## 4.2 Sinusoidal 16

## 4.3 Graphs

## 4.4 Decoder

## 4.5 Crosslingual

## 4.6 Analysis

# 5. Conclusion 24
