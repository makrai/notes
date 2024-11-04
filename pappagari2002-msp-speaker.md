x-vectors meet emotions: A study on
  dependencies between emotion and speaker recognition
Raghavendra Pappagari, Tianzi Wang, Jesus Villalba, Nanxin Chen, Najim Dehak
ICASSP 2020 Intl Conference on Acoustics, Speech, and Signal Proc arXiv:2002.05039

# Abstract

* we explore the dependencies between speaker recognition and emotion recog
  * knowledge learned for speaker recognition
    can be reused for emotion recognition through transfer learning
  * Then, we show the effect of emotion on speaker recognition. For
  * emotion recognition: a simple linear model is enough to obtain good perf
    on the features extracted from pre-trained models eg x-vector
  * Then, we improve emotion recognition performance
    by fine-tuning for emotion classification
* experiments on three different types of datasets:
  IEMOCAP, MSP-Podcast, and Crema-D
  * pre+fine vs no pre: 30.40%, 7.99%, and 8.61% absolute improvement
  * effect of emotion on speaker verification
    * speaker verif performance is prone to changes in test speaker emotions
    * angry utterances performed worst in all three datasets

# 4 RESULTS

* Table 2 presents results of SER task with ResNet architecture on all three
  datasets
  * ResNet-clean and ResNet-aug: unaugmented and augmented x-vector models
  * In the second row,
    Clean denotes emotion classification training is only on clean data, and
    Clean+aug denotes clean data is augmented with noisy data for the
    * Augmentation is done with additive noise and music using MUSAN corpus
* Fine-tuned ResNet-aug (MFCC) achieves an f-score of 58.46 on MSP-Podc Clean
