Mamba: Linear-Time Sequence Modeling with Selective State Spaces
Albert Gu, Tri Dao
arXiv:2312.00752 [cs.LG]

# Abstract

* Foundation models, now powering most of the applications in deep learning,
* almost universally based on the Transformer architecture
  and its core attention module
* computational inefficiency on long sequences
* subquadratic-time architectures
* such as linear attention, gated convolution and recurrent models, and
  structured state space models (SSMs) have been developed to address ineff
* not performed as well as attention on important modalities such as language
  <~ inability to perform content-based reasoning
* we let the SSM parameters be functions of the input
  * addresses their weakness with discrete modalities
    * allowing the model to selectively propagate or forget information along
      the sequence length dimension depending on the current token
  * hardware-aware parallel algorithm in recurrent mode
    * even though this change prevents the use of efficient convolutions
  * We integrate these selective SSMs into a simplified end-to-end neural
    network architecture without attention or even MLP blocks (Mamba)
  * fast inference (5× higher throughput than Transformers) and
  * linear scaling in sequence length
  * performance improves on real data up to million-length sequences
  * SOTA performance across several modalities eg language, audio, and genomics
  * language modeling: our Mamba-3B model
    * outperforms Transformers of the same size and
    * matches Transformers twice its size, both in pretraining and downstream
      evaluation

# 1 Intro

* Transformer (Vaswani+ 2017) and its core attention layer (Bahdanau+ 2015)
  * efficacy is attributed to its ability to route information densely within a
    context window, allowing it to model complex data
  * hE finite window, and quadratic scaling with respect to the window length
* more efficient variants of attention to overcome these drawbacks (Tay+ 2022),
  * but often at the expense of the very properties that makes it effective
  * none have been shown to be empirically effective at scale across domains
* structured state space sequence models (SSMs, Gu+ 2022; Gu+ 2021)
  * a combination of recurrent neural networks (RNNs) and convolutional ones
  * inspiration from classical state space models (Kalman 1960)
  * can be computed very efficiently as either a recurrence or convolution,
  * linear or near-linear scaling in sequence length
  * principled mechanisms for modeling long-range dependencies (Gu+ 2020) in
    certain data modalities, and
  * have dominated benchmarks such as the Long Range Arena (Tay+ 2021)
  * Many flavors of SSMs (Gu, Goel, and Ré 2022; Gu, Gupta,+ 2022; Gupta, Gu,
    and Berant 2022; Y. Li+ 2023; Ma+  2023; Orvieto+ 2023; Smith+ 2023)
  * successful in domains involving continuous signal data such as audio and
    vision (Goel+ 2022; Nguyen, Goel,+ 2022; Saon, Gupta, and Cui 2023)
  * less effective at modeling text: discrete and information-dense data
* We propose a new class of selective state space models, that improves on
  prior work on several axes to achieve the modeling power of Transformers
  while scaling linearly in seq len

## Selection Mechanism

* we identify a key limitation of prior models: the ability to efficiently
  select data in an input-dependent manner (ie focus on or ignore prtic inputs)
  * based on important synthetic tasks eg selective copy and induction heads,
* we design a simple selection mechanism by parameterizing the SSM parameters
  based on the input
  * allows the model to filter out irrelevant information and remember relevant
    information indefinitely

## Hardware-aware Algorithm

* This simple change poses a technical challenge for the computation
* all prior SSMs models must be time~ and input-invariant in order to be
  computationally efficient
* we: a hardware-aware algorithm that
  * computes the model recurrently with a scan instead of convolution, but does
    not materialize the expanded state in order to avoid IO access between
    different levels of the GPU memory hierarchy
* faster than previous methods both
  * in theory: scaling linearly in sequence length,
    * compared to pseudo-linear for all convolution-based SSMs
  * on modern hardware (up to 3× faster on A100 GPUs)

## Architecture

* We simplify prior deep sequence model architectures by combining the design
  of prior SSM architectures (Dao, Fu, Saab,+ 2023) with the MLP block of
  Transformers into a single block, leading to ~> a simple and homogenous
  architecture design (Mamba) incorporating selective state spaces
