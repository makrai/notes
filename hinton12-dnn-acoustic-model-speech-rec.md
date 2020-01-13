Geoffrey Hinton, Li Deng, Dong Yu, George Dahl, Abdel-rahman Mohamed...
2012
Deep Neural Networks for Acoustic Modeling in Speech Recognition
Toronto, Microsoft, Google, IBM

# Introduction

* machine learning algorithms can lead to significant advances in automatic
  speech recognition.
* The biggest single advance occured nearly four decades ago with the
  introduction of the Expectation-Maximization (EM) algorithm for training
  Hidden Markov Models (HMMs)
* using the richness of Gaussian mixture models (GMM) [3] to represent the
  relationship between HMM states and the acoustic input.
* input is typically represented by concatenating Mel Frequency Cepstral
  Coefficients (MFCCs) or Perceptual Linear Predictive coefficients (PLPs) [4]
  computed from the raw waveform, and their first- and second-order temporal
  differences
* a GMM-HMM system can be further improved if it is discriminatively fine-tuned
  after it has been generatively trained to maximize its probability of
  generating the observed data,
* improved by augmenting (or concatenating) the input features (e.g., MFCCs)
  with “tandem” or bottleneck features generated using neural networks [8],
  [9].
* GMMs are so successful that it is difficult for any new method to outperform
* GMMs ... are statistically inefficient for modeling data that lie on or near
  a non-linear manifold
* the last few years... led to more efficient methods for training deep neural
  networks (DNNs) that contain 
  * many layers of non-linear hidden units and 
  * a very large output layer 
    * HMM states 
    * when each phone is modelled by a number of different “triphone” 
      * HMMs that take into account the phones on either side.

# II. Training deep neural networks

two-stage
  1. layers of feature detectors are initialized, one layer at a time, by
     fitting a stack of generative models, each of which has one layer of
     latent variables. These generative models are trained without using any
     information about the HMM states that the acoustic model will need to
     discriminate. 
  2. each generative model in the stack is used to initialize one layer of
     hidden units in a DNN and the whole network is then discriminatively
     fine-tuned to predict the target HMM states. These targets are obtained
     by using a baseline GMM-HMM system to produce a forced alignment.

A. Generative pre-training
B. An efficient learning procedure for RBMs
C. Modeling real-valued data
D. Stacking RBMs to make a deep belief network
E. Interfacing a DNN with an HMM

# III. Phonetic classification and recognition on TIMIT

# IV. Comparing DBN-DNNs with GMMs for large-vocabulary speech recognition

A. Bing-Voice-Search speech recognition task
B. Switchboard speech recognition task
C. Google Voice Input speech recognition task
D. YouTube speech recognition task
E. English-Broadcast-News speech recognition task
F. Summary of the main results for DBN-DNN acoustic models on LVCSR tasks
G. Speeding up DNNs at recognition time
H. Alternative pre-training methods for DNNs
I. Alternative fine-tuning methods for DNNs

# V. Other ways of using deep neural networks for speech recognition

A. Using DBN-DNNs to provide input features for GMM-HMM systems
  * Here we describe a class of methods where neural networks are used to
    provide the feature vectors that the GMM in a GMM-HMM system is trained to
    model. The most common approach to extracting these feature vectors is to
    discriminatively train a randomly initialized neural net with a narrow
    bottleneck middle layer and to use the activations of the bottleneck
    hidden units as features. For a summary of such methods, commonly known as
    the tandem approach, see [60], [61].
B. Using DNNs to estimate articulatory features for detection-based speech
recognition

# VI. Summary and future directions
