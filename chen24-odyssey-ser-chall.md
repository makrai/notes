1st Place Solution to Odyssey Emotion Recognition Challenge Task1:
  Tackling Class Imbalance Problem
Mingjie Chen, Hezhao Zhang, Yuanchao Li, JIACHEN LUO, Wen Wu, Ziyang Ma,
  Peter Bell, C Lai, J D. Reiss, L Wang, P Woodland, X Chen, H Phan, T Hain
Odyssey 2024

# Abstract

* minority classes sometimes being ignored or frequently misclassified
* Previous work has utilised class weighted loss for training
  * hE over-fitting for minor classes or under-fitting for major classes
* we: focal loss in optimisation when applying class weighted loss
  * the focal loss is further weighted by prior-based class weights
  * better overall performance, by sacrificing performance on major classes
* we further employ a majority voting strategy to combine the outputs of an
  ensemble of 7 models. The models are trained independently, using different
  acoustic features and loss functions
* best performance in the challenge, ranking top-1 among 68 submissions
* Macro-F1 score of 35.69% and an accuracy of 37.32%
* from the _Conclusion_
  * The 7 models were trained independently with
    different loss functions and class weights. Specifically, the
    * cross entropy loss and the focal loss were used
    * Uniform class weights and prior-based class weights are studied. The
    * the combinations of loss functions and class weights lead to different
      preference on the major classes or the minor classes

# 1. Introduction

* factors that affect speech emotion recognition
  * context information, speaking environments, the personality and the
    speaking style of speakers, language, cultural aspect, commonsense
    knowledge etc. [2, 3]
* classification and regression [3]
  * classification tasks, speech segments are typically annotated with labels
    from a small set (4–8) of emotion classes. The task is to predict the
    correct (single) emotion class representing the complete speech segment
* datasets [4, 5, 6] for SER
  * Most of them [6] are created by recording actors portraying the required
  * [4] has been created by prompting speakers to express specific emotions
  * [5] is a "natural dataset": directly collected from sources containing
    spontaneous speech with natural emotional expressions. Previous work
  * [7, 8]: the performance of SER models on these three types of datasets
    differs significantly. SER classification tasks on
  * natural datasets are still challenging, for many reasons [9]
* imbalanced class distributions
  * Discriminative machine learning methods typically also choose decision
    boundaries on the basis of the prevalence of a class
  * low occurrence: poor representation + being considered of less relevance
  * solutions
    * re-balance (re-weight) the loss of a class by class frequencies
    * data augmentation [10, 11],
    * new sampling strategies [12], and the use of a
      * [12] Hemin Ibrahim, Chu Kiong Loo, and Fady Alnajjar, “
        Bidirectional parallel echo state network for speech emotion recognit
        Neural Computing and Applications 2022, vol. 34, no. 20
    * modified loss function [13]
  * hE all of the above methods are likely to cause over-fitting problems on
    minor classes, thus sacrificing performance on major classes
  * issue is particularly pertinent in the Odyssey 2024 Emotion Recog, classif
    * class imbalanced training data, but a class balanced test set
* We: an ensemble system of 7 models
  * Each model takes in multi-modal features: audio and text
  * text repr (transcriptions) <~ automatic speech recognition (ASR) model [14]
    * To enhance the quality of the ASR transcriptions, an
      error correction model is used in post-processing
  * all models share the same architecture
  * models trained independently with
    different audio features or different optimisation configurations
  * loss function chosen is either the focal loss [15] or the cross entropy
    [15] Tsung-Yi Lin, Priya Goyal, Ross Girshick, Kaiming He, Piotr Dollár,
    Focal loss for dense object detection
    ICCV, 2017
  * weighted by prior-based class weights or uniform class weights
    * The prior-based class weights are used to give more preference to minor
      classes than major classes during training
    * hE over-fitting for minor classes, and thus a reduction in overall perf
    * In order to alleviate this issue, focal loss [15]
      * aims to give higher weights to more difficult samples and
        lower weights to easier samples
  * The model trained with the focal loss together with the prior-based class
    weights obtained the best overall performance
  * focal loss + prior-based class weights + ensemble
    * focal loss 9 prior-based class weights performs worse on major classes
      than the models trained with uniform class weights
  ~> ensemble system is designed to comprise of models with different
    preferences on major classes and minor classes
  ~> SOTA performance in the Odyssey 2024 Emotion Recognition Challenge track-1
  * Macro-F1 of 35.69%, and has ranked the first among 68 submissions

