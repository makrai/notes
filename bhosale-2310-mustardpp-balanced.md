Sarcasm in Sight and Sound:
  Benchmarking and Expansion to Improve Multimodal Sarcasm Detection
Swapnil Bhosale, Abhra Chaudhuri, Alex Lee Robert Williams, Divyank Tiwari,
  Anjan Dutta, Xiatian Zhu, Pushpak Bhattacharyya, Diptesh Kanojia
arXiv:2310.01430 [cs.CL]

code, extended data, and SOTA benchmark models:
github.com/spbanonymo/Sarcasm-Sight-and-Sound

# Abstract

* MUStARD++: Sarcasm is multi-modal
  * Natural language text
  * manners of speech (like tonality and intonation) and
  * visual cues (facial expression)
* we: a rigorous benchmarking of the MUStARD++ dataset
  with SOTA language, speech, and visual encoders, for fully utilizing them
  * 2 % improvement in macro-F1 over the existing benchmark
* imbalance in the `sarcasm type' category in MUStARD++,
* we propose an extension, which we call  _MUStARD++ Balanced_, benchmarking the
  same with instances from the extension split across both train and test sets,
  * a further 2.4 % macro-F1 boost
  * new clips taken from a novel source -- the TV show, House MD
  * adds to the diversity of the dataset
  * manually annotated by multiple annotators with 
    substant inter-annotator agreement (Cohen's kappa and Krippendorf's alpha)

# 1 Intro

* many NLP tasks under the sentiment umbrella through multimodality [3–6]
* MUStARD [1], a multi-modal sarcasm detection dataset
  * information from all three associated modalities, ie, text, speech, & video
  * MUStARD++ [Ray+ 2] recognized underlying emotions to be a crucial
    * an extension of MUStARD with emotion annotations, and 
      an expansion of the instance set
    * the above works encode the individual modalities through
      independent text, speech, and vision modules, and
      combining their respective representations via a fusion layer [7]
* two limitations in the existing multi-modal sarcasm detect benchm (MUStARD++)
  * only classical encoding approaches of the individual modalities
  * Mel Frequency Cepstral Coefficients (MFCC), Mel spectrogram <~ Librosa [8],
    prosodic features from OpenSMILE [9] for speech
  * ResNet-152 [10] for videos, which cannot fully leverage the
    complementarity in the multi-modal information available in the datasets
  * the ‘sarcasm type’ category in MUStARD++ exhibits an imbalance
* we aim to bridge these gaps by 
  rigorous benchmarking based on SOTA vision, speech, and language encoders
* we also expand the MUStARD++ dataset by adding 
  new instances that alleviate this imbalance to a certain degree
* large-scale self-supervised pre-training can often generalize much better than
  even supervised pre-training
  * CLIP [11] enabled this for multi-modal vision-language tasks as well
* we propose to perform a benchmarking for multi-modal sarcasm detection that is
  * more in tune with the current SOTA in multi-modal learning
  * ViFi-CLIP [12], a SOTA CLIP-based model for encoding videos in a
    common video-text representation space
  * Wav2vec 2.0, a transformer-based self-supervised speech representation
    * masked learning objective for audio
  * we achieve > 2% gain in macro-F1 over the existing benchmark
* to cure the ‘sarcasm type’ category imbalance in MUStARD++, we propose an
  extension, we call, MUStARD++ Balanced
  * publicly available clips in our extension are taken 
    from the TV show, House MD, which also adds diversity
  * three annotators, substantial inter-annotator agreement 
    in terms of Cohen’s kappa and Krippendorf’s alpha
  * We split the clips in our extension across both train and test sets, and
  * further benchmarking using our proposed setup
  * further 2.4% boost to macro-F1 from using our extension
* additional expers quantify the distribution shift introed by our extension
* contributions:
  * rigorous benchmarking for multi-modal sarcasm detection on MUStARD++
  * using SOTA vision, speech, and language models
  * MUStARD++ Balanced: an extension to the MUStARD++ dataset
    * to cure the ‘sarcasm type’ imbalance in the former, and 
    * for data diversity; and
  * extensive experiments that show the
    significant gains in macro-F1 obtained by using our proposed benchmarking
    strategy, as well as from using our novel, balanced extension

# Related Work

## 2.1 Sarcasm Detection

* linguistic perspective to sarcasm detection
  * Bouazizi 2016 [15] used a pattern-based approach for the task
    * four sets of features obtained based on different sarcasm types
    * 83.1% accuracy and 91.1% precision on the task of sarcasm detection
  * [16] and [17] used a Naive Bayes and Decision Tree model, respectively
    * the best F1 scores > 70 on their chosen datasets
* SemEval 2018 Shared Task 3
  * [18], [19] offered an RCNN-RoBERTa methodology
    * RoBERTa transformer was used with BiLSTM to enhance task performance
    * F1-score of 90.0 on the Riloff dataset [20]
* recent methods for sarcasm detection using text are discussed by [21]
  * A BERT [22] model without concatenated layers,
    BERT encodings with a Logistic Regression model, and other language models
  * IAN [23] that are trained and assessed on a Twitter-based sarcastic dataset
  * F1-score of 73.4 in those evaluations, the BERT language model, without any
    additional layers, performs the best
  * in Arabic [24]: extensive experiments on different transformer architectures
    * mBERT, XLM-RoBERTa [25] and language-specific models like MARBERT [26]
    * F1-score of 58.4, which shows the need to investigate sarcasm
    * A weighted average Ensemble of a CNN, LSTM, and Gated Recurrent Unit (GRU)
    * GloVe [27] word embeddings to identify sarcasm, as demonstrated in [28]
    * outperformed comparative studies by up to 8% on SARC [29], Reddit

# 2.2 Multi-modal Learning

* Hazarika+ [35]: a Conversational Memory Network (CMN) to leverage context
* multimodal neural architectures [36, 37] and
* multimodal fusion approaches [38, 39] have propelled the deployment
* more efficient multimodal fusion approaches [40–42]
* datasets and approaches in detail [43]
* The MUStARD dataset [44] provides clips compiled from popular TV shows,
  * MUStARD++ [Ray+ 45] extend upon this dataset by adding emotion labels and
    additional clips while also benchmarking for multimodal sarcasm
  * Ray+ utilise feature fusion [7] and a feed-forward network
  * F1-score of 70.2% points using audio, text and video modalities

# 3 Dataset details

* benchmarks on MUStARD: Multibench [46], Castro 2019 [1], Ray 2022 [2]
  not consider the latest developments
  in multi-modal vision-language fusion [11, 12] and speech processing [47]
  * Chauhan+ [48] annotated MUStARD with 9 emotion labels
  * MUStARD++ Ray+ [2]
    * refined and extended: valence and arousal, important indicators for emo
  * as well as adding further data points. Table 1 summarizes the statistics

| Dataset                   | Sarc | Non-Sarc | Total |
| --------------------------|----: |-------:  | ----: |
| MUStARD                   |  345 |    6020  |  6365 |
| MUStARD++                 |  601 |     601  |  1202 |
| MUStARD++ Balanced (ours) |  691 |     674  |  1365 |

## 3.1 Dataset Extension

* MUStARD++ categorised their data points by adding the ‘sarcasm type’
  * Propositional (PRO): additional context needed for classification
                         eg "That’s very kind of you."
  * Illocutionary (ILL): the irony is expressed through non-textual cues, like
    voice or (facial) gesture. Eg while tasting a poorly cooked food, one may
    remark, "How delicious!", while expressing their contempt
  * Embedded (EMB): incongruity is clearly embedded in the text
    eg "What a pleasant orchestra of honking cars!"
  * Like-Prefixed (LIKE): Prefixes the statement with a "like" to stress the
    irony. For example, "Like it means the end of the world!".
* A lack of balance in a sarcasm detection dataset among the above types
* Table 2 shows our attempt (the ratios change at most 3 %)
* underrepresentation of samples in the EMB and the LIKE types

### Data Validation & Analysis

* annotation is cognitively cumbersome, it spanned longer than anticipated.
* Multimodal data annotation is further challenging: lengthy videos
* nL three annotators, our annotation shows a substantial agreement:
  Fleiss’ Kappa K=0.743, Krippendorf’s alpha α=0.798
  * annotators were graduate students who were paid an agreed-upon fixed
    compensation for the annotation task, and consent was obtained to use the
    collected data for research and public release
* We extend MUStARD++ by a total of 164 instances, out of which 91 are sarc
  * the majority label among the three for sarcastic/non-sarcastic
  * no difference in the sarcasm-type annotation among the majority of
    annotators for the final label

|      | MUStARD++ | Balanced | Combined | MUStARD++ % | Combined % | % Change |
|----- |-----------|----------|----------|-------------|------------|----------|
|PRO   |       333 |       37 |      370 |      55.408 |     53.545 |   -1.862 |
|ILL   |       178 |       15 |      193 |      29.617 |     27.931 |   -1.686 |
|EMB   |        87 |       35 |      122 |      14.476 |     17.656 |   +3.180 |
|LIKE  |         3 |        3 |        6 |       0.499 |      0.868 |   +0.369 |
|TOTAL |       601 |       90 |      691 |     100.000 |    100.000 |          |

### License & Potential Negative Impact

* our data extension, raw annotations, and code under the CC-BY-NC-4.0 3
* the same as MUStARD++

# 4 Methodology

## 4.1 Video & Text Backbone: ViFi-CLIP 

* Rasheed+ [12] propose a new approach for video learning that uses 
  fine-tuned CLIP models. 
* CLIP is a large-scale pre-trained model which learns to 
  map images and text to a shared embedding space- allowing it to 
  learn visual and semantic features from images.
* ViFi-CLIP: fine-tuning CLIP models on a small dataset of videos can 
  * improve the performance of video learning models on a variety of tasks;
    particularly because fine-tuning allows the CLIP models to learn 
    temporal information which is not the case with the original CLIP model
  * evaluated on video learning benchmarks, and it outperformed the exist SOTA
* Given a video sample V i ∈ R T ×H×W ×C with T frames and text label Y 
  * CLIP image encoder to encode the T frames independently as a batch of images
  * output: frame level embeddings x i ∈ R T ×D . 
  * temporal learning: the frame-level embeddings are aggregated 
    using an average-pooling operation to obtain a video-level representation v
  * During training, the authors maximize the cosine similarity between video
    embeddings from the video encoder and text embeddings obtained from CLIP’s
    text encoder, for text corresponding to each video. 
  * We utilize ViFi-CLIP’s video encoder (V1), and the text encoder (T1)
    * in combination and also separately for experimentation

## 4.2 Audio Backbone: Wav2vec2 Self-supervised model

* masked learning objective to predict missing frames from the context.
* Intermediate features from Wav2vec2 have been widely explored in the
  literature to extract contextualized features for related downstream tasks or
  even fine-tune the entire model on auxiliary tasks. It consists of 
* three sub-modules, 
  feature encoder, transformer module, and quantization module.
  * Feature encoder is a multi-layer CNN that processes the input signal into
    low-level features. Based on this representation, the 
  * transformer module is further applied to produce contextualized
    representation.
  * quantization module discretizes the low-level features into a trainable
    codebook. To train the model, part of the low-level features are masked from
    the transformer module, and the objective is to identify the quantized
    version of the masked features based on its context.

### 4.2.1 Fine-tuning Wav2vec2 on Speech Emotion Recognition 

* SER and sarcasm recognition are related 
  * understanding and interpreting the emotions and intentions behind the speech
  * not directly correlated, 
  * similarity in feature and contextual understanding
  * SER involves analyzing various acoustic and linguistic cues, such as 
    pitch, intensity, speech rate, prosody, and word choice. Similarly, 
  * sarcasm detection requires understanding the context, the speaker’s
    intention, and subtle linguistic cues, such as 
    intonation, emphasis, and contradictory statements, to recognize sarcasm
  * We hypothesize that fine-tuning on speech emotion recognition can help the
    model better understand contextual cues, speaker intentions, and subtle
    linguistic nuances, which are crucial for detecting sarcasm. Additionally,
* SER is a more widely explored task with a comparatively larger datasets,
  fine-tuning can help leverage knowledge and representations learned during
  pre-training providing improved generalization that can benefit sarcasm
* can help especially when dealing with diverse and varied sarcastic speech
* domain mismatch ~> Task Adaptive Pre-Training [TAPT] [50], is an existing NLP
  fine-tuning strategy that was proposed to resolve the domain shift by
  continuing the pre-training process on the target dataset. [47] introduced a
  * Psuedolabel-TAPT [47], which modifies the TAPT objective to learn
    contextualized emotion representations. Experiments show that P-TAPT
    * better than TAPT, especially under low-resource settings.
* we fine-tune the existing wav2vec2 model on the IEMOCAP dataset for the SER
  task. The embeddings to be extracted for sarcasm detection are kept the same
  as the ones extracted above. 
* We later provide an empirical analysis of both the pre- and post-fine-tuning
  features, as a part of the training for the sarcasm recognition task.

## 4.3 Text Backbone: BART

* Bidirectional and Autoregressive Transformers (BART) [51] is 
  a denoising autoencoder designed to reconstruct the original document 
  from a corrupted version. It employs 
  * a sequence-to-sequence model with a bidirectional encoder to process the
    corrupted text and 
  * a left-to-right autoregressive decoder.
* pre-training: the negative log-likelihood of the uncorrupted document.
* other denoising autoencoders are specifically designed for particular noise
  patterns, BART can handle various types of document corruption.
  * In the most extreme scenario, where all source information is lost, BART
    functions as a language model. Additionally, 
  * as a sequence-to-sequence model, BART can be utilized for eg summarization,
    question answering, and translation.
* BART generates a feature vector x t ∈ R d t for each instance x. To transform
* we utilize the BART Large model with d t set to 1024. By 
  * taking the average of the representations from the last four transfor layers
  ~> a distinctive embedding repr for both the utterance and the context

# 5 Benchmarking & Data Distribution

* with and without contextual information, we perform several ablation studies
* the same multimodal fusion mechanism used by Ray 2022 [2], ie a collaborative
  gated attention architecture [7]

## Training Details We perform our experiments on a single NVIDIA RTX A5500 GPU

* we report the average of 5-fold cross-validation, where each fold is created
  using stratified K-fold separation, ensuring minimal skewness across the
  validation set in terms of the type of sarcasm

## Results. Experiments separately on the MUStARD++ and MUStARD++ Balanced

* the backbone architecture that was used to extract the features
  * T - BART [51], 
  * T1 - Text encoder from ViFiCLIP, 
  * V - Average pooled intermediate ResNet[2], 
  * V1 - Video encoder from ViFiCLIP, 
  * A - Average pooled spectral features (MFCC) [2], 
  * A1 - wav2vec2, 
  * A2 -wav2vec2 fine-tuned on SER
* bold shows the best-performing modality combination
* underlined values: task perf better without context
  * For all other cases, models with contextual information outperform
* MUStARD++: the proposed benchmarking is superior to the prior work [2], ie T ,
  A and V backbones, where we surpass each unimodality with 1.59%, 2.19% and
  1.44%
* fusing all modalities, we achieve a 3.89% and 3.39% improvement against the
  SOTA - T + A + V , when training utterances without context and with context,
  respectively. With the new encoders from pre-trained models, we report SOTA
* backbones: 
  * audio: the embeddings derived from the wav2vec2 model fine-tuned on the SER
    task (A2), surpass both the spectral features (A) and the ones derived from
    the wav2vec2 model trained on an ASR task (A1), by a substantial margin.
  * video encoder (V 1) and the text encoder (T 1) from the pre-trained ViFiCLIP
    model outperform both their corresponding unimodal prior arts (V and T ,
    respectively)
  * We hypothesize this is primarily because of the 
    * contrastive objective utilized in ViFiCLIP and the 
    * large-scale training data in the CLIP pre-training
* modalities, the textual embeddings are more indicative of sarcasm 
  than the audio and video embeddings
  * audio: mismatch between 
    clean speech that was used to pre-train wav2vec2 (and even after fine-tuning
    on the SER task) and the 
    noisy speech often superimposed with the background laughter, which is in a
* MUStARD++ Balanced: the highest macro F1-scores of 
  0.732 and 0.736 are obtained by combining all three modalities 
  (when training without context and with context, resp)

## 5.1 Exploring the Distribution shift introduced as a result of our extension,

* we compare the V 1 + T 1 + A2 configured model, trained 
  with and without the extended annotations on a common test set. Formally, we
  * 50 and 200 samples from the original MUStARD++ dataset for val and test
  * equal distribution amongst all sarcasm types, and use it 
* merging the samples with our proposed extension helps improve the individual
  class-wise accuracies, and, eventually, an absolute improvement in the mean
  macro-F1 score of 0.95.
  * improvement in the accuracies of three prominent types of sarcasm, namely,
    Propositional, Illocutionary and Embedded
  * also improvement in the accuracy of non-sarcastic utterances. 
  * We hypothesize this is particularly because 
    * intra-cluster variances among sarcastic types are now more defined, and 
    * inter-cluster deviation between sarcastic and non-sarcastic is better
      separated, 
    * owing to well-defined intra-clusters in the shared latent space, 
      and the addition of new non-sarcastic instances.

### Discussion

* literature: Illocutionary sarcasm is the most challenging
* the majority of the samples misclassified by our model are short ones (< 2 s),
  * not enough context
* Fig 1: In the captions, we show the utterances which are very short
* no distribution shift experiment for Like-prefixed sarcasm because
  not enough samples for a test set

# 6 Conclusion

* future
  * extending the dataset with new instances, especially for Illocutionary and
    Like-prefixed sarcasm types
  * more feature fusion approaches
  * short term: identify instances which are < 2 seconds in length and 
    prune them from the data as they do not have sufficient context
  * multi-task: sarcasm, humour, and emotion,
    * three or more tasks under this sentiment umbrella

# Limitations
