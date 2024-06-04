Mamba: Linear-Time Sequence Modeling with Selective State Spaces
Albert Gu, Tri Dao
arXiv:2312.00752 [cs.LG]

# Abstract

* Foundation models, now powering most of the applications in deep learning,
* almost universally based on the Transformer architecture
  and its core attention module
* computational inefficiency on long sequences
* subquadratic-time architectures have been developed to address inefficiency
  * such as linear attention, gated convolution and recurrent models, and
    structured state space models (SSMs)
* not performed as well as attention on important modalities such as language
  <~ inability to perform content-based reasoning
* we let the SSM parameters be functions of the input
  * addresses their weakness with discrete modalities
    * allowing the model to selectively propagate or forget information
      along the sequence length dimension depending on the current token
  * hardware-aware parallel algorithm in recurrent mode
    * even though this change prevents the use of efficient convolutions
  * We integrate these selective SSMs into a simplified end-to-end NN
    without attention or even MLP blocks (Mamba)
  * fast inference (5× higher throughput than Transformers) and
  * linear scaling in sequence length
  * performance improves on real data up to million-length sequences
  * SOTA performance across several modalities eg language, audio, and genomics
  * language modeling: our Mamba-3B model
    * outperforms Transformers of the same size and
    * matches Transformers twice its size, both in pretraining and downstr eval

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
  * principled modeling of long-range deps (Gu+ 2020) in certain modalities
  * have dominated benchmarks such as the Long Range Arena (Tay+ 2021)
  * Many flavors of SSMs (Gu, Goel, and Ré 2022; Gu, Gupta+ 2022; Gupta+ 2022;
    Y Li+ 2023; Ma+ 2023; Orvieto+ 2023; Smith+ 2023)
  * successful in domains involving continuous signal data eg audio and vision
    (Goel+ 2022; Nguyen, Goel+ 2022; Saon, Gupta, and Cui 2023)
  * less effective at modeling text: discrete and information-dense data
* We propose a new class of selective state space models, that
  * improves on prior work on several axes to
    achieve the modeling power of Transformers while
    scaling linearly in seq len

## Selection Mechanism

* we identify a key limitation of prior models: the ability to efficiently
  select data in an input-dependent manner (ie focus on or ignore prtic inputs)
  * based on important synthetic tasks eg selective copy and induction heads,
* we design a simple selection mechanism by
  parameterizing the SSM parameters based on the input
  * allows the model to filter out irrelevant information and remember relevant
    information indefinitely

## Hardware-aware Algorithm

* This simple change poses a technical challenge for the computation
* all prior SSMs models must be time~ and input-invariant in order to be
  computationally efficient
* we: a hardware-aware algorithm that
  * computes the model recurrently with a scan instead of convolution, but does
    not materialize the expanded state in order to
    avoid IO access between different levels of the GPU memory hierarchy
* faster than previous methods both
  * in theory: scaling linearly in sequence length,
    * compared to pseudo-linear for all convolution-based SSMs
  * on modern hardware (up to 3× faster on A100 GPUs)

## Architecture

* We simplify prior deep sequence model architectures by combining the design
  prior SSM architectures (Dao, Fu, Saab+ 2023) with
  the MLP block of Transformers
  into a single block
  ~> a simple and homogenous architecture design (Mamba)
  incorporating selective state spaces
* Selective SSMs, and by extension the Mamba architecture, are
  fully recurrent models with key properties that make them suitable as the
  backbone of general foundation models operating on sequences
  * High quality: selectivity brings strong performance on dense modalities
    such as language and genomics
  * Fast training and inference:
    * training: computation and memory scales linearly in sequence length
    * inference: unrolling the model autoregressively requires only constant
      time per step, since it does not require a cache of previous elements
  * Long context: the quality and efficiency together yield
    perf improvements on real data up to sequence length 1M