# 2. Related Works

## 2.1. Fusion Techniques for SER

* traditional
  * feature-level fusion (ie early fusion) and
  * decision-level fusion (ie late fusion)
* tensor-level fusion methods
  * [17] combined both modality-invariant and modality-specific features
    + regularisation functions to reduce the distance between the modalities
  * [18] proposed a weighted fusion method based on a cross-attention
    module for encoding inter-modality relations and selectively capturing
    effective information
  * [19] developed a dual-branch model, with
    * one timesynchronous branch that combined speech and text modalities,
    * a time-asynchronous branch integrating sentence text embeddings from
      context utterances
  * [20] fused ASR hidden states and ASR transcriptions with audio features
    in a hierarchical manner

## 2.2. ASR Error Correction As outlined above, the system makes use of ASR for

* we use an off-the-shelf system
* To enhance ASR performance, ASR Error Correction (AEC) methods can be
* post-processing using some knowledge about the task or target domain. The
  * standard method for addressing language domain mismatch is to train an
    in-domain language model for direct integration with ASR systems [21, 22]
  * alternative: AEC sequence to sequence models that correct the output
    * particularly useful in scenarios where the ASR is a black box [23]
  * recently: generative error correction using large language models [24]
  * using both speech and ASR hypotheses as input, instead of relying solely on
    text data, leading to the development of cross-modal AEC methods [24]
    * [24] Srijith Radhakrishnan, Chao-Han Yang, Sumeer Khan, Rohit Kumar,
        Narsis Kiani, David Gomez-Cabrero, and Jesper Tegnér, “
      Whispering LLaMA
        A cross-modal generative error correction framework for speech recog
      EMNLP 2023, pp. 10007–10016

# 3. System Description

* the system yielding the best performance makes use of an ensemble of models
  * Each model takes/returns as
    * input in frame-level audio features as well as token-level text features
    * output of each model are the probabilities for each emotion class. In
    * the prediction of each model is equally used for voting to emotion
* text features, this work used transcriptions generated by the
  Whisper-large-v2 model [14]. As there are no
* transcriptions available for the test set, an ASR system is needed for
  transcriptions, but it will inevitably produce erroneous transcripts
  * all models make use of ASR output
  * To enhance the quality of the ASR transcriptions, an
    ASR error correction model [25] is trained and then used to correct errors
    in the transcriptions in the test set

## 3.1. Model Architecture

* Figure 1 illustrates the principal architecture of models
* Frame-level audio features and token-level text features are encoded by two
  Multi-Layer Perceptron (MLP) modules
* Then transformer layers [26] are used to process audio and text features to
  encode dynamic information in features
* only one transformer head in the layers
  * In order to avoid over-fitting
* The transformer layers are followed by a mean pooling layer,
* then the utterance-level audio features and text features are concatenated.
* The concatenated features are processed by the two MLP modules
* The softmax output of the final MLP produces class probabilities

## 3.2. Audio Features and Text Features: Tab 1

* audio features are used: the final layer
  * representations of WavLM-large [27]; the final layer
  * representations of Hubert-extra-large [28]; and the final layer
  * output of the encoder of Whisper-large-v3 [14]. In terms of
* text features, this work utilises Roberta-large [29]. In order to enhance the
  * average representations of the last 4 layers’ from Roberta-large

## 3.3. Loss Functions and Class Weights

* loss functions, the focal loss and the cross entropy loss. The loss
* can be weighted by the prior-based class weights or uniform class weights
  Combining loss functions with class weights, four types of optimisation

### 3.3.1. Uniform Class Weights and Prior-based Class weights Consider a

* Prior-based class weights can be written where Nj is the number of samples in
  class j in a training or development set

### 3.3.2. Cross-Entropy Loss and Focal Loss

* the cross-entropy loss can be defined as: 1/N \sum − log pi
* the focal loss can be written as 1/N \sum −(1 − pi)^γ log pi
  * where γ is a hyper-parameter
* class-weighted focal loss can be written as 1/N \sum −wj(1 − pi)^γ log pi

## 3.4. Ensemble Strategy

* Table 2 lists the configurations of the 7 models in the ensemble system

