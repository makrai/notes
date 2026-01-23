wav2vec 2.0: A Framework for Self-Supervised Learning of Speech Representations
Alexei Baevski, Yuhao Zhou, Abdelrahman Mohamed, Michael Auli
NeurIPS 2020

# Abstract

* learning powerful representations from speech audio alone
  followed by fine-tuning on transcribed speech can
  outperform the best semi-supervised methods while being conceptually simpler.
* wav2vec 2.0 masks the speech input in the latent space and solves a
  contrastive task defined over a quantization of the latent representations
  which are jointly learned
* Experiments using
  * all labeled data of Librispeech achieve 1.8/3.3 WER on the clean/other test
  * When lowering the amount of labeled data to one hour, wav2vec 2.0
    outperforms the previous SOTA on the 100 hour subset while using 100 times
    less labeled data
  * just ten minutes of labeled data and pre-training on 53k hours of unlabeled
    data still achieves 4.8/8.2 WER
