An Acoustic Framework for Detecting Fatigue
  in Speech Based Human-Computer-Interaction
Jarek Krajewski, Rainer Wieland & Anton Batliner 
Part of the Lecture Notes in Computer Science book series (LNISA,volume 5105)

# Abstract

* we describe a general framework for detecting accident-prone fatigue states
  based on prosody, articulation and speech quality related speech charistics.
  * real-time, non obtrusive, and free from sensor application and calibration
* The main part of the feature computation is the 
  combination of frame level based speech features and high level contour
  descriptors resulting in over 8,500 features per speech sample. In general
* the measurement process follows the speech adapted steps of pattern recog: 
  * recording speech, 
  * preprocessing (segmenting speech units of interest), 
  * feature computation (perceptual and signal processing related features, as
    eg fundamental frequency, intensity, pause patterns, formants, cepstral
    coefficients), 
  * dimensionality reduction (filter and wrapper based feature subset select,
    (un-)supervised feature transformation), 
  * classification (eg SVM, K-NN classifier), and 
  * evaluation (eg 10-fold cross validation). The validity of this approach is
* empirical results of a sleep deprivation study.
