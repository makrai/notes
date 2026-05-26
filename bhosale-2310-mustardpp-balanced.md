Sarcasm in Sight and Sound:
  Benchmarking and Expansion to Improve Multimodal Sarcasm Detection
Swapnil Bhosale, Abhra Chaudhuri, Alex Lee Robert Williams, Divyank Tiwari,
  Anjan Dutta, Xiatian Zhu, Pushpak Bhattacharyya, Diptesh Kanojia
arXiv:2310.01430 [cs.CL]

code, extended data, and SOTA benchmark models are made public
https://github.com/spbanonymo/Sarcasm-Sight-and-Sound

* MUStARD++: Sarcasm is multi-modal.  Natural language text
  + manners of speech (like tonality and intonation) and
  + visual cues (facial expression)
* we: a rigorous benchmarking of the MUStARD++ dataset by considering SOTA
  language, speech, and visual encoders, for fully utilizing the totality
  * 2 % improvement in macro-F1 over the existing benchmark
* imbalance in the `sarcasm type' category in MUStARD++,
* we propose an extension, which we call  _MUStARD++ Balanced_, benchmarking the
  same with instances from the extension split across both train and test sets,
  * a further 2.4 % macro-F1 boost
  * new clips taken from a novel source -- the TV show, House MD, which
  * adds to the diversity of the dataset, and were
  * manually annotated by multiple annotators with substantial inter-annotator
    agreement in terms of Cohen's kappa and Krippendorf's alpha

# 1 Intro

* many NLP tasks under the sentiment umbrella through multimodality [3–6]
* MUStARD [1], a multi-modal sarcasm detection dataset, was introduced
  * information from all three associated modalities, ie, text, speech, and
    video
  * MUStARD++ [Ray+ 2] recognized underlying emotions to be a crucial
    * an extension of MUStARD with emotion annotations, and an expansion on the
      number of instances
    * the above works encode the individual modalities through
      independent text, speech, and vision modules, and
      combining their respective representations via a fusion layer [7]
* two limitations in the existing multi-modal sarcasm detection benchmarking
  * only classical encoding approaches of the individual modalities
    * MUStARD++, which is one of the most recent benchmarks in the literature,
    * Mel Frequency Cepstral Coefficients (MFCC), Mel spectrogram (using the
      Librosa library [8]), prosodic features from OpenSMILE [9] for speech, and
    * ResNet-152 [10] for videos, which cannot fully leverage the
      complementarity in the multi-modal information available in the datasets
  * the ‘sarcasm type’ category in MUStARD++ exhibits an imbalance
* we aim to bridge these gaps by rigorous benchmarking based on SOTA vision,
  speech, and language encoders
* we also expand the MUStARD++ dataset by adding new instances that alleviate
  this imbalance to a certain degree
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
* we cure the ‘sarcasm type’ category imbalance in MUStARD++, we propose an
  extension, we call, MUStARD++ Balanced
  * publicly available clips in our extension are taken from the TV show, House
    MD, which, apart from curing the imbalance, also adds diversity
  * annotated by three independent annotators who show a substantial
    inter-annotator agreement in terms of Cohen’s kappa and Krippendorf’s alpha
  * We split the clips in our extension across both train and test sets, and
  * further benchmarking using our proposed setup
  * further 2.4% boost to macro-F1 from using our extension
* additional expers quantify the distribution shift introed by our extension
* contributions:
  * rigorous benchmarking for multi-modal sarcasm detection on MUStARD++
    * using SOTA vision, speech, and language models
  * MUStARD++ Balanced: an extension to the MUStARD++ dataset
    * to cure the ‘sarcasm type’ imbalance in the former, and for data
      diversity; and
  * extensive experiments that show the
    significant gains in macro-F1 obtained by using our proposed benchmarking
    strategy, as well as from using our novel, balanced extension

# Related Work

## 2.1 Sarcasm Detection

* linguistic perspective to sarcasm detection
  * [15] used a pattern-based approach for the task
    * four sets of features obtained based on different sarcasm types
    * 83.1% accuracy and 91.1% precision on the task of sarcasm detection
  * [16] and [17] used a Naive Bayes and Decision Tree model, respectively
    * the best F1 scores over 70 on their chosen datasets
* SemEval 2018 Shared Task 3
  * [18], [19] offered an RCNN-RoBERTa methodology, where a
    * RoBERTa transformer was used with BiLSTM to enhance task performance
    * F1-score of 90.0 on the Riloff dataset [20]
* Several recent methods for sarcasm detection using text are discussed by [21]
  * A BERT [22] model without concatenated layers,
    BERT encodings with a Logistic Regression model, and other language models
  * IAN [23] that are trained and assessed on a Twitter-based sarcastic dataset
  * F1-score of 73.4 in those evaluations, the BERT language model, without any
    additional layers, performs the best
  * in Arabic [24], where an extensive set of experiments are performed on
    different transformer architectures, that include mBERT, XLM-RoBERTa [25]
    and language-specific models like MARBERT [26] (low-resource setting)
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

* benchmarks on the MUStARD dataset [46, 1, 2] do
  not consider the latest developments
  in multi-modal vision-language fusion [11, 12] and speech processing [47]
  * Chauhan+ [48] annotated MUStARD with 9 emotion labels
  * refined and extended by Ray+ [2] in MUStARD++ by adding valence and arousal
    * V & A are important indicators for recognizing the emotion
    * as well as adding further data points. Table 1 summarizes the statistics

| Dataset                   | Sarc | Non-Sarc | Total |
| --------------------------|----: |-------:  | ----: |
| MUStARD                   |  345 |    6020  |  6365 |
| MUStARD++                 |  601 |     601  |  1202 |
| MUStARD++ Balanced (ours) |  691 |     674  |  1365 |

## 3.1 Dataset Extension

* MUStARD++ categorised their data points by adding the ‘sarcasm type’
  * Propositional (PRO): Remarks that need additional context to be classified
                         eg "That’s very kind of you."
  * Illocutionary (ILL): the irony is expressed through non-textual cues, like
    voice or (facial) gesture. For example, while tasting a poorly cooked food,
    one may remark, "How delicious!", while expressing their contempt through
  * Embedded (EMB): incongruity is clearly embedded in the text
    eg "What a pleasant orchestra of honking cars!"
  * Like-Prefixed (LIKE): Prefixes the statement with a "like" to stress the
    irony. For example, "Like it means the end of the world!".
* A lack of balance in a sarcasm detection dataset among the above types can
* Table 2 shows our (unsuccessful) attempt: the ratios change at most 3 %
* under representation of samples in the EMB and the LIKE types, when compared

### Data Validation & Analysis Per our annotators, sarcasm annotation and its

* cognitively cumbersome; thus, our annotation task spanned longer than
  anticipated.
* Multimodal data annotation is further challenging: lengthy videos
* nL three annotators, our annotation shows a substantial agreement (0.743)
  using Fleiss’ Kappa (K), and (0.798) Krippendorf’s alpha (α). All three
  * annotators were graduate students who were paid an agreed-upon fixed
    compensation for the annotation task, and consent was obtained to use the
    collected data for research and public release.
* We extend MUStARD++ by a total of 164 instances, out of which 91 are sarc For
  * the majority label among the three for sarcastic/non-sarcastic. There was
  * no difference in the sarcasm-type annotation among the majority of
    annotators for the final label.

### License & Potential Negative Impact We license

* our data extension 2 , raw annotations, and code under the CC-BY-NC-4.0 3
* the same as MUStARD++.

|      | MUStARD++ | Balanced | Combined | MUStARD++ % | Combined % | % Change |
|----- |-----------|----------|----------|-------------|------------|----------|
|PRO   |       333 |       37 |      370 |      55.408 |     53.545 |   -1.862 |
|ILL   |       178 |       15 |      193 |      29.617 |     27.931 |   -1.686 |
|EMB   |        87 |       35 |      122 |      14.476 |     17.656 |   +3.180 |
|LIKE  |         3 |        3 |        6 |       0.499 |      0.868 |   +0.369 |
|TOTAL |       601 |       90 |      691 |     100.000 |    100.000 |          |

# Benchmarking & Data Distribution

* with- and without contextual information, we perform several ablation studies
* the same multimodal fusion mechanism used by Ray 2022 [2], iea collaborative
  gated attention architecture [7]. Further, we perform experiments only for the

## Training Details We perform our experiments on a single NVIDIA RTX A5500 GPU

* we report the average of 5-fold cross-validation, where each fold is created
  using stratified K-fold separation, ensuring minimal skewness across the
  validation set in terms of the type of sarcasm. Each experiment is run for a

## Results We perform experiments separately on the MUStARD++ and MUStA Balanced

* the backbone architecture that was used to extract the features, more
  * T - BART [51], T1 - Text encoder from ViFiCLIP, V - Average pooled
    intermediate ResNet[2], V1 - Video encoder from ViFiCLIP, A - Average pooled
    spectral features (MFCC) [2], A1 - wav2vec2, A2 -wav2vec2 fine-tuned on SER.
* bold show the best-performing modality combination, whereas the
* underlined values highlight the cases where task perf better without context
  . For all other cases, models with contextual information outperform the
  models without contextual information.
For the MUStARD++ dataset, it is clearly evident that the proposed benchmarking
is superior and more robust compared to the prior work [2], ie T , A and V
backbones, where we surpass each unimodality with 1.59%, 2.19% and 1.44% across
* fusing all modalities, we achieve a 3.89% and 3.39% improvement against the
  SOTA - T + A + V , when training utterances without context and with context,
  respectively. With the new encoders from pre-trained models, we report SOTA
* backbones: the embeddings derived from the wav2vec2 model fine-tuned on the
  SER task (A2), surpass both the spectral features (A) and the ones derived
  from the wav2vec2 model trained on an ASR task (A1), by a substantial margin.
  Likewise, the video encoder (V 1) and the text encoder (T 1) from the
  pre-trained ViFiCLIP model outperform both their corresponding unimodal prior
  arts (V and T , respectively). We hypothesize this is primarily because of the
  contrastive objective utilized in the training of ViFiCLIP and the large-scale
  training data that has been exposed to the model as a part of the CLIP
  pre-training.
* modalities, the textual embeddings are more indicative of the sarcasm
  detection task than the audio and video embeddings. For
  * audio: mismatch between clean speech that was used to pre-train wav2vec2
    (and even after fine-tuning on the SER task) and the noisy speech often
    superimposed with the background laughter, which is in a clear mismatch with
* A similar trend is observed when evaluating our approach on the MUStARD++
  dataset with our pro- posed extension, wherein the highest macro F1-scores of
  0.732 and 0.736 are obtained by combining all three modalities, when training
  utterances without context and with context, respectively.

## 5.1 Exploring the Distribution shift introduced as a result of our extension,

* we compare the V 1 + T 1 + A2 configured model, trained with and without the
  extended annotations on a common test set. Formally, we segment out two sets,
* merging the samples with our proposed extension helps improve the individual
  class-wise accuracies, and, eventually, an absolute improvement in the mean
  macro-F1 score of 0.95.
  * improvement in the accuracies of three prominent types of sarcasm, namely,
    Propositional, Illocutionary and Embedded, we also find an
  * improvement in the accuracy of non-sarcastic utterances. We hypothesize this
    is particularly because (a) intra-cluster variances among sarcastic types
    are now more defined, and (b) inter-cluster deviation between sarcastic and
    non-sarcastic is more well separated, owing to well-defined intra-clusters
    in the shared latent space of our model, and the addition of new
    non-sarcastic instances.

### Discussion

* argued in the literature that Illocutionary sarcasm is the most challenging
* the majority of the samples mis-classified by our model are the ones with
  short duration (< 2 seconds), and hence do not contain enough context, to be
* Fig 1: In the captions, we show the utterances which are very short
* no distribution shift experiment for Like-prefixed sarcasm we did
  not enough samples for a test set. However, our experiment does reveal that

# 6 Conclusion

* future
  * extending the dataset with new instances, especially for Illocutionary and
    Like-prefixed sarcasm types, and experiment with
  * more feature fusion approaches. In the
  * short term, we plan to identify instances which are < 2 seconds in length
    and prune them from the data as they do not have sufficient context. We
  * multi-task: sarcasm, humour, and emotion,
    * three or more tasks under this sentiment umbrella

# Limitations
