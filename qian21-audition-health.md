Journals & Magazines >IEEE Internet of Things Journal >Volume: 8 Issue: 21
MSC-COVID-19: Computer Audition for Fighting the SARS-CoV-2 Corona Crisis
  Introducing the Multitask Speech Corpus for COVID-19
Kun Qian; Maximilian Schmitt; Huaiyuan Zheng; Tomoya Koike; Jing Han; Juan Liu;
  ;;; Zhao Ren; Shuo Liu; Zixing Zhang; Yoshiharu Yamamoto; Björn W. Schuller

# Abstract

* we have witnessed the power of 5G, Internet of Things, big data, computer
  vision, and artificial intelligence in applications of epidemiology modeling,
  drug and/or vaccine finding and designing, fast CT screening, and quarantine
  management. On the other hand, relevant studies in exploring the capacity of
* we propose a novel multitask speech corpus for COVID-19 research usage. We
  * 51 confirmed COVID-19 patients’ in-the-wild speech data in Wuhan city,
  * three-category classification: sleep quality, fatigue, and anxiety
* baseline: both classic machine learning methods and SOTA deep learning

# I.  Introduction

# II.  Background and Motivation

# III.  Materials and Methods

# IV.  Experimental Results

## B. Results

* general
  * The experimental results (UARs) are shown in Table IV and the
  * confusion matrices of the best models are illustrated in Table V. In summary,
  * the best models can reach a UAR of 44.3 %, 44.4 % and 55.3 % for the sleep quality,
    fatigue, and anxiety, respectively. Among these results, one best result is
    achieved by a single model (anxiety) while the other two best results are
    reached by a late fusion (majority vote) strategy of multiple models (sleep quality
    and fatigue). We need to note that the current results have shown promising
    potential for future emotion-aware IoMT applications by considering the
    current limited data size and difficult annotation.  1

* sleep quality, the best single model is trained by large-scale acoustic
  features and an SVM classifier. Unlike the performance for the D Task,
  * transfer learning (TL) based models perform worse than chancel level). The
    S2SAE models are also owning UARs lower than 33.3 %, while
    e2e models and BoAW models are slightly higher or only reaching this level
  * confusion matrix of the best model [see Table V(a)], “Good” is the easiest
    category to be recognized while “Normal” is the most difficult one (easily
    to be incorrectly classified as “Bad”)

* fatigue, all the models produce higher UARs than chance level (33.3 %)
  1. The classic ML model (by large-scale acoustic features and SVM) 41.0 %
  2.  S2SAE 40.6 %
  * BoAW approach and the TL method are comparable (34.5 % versus 34.7 %) and
  * e2e model’s best result has only reached chance level. For the best model
  * confusion: [see Table V(b)], “Severe” has the highest recall while “Mild”
    yields the lowest recall. However, both the two aforementioned categories
    have a large proportion of instances that are incorrectly recognized as
    “Moderate,” which is easy to be wrongly grouped into “Severe.”

* anxiety
  * the model trained by large-scale acoustic features and SVM classifier
    reaches the highest UAR (55.3 %)
  * e2e model reaches a second best single model position when having a UAR of
    43.3 % by only using the deep RNN architecture (with GRU cells). Then, the
  * BoAW-based model is the third best single model showing a UAR of 41.1 %
  * S2SAE and TL-based models yield only chance level.  When looking at the
  * confusion matrix of the best model [see Table V(c)], we may find that
    “Mild” and “Severe” both have a proportion of instances to be wrongly
    predicted as “Moderate.”

* The late fusion of models cannot generate significantly higher results than
  * Only for sleep quality and fatigue, the fused models has a slight improv

# V.  Discussion

## A. First Findings

* The MSC-COVID-19 database has a comparably high quality based on a
  complicated human involved preprocessing step
  * hE in real clinical or daily life practice, it cannot be obtained in such
    an ideal condition. We should consider more advanced technologies to
    eliminate the noises, interference, and reverberations
* human hand-crafted features (with clear definitions and physical meanings)
  are worth exploring
* limited data size => the DL-based models may have been restrained in their

Management and daily monitoring of the patients’ physical and mental status is
a crucial task. We are encouraged by the current results (even though not
perfect, yet) for using voices to estimate sleep quality, fatigue, and anxiety
degrees. In particular, we have seen that even when only using the deep RNN
(with GRU cells) architecture and the audio waveform as the input, one can
reach a UAR of 43.3 % (as the second best single model) for the anxiety. For
the sleep quality and fatigue, a late fusion has resulted in a slight
improvement, which is worth further studying. For these three computational
paralinguistics analysis tasks, the C OM PAR E feature set shows good
robustness due to its design in the context of its original target usage

## B. Limitations and Perspectives

* the fundamental investigation of the relationship between the acoustic
  features and the pathological characteristics of COVID-19 is still lacking
  Before giving any solid conclusion, we need to collect a larger size of
  COVID-19 patients’ speech data. Additionally, the anthropometric parameters
  and the ethnics of the patients should be taken into account. We believe that
  as a global crisis, COVID-19 cannot be beaten by only one single country or
  one single field of science. In the future, we aim to consider collecting the
  voice data globally and discover the characteristics of COVID-19 patients’
  voices internationally

* more advanced SP techniques should be introduced
  * Similar to our previous findings in snore sound studies [47], [48],
    wavelet transformation-based features can be superior in multiresolution
    analysis to the Fourier transformation-based features, which occupy the
    main part of the C OM PAR E feature set. Besides, one should consider
    exploring the learned features by DL models by introducing attention
    mechanisms [88]

* data scarcity is a challenging issue for almost all of the health-related AI
  * future: enrich the COVID-19 speech corpus with unsupervised learning [89],
    semisupervised learning [90], active learning [91]–[93], and
    cooperative learning [94], to . We should also consider introducing
  * generative adversarial networks (GANs) to generate more sample instances
    with a reasonable distribution [95], [96]

* explainable AI (XAI) system [97] for CA-based COVID-19 detection and managem
  <= close collaboration of experts from eg medicine and acoustics
