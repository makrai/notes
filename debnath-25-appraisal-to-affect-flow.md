An Appraisal Theoretic Approach to Modelling Affect Flow in Conversation Corpora
Alok Debnath, Yvette Graham, Owen Conlan
ACL 2025

# Abstract

* Appraisal Theory is a multidimensional cognitive model
* significant advantages for analyzing emotions in conversational contexts,
  addressing the challenges of inconsistent annotation methodologies
* we present AppraisePLM,
  * a regression and classification model trained on the crowd-EnVent corpus
  * outperforms existing models in predicting 21 appraisal dimensions
  * eg pleasantness, self-control, and alignment with social norms
* We apply AppraisePLM to diverse conversation datasets spanning
  task-oriented dialogues, general-domain chit-chat,
  affect-specific conversations, and domain-specific affect analysis
* AppraisePLM successfully extrapolates emotion labels across datasets, while
  capturing domain-specific patterns in affect flow – change in conversational
  emotion over the conversation

# 1 Introduction

* Affect: emotion and mood
  * crucial in conversations, influencing eg empathy, sarcasm, and naturalness
    (Ruusuvuori, 2012)
* In the domain of conversational agents (CAs), recognizing and responding to
  affective cues is essential (Skowron and Paltoglou, 2011; Yang+ 2019)
* methodologies include emotion classification, dimensional ratings, intent
  annotations, and vicarious emotion ratings such as empathy and condolence
  (Busso+ 2008; Ma+ 2020; Karna+ 2020). While affect-annotated
  * Carlos Busso, Murtaza Bulut, Chi-Chun Lee, Abe Kazemzadeh, Emily Mower,
      Samuel Kim, Jeannette N Chang, Sungbok Lee, and Shrikanth S Narayanan
    IEmoCap: Interactive emotional dyadic motion capture database
    Language resources and evaluation, 2008 42:335–359
  * Yukun Ma, Khanh Linh Nguyen, Frank Z Xing, and Erik Cambria. 
    A survey on empathetic dialogue systems. Information Fusion, 2020 64:50–70
  * Mounika Karna, D Sujitha Juliet, and R Catherine Joy
    Deep learning based text emotion recognition for chatbot applications
    2020 IEEE Intl Conference on Trends in Electronics and Informatics
* datasets exist across general and specialized domains,
* inconsistencies in annotation schemas and objectives (Liu+ 2021; Islam+ 2022)
  * variations in annotation methodologies
  * unit level (eg turn-wise versus full-conversation annotations) and
  * dataset construction depending on the domain (Liu+ 2024)
* evaluation metrics for contextual affect interactions remain limited, coercing
  a generalization of findings across datasets
* domain-specific models, such as diff-Epitome (Lee+ 2022), are
  * trained within a specific domain but later applied broadly
  * need for standardized affect evaluation (Schaaff+ 2023)
  * A generalizable framework for modelling affect in conversations could
    address these challenges
    ~> more consistent benchmarking for conversational agents
* we: Appraisal Theory provides a generalizable framework
  * emotions as responses to an individual’s evaluation of a stimulus along
    multiple cognitive dimensions (Ellsworth and Smith, 1988; Scherer, 2005)
  * eg anger can be characterized as an unpleasant, short-lived emotion with low
    self-control (Roseman and Smith, 2001)
  * allows for the modelling of emotional intensity and duration
  * enables the analysis of affect flow, or
    how emotions evolve throughout a conversation (Hendriks+ 2014; Poria+ 2019b)
  * hypoth (Sec 6: yes, yes)
    1. appraisal-theoretic emotion analysis
      aligns with existing emotion annotations
    2. such a cognitive analysis captures affect flow:
      ie emotion change over the course of a conversation
* we introduce AppraisePLM, a model for appraisal regression and emo classif
  * trained on the crowd-ENVent corpus.  
    * Crowd-ENVent: benchmark corpus for emotion recognition and appraisal anal
    * fine-grained annotations of event descriptions on 21 appraisal dims
      eg pleasantness, self-control, and suddenness (Troiano+ 2023)
