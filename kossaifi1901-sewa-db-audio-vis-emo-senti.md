SEWA DB:
  A Rich Database for Audio-Visual Emotion and Sentiment Research in the Wild
Jean Kossaifi, Robert Walecki, Y Panagakis, Jie Shen, M Schmitt, F Ringeval,
  J Han, V Pandit, A Toisoul, B Schuller, K Star, E Hajiyev, M Pantic
arXiv:1901.02839 [cs.HC]

* The SEWA database is available online at http://db.sewaproject.eu/

# Abstract

* human-computer interaction and audio-visual human behaviour sensing systems,
  which would achieve robust performance in-the-wild are more needed than ever
* hE databases usually consider
  controlled settings, low demographic variability, and a single task
* we introduce the SEWA database of more than 2000 minutes of audio-visual data
  * 398 people coming from six cultures, 50% female, and
  * uniformly spanning the age range of 18 to 65 years old
* two different contexts
  * watching adverts and while
  * discussing adverts in a video chat
* rich annotations of the recordings in terms of facial landmarks,
  facial action units (FAU), various vocalisations, mirroring, and
  continuously valued valence, arousal, liking, agreement, and
  prototypic examples of (dis)liking
* we provide extensive baseline experiments for automatic FAU detection and
  automatic valence, arousal and (dis)liking intensity estimation

# 1 Intro

* Available audio-visual databases are typically
  * culture specific, eg the
    * VAM faces database [6] consists of 20 German speakers, the
    * SEMAINE database consist of UK subjects [7], the
    * RECOLA database consists of French speaking participants, the
    * CONFER dataset contains only Greeks [8]
    * no database that would enable a large scale study on the effect of culture
      on expression recognition and communication of emotions and sentiment
  * only annotated in terms of certain behaviour and affect dimensions, for
    * SEMAINE database contains continuous annotations of valence and arousal,
    * CONFER2 dataset is annotated only in terms of conflict intensity etc
    * no database annotated in terms of multiple behavioural cues:
      facial action units (FAUs), affect dimensions and social signals
* we introduce the SEWA database (SEWA DB), in Section 3, which is an
  audio-visual, multilingual dataset of richly annotated facial, vocal, and
  verbal behaviour recordings made in-the wild. The SEWA DB extends and
  contrasts considerably the available audio-visual datasets for affect
  research by providing the following key features:
  * audio-visual recordings of spontaneous behaviour of volunteers, captured in
    completely unconstrained, real-world, environments using standard
    web-cameras and microphones
  * episodes of unconstrained interactions of subjects of different age,
    gender, and cultural backgrounds. In particular, 6 groups of volunteers
    with around 66 subjects per group (50% females, uniformly divided over 5
    age groups, 20+, 30+, 40+, 50+, 60+) from six different cultural
    backgrounds, namely British, German, Hungarian, Greek, Serbian, and Chinese
    were recoded.  This makes the SEWA DB the first publicly available
    benchmark dataset for affect analysis in the wild across age and cultures
  * richly annotated in terms of FAUs, facial landmarks, vocal and verbal cues
    as well as continuously valued emotion dimensions such as valence,
    arousal, liking and social signals including agreement and mimicry. This
    * allow for the first time to (study)
      * different aspects of human affect simultaneously
      * how observed behaviours are influenced in dyadic interactions, and
      * exploit behaviour dynamics in affect modelling and analysis
      * exploit inter-dependencies between age, gender, word and language
        usage, affect and behaviour, hence enabling robust and
        context-sensitive interpretation of speech and non-verbal behaviour
* we provide exhaustive baseline experimental results FAUs detection and
  valence, arousal and liking/disliking estimation are provided in Section 4


# 2 SOTA in audio-visual emotion databases

* The standard approach in automatic emotion recognition relies on
  machine learning models trained on a collection of recordings,
  annotated in terms of different categories or dimensions of affect
* generalisation ability to different conditions, strongly depends on:

## 2.1 elicitation methods

### 2.1.1 posed behaviour – emo portrayed by a person upon request [9], [10]

### 2.1.2 induced behaviour

* a controlled setting to elicit a reaction to a given affective stimulus,
  * eg watching audio-visual clips or interacting with a manipulated system
