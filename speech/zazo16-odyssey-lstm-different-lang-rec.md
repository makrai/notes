Evaluation of an LSTM-RNN System 
  in Different NIST Language Recognition Frameworks
Ruben Zazo, Alicia Lozano-Diez, Joaquin Gonzalez-Rodriguez
2016

* Long Short-Term Memory recurrent neural networks (LSTM RNNs) provide an
  outstanding performance in language identification (LID) 
* previously published LSTM RNNs solutions for LID deal with highly controlled
  scenarios, balanced datasets and limited channel variability. In 
* this paper we evaluate an end-to-end LSTM LID system, comparing it against a
  classical i-vector system, on different environments based on data from
  Language Recognition Evaluations (LRE) organized by NIST.  In order to
  analyze the behavior we train and test our system on a balanced and
  controlled subset of LRE09, on the develompent data of LRE15 and, finally,
  on the evaluation set of LRE15. Our 
* results show that an 
  * end-to-end recurrent system clearly outperforms the reference i-vector
    system in a controlled environment, specially when dealing with short
    utterances.  Nevertheless, our deep learning approach is more sensitive to
    unbalanced datasets, channel variability and, specially, to the mismatch
    between development and test datasets.

# 1 Intro

* Most of the state-of-the-art systems for LID [1, 2] rely on acoustic
  modeling [3, 4]. 
  * [3] Pedro A. Torres-Carrasquillo, Elliot Singer, Mary A.  Kohler, and J.
    R. Deller, “Approaches to Language Identification Using Gaussian Mixture
    Models and Shifted Delta Cepstral Features,” in ICSLP, 2002, vol. 1, pp.
    89– 92.
  * [4] J. Gonzalez-Dominguez, I. Lopez-Moreno, J. FrancoPedroso, D. Ramos,
    D.T. Toledano, and J. GonzalezRodriguez, “Multilevel and Session
    Variability Compensated Language Recognition: ATVS-UAM Systems at NIST
    LRE 2009,” IEEE Journal of Selected Topics in Signal Processing, vol. 4,
    no. 6, pp. 1084–1093, 2010.  
* The basic approach of these systems consists of an i-vector extractor
  (as in speaker verification) followed by a classification stage [5, 6].
* Deep feed forward Neural Networks (DNNs) have shown to outperform i-vector
  based approaches when enough data for training is available (≥20h per
  language); specially when dealing with short test utterances (≤3s) [7, 8,
  9].
  * [7] Ignacio Lopez-Moreno, Javier Gonzalez-Dominguez, Oldrich Plchot,
    David Martinez, Joaquin GonzalezRodriguez, and Pedro Moreno,
    “Automatic Language Identification using Deep Neural Networks,” in
    Acoustics, Speech and Signal Processing (ICASSP), 2014 IEEE
    International Conference on. IEEE, 2014, pp. 5337–5341.
  * [8] Alicia Lozano-Diez, Javier Gonzalez-Dominguez, Ruben Zazo, Daniel
    Ramos, and Joaquin Gonzalez-Rodriguez, “On the use of convolutional
    neural networks in pairwise language recognition,” in Advances in Speech
    and Language Technologies for Iberian Languages, pp. 79–88.  Springer,
    2014.
  * [9] Alicia Lozano-Diez, Ruben Zazo-Candil, Javier Gonzalez-Dominguez,
    Doroteo T Toledano, and Joaquin Gonzalez-Rodriguez, “An end-to-end
    approach to language identification in short utterances using con-
    volutional neural networks,” in InterSpeech 2015, 2015.
* Long Short-Term Memory (LSTM) [in] speech recognition [14].
    * [14] Alex Graves, Navdeep Jaitly, and A-R Mohamed, “Hybrid speech
      recognition with deep bidirectional LSTM,” in Automatic Speech
      Recognition and Understanding (ASRU), 2013 IEEE Workshop on. IEEE, 2013,
      pp. 273–278.
* in (LID) 
  * In [[15]], the solution implemented runs over a large machine
    infrastructure and include proprietary LSTM RNNs, both provided by Google
    Inc.  This fact makes its use hardly reproducible or simply inaccessible
    for many research groups. Motivated by those results, 
  * we published an adapted version of this algorithm using an open source
    implementation running over a single GPU [16]. 
    * [16] R Zazo, A Lozano-Diez, J Gonzalez-Dominguez, D T Toledano, and J
      Gonzalez-Rodriguez, 
      Language Identification in Short Utterances Using LSTM RNNs
      PloS one 2015.
    * In this work we study and evaluate our LSTM based system in more
      challenging conditions including more similar languages (dialects),
      unbalanced data, duration variability and database mismatch. In order to
      perform this comparison we will use data from the Language Recognition
      Evaluations (LRE) organized by the National Institute of Standards and
      Technologies (NIST) in 2009 and 2015
      * our LSTM RNN system performs significantly 
        * better than the reference i-vector system when dealing with short
          utterances and a controlled environment, but its 
        * performance degrades in severe mismatched conditions.

# 2 System Description

## LSTM

More information about the training process of a LSTM can be found in [10,
12].
