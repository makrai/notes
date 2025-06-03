Attention Is All You Need In Speech Separation
Cem Subakan; Mirco Ravanelli; Samuele Cornell; Mirko Bronzi; Jianyuan Zhong
ICASSP 2021 2021 IEEE Intl Conf on Acoustics, Speech and Signal Processing

the SepFormer will be made available within the SpeechBrain toolkit

# Abstract

* Recurrent Neural Networks (RNNs) have long been the dominant architecture in
  sequence-to-sequence learning. RNNs, however, are inherently sequential
  * hE not allow parallelization of their computations
* Transformers are emerging as a natural alternative to standard RNNs,
  replacing recurrent computations with a multi-head attention mechanism.In
* we propose the SepFormer, a novel RNN-free Transformer-based neural network
  for speech separation. The Sep-Former
  * learns short and long-term dependencies with a multi-scale approach that
    employs transformers
* SOTA performance on the standard WSJ0-2/3mix datasets
  * SI-SNRi of 22.3 dB on WSJ0-2mix and an SI-SNRi of 19.5 dB on WSJ0-3mix
  * inherits the parallelization advantages of Transformers and achieves a
  * competitive performance even when downsampling the encoded representation
    by a factor of 8. It is thus
  * significantly faster and it is less memory-demanding than the latest speech
    separation systems with comparable performance

# 1.  INTRODUCTION

* RNNs for audio processing: they are used in many different domains
  * speech recognition, synthesis, enhancement, and separation, just to name a
  * multiplicative gate mechanisms (like LSTM [1] and GRU [2, 3]), their
  * learn long-term dependencies and properly manage speech contexts
  * sequential nature of RNNs impairs an effective parallelization of the
  * bottleneck particularly when processing large datasets with long sequences
* Transformers [4] completely avoid this bottleneck by eliminating recurrence
  and replacing it with a fully attention-based mechanism. By
  * attending to the whole sequence at once, a direct connection can be
    established between distant elements allowing Transformers to
  * learn long-term dependencies more easily [5]. For this reason, Transformers
  * for speech processing and recently showed competitive performance in speech
    recognition [6], synthesis [7], enhancement [8], diarization [9], as well
    as speaker recognition [10]
* Transformer-based models for monaural audio source separation
  * Little research has been done so far
  * The field has been revolutionized by deep learning techniques [11–16], and
    * end-to-end approaches [17–23] achieving impressive results
* Fig. 1. The high-level description of our system: The
  * encoder block estimates a learned-representation for the input signal,
  * the masking network estimates optimal masks to separate the sources present
  * decoder finally reconstructs the estimated sources in the time domain using
    the masks provided by the masking network
* learned-domain masking strategy
  * Most of the current speech separation techniques [14, 15, 17–22] require
    effective modeling of long input sequences to perform well
  * rely, in large part, on the learned-domain masking strategy popularized by
    Conv-TasNet [15]
  * an overcomplete set of analysis and synthesis filters is learned directly
    from the data, and
  * separation is performed by estimating a mask for each source in this
    learned-domain. Building on this,
  * Dual-Path RNN (DPRNN) [17] has demonstrated that
    better long-term modeling is crucial to improve the separation performance
    * achieved by splitting the input sequence into multiple chunks that are
      processed locally and globally with different RNNs. Nevertheless, due to
    * hE still suffers from the limitations of recurrent connections, espe-
      cially regarding the global processing step. An
  * Dual-Path Transformer Network (DPTNet) integrates transformers [22]
    * outperform the standard DPRNN
    * hE still embeds an RNN, effectively negating the parallelization
      capability of pure-attention models
* we propose a novel model called SepFormer (Separation Transformer), which
  * mainly composed of multi-head attention and feed-forward layers
  * We adopt the dual-path framework introduced by DPRNN and
  * we replace RNNs with a multiscale pipeline composed of transformers that
    learn both short and long-term dependencies
  * The dual-path framework enables to mitigate the quadratic complexity of
    transformers, as
    * transformers in the dual-path framework process smaller chunks
  * the first work showing that we can obtain SOTA performance in separation
    with an RNN-free Transformer-based architecture