* AppraisePLM outperforms existing classifiers and regressors on this dataset
* turn-wise appraisal annotation across four benchmark conversation corpora:
  EmoWOZ (Feng+ 2022), Empathetic Dialogues (Rashkin+ 2019),
  DailyDialog (Li+ 2017), and EPTiome (Sharma+ 2020)
  * AppraisePLM improves appraisal estimation performance on the crowd-ENVent
  * it can extrapolate categorical and emotion labels
  * corpus domain influences affect flow, with distinct patterns emerging in
    specific domains (eg empathetic conversations improving pleasantness)

# 2 Background and Motivation

## 2.1 Emotion Recognition in Conversation (ERC)

* ERC often relies on Plutchik’s wheel or Ekman’s universal emotions for
  annotation (Plutchik, 1965; Ekman, 2000)
* basic emos
  * general-domain dialogue corpora, such as
    * eg DailyDialog (Li+ 2017), MELD (Poria+ 2019a), and EmotionLines (Hsu+
      2018), employ a set of basic emotions like
  * eg joy, fear, sadness, anger, surprise, disgust, and neutral
  * varying numbers of emotion categories, ranging from finegrained annotations
    to broader affect labels (Qin+ 2023). The veracity [igazságtartalma] and
    similarity of emotions can differ significantly by domain, raising
    * ? accessibility and identification of fine-grained emotions in
      conversation (Hancock+ 2007; Machová+ 2023)
* The Valence-Arousal-Dominance (VAD) model is a prevalent dimensional model
  * IEMOCAP conversation corpus is a reference corpus providing
    both dimensional and categorical emotion labels (Busso+ 2008)
  * domain heavily influences the taxonomy and distribution of emotion labels
    (Rajapakshe+ 2024)
    * mental health-focused corpora may prioritize certain emotions over others
      compared to general-domain corpora (Saha+ 2022)
  * which modalities and the number of participants in the conversation can
    impact the emotion annotation methodology as well (Pereira+ 2023, 2025)
* Appendix provides a table to show the inconsistencies across emotion
  annotations in conversation corpora

## 2.2 Affective Phenomena in Conversation

* The emotions expressed and perceived by interlocutors
  influence expected conversational behavior
* modeling "emotion shift" remains an open problem (Pereira+ 2025)
* Corpora often use direct annotation methods to extract relevant affective
  features and behaviours. eg
  * Empathetic Dialogues is a open-domain empathetic conversat benchmark corp
    (EDOS Rashkin+ 2019)
  * 32 fine-grained emotion labels
* mental health specific corpora,
  * such as
    * Epitome (Sharma+ 2020),
    * ALoE (Yang and Jurgens, 2024),
    * PAIR (Pérez-Rosas+ 2022), and ESConv (Liu+ 2021)
  * not directly annotate emotion. Instead, they
  * assess characteristics of empathetic interactions using direct annotator
    ratings, like Emotional Interpretation in Epitome 
  * This approach allows models to access desirable interactional behaviours
    without relying solely on emotion (Lahnala+ 2022)
  * have been used to benchmark open-domain conversational agents (Lee+ 2024)
  * eg agent should provide condolence, implying expected linguistic behaviour
    with an affective signal (Zhou and Jurgens, 2020)
  * The manner and display of empathy vary with context, relationship, and
    personality, as noted in the PEC corpus (Zhong+ 2020)

## 2.3 Appraisal Theory in Language and Conversation Analysis

* Appraisal theory:
  experienced emotions result from cognitive appraisals of event stimuli,
  such as pleasantness, suddenness, controllability, or alignment with social
  norms (Ellsworth and Smith, 1988)
  * a view of an experiencer’s cognitive state by systematically choosing
    context-appropriate appraisals
  * in NLP and conversation analysis, enhancing emotion classification and
    interpersonal communication studies (Balahur+ 2011; Hofmann+ 2020)
  * how emotions arise from event evaluations
    (Troiano+ 2022; Resendiz and Klinger, 2023)
  * how speakers express attitudes and manage relationships through evaluat lang
  * in analyzing motivational interviewing
* datasets
  * ALoE dataset focusing on empathetic alignment in therapeutic conversations
    using appraisal theory (Yang and Jurgens, 2024)
    * hE domain-specific
    * no correspondence with other categorical or dimensional labels
  * crowd-enVENT dataset (Troiano+ 2023), consisting of
    * 6,600 emotion-inducing event descriptions
    * annotat: 21 appraisal dimensions, emotion labels, and author demographics
    * comparing appraisal and emotion reconstruction by readers versus
      computational models, providing a human baseline for machine learning
    * specifically for text analysis, studying the
      relationship between appraisals, emotions, and event descriptions