# 4. Experimental Setup

* The dataset is composed of five subsets:
  * training set, development set, test-1 set, test-2 set, and test-3 set
* In this challenge, the test-3 set is used to measure the outcome, and the
  reference labels have not been made public
* annotated with 10 classes, in which 8 classes are used for this challenge
  * These are Neutral, Happy, Angry, Disgust, Sad, Surprise, Contempt and Fear
  * There are two remaining labelled classes, Other and No Agreement, are not
* Other and No Agreement: we removed associated samples, retaining only
  samples with the challenge classes. Detailed information of the training set,
* Table 3, including the subset statistics, before and after the O, X removal

## 4.2. Implementations

### 4.2.1. Multi-Modal Classifier Model

* ,,,
* The implementations are based on the recipe of the speechbrain toolkit [32]

### 4.2.2. Feature Fusion
* the following ones were implemented and compared
  * Early fusion: text and audio features are concatenated at the embedding
    level
  * Late fusion: text and audio features are learned independently and the
    final decision is determined based on respective outputs
  * Early fusion + late fusion
  * Tensor fusion: unimodal information and bimodal interactions are learned
    explicitly and aggregated [34]
    * [34] Amir Zadeh, M Chen, S Poria, E Cambria, Louis-Philippe Morency
      Tensor fusion network for multimodal sentiment analysis
      EMNLP 2017, 2017, pp. 1103–1114
  * Low-rank tensor fusion: multimodal fusion with modalityspecific low-rank
    factors, which scale linearly in the number of modalities [35]
* early fusion was found to outperform all other methods tested
  * unlike in the literature

### 4.2.3. ASR Error Correction

* A pretrained AEC model was used in this work, which has been
  trained on the English version of Common Voice 13.0 [36] and TED Talk corpus
  [37] using a publicly available Sequence-to-Sequence (S2S) encoder-decoder
  architecture [25]. This model was trained to convert ASR transcriptions to
  human-transcribed transcriptions (ie, ground-truth text). Considering the
* disparity between the MSP-Podcast dataset and the two AEC pretraining corpora
  (e.g., out-of-domain words), this model was
  ~> fine-tuning on the training set of the provided MSP-Podcast corpus for 10
  epochs and then validated on the development set. The best checkpoint was
  saved to correct errors on the test set. The correction quality was evaluated
  using WER, BLEU, and GLEU scores for a comprehensive assessment
  * nltk: Then GLEU score is simply the minimum of recall and precision. This
* tab 5: results of the best checkpoint on the development set are presented in
  Table 5, demonstrating the effectiveness of the AEC model. As there is no
  ground-truth text for the test set, there is no way to further evaluate its
  effectiveness
  * expected improvement in accuracy on the test set: approximately 1%,
    as suggested by previous research on the impact of WER on SER perform [38]

## 4.3. Evaluation Metrics: Macro-F1 is used as the primary metric. Macro-F1 is

* ie the unweighted average of the F1 score of each class
* additianlly: the weighted accuracy (WA) and unweighted accuracy (UA)

# 5. Results

* From analysing the performance difference in WA and UA results, it would be
  easy to understand how the models perform on the major vs minor classes
* Comparing model-1 to model-4, increasing γ = 2 causes an improvement in WA
  but a drop in UA, causing a reduction in Macro-F1
* audio features: for model-1, model-2 and model-3, it is clear that the
  Whisper features yield better results than both the WavLM features and the
  Hubert features
  * possible reasons
    * the Whisper model were trained supervisedly with text transcriptions,
      while the other two models were trained without supervision. These are
    * difference due to the model sizes and the amount of training data used
* the two loss functions and the two class weights. Generally speaking,
  different loss functions and class weights yields models that have different
  preferences for major and minor classes. Specifically, when training with the
  * class weights
    * uniform class weights, model-6 and the model-7 show good performance on
      UA but poor performance on WA
    * Comparing model-7 and model-5, the prior-based class weights give more
      attention to minor classes, causing a significant improvement in WA but a
      large drop in UA. This means that
    * ie the prior-based class weights improve the performance on the minor
      classes, but sacrificing the performance on the major classes. The per-
      formance drop may be due to model-5 over-fitting on major classes. The
  * focal loss: comparing model-1 and model-5, which shows that
    * focal loss helps model-1 reach a better balance between major & minor
