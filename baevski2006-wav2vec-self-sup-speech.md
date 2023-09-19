wav2vec 2.0: 
A Framework for Self-Supervised Learning of Speech Representations
Alexei Baevski, Henry Zhou, Abdelrahman Mohamed, Michael Auli
arXiv:2006.11477 [cs.CL]

# 
Abstract

* We show for the first time that 
  learning powerful representations from speech audio alone 
  followed by fine-tuning on transcribed speech can 
  outperform the best semi-supervised methods while being conceptually simpler.
* wav2vec 2.0 masks the speech input in the latent space and solves a
  contrastive task defined over a quantization of the latent representations
  which are jointly learned
* Experiments using all labeled data of Librispeech achieve 1.8/3.3 WER on the
  clean/other test sets
  * less labeled data 
    * 1h: wav2vec 2.0 outperforms the previous SOTA on the 100 hour
      * with 100 times less labeled data
    * 10m and pre-training on 53k hours of unlabeled data still 4.8/8.2 WER

# 1 Intro

* self-supervised learning paradigm = learn general data representations from
  unlabeled examples and to fine-tune the model on labeled data.  This has been
  * particularly successful for natural language processing [43, 45, 9] and is
  * active research area for computer vision [20, 2, 36, 19, 6].

* we: a framework for self-supervised learning of reprs from raw audio data.
  * encodes speech audio via a multi-layer convolutional neural network and
    then masks spans of the resulting latent speech representations [26, 56],
    similar to masked language modeling [9]
  * The latent representations are fed to a Transformer network to build
    contextualized representations and the model is 
    trained via a contrastive task where 
    the true latent is to be distinguished from distractors [54, 49, 48, 28]
    sec 2

  * we learn discrete speech units [53, 32, 7, 18] via a gumbel softmax [24, 5]
    to represent the latent representations in the contrastive task (Figure 1)
    * more effective than non-quantized targets
  * After pre-training on unlabeled speech, the model is 
    fine-tuned on labeled data with a Connectionist Temporal Classification
    (CTC) loss [14, 4] to be used for downstream speech recognition tasks (§ 3)

* Previous work learned a 
  * quantization of the data followed by a contextualized representations with
    a self-attention model [5, 4], whereas our approach solves both problems
    end-to-end. 
  * Masking parts of the input with Transformer networks for speech [4, 26]
    * prior work relies either on a two-step pipeline or 
      their model is trained by reconstructing the filter bank input features.

  * learning representations from auto-encoding the input data [52, 11] or
  * directly predicting future timesteps [8].

* jointly learning discrete speech units with contextualized representations
  achieves substantially better results than fixed units learned in a prior
  step [4]
  * feasibility of ultra-low resource speech recognition: when using only 10
    minutes of labeled data, our approach achieves word error rate (WER)
    4.8/8.2 on the clean/other test sets of Librispeech.

* We set a new SOTA on both the
  TIMIT phoneme recognition and the 100 hour clean subset of Librispeech.
  * when we lower the amount of labeled data to just one hour, we still
    outperform the previous SOTA self-training method of [42] 
    while using 100 times less labeled data and the same amount of unlabeled
  * all 960 hours of labeled data from Librispeech => 1.8/3.3 WER (§ 4, § 5)