# 3 The AppraisePLM conversation anal framework

* AppraisePLM estimates the aggregate change(s) and patterns in
  how the interlocutors appraise the conversation over time

## 3.1 Problem Definition

* Given a dataset D = {(e i , l i , c i )} N i=1 where
* e i is the ith event description (text),
* l i is a vector of a event description appraisals, and
* c i ∈ C is a label from the set of n emotion class labels C, we perform the

### Appraisal Estimation Train a function f app : R d → R a where

* d is the dimensionality of the encoded event description PLM(e i ) and
* a is the number of appraisals. The objective of this function is to
* find `θ_{app}` with least squares

### Emotion Classification: train a function f emo : R d ×R a → C, where

* d is the dimensionality of the encoded event description PLM(e i ),
* C is a set of n emotion class labels, and
* $a$ is the number of appraisals. The objective of this function is to
* find `θ_{emo*} = \arg min \mean 1_[c_i=k] \cdot \ln f_{emo}(comb)`

## 3.2 Dataset Characteristics (crowd-EnVent)

* 6,600 event descriptions (550 event descriptions for 13 emotion labels)
* Each event is annotated with 21 appraisal variables, which
* appraisal variables are cognitive evals of the event by the event’s author
* The finegrained emotion labels allow us to analyze how experiencers appraise
  various emotions (including a no-emotion label). The
* distribution of appraisal values is skewed, > 33% of the corpus either 1 or 5
* Their approach for appraisal classification involves a two-class classif,
  which we do not use as the differences in appraisal values are a critical step
  in AppraisePLM

## 3.3 Model Framework

* The proposed AppraisePLM multitask framework
  jointly performs appraisal regression and emotion classification using
  attention-attenuated pretrained language models (PLMs) such as
  eg RoBERTa (Liu+ 2019), DeBERTa (He+ 2020), MP-Net (Song+ 2020) and
  T5 (Raffel+ 2020); with
  * Kaitao Song, Xu Tan, Tao Qin, Jianfeng Lu, and TieYan Liu. 2020
    Mpnet: Masked and permuted pretraining for language understanding
    NeurIPS 2020
  * DeBERTa yielding the best performance. Figure 1 provides a simple schematic
* event description is embedded using a PLM encoder and a multihead attention
* Each appraisal dimension has a task-specific multihead attention layer and
  linear head
* individual MSE losses for all appraisal values
* Emotion classification utilizes
  both the PLM representation and predicted appraisal values
  * concatenated, normalized and regularized
    then decoded by another multihead attention layer and a linear classif head
  * cross-entropy loss

## 3.4 AppraisePLM Results and Performance

* Tab 1: Performance of the AppraisePLM architecture on crowd-enVENT vs baseline 
  * attention attenuation marginally improves appraisal estimation,
    DeBERTa-large achieves the highest performance
  * hE limited improvement in regression scores <~ the task is complex (App D)
* Appraisal representations enhance categorical emotion detection
  * event descriptions appended with appraisal information
  ~> a 0.11 macro avg F1 improvement over the baseline
* Multi-head attention slightly improves standard emotion classification (T → E
  in Table 6), but the
* nL AppraisePLM architecture shows a more substantial boost when integrating
  both text and appraisal data
* Figure 6?/2 visualizes appraisal estimates across emotions using DeBERTa-large 
  AppraisePLM, with
  * emotions ordered by pleasantness
  * no-emotion separates positive and negative emotions, with
  * joy being the most pleasant and disgust the least
  * Unpleasantness follows the inverse trend, while
  * urgency, attention, and other-control exhibit
    minimal variation across emotions

# 4 Affect Annotations in Dialogue Corpora

# 5 Affect Flow in Conversation

# 6 Discussion

* Appraisal theory, a model of emotion realized in text
* AT is based on post-hoc or simulated appraisals of cognitive dimensions
  correlated with universal emotion labels
* We approximate conversation segments (situation, turn, or response) as event
  descriptions, assuming that
  post-hoc contextual rating of appraisals preserves the relationship between
  semantic and cognitive representations of affect
