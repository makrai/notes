Depression Speech Recognition With a Three-Dimensional Convolutional Network
Hongbo Wang, Yu Liu, Xiaoxiao Zhen and Xuyan Tu
Front. Hum. Neurosci., 2021 Sec. Cognitive Neuroscience Volume 15

# Abstract

* goal: objective evaluation of depression based on intelligent technology
  * early diagnosis and treatment of patients
  * abnormal speech features of patients with depression
  * limited performance of traditional feature extraction methods for speech
  * from the conclu: problem of small fluctuation of emotion in daily speech
* we suggest 3D-CBHGA
  * Three-Dimensional Convolutional filter bank with Highway Networks and
    Bidirectional GRU (Gated Recurrent Unit) with an Attention mechanism
  * two key strategies
    * The three-dimensional feature extraction of the speech signal is time-eff
    * Based on the attention mechanism in the GRU network,
      the frame-level vector is weighted to get the hidden emotion vector by
      self-learning
* experiments show that it can improve the ability of depression detection and
  * the model could improve the accuracy of depression detection
    by removing the blank fragment in speech
  * future:
    * depression is often confused with other mental disorders such as bipolar
    * extracting other features of speech signals to better characterize them
    * learning among different languages to improve the reuse rate of the model

## 3.3. Attention Mechanism

* human brain: different types of information have different concerns
* attention mechanism (Mnih+ 2014) and
  * Mnih, V., Heess, N., Graves, A., and Kavukcuoglu, K. (2014)
    Recurrent models of visual attention
    International Conference on Neural Information Processing Systems (NIPS 2014)
  * applied it to image recognition
  * Bahdanau+ (2014) introduced the attention mechanism into machine translation
  * widely applied in various fields and become a research focus of neural netws
  * speech recognition is similar to machine translation (Chorowski+ 2015)
    * converting a given sequence into another sequence
* in speech emotion recognition
  * more attention should be paid to the frames with full emotion
  * increase the proportion of valid frames and
    reduce the interference of invalid frames
  * Huang and Narayanan (2017): a Deep Convolutional Recurrent Neu Net (DCRNN)
    for speech emotion recognition
    * convolutional attention mechanism to learn the discourse structures
  * Mirsamadi+ (2017) added a local attention mechanism on the basis of an RNN
* attention mechanism also in the depression detection scenario
  * Lu+ (2021) proposed an emotion-based attention network that can
    capture high-level emotional semantic information and effectively improve
    * A dynamic fusion strategy is proposed
      to integrate positive and negative emotional information
  * Zhang+ (2020) combined demographic factors in EEG modeling and depression
    detection, integrating gender and age factors into a 1D CNN through
    attention mechanisms to explore the complex correlation
  * different bands of the voice spectrum contribute unevenly to depres detect
    * Niu+ (2021) proposed a time-frequency attention (TFA) component that
      highlights those distinct timestamps, bands, and channels that make the
      prediction of individual depression more effective than before

## 4.2. Experimental Results and Analysis

* Two groups of comparative experiments were conducted
  on DAIC-ori and DAIC-mute-removed, respectively, and
  * four algorithms including 1D-CBBG, 3D-CBHGA, SVM, and Random Forest
  * 10 independent replicates, and the results were averaged
* our focus:
  * performance comparison between different algorithms
  * the influence of different data sets on the performance of the algorithm
* Table 3 shows the performance of four different models in the original uncut
  * accuracy of traditional classification algorithm SVM and RF is 62.86 and
    68.57%, respectively, the accuracy of the 1D-CBBG model is 71.43%, and the
    accuracy of the 3D-CBHGA model is the highest (74.29%)
* Table 4 shows the performance of four models in the DAIC-mute-removed data
  * 3D-CBHGA has the best performance in the four evaluation indexes
  * better results than on original (those of SVM, RF, 1D-CBBG, and 3D-CBHGA)
  * ie silent segments in speech conversations are interference items
* performance of the four models for the depression/non category is low/high
  * reason may be the imbalance between the two classes
