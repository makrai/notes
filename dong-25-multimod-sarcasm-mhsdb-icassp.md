MHSDB: A Comprehensive Benchmark for Multimodal Humor and Sarcasm Detection
  Leveraging Foundation Models
Zhongren Dong; Donghao Wang; Ciqiang Chen; Dong-Yan Huang; Zixing Zhang
ICASSP 2025 2025 IEEE Intl Conference on Acoustics, Speech and Signal Proc

# Abstract:

* comparisons hindered by inconsistencies in feature extraction, evaluation
  methods, and exper setups across different approaches
* we propose the Multimodal Humor and Sarcasm Detection Benchmark MHSDB 
  * the first unified evaluation platform specifically designed for these tasks.
  * combines four datasets in English and Hindi and 
  * standardizes feature extraction and evaluation processes
* we evaluate mainstream foundation models across audio, video, and text
  * Unimodal representations are assessed using self-attention mechanisms, while
  * multimodal fusion strategies, including utterance-level and sequence-level
* multimodal approaches outperform unimodal ones in capturing complex contexts

# I.  Introduction

* humor and sarcasm
  * Humor often involves irony or exaggeration, while 
  * sarcasm: delicate interplay of vocabulary, gestures, and tone. 
* multimodal approaches combine audio, textual, and visual info [5]–[8].
  * attention-based fusion methods [5] effectively capture multimodal
    inconsistencies, which is particularly useful in sarcasm detection, where
    emotional conflicts often arise across modalities.
  * the Multimodal Interactive Learning (MIL) framework [6] further
    aligns textual information with visual or auditory cues, leading to
    notable improvements in both sarcasm and sentiment analysis tasks.
  * humor detection, the Hybrid Multimodal Fusion Model (HMF-MD) [7]
    * demonstrated in the MuSe 2022 challenge
    * integrates multiple modalities in a structured manner, outperform simpler
  * For scenarios with limited data, the MuLOT model [8]
    * multi-head self-attention and optimal transport techniques
* challenges in multimodal humor and sarcasm detection remain
  * modality-specific features
  * handcrafted features for speech and 
  * conventional pretrained models like ResNet for video [6], [9], [10],
    instead of utilizing more recent foundational models
* diverse feature extractors across studies leads to considerable variation in
  the extracted information, with some focusing on handcrafted features [6],
  [9], [10] and others on deep features [11], [12].
* inconsistent evaluation methods complicate fair comparisons; for instance,
  eg MUStARD++ [13]
  * some studies employ five-fold crossvalidation [5], [13], while 
  * others use custom dataset splits [6], [14].
* we propose the Multimodal Humor and Sarcasm Detection Benchmark (MHSDB), a
  unified benchmark designed to standardize datasets, feature extraction
  methods, and multimodal fusion strategies. MHSDB provides 
  * a consistent platform for fair comparisons, utilizing mainstream foundation
    models, such as HuBERT [15], GTE [16], and CLIP [17], for feature
    extraction

# II.  Benchmark

# III.  Evaluation results and Discussion

# IV.  CONCLUSION

* Future work will address four key areas: 
  1. Contextual Understanding: Enhancing methods to better capture context in
    * potentially through advanced fundation models or novel context encod [48] 
  2. Fine-grained Classification of humor and sarcasm, which may involve
  3. Cross-lingual and Cross-cultural Analysis: Extending research into
  4. Optimization of Fusion Strategies: Improving 
    * visual modality representation and designing better 
    * visual-text alignment mechanisms.
