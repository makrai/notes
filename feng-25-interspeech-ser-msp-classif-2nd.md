    SAILER: Developing a Top-tier Framework in Naturalistic Conditions Challenge for Categ:
      From Speech Foundation Models and Learning Objective to Data Augmentation and
      Engineering Choices
    Tiantian Feng, Thanathai Lertpetchpun, Dani Byrd, Shrikanth Narayanan
Interspeech 2025 [SER MSP Podcast](/naini-25-interspeech-ser-msp-podcast.md) Categ 2nd

[model](https://github.com/tiantiaf0627/vox-profile-release)

* Our system is designed to be simple, reproducible, and effective, highlighting
* without ensembling) can outperform more than 95% of the submissions, with a
  Macro-F1 score exceeding 0.4. Moreover,
* an ensemble of three systems further improves performance, achieving a
  competitively ranked score (top-3 performing team)

# 2. Method

## 2.2. Learning Objective

* Most prior studies approach SER as a hard-label classification problem
* speech often conveys multiple emotions simultaneously [4]
  * majority-vote hardlabeling fails to capture these multifaceted chars [17]
* [18]: hard labeling can lead to a substantial data loss in training due to the
* in the IS25-SER Challenge, 15,932 training speech samples lacked consensus,
  * 19% of the training data. To better represent the complexity of emotions
* SAILER frames SER as a soft labeling problem, as shown in Fig. 2
* Therefore distribution modeling and KL divergence loss as the learning obj

## 2.4. Engineering Design Choices to Tackle Class Imbalance

### 2.4.3 Predicting Additional Ground Truth ie secondary emotions and VAD

* we explore a simple multi-task learning approach that simultaneously learns
  the primary emotion distribution along with other affective elements
