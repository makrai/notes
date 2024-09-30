Automatic Detection of Depression in Speech
  Using Ensemble Convolutional Neural Networks
Adrián Vázquez-Romero and Ascensión Gallardo-Antolín
Entropy 2020, 22(6), 688; https://doi.org/10.3390/e22060688

# 1 Intro

* Automatic Depression Detection (ADD) based on speech signals (Cohn+ 09)
* since 2011, annually, Audio–Visual Emotion Challenges
  * each competition focused on one particular mental disorder such as
    depression [8,9,10] or bipolar disorders [11]
  * through four well-known dimensions of the emotions
    * arousal, valence, expectancy, and power
    * in all the challenges [8,9,10,11,12]
* we follow the guidelines of the Depression Classification Sub-Challenge (DCC)
  at the 2016 Audio-Visual Emotion Challenge (AVEC) [10]
  * we focus on audio information
  * ensemble of Convolutional Neural Networks (CNNs)
  * inputs are speech log-spectrograms
  * As in the DCC sub-challenge, the English-speakers database DAIC-WOZ [13]

# 2 The SOTA of the automatic depression detection, CNNs and ensemble methods

## ADD systems consider visual and audio individually or combined

* visual modality is based on facial video information
  * facial expressions, head movements, eye gazes, or blinks
  * represented by Facial Action Coding System (FACS),
    Active Appearance Model (AAM), or
    Local Phase Quantization at Three Orthogonal Planes (LPQ-TOP) [14] With
  * Support Vector Regression (SVR) models obtain good achievements [15,16]
  * [17]: eigenfaces predict depression in adolescents. Other systems
  * combine visual cues with other types of information, mainly acoustic,
    * usually outperform the individual modalities
    * [18]: fusing the audio and visual information with neural network-based
      hierarchical classifiers and SVR ensembles
      * successfully assessed on the AVEC-2013 [8] challenge
    * [19] implements a combination of the audio and visual features with a
      Decision Tree as classifier and was the winner of the AVEC-2016
* we focus on the acoustic modality
  * Speech contains features about the
    emotional, neurological, and mental traits and states of the speaker
  * speech tech for the assessment, diagnosis and tracking of health condi [20]
    * Cummins, N.; Baird, A.; Schuller, B.W.
      Speech analysis for health: Current SOTA and the increas[e] of deep learn
      Methods 2018
  * Computational Paralinguistic Analysis, current research encompasses
    * detection of pathological voices due eg to laryngeal disorders [21]
    * the diagnosis and monitoring of neurodegenerative conditions, such as
      Parkinson’s disease [22,23], Mild Cognitive Impairment [24],
      Alzheimer’s disease [24,25] or Amyotrophic Lateral Sclerosis [26]
    * the prediction of stress and cognitive load level [27,28]
    * detection of psycho pathologies, such as autism [29] or depression [30],
      * the topic of this paper
* Conventional systems for speech-based health tasks are data-driven
  * hand-crafted acoustic features
    eg pitch, prosody, loudness, rate of speech, and energies
  * machine-learning algorithm such as Logistic Regression,
    Support Vector Machines (SVM) or Gaussian Mixture models [22,23,24,29]
  * deep-learning techniques (2018+) [20,21,25,26,27,28]
* depression detection, most of the developed systems also follow one of
  * conventional ADD systems rely on studies about the importance of several
    acoustic characteristics for depression detection
    * the most relevant features are pitch, formants, intensity, jitter,
      shimmer, harmonic-to-noise ratio, and rates of speech [30,31,32]
    * depressed speakers speak in an unnatural and monotonous way [33]
  * based on the deep-learning paradigm
    * Convolutional Neural Networks (CNN)

## Convolutional Neural Networks (CNN)

* appeared in 1980s (Fukushima 1980)
* Krizhevsky+ (2012), a CNN-based net was proposed for image recognition
* many problems in computer vision have been solved with CNNs
  * handwritten digits, traffic sign classification, people detection, or
    image recognition for health applications
* audio-related tasks
  * automatic speech recognition [36,37,38,39],
  * speech emotion recognition [40,41]
  * acoustic scene classification [42,43]
* DepAudionet (Ma+ 2016): a speech-based depression detection system
  * uses One-Dimensional CNN (1d-CNN), Long Short-Term Memory (LSTM) and
    fully connected layers
  * it is the basis of our work

## Ensemble methods

* meta-algorithms, usually using the same base learner
* Ensemble learning with neural networks was introduced in [45]
* used in many architectures
* applications such as image categorization [46], sentiment analysis [47] or
  acoustic environment classification [48]

## Our contributions; Privacy

* our two main contributions
  * a refined 1d-CNN architecture
    * based on the aforementioned DepAudionet model [44]
    * optimized by selecting the best config from an exhaustive experiment
  * ensemble learning strategy for fusing several 1d-CNN machines
    * the performance of these individual systems is improved
    * Ensemble CNN models have been successfully used in
      other speech~ and audio-related tasks
      eg automatic speech recognition [39], speech emotion recognition [40], or
      acoustic scene classification [43]
    * not used previously for automatic depression detection from speech
* privacy: An important issue in real-world speech-based health applications
  * In the DAIC-WOZ dataset, participants completed consent forms to allow
    their data to be shared for research purposes [13]
  * in real-world remote monitoring of patients [20,49]
    data acquisition is done through microphone-enabled smart devices and/or
    other wearable technologies
  * two main strategies for strengthening privacy can be considered [50]
    * extraction of acoustic features from which it is not possible to
      reconstruct the raw speech signal
      * eg in [51], the used audio characteristics are the percentage of speech
        detected in a given time period, and the percentage of speech uttered
        by the patient, and therefore, it is not necessary to store the whole
        raw recordings
    * extraction and encryption of the acoustic characteris in the local device
      and their transmission to a secure server for further analysis [49]
      * When the system uses features that allow the recovery of the original
    * If the system proposed in this paper had to work in the real world,
      this second approach should be considered
      * inputs are log-spectrograms (a reversible transformation of the speech)
      * this issue is beyond the scope of this paper

# 3 The dataset we have used, and the proposed system

# 4 Experiments and results

# 5 Conclusions and future work
