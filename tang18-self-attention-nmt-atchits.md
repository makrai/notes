Why Self-Attention? A Targeted Evaluation of NMT Architectures
Gongbo Tang, Mathias Müller, Annette Rios and Rico Sennrich
2018

# Abstract

* non-recurrent architectures (convolutional, self-attentional)
  * outperformed RNNs in neural machine translation
  * can connect distant words via shorter network paths than RNNs
  * speculated that this improves their ability to model long-range dependencies
* We
  * hypothesize that their strong performance is due to their ability to extract
    semantic features from the source text
  * evaluate RNNs, CNNs and self-attention networks on two tasks:
    * subject-verb agreement (long-range dependencies is required) and
      * self-attentional networks and CNNs do not outperform RNNs
    * word sense disambiguation (semantic feature extraction is required)
      * self-attentional networks perform distinctly better than RNNs and CNNs

# 1 Intro

* Different effective architectures for neural machine translation (NMT),
  * recurrent architectures (Kalchbrenner and Blunsom, 13; Bahdanau+ 15;
    Sutskever+ 14; Luong+ 15) to
  * convolutional (Kalchbrenner and Blunsom, 2013; Gehring+ 2017) and, most
  * fully self-attentional (Transformer) models (Vaswani+ 2017). Since
* comparisons (Gehring+ 2017; Vaswani+ 2017; Hieber+ 2017)
  * mainly carried out via BLEU (Papineni+ 2002)
  * BLEU metric is quite coarse-grained, and offers no insight as to which
    aspects of translation are improved by different architectures
* Recurrent neural networks (RNNs, Elman, 1990)
  * can easily deal with variable-length input sentences and thus are a
  * natural choice for the encoder and decoder of NMT systems
  * GRUs (Cho+ 2014) and LSTMs (Hochreiter and Schmidhuber, 1997), address the
    difficulty of training recurrent networks with long-range deps
* Gehring+ (2017) introduce a neural architecture where
  * both the encoder and decoder are based on CNNs
  * better BLEU scores than RNN-based NMT models
  * computation over all tokens can be fully parallelized during training, which
* Vaswani+ (2017) propose Transformer models, which are
  * built entirely with attention layers, without convolution or recurrence
  * new SOTA BLEU scores for EN→DE and EN→FR
* To explain the observed improvements in BLEU, previous work has been theoretic
  * Gehring+ (2017) and Vaswani+ (2017) argue that the
    * length of the paths in neural networks between co-dependent elements
      affects the ability to learn these dependencies:
      * the shorter the path, the easier the model learns dep
* We
  * argue other abilities of non-recurrent networks could be responsible
    * to CNNs and Transformers being strong semantic feature extractors
  * evaluate all three popular NMT architectures:
    * based on RNNs (referred to as RNNS2S in the remainder of the paper)
    * based on CNNs (referred to as ConvS2S) and
    * self-attentional models (referred to as Transformers)
* tasks
  * subject-verb agreement task (that requires modeling long-range dependencies)
  * word sense disambiguation (WSD) task (requires extracting semantic features)
  * Both tasks build on test sets of contrastive translation pairs, Lingeval97
    (Sennrich, 2017) and ContraWSD (Rios+ 2017)
* contributions
  * ?are architectures with shorter paths better at capturing long-range deps
    * subject-verb agreement over long distances do not show any evidence that
      Transformers or CNNs are superior to RNNs in this regard
  * the number of attention heads in Transformers impacts their ability to
    capture long-distance dependencies
    * many-headed multi-head attention is essential for modeling long-distance
      phenomena with only self-attention
  * Transformers excel at WSD: they are strong semantic feature extractors

## 3.2 Contrastive Evaluation of Machine Translation 3

* Human reference translations are paired with one or more contrastive variants
  * a specific type of error is introduced automatically.  The evaluation
  * NMT models are conditional language models. By virtue of this,
  * given any source sentence S and target sentence T , any NMT model can assign
    to them a probability P (T |S)
  * If a model assigns a higher score to the correct target sentence: correct

### 3.2.2 ContraWSD

* e.g. where the English _line_ is the correct trans of the German _Schlange_,
  ContraWSD replaces _line_ with the other translations of _Schlange_, such as
  _snake, serpent_, to generate contrastive translations
* In, ContraWSD all the ambiguous words are nouns
  * disambiguation is not possible simply based on syntactic context

# 4 Subject-verb Agreement 4

# 5 WSD 7

* Our experimental results on the subject-verb agreement task demonstrate that
  CNNs and Transformer are not better at capturing long-range dependencies
  compared to RNNs, even though the paths in CNNs and Transformers are shorter
  * not in accord with the argument in Gehring+ (2017) and Vaswani+ (2017)
  * these architectures perform well empirically according to BLEU
  * Thus, we further evaluate these architectures on WSD, to test our
  * hypothesis: non-recurrent architectures are better at extracting sem feats

# 6 Post-publication Experiments

* We here present a number of further experiments with different configurations
  and implementations, to test the robustness of our claims

## Pre-trained Fairseq CNN Model

* ConvS2S models underperform RNNS2S and Transformer on the subject-verb agreem
* question whether these results can be attributed to a misconfiguration or
  implementation difference in Sockeye, we also obtained results with a
  pre-trained model released by (Gehring+ 2017) and trained with Fairseq 6
* Fairseq model has 15 layers, which is much deeper than the Sockeye models
  * higher BLEU score on newstest2014, and higher accuracy on long-range deps,
    than the 8-layer Sockeye models that we trained
  * still lags behind RNNS2S and Transformer on the subject-verb agreement task

## Reducing Model Differences

* diff not only between recurrent, convolutional, and self-attentional archit
  * Transformer has multiple attention layers, multi-head attention, residual
    feed-forward layers, etc.  These modules may affect NMT models on capturing
* Domhan (2018) applies these advanced techniques of Transformer models to both
  RNN and CNN models in Sockeye, minimizing the architectural difference
  * We reuse his configurations to train minimally different RNN, CNN and Transf

### Subject-verb agreement

### WSD

* performance gap between Transformerd and the other models is getting smaller
  * implies that _some_ of the strong performance of the Transformer for WSD is
    attributable to architecture choices such as multi-head attention,
    layer normalization, and upscaling feed-forward layers in each block

# 7 Conclusion 9

* results show that:
  * no evidence that CNNs and Transformers,
    which have shorter paths through networks, are empirically
    superior to RNNs in modeling subject-verb agreement over long distances
  * The number of heads in multi-head attention affects the ability of a
    Transformer to model long-range dependencies in the subject-verb agreement
  * Transformer models excel at another task, WSD, compared to the CNN and RNN
* suggest that assessing the performance of NMT architectures means
  * finding their inherent trade-offs,
    rather than simply computing their overall BLEU score
  * given the idiosyncratic limitations of recurrent and selfattentional models,
    combining them is an exciting line of research
  * weakness of CNN architectures on long-distance phenomena also worth tackling
    * find inspiration from related work in computer vision (Xu+ 2014)
