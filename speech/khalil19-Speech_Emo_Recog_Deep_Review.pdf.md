Speech Emotion Recognition Using Deep Learning Techniques: A Review
RA Khalil; E Jones; MI Babar; TJan; MH Zafar; T Alhussain
IEEE Access Volume: 7 2019

# Abstract

* The review covers databases used, emotions extracted,
  contributions made toward speech emotion recognition and limitations

# 1 Intro

* models used for categorization of these emotions, a
  * discrete emotional approach is considered as one of the fundamental
    * eg anger, boredom, disgust, surprise, fear, joy, happiness, neutral and
      sadness [12], [13]. Another important model that is used is a
  * three-dimensional continuous space
* speech emotion recognition (SER) primarily comprises two phases known as
  * feature extraction and features classification phase [14]. In the field of
  * features such as source-based excitation features, prosodic features,
    vocal traction factors, and other hybrid features [15]. The second phase
  * classification using linear and non-linear classifiers.  The most commonly
    * Bayesian Networks (BN) or the Maximum Likelihood Principle (MLP) and
      Support Vector Machine (SVM)
    * speech signal is non-stationary => non-linear classifiers eg
      Gaussian Mixture Model (GMM) and Hidden Markov Model (HMM) [16]. These
    * Energy-based features such as
      Linear Predictor Coefficients (LPC),
      Mel Energy-spectrum Dynamic Coefficients (MEDC),
      Mel-Frequency Cepstrum Coefficients (MFCC) and
      Perceptual Linear Prediction cepstrum coefficients (PLP) are often used
      for effective emotion recognition from speech
    * K-Nearest Neighbor (KNN), Principal Component Analysis (PCA) and
      Decision trees are also applied for emotion recognition [17].
* Deep Learning has been considered as an emerging field (Schmidhuber 2015)
  * Deep Learning techniques for SER have several advantages 
  * tendency toward extraction of low-level features from the given raw data,
    and ability to deal with un-labeled data.
  * limitations 
    * CNNs: it also learns features from small variations and distortion
      occurrence and hence, requires large storage capability.  Similarly,

# 2 traditional classification techniques is given in Section II. Section III

* 1 + three fundamental components
  * Enhancement
    * emotional discrimination is kept, while the speaker and recording
      variation is eliminated [26].
  * signal preprocessing
    * determine meaningful units of the signal [20]
    * speech enhancement is carried out where the noisy components are removed.
  * feature extraction and feature selection
  * classification [19].
    * eg GMM and HMM
* spontaneous and acted speech are discussed due to their relevance to the

## E. Databases Used for SER

* In early 1990s, when the research on speech-based emotion recognition
  developed in earnest, researchers often commenced with acted databases and
  later moved to realistic databases [51], [52]

# 3 need for deep learning techniques utilized in a different context for SER.

# 4 deep learning techniques are discussed on the basis of their layer-wise
architecture for SER. Further, Section V provides a

# 5 papers based on these deep learning techniques for SER along with detailed
discussion and future directions. Finally, 

* In the case of SER, most of these techniques use supervised algorithms during
  * nL, there is a shift to semi supervised learning 
    * G Trigeorgis, F Ringeval, R Brueckner, E Marchi, MA Nicolaou, B Schuller+
      E2e ser using a deep convolutional recurrent network
      Proc. IEEE Int.  Conf.  Acoust. Speech Signal Process. (ICASSP), pp.
      5200-5204, Mar. 2016. This will enhance
    the learning of real-world data without the need for manual human labels.
    Table 7 provides a summary of the Deep learning techniques used by
    researchers along with their respective descriptive key features, databases
    used, and results from accuracy outcome, and some commentary on future
    directions

# 6 concluding remarks are presented in Section VI.