* Selective SSMs, and by extension the Mamba architecture, are fully recurrent
  models with key properties that make them suitable as the backbone of general
  foundation models operating on sequences
  * High quality: selectivity brings strong performance on dense modalities
    such as language and genomics
  * Fast training and inference:
    * training: computation and memory scales linearly in sequence length
    * inference: unrolling the model autoregressively requires only constant
      time per step since it does not require a cache of previous elements
  * Long context: the quality and efficiency together yield performance
    improvements on real data up to sequence length 1M
* We empirically validate Mamba’s potential as a general sequence FM backbone,
  in both pretraining quality and domain-specific task performance, on several
  types of modalities and settings:
  * Synthetics. On important synthetic tasks such as
    * eg copying and induction heads that have been
      * proposed as being key to large language models,
  * Mamba not only solves them easily but can
    * extrapolate solutions indefinitely long (>1M tokens)
  * Audio and Genomics
    * Mamba out-performs prior SOTA models such as SaShiMi, Hyena, and
      Transformers on modeling audio waveforms and DNA sequences, both in
      pretraining quality and downstream metrics
    * eg reducing FID on a challenging speech generation dataset by > 50%
    * In both settings, its performance improves with longer context up to 1M
  * Language Modeling
    * Mamba is the first linear-time sequence model that truly achieves
      Transformer-quality performance, both in pretraining perplexity and
      downstream evaluations
    * scaling laws up to 1B parameters, we show that Mamba
    * exceeds the performance of a large range of baselines,
      * including very strong modern Transformer training recipes based on
        LLaMa (Touvron+ 2023). Our Mamba language model has
    * 5× generation throughput compared to Transformers of similar size, and
    * Mamba-3B’s quality matches that of Transformers twice its size
      * 4 points higher avg. on common sense reasoning compared to Pythia-3B
        and even exceeding Pythia-7B)

# 2 State Space Models

# 3 Selective State Space Models

# 4 Empirical Evaluation

# 5 Discussion

## Related Work

* Appendix A: how the selection mechanism relates to similar concepts
* Appendix B: an extended related work of SSMs and other related models

## No Free Lunch: Continuous-Discrete Spectrum

* Structured SSMs were originally defined as discretizations of continuous
  systems (1), and have had a 
* strong inductive bias toward continuous-time data modalities such as eg
  perceptual signals (eg audio, video)
* the selection mechanism overcomes their weaknesses on discrete modalities
  such as text and DNA
  * discussed in Sections 3.1 and 3.5, 
  * conversely can impede their performance
    on data that linear time invariant (LTI) SSMs excel on
* Our ablations on audio waveforms examine this tradeoff in more detail

## Downstream Affordances

* Transformer-based foundation models (particularly LLMs) have a rich ecosystem
  of properties and modes of interaction with pretrained models, such as 
  * fine-tuning, adaptation, prompting, in-context learning, instruction
    tuning, RLHF, quantization, and so on
* interesting whether SSMs have similar properties and affordances

## Scaling

* Our empirical evaluation is limited to small model sizes, 
  * below the threshold of 
    * most strong open source LLMs (eg Llama (Touvron+ 2023)) as well as 
    * other recurrent models eg RWKV (B Peng+ 2023) and RetNet (Y Sun+ 2023),
    * evaluated at the 7B parameter scale and beyond
* It remains to assess whether Mamba still compares favorably at these sizes.
* scaling SSMs may involve further engineering challenges and adjustments to

# A. Discussion: Selection Mechanism 24

* Our selection mechanism is inspired by and related to concepts such as
  gating, hypernetworks, and data-dependence
  * “fast weights” (J. Ba+ 2016), which 
    * connects classical RNNs with the mechanism of linear attention (Schlag,
      Irie, and Schmidhuber 2021)
* However, we believe that it is a distinct concept that is worth clarifying.

## Gating 

* originally referred to the gating mechanisms of RNNs such as the 
  * eg LSTM (Hochreiter and Schmidhuber 1997) and GRU (J. Chung+ 2014), 
  * or the gated equation (5)n Theorem 1. This was 
  * interpreted as a particular mechanism for controlling whether to let an
    input into the hidden state of an RNN. In particular, this affects the
    propagation of signal through time and causes inputs to interact along the
    sequence length dimension.
