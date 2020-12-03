Zihang Dai, Zhilin Yang, Yiming Yang, Jaime Carbonell, Quoc V. Le, Ruslan Salakhutdinov
Transformer-XL: Attentive Language Models Beyond a Fixed-Length Context
ACL 2019 long paper. Code and pretrained models are available at this https URL

code, pretrained models, and hyperparameters are available in both Tensorflow
and PyTorch

# Abstract

* Transformers
  * learning longer-term dependency, but are
  * limited by a fixed-length context in the setting of language modeling. We
* Transformer-XL that enables learning dependency beyond a fixed length 
  * without? segment-level recurrence mechanism and a
  * novel positional encoding scheme.  Our method not only enables capturing
    longer-term dependency, but also resolves the context fragmentation
  * learns dependency that is
    80% longer than RNNs and
    450% longer than vanilla Transformers, achieves better performance on both
  * up to 1,800+ times faster than vanilla Transformers during evaluation.
    Notably, we improve the SOTA results of bpc/perplexity

# Introduction

* Language modeling as unsupervised pretraining
  * Dai and Le, 2015
  * Peters+ 2018 Deep contextualized word representations.
  * Radford+ 2018 Improving language understanding by generative pre-training
  * Devlin+ 2018 Bert: Pre-training of deep bidirectional transformers for
* Recurrent neural networks (RNNs), in particular LSTM (Hochreiter& 1997), have
  * a standard solution to language modeling and obtained strong results on
  * difficult to optimize 
    * gradient vanishing and explosion (Hochreiter+ 2001), and the introduction
    * gating and the gradient clipping technique (Graves, 2013) 
      might not be sufficient to fully address this issue.  
  * Empirically use 200 context words on average (Khandelwal+ 2018),
* direct connections between long-distance word pairs baked in attention
  (Bahdanau+ 2014; Vaswani+ 2017)
  * Al-Rfou+ (2018) designed a set of auxiliary losses to train 
    deep Transformer networks for character-level language modeling, which
    outperform LSTMs by a large margin
  * training on separated fixed-length segments of a few hundred characters
    * [no] information flow across segments
    * fixed-length segments [not respecting any] semantic boundary
    * [can't] predict the first few symbols, leading to inefficient
* We introduce the notion of recurrence into our deep self-attention network
  * we reuse the hidden states obtained in previous segments
  * relative positional encodings rather than absolute ones
    * a simple but more effective relative positional encoding formulation
    * generalizes to attention lengths longer than the training
