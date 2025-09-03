    The Interspeech 2025 Challenge on Speech Emotion Recognition in Natur Cond
    AR Naini, L Goncalves, A N. Salman, P Mote, I R. Ulgen, T Thebaud, LM Velazquez,
      L Paola Garcia, N Dehak, B Sisman, C Busso
    Interspeech 2025

# Abstract

* We highlight the effectiveness of combining audio and text-based foundational
  models to achieve robust SER systems. The competition
* [website, with leaderboards, baseline code, and instructions](https://lab-msp.com/MSP-Podcast_Competition/IS2025/)
* conclu
  * **class imbalance**, particularly in categorical emotion recognition
    * Despite the use of advanced loss functions
      eg focal loss and class-weighted cross-entropy, cls imb remains a chall
  * predicting **extreme values in emotional attributes**
    eg very high arousal or very low dominance proved difficult, with
    most models gravitating toward mid-range values
  * **simpicity**: large multimodal models combining speech and text features
    * Teams that integrated multiple self-supervised learning models and
      text-based foundational models faced
      high computational costs and complex optimization strategies
    * trade-off between model complexity and generalization remains
  * **gender** bias and variability across speaker demographics require more

# 4. Observations and Findings

classification

| Team Name     | Speech Foundational Models | Other Foundational Models | Losses & Metrics  | Class Imbalance | Multi-Task | F1 Macro |
|---------------|----------------------------|---------------------------|-------------------|-----------------|------------|----------|
| [NTUA](/chatzichristodoulou-25-interspeech-ser-msp-classif-1st.md) [19] | WavLM, Whisper, HuBERT | RoBERTa, ModernBERT | CrossEntropy, F1 | Soft Labels | Yes | 0.4316 |
| [SAIL (cls)](/feng-25-interspeech-ser-msp-classif-2nd.md) [20] | Whisper | RoBERTa | KLD Loss | Data Aug | Yes | 0.4281 |
| ABHINAYA [21] | WavLM, SALMONN | LLaMA-3 | [Focal Loss](https://github.com/itakurah/Focal-loss-PyTorch) | Weighted Loss | No | 0.4181 |
| Voinosis [22] | WavLM, Whisper, HuBERT     | BERT, T5                  | CrossEntropy      | Class Weights   | No         | 0.4101   |
| UNICAMP [23]  | WavLM, Whisper, HuBERT     | RoBERTa, DeBERTa          | Weighted-CE, Rank | Batch Balancing | No         | 0.4094   |
| NU [24]       | Whisper, HuBERT            | RoBERTa, GPT-4            | CrossEntropy      | Weighted Loss   | No         | 0.4033   |
| BSC-UPC [25]  | Wav2Vec2, WavLM, Whisper   | RoBERTa, DeBERTa          | F1, Focal Loss    | Weighted Loss   | No         | 0.4006   |
| SRPOL [26]    | WavLM, Whisper             | RoBERTa                   | Weighted CE       | Weighted Loss   | No         | 0.3784   |

dimensions

| Team Name       | Speech Foundational Models | Other Foundational Models | Losses & Metrics | CCC Avg |
|-----------------|----------------------------|---------------------------|------------------|---------|
| [SAIL (dim)](/lertpetchpun-25-interspeech-ser-msp-dims-1nd.md) [27] | WavLM, Whisper | RoBERTa | 1-CCC | 0.6076 |
| [SRPOL](/zgorzynski-25-interspeech-ser-msp-dims-2nd.md) [26] | WavLM, Whisper | RoBERTa | BSE, MSE Losses | 0.6003 |
| SEU AIPLab [28] | Wav2Vec2, Whisper, HuBERT  | no                        | 1-CCC            | 0.5955  |
| Voinosis [22]   | WavLM, Whisper, HuBERT     | BERT, T5                  | 1-CCC            | 0.5928  |
| ABHINAYA [21]   | WavLM, SALMONN-13B         | no                        | 1-CCC            | 0.5871  |


* 93 research teams participated in the challenge, submitting
  * 166 entries to task 1 (categories) and 111 to task 2 (attributes)
  * $>$ baseline
    * 28 teams submitted classification results for task 1 that were better
    * 10 teams submitted predictions for task 2 that were better
* This section: information provided by the teams that
  outperformed the baselines of the corresponding tasks and responded to us
  (17 for task 1, 8 for task 2)
  * focuses on the categorical task, given that
  * similar architecture choices were used for the attribute prediction task
  * slight variations in loss functions and training strategies
* Foundational models: Most top-performing teams employed multimodal frameworks,
  combining speech and text-based foundational models [15, 29, 30] (76%)
  * speech encoding, WavLM [17] (70%) and Whisper [31] (47%) were the most
  * RoBERTa [32] (53%) and LLaMA (24%) were frequently used for text-based
  * advanced foundational models such as LLaMA-3 [33] (24%), GPT-4 [34] (18%),
    and ModernBERT [35] (5%), underscoring the growing trend
  * **cross-modal attention** mechanisms to better integrate speech and text
    * UNICAMP team extended conventional architectures by combining audio, text,
      and paralinguistic features through cross-attention blocks, enabling
    * ABHINAYA explored fine-tuning SALMONN [36] for SER tasks and combined it
      with speech-text fusion using LLaMA-3 [33] to boost accuracy
* **ensemble:** Ensemble learning emerged as a key strategy for improvment (95%)
  * NTUA team achieved high performance by employing an ensemble of 14 independently trained fusion models
    * deep hierarchical fusion
  * UNICAMP trained a fivefold stratified RandomForest meta-model on the logits
    from multiple architectures for more robust predictions
  * ABHINAYA employed a majority voting strategy across five classifiers,
    ensuring a balance between stability and accuracy
* Data augmentation: Data augmentation played a significant role in 60%, where
  * noise addition and reverberation or
  * label augmentation using detailed individual annotations
  * SAIL team introduced an augmentation strategy similar to Lotfian+ [37],
    * two training audios were mixed with partial overlaps, and the resulting
      label was an average of the two audio samples
* Training process: optimization and loss functions
  * fine-tuned their speech foundational models, allowing them to adapt to
  * classification
    * Weighted cross-entropy loss for addressing class imbalance (70%)
    * focal loss [38] (18%) employed by some teams to focus on hard-to-classify
  * attribute prediction, most teams used the one-minus concordance correlation
    coefficient (1-CCC) loss (87%) to ensure stable and consistent performance
    across arousal, valence, and dominance
* Class imbalance
  * SAIL team introduced label augmentation by removing a subset of annotator
    labels at random and recalculating the label distribution,
    improving robustness against noisy annotations
  * batch balancing and inverse frequency weighting
* Computational efficiency strategies:
  * Adaptive learning rate scheduling, such as
    cosine annealing and exponential decay
  * gradient accumulation allowed many teams to train larger models with limited
    hardware resources, optimizing their training processes without comprom perf

# 5. Top Performing Model Evaluations

* Figure 3(a) presents the confusion matrix for the top-performing submission
  * Contempt and fear remain the most challen, frequently misclassified as anger
  * some improvement is observed in recognizing fear compared to previous
    challenge submissions [7], class imbalance remains a significant issue, as
  * among minority emotions, negative emotions (fear, disgust, and contempt) are
    more prone to being misclassified compared to their positive counterparts
    (surprise)
* Figures 3(b--d) present the confusion matrices for the top-performing
  submissions for arousal (SAIL), valence (BIIC) and dominance (SAIL),
  * predicting extreme attribute scores (eg very high or very low values for
    arousal, valence, and dominance) is particularly challenging. As
    * most samples with extreme attribute values tend to be predicted toward the
      neutral bins. This pattern is
    * especially prominent for low-arousal, low-dominance, and high-valence
* Figure 4 compares the baseline with fusion results of top submissions for
  categorical and attribute-based tasks. The plot includes top1 submissions and
  ensemble-based approaches (Top3, Top5, Top10)
  * Categorical labels are derived using a plurality vote, and
  * attribute scores are obtained by averaging predictions across the top
  * improvement
    * categorical emotion recognition and valence prediction shows significant
      improvement through ensemble methods, with valence reaching a CCC of 0.734
      when combining the top five submissions. In contrast,
    * arousal and dominance prediction show minimal benefit from ensemble
* The primary distinction between top submissions lies in their use of diverse
  text-based foundational models
  * ie valence prediction can be substantially improved through model diversity

# Ref

19. G. Chatzichristodoulou, D. Kosmopoulou, A. Kritikos, A. Poulopoulou,
  E.  Georgiou, A. Katsamanis, V. Katsouros, and A. Potamianos,
  “Medusa: A multimodal deep fusion multi-stage training framework for SER natur
  Interspeech 2025,
20. T. Feng, T. Lertpetchpun, D. Byrd, and S. Narayanan,
  Developing a top-tier framework in naturalistic...: From speech foundation
  models and learning objective to data augmentation and engineering choices
  Interspeech 2025,
27. T. Lertpetchpun, T. Feng, D. Byrd, and S. Narayanan
  Developing a high-performance framework for...: emotional attribute prediction
  Interspeech 2025
26. B. Zgórzyński, J. Wójtowicz-Kruk, P. Masztalski, and W. Średniawa,
  Multi-task learning for SER in naturalistic conditions
  Interspeech 2025