* [11], [12]

### 2.1.3 spontaneous behaviour

* natural interactions between individuals, or between a human and a machine eg
  * chatting with a sensitive artificial listener [7]
  * resolving a task in collaboration [13]

## 2.2 models of emotion representation

* subjective and complex
  * whether a certain expression stems from eg sadness versus boredom
* several continuous-valued, multidimensional models have been proposed
  * VA: most popular model employed in affective computing research
    * two dimensional model describing the degree of activation (arousal) and
      pleasantness (valence) of displayed affect expressions in 2 dimensions
    * hE dynamically varying time-delay between an expression and the annot
      * due to reaction lag of the annotators
      * varies among annotators, over the sessions, & even during 1 session [31]
* methods have been proposed for spatio-temporal alignment of annotations [31],
  [32] to remedy this problem and come up with reliable ground truth

## 2.3 annotation tools

* ANVIL [33], ATLAS [34], Ikannotate [35], EmoWheel (Geneva emotion wheel)
  [36], FEELtrace [37], Gtrace 1 , ANNEMO [38], and
  the frame by frame Valence/Arousal Online Annotation Tool [39]
  * ANVIL: The Video Annotation Research Tool
    http://www.anvil-software.de
    ANVIL is a free video annotation tool, developed by Michael Kipp. It offers
    * multi-layered annotation based on a user-defined coding scheme
  * Atlas Annotation documentation
    https://atlas-annotation.readthedocs.io
    This package proposes a number of methods for deforming the Nissl volume
    and the CCFv2 annotations in order to re-align them to CCFv3. Contents
  * github ilyabo/annemo: A simplistic web app for annotating ..
    A simplistic web app for annotating emotions in human speech video
  * Valence/Arousal Online Annotation Tool iBUG group
    https://ibug.doc.ic.ac.uk › resources › valencearousal-..
    This tool, written in Python as a Flask application backed with a MongoDB,
    * allows any number people to annotate video clips per-frame, for valence
      and arousal
  * ikannotate: top hits lead to the paper
  * EmoWheel: top hits are not computational
  * FEELtrace: The participants in a test or experiment use a computer to
    continuously report the emotion they perceive. They can move a cursor in a
* creating the unified gold standard from a set of annotations,
  * gold standard != ‘ground-truth’, which is avoided for affective computing
  * no truth on a subjective feeling such as emotion
  * The basic principle is to use consensus among the evaluators
    to come up with a common, best representative annotation
    * metrics such as the correlation coefficients
      dynamical time warping (DTW) distance [32], [40],
      average of the data, post standardization or normalization, or
      assigning individual annotations certain weight percentages
      (eg evaluator weighted estimator (EWE))

## 2.4, existing corpora

* We focus here on databases containing dyadic interaction recordings
  annotated in terms of displayed affective reactions
  * For an overview of databases containing recordings of non-interactive
    * recent survey papers (eg [19], [41]) and recent database papers (eg [39])
* mostly controlled settings, constrained dyadic task, low demographic
  variability, and one language –that has mostly been English so far
  * Predominance of one language in the corpora limits usability of the
    database for cross-lingual, cross-cultural study of emotion recognition
* Table 1 presents a summarized overview of the surveyed databases containing
  dyadic interactions

## 4.3 Experimental results

* Here we present the experimental results for action unit detection and
  valence, arousal and liking/disliking estimation

### 4.3.1 Action unit detection

* We used the SVM and the Random Forest for AU detection using
* geometric and appearance features and feature fusion as described in sec 4.1
* F1-score for per-frame detection are shown in Table 8/9 on the test/dev set,
  * good, but clearly not good enough for AU detection in a fully automatic
* AU 12 has the highest F1-score (0.618) with feature fusion and SVM classifier
  * ie it is important to use both types of features, texture and appearance,
  * the average results achieved by landmarks are higher than those by texture
    * confirms the representative power of geometric features
    * in line with previous research
* comparison to the baseline results with those in the FERA2015 [62] database,
  our results obtained here are lower on the overlapping AUs (10 and 17). This
  * mainly because the SEWA dataset contains facial expressions recorded in
    different contexts and in the wild, while the FERA2015 recordings are made
    in an controlled environment or laboratory with controlled noise level,
    illumination and calibrated cameras

