CopyPaste: An Augmentation Method for Speech Emotion Recognition
Raghavendra Pappagari, Jesús Villalba, Piotr Żelasko, Laureano Moro-Velazquez, Najim Dehak
ICASSP 2021 arXiv:2010.14602 [cs.SD]

# Abstract

* Data augmentation is a widely used strategy for robust machine learning
* we: CopyPaste, a perceptually motivated novel augmentation procedure for SER
  * Assumption: concatenation of an emotional (emotion E) and a neutral
    utterance can still be labeled with emotion E. We hypothesize that SER
    performance can be improved using these concatenated utterances in model
* tested on two deep learning models
  * one trained independently and
  * another using transfer learning from an x-vector model, a speaker recog
* datasets considered: MSP-Podcast, Crema-D, and IEMOCAP
* all three CopyPaste schemes improve SER performance on all the three datasets
* CopyPaste performs better than noise augmentation and, using them together
* CopyPaste + noise augmentation improves the SER performance further. Our
* CopyPaste is effective even in noisy test conditions
* Merci: 	
  ResNet, weighted f1-score 50.71
	pretrained ResNet, weighted f1-score 58.62
