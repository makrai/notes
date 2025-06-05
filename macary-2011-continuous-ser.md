On the use of Self-supervised Pre-trained Acoustic and Linguistic Features
  for Continuous Speech Emotion Recognition
Manon Macary, Marie Tahon, Yannick Estève, Anthony Rousseau
IEEE SLT 2021 arXiv:2011.09212 [cs.CL]

# Abstract

* continuous SER task, usually characterized by a small amount of labeled data
* Pre-training for feature extraction for continuous repr of audio and text
* we use wav2vec and camemBERT as self-supervised representation models
* task: continuous emotion recognition from speech (SER) on
  * AlloSat is a large French emotional database describing the satisfaction
  * the SOTA corpus SEWA focusing on valence, arousal and liking dimensions
* we present the first study showing that the
  joint use of wav2vec and BERT-like pre-trained features is very relevant
* Evaluated by the well-known concordance correlation coefficient (CCC)
  * we can reach a CCC value of 0.825 instead of 0.592
    using MFCC in conjunction with word2vec word embedding on the AlloSat
