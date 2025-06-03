Speech Fatigue Detection Based on Deep Learning
Shuxi Chen, Yiyang Sun, Haifei Zhang, Qinqin Liu, Xingqin Lv and Xiangxiang Mei
ISAIC 2021 International Symposium on Automation, Information and Computing

# Abstract

* sport fatigue
  * Medically, moderate fatigue is the embodiment of workload, and
  * excessive fatigue will cause adverse effects on the human body
  * real-time monitoring of human fatigue is of great significance
  * we: speech fatigue detection method based on deep learning is proposed
* we screen the useful speech segments
  of the fatigue corpus created in the previous work
  * the speech signal is preprocessed and
    the analog speech signal is digitized
  * deep learning can effectively reflect the phonetic features of fatigue
  * fatigue degree is classified and recognized by classifier
  * BLSTM network recommended by the author
  * fatigue classification accuracy reached 92.7%, higher than other studies

# 1. Introduction

* Sports fatigue detection plays an important role in sports training
  * subjective and objective detection [2]
* Subjective fatigue detection methods
  * subjective questionnaire, Stanford sleep scale & sleep habit questionnaire
  * objective detection methods mainly use instruments and equipment
    * psychological, physiological and biochemical indexes of human body
      * physiological signals eg surface electromyography, EEG, ECG and pulse
        [3]
      * biochemical ind: changes of blood testosterone, hemoglobin and cortisol
      * kinematic and dynamic indexes of athletes are tested
        * eg balance ability when athletes are in a state of sports fatigue
* not operable in practical application
  * Subjective detection methods often change due to the subjective factors
  * Objective methods can not achieve real-time detection, and
    it is invasive, which will make users resist
* we: fatigue detection based on speech analysis using deep learning
* related work
  * Greeley+ (2006) proposed a fatigue detection method based on speech recog,
    * Mel frequency cepstrum coefficient can be used to describe fatigue [4]
  * Krajewskil+ (2008): an acoustic framework for human-computer interaction
    based on speech signals to detect fatigue, and explored the difference of
    homophonic noise ratio between people's concentration and sleepiness. Among
    * the recognition rate of vowel /A:/ is 83.3% [5]
  * Shuxi Chen (2017): fatigue detection based on speech analysis
    * traditional feature parameters of speech signals
    * SVM and transfer learning algorithm, with an average recognit ~ 85% [6]

# 4. Speech Fatigue Detection based on Deep Learning

## 4.1 Corpus

* sports fatigue corpus: SUSP-SFD [11], which is recorded with two channels and
  * sampling frequency is 48 kHz
  * Shuxi Chen, 2017. Research On Fatigue Detection Based On Speech Analysis

# Conclusion

* future work
  * data mining of spectrogram and the
  * fusion of main and auxiliary network features