* results
  * SI-SNRi of 22.3 dB on the standard WSJ0-2mix dataset
  * SOTA performance of 19.5 dB SI-SNRi on the WSJ0-3mix dataset
  * processes all the time steps in parallel
  * also competitive performance when 8x downsampling the encoded repr
    ~> significantly faster and less memory demanding
    than the latest RNN-based separation models
* future: different transformer architectures
  to further improve performance, speed, and memory usage

# 2.  THE MODEL

* based on the learned-domain masking approach [14, 15, 17–22] and employs an
  encoder, a decoder, and a masking network, as shown in Figure 1. The
  * encoder is fully convolutional, while the
  * masking network employs two Transformers embedded inside the dual-path
    processing block proposed in [17]
  * decoder finally reconstructs the separated signals in the time domain by
    using the masks predicted by the masking network. To foster

# 3.  EXPERIMENTAL SETUP

## 3.1. Dataset

* We use the popular WSJ0-2mix and WSJ0-3mix datasets [11] for source separ
  [11] J. R. Hershey, Z. Chen, J. Le Roux, and S. Watanabe,
  “Deep clustering: Discriminative embeddings for segmentation and separation,”
  ICASSP, 2016, pp. 31–35.
* mixtures of two speakers and three speakers are
  created by randomly mixing utterances in the WSJ0 corpus
* The relative levels for the sources are sampled uniformly in 0--5 dB
* training, validation, and test: 30, 10, 5 hours of speech is used resp
* The training and test sets are created with different sets of speakers
* sampled at 8 kHz

# 4.  RESULTS

## 4.2. Ablation Study

* the number of InterT and IntraT blocks has an important impact on the
  * The best results are achieved with 8 layers for both blocks replicated two
    times. We also would like to point out that a
* respectable performance of 19.2 dB is obtained even when we use a single
  layer transformer for the InterTransformer. This suggests that the
  * ie IntraTransformer, and thus local processing, has a greater influence on
    the performance. It also emerges that
* positional encoding is helpful (eg  see lines 3 and 5 of Table 2). A
  * similar outcome has been observed in [31] for speech enhancement. As for
* number of attention heads: slight performance diff between 8 and 16 heads
* dynamic mixing helps the performance significantly

## 4.4. Speed and Memory Comparison, training and inference

* we compare with DPRNN [17] and DPTNet [22]. Figure 3 (left) shows the
  training curves of the aforementioned models on the WSJ0-2mix dataset
  * We plot the performance achieved on the validation set in the first 48 hours
    of training versus the wall-clock time
    * For a fair comparison, we trained all the systems with
      * the same machine with the same GPU (a single NVIDIA V100-32GB) for all
      * a batch size of 1 and employ automatic mixed precision. We observe that
  * SepFormer is faster than DPRNN and DPTNeT. Figure 3 (left), highlights that
    * SepFormer reaches above 17dB levels only after a full day of training,
    * model requires two days of training to achieve the same level of perf
* Figure 3 (middle&right) compares the average computation time (in ms) and the
  total memory allocation (in GB) during inference when
* setting
  * single precision is used. We analyze the speed of our best model
  * both WSJ0-2Mix and WSJ0-3Mix datasets. We
  * comparison against DP-RNN, DPTNeT, and Wavesplit
  * All the models are stored in the same NVIDIA RTX8000-48GB GPU and we
  * analysis performed using the PyTorch profiler [32]
  * For Wavesplit we used the implementation in [33]
* the SepFormer is not only faster but also less memory demanding
  * the same behavior using the CPU for inference also. Such a level of
  * even though the proposed SepFormer employs more parameters
    than the other RNN-based methods (see Table 1).  This is not only
* success due to
  * the superior parallelization capabilities of the proposed model, but
  * because the best performance is achieved with a stride factor (SF) of 8
    samples, against a stride of 1 for DPRNN and DPTNet
    * Increasing the stride of the encoder results in downsampling the
      input sequence, and therefore the model processes less data. In
    * [17] showed that the DPRNN performance degrades when increasing SF
    * The SepFormer reaches competitive results even with a relatively large
      stride, leading to the aforementioned speed and memory advantages

# 5.  CONCLUSIONS

