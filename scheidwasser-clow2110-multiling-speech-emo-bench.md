SERAB: A multi-lingual benchmark for speech emotion recognition
Neil Scheidwasser-Clow, Mikolaj Kegler, Pierre Beckmann, Milos Cernak
Submitted to ICASSP 2022 arXiv:2110.03414 [cs.SD]

setup instructions, evaluation pipelines & examples, is freely available online

* Recently developments in speech emotion recognition (SER)
  * often leverage deep neural networks (DNNs).
  * Comparison difficult <~ different datasets and evaluation protocols
* we present the Speech Emotion Recognition Adaptation Benchmark (SERAB), a
  * for utterance-level SER The benchmark is composed of
  * nine datasets for SER in six languages
  * the datasets have different sizes and numbers of emotional classes, the
* We evaluate a selection of standard hand-crafted feature sets and SOTA DNNs
  * using only a subset of the data included in SERAB can result in biased
    evaluation, while compliance with the proposed protocol can circumvent this

# 1 Intro

* computational paralinguistics, the analysis of non-verbal elements of speech
* applications: human-computer interaction [1], healthcare [2], & public safety
* hand-engineered features has proven effective in tackling various SER-related
  * based on acoustic [4] or linguistic descriptors [5]. More recently,
* deep neural networks (DNNs) trained in self-supervised fashion were able to
  * fixed representation suitable for a range of audio and speech proc tasks
  * transfer learned knowledge from a large, unlabeled dataset to downstream
    tasks with less task-specific data available.
* estimated performance strongly depends on the evaluation protocol. This makes
  * open-source benchmarks, typically composed of fixed dataset(s) and
    evaluation pipelines, instrumental for comparisons of different methods
  * other domain
    * In visual object recognition, ImageNet [8] has established itself as the
      de facto image dataset and benchmark for deep learning models
    * In natural language processing (NLP), GLUE [9] is a widely used
      benchmark, with nine different NLU tasks encompassing various characteris
      (eg, sentiment analysis, paraphrase, and inference tasks)
* audio benchmark
  * As one of the largest audio datasets available, AudioSet [10] is commonly
    used for self-supervised pre-training, as well as a benchmarking method for
    audio event classification [6, 7, 11]. A
  *  HEAR challenge [12]  evaluating general-purpose audio representations and
     extends the concept underlying AudioSet by including additional tasks
  * speech representation learning,
    * NOSS [6] platform for evaluating speech-specific feature extractors. It
      * non-semantic speech processing problems, such as
        speaker and language identification, as well as
      * two SER tasks (CREMA-D [13] and SAVEE [14]).
* no multi-task SER benchmark yet 
  * [15]'s SER-specific benchmarking framework, it has shortcomings
    * only includes a single dataset, implying the
      lack of diversity in terms of task difficulty, amount of task-specific
      data, or data acquisition setup (eg, recording equipment and conditions).  
    * monolingual, with all speech material in English
      * As a paralinguistic cue, robust embeddings for speech emotion
        recognition should perform well across different languages.
* we introduce the Speech Emotion Recognition Adaptation Benchmark (SERAB), a
  * nine SER tasks spanning six languages,
    different dataset sizes and emotion categories
    * baselines have different performance on diff datasets, and illustrate the
  * we set up a custom evaluation pipeline.  We employed the framework to
  * we evaluate
    * recent SOTA pre-trained DNNs for speech/audio feat extract [6, 7, 11, 16]
    * a classic set of handcrafted features
      commonly used in computational paralinguistics [4].  
    * see Conclusions
* we also propose a novel Transformer-based model, which
  * performs on par with SOTA approaches. Results obtained for a range of

# 2. Speech emotion recognition adaptation benchmark (serab)

# 3. Baseline approaches

## openSMILE [4]: a hand-engineered acoustic feature set

* based on functionals of low-level descriptor contours. Although not data-driv
* capable of outperforming DNN-based feature extractors, eg, in problems with
  little task-specific data [27]
* the most recent implementation of openSMILE 1 was used to extract features
  from each utterance in the SERAB tasks
  * Subsequently, for each task, the speech emotion classifier was optimized
    using the training and validation portions of the data and evaluated using
    the set-aside test set (Section 2.2).

## VGGish [11]: one of the first DNN-based feature extractors for audio,

* inspired by the VGG-16 convolutional DNN (CNN) [28]
* Pre-trained in supervised classification of audio events from the Youtube-8M
  dataset [29] (≥ 350,000 hours of video, 3,000 classes)
* The model uses fixed-size input windows
  * To cope with variable-length audio clips, each input utterance was split
    into non-overlapping 960 ms-long frames.  A log-mel magnitude spectrogram
    (N = 64 mel frequency bins) was computed from a short-term Fourier
    transform with 25-ms windows in steps of 10 ms for each frame. The
    resulting frames were then fed to the pre-trained model for feature
    extraction. After processing M frames, the obtained M embeddings were
    averaged to obtain one feature set per utterance. The remaining evaluation
    followed the protocol outlined in Section 2.2.

