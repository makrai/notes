Speech Fatigue Detection Based on Deep Learning
Shuxi Chen, Yiyang Sun, Haifei Zhang, Qinqin Liu, Xingqin Lv and Xiangxiang Mei
ISAIC 2021 International Symposium on Automation, Information and Computing

# Abstract

* sport fatigue
  * Medically, moderate fatigue is the embodiment of workload, and 
  * excessive fatigue will cause adverse effects on the human body. Therefore,
  * real-time monitoring of human fatigue is of great significance. In order to
  * speech fatigue detection method based on deep learning is proposed in this
* we screen the useful speech segments
  of the fatigue corpus created in the previous work; Secondly, 
  * the speech signal is preprocessed and 
    the analog speech signal is digitized; Thirdly, 
  * deep learning can effectively reflect the phonetic features of fatigue
  * fatigue degree is classified and recognized by classifier. The best
  * BLSTM network recommended by the author 
  * fatigue classification accuracy reached 92.7%, higher than other studies

# 1 1. Introduction

* Sports fatigue detection plays an important role in sports training. It helps
  * subjective detection and objective detection [2]
* Subjective fatigue detection methods are mainly based on subjective
  * subjective questionnaire, Stanford sleep scale & sleep habit questionnair
  * objective detection methods mainly use instruments and equipment to
    * psychological, physiological and biochemical indexes of human body.
      * physiological signals, including surface electromyography, EEG, ECG
        and pulse [3]. Second, detecting the 
      * biochemical ind: changes of blood testosterone, hemoglobin and cortisol
      * kinematic and dynamic indexes of athletes are tested, such as the
        * eg balance ability when athletes are in a state of sports fatigue
* not operable in practical application
  * Subjective detection methods often change due to the subjective factors of
  * Objective methods can not achieve real-time detection, and it is invasive,
    which will make users resist.

* we: fatigue detection based on speech analysis using deep learning.
  * Greeley+ (2006) proposed a fatigue detection method based on speech
    recognition system, and proposed that Mel frequency cepstrum coefficient
    can be used to describe fatigue characteristics [4]. In 2008, Jarek
  * Krajewskil+ 2008 proposed an acoustic framework for human-computer
    interaction based on speech signals to detect fatigue, and explored the
    difference of homophonic noise ratio between people's concentration and
    sleepiness. Among them, the recognition rate of vowel /A:/ is 83.3% [5]. In
  * Shuxi Chen 2017: fatigue detection based on speech analysis, extracted the
    traditional feature parameters of speech signals, and classified speech
    * SVM and transfer learning algorithm, with an average recognit ~ 85% [6]

# 4. Speech Fatigue Detection based on Deep Learning

## 4.1 Corpus

* sports fatigue corpus: SUSP-SFD [11], which is recorded with two channels and
  the sampling frequency is 48 kHz.
  * Shuxi Chen, 2017. Research On Fatigue Detection Based On Speech Analysis.

# Conclu

* future work, we will still focus on improving the accuracy of fatigue
  * data mining of spectrogram and the 
  * fusion of main and auxiliary network features

