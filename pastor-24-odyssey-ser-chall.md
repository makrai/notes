The ViVoLab System for the Odyssey Emotion Recognition Challenge 2024 Evaluation
Miguel Ángel Pastor, Alfonso Ortega, Antonio Miguel, Dayana Ribas
Odyssey 2024

# Abstract

* we explore the efficacy of novel sequence modeling architectures, with a
  specific focus on Selective State Space Models (SSM), known as MAMBA
* our classification model integrates an SSM, in conjunction with a FeedForward
  layer and a Self-Attention mechanism
* data augmentation techniques, including additive and convolutional noise as
  well as SpecAugment to mitigate overfitting
* F1 Macro score of 29.42% in the MSP-Podcast test dataset, a performance level
  akin to that of the baseline system established in the challenge

# 1 Intro

* sequence modeling architectures and sophisticated methods for this task
  [10, 11, 12, 13]
  * [10] Wenjing Han, Huabin Ruan, Xiaomin Chen, Zh Wang, H Li, B Schuller
    Towards temporal modelling of categorical speech emotion recognition,”
    2018
    [11] Wei-Cheng Lin and Carlos Busso
    Chunk-level speech emotion recognition:
      A general framework of sequenceto-one dynamic temporal modeling,”
    IEEE Transactions on Affective Computing, vol. 14, no. 2, 2021
    [12] Miguel A. Pastor, Dayana Ribas, Alfonso Ortega, A Miguel, E Lleida,
    Cross-corpus training strategy for speech emotion recognition
      using self-supervised representations
    Applied Sciences, vol.  13, no.  16, 2023
    [13] Suprava Patnaik
    Speech emotion recognition by using complex mfcc and deep sequential model
    Multimedia Tools and Applications, vol. 82, no. 8, pp. 11897–11922, 2023
* MAMBA is promising for capturing and understanding the temporal dependencies
  inherent in emotional speech data. Through this investigation, we aim to
  address whether MAMBA can effectively learn representations of emotional
  content from speech data and if it can outperform traditional sequence
  modeling techniques such as the class-token transformer [15, 12] in terms of
  recognition accuracy and robustness. By shedding light on these questions, we
  hope to advance the state-of-the-art in speech emotion recognition and
  contribute to the development of more effective and reliable models for
  real-world applications

## 2.2. Classification

Two different models are tested for classification:

### 2.2.1. Sequential model: It combines the SSM model MAMBA with a FeedForward
Layer and a self-attention mechanism

* MAMBA equations are designed for single-channel signals,
  but for effective speech processing the system should also be able to process
  multidimensional representations. To achieve this, the
  ~> our framework replicates the SSM operation in parallel for multiple
  channels. Additionally,
* the architecture of the entire system is presented in Figure 1c where we can
  * the system is followed by a self-attention module which is described later

### 2.2.2. Class-Token Transformer (CT-Transformer): A Transformer architecture

* integrates the Class-Token concept to compress the data representation

# 4. Results and discussion

* the MAMBA model achieves performance metrics slightly superior to those
  attained by the Transformer architecture, while concurrently
  * reducing inference time by 10%. Additionally, an examination reveals that
  * the incorporation of a feedforward mechanism within the MAMBA architecture
    yields improved outcomes compared to its absence. Moreover,
  * integration of the second-order self-attention module results in a +1%
  * fine-tuning the feature extractor leads to a reduction in the F1-macro
    * may be indicative of overfitting within the system, notwithstanding
      [despite] the application of data augmentation techniques