* the concept of gating has since been relaxed in popular usage to simply mean
  * any multiplicative interaction (often with an activation function). For
  * eg elementwise multiplicative components of neural network architectures
    (that do not interact along sequence length) are now commonly referred to
    as gated architectures (Hua+ 2022; Mehta+ 2023), despite a very

## Hypernetworks

* neural networks whose parameters are themselves generated by smaller NNs
* The original idea (Ha, Dai, and Quoc V. Le 2017) used it in a narrow sense to
  define a large RNN whose recurrent parameters are generated by a smaller RNN.

## Data-dependence 

* can refer to any notion where some parameters of the model depend on the data
  (Poli+ 2023).
* Example: GLU Activation. To illustrate the issues with these concepts,
  consider a simple diagonal linear layer 𝑦 = D𝑥, where D is a diagonal weight
  parameter. Now suppose that D is itself generated from a linear
  transformation of 𝑥, with an optional nonlinearity: D = 𝜎(W 𝑥). Since it is
  diagonal, the multiplication becomes an elementwise product: 𝑦 = 𝜎(W 𝑥)◦𝑥.
* technically satisfies the common meanings of gating (since it has a
  multiplicative “branch”), hypernetworks (since the parameter D is generated
  by another layer), and data-dependent (since D depends on the data 𝑥).
* hE simply defines a GLU function, which is so simple that it is 
  often considered just an activation function (Dauphin+ 2017; Shazeer 2020)
  instead of a meaningful layer.

## Selection

* selection mechanisms could be considered a special case of ideas such as
  architectural gating, hypernetworks, or data-dependence, 
* so can an enormous range of other constructions—essentially anything with a
  multiplication, including standard attention mechanisms (Bahdanau, Cho, and
  Bengio 2015; Vaswani+ 2017) as well—and we find it uninformative 
* Instead, we view it as most closely related to the gating mechanism of
  traditional RNNs, which is 
  * a special case (Theorem 1) and also 
  * has a deeper history of connections to SSMs through variable
    (input-dependent) discretization of ∆ (Funahashi and Nakamura 1993; Gu,
    Dao,+ 2020; Tallec and Ollivier 2018)
* We also eschew the term “gating” in favor of selection to clarify the
  overloaded use of former
* More narrowly, we use selection to refer to the mechanistic action of a model
  to select or ignore inputs and facilitate data interaction along the sequence
  length (Section 3.1)
* Beyond selective SSMs and gated RNNs, other examples may include
  input-dependent convolutions (Kosma, Nikolentzos, and Vazirgiannis 2023;
  Lioutas and Guo 2020; Lutati, Zimerman, and Wolf 2023; Yang+ 2019) and even
  attention.

# B. Related Work

* most closely related models include 
  * recurrent layers such as S4, S5, and quasi-RNNs; as well as 
  * end-to-end architectures such as H3, RetNet, and RWKV.

## B.1 S4 Variants and Derivatives

* some structured SSMs from past work, particularly those that have a relation
to our method.

### S4 (Gu, Goel, and Ré 2022; Gu, Johnson, Goel,+ 2021) introduced 
the first structured SSM, describing 
diagonal structure and diagonal plus low-rank (DPLR). It focused on
efficient convolutional algorithms for DPLR SSMs due to a 
connection to continuous-time online memorization (HIPPO) (Gu+ 2020).

### DSS (Gupta, Gu, and Berant 2022) first discovered the 
* empirical effectiveness of diagonal structured SSMs 
  by approximating the HIPPO initialization. This was 
* expanded on theoretically in S4D (Gu, Gupta,+ 2022).

### S5 (Smith, Warrington, and Linderman 2023) 
independently discovered the diagonal SSM approximation, and is 
the first S4 model to be computed recurrently with the parallel scan.
* hE required lowering the effective state dimension, which they
  accomplished by switching the SSM dimensions from a SISO (single-input
  single-output) to MIMO (multi-input multi-output) formulation. 
