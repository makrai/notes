An Appraisal Theoretic Approach to Modelling Affect Flow in Conversation Corpora
Alok Debnath, Yvette Graham, Owen Conlan
ACL 2025

* the multidimensional cognitive model of Appraisal Theory offers
  significant advantages for analyzing emotions in conversational contexts,
  addressing the current challenges of inconsistent annotation methodologies
* we present AppraisePLM,
  * a regression and classification model trained on the crowd-EnVent corpus
  * outperforms existing models in predicting 21 appraisal dimensions
    * including pleasantness, self-control, and alignment with social norms
* We apply AppraisePLM to diverse conversation datasets spanning
  task-oriented dialogues, general-domain chit-chat,
  affect-specific conversations, and domain-specific affect analysis
* AppraisePLM successfully extrapolates emotion labels across datasets, while
  capturing domain-specific patterns in affect flow – change in conversational
  emotion over the conversation

# 1 Introduction

* Affect, which encompasses both emotion and mood, is crucial in conversations,
  influencing eg empathy, sarcasm, and naturalness (Ruusuvuori, 2012)
* In the domain of conversational agents (CAs), recognizing and responding to
  affective cues is essential (Skowron and Paltoglou, 2011; Yang+ 2019)
* methodologies include emotion classification, dimensional ratings, intent
  annotations, and vicarious emotion ratings such as empathy and condolence
  (Busso+ 2008; Ma+ 2020; Karna+ 2020). While affect-annotated
* datasets exist across general and specialized domains,
* inconsistencies in annotation schemas and objectives (Liu+ 2021; Islam+ 2022)
  * variations in annotation methodologies, including differences
  * unit level (eg turn-wise versus full-conversation annotations) and
  * dataset construction depending on the domain (Liu+ 2024)
* evaluation metrics for contextual affect interactions remain limited, coercing
  a generalization of findings across datasets
* domain-specific models, such as diff-Epitome (Lee+ 2022), are trained within
  a specific domain but later applied broadly, highlighting the
  * need for standardized affect evaluation (Schaaff+ 2023).
  * A generalizable framework for modelling affect in conversations could
    address these challenges, ensuring more consistent benchmarking for
    conversational agents
* we: Appraisal Theory provides a generalizable framework
  * emotions as responses to an individual’s evaluation of a stimulus along
    multiple cognitive dimensions (Ellsworth and Smith, 1988; Scherer, 2005)
  * eg anger can be characterized as an unpleasant, short-lived emotion with low
    self-control (Roseman and Smith, 2001)
  * allows for the modelling of emotional intensity and duration
  * enables the analysis of affect flow, or
    how emotions evolve throughout a conversation (Hendriks+ 2014; Poria+ 2019b)
  * hypoth
    1. appraisal-theoretic emotion analysis
      aligns with existing emotion annotations
    2. such a cognitive analysis captures affect flow:
      ie emotion change over the course of a conversation
  * we introduce AppraisePLM, a model for appraisal regression and emo classif
    * trained on the crowd-ENVent corpus. Crowd-ENVent is
      * a benchmark emotion recognition and appraisal analysis corpus which
      * fine-grained annotations of event descriptions on 21 appraisal dims
        eg plea-antness, self-control, and suddenness (Troiano+ 2023)
* AppraisePLM outperforms existing classifiers and regressors on this dataset
* turn-wise appraisal annotation across four benchmark conversation corpora:
  EmoWOZ (Feng+ 2022), Empathetic Dialogues (Rashkin+ 2019),
  DailyDialog (Li+ 2017), and EPTiome (Sharma+ 2020). Our results show that
  * AppraisePLM improves appraisal estimation performance on the crowd-ENVent
    corpus and can extrapolate categorical and emotion labels
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
    to broader affect labels (Qin+ 2023). The veracity and similarity of
    emotions can differ significantly by domain, raising questions about the
    accessibility and identification of fine-grained emotions in conversation
    (Hancock+ 2007; Machová+ 2023)
* The Valence-Arousal-Dominance (VAD) model is a prevalent dimensional model for
  * IEMOCAP serving as a reference corpus providing both dimensional and
    categorical emotion labels (Busso+ 2008). The conversation corpus’
  * domain heavily influences the taxonomy and distribution of emotion labels
    (Rajapakshe+ 2024). For instance,
    * mental health-focused corpora may prioritize certain emotions over others
      compared to general-domain corpora (Saha+ 2022). Additionally, factors
  * which modalities and the number of participants in the conversation can
    impact the emotion annotation methodology as well (Pereira+ 2023, 2025)
* Appendix provides a table to show the inconsistencies across emotion
  annotations in conversation corpora

## 2.2 Affective Phenomena in Conversation

* The emotions expressed and perceived by interlocutors influence expected
  conversational behavior, though
* modeling "emotion shift" remains an open problem (Pereira+ 2025)
* Corpora often use direct annotation methods to extract relevant affective
  features and behaviours. For instance,
  * E MPATHET IC D IALOGUES is a benchmark open-domain empathetic conversat corp
  * EDOS (Rashkin et al., 2019)
  * 32 fine-grained emotion labels, also applied in
* mental health specific corpora, such as E PIT OME (Sharma+ 2020), AL O E
  (Yang and Jurgens, 2024), PAIR (Pérez-Rosas+ 2022), and ESConv (Liu+ 2021)
  * not directly annotate emotion. Instead, they
  * assess characteristics of empathetic interactions using direct annotator
    ratings, like Emotional Interpretation in E PITOME . This approach allows
    models to access desirable interactional behaviours without relying solely
    on emotion (Lahnala+ 2022). Metrics from PAIR and E PIT OME
  * have been used to benchmark open-domain conversational agents (Lee+ 2024)
  * eg agent should provide condolence, implying expected linguistic behaviour
    with an affective signal (Zhou and Jurgens, 2020)
  * The manner and display of empathy vary with context, relationship, and
    personality, as noted in the PEC corpus (Zhong+ 2020)

## 2.3 Appraisal Theory in Language and Conversation Analysis

* Appraisal theory posits that
  experienced emotions result from cognitive appraisals of event stimuli,
  such as pleasantness, suddenness, controllability, or alignment with social
  norms (Ellsworth and Smith, 1988)
  * a view of an experiencer’s cognitive state by systematically choosing
    contextappropriate appraisals
  * in NLP and conversation analysis, enhancing emotion classification and
    interpersonal communication studies (Balahur+ 2011; Hofmann+ 2020). In NLP,
  * how emotions arise from event evaluations
    (Troiano+ 2022; Resendiz and Klinger, 2023)
  * how speakers express attitudes and manage relationships through evaluat lang
  * in analyzing motivational interviewing, with the
* datasets
  * AL O E dataset focusing on empathetic alignment in therapeutic conversations
    using appraisal theory (Yang and Jurgens, 2024). However, this work is
    * hE domain-specific and lacks correspondence with other categorical or
      dimensional labels
  * crowdenVENT dataset (Troiano+ 2023), consisting of
    * 6,600 emotion-inducing event descriptions annotated with
    * 21 appraisal dimensions, emotion labels, and author demographics. This
    * comparing appraisal and emotion reconstruction by readers versus
      computational models, providing a human baseline for machine learning
    * specifically for text analysis, studying the
      relationship between appraisals, emotions, and event descriptions

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
