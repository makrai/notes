Odyssey 2024 Speech Emotion Recognition Challenge:
  Dataset, Baseline Framework, and Results
Lucas Goncalves, Ali N. Salman, Abinay R. Naini, Laureano Moro Velazquez,
  Thomas Thebaud, Leibny Paola Garcia, Najim Dehak, Berrak Sisman, Carlos Busso

baseline: https://huggingface.co/3loi

# 4. Baseline

* The overall structure of our baseline 2 is illustrated in Figure 4
  * two main modules
* The Fine-Tuned (FT) module integrates components from a pre-trained
  Self-Supervised Learning (SSL) model, specifically WavLM [4]

## 4.1 Implementation details


* classification
  * to address the issue of class imbalance, our training objective utilizes
    a weighted multi-class cross-entropy (CE) loss
    * to address the class imbalance problem (while the train and development
      set are unbalanced across emotions, the test set is balanced)
    * assigns more significance to the less frequent classes
    * we adjust the weight parameter of the CE loss to
      the inverse frequency of each class
    * ie higher weights to less frequent classes
    * weighted CE loss is defined as follows
* attributes prediction (task 2), we use a single task setup, where we train a
  separate regression model for arousal, valence, and dominance
  * loss on emotional attribs: concordance correlation coefficient (CCC, eq 2)
  * measures the agreement between the true and predicted emo attribute scores
  * Our model’s training objective is to optimize the CCC, aiming to achieve a
    high correlation between predicted and actual scores
    while minimizing prediction errors

# 5. Results and Findings

* strategies, technical advancements, and shared challenges
* 47 teams signed up for the challenge and requested the corpus
  * 31 submitted to task 1 and 13 submitted to task 2
  * At the close of the challenge submission period, we reached out to the
    participants, inviting them to participate in a survey
    * to gather detailed information about their implementations
* Table 3 shows a brief compilation of team’s approaches who have responded
  * Teams that have responded to our survey focused on task1 for the most part
  * two teams doing on both task 1 and task 2
    * the same approach for both tasks (NU and TalTech)
  * ~> Therefore, our analysis is focused on the categorical emotion
* This analysis presents descriptions of the approaches used by teams that
  * have provided a description of their approaches and
  * ranked prominently in both the categorical and emotional attributes
* metrics for each track
  * categorical emotion recognition: both micro and macro F1
  * emotion attributes prediction track: CCC
  * final overall ranking of the models
    * Macro F1 scores for the categorical emotion recognition and the
    * average CCC values across arousal, valence, and dominance
* Task 1 top-3 scores (based on F1-Macro) were achieved by
  * Sheffield-MINI with 0.3569 (.046 over Baseline),
  * TalTech with 0.3543 (.043 over Baseline), and
  * UPC-BSC with 0.3441 (.033 over Baseline)
* Task 2 top-3 scores (based on CCC average over arousal, valence, and dom)
  * Baseline: 0.5327, AIST-BahasaKita: 0.5297, and intema.ai: 0.529

## 5.1. Model Architectures and Features

* Sheffield-MINI: ensemble approach combining self-attention layers and MLPs,
  * features extracted from both audio and text using pre-trained models like
    Whisper [11], Wav2vec [12], HuBERT [13], WavLM [4], and RoBERTa [14]
* UPC-BSC, THAU, and NU integrated textual data with audio features
  * pre-trained models and fine-tuning
* NU utilized SSL-based features from BERT [15] and Emotion2Vec [16] in
  addition to WavLM features
* Vivolab, CONILIUM, and VicomSpeech focused solely on audio data
  * models like WavLM [4]
  * innovative architectures like second-order attention mechanisms [17]
    * Vivolab: a specific focus on Selective State Space Models (SSM), MAMBA,
  * support vector machine (SVM) [18] classifiers
  * CONILIUM utilized a structure that mirrored the baseline and made use of
    secondary annotations of all workers (annotators)
    in the weighed binary CE loss function
* TalTech opted for features derived from mel-scale filters applied to the
  spectrogram, such as 80 Melfrequency filter-banks as their acoustic inputs

## 5.2. Data Modalities and Augmentation Techniques

* At least six teams utilized audio and textual input
* transcriptions often derived from pre-trained speech models like Whisper
* augmentation was also employed, with techniques ranging from
  * speed perturbation and noise addition (TalTech, UPC-BSC, and Vivolab)
    sourced from datasets like MUSAN [19] and RIR [20]
