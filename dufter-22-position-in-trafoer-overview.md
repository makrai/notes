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
  * absolute or relative position information to Transformer models
* many papers analyze and compare a subset of position embedding variants
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
        during the decoding process
      * The output of the encoder is integrated through a cross-attention layer
        inserted before the feed-forward layer. See Vaswani+ (2017) for details
    * differences between an encoder and encoder–decoder architecture are
      mostly irrelevant for the injection of position information and many
      architectures rely just on encoder layers
    * for the sake of simplicity we will talk about Transformer encoder blocks
      in general for the majority of the article
    * See §4.4 for position encodings that are tailored for encoder–decoder

# 3. Recurring Concepts in Position Information Models 4

## 3.1 Reference Point: Absolute vs Relative Position Encoding

* absolute position of a unit within a sentence vs relative to other units
* never been shown conclusively that relative position encoding outperforms an
  * both systems continue to co-exist— even in the most recent works (see Table
* Learnable relative position embeddings do have the undeniable disadvantage
  that they have to consider twice as many different positions (for relative
  positions to the right and to the left of a word). Hence, in general, they
  * more parameters. Table 1 refers to this distinction as reference point

## 3.2 Injection Method

### Adding Position Embeddings (APE), (3)

* add position embeddings to the input
  before it is fed to the actual Transformer model: If U ∈ Rtmax ×d is the
  matrix of unit embeddings, a matrix P ∈ Rtmax ×d representing the position
  information is added and their sum is fed to the Transformer model: T(U + P)

### Modifying Attention Matrix (MAM), (4)

* directly modify the attention matrix
  * eg by adding absolute or relative position biases to the matrix (fig 2)
    (see Figure 2)
* matrix A can then be decomposed into
  unit–unit interactions as well as unit–position and position–position
  * we omit the scaling factor for the attention matrix for simplicity

### `***`

* we make a distinction between these two approaches
for multiple reasons:
  * While adding position embedding results, among other effects, in a modified
    attention matrix, MAM only modifies the attention matrix
  * APE involves learning embeddings for position information whereas
    MAM is often interpreted as adding or multiplying scalar biases
    to the attention matrix A (see Figure 2)
  * APE is often tied to individual positions and
    * interactions between two positions are computed based on parameters by
    * MAM often directly models the interaction of two positions
* methods using relative position encodings exclusively rely on MAM, not APE
  * because relative position encodings consider pairs of positions and their
    relation to each other and an attention matrix already models pairs of
    positions and their interaction
  * APE relies on the fact that
    every input unit can be assigned a unique position embedding
    * As each unit has a different relative position to each other’s unit,
      APE is inherently incompatible with relative position information
  * absolute position information is, in principle, compatible with MAM
    (see Shaw, Uszkoreit, and Vaswani 2018), there is also a
    nL strong correlation between absolute position encodings and APE
    * Probably, this is because
      absolute position encodings consider only a single time step at a time,
      => more intuitive to model position information at the unit level and
      directly assign position embeddings one unit at a time

## 3.3 Recurring Integration

* In theory, there are many possibilities for integrating position information
  into a Transformer model, but
  in practice the information is either
  integrated in the input, at each attention matrix, or
  directly before the output
* When adding position information at the beginning, it only affects the first
  layer and thus has to be propagated to upper layers indirectly.  Therefore,
  * reminding the model of position information in each layer seems desirable
  * de[priv]es the model the flexibility of choosing how strong position
    information should influence word representations in higher layers
* Often, APE is only added at the beginning, and
  MAM approaches are used for each layer and attention head.  There is,
  * no theoretical reason to pair these approaches in that manner
* The `recurring` column in Table 1: position info is added in each layer anew

## 3.4 Fundamental Model Properties

* three other properties per model in Table 1:
* `Learnable`: whether the position information model is learned from data
* `#Param` provides the number of (trainable) parameters the position
  information model uses. And
* `Unbound` concerns the (theoretical) ability of a position info model to
  generalize beyond the longest input it has seen during training
  * more flexibility to adapt the position representations to the task. On
  * hE adds parameters, which can lead to overfitting
  * For trainable position information models, there is a notable
    trend toward cutting the number of parameters while maintaining good
    performance; see for example Raffel+ (2020)
  * often bounded values can suffice in practice
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
      * sometimes proposes multiple models, this would be challenging/impossib
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
    later ones that are equally general for processing sequential data structs

### 4.1.1 Absolute Position Encodings

* The original Transformer paper considered absolute position encodings
  * one of the two approaches proposed by Vaswani+ (2017)
    follows Gehring+ (2017) and learns a position embedding matrix P ∈ Rtmax ×d
    corresponding to the absolute positions 1, 2, ... , tmax − 1, tmax in a seq
    * This matrix is simply added to the unit embeddings U
      before they are fed to the Transformer model (APE)
  * In the simplest case, the position embeddings are randomly initialized and
    then adapted during training of the network
    (Gehring+ 2017; Vaswani+ 2017; Devlin+ 2019)
  * Gehring+ (2017): adding position embeddings only helps marginally in a CNN
  * A Transformer model without any position information performs much worse
    for some tasks—see for example Wang+ 2019, Wang+ 2021
* axial position embeddings (Kitaev, Kaiser, and Levskaya 2020)
  * For very long sequences, ie large tmax, the number of parameters is signif
  * axial position embeddings: * a more parameter-efficient factorization
  * method not described in the paper, a descript can be found in their code
  * Intuitively, 2 embeds
    * one embedding that marks a larger segment and a
    * second embedding that indicates the position within each segment
  * Figure 3 overviews the structure of P with axial position embeddings by
  * more parameter-efficient, especially for long sequences
* flow-based Transformer (or FLOATER, Liu+ 2020)
  * position embeddings should be parameter-efficient, data-driven, and should
    be able to handle seqs that are longer than any seq in the training data
  * model position information with a continuous dynamic model.  More
    * consider P as a sequence of timesteps p1 , p2 , ... , ptmax
    * They suggest modeling position information as a continuous function p :
      R+ → Rd with `Z t p(t) = p(s) + s ␁ h τ, p(τ ), θh dτ` for 0 ≤ s < t with
      * some initial value for p(0), where
        h is some function, for example, a neural network with parameters θh
        In the simplest case they then
  * experiment both with adding the information
    only in the first layer and at each layer (layerwise APE). Even though they
  * share parameters across layers, they use
  * different initial values p(0) and thus have
  * => different position embeddings at each layer
  * Sinusoidal position embeddings (see §4.2) are a special case of their
  * they provide a method to
    use the original position embeddings of a pretrained Transformer model
    while adding the dynamic model during finetuning only. In their experiments
  * outperforms learned and sinusoidal position embeddings,
    especially for long sequences
  *  adding position information at each layer increases performance
* Shortformer
  * Another approach to increase the Transformer efficiency both during
    training and inference is to keep tmax small. The Shortformer by
  * Press, Smith, and Lewis (2021)
  * cache previously computed unit representations and therefore does
    not need to handle a large number of units at the same time. This is
  * made possible by what they call position-infused attention, where the
    position embeddings are added to the keys and queries, but not the values
    Thus, the values are position independent and
    representations from previous subsequences can seamlessly be processed

             | Ã ∼ (U + P)W(q) W(k) (U + P)|; M̃ = SoftMax(Ã)UW(v)

  * The computation of the attention matrix Ā still depends on absolute
    position encodings in Shortformer, but
    M̄ does not contain it, as it is only a weighted sum of unit embeddings in
    the first layer
    => Shortformer can attend to outputs of previous subsequences and the
    position information has to be added in each layer again
  * large improvements in training speed, as well as LM perplexity
* While the former approaches all follow the APE methodology, Wang+ (2020)
  * simply summing position and unit embeddings
  * Instead of having one embedding per unit, they
    model the representation as a function over positions
    ie instead of feeding Ut + Pt to the model for position t, they suggest
    modeling the embedding of unit u as a function g(u) : N → Rd such that the
    unit has a different embedding depending on the position at which it
    occurs. After having proposed
  * desired properties for such functions (position-free offset & boundedness)
  * complex-valued unit embeddings where
    their k-th component: ␐ ␑ (u) (u) (u) g(u) (t)k = rk exp i(ωk t + θk ) (8)
  * Then, r(u) , ω(u) , θ(u) ∈ Rd are learnable parameters that define the unit
  * can also be interpreted as having a word embedding, parameterized by r(u) ,
    that is, component-wise multiplied with a position embedding, parameterized
    by ω(u) , θ(u) . The
  * number of parameters dedicated to the position model therefore does
    not depend on the number tmax of considered positions but
    rather on the vocabulary size n. In total,
    * `3nd` trainable parameters are used
      compared to nd parameters of a traditional lookup table
    * ie the position model alone as 3nd − nd = 2nd in Table 1 because this
  * test also on static embeddings, LSTMs, and CNNs, and observe
    large performance improvements

### 4.1.2 Relative Position Encodings

* Among the first, Shaw, Uszkoreit, and Vaswani (2018) introduced an
  * incorporating both absolute and relative position encodings. In their
  * absolute variant: they propose changing the computation to
    `Ats ∼ Ut | W(q) W(k) Us + a(t,s)` (9)
    where a(t,s) ∈ Rd models the interaction between positions t and s.  Further,
    they modify the computation of the values to
    `Mt = SoftMax(A)ts W(v) Us + a(t,s) (10) s=1` (v)
    where a(t,s) ∈ Rd models again the interaction. Although it
    * cannot directly be compared with the effect of simple addition of position
      embeddings, they roughly omit the position–position interaction and have
      only one unit–position term. In addition, they do
    * not share the projection matrices but
      directly model the pairwise position interaction (k) with the vectors a
    * ablation analysis they found that solely adding a(t,s) might be sufficient
  * relative positions they simply set a(t,s) := w(clip(s−t,r)) , (11)
    * To reduce space complexity, they share the parameters across attent heads
    * not explicitly mentioned in their paper we understand that
      they add the position information in each layer but do
      not share the parameters.  The authors find that relative position
    * perform better in machine translation and the combination of
      absolute and relative embeddings does not improve the performance
* Dai+ (2019) propose the Transformer-XL model. The main objective is to cover
  * goal: long sequences and to
    overcome the constraint of having a fixed-length context. To this end they
  * fuse Transformer models with recurrence. This requires
  * At each attention head they adjust the computation of the attention matrix
    Ats ∼ content-based addressing + content-dependent position bias + global
    content bias+  global position bias (12) where
    * R ∈ Rτ×d is a sinusoidal position embedding matrix as in Vaswani+ (2017)
    * b, c ∈ Rd are learnable parameters. They use
    * different projection matrices for the relative positions, namely, V(k) ∈
  * unidirectional and thus τ = tm + tmax − 1, where tm is the memory length in
  * they add this mechanism to all attention heads and layers, while sharing
    the position parameters across layers and heads
* variants of Equation (4)
  * Ke, He, and Liu (2021) propose untied position embeddings. More
  * simply put U into the Transformer and then
    modify the attention matrix A in the first layer by adding a positn bias
                A ∼ UW(q) W(k) U| + PV(q) V(k) P| 744 (13)
  * they omit the unit–position interaction terms and use
    different projection matrices, V(q) , V(k) ∈ Rd×d for units and positions
  * add relative position embeddings by adding a scalar value.  They
  * add a matrix Ar ∈ Rtmax ×tmax , where
    Art,s = bt−s+tmax and b ∈ R2tmax are learnable parameters, which is why we
    categorize this approach as MAM
  * very similar idea with relative position encodings by Raffel+ (2020)
  * Ke+ further argue that the [CLS] token has a special role and thus
    they replace the terms P1 | V(q) V(k) Ps with a | single parameter θ1 and
    analogously Pt | V(q) V(k) P1 with θ2 , that is,
    ie they disentangle the position of the [CLS] token
    from the other position interactions. They provide
  * theoretical arguments that
    their absolute and relative position embeddings are complementary.  Indeed,
  * experiments: the combination of relative and absolute embeddings boosts
    performance on the GLUE benchmark
  * analysis of the position biases learned by their network (see Figure 4). A
  * Fig 4: Their position bias is independent of the input and
    can thus be easily visualized
    * absolute position biases learn intuitive patterns as shown above
      * eg ignoring position information, attending locally, globally, to the
        left, and to the right
    * One can clearly see the untied position bias for the first token, which
      corresponds to the [CLS] token, on the left and top of each matrix
  * similar idea has been explored in Dufter, Schmitt, and Schütze (2020),
    * more limited setting, more specifically in the context of PoS-tagging,
      learnable absolute or relative position biases are learned
      instead of full position embeddings
* Chang+ (2021) provide a theoretical link between the position info models
  by Shaw, Uszkoreit, and Vaswani (2018) and Raffel+ (2020) and convolutions
  * combining these two relative position information models
    increases performance on natural language understanding tasks
* DeBERTa (He+ 2021)
  * Complementary to that line of research is a method by He+ (2021)
  * omit the position–position interaction and focus on unit–position interact
  * hE still untied or disentangled as they use
    different projection matrices for unit and position embeddings
  * relative position embeddings Ar ∈ R2tmax ×d and define δ(t, s)
    0 if t − s ≤ −tmax, 2t − 1 if t − s ≥ tmax, t − s + tmax else

  Ats ∼ Ut | W(q) W(k) Us + Ut | W(q) V(k) Arδ(t,s) + Arδ(s,t) | V(q) W(k) Us

  * share the weights of Ar ∈ R2tmax ×d across layers, the
    weight matrices are separate for each attention head and layer. In
  * they change the scaling factor from 1/dh to 1/(3dh )
  * In the last layer they inject a traditional absolute position embedding
    matrix P ∈ Rtmax ×d
  * ie they use both MAM and APE
  * relative encodings to be available in every layer but argue that the model
    should be reminded of absolute encodings right before the masked language
    model prediction. In their example sentence, a new store opened beside the
    new mall, they argue that store and mall have similar relative positions to
    new and thus absolute positions are required for predicting masked units
* The following two approaches do not work with embeddings, but instead propose
  * direct multiplicative smoothing on the attention matrix and can
  * thus categorized as MAM
  * Wu, Wu, and Huang (2021) propose a smoothing based on relative positions in
    their model DA-Transformer. They consider the matrix of absolute values of
    relative distances R ∈ Ntmax ×tmax where Rts = |t − s|.  For each
    attention head m they obtain R(m) = w(m) R with w(m) ∈ R being a learnable
    scalar parameter. They then compute A ∼ ReLU (XW(q) W(k) X| ) ◦ R̂(m) (16)
    where R̂(m) is a rescaled version of R(m) and ◦ is component-wise
    multiplication. For rescaling they use a sigmoid function with learnable
    scalar weights v(m) ∈ R. More specifically,
    R̂(m) = 1 + exp(v(m) ) 1 + exp(v(m) − R(m) ) (17)
    Overall, they only add 2h parameters as
    each head has two learnable parameters
    * Intuitively, they want to allow each attention head to choose whether to
      attend to longrange or short-range dependencies
    * direction-agnostic. The authors observe
    * improvements for text classification both over vanilla Transformer and
      more elaborate position information models, in particular, relative
      position encodings by Shaw, Uszkoreit, and Vaswani (2018), Transformer-XL
      (Dai+ 2019), and TENER (Yan+ 2019)
  * Huang+ (2020) review absolute and relative position embedding methods and
    propose four position information models with relative position encodings:
    * Similar to Wu, Wu, and Huang (2021) they scale the attention matrix by |
      A ∼ (XW(q) W(k) X| ) ◦ R (18) where Rts = r|s−t| and r ∈ Rtmax is a
      learnable vector
    * They consider Rts = rs−t as well to distinguish different directions
    * As a new variant they propose
      Ats ∼ sum product(W(q) Xt , W(k) Xs , rs−t ) (19) where
      rs−t ∈ Rd are learnable parameters and
      sum product is the scalar product extended to three vectors
    * Last, they extend the method by Shaw, Uszkoreit, and Vaswani (2018) to
      not only add relative positions to the key, but also to the query in
      Equation (9), and in addition remove the position–position interaction
      More specifically, Ats ∼ W(q) Ut + rs−t W(k) Us + rs−t − rs−t | rs−t (20)
    * On several GLUE tasks (Wang+ 2018), the last two methods perform best
* Directional Self-Attention Networks (DiSAN, Shen+ 2018) propose
  * not directly related to relative position encodings, but it
    can be interpreted as using relative position information
  * differences to plain self-attention, such as
    * multidimensional attention,
    * mask out the upper/lower triangular matrix or the diagonal in A to
      achieve non-symmetric attention matrices
      * not add position information directly, but still
        makes the attention mechanism position-aware to some extent
        by enabling the model to distinguish directions
* RRN-Transformer and RR-Transformer (Neishi and Yoshinaga 2019)
  * argue that recurrent neural networks (RNN) in the form of gated recurrent
    units (GRU, Cho+ 2014) are able to encode relative positions
  * replace position encodings by adding a single GRU layer on the input
    before feeding it to the Transformer (see Figure 5). With their models
  * RRN-Transformer: comparable performance compared to position embeddings;
    * hE for longer sequences the GRU yields better performance
  * RR-Transformer:
    * Combining their approach with that by Shaw+ (2018) improves perf further
* Stochastic Positional Encoding (SPE)
  * Relative position information models
    usually require the computation of the full attention matrix A
    because each cell depends on a different kind of relative position interact
  * Liutkus+ (2021) proposed an alternative called Stochastic Positional Encod
    * By approximating relative position interactions as cross-covariance
      structures of correlated Gaussian processes, they make
    * => relative position encodings available to linear-complexity Transformer
      eg Performer (Choromanski+ 2021), that do
      not compute the full attention matrix, which would lead to a quadratic
    * two variants of SPE,
      * sineSPE that combines K learned sinusoidal components and
      * convSPE that learns convolutional filters. Notably, they also propose a
      * The description of SPE in Table 1 is based on gated sineSPE
    * gating mechanism that controls with a learnable parameter
      how much the attention in each vector dimension depends on content vs
      position information
    * performance improvements compared to absolute position encodings for
      tasks involving long-range dependencies (Tay+ 2020b)

## 4.2 Sinusoidal 16

## 4.3 Graphs

## 4.4 Decoder

## 4.5 Crosslingual

## 4.6 Analysis

# 5. Conclusion 24
