LID-senone Extraction via Deep Neural Networks for End-to-End Lang Id
Ma Jin, Yan Song, Ian Mcloughlin, Lirong Dai, Zhongfu Ye
2016 Odyssey

* Recent [end-to-end scheme] deep neural networks (DNNs) utilising transfer
  learning such as bottleneck (BN) features, have demonstrated good overall
  performance, but have not addressed the extraction of LID-specific features.  
* We thus propose
  * LID-senone representations 
    * analogous to senones in speech recognition
* Results 
  * on the six most confused languages in NIST LRE 2009 show 
  * good performance
  * compared to state-of-the-art BN-GMM/i-vector and BN-DNN/i-vector systems.
* The proposed end-to-end network, coupled with an incremental training method
  which mitigates against over-fitting, has potential not just for LID, but
  also for other resource constrained tasks.

#1 Intro

* using deep bottleneck features (DBFs) from a DNN trained for ASR [7]. 
  * Song et.al, Richardson et.al and Bing et.al [4, 5, 6] proposed
  * DBFs are ... robust for ... speakers, channels and background noises. 
  * [4] Yan Song, Xinhai Hong, Bing Jiang, Ruilian Cui, Ian Vince McLoughlin,
    and Lirong Dai, “Deep bottleneck network based i-vector representation
    for language identification,” Proc. of InterSpeech, pp. 398–402, 2015.
  * [5] Fred Richardson, Douglas Reynolds, and Najim Dehak, “A unified deep
    neural network for speaker and language recognition,” arXiv preprint
    arXiv:1504.00923, 2015.
  * [6] Bing Jiang, Yan Song, Si Wei, Jun-Hua Liu, Ian Vince McLoughlin, and
    Li-Rong Dai, “Deep bottleneck features for spoken language
    identification,” PLoS ONE, vol. 9, no. 7, 2014.
* Lei et.al, Kenny et.al and Ferrer et.al [8, 9, 10] proposed collecting
  sufficient statistics also using structured DNNs 
  * [8] Yun Lei, Nicolas Scheffer, Luciana Ferrer, and Mitchell McLaren, “A
    novel scheme for speaker recognition using a phonetically-aware deep
    neural network,” Proc. of ICASSP, pp. 1695–1699, 2014.
  * [9] Patric Kenny, Vishwa Gupta, Themos stafylakis, Pierre Quellet, and
    Jahangir Alam, “Deep neural networks for extracting Baum-Welch statistics
    for speaker recognition,” Proc. of ICASSP, pp. 1695–1699, 2014. 
  * [10] Luciana Ferrer, Yun Lei, Mitchell McLaren, and Nicolas Scheffer,
    “Study of senone-based deep neural network approaches for spoken
    language recognition,” Audio, Speech, and Language Processing, IEEE/ACM
    Transactions on, vol. 24, no. 1, pp. 105–116, 2016.
* It seems that DNNs are effective for either front-end frame-level feature
  extraction or back-end utterance-level modelling, where sufficient good
  quality and quantity training data is available. 
* DBFs or senones, both derived from ASR training, are therefore clearly able
  to represent language-based content.  
  * However they are trained to assign to phonemes or phoneme states. While
    this is useful for [ASR?], it does not specifically encode
    language-discriminative information, particularly for highly confusable
    languages that may have similar phoneme-level statistics.
* Recent LID research has gradually moving towards task-aware or end-to-end
  schemes, which have demonstrated impressive performance. 
  * Jiang et.al showed [11] that tuning the pre-trained DNN parameters using
    an LID-specific corpus can improve performance. However this lattice-based
    optimisation scheme adjusts final layers and does not propagate to earlier
    acoustic layers.
* Convolutional neural networks (CNNs) have also demonstrated impressive
  front-end feature representation results on large-scale speech and visual
  object recognition tasks [12, 13].  
  * [12] O. Abdel-Hamid, A.-R. Mohamed, H. Jiang, L. Deng, G. Penn, and D. Yu,
    “Convolutional neural networks for speech recognition,” in Audio, Speech,
    and Language Processing,IEEE/ACM Transactions on, 2014, pp. 1533– 1545.
  * [13] Alex Krizhevsky, Ilya Sutskever, and Geoffrey E. Hinton, “Imagenet
    classification with deep convolutional neural networks,” Proc. of NIPS,
    pp. 1106–1114, 2012.
  * In current multi-layer CNNs, convolution-pooling-layer pairs can be
    thought of as front-end feature extractors, followed by final pooling
    layers to map frame-level features into an utterance representation that
    is amenable to linear classification.
  * Lozano-Diez et.al [14] evaluated different CNNs for LID, demonstrating
    comparable results for short utterances to end-to-end methods.
    * [14] 
      Alicia Lozano-Diez, Ruben Zazo-Candil, Javier Gonzalez-Dominguez,
        Doroteo T. Toledano, and Joaquin Gonzalez-Rodriguez, 
      An end-to-end approach to language identification in short utterances
        using convolutional neural networks
      Interspeech, 2015.
* Lopez-Moreno et.al and Gonzalez-Dominguez et.al [15, 16] also proposed
  end-to-end schemes using large scale DNNs and long short-term memory (LSTM)
  recurrent neural networks (RNN), which both perform well. 
  * Output scores at utterance level are the log-average of the softmax
    outputs across all frames.
* We propose a new end-to-end approach, named LID-net that 
  * combines 
    * the proven frame-level feature extraction capabilities of the DNN with
    * the effective utterance level mapping abilities of a CNN.
  * consists of a 
    * DNN-based front-end to derive acoustic features related to LID tasks,
    * CNN back-end, applying spatial pyramid pooling (SPP) [17] to form an
      utterance representation. The DNN is 
  * configured with a constricted bottleneck (BN) layer to transform acoustic
    features into a compact representation in a frame-by-frame manner
    Convolutional layers then perform nonlinear transformations of BN features
    into units which are discriminative for different languages. Following the
    definition of senones in DNNs for ASR, we term these units LID-senones
* LID-net contains a large number of parameters 
  * limitations of LID training data
  * An incremental training scheme is therefore proposed, inspired by transfer
    learning techniques. Specifically, we first initialise DNN layers from a
    DNN well-trained by the SwitchBoard corpus as in [18], then train LID-net
    by incrementally adding and training successive convolutional layers.
* Extensive experiments of different LID-net configurations on NIST LRE 2009
  highly confusable languages.  Comparing these to state-of-the-art i-vector
  methods based on DBFs, improved performance is achieved.  