* redistribution of samples labeled ‘X’ using annotator rankings
  (L’Antenne du Ventoux)
* Team AGH: focusing on high-quality training data
  * determined by a basic analysis of each worker (annotator) performance
* SheffieldMINI: no augmentation

## 5.3. Training Process and Optimization

* Training methodologies varied significantly, different loss functions from
  the ones used for the baseline in some approaches
* Sheffield-MINI and UPC-BSC made use of Focal Loss [21]
  to address class imbalance and CE loss
* NU optimized their models using CE loss and MSE loss
* L’antenne du Ventoux utilized Negative log-likelihood and Jeffreys loss
  during training to jointly fine-tune both speech and text encoders
* TalTech
  * logistic regression-based fusion of audio and text-based models
    * using low-rank adaptation (LoRA) [22] to
      finetune Llama 2 [23] and Wav2Vec-BERT [24]
  * they then fused the audio and text-based posterior probabilities using a
    separate logistic regression model, trained on development data

## 5.4. Challenges and Solutions

* class imbalance
  * Sheffield-MINI’s focal loss and
  * Vivolab’s balance through sample equalization
* emotions with subtle distinctions were tackled through
  innovative model architectures and feature sets
  * UPC-BSC’s use of double multi-head attention component [25] and
  * THAU’s use of large language models (LLM) [26] for fusion
* The computational resources required varied
  * most teams employing high-end GPUs like the NVIDIA RTX 3090 or A100

## 5.5. Top-3 Performing Models Evaluation

* Figs 5 and 6:
  wich emotional classes or attribute regions are more challenging for the top3

### 5.5.1. Categorical Emotion Recognition Analysis

* Figure 5 depicts the confusion matrices from the speech emotion recognition
* Sheffield-MINI Model demonstrates a
  * strong ability to recognize ‘Anger’, ‘Happiness’, ‘Neutral’, and ‘Sadness’
  * struggle with ‘Fear’, ‘Contempt’, and ‘Disgust’ emotions, where
    * a substantial number of instances are misclassified as ‘Anger’,
  * ‘Surprise’, ‘Contempt’, ‘Sadness’, and ‘Happiness’ categories show
    a mix of misclassifications with a lot of ‘Neutral’ misclassifications,
* TalTech Model shows a somewhat balanced classification ability
  * notable confusion between ‘Neutral’ and ‘Sadness’, with
    * many ‘Neutral’ emotions being incorrectly labeled as ‘Sadness’
    * often mislabeling Contempt as ‘Disgust’ or ‘Anger’
    * ‘Fear’ emotions being misclassified as ‘Anger’ or ‘Sadness’
* The UPC-BSC Model, while
  * proficient at identifying ‘Happiness’ emotions
  * issue distinguishing between ‘Anger’ and other emotions like: ‘C’, D, F
  * a significant number of ‘Contempt’, ‘Disgust’, and ‘Fear’ labeled as A
  * a considerable amount of ‘Surprise’ emotions as ‘Happiness’
* common challenge
  * ‘Disgust’, ‘Fear’, and ‘Contempt’ with ‘Anger’, which could be due to
    intrinsic similarities in the expression of these categories
  * ‘Surprise’ seems to be a difficult category for all models, with
    misclassifications scattered across other emotions

### 5.5.2. Attributes Emotion Recognition Analysis

* fig 6.  Note the order top, bottom, middle
* We employed the mean squared error (MSE) to gauge the error of predictions
  with the ground truth. We conducted these experiments
  * ? regions of emotional attributes are these models struggling more
* we binned the emotional intensity for each attribute into the top 25%
  percentile, bottom 25% percentile, and the middle 50% attribute values
* All top-3 models essentially have the same patterns as the baseline model,
  * lower MSE scores with 0.25+
  * extreme difficulties with bottom 25% attribute intensity prediction for A,D
* AIST-BahasaKita Model emerged as more proficient
  in the midrange for Arousal and in the top 25% for Dominance
* Intema Model mirrored the baseline for the most part with
  slightly lower MSE in the top 25% intensities for Dominance
* substantial challenges observed when predicting low-intensity dominance,
* all models registering higher MSE scores for Arousal at lower intensities,
* ie current models have made great improvements in understanding average
  emotional states and even model intense regions
  * the lower end of the emotional intensity spectrum requires further advancem

# 6. Conclusion

* The fusion of audio and textual data + advanced neural networks + fine-tuning
* hE data imbalance, emotional subtlety, and computational demand
