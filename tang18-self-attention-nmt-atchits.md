Why Self-Attention? A Targeted Evaluation of NMT Architectures
Gongbo Tang, Mathias Müller, Annette Rios and Rico Sennrich
2018

# Abstract

* non-recurrent architectures (convolutional, self-attentional)
  * outperformed RNNs in neural machine translation
  * can connect distant words via shorter network paths than RNNs
  * speculated that this improves their ability to model long-range dependencies
* We 
  * hypothesize that their strong performance is due to their ability
    to extract semantic features from the source text
  * evaluate RNNs, CNNs and self-attention networks on two tasks: 
    * subject-verb agreement (long-range dependencies is required) and 
      * self-attentional networks and CNNs do not outperform RNNs
    * word sense disambiguation (semantic feature extraction is required)
      * self-attentional networks perform distinctly better than RNNs and CNNs

# 1 Intro

* Different effective architectures for neural machine translation (NMT),
  * recurrent architectures 
    (Kalchbrenner and Blunsom, 13; Bahdanau+ 15; Sutskever+ 14; Luong+ 15) to
  * convolutional (Kalchbrenner and Blunsom, 2013; Gehring+ 2017) and, most
  * fully self-attentional (Transformer) models (Vaswani+ 2017). Since 
* comparisons (Gehring+ 2017; Vaswani+ 2017; Hieber+ 2017) 
  * mainly carried out via BLEU (Papineni+ 2002), it is 
  * BLEU metric is quite coarse-grained, and offers no insight as to 
    which aspects of translation are improved by different architectures.
* Recurrent neural networks (RNNs, Elman, 1990) can easily deal with
  variable-length input sentences and thus are a natural choice for the encoder
  and decoder of NMT systems. Modern variants of RNNs, such as GRUs (Cho+ 2014)
  and LSTMs (Hochreiter and Schmidhuber, 1997), address the difficulty of
  training recurrent networks with long-range dependencies. 
* Gehring+ (2017) introduce a neural architecture where both the encoder and
  decoder are based on CNNs, and report better BLEU scores than RNN-based NMT
  models. Moreover, the computation over all tokens can be fully parallelized
  during training, which increases efficiency. 
* Vaswani+ (2017) propose Transformer models, which are built entirely with
  attention layers, without convolution or recurrence. They report new SOTA BLEU
  scores for EN→DE and EN→FR. Yet, the 
* To explain the observed improvements in BLEU, previous work has been theoretic
  * Gehring+ (2017) and Vaswani+ (2017) argue that the length of the paths in
    neural networks between co-dependent elements affects the ability to learn
    these dependencies: the shorter the path, the easier the model learns dep
* We argue other abilities of non-recurrent networks could be responsible for
  * to CNNs and Transformers being strong semantic feature extractors.In this
  * evaluate all three popular NMT architectures: models 
    * based on RNNs (referred to as RNNS2S in the remainder of the paper)
    * based on CNNs (referred to as ConvS2S) and 
    * self-attentional models (referred to as Transformers).  Motivated by the
* tasks
  * subject-verb agreement task (that requires modeling long-range dependencies)
  * word sense disambiguation (WSD) task (requires extracting semantic features)
  * Both tasks build on test sets of contrastive translation pairs, 
    Lingeval97 (Sennrich, 2017) and ContraWSD (Rios+ 2017).  
* contributions of this paper can be summarized as follows:
  * are architectures with shorter paths better at capturing long-range deps.
    * subject-verb agreement over long distances do not show any evidence that
      Transformers or CNNs are superior to RNNs in this regard.
  * the number of attention heads in Transformers impacts their ability to
    capture long-distance dependencies. 
    * many-headed multi-head attention is essential for modeling long-distance
      phenomena with only self-attention.
  * Transformers excel at WSD: they are strong semantic feature extractors.
