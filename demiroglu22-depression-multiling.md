Depression-level assessment from multi-lingual conversational speech data
  using acoustic and text features
Cenk Demiroglu, Aslı Beşirli, Yasin Ozkanca & Selime Çelik
EURASIP Journal on Audio, Speech, and Music Processing volume 2020

# Abstract

* automatically assess depression levels using audiovisual features as well as
  text-analysis of conversational speech transcriptions
* difficulty in data collection and the limited amounts of data available
* contributions in this paper
  * exploit databases from multiple languages for acoustic feature selection
    * significantly improved the depression assessment accuracy over baselines
  * extract text-based features for depression assessment and 
  * fusion: we use a novel algorithm to fuse the text~ & speech-based classif
    which further boosted the performance

# 1 Intro

* [9]: phase distortion deviation that is helpful for detecting depression
  * used for voice quality examinations
* [10]: distortions in formant trajectories were used to detect depression
* [11]: degradation in spectral variability was used
* [12]: gender-dependent feature extraction was found to improve
* [13]: i-vectors and MFCC features
  * commonly used for speaker verification were found to be
  * helpful for depression detection even when the utterances were only 10 s
* In AVEC 2019 [14], depression detection subchallenge,
  * mel-frequency cepstral coefficients (MFCC) features, and extended GeMAPS
    [15] features were extracted from audio. Those features
  * combined within a bag-of-word (BoW) front-end that uses vector quantization
    to quantize feature vectors into a limited set of centroids [16]
    * ie sequences of features vectors are converted into sequences of
      centroid-ids
    * well-known in the text processing field, and it has also gained
    * recent popularity in emotion detection [17]
* Deep learning based feature extraction methods for emotion detection [14]
  * convolutional neural network (CNN)-based image recognition systems are
    provided with speech spectrograms and resulting activation values [18]
* audio-visual methods for detecting depression
  * [19]: face analysis and speech prosody are used for depression
  * [20–23]
  * Retardations in motor control due to depression causes changes in
    coordination and timing of speech and face movements, which are used for
    audio-visual detection in [24]
* our two contributions
  * novel algorithms for multi-lingual feature selection where
  * three databases, Turkish, German, and English were used together to improve
    redundancy and relevance computations in the case of data sparsity
  * a novel feature fusion technique where
    transcription-based predictions were used to adjust the predictions of the
    acoustic-only model
    when the predictions of those two modalities were highly conflicting
    * Significant improvements are obtained for the Turkish, German, & English

# 2 Related work

## 2.1 Feature selection

* A large number of acoustic features can be derived from conversational speech
  * curse of dimensionality and the typically small amounts of training data
* feature selection where features that are
  most relevant for the classification task and
  least correlated among themselves are selected for classification. To that
  * Minimum Redundancy Maximum Relevance (MRMR) algorithm is common [25–27]
* [28]: a two-step feature selection algorithm was proposed
  * The conversation is segmented into topics and
  * features are extracted for each topic
  * steps
    * correlation-based feature subset selection was applied
      regardless of the topics [29]
    * the selected features for each topic were further refined by
      first ranking them based on relevance and
      selecting subsets using regression tests
  * [30]: a simple t test was used to select features
    from a set of 504 acoustic features
* knowledge-based set of features that are designed for emotion detection
  * popular is the Geneva feature set (GeMAPS) [31] which is developed by
    augmenting a minimum set of acoustic features that were
    * shown in the literature to be reliable indicators of emotional state and
    * have the highest theoretical significance

## 2.2 Fusion of text and audio features

* Transcriptions of the speech signal have also been used as another mode [3]
  * [32]: transcription-derived features were used in addition to the speech
    * sentiment analysis was performed on text and sentiment features were used
    * score fusion was used to combine acoustic and text-based system scores
    * Syntactic and semantic features were derived from transcriptions in [33]
      * M. R. Morales, R. Levitan,
        Speech vs text: a comparative analysis of features for depression
        Spoken Language Technology Workshop (SLT), 2016 IEEE pp. 136–143
* Conversations with patients can be designed in a way to be indicative
  * [34]: type of questions (positive and negative stimulus) during conversat
    impact voice quality parameters in psychologically distressed subjects
  * Speech segments with higher articulation effort were found to be
    more informative for depression detection in [6]
* [35]: biomarkers that are derived from facial coordination and timing
  * used together with vocal cues and
  * semantic features from dialogue content using a sparse-coded lexical embed
* [36]: depressed individuals use less social words and more anxiety-related ws
* [37]: interactions between subjects and the computer agent were modeled
  * Long-short term memory (LSTM) neural networks were used with audio and text
  * results suggested that minimal knowledge of the conversation is required
* [38]: information derived from the transcripts of the dialogs, both
  * conversation-level (number of sentences, number of words used, etc) and
  * content-level (feeling good/bad, extrovert/introvert personality, etc)
  * scores from both audio and text features were fused via a DNN model
* extract both audio and text features using deep networks as well as fusing
  those features using a deep network
  * deep spectrum features [14] for audio was fused with BERT-based text
    representation in [39] using fully connected layer

## 2.3 Cross-lingual depression detection

* use speech data from other languages to train models. This approach is not
  * also for understanding universal cues of depression across cultures/langs,
  * important given the typically small amounts of data available in the public
  * [40]: prediction models built with a German database were shown to
    produce prediction scores in English that were correlated with the
    self-assessment scores
  * [30]: combination of datasets in different languages was shown to yield
    high accuracy whereas
    if the train and test data are in different languages,
    performance was found to be lower
* [41]: model transfer from English to other languages with limited datasets
  * improve Aphasia detection, and promise for Alzheimer’s disease detection

## 4.2 Clustering approach

* Depression screening tests often have large number of classes
  * eg PHQ-8 has 24 classes and BDI-II has 64 classes
  * hE in diagnosis, level of depression (severe, moderate, etc) corresponds
    to a range of classes
  * we propose clustering samples that have similar scores
* Cluster centroids are found by first uniformly dividing the score scale
  * If the centroid class has no samples, then the nearest non-empty class is
    assigned as the centroid. After setting the centroids, each class is
* Fig. 1: distribution of samples per class becomes more uniform

# 8 Discussion

* The text features were tested for the Turkish dataset
  * outperform all acoustic feature sets for the classification task
  * ie the sentiment-based text features were found to be effective for binary
    classification of depression
  * when the text features were fused with the acoustic features using the
    proposed fusion algorithm, performance with the Turkish dataset
    significantly improved both for regression and classification tasks
  * Fusion of text and acoustic features outperformed both of the feature sets
* The clustering algorithm helped improve the performance of the Turkish
  * not as effective as the multi-lingual approach