* We empirically validate Mamba’s potential as a general sequence FM backbone,
  in both pretraining quality and domain-specific task performance,
  on several types of modalities and settings:
  * Synthetics eg copying and induction heads
    * have been proposed as being key to large language models,
    * Mamba not only solves them easily but can
    * extrapolate solutions indefinitely long (>1M tokens)
  * Audio and Genomics
    * Mamba out-performs prior SOTA models
      such as SaShiMi, Hyena, and Transformers
      on modeling audio waveforms and DNA sequences,
      both in pretraining quality and downstream metrics
    * eg reducing FID on a challenging speech generation dataset by > 50%
    * In both settings, its performance improves with longer context up to 1M
  * Language Modeling
    * Mamba is the first linear-time sequence model that truly achieves
      Transformer-quality performance,
      both in pretraining perplexity and downstream evaluations
    * scaling laws up to 1B parameters, we show
    * exceeds the performance of a large range of baselines,
      * including very strong modern Transformer training recipes based on
        LLaMa (Touvron+ 2023)
    * 5× generation throughput compared to Transformers of similar size, and
    * Mamba-3B’s quality matches that of Transformers twice its size
      * 4 points higher avg. on common sense reasoning compared to Pythia-3B
        and even exceeding Pythia-7B

# 2 State Space Models 3

* Structured state space sequence models (S4) are
  * a recent class of sequence models for deep learning that are
  * broadly related to RNNs, and CNNs, and classical state space models. They
  * inspired by a particular continuous system (1) that
    maps a 1-dimensional function or sequence 𝑥(𝑡) ∈ ℝ ↦ 𝑦(𝑡) ∈ ℝ through an
    implicit latent state ℎ(𝑡) ∈ ℝ𝑁 
  * defined with four parameters (∆, A, B, C), which
    define a sequence-to-sequence transformation in two stages

## Discretization. The first stage transforms the “continuous parameters” (∆,
A, B) to “discrete parameters” (A, B) through fixed formulas A = 𝑓𝐴 (∆, A) and
B = 𝑓𝐵 (∆, A, B), where the pair (𝑓𝐴 , 𝑓𝐵 ) is called a discretization rule
* Various rules can be used such as the zero-order hold (ZOH) defined in (4)
    A = exp(∆A)
    B = (∆A)−1 (exp(∆A) − I) ⋅ ∆B     (4)
* Discretization has deep connections to
  * continuous-time systems which can endow them with additional properties
    * resolution invariance (Nguyen, Goel,+ 2022) and automatically
    * ensuring that the model is properly normalized (Gu+ 2023; Orvieto+ 2023)
  * gating mechanisms of RNNs (Gu, Gulcehre,+ 2020; Tallec and Ollivier 2018)
    which we will revisit in Section 3.5
* the first step of the computation graph in the forward pass of an SSM
  * from a mechanical point of view discretization can simply be viewed as
* Alternate flavors of SSMs can bypass the discretization step and parameterize
  (A, B) directly instead (Zhang+ 2023), which may be easier to reason about

## Computation

* After the parameters have been transformed from (∆, A, B, C) ↦ (A, B, C),
* the model can be computed in two ways,
  either as a linear recurrence (2) or a global convolution (3)
* Commonly, the model uses the
  * convolutional mode (3) for efficient parallelizable training (where the
    whole input sequence is seen ahead of time), and switched into
  * recurrent mode (2) for efficient autoregressive inference
    (where the inputs are seen one timestep at a time)

## Linear Time Invariance (LTI). An important property of equations (1) to (3)

* the model’s dynamics are constant through time. In other words (∆, A, B, C),
  and consequently (A, B) as well, are fixed for all time-steps
* deeply connected to recurrence and convolutions
* Informally, we think of LTI SSMs as being equivalent to any linear recurrence
  (2a) or convolution (3b), and use LTI as an umbrella term for these classes
