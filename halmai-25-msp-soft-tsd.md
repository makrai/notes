Spoken Emotion Recognition Using Soft Labels
Dániel Halmai 1 Gábor Gosztolya 1,2
to be submitted to TSD 2025 

# 1 Intro

* standard practice for MSP Podcast [7, 14]
  7. Duret, J., Rouvier, M., Estéve, Y.: MSP-Podcast SER Challenge 2024:
    _L’antenne du ventoux_ multimodal self-supervised learning for SER
    In: Proceedings of Odyssey. pp. 309–314. Quebec City, Canada (2024)
  14. Upadhyay, S.G., Chien, W.S., Su, B.H., Lee, C.C.:
    Learning with rater-expanded label space to improve SER
    IEEE Transactions on Affective Computing 15(3), 1539–1552 (2024)

## Wav2vec 2.0

* introduced by Facebook AI [2]. They proposed 
* two types of model configurations. 
  * Both have a feature encoder block that contains seven convolutional blocks
    with 512 channels each. 
  * The transformer setups are different. The 
  * base model contains 12 transformer layers with model dimension of 768 and 8
    attention heads. The 
  * large model has 24 transformer blocks with model dimensions of 1 024, 16
    attention heads, and about 300M parameters [2, 1].
* Specifically, we used the Wav2vec 2.0 XLSR-53 version, which was pre-trained
  on speech in 53 different languages, and the dataset used for this contains
  more than 56 000 hours of audio [5]. This model implements the large Wav2vec
  2.0 architecture. This model was then fine-tuned on the training set of the
  MSP Podcast corpus.

##  3.3 Evaluation metrics

* weighted average, by 
  * weighting each metric with the proportion of true labels in the dataset. To
* we trained each model using 5 different random seeds, and we report the mean

## 3.5 Soft label methods

* the learning rate was chosen as 5e-5 and 

### Soft label with mean squared error In our first approach, we used mean

* the checkpoint selection was based on the minimum of MSE.

### Soft label with mean squared error and softmax In our second approach, we

* a softmax layer at the end of the previous architecture. In this case the
* checkpoint selection was chosen as minimum of MSE.

### Soft label with macro F1

* checkpoint selection changed to maximum of macro F1
  * we converted the soft labels to hard labels
