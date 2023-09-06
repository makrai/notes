LSSED: a large-scale dataset and benchmark for speech emotion recognition
Weiquan Fan, Xiangmin Xu, Xiaofen Xing, Weidong Chen, Dongyan Huang
arXiv:2102.01754 ICASSP 2021 IEEE IC on Acoustics, Speech & Signal Proc

https://github.com/tobefans/LSSED

# Abstract

* Speech emotion recognition contributs to human-computer interaction (HCI)
* we present LSSED, a challenging large-scale english speech emotion dataset,
  * data collected from 820 subjects to simulate real-world distribution
  * some pre-trained models based on LSSED
    * can also be transferred to related downstream tasks eg mental health anal
      where data is extremely difficult to collect
* our experiments show the
  * necessity of large-scale datasets and the
  * effectiveness of pre-trained models

# 1 Intro

* Although emotion itself is very abstract,
  it still has some obvious intonation characteristics
  * Intuitively, sad voices are generally low-pitched and slow while
    happy voices are usually the opposite.  Up to now, many algorithms have
* research carried out on SER
  * Schuller+ (2003) applies continuous Hidden Markov Models (HMM) to introduce
    SER with a self-collected speech corpus
  * standardized speech emotion databases
    * AIBO [2], EMODB [3], ENTERFACE [4], RML [5], IEMOCAP [6], AFEW [7],
      MELD [8]
    * IEMOCAP [6] and MELD [8] are the databases with the most data
      * IEMOCAP [6] collects 7,433 sentences (13 hours and 40 minutes in total)
        spoken by 10 people
      * MELD [8] contains 13,708 sentences (about 12 hours) from 407 people
  * In [9], decision tree is utilized to
    mitigate error propagation on AIBO [2] and IEMOCAP [6]
  * In [10], RBM is applied to learn discriminatory features on EMODB [3] and
    ENTERFACE [4]
  * deep learning
    * Zhang+ [11] utilizes DCNN to bridge the affective gap in speech signals
      on EMODB [3], RML [5], ENTERFACE [4]. At the same time,
    * Satt+ [12] presents a system based on an end-to-end LSTM-CNN with raw
      spectrograms on IEMOCAP [6]
    * Yeh+ [13] proposes a dialogical emotion decoding algorithm to
      consecutively decode the emotion states of each utterance on IEMOCAP [6]
      and MELD [8]
* serious overfitting to databases [14– 17]
* Generally speaking, transfer learning can to a certain extent improve
  * Boigne+ [18] points out task-related transfer learning of recognizing
    emotions on small datasets
  * For emotion recognition related task, a good pre-trained model is urgent
    since data collection is very difficult
  * eg depression detection: there are only about a hundred subjects at most
  * In our opinion, the pre-trained model from the SER task is more suitable
    for detecting depression, since
    it is more inclined to obtain acoustic features while the model from ASR
    task is prone to extract linguistic features
* we present LSSED, a challenging large-scale english dataset for SER. It
  * 147,025 sentences (206 hours and 25 minutes in total) spoken by 820 people
  * release some pre-trained models with speech emotion recognition task
    * since there is currently no non-semantic large-scale pre-training model,

# 2. LSSED

## 2.4. Pre-trained Models

* We firstly select VGG [20] and ResNet [21] for pre-training, which are useful
  * VGG builds a unified and simple structure to deepen the network, while
    ResNet proposes residual learning to ease the training procedure
* In order to better adapt to the specificity of speech, we propose PyResNet,
  an improved model of ResNet
  * PyResNet is based on ResNet50, ResNet101 or ResNet152
    * Due to the sufficient amount of data
  * the second convolution layer in each layer of ResNet is replaced with a
    pyramid convolution [22] that can capture multi-scale information to solve
    the problem of uncertain time position of valid speech information. In
  * we replaced the GAP layer with average pooling layer only in the time dim,
    to make the model insensitive to time and preserve the frequency info

# 3. DATASET EXPERIMENTS

## 3.2. Speech Emotion Recognition Benchmark

* We investigate
  * some recent SER papers [23–25] with open source code from papers
    * configuration from the original papers
  * a series of contrast experiments based on commonly used backbone models,
    including VGG and ResNet
  * our PyResNet model mentioned in Section 2.4
  * configuration of Our PyResNet and the backbone models
    * 60 epochs with batch size of 256 through the SGD optimizer with a
    * weight decay of 0.001
    * learning rate (initialized to 0.01) drops to 10% of the original every 20
      epochs
  * four emotion categories, including angry, neutral, happy and sad
    * Consistent with the current mainstream SER experiments
* The results are shown in table 5
  * the performance of existing algorithms on large-scale LSSED is not satisfac
  * the accuracy (weighted and unweighted) of these algorithms is even lower
    than that of the basic VGG and ResNet models
  * our PyResNet achieves better results than the basic backbone models. This
  * LSSED still has great challenges which means that
    speech emotion recognition is still a long way from being widely applicable
* Confusion matrices of
  both MTS-3 branches and PyResNet that use ResNet152 as the backbone is shown
  * Although they all use multi-scale convolution kernels
    * MTS-3 uses multi-scale kernels derived from one kernel
    * PyResNet directly uses
      multiple different kernels with more powerful modeling capabilities. Fig 2
  * neutral samples have a high probability of being correctly predicted, which
    is also the most common emotion
  * hE both models have a prediction bias problem for the neutral class
    * We speculate that this is because each individual has different neutral
      standards
  * future work: take into account the resting (neutral) state of each indiv
  * our PyResNet has a significant improvement in the angry, happy, and sad
    categories which are less predictable

## 3.3. Pre-trained Model in Downstream Task

* explore the applicability of the above pre-trained models to downstream
  * We choose speech-based depression detection as our downstream task
  * high professional requirements =>
    it is very difficult to collect data on patients with depression
  * currently unsatisfactory, automatic depression detection is
  * idea: use a pre-trained model with sufficient prior knowledge
* our experiments are carried out on
  the DAIC-WOZ depression database, which is
  * a subset of the Distress Analysis Interview Corpus (DAIC) [26]. There are
  * 107/35/47 subjects in the training/development/test set the test set
  * Each subject will be interviewed by an animated virtual interviewer and
    recorded with video and audio equipments
  * annotated with the start time, end time and depression (or not) of each
    sentence
* We choose SER task and ASR task for transfer
  * pre-trained models
    * For SER, we use the pretrained PyResNet with ResNet152 as a backbone. For
    * ASR, we use ESPNet [27], which is an end-to-end encoder-decoder structure
  * The results of the experiment are shown in Table 6
    * transfer based on SER is better than that based on ASR
      * because the features extracted by ASR are bias towards semantics while
        the features extracted by SER are bias towards acoustics
* differences in band-width between SER and ASR when framing
  * ASR/SER generally uses a narrow/wide window length of about 25ms/65ms
  * more attention to changes in time/freq and has a higher time/freq res
  * In general, a high time/freq resolution is conducive to extracting
    semantic/acoustics features from frame by frame
  => for downstream tasks such as depression detection, the SER pre-trained
    model with high frequency resolution and smaller gap may be a better choice