* Thus far, all structured SSMs have been LTI (eg computed as convolutions)
  because of fundamental efficiency constraints, discussed in Section 3.3
* hE LTI models have fundamental limitations in modeling certain types of data,
* we: removing the LTI constraint while overcoming the efficiency bottlenecks

## Structure and Dimensions

* structured SSMs are so named because
  computing them efficiently also requires imposing structure on the A matrix
* The most popular form of structure is diagonal (Gu, Gupta,+ 2022; Gupta, Gu,
  and Berant 2022; Smith, Warrington, and Linderman 2023), which we also use
* complexity detailed
  * In this case, the A ∈ ℝ𝑁×𝑁 , B ∈ ℝ𝑁×1 , C ∈ ℝ1×𝑁 matrices can all be
    represented by 𝑁 numbers. To operate over an input sequence 𝑥 of
  * batch size 𝐵 and length 𝐿 with 𝐷 channels, the SSM is applied independently
    to each channel.  Note that in this case,
  * the total hidden state has dimension 𝐷𝑁 per input, and
  * computing it over the sequence length requires 𝑂(𝐵𝐿𝐷𝑁) time and memory;
    * the root of the fundamental efficiency bottleneck addressed in Sec 3.3

## General State Space Models. We note that

* _state space model_ has a very broad meaning which simply represents the
  * any recurrent process with a latent state
  * It has been used to refer to many disparate concepts in diff disciplines,
    * Markov decision processes (MDP, reinforcement learning (Hafner+ 2020)),
    * dynamic causal modeling (DCM, computational neuroscience (Friston+ 2003))
    * Kalman filters (controls (Kalman 1960)),
    * hidden Markov models (HMM) and linear dynamical systems (LDS, machine
      learning), and
    * recurrent (and sometimes convolutional) models at large (deep learning)
* we use the term “SSM” to refer exclusively to the class of structured SSMs or
  S4 models (Gu, Goel, and Ré 2022; Gu, Gupta,+ 2022; Gupta, Gu, and Berant
  2022; Hasani+ 2023; Ma+ 2023; Smith, Warrington, and Linderman 2023)
* derivatives of such models, such as those focusing on either the
  linear-recurrence or global-convolution viewpoints (Y. Li+ 2023; Orvieto+
  2023; Poli+ 2023)

## SSM Architectures. SSMs are standalone sequence transformations that

* can be incorporated into end-to-end neural network architectures
* SSNNs are to SSM layers as CNNs are to linear convolution layers
* the most well-known SSM architectures,
  many of which will also serve as our primary baselines
  * Linear attention (Katharopoulos+ 2020) is
    an approximation of self-attention
    involving a recurrence which can be viewed as a degenerate linear SSM
  * H3 (Dao, Fu, Saab,+ 2023) generalized this recurrence to use S4; it
    * an architecture with an SSM sandwiched by two gated connections (Fig 3)
    * H3 also inserts a standard local convolution, which they frame as a
      shift-SSM, before the main SSM layer
  * Hyena (Poli+ 2023) uses the same architecture as H3 but replaces the S4
    layer with an MLP-parameterized global convolution (Romero+ 2021)
  * RetNet (Y Sun+ 2023) adds an additional gate to the architecture and uses
    a simpler SSM,
    * allowing an alternative parallelizable computation path,
      using a variant of multi-head attention (MHA) instead of convolutions
  * RWKV (B. Peng+ 2023) is a recent RNN designed for language modeling
    based on another linear attention approximation (attention-free Transformer
    (S.  Zhai+ 2021)). Its main “WKV” mechanism involves LTI recurrences and
    can be viewed as the ratio of two SSMs
* Other closely related SSMs and architectures are discussed further in App B
  * We highlight in particular
    * S5 (Smith, Warrington, and Linderman 2023),
    * QRNN (Bradbury+ 2016), and
    * SRU (Lei+  2017), which we view as
      * the most closely related methods to our core selective SSM

