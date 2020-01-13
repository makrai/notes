Google's Neural Machine Translation System:
  Bridging the Gap between Human and Machine Translation
* Y Wu, M Schuster, Z Chen, Q V. Le, M Norouzi, W Macherey, M Krikun, Y Cao, 
  Q Gao, K Macherey, J Klingner, A Shah, M Johnson, X Liu, Łukasz Kaiser, 
  S Gouws, Y Kato, T Kudo, H Kazawa, K Stevens, G Kurian, N Patil, W Wang, 
  C Young, J Smith, J Riesa, A Rudnick, O Vinyals, G Corrado, M Hughes, J Dean
Submitted on 26 Sep 2016

# Introduction

* In practice ... NMT systems used to be worse in accuracy than phrase-based
  translation systems, especially when training on very large-scale datasets
  as used for the very best publicly available translation systems
  * responsible for this gap:
  1. its slower training and inference speed,
    * large number of parameters
  2. ineffectiveness in dealing with rare words, and
    * attention mechanism to copy rare words [36], these approaches are both
      unreliable at scale, since the quality of the alignments varies across
      languages, and the latent alignments produced by the attention mechanism
      are unstable when the network is deep. Also, simple copying may not
      always be the best strategy to cope with rare words, for example when a
      transliteration is more appropriate
  3. sometimes failure to translate all words in the source sentence
* residual connections between layers to encourage gradient flow [20]
* For parallelism, we connect the attention from the bottom layer of the
  decoder network to the top layer of the encoder network
* To improve inference time, we employ _low-precision_ arithmetic for inference,
  which is further accelerated by special hardware (Google’s Tensor Processing
  Unit, or TPU).  To effectively deal with
* rare words, we use sub-word units (also known as “wordpieces”) [34] for
  inputs and outputs in our system.  Using wordpieces gives a good balance
  between the flexibility of single characters and the efficiency of full
  words for decoding, and also sidesteps the need for special treatment of
  unknown words
* beam search technique includes a
  * length normalization procedure to deal efficiently with the problem of
    comparing _hypotheses of different lengths_ during decoding, and a
  * _coverage penalty_ to encourage the model to translate all of the provided
    input
* results comparable to or better than previous state-of-the-art systems on
  standard benchmarks, while delivering great improvements over Google’s
  phrase-based production translation system. Specifically, on
  * WMT’14 English-to-French, our single model scores 38.95 BLEU, an
    * improvement of 7.5 BLEU from a single model without an external
      alignment model reported in [30] and an
      * [30] Luong, M.-T., Sutskever, I., Le, Q. V., Vinyals, O., and Zaremba,
        W
        Addressing the rare word problem in neural machine translation
        ACL-IJCNLP 2015
    * improvement of 1.2 BLEU from a single model without an external
      alignment model reported in [43]. Our single model is also
      * [43] Zhou, J., Cao, Y., Wang, X., Li, P., and Xu, W
        Deep recurrent models with
          fast-forward connections for neural machine translation
        CoRR abs/1606.04199 (2016)
    * comparable to a single model in [43], while not making use of any
      alignment model as being used in [43]. Likewise on
  * WMT’14 English-to-German, our single model scores 24.17 BLEU, which is 3.4
    BLEU better than a previous competitive baseline [6]. On
    * [6] Buck, C., Heafield, K., and Van Ooyen, B
      N-gram counts and language models from the common crawl
      LREC (2014)
  * production data, our implementation is even more effective. Human
    evaluations show that GNMT has reduced translation errors by 60% compared
    to our previous phrase-based system on many
    * English ↔ French, English ↔ Spanish, and English ↔ Chinese

# Related Work

* Statistical Machine Translation (SMT) [3, 4, 5]
* phrase-based systems (PBMT) which translate sequences of words or phrases
  where the lengths may differ [25]
* neural networks have been used as a component within SMT systems
  * use of a joint language model to learn phrase representations [13]
  * Other proposed approaches for learning phrase representations [7] or
  * end-to-end translation with neural networks [23]
* end-to-end learning for machine translation ... in the past (e.g., [8])
  * seminal papers in the area [39, 2]
  * Perhaps the first ... surpassing phrase-based translation was ...  [30]
* Since then, many novel techniques have been proposed
  * attention mechanism to deal with rare words [36]
  * coverage [40],
  * multi-task and semi-supervised training to incorporate more data [14,
    28], a
  * character decoder [9], a character encoder [11], subword units
    [37] also to deal with rare word outputs,
  * different kinds of attention mechanisms [29], and
  * sentence-level loss minimization [38, 33]
    * [33] Ranzato, M., Chopra, S., Auli, M., and Zaremba, W
      Sequence level training with recurrent neural networks
      International Conference on Learning Representations (2015)
    * [38] Shen, S., Cheng, Y., He, Z., He, W., Wu, H., Sun, M., and Liu, Y
      Minimum risk training for neural machine translation
      ACL 2016
      * Unlike conventional maximum likelihood estimation, minimum risk
        training is capable of optimizing model parameters directly with
        respect to arbitrary evaluation metrics, which are not necessarily
        differentiable

# 3 Model Architecture

* common sequence-to-sequence learning framework [39] with attention [2]
* three components:
  * an encoder network, a decoder network, and an
    * for NMT systems to achieve good accuracy, both the encoder and decoder
      RNNs have to be deep enough to capture subtle irregularities in the
      source and target languages. This observation is similar to
      * previous observations that _deep LSTMs_ significantly outperform shallow
        LSTMs [39].  In that work, each additional layer reduced perplexity by
        nearly 10%.  Similar to [30], we use a deep stacked Long Short Term
        Memory (LSTM) [22] network
  * attention network


## Residual Connections

* exploding and vanishing gradient problems [32, 21]
* Motivated by [20], we introduce residual connections among the LSTM layers
  in a stack

## Bi-directional Encoder for First Layer

## Model Parallelism

# 4 Segmentation Approaches

## Wordpiece Model

## Mixed Word/Character Model

# 5 Training Criteria

# 6 Quantizable Model and Quantized Inference

# 7 Decoder

# 8 Experiments and Results

# 9 Conclusion
