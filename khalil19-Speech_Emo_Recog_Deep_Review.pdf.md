Speech Emotion Recognition Using Deep Learning Techniques: A Review
RA Khalil; E Jones; MI Babar; TJan; MH Zafar; T Alhussain
IEEE Access Volume: 7 2019

# Abstract

* databases used, emotions extracted,
  contributions made toward speech emotion recognition and limitations

# 1 Intro

* models used for categorization of emotions
  * discrete emotional approach is considered as one of the fundamental
    * eg anger, boredom, disgust, surprise, fear, joy, happiness, neutral and
      sadness [12], [13]
  * three-dimensional continuous space
* speech emotion recognition (SER) primarily comprises two phases
  * feature extraction and features classification phase [14]
  * features such as source-based excitation features, prosodic features,
    vocal traction factors, and other hybrid features [15]
  * classification using linear and non-linear classifiers
    * Bayesian Networks (BN) or the Maximum Likelihood Principle (MLP) and
      Support Vector Machine (SVM)
    * speech signal is non-stationary => non-linear classifiers eg
      Gaussian Mixture Model (GMM) and Hidden Markov Model (HMM) [16]
    * Energy-based features such as
      Linear Predictor Coefficients (LPC),
      Mel Energy-spectrum Dynamic Coefficients (MEDC),
      Mel-Frequency Cepstrum Coefficients (MFCC) and
      Perceptual Linear Prediction cepstrum coefficients (PLP) are often used
    * K-Nearest Neighbor (KNN), Principal Component Analysis (PCA) to emo [17]
* Deep Learning as an emerging field (Schmidhuber 2015)
  * Deep Learning techniques for SER have several advantages
  * tendency toward extraction of low-level features from the given raw data,
    and ability to deal with un-labeled data
  * limitations
    * CNNs: it also learns features from small variations and distortion
      occurrence and hence, requires large storage capability

# 2 traditional classification techniques

* 1 + three fundamental components
  * Enhancement
    * emotional discrimination is kept, while
      the speaker and recording variation is eliminated [26]
  * signal preprocessing
    * determine meaningful units of the signal [20]
    * speech enhancement is carried out where the noisy components are removed
  * feature extraction and feature selection
  * classification [19]
    * eg GMM and HMM
* spontaneous and acted speech are discussed due to their relevance

## E. Databases Used for SER

* In early 1990s, when the research on speech-based emotion recognition
  developed in earnest, researchers often commenced with acted databases and
  later moved to realistic databases [51], [52]

# 3 need for deep learning techniques utilized in a different context for SER

# 4 deep learning techniques are discussed on the basis of their layer-wise
architecture for SER

# 5 papers based on these deep learning techniques for SER

* In the case of SER, most of these techniques use supervised algorithms
  * nL, there is a shift to semi supervised learning
    * G Trigeorgis, F Ringeval, R Brueckner, E Marchi, MA Nicolaou, B Schuller+
      e2e SER using a deep convolutional recurrent network
      Proc. IEEE Int.  Conf.  Acoust. Speech Signal Process. (ICASSP) 2016, pp
  * learning of real-world data without the need for manual human labels
  * Table 7 provides a summary of the Deep learning techniques used by
    researchers along with their respective descriptive key features, databases
    used, and results from accuracy outcome, and some commentary on future
    directions

# 6 concluding
