MSC-COVID-19: Computer Audition for Fighting the SARS-CoV-2 Corona Crisis
  Introducing the Multitask Speech Corpus for COVID-19
Kun Qian; Maximilian Schmitt; Huaiyuan Zheng; Tomoya Koike; Jing Han; Juan Liu;
  ;;; Zhao Ren; Shuo Liu; Zixing Zhang; Yoshiharu Yamamoto; Björn W. Schuller
Journals & Magazines >IEEE Internet of Things Journal >Volume: 8 Issue: 21

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
  * the best models can reach a UAR of 
|sleep quality  |fatigue  |anxiety|
|---------------|---------|-------|
|44.3 %         |44.4 %   |55.3 % |
  * Among these results, 
    one best result is achieved by a single model (anxiety) while 
    the other two best results are reached by a late fusion (majority vote)
    strategy of multiple models (sleep quality and fatigue). We
  * promising potential for future emotion-aware IoMT applications
    considering the current limited data size and difficult annotation
* sleep quality, the best single model is trained by large-scale acoustic
  features and an SVM classifier. Unlike the performance for the D Task,
  * transfer learning (TL) based models and S2SAE perform worse than chancel
  * e2e models and BoAW models are slightly higher or only reaching this level
  * confusion matrix of the best model [see Table V(a)],
    * “Good” is the easiest category to be recognized while
    * “Normal” is the most difficult one (easily to be classified as “Bad”)
* fatigue, all the models produce higher UARs than chance level (33.3 %)
  1. The classic ML model (by large-scale acoustic features and SVM) 41.0 %
  2. S2SAE 40.6 %
  * BoAW approach and the TL method are comparable (34.5 % versus 34.7 %) and
  * e2e model’s best result has only reached chance level
  * confusion: [see Table V(b)], “Severe” has the highest recall while “Mild”
    yields the lowest recall. However, both the two aforementioned categories
    have a large proportion of instances that are incorrectly recognized as
    “Moderate,” which is easy to be wrongly grouped into “Severe”
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
  complicated human-involving preprocessing step
  * hE in real clinical or daily life practice, it cannot be obtained in such
    an ideal condition. We should consider more advanced technologies to
    eliminate the noises, interference, and reverberations
* human hand-crafted features (with clear definitions and physical meanings)
  are worth exploring
* limited data size => the DL-based models may have been restrained in their

* For these three computational paralinguistics analysis tasks,
  the ComPARe feature set shows good robustness
  due to its design in the context of its original target usage

## B. Limitations and Perspectives

* the fundamental investigation of the relationship between the acoustic
  features and the pathological characteristics of COVID-19 is still lacking
  * we need to collect a larger size of COVID-19 patients’ speech data.
  * anthropometric parameters and the ethnics of the patients should be taken
  * collecting the voice data globally and discover the characteristics of
    COVID-19 patients’ voices internationally
* more advanced SP techniques should be introduced
  * Similar to our previous findings in snore sound studies [47], [48],
    wavelet transformation-based features can be superior in multiresolution
    analysis to the Fourier transformation-based features, which occupy the
    main part of the C OM PAR E feature set
  * exploring the learned features by DL models by introducing attention
    mechanisms [88]
* data scarcity is a challenging issue for almost all of the health-related AI
  * future: enrich the COVID-19 speech corpus with unsupervised learning [89],
    semisupervised learning [90], active learning [91]–[93], and
    cooperative learning [94]
  * generative adversarial networks (GANs) to generate more sample instances
    with a reasonable distribution [95], [96]
* explainable AI (XAI) system [97] for CA-based COVID-19 detection and managem
  <= close collaboration of experts from eg medicine and acoustics