# 3 Selective State Space Models

## 3.1 We motivate our selection mechanism using intuition from synthetic tasks

* a fundamental problem of sequence modeling is
  compressing context into a smaller state. In fact, we can
* view the tradeoffs of popular sequence models from this point of view. For
  * attention is both effective and inefficient because it explicitly does
    not compress context at all. This can be seen from the fact that
    * autoregressive inference requires explicitly storing the entire context
      (i.e. the KV cache), which directly causes the
    ~> slow linear-time inference and quadratic-time training of Transformers
  * recurrent models are
    * efficient because they have a finite state, implying
      constant-time inference and linear-time training. However, their
    * hE limited by how well this state has compressed the context
* two running examples of synthetic tasks (Figure 2)
  * The Selective Copying task
    modifies the popular Copying task (Arjovsky, Shah, and Bengio 2016) by
    varying the position of the tokens to memorize.  It
    * requires content-aware reasoning to be able to memorize the relevant
      tokens (colored) and filter out the irrelevant ones (white)
  * The Induction Heads task is a well-known mechanism
    hypothesized to explain the majority of in-context learning abilities of
    LLMs (Olsson+ 2022)
    * It requires context-aware reasoning to know when to produce the correct
      output in the appropriate context (black)
* These tasks reveal the failure mode of LTI models. From the ~ view
  * recurrent: their constant dynamics (eg the (A, B) transitions in (2))
    cannot let them select the correct information from their context, or
    affect the hidden state passed along the sequence an input-dependently
  * convolutional: it is known that
    global convolutions can solve the vanilla Copying task (Romero+ 2021)
    because it only requires time-awareness, but that they have
    * hE difficulty with the Selective Copying task because of lack of
      content-awareness (Figure 2)
    * More concretely, the spacing between inputs-to-outputs is varying and
      cannot be modeled by static convolution kernels
* In summary, the efficiency vs. effectiveness tradeoff of sequence models =
  how well they compress their state:
  * efficient models must have a small state, while
  * effective models must have a state that contains all necessary contxt info
  * we: a fundamental principle for building sequence models is selectivity
  * ie context-aware ability to focus on or filter out inputs into a seq state
  * a selection mechanism controls how information propagates or interacts
    along the sequence dimension (see Section 3.5 for more discussion)

## 3.2 explain how to incorporate selection into state space models

## 3.2 Hardware-aware algorithm

* The time-varying SSMs [resulting from 3.2] cannot use convolutions,
  presenting a technical challenge of how to compute them efficiently
* We overcome this with a hardware-aware algorithm that
  * exploits the memory hierarchy on modern hardware (Section 3.3). We then

## 3.4 a simple SSM architecture without attention or even MLP blocks

## 3.5 some additional properties of selection mechanisms

# 4 Empirical Evaluation

# 5 Discussion

## Related Work

* Appendix A: how the selection mechanism relates to similar concepts
* Appendix B: an extended related work of SSMs and other related models

## No Free Lunch: Continuous-Discrete Spectrum

* Structured SSMs were originally defined as discretizations of continuous
  systems (1)
* strong inductive bias toward continuous-time data modalities
  eg perceptual signals (eg audio, video)
* the selection mechanism overcomes their weaknesses on discrete modalities
  such as text and DNA
  * discussed in Sections 3.1 and 3.5,
  * conversely can impede their performance on data that LTI SSMs excel on
* Our ablations on audio waveforms examine this tradeoff in more detail

## Downstream Affordances

* Transformer-based foundation models (particularly LLMs) have a rich ecosystem
  of properties and modes of interaction with pretrained models
  * fine-tuning, adaptation, prompting, in-context learning,
    instruction tuning, RLHF, quantization, and so on
* interesting whether SSMs have similar properties and affordances

## Scaling