* Our proposed S6 shares the scan, but differs by 
  * keeping the SISO dimensions ~> larger effective recurrent state, 
  * using a hardware-aware algorithm to overcome the computation issue, 
  * adding the selection mechanism.
* Lu+ (2023) applied S5 to meta-RL
  in order to handle resetting the SSM state between episode trajectories.
  * can be viewed as a particular hard-coded instance of a selection mechanism,
    where A is manually set to 0, instead of our learnable mechanism that
    depends on the input
  * It would be interesting to apply selective SSMs generically to this setting
    * probe if the model has learned to automatically reset its state
      on episode boundaries.

### Mega (Ma+ 2023) 

* simplification of S4 to be real~ instead of complex~ valued
* interpretation of being an exponential moving average (EMA). 
* They additionally make an interesting 
  connection of the discretization step of SSMs to an EMA damping term.
* the first model to show that real-valued SSMs are empirically effective in
  certain settings or when combined with different architectural components.
  * Contrary to findings in the original S4 papers, this was 

### Liquid S4 (Hasani+ 2023) is 

* also motivated by augmenting S4 with an input-dependent state transition.
* From this perspective it shares similarity to selection mechanisms, although
  in a limited form which is still computed convolutionally and close to LTI.

### SGConv (Y. Li+ 2023), Hyena (Poli+ 2023), LongConv (Fu+ 2023), 
  MultiresConv (J Shi+ 2023), and Toeplitz Neural Network (Qin+ 2023) 

* focus on the convolutional representation of S4 and create 
* global or long convolution kernels with different parameterizations.
* cannot do fast autoregressive inference directly.

---

* all of these methods, and all other structured SSMs that we are aware of,
  * non-selective and usually strictly LTI

## B.2 SSM Architectures

## B.3 Relationship to RNNs

* RNNs and SSMs are broadly related, as they
  both involve the concepts of recurrence on a latent state.
* Several older RNNs involve forms of gated RNNs without time-wise nonlins
  * strongly typed RNN (Balduzzi and Ghifary 2016), 
  * quasi-RNN (QRNN) (Bradbury+ 2016), and 
  * simple recurrent unit (SRU) (Lei 2021; Lei+ 2017) 
  * can be viewed as cases of selective SSMs, and are thus 
  * more powerful in a sense than the family of LTI structured SSMs above.
* The main differences are:
  * They do not use state expansion (𝑁 = 1) or selective B, C parameters, both
    of which are important for performance (Section 4.6).
  * They use a heuristic gating mechanism, which we generalize as a consequence
    of the selection mechanism + discretization (Theorem 1). The connections to
    principled SSM theory provides better parameterizations and initializations
    (Section 3.6).
* older RNNs famously suffered from
  efficiency issues and the vanishing gradients problem (Pascanu+ 2013), 
  both caused by their sequential nature
  * vanishing grad could be solved for some of the above RNNs by leveraging the
    parallel scan (Martin and Cundy 2018), but the former 
  * efficiency iffues were difficult without theory later developed for SSMs.
* modern structured SSMs differ in more 
  careful parameterization of the recurrent dynamics 
  inspired by classical SSM theory (e.g. through 
  * discretization (Gu+ 2021; Gu, Johnson, Timalsina,+ 2023)), or 
  * direct analysis (Orvieto+ 2023)
* a long line of work on orthogonal RNNs (Arjovsky+ 2016; Henaff+ 2016;
  Lezcano-Casado and Martínez-Rubio 2019; Mhammedi+ 2017; Vorontsov+ 2017)
  * motivated by constraining the A transition matrix to be orthogonal or
    unitary, in order to control its eigenvalues and prevent the vanishing
    gradient problem
  * However, these had other limitations; we believe that these stem from the
    fact that orthogonal/unitary RNNs are also LTI. For example, they are
    almost always evaluated on the Copying task which they can solve perfectly,
    but observed to struggle on the Selective Copying task (Jing+ 2019).

## B.4 Linear Attention

## B.5 Long Context Models

# D. Hardware-aware Algorithm For Selective SSMs

# E. Experimental Details and Additional Results