* Our analysis of conversational corpora using appraisal estimation
* mixed quantitative results nL promising qualitative insights
* Label inconsistencies complicate the evaluation of emotion detection in
  AppraisePLM
* In this section, we examine the veracity of the hypotheses mentioned in §1

## 6.1 H1: Aligning with Extant Affect Annotations

* H1: appraisal-theoretic emotion analysis aligns with existing emotion annots
* We tested this at multiple levels by examining patterns of appraisal estimates
  for the overall corpus, characterized by its domain and annotation level
  (conversation, turn, or response)
* fully textual corpora, such as Empathetic Dialogues and DailyDialog,
  * significantly higher alignment in categorical labels
  * This is notable, as both corpora have different approaches and goals
    for affect annotation
    hE, the domain of affect annotation poses challenges for quantitative anal
* in the Epitome corpus,
  * changes in appraisal estimates between utterance and response
    align with the definitions of the annotated dimensions, while
  * appraisal-informed emotion classification reflects the source of the
    conversation
* EmoWOZ
  * A similar domain effect is observed
  * emotion classification scores after label folding were baseline, but
  * trends in appraisal by turn and speaker
    correspond to action states in the corpus
* summary
  * appraisal theory shows reasonable alignment with existing affect annotations
    in conversational corpora, providing additional cognitive insights. Using
    appraisal theory as the grounding emotion annotation in general domain
    conversations would significantly improve the performance and reliability of
    the AppraisePLM approach

## 6.2 H2: Appraisal Change as Affect Flow

* H2: cognitive analysis captures affect flow,
  examined as emotion change over the course of a conversation
  * not all appraisals are relevant to a conversation or domain
    * some appras may change minimally
  * nL those appraisals that do change
    exhibit a small but consistent gradient when aggregated over the conversat
* Sec 5 details findings from one approach to examining affect flow using the
  power-amplified difference of appraisal estimates between conversation turns
* Appraisal gradients differ by dataset:
  * Empathetic Dialogues exhibits low appraisal shifts,
  * DailyDialog shows greater variability in negative emotions, and
  * EmoWOZ presents the highest appraisal gradient with
    * distinct trends for satisfaction and dissatisfaction
* Empathic matching, where interlocutors align appraisals over time, is
  evident in positive emotions across Empathetic Dialogues and DailyDialog
  * hE, DailyDialog lacks directional speaker roles
    ~> broader variability in emotional elicitation
* Epitome corpus demonstrates distinct appraisal relevance, with
  dimensions like responsibility and attention influencing response quality
* summary:
  changes in appraisal estimates represent emotion change in conversation. The
  multidimensionality and cognitive nature of appraisal theory reinforce its
  utility in emotion modeling and highlight corpus-specific affective dynamics

# 7 Conclusion

* AppraisePLM, a multitask learning model
  designed to estimate appraisal dimensions and emotion categories
  using the crowd-EnVENT dataset
* we applied our model to various conversational corpora
  * we leveraged its fine-grained dimensional representation of emotion
    to analyze affect flow
* ie appraisal theory provides a valuable framework for examining how emotions
  manifest in conversational data
* crowd-EnVENT dataset is not a dialogue corpus, nL our results support the
  feasibility of using appraisal-based models to examine emotion dynamics in
  conversation
* improved appraisal estimation and emotion classification perf over baseline
* reasonable success in appraisal-informed zero-shot emotion classification
* possible applications
  1. benchmarking affective conversational agents
    eg those designed for emotional support or empathetic interaction, by
    assessing how their responses modulate appraisal dimensions
 2. informing agent response expectations when expressing specific emotions,
  ~> insights into emotionally intelligent dialogue systems

# Limitations

* we assume
  * unif annot
    * ie that appraisal annotation for conversations occurs in the same way as
      for statements or short-form text, which may not always be the case
  * emotions are appraised similarly in human-human and human-machine interact
  * [greater] granularity of our approach, while providing more insights, also
    increases the potential for errors
  * We utilized 21 dimensions because it was possible, but
    future should determine which of these dimensions are most applicable
    * power amplification of differences between values
      we use to identify interaction trends, which
      could be critiqued as potentially highlighting insignificant variations
* future: conversationally defined and annotated corpora based on appraisal
  theory, given its relationship to and generality of emotion categorization
  systems
* longitudinal data will allow observing
  how appraisal patterns might change over time in ongoing human-machine
