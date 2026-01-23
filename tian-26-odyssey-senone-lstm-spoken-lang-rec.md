Yao Tian, Liang He, Yi Liu, Jia Liu
Investigation of Senone-based Long-Short Term Memory RNNs
  for Spoken Language Recognition
2016 Odyssey

# Abstract

* Recently, the integration
  * of
    * deep neural networks (DNNs) trained to predict senone posteriors with
    * conventional language modeling methods
  * has been proved effective for spoken language recognition.
* This work extends some of the senone-based DNN frameworks by replacing the
  DNN with the LSTM RNN.
  * Two of these approaches use the LSTM RNN to generate features. The
    features are extracted from the recurrent projection layer in the LSTM RNN
    either as frame-level acoustic features or utterance-level features and
    are then processed in different ways to produce scores
  * third approach, the conventional i-vector model is modified to use the
    LSTM RNN to produce frame alignments for sufficient statistics extraction.
* Experiments on the NIST LRE 2015 demonstrate the effectiveness

# Introduction

* based on Gaussian Mixture Models (GMM) have been proposed for
  * spoken language recognition (SLR) [1], among which
  * i-vector modeling [2, 3] appears to be one of the most effective methods
    and brings significant performance improvements. In i-vector model,
    acoustic features (e.g., shifted delta cepstrum (SDC) features) are first
    converted into high-dimensional statistics. Then they are mapped into a
    low-dimensional subspace where a speech utterance is represented by a
    fixed-length vector called i-vector.  After the extraction of i-vectors,
    standard techniques such as Gaussian back-end, logistic regression [4] are
    applied to the ivectors of the test utterances to produce scores for each
    target language.
* deep neural network (DNN)
  * In the field of speech recognition, [DNN] has become the dominant approach
    in acoustic modeling as a replacement of GMM, bringing an about 30%
    relative improvement in word error rate (WER) [5, 6].
    * [5] George E Dahl, Dong Yu, Li Deng, and Alex Acero,
      “Context-dependent pre-trained deep neural networks for large-vocabulary
      speech recognition,”
      2012.
    * [6] Geoffrey Hinton, Li Deng, Dong Yu, George E Dahl, Abdel-rahman
      Mohamed, Navdeep Jaitly, Andrew Senior, Vincent Vanhoucke, Patrick
      Nguyen, Tara N Sainath, et al.,
      “Deep neural networks for acoustic modeling in speech recognition:
        The shared views of four research groups,”
      2012
  * In SLR, researchers have also investigated several strategies for using
    DNNs, and the most successful approaches are those
    * hybrid frameworks where DNNs trained to discriminate between senones
      (tied triphone states) are combined with conventional language
      recognition models [7, 8, 9].
      * In [7], the DNN is used to extract bottleneck features as a
        replacement of SDC features in i-vector model.  This data-driven
        phonetically-related feature representation has been demonstrated more
        effective for SLR tasks than the hand-designed feature such as the SDC
        feature.
        * [7] Yan Song, Bing Jiang, YeBo Bao, Si Wei, and L-R Dai, “I-vector
          representation based on bottleneck features for language
          identification,” Electronics Letters, vol. 49, no.  24, pp.
          1569–1570, 2013.
      * The method in [9] is also based on i-vector model and they use the DNN
        to compute frame posterior probabilities during the extraction of
        sufficient statistics. This work brings impressive relative gains and
        proves that more accurate content (senones) alignments of frames will
        benefit SLR tasks.
        * [9] Luciana Ferrer, Yun Lei, Mitchell McLaren, and Nicolas Scheffer,
          “Study of senone-based deep neural network approaches for spoken
          language recognition,” Audio, Speech, and Language Processing,
          IEEE/ACM Transactions on, vol. 24, no. 1, pp. 105–116, 2016.
        * This framework has also been successfully applied in speaker
          verification [8].
          * [9] Luciana Ferrer, Yun Lei, Mitchell McLaren, and Nicolas
            Scheffer, “Study of senone-based deep neural network approaches
            for spoken language recognition,” Audio, Speech, and Language
            Processing, IEEE/ACM Transactions on, vol. 24, no. 1, pp.
            105–116, 2016.
* [LSTMs] have been shown to outperform DNNs for acoustic modeling in ASR [10].
  * [10] Hasim Sak, Andrew W Senior, and Françoise Beaufays,
    “Long short-term memory recurrent neural network architectures for large
    scale acoustic modeling.,”
    INTERSPEECH, 2014
  * [11] has also proposed using LSTM RNNs for SLR.  However, their work tries
    to model the language space in a different perspective where the LSTM RNN
    is trained to predict languages
    * [11] Javier Gonzalez-Dominguez, Ignacio Lopez-Moreno, Hasim Sak, Joaquin
      Gonzalez-Rodriguez, and Pedro J Moreno, 
      Automatic language identification using LSTM RNNs
      INTERSPEECH, 2014, pp. 2155–2159.
* In this paper, we extend some of the senone-based DNN frameworks by using
  the LSTM RNN as a replacement of the DNN. Three approaches
  1. using the LSTM RNN to extract bottleneck features
    * hoping the inclusion of more temporal information might benefit SLR tasks
  2. we directly use the average outputs of the LSTM recurrent layer as the
     feature representation of the utterance since it spontaneously stores
     long-period information.
  3. we investigate using the LSTM RNN to provide frame posteriors during the
     extraction of sufficient statistics for the reason that the LSTM RNN may
     provide more accurate content frame alignments with sequence information
     from longer duration.
* Experiments are carried out on the task defined by NIST LRE 2015.
* organized as follows.
  * Section 2 introduces the feature extraction framework with the DNN.
  * Section 3 presents the DNN approach for sufficient statistics extraction.
  * Section 4 gives the LSTM RNN architecture.
  * Experiments and discussions are shown in Section 5
  * conclusions are presented in Section 6.

# 2 DNNs for feature extraction

* The DNN based bottleneck features are being widely used in various speech
  related applications [7, 12, 13].
  * [12] Dong Yu and Michael L Seltzer,
    “Improved bottleneck features using pretrained deep neural networks.,”
    Interspeech, 2011
  * [13] Jonas Gehring, Yajie Miao, Florian Metze, and Alex Waibel,
    “Extracting deep bottleneck features using stacked auto-encoders,”
    ICASSP, 2013
  * In SLR, the bottleneck feature replaces the traditional acoustic feature
    (SDC feature) for i-vector modeling.
* Another common usage of DNNs as feature extractors is to represent each
  utterance as the average of outputs derived from one of the DNN’s hidden
  layer [14]. Then decisions can be made between these features in a similar
  way as in ivector approach. This framework is referred to NN-full-feature
  model.
