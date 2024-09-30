DEPAC: a Corpus for Depression and Anxiety Detection from Speech (proprietary)
Mashrura Tasnim, Malikeh Ehghaghi, Brian Diep, Jekaterina Novikova
Workshop on Computational Linguistics and Clinical Psychology 2022

# Abstract

* Mental distress like depression and anxiety
* required: information-rich and balanced corpora
* we introduce a novel mental distress analysis audio dataset DEPAC,
  * labelled based on established thresholds on depression and anxiety standard
    screening tools.  A large dataset
  * multiple speech tasks per individual, as well as relevant demographic info
  * we present a feature set: hand-curated acoustic and linguistic features,
  * from the conclus:
    * labelled with scores on standard scales:
      PHQ-9 scores for depression and GAD-7 scores for anxiety assessment
    * remarkably larger sample size in comparison to other publicly ava corpora
  * diversity of speech tasks and participants with various degrees of
    education, genders, and age groups
* exper our audio corpus and feature set in predicting depression severity by
  * comparing the performance of baseline machine learning models
    built on this dataset vs on other well-known depression corpora
  * competitive performance
    when compared to the AVEC 2016 and AVEC 2019 baseline models

# 1 Intro

* traditional schema for diagnosis is based on
  clustering of non-specific physical and behavioral symptoms
  * eg, in major depressive disorder (MDD), high disease heterogeneity and lack
    of agreed-upon assessment standards necessitate a high degree of clinical
    experience and training to make an accurate diagnosis
  * both clinician administered and self-rated clinical ass for MDD suboptimal
    * self-rated
      * Hamilton Depression Scale (HAM-D,Hamilton and Guy, 1976)
      * Montgomery Asberg Depression Scale (MADRS,Montgomery and Åsberg, 1979)
      * Beck Depression Inventory (BDI,Beck+ 1988)
      * Patient Health Questionnaire (PHQ-9,Löwe+ 2004) are
    * Each assess the illness through different symptom domains, have
      low construct validity, lack specific behavioral references, and are
      subjective (Berman+ 1985; Nemeroff, 2007; Wakefield, 2013). Moreover,
      participants are often reluctant to fill-out the self rated assessment in
* language can be an effective alternative to objectively characterize
  * emotion and cognition are both affected in MDD
  * depressed patients demonstrate
    * negative emotional bias in memory, attention, and event-interpretation
      (Mathews and MacLeod, 2005)
    * general impairment in attention, memory, and decision-making
      (Cohen+ 1982; Blanco+ 2013)
    * slowed rate of speech, volume, prosody, as well as
      increased use of first-person pronouns,
      negatively valenced speech content, and use of
      absolute words (Flint+ 1992; Fineberg+ 2016)
  * automated computational analysis of speech represents an excellent data
    * develop digital biomarkers for mental illness
    * takes only a few minutes of audio recording
* speech-based comp models for measuring depression prevalence and severity
  * Audio-Visual Emotion Recognition Challenge (AVEC) in 2013
  * A subset of the audiovisual depressive language corpus (AViD-Corpus) was
    introduced as challenge corpus for 2013 (Valicsstar+ 2013) and 2014
    (Valstar+ 2014) Depression Recognition Sub-Challenge (DSC) of the event
    * 150 recordings in German language,
      divided equally into training, development and test partitions
    * Predicting depression severity on BDI-II scale was the challenge
      specified task
  * Distress Analysis Interview Corpus (DAIC, Gratch+ 2014)
    * semi-structured clinical interviews in English language
      formulated to support diagnosis of psychological conditions such as
      anxiety, depression, and post-traumatic stress disorder
    * Different subsets of this dataset were used as the challenge corpus of
      AVEC 2016, 2017 and 2019 (Valstar+ 2016; Ringeval+ 2017, 2019) where
    * participants reported PHQ8 scores predicted by their regression models
* two vital limitations
  * small sample size increases the risk of overfitting in the models
    * eg the number of recordings in the AVEC challenges available for model
      training range from 50 to 189, which is far from sufficient.  Secondly,
  * lack in linguistic variety: only one or two samples per subject
* we introduce the DEPression and Anxiety Crowdsourced corpus (DEPAC) as a
  * rich in the diversity of speech tasks and subjects
  * capture the signs of anxiety and depression to make accurate prediction
  * We also present a set of acoustic and linguistic features extracted
    * incorporates domain knowledge of clinical and machine learning experts
  * we benchmark our dataset with several baseline machine learning models that
    use this set of features
