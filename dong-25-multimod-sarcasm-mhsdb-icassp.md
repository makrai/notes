MHSDB: A Comprehensive Benchmark for Multimodal Humor and Sarcasm Detection
  Leveraging Foundation Models
Zhongren Dong; Donghao Wang; Ciqiang Chen; Dong-Yan Huang; Zixing Zhang
ICASSP 2025 IEEE Intl Conference on Acoustics, Speech and Signal Proc

# Abstract:

* comparisons hindered by inconsistencies in
  feature extraction, evaluation methods, and exper setups
* we propose the Multimodal Humor and Sarcasm Detection Benchmark (MHSDB)
  * the first unified evaluation platform specifically designed for these tasks
  * combines four datasets in English and Hindi
  * standardizes feature extraction and evaluation processes
* we evaluate mainstream foundation models across audio, video, and text
  * Unimodal representations are assessed using self-attention mechanisms, while
  * multimodal fusion strategies, including utterance-level and sequence-level
* multimodal approaches outperform unimodal ones in capturing complex contexts

# I.  Introduction

* humor and sarcasm
  * Humor often involves irony or exaggeration, while
  * sarcasm: delicate interplay of vocabulary, gestures, and tone
* multimodal approaches combine audio, textual, and visual info [5]–[8]
  * attention-based fusion methods [5] effectively capture multimodal inconsis,
    which is particularly useful in sarcasm detection, where
    emotional conflicts often arise across modalities
  * the Multimodal Interactive Learning (MIL) framework [6] further
    aligns textual information with visual or auditory cues, leading to
    notable improvements in both sarcasm and sentiment analysis tasks
  * humor detection, the Hybrid Multimodal Fusion Model (HMF-MD) [7]
    * demonstrated in the MuSe 2022 challenge
    * integrates multiple modalities in a structured manner, outperform simpler
  * For scenarios with limited data, the MuLOT model [8]
    * multi-head self-attention and optimal transport techniques
* challenges in multimodal humor and sarcasm detection remain
  * old, modality-specific features
  * speech: handcrafted features
  * video: conventional pretrained models like ResNet [6, 9, 10],
    instead of utilizing more recent foundational models
* diverse feature extractors across studies leads to
  considerable variation in the extracted information
  * handcrafted features [6, 9, 10] vs deep features [11, 12]
* inconsistent evaluation methods complicate fair comparisons, eg MUStARD++ [13]
  * some studies employ five-fold crossvalidation [5, 13]
  * others use custom dataset splits [6, 14]
* we propose the Multimodal Humor and Sarcasm Detection Benchmark (MHSDB), a
  unified benchmark
  * standardize datasets, feature extraction, and multimodal fusion strategies
  * a consistent platform for fair comparisons, utilizing mainstream
    foundation models, such as HuBERT [15], GTE [16], and CLIP [17],
    for feature extraction

# II.  Benchmark

* MHSDB is a comprehensive benchmark for multimodal humor and sarcasm detection,
  integrating multilingual and multitask datasets across audio, video, and text
* standardized evaluation criteria for consistent assessment of models

## A. Tasks and Datasets

| Dataset                 | Year | Task    | Language | #Utts  | #Hrs  |
| ----------------------- | ---- | ------- | -------- | ------ | ----- |
| UR-FUNNY [18]           | 2019 | Humor   | English  | 16,514 | 22.81 |
| M2H2 [9]                | 2022 | Humor   | Hindi    |  6,191 |  4.46 |
| MUStARD++ [13]          | 2022 | Sarcasm | English  |  1,202 |  1.74 |
| MUStARD++ Balanced [19] | 2023 | Sarcasm | English  |  1,365 |  1.98 |

* two languages: English and Hindi, facilitating cross-lingual and cross-cult
* Table 1 summarizes the datasets:
* en: UR-FUNNY [18], MUStARD++, MUStARD++ Balanced [19] for English, and
* hi: M2H2 [9] for Hindi.
* These datasets vary in sample size, speaker number, and class distribution,
* two primary tasks: humor detection and sarcasm detection.
* We adhered to official data partitioning protocols where available. For
  * UR-FUNNY is evaluated on its official test set, while
  * M2H2 and MUStARD++ Balanced employ five-fold cross-validation, avg perf
  * MUStARD++, we used “Friends” episodes as the test set, performing five-fold
    cross-validation on the training set and reporting the average results.

## B. Multi-Modal Foundation Models

* Audio Modality
  * models include Wav2vec 2.0 [20], HuBERT, and WavLM [21].
  * HuBERT: * speech segment prediction training, outperforms Wav2vec 2.0
  * WavLM excels in multi-speaker tasks. We also included
  * Data2Vec [22] for unified modality learning, and
  * Emotion2vec [23] and ExHuBERT [24] to capture emotionrelated nuances. For
  * multilingual data, we evaluated XLSR [25], Chinese-HuBERT (HuBERT-CN), and
    Whisper [26], known for its large-scale training.
* Text Modality: We selected
  * optimized BERT variants such as RoBERTa [27], XLNet [28], and DeBERTa [29],
  * contrastive learning models like SimCSE [30], Sentence-T5 [31], and E5 [32].
  * multimodal LLMs such as LLaMA-3.1-8B [33] and Qwen27B [34]
* Video Modality: In video-based humor and sarcasm detection,
  * temporal information is essential.
  * We evaluated VideoMAE [35], DINOv2 [36], and EVA-02 [37],
    known for their multi-scale visual feature extraction capabilities.
  * ResNet-based models like ResNet-MSCeleb and ResNet-FER2013 were used for
    facial expression analysis, which is crucial in detecting humor and sarcasm.
* CLIP, which bridges vision and language, was included for its zero-shot

## C. Evaluation Pipeline

* Fig 1 depicts the complete pipeline for multi-modal humor and sarcasm detect
* unimodal features, a self-attention mechanism was employed to enhance focus on
  relevant cues, particularly suited for Transformer-based models (e. g., BERT,
  RoBERTa, VideoMAE).
  * simple attention-based classifier, similar to MERBench [38], was used.
  * To prevent overfitting and ensure generalization,
    especially for robust models like CLIP and EVA-02
* multimodal fusion, we used
  * utteranc level: mainstream strategies like TFN [39], LMF [40], and MISA [41]
  * seq level: methods like MFN [42] and MulT [43]
  * Models like CLIP and EVA-02 are prioritized for their cross-modal
    understanding, which is essential in this context.
* To ensure consistency with previous studies [9], [13], [18], [19], we have
  * Accuracy (Acc) and F1 Score (F1), commonly used in humor and sarcasm

# III.  Evaluation results and Discussion

## D. Comparison with SOTA Approaches

* To assess the effectiveness of our benchmark, we compared its performance
  against state-of-the-art (SOTA) methods on the four datasets. Table IV shows
  * our approach consistently outperforms existing SOTA methods, demonstrating
  * clear advantages over traditional modal representations (e. g., GLoMo [44],
    TriDiRA [45], and Gaze-Collaborative Gating Mechanism [14]) across various
    evaluation metrics. Additionally, our benchmark
  * surpasses autoregressive generative models like i-Code V2 [46], which
    integrate audio, linguistic, and visual inputs across all datasets.

# IV.  CONCLUSION

* Future work will address four key areas:
  1. Contextual Understanding: Enhancing methods to better capture context
    * potentially through advanced fundation models or novel context encod [48]
  2. Fine-grained Classification of humor and sarcasm
  3. Cross-lingual and Cross-cultural Analysis
  4. Optimization of Fusion Strategies:
    * visual modality representation <~ improve
    * visual-text alignment mechanisms