* Our empirical evaluation is limited to small model sizes,
  * below the threshold of
    * most strong open source LLMs eg Llama (Touvron+ 2023) as well as
    * other recurrent models eg RWKV (B Peng+ 2023) and RetNet (Y Sun+ 2023),
    * evaluated at the 7B parameter scale and beyond
* It remains to assess whether Mamba still compares favorably at these sizes
* scaling SSMs may involve further engineering challenges and adjustments

# 6 Conclusion 18

# A. Discussion: Selection Mechanism 24

* Our selection mechanism is inspired by and related to concepts such as
  gating, hypernetworks, and data-dependence
  * “fast weights” (J. Ba+ 2016) connect classical RNNs with the mechanism of
    linear attention (Schlag, Irie, and Schmidhuber 2021)
* However, we believe that it is a distinct concept that is worth clarifying

## Gating

* gating originally referred to the gating mechanisms of RNNs
  * eg LSTM (Hochreiter and Schmidhuber 1997) and GRU (J. Chung+ 2014),
  * or the gated equation (5)n Theorem 1
  * This was interpreted as a particular mechanism for
    controlling whether to let an input into the hidden state of an RNN
    * affects the propagation of signal through time and
      causes inputs to interact along the sequence length dimension
* the concept of gating has since been relaxed in popular usage to simply mean
  * any multiplicative interaction (often with an activation function)
  * eg elementwise multiplicative components of neural network architectures
    (that do not interact along sequence length) are now commonly referred to
    as gated architectures (Hua+ 2022; Mehta+ 2023)

## Hypernetworks

* neural networks whose parameters are themselves generated by smaller NNs
* The original idea (Ha, Dai, and Quoc V Le 2017) used it in a narrow sense to
  define a large RNN whose recurrent parameters are generated by a smaller RNN

## Data-dependence

* can refer to any notion where some parameters of the model depend on the data
  (Poli+ 2023)
* Example: GLU Activation. To illustrate the issues with these concepts,
  consider a simple diagonal linear layer 𝑦 = D𝑥, where
  D is a diagonal weight parameter. Now
  suppose that D is itself generated from a linear transformation of 𝑥, with an
  optional nonlinearity: D = 𝜎(W 𝑥)
* Since it is diagonal, the multiplication becomes an elementwise product
* technically satisfies the common meanings of
  * gating (since it has a multiplicative “branch”),
  * hypernetworks (since the parameter D is generated by another layer), and
  * data-dependent (since D depends on the data 𝑥)
* hE simply defines a GLU function, which is so simple that it is
  often considered just an activation function (Dauphin+ 2017; Shazeer 2020)
  instead of a meaningful layer

## Selection

* could be considered a special case of ideas
  eg architectural gating, hypernetworks, or data-dependence,
* hE so can an enormous range of other constructions—essentially
  anything with a multiplication, including standard attention mechanisms
  (Bahdanau, Cho, and Bengio 2015; Vaswani+ 2017) as well—and we find it
~> uninformative to think of them as such

* we view selection as most closely related to
  the gating mechanism of traditional RNNs, which
  * is a special case (Theorem 1) and also
  * has a deeper history of connections to SSMs
    through variable (input-dependent) discretization of ∆
    (Funahashi and Nakamura 1993; Gu, Dao+ 2020; Tallec and Ollivier 2018)
* We also eschew the term “gating” in favor of selection
  * gating is overloaded use of former. More narrowly,
  * we use selection to refer to the mechanistic action of a model to select or
    ignore inputs and facilitate data interaction along the sequence length
    (Section 3.1)
  * other examples may include
    * Beyond selective SSMs and gated RNNs,
    * input-dependent convolutions (Kosma, Nikolentzos, and Vazirgiannis 2023;
      Lioutas and Guo 2020; Lutati, Zimerman, and Wolf 2023; Yang+ 2019)
    * attention

# B. Related Work

# D. Hardware-aware Algorithm For Selective SSMs

# E. Experimental Details and Additional Results
