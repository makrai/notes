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
    structured state space models (SSMs) have been developed to address
* not performed as well as attention on important modalities such as language.
  <~ inability to perform content-based reasoning, and make several
* we letting the SSM parameters be functions of the input 
  * addresses their weakness with discrete modalities, allowing the model to
    selectively propagate or forget information along the sequence length
    dimension depending on the current token. Second, 
  * hardware-aware parallel algorithm in recurrent mode
    * even though this change prevents the use of efficient convolutions, we
  * We integrate these selective SSMs into a simplified end-to-end neural
    network architecture without attention or even MLP blocks (Mamba). Mamba
  * fast inference (5× higher throughput than Transformers) and 
  * linear scaling in sequence length, and its performance 
  * improves on real data up to million-length sequences. As a general sequence
  * SOTA performance across several modalities eg language, audio, and genomics
  * language modeling, our Mamba-3B model outperforms Transformers of the same
    size and matches Transformers twice its size, 
    both in pretraining and downstream evaluation. 

# 1 Intro

* Transformer (Vaswani+ 2017) and its core attention layer (Bahdanau+ 2015) The
  * efficacy is attributed to its ability to route information densely within a
    context window, allowing it to model complex data. However, this property
  * hE finite window, and quadratic scaling with respect to the window length
* more efficient variants of attention to overcome these drawbacks (Tay+ 2022),
  * but often at the expense of the very properties that makes it effective. As
  * none have been shown to be empirically effective at scale across domains
* structured state space sequence models (SSMs, Gu+ 2022; Gu+ 2021) have
  * a combination of recurrent neural networks (RNNs) and convolutional ones
  * inspiration from classical state space models (Kalman 1960). This class of
  * can be computed very efficiently as either a recurrence or convolution,
  * linear or near-linear scaling in sequence length.
  * principled mechanisms for modeling long-range dependencies (Gu+ 2020) in
    certain data modalities, and 
  * have dominated benchmarks such as the Long Range Arena (Tay+ 2021). 
  * Many flavors of SSMs (Gu, Goel, and Ré 2022; Gu, Gupta,+ 2022; Gupta, Gu,
    and Berant 2022; Y. Li+ 2023; Ma+  2023; Orvieto+ 2023; Smith+ 2023)
  * successful in domains involving continuous signal data such as audio and
    vision (Goel+ 2022; Nguyen, Goel,+ 2022; Saon, Gupta, and Cui 2023).
  * less effective at modeling text: discrete and information-dense data such
* We propose a new class of selective state space models, that 
  improves on prior work on several axes to 
  achieve the modeling power of Transformers while scaling linearly in seq len

## Selection Mechanism

* we identify a key limitation of prior models: the ability to efficiently
  select data in an input-dependent manner (i.e. focus on or ignore particular
inputs). Building on intuition 
  * based on important synthetic tasks such as selective copy and induction
    heads, 
* we design a simple selection mechanism by parameterizing the SSM parameters
  based on the input
  * allows the model to filter out irrelevant information and 
    remember relevant information indefinitely

## Hardware-aware Algorithm

*  This simple change poses a technical challenge for the computation of the
   model; in fact, 
* all prior SSMs models must be time~ and input-invariant 
  in order to be computationally efficient. We overcome this with a
~> hardware-aware algorithm that 
  * computes the model recurrently with a scan instead of convolution, but does
    not materialize the expanded state in order to 
    avoid IO access between different levels of the GPU memory hierarchy. The
* faster than previous methods both 
  * in theory (scaling linearly in sequence length, compared to pseudo-linear
    for all convolution-based SSMs) and 
  * on modern hardware (up to 3× faster on A100 GPUs)

## Architecture. We simplify prior deep sequence model architectures by
combining the design of prior SSM architectures (Dao, Fu, Saab,+ 2023)
with the MLP block of Transformers into a single block, leading to a simple and
homogenous architecture design (Mamba) incorporating selective state spaces.
* Selective SSMs, and by extension the Mamba architecture, are 
  fully recurrent models with key properties that make them
  suitable as the backbone of general foundation models operating on sequences
  * High quality: selectivity brings strong performance
    on dense modalities such as language and genomics.
  * Fast training and inference: 
    * training: computation and memory scales linearly in sequence length
    * inference: unrolling the model autoregressively requires only constant
      time per step since it does not require a cache of previous elements. 
  * Long context: the quality and efficiency together yield performance
    improvements on real data up to sequence length 1M.  
* We empirically validate Mamba’s potential as a general sequence FM backbone,
  in both pretraining quality and domain-specific task performance, on several
  types of modalities and settings:
  * Synthetics. On important synthetic tasks such as 
    copying and induction heads that have been 
    proposed as being key to large language models, Mamba not only solves them
    easily but can extrapolate solutions indefinitely long (>1M tokens).
  * Audio and Genomics. Mamba out-performs prior SOTA models such as SaShiMi,
    Hyena, and Transformers on modeling audio waveforms and DNA sequences, both
    in pretraining quality and downstream metrics (eg reducing FID on a
    challenging speech generation dataset by more than half). In both settings,
    its performance improves with longer context up to million-length
    sequences.
  * Language Modeling. Mamba is the first linear-time sequence model that truly
    achieves Transformer-quality performance, both in pretraining perplexity
    and downstream evaluations. With scaling laws up to 1B parameters, we show
    that Mamba exceeds the performance of a large range of baselines, including
    very strong modern Transformer training recipes based on LLaMa (Touvron et
    al. 2023). Our Mamba language model has 5× generation throughput compared
    to Transformers of similar size, and Mamba-3B’s quality matches that of
    Transformers twice its size (eg 4 points higher avg. on common sense
    reasoning compared to Pythia-3B and even exceeding Pythia-7B).

# 2 State Space Models

# 3 Selective State Space Models

# 4 Empirical Evaluation

# 5 Discussion

## Related Work

* Appendix A discusses how the selection mechanism relates to similar concepts.
  Appendix B has an extended related work of SSMs and other related models.

## No Free Lunch: Continuous-Discrete Spectrum

* Structured SSMs were originally defined as discretizations of continuous
  systems (1), and have had a strong inductive bias toward continuous-time data
  modalities such as perceptual signals (eg audio, video). As discussed in
  Sections 3.1 and 3.5, the selection mechanism overcomes their weaknesses on
  discrete modalities such as text and DNA; but this conversely can impede
  their performance on data that LTI SSMs excel on. Our ablations on audio
  waveforms examine this tradeoff in more detail.

## Downstream Affordances. Transformer-based foundation models (particularly
LLMs) have a rich ecosystem of properties and modes of interaction with
pretrained models, such as fine-tuning, adaptation, prompting, in-context
learning, instruction tuning, RLHF, quantization, and so on. We are
particularly interested in whether Transformer alternatives such as SSMs have
similar properties and affordances.

## Scaling. Our empirical evaluation is limited to small model sizes, below the
threshold of most strong open source LLMs (eg Llama (Touvron+ 2023)) as well as
other recurrent models such as RWKV (B. Peng+ 2023) and RetNet (Y. Sun+ 2023),
which have been evaluated at the 7B parameter scale and beyond. It remains to
assess whether Mamba still compares favorably at these larger sizes. We also
note that scaling SSMs may involve further engineering challenges and
adjustments to the model that are not discussed in this paper.

# A. Discussion: Selection Mechanism 24

# B. Related Work

# D. Hardware-aware Algorithm For Selective SSMs

# E. Experimental Details and Additional Results
