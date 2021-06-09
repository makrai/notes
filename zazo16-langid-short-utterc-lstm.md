Language Identification in Short Utterances Using LSTM RNNs
Ruben Zazo , Alicia Lozano-Diez, Javier Gonzalez-Dominguez,
  Doroteo T.  Toledano, Joaquin Gonzalez-Rodriguez
2016

# Abstract

* Long Short Term Memory (LSTM) Recurrent Neural Networks (RNNs) have recently
  outperformed other state-of-the-art approaches, such as i-vector and Deep
  Neural Networks (DNNs), in automatic Language Identification (LID),
  particularly when dealing with very short utterances (~3s)
* we present an open-source, end-to-end, LSTM RNN system running on limited
  computational resources (a single GPU) that
  * outperforms a reference i-vector system on a subset of the NIST Language
    Recognition Evaluation (8 target languages, 3s task) by up to a 26%.
  * in line with previously published research using proprietary LSTM
    implementations and huge computational resources, which made these former
    results hardly reproducible.  Further, we
  * extend those previous experiments modeling unseen languages (out of set,
    OOS, modeling), which is crucial in real applications. Results show that a
    LSTM RNN with OOS modeling is able to detect these languages and
    generalizes robustly to unseen OOS languages
  * also analyze the effect of even more limited test data
    * proving that with ... 0.5s an accuracy of over 50% can be achieved.

# 1 Intro

* the i-vector approach has proven to be successful in several scenarios,
  including rapid LID [10], it suffers from two major drawbacks
  1. estimation of the point has a larger variance when the _amount of data_
     used to compute it decreases, quickly degrading its robustness, specially
     from short segments
  2. representation of a whole utterance, so most of the computation is
     performed after completion of it, introducing a significant latency
* We have previously shown that DNNs also surpass the performance of i-vector
  based approaches in language recognition when enough data for training is
  available (≥20h per language); specially when dealing with short test
  utterances (≤3s) [14, 15]
* DNNs have been applied successfully to LID in three different ways:
  1. Train a DNN or Convolutional Neural Network (CNN) with a bottleneck
     architecture and then use the outputs of the bottleneck layer as features
     within an i-vector framework [16–18].
  2. Modify the standard i-vector technique to use senones predicted with a DNN
     trained for speech recognition as classes instead of the Gaussian
     components defined by a Gaussian mixture model (GMM) based universal
     background model (UBM) [17, 19].
  3. Train a neural network in an end-to-end fashion to discriminate between
     languages [14].
   * Lopez-Moreno I, Gonzalez-Dominguez J, Plchot O, Martinez D,
     Gonzalez-Rodriguez J, Moreno P.
     Automatic Language Identification using Deep Neural Networks.
     2014 Acoustics, Speech, and Signal Processing, IEEE
    * [15]
      Lozano-Diez A, Gonzalez-Dominguez J, Zazo R, Ramos D, Gonzalez-Rodriguez J
      On the Use of Convolutional Neural Networks in Pairwise Language Rec
      2014 Advances in Speech and Language Techs for Iberian Langs Springer
* RNNs are, in theory, a good model to fit temporal sequences such as speech,
  its training process has issues that makes its performance not as good as
  expected [21, 22].
* we previously introduced [the fist] LID system based on LSTM RNNs with an
  outstanding performance in Gonzalez-Dominguez et al. (2014). So far, the
  solution implemented runs over a large machine infrastructure and includes a
  proprietary LSTM RNNs implementation. This fact makes its use hardly
  reproducible or simply inaccessible for many research groups.
* we explore different aspects that affect LSTM RNNs performance,
  * implementing several configurations and
  * comparing the obtained results with a reference i-vector based system
    trained from the same acoustic features
  * out-of-set data or shorter durations (up to 0.1s)
  * perform better than our reference i-vector system.
* organized into the following sections.
  * reference system based on i-vectors
  * LSTM RNN as a language identification system
  * Datasets and Evaluation Metrics
  * configuration parameters in both the task and the neural network topology.
  * conclusions of the study and potential future work.

# Results and Discussion

## System performance

* have from 5 to 21 times fewer parameters (see Size in Table 2) than the
  reference system
