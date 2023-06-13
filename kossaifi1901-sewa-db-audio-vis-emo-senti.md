SEWA DB:
  A Rich Database for Audio-Visual Emotion and Sentiment Research in the Wild
Jean Kossaifi, Robert Walecki, Y Panagakis, Jie Shen, M Schmitt, F Ringeval,
  J Han, V Pandit, A Toisoul, B Schuller, K Star, E Hajiyev, M Pantic
arXiv:1901.02839 [cs.HC]

# Abstract

* human-computer interaction and audio-visual human behaviour sensing systems,
  which would achieve robust performance in-the-wild are more needed than ever
* he databases usually consider
  controlled settings, low demographic variability, and a single task
* we introduce the SEWA database of more than 2000 minutes of audio-visual data
  * 398 people coming from six cultures, 50% female, and
  * uniformly spanning the age range of 18 to 65 years old
* two different contexts
  * watching adverts and while
  * discussing adverts in a video chat
* rich annotations of the recordings in terms of facial landmarks, facial
  action units (FAU), various vocalisations, mirroring, and continuously valued
  valence, arousal, liking, agreement, and prototypic examples of (dis)liking
* we provide extensive baseline experiments for automatic FAU detection and
  automatic valence, arousal and (dis)liking intensity estimation

# 2 State-of-the-art in audio-visual emotion databases

* The standard approach in automatic emotion recognition relies on
  machine learning models trained on a collection of recordings,
  annotated in terms of different categories or dimensions of affect. As a
* generalisation ability on new data acquired in different conditions, strongly
  depends on:

## 2.1 elicitation methods

### 2.1.1 posed behaviour – emotion is portrayed by a person upon request,

* eg [9], [10],

### 2.1.2 induced behaviour

* a controlled setting is designed to elicit a reaction to a given affective
  stimulus, eg watching audio-visual clips or interacting with a manipulated
  system
* [11], [12], and

### 2.1.3 spontaneous behaviour

* natural interactions between individuals, or between a human and a machine eg
  * chatting with a sensitive artificial listener [7]
  * resolving a task in collaboration [13]

## 2.2 models of emotion representation

* subjective and complex
  * whether a certain expression stems from eg sadness versus boredom
* several continuous-valued, multidimensional models have been proposed for
  * VA: most popular model employed by the affective computing research community
    is the two dimensional model describing the degree of activation (arousal)
    and pleasantness (valence) of displayed affect expressions as a point in
    * problem with this approach is the dynamically varying time-delay between
      an expression and the annotation due to reaction lag of the annotators,
      which also varies among different annotators, over the sessions, and even
      during every session [31]. Yet
* methods have been proposed for spatio-temporal alignment of annotations [31],
  [32] to remedy this problem and come up with reliable ground truth to be used

## 2.3 annotation tools

* ANVIL [33], ATLAS [34], Ikannotate [35], EmoWheel (Geneva emotion wheel)
  [36], FEELtrace [37], Gtrace 1 , ANNEMO [38], and the frame by frame
  Valence/Arousal Online Annotation Tool [39]
* creating the unified gold standard from a set of annotations,
  * gold standard != ‘ground-truth’, which is avoided for affective computing
  * no truth on a subjective feeling such as emotion
  * The basic principle is to use consensus among the evaluators to come up
    with a common, best representative annotation by using different
    * metrics such as the correlation coefficients, dynamical time warping
      (DTW) distance [32], [40], average of the data post standardization or
      normalization, or assigning individual annotations certain weight
      percentages (eg evaluator weighted estimator (EWE))

## 2.4, existing corpora

* We focus here on databases containing dyadic interaction recordings annotated
  in terms of displayed affective reactions
  * For an overview of databases containing recordings of non-interactive
    * recent survey papers (eg [19], [41]) and recent database papers (eg [39])
* most made in controlled settings, concern a constrained dyadic task, have low
  demographic variability, and are made in primarily one language –that has
  mostly been English so far
  * Predominance of one language in the corpora limits usability of the
    database for cross-lingual, cross-cultural study of emotion recognition
* Table 1 presents a summarized overview of the surveyed databases containing
  dyadic interactions
