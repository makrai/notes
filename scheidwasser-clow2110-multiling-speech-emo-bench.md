SERAB: A multi-lingual benchmark for speech emotion recognition
Neil Scheidwasser-Clow, Mikolaj Kegler, Pierre Beckmann, Milos Cernak
Submitted to ICASSP 2022 arXiv:2110.03414 [cs.SD]

setup instructions, evaluation pipelines & examples, is freely available online

# Abstract

* speech emotion recognition (SER) with deep neural networks (DNNs)
  * Comparison difficult <~ different datasets and evaluation protocols
* we present the Speech Emotion Recognition Adaptation Benchmark (SERAB)
  * for utterance-level SER
  * nine datasets for SER in six languages
  * the datasets have different sizes and numbers of emotional classes
* We evaluate a selection of standard hand-crafted feature sets and SOTA DNNs
  * using only a subset of the data in SERAB can result in biased eval, while
    compliance with the proposed protocol can circumvent this

# 1 Intro

* computational paralinguistics, the analysis of non-verbal elements of speech
* applications: human-computer interaction [1], healthcare [2], & public safety
* hand-engineered features has proven effective in tackling various SER-related
  * based on acoustic [4] or linguistic descriptors [5]
* deep neural networks (DNNs) trained in self-supervised fashion
  * fixed representation suitable for a range of audio and speech proc tasks
  * transfer learned knowledge from a large, unlabeled dataset
    to downstream tasks with less task-specific data available
* estimated performance strongly depends on the evaluation protocol
  * open-source benchmarks, typically composed of fixed dataset(s) and
    evaluation pipelines, instrumental for comparisons of different methods
  * other domain
    * In visual object recognition, ImageNet [8] has established itself as the
      de facto image dataset and benchmark for deep learning models
    * In NLP, GLUE [9] is a widely used benchmark, with 9 NLU tasks
      (eg, sentiment analysis, paraphrase, and inference tasks)
* audio benchmark
  * As one of the largest audio datasets, AudioSet [10] is commonly used for 
    * self-supervised pre-training, as well as a 
    * benchmarking method for audio event classification [6, 7, 11]
  * HEAR challenge [12] evaluating general-purpose audio representations and
    extends the concept underlying AudioSet by including additional tasks
  * speech representation learning,
    * NOSS [6] platform for evaluating speech-specific feature extractors
      * non-semantic speech processing problems, such as
        speaker and language identification, as well as
      * two SER tasks (CREMA-D [13] and SAVEE [14])
* no multi-task SER benchmark yet
  * [15]'s SER-specific benchmarking framework has shortcomings
    * only includes a single dataset, implying the
    * lack of diversity:
    * task difficulty, amount of task-specific data, or
    * data acquisition setup (eg, recording equipment and conditions)
    * monolingual, with all speech material in English
      * As a paralinguistic cue, robust embeddings for speech emotion
        recognition should perform well across different languages
* we introduce the Speech Emotion Recognition Adaptation Benchmark (SERAB)
  * nine SER tasks spanning six languages,
    different dataset sizes and emotion categories
    * baselines have different performance on diff datasets
  * we set up a custom evaluation pipeline
  * we evaluate
    * recent SOTA pre-trained DNNs for speech/audio feat extract [6, 7, 11, 16]
    * a classic set of handcrafted features
      commonly used in computational paralinguistics [4]
    * see Conclusions
* we also propose a novel Transformer-based model, which
  * performs on par with SOTA approaches

# 2. Speech emotion recognition adaptation benchmark (serab)

## 2.1 A summary of the tasks used in SERAB is presented in Table 1. The

* nine speech emotion classification tasks in six languages: 
  * four in English (CREMA-D, IEMOCAP, RAVDESS & SAVEE), and 
  * one in French (CaFE), German (EmoDB), Greek (AESDD), Italian (EMOVO), and
    Persian (ShEMO). In each dataset, 
* speech samples have three attributes: 
  audio data (ie the raw waveform, in mono), 
  speaker identifier, and 
  emotion label (eg angry, happy, sad)
* The datasets vary in size (ie number of utterances), number of speakers,
  class distribution, and number of classes.
* emo set
  * anger, happiness, and sadness are found across all datasets, 
  * disgust, fear, neutral emotion, surprise, calm, and boredom appear in >= 1
* all datasets have roughly the same average utterance duration 
  (between 2.5 & 4.5 seconds)
* designed to balance dataset popularity, language diversity, and open
  access
  * In speech emotion recognition, EmoDB, IEMOCAP and RAVDESS are among the
    most widely used datasets [15, 23, 24]. In the same vein as [24], a 4-class
    subset of IEMOCAP (IEM4) was used to mitigate the severe class imbalance
    in the original dataset. For the other tasks, all samples and classes from
    the original datasets were used (Table 1). As already present in NOSS [6],
    CREMA-D and SAVEE were included in SERAB. To complete the benchmark, CaFE
    (French) and EMOVO (Italian) were chosen as Italic-language datasets,
    whereas AESDD (Greek) and ShEMO (Persian) represented the Hellenic and
    IndoIranian branches of the Indo-European family [25]. Overall, the
* mainly comprises scripted and acted speech, 
  excepting IEM4 [17], RAVDESS [22] and ShEMO [23] which feature spontaneous
  utterances
* Each dataset was split into training, validation, and testing sets to
  * Excepting CREMA-D, each dataset was split into 60% training, 20% valid, and
    20% testing sets
  * For CREMA-D, we followed a 70/10/20% (training/validation/testing) split
    that was applied in NOSS [6]
  * Each data partition was speaker-independent, ie
    the sets of speakers included in each part were mutually disjoint
  * Since SERAB datasets vary in size, the fixed data split allows assessing
    how different methods cope with various amounts of task-specific data