## YAMNet [16] is another commonly used DNN-based feature extractor [6, 7].

* utilizes MobileNetv1 [30], an efficient CNN architecture
optimized for mobile devices. Here, we used the weights 3 of the model
pre-trained through supervised classification of events from AudioSet [10] (≈
5,800 hours of audio, 521 classes). Since the model operates using fixed-size
windows, the input utterances were processed analogously to VGGish.

## TRILL While VGGish and YAMNet were trained on diverse au-
dio sources (speech, music, environmental sounds, etc.), TRILL [6]
was specifically developed as a non-semantic speech feature extrac-
tor. The DNN model adopted the architecture of ResNetish [11]
and was pre-trained in self-supervised fashion using speech sam-
ples from AudioSet, which constitutes approximately 50% of the en-
tire dataset (≈ 2,800 hours of audio). The pre-trained model 4 used
herein was obtained from triplet loss optimization, which aims at
minimizing the embedding-space distance between an anchor and
a positive sample (i.e., from the same clip) while maximizing the
distance between the same anchor and a negative sample (i.e., from
a different clip). In the context of audio, temporally neighboring
audio segments will be closer in the representation space and vice
versa. Once again, the model operates on fixed-size frames, so the
input utterances were processed analogously to VGGish and YAM
Net. Following [6], we used the embedding from the first 512-depth
convolution layer (layer 19) which performed best on NOSS.

## BYOL-A As an alternative to contrastive learning setups such
as TRILL, BYOL-A [7] proposes bootstrapping your own latent
(BYOL) for audio representation learning, inspired by the success of

BYOL [31] for self-supervised image classification. Pre-trained on
the entire AudioSet, this approach achieved state-of-the-art results in
various audio classification tasks, even outperforming TRILL [6] in
speech processing problems. Instead of assessing the temporal prox-
imity of two different audio segments, BYOL-A relies on comparing
two augmented versions of a single sample. More specifically, each version is respectively fed to an online network and a target network.

While both are composed of an encoder and a projection block, the
online network includes a prediction layer which aims at predicting
the projected representation of the second augmented view. Thus,

BYOL (and BYOL-A) learns a representation by negating the ran-
dom data augmentations to capture the essential information about
the input. Regarding BYOL-A, pre-trained weights for models of
different sizes were released by the authors 5 and used in this work.

Since the model accepts inputs of variable length, it returns a single
embedding per input utterance. The resulting embeddings are used
to train and evaluate the SER classifiers (Section 2.2).

## BYOL-S While BYOL-A can achieve state-of-the-art results on a
range of audio classification tasks, its general audio representation
might not be optimal for speech processing and especially paralin-
guistic problems. Thus, we re-trained BYOL-A using only speech
samples of AudioSet, leading to the speech-specific BYOL-S (S de-
noting speech). The model architecture, pre-training routine, and
usage remained the same as in the original version.

## BYOL-S/CvT In this model, we propose an extension of BYOL-S
with a Transformer representation. More specifically, we replaced
the convolution blocks in BYOL-S with Convolutional Transformer 6
(CvT) [32]. CvT notably extends self-attention with depthwise
convolution to project the queries, keys, and value embeddings.

Between the attention modules, traditional convolution layers are
added to decompose the input as in most CNNs. Consequently,

CvT combines the qualities of CNNs (eg, translation invariance)
and Transformers (eg, capturing long-range dependencies and
generalization abilities). Here, each CvT stage included only one
self-attention layer to allow fair comparisons with BYOL-S, both
in terms of model architecture and the number of parameters. We
experimented with three different configurations of the model. To
explore the impact of model size, the number of filters in CvT stages
was manipulated to reduce the number of parameters (Table 2),
analogously to BYOL-A [7]. In addition, the model was tested with
three different embedding dimensions: 256, 512 and 2048. The lat-
ter used mean + max temporal aggregation in the last layer instead
of global average pooling, in the same vein as [7]. Like BYOL-S,
the pre-training and application to SERAB tasks was analogous to

BYOL-A.

openSMILE openSMILE [4] is a hand-engineered acoustic fea-
ture set based on functionals of low-level descriptor contours. Al-
though not directly data-driven, openSMILE is capable of outper-
forming DNN-based feature extractors, eg, in problems with lit-
tle task-specific data [27]. Here, the most recent implementation of
openSMILE 1 was used to extract features from each utterance in the

SERAB tasks. Subsequently, for each task, the speech emotion clas-
sifier was optimized using the training and validation portions of the
data and evaluated using the set-aside test set (Section 2.2).