### 4.3.2 Estimation of valence, arousal and liking/disliking

* The setting of our baseline experiment allows us to
  * investigate the effect of audio, video and the fusion of both on the
  * separate the effect of culture on the results
  * infer the human-level-performance of recognizing the levels of valence and
    arousal displayed by a subject given each type of information
    * . As annotations were performed separately but by the same annotators on
      the audio, video and audio-video feeds respectively
  * Results are reported in term of CORR/CORR in Table 12/11
    In all cases, we report results when training with annotations and features
    obtained using either exclusively audio, video or audio-video
* for valence, we obtained better results on annotation obtained using
  exclusively video
  * slightly lower when using labels obtained by annotating audio-video, while
  * the worst results were obtained on the labels collected from audio only
  * in line with the recent finding by psychologists that valence is much
    better estimated from video imagery than from audio only, while
    * arousal is much better predicted from audio than from video [86], [87]
      As expected, using a fusion of audiovideo features increases the results,
      while audio features are the least helpful, supporting the theory that
      the face and its deformation is the main medium of communication between
      humans when it comes to emotions
* models
  * performances of different regression models vary from each other
  * overall, SVM performs better than RF which in turn outperforms LSTM
    hE, in the experiments on audio features, while
    * Support Vector Machine for Regression (SVR) and Random Forest (RF) are
      expected to perform well for arousal and valence prediction,
      LSTM-RNNs noticeably outperform them for liking/disliking prediction. For
      * eg while the average CCC of liking prediction based on audio features
        and A+V annotations is 0.194 and 0.087 by SVR and RF, respectively, a
        CCC of 0.254 is achieved with LSTM
* audio/video -> valence/arousal/liking
  * audio features: in most cases, arousal is better predicted than valence,
    * conforms repeated findings in the literature [66], [67], [68]
  * video features: valence seems to be more accurately predicted than arousal
    * would confirm that acoustic features are more informative for arousal while
      valence can result in more subtle facial expressions
      requiring geometric and appearance features to be predicted accurately
    * hE, for liking or disliking, there is no such noticeable tendency
      * In most cases, as can be seen from the table, the performance for liking
        or disliking is lower than for arousal and valence
      * could be mainly because the prediction of liking and disliking is more
        content-related and could not obtain sufficient useful information via
        acoustic cues only, lacking linguistic cues
  * in most cases the best performance in terms of CCC was obtained by
    audio-based annotations for arousal and by video-based ones for valence,
    * no obvious performance improvement was seen with the A+V annot
    * hE, for liking or disliking, in many cases the best results of prediction
      of liking were achieved with the audio/video-based annotations were
      * a quite complex problem which is difficult to address with limited
        data. It could be improved when more data with information of multiple
        modalities is given
* predicting the culture
  * Using video features, culture 5 (Hungarian) is best predicted (with a CCC
    of 0.495) for valence using SVR
  * this same culture is also best predicted for valence using audio features
    (CCC 0.398), again with SVR based on audio features but video-based
    annotation
  * For arousal and using audio features only, regarding the six different
    cultures, the performance in term of CCC (0.694) is obtained for culture 3
    (German) with SVR on audio/video-based annotations. In contrast, using a
  * fusion of audio and video features: best results are obtained for arousal
    on culture 2 with a CCC of 0.501
* SVR, predictions of valence with video-based annotations outperforms that
  with audio-based annotations for all cultures except for culture 3 (German)
  * predictions of arousal with audio-based labels
    outperforms that with video-based labels for all cultures
    except for culture 5 (Hungarian) and 6 (Serbian)
  * contrast could be mainly due to the close connection between the two
    dimensions in spontaneous conversation. Therefore, it might
    be good to predict them together, ie conducting multi-task learning to take
    advantage of the interconnections between the two different aspects
* ReseNet-18 (Table 10) outperforms the other baseline models, as expected,
  particularly when trained by optimizing the CCC directly. This is
  * especially true in the case of arousal, which is captured more accurately
    by deeply learned representations than by hand-crafted features
  * Valence on the other hand, as expected (eg [39]), can be predicted
    accurately from geometric features, encoded by facial landmarks or SIFT
    features. However, this method is much more costly to run