## 2.2 Eval pipeline

# 3. Baseline approaches

## openSMILE [4]: a hand-engineered acoustic feature set

* based on functionals of low-level descriptor contours, not data-driven
* capable of outperforming DNN-based feature extractors
  eg, in problems with little task-specific data [27]
* the most recent implementation of openSMILE was used to extract features
  from each utterance in the SERAB tasks
* Subsequently, for each task, the speech emotion classifier was optimized
  using the training and validation portions of the data and evaluated using
  the set-aside test set (Section 2.2)

## VGGish [11]: one of the first DNN-based feature extractors for audio,

* inspired by the VGG-16 convolutional DNN (CNN) [28]
* Pre-trained in supervised classification of audio events from the Youtube-8M
  dataset [29] (≥ 350,000 hours of video, 3,000 classes)
* The model uses fixed-size input windows
  * To cope with variable-length audio clips, each input utterance was split
    into non-overlapping 960 ms-long frames
  * A log-mel magnitude spectrogram (N = 64 mel frequency bins) was computed
    from a short-term Fourier transform with 25-ms windows in steps of 10 ms
  * The resulting frames were then fed to the pre-trained model for feat extrac
  * After processing M frames, the obtained M embeddings were averaged to
    obtain one feature set per utterance
  * The remaining evaluation followed the protocol outlined in Section 2.2

## YAMNet [16] another commonly used DNN-based feature extractor [6, 7]

* utilizes MobileNetv1 [30], an efficient CNN architecture optimized for mobile
* we used the weights of the model pre-trained through supervised classif of
  events from AudioSet [10] (≈ 5,800 hours of audio, 521 classes)
* Since the model operates using fixed-size windows, the input utterances were
  processed analogously to VGGish

## TRILL

* specifically developed as a non-semantic speech feature extract
  * While VGGish and YAMNet were trained on diverse audio sources
    (speech, music, environmental sounds, etc.)
  * The DNN model adopted the architecture of ResNetish [11] and was
    pre-trained in self-supervised fashion using speech samples from AudioSet,
    which constitutes approximately 50% of the entire dataset (≈ 2,800 hours)
  * pre-trained model obtained from triplet loss optim, which aims at
    minimizing the embedding-space distance between an anchor and a positive
    sample (ie, from the same clip) while maximizing the distance between the
    same anchor and a negative sample (ie, from a different clip)
* In the context of audio, temporally neighboring audio segments will be closer
  in the representation space and vice versa
* Once again, the model operates on fixed-size frames, so the input utterances
  were processed analogously to VGGish and YAM Net
* Following [6], we used the embedding from the first 512-depth convolution
  layer (layer 19) which performed best on NOSS

## BYOL-A [7]

* an alternative to contrastive learning setups such as TRILL
* bootstrapping your own latent (BYOL) for audio representation learning,
  inspired by the success of BYOL [31] for self-supervised image classification
  * Pre-trained on the entire AudioSet, this approach achieved
  * SOTA results in various audio classification tasks
    * even outperforming TRILL [6] in speech processing problems
* relies on comparing two augmented versions of a single sample
  * Instead of assessing the temporal proximity of two different audio segments
  * each version is respectively fed to an online network and a target network
    * both networks composed of an encoder and a projection block
    * online network includes a prediction layer which aims at predicting the
      projected representation of the second augmented view
* Thus, BYOL (and BYOL-A) learns a representation by negating the random data
  augmentations to capture the essential information about the input
* BYOL-A: pre-trained weights for models of different sizes were released by
  the authors
* accepts inputs of variable length => a single embedding per input utterance
* The resulting embeddings are used to train and evaluate the SER classifiers
  (Section 2.2)

## BYOL-S (speech-specific BYOL)

* BYOL-A's general audio representation might not be optimal for speech
  processing and especially paralinguistic problems
* Thus, we re-trained BYOL-A using only speech samples of AudioSet, leading to
  the speech-specific BYOL-S (S denoting speech). The model architecture,
  pre-training routine, and usage remained the same as in the original version

## BYOL-S/CvT: an extension of BYOL-S with a Transformer representation

* we replaced the convolution blocks in BYOL-S
  with Convolutional Transformer (CvT) [32]
* CvT notably extends self-attention with depthwise convolution to
  project the queries, keys, and value embeddings
  * Between the attention modules, traditional convolution layers are added to
    decompose the input as in most CNNs
  * => CvT combines the qualities of
    CNNs (eg, translation invariance) and
    Transformers (eg, capturing long-range dependencies and generalization)
* Here, each CvT stage included only one self-attention layer
  to allow fair comparisons with BYOL-S,
  both in terms of model architecture and the number of parameters.  We
* three configurations of the model
  * To explore the impact of model size, the number of filters in CvT stages
    was manipulated to reduce the number of parameters (Table 2), analogously
    to BYOL-A [7]
  * three embedding dimensions: 256, 512 and 2048
    * The latter used mean + max temporal aggregation in the last layer instead
      of global average pooling, in the same vein as [7]
* pre-training and application to SERAB tasks was analogous to BYOL-A and -S

# 4. Evaluation results & discussion

# 5. Conclusions

* Among the tested frameworks,
  * BYOL-based approaches yielded superior performance across all metrics
    * pre-training BYOL-A models on only speech samples of AudioSet (BYOL-S)
      led to an almost 3% accuracy improvement compared to the original method
* future
  * develop something based on CvT explored here
  * incorporating more datasets in even more languages into SERAB
  * extending the task range to include regression problems
    eg valence or arousal estimation