VGGish VGGish [11] is one of the first DNN-based feature ex-
tractors for audio, inspired by the VGG-16 convolutional DNN
(CNN) [28]. Pre-trained model weights 2 were learned through
supervised classification of audio events from the Youtube-8M
dataset [29] (≥ 350,000 hours of video, 3,000 classes). The model
uses fixed-size input windows. To cope with variable-length au-
dio clips, each input utterance was split into non-overlapping 960
ms-long frames. A log-mel magnitude spectrogram (N = 64 mel
frequency bins) was computed from a short-term Fourier transform
with 25-ms windows in steps of 10 ms for each frame. The resulting
frames were then fed to the pre-trained model for feature extrac-
tion. After processing M frames, the obtained M embeddings were
averaged to obtain one feature set per utterance. The remaining
evaluation followed the protocol outlined in Section 2.2.

YAMNet YAMNet [16] is another commonly used DNN-based
feature extractor [6, 7]. This approach utilizes MobileNetv1 [30],
an efficient CNN architecture optimized for mobile devices. Here,
we used the weights 3 of the model pre-trained through supervised
classification of events from AudioSet [10] (≈ 5,800 hours of audio,
521 classes). Since the model operates using fixed-size windows, the
input utterances were processed analogously to VGGish.

TRILL While VGGish and YAMNet were trained on diverse au-
dio sources (speech, music, environmental sounds, etc.), TRILL [6]
was specifically developed as a non-semantic speech feature extrac-
tor. The DNN model adopted the architecture of ResNetish [11]
and was pre-trained in self-supervised fashion using speech sam-
ples from AudioSet, which constitutes approximately 50% of the en-
tire dataset (≈ 2,800 hours of audio). The pre-trained model 4 used
herein was obtained from triplet loss optimization, which aims at
minimizing the embedding-space distance between an anchor and
a positive sample (i.e., from the same clip) while maximizing the
distance between the same anchor and a negative sample (i.e., from
a different clip). In the context of audio, temporally neighboring
audio segments will be closer in the representation space and vice
versa. Once again, the model operates on fixed-size frames, so the
input utterances were processed analogously to VGGish and YAM-

Net. Following [6], we used the embedding from the first 512-depth
convolution layer (layer 19) which performed best on NOSS.

BYOL-A As an alternative to contrastive learning setups such
as TRILL, BYOL-A [7] proposes bootstrapping your own latent
(BYOL) for audio representation learning, inspired by the success of

BYOL [31] for self-supervised image classification. Pre-trained on
the entire AudioSet, this approach achieved state-of-the-art results in
various audio classification tasks, even outperforming TRILL [6] in
speech processing problems. Instead of assessing the temporal prox-
imity of two different audio segments, BYOL-A relies on comparing
two augmented versions of a single sample. More specifically, eachversion is
respectively fed to an online network and a target network.

While both are composed of an encoder and a projection block, the
online network includes a prediction layer which aims at predicting
the projected representation of the second augmented view. Thus,

BYOL (and BYOL-A) learns a representation by negating the ran-
dom data augmentations to capture the essential information about
the input. Regarding BYOL-A, pre-trained weights for models of
different sizes were released by the authors 5 and used in this work.

Since the model accepts inputs of variable length, it returns a single
embedding per input utterance. The resulting embeddings are used
to train and evaluate the SER classifiers (Section 2.2).

BYOL-S While BYOL-A can achieve state-of-the-art results on a
range of audio classification tasks, its general audio representation
might not be optimal for speech processing and especially paralin-
guistic problems. Thus, we re-trained BYOL-A using only speech
samples of AudioSet, leading to the speech-specific BYOL-S (S de-
noting speech). The model architecture, pre-training routine, and
usage remained the same as in the original version.

BYOL-S/CvT In this model, we propose an extension of BYOL-S
with a Transformer representation. More specifically, we replaced
the convolution blocks in BYOL-S with Convolutional Transformer 6
(CvT) [32]. CvT notably extends self-attention with depthwise
convolution to project the queries, keys, and value embeddings.

Between the attention modules, traditional convolution layers are
added to decompose the input as in most CNNs. Consequently,

CvT combines the qualities of CNNs (eg, translation invariance)
and Transformers (eg, capturing long-range dependencies and
generalization abilities). Here, each CvT stage included only one
self-attention layer to allow fair comparisons with BYOL-S, both
in terms of model architecture and the number of parameters. We
experimented with three different configurations of the model. To
explore the impact of model size, the number of filters in CvT stages
was manipulated to reduce the number of parameters (Table 2),
analogously to BYOL-A [7]. In addition, the model was tested with
three different embedding dimensions: 256, 512 and 2048. The lat-
ter used mean + max temporal aggregation in the last layer instead
of global average pooling, in the same vein as [7]. Like BYOL-S,
the pre-training and application to SERAB tasks was analogous to

BYOL-A.

# 4. Evaluation results & discussion

# 5. Conclusions

* Among the tested frameworks,
  * BYOL-based approaches yielded superior performance across all metrics.
    * pre-training BYOL-A models on only speech samples of AudioSet (BYOL-S)
      led to an almost 3% accuracy improvement compared to the original method.
* future
  * develop something based on CvT explored here.  Future work should focus on
  * incorporating more datasets in even more languages into SERAB, as well as
  * extending the task range to include regression problems 
    eg valence or arousal estimation. To facilitate the usage of SERAB, the
