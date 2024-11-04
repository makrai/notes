CopyPaste: An Augmentation Method for Speech Emotion Recognition
Raghavendra Pappagari, Jesús Villalba, P Żelasko, L Moro-Velazquez, N Dehak
ICASSP 2021 arXiv:2010.14602 [cs.SD]

# Abstract

* Data augmentation is a widely used strategy for robust machine learning
* we: CopyPaste, a perceptually motivated novel augmentation procedure for SER
  * Assumption: concatenation of an emotional (emotion E) and a neutral
    utterance can still be labeled with emotion E. We hypothesize that SER
    performance can be improved using these concatenated utterances
* tested on two deep learning models
  * one trained independently and
  * another using transfer learning from an x-vector model, a speaker recog
* datasets considered: MSP-Podcast, Crema-D, and IEMOCAP
* all three CopyPaste schemes improve SER performance on all the three datasets
* CopyPaste performs better than noise augmentation and
* CopyPaste + noise augmentation improves the SER performance further
* CopyPaste is effective even in noisy test conditions
* Merci: 	
  ResNet, weighted f1-score 50.71
	pretrained ResNet, weighted f1-score 58.62

# 2 CopyPaste

1. N-CP: Concatenation of an emotional utterance (say emotion E) and a neutral
   utterance to produce another utterance with emotion E
2. SE-CP: Concatenation of two emotional utterances with same emo- tion E to
   produce another utterance with emotion E
   * We refer to this scheme as Same Emotion CopyPaste
3.  N+SE-CP Using N-CP and SE-CP together during model training

# 5 Results

## General considerations:

* Tables 2 and 3 show the results of CopyPaste schemes
  * tab 2 on randomly initialized ResNet model and
    * trained on MSP-Podcast Clean+Noise with N+SE-CP, CopyPaste achieves a
      weighted f1-score of 50.71
  * tab 3 on speaker pre-trained ResNet model
    * trained on MSP-Podcast Clean with SE-CP, CopyPaste achieves a
      weighted f1-score of 58.68
* pre-training improves the model performance significantly on all datasets
  as is the case in [14]
* Models trained with noise augmented data perform better compared to models
  trained only on clean data corroborating with previous research [14, 16]
* Comparison of models trained with and without CopyPaste schemes (4th-6th
  columns vs. 3rd column) reveals that
  * our models perform better on all datasets with all schemes. Though
  * no single best scheme across datasets and models except on Crema-D where
    N-CP scheme consistently performs best. We can observe that
  * CopyPaste schemes are effective on both clean data as well as noise
    augmented data
  * the improvements obtained with CopyPaste schemes on the randomly
    initialized ResNet model are relatively higher
    compared to the improvements on the pre-trained ResNet model
