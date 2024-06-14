    VALUE NET: A New Dataset for Human Value Driven Dialogue System
    Liang Qiu, Yizhou Zhao, Jinchao Li, Pan Lu, Baolin Peng, Jianfeng Gao,
      Song-Chun Zhu
    AAAI 2022 Conference on Artificial Intelligence (AAAI-22)

https://liang-qiu.github.io/ValueNet/

# Abstract

* socially intelligent agent involves speaking guided by its value like a human
  * hE value-driven chatbots are still understudied in dialogue systems
  * Most existing datasets focus on
    commonsense reasoning or social norm modeling
* we present a new large-scale human value dataset called ValueNet
    * human attitudes on 21,374 text scenarios
    * ten dimensions that conform to the basic human value theory in
      intercultural research
  * a Transformer-based value regression model on ValueNet
    to learn the utility distribution
* Comprehensive empirical results show that the learned value model could
  benefit a wide range of dialogue tasks
  * eg by teaching a generative agent with reinforcement learning and the
    rewards from the value model, our method attains
    SOTA performance on the Persona-Chat personalized dialog generation dataset
  * With values as additional features, existing
    emotion recognition models enable capturing rich human emotions in context,
    * further improves the empathetic response generation performance in the
      Empathetic Dialogues dataset
* we are the first one
  * ValueNet is the first largescale text dataset for human value modeling, and
  * incorporate a value model into emotionally intelligent dialogue systems

# Introduction

* Value refers to desirable goals in human life
  * guide the selection or evaluation of actions, policies, people, and events
  * A person’s value priority or hierarchy profoundly affects his or her
    attitudes, beliefs, and traits
  * a core component of personality (Schwartz 2012)
* In dialogue systems (socially intelligent chatbots)
  * modeling human values is a critical step (Qiu+ 2021b)
  * estimate user behavior and cognitive patterns from their utterances and
  * generate responses that conform to the robot’s persona configuration
  * eg Jerry prefers a healthy and selfdisciplined lifestyle
* socially intelligent chatbots: one of the longest-running goals in AI
  * Early dialogue systems
    eg Eliza (Weizenbaum 1966), Parry (Colby, Weber, and Hilf 1971), and
  * more recent SimSimi1 , Panda Ichiro (Okuda and Shoda 2018),
    Replika (Fedorenko, Smetanin, and Rodichev 2018), XiaoIce (Zhou+ 2020),
  * designed to mimic human behavior and incorporate emotional quotients (EQ)
  * related datasets and benchmarks
    * emotion recognition (McKeown+ 2010; Hsu+ 2018; Poria+ 2019; Ghosal+ 2020)
    * personalized dialogue generation (Zhang+ 2018; Liu+ 2020), and
    * empathetic dialogue generation (Rashkin+ 2019)
  * hE no explicit modeling of values in the dialogue domain,
    based on social domain theory
  * crowdsourcing social commonsense knowledge base or benchmarks
    (Forbes+ 2020; Sap+ 2019; Lourie, Bras, and Choi 2021; Hendrycks+ 2020;
    Hwang+ 2021; Gabriel+ 2021)
  * hE not clearly shown how an agent can leverage this knowledge
  * we investigate the usage of a learned value function
1. curating a knowledge base of human values called ValueNet
  * Samples with value-related scenarios were identified
    based on value-defined keyword searching
  * Amazon Mechanical Turk workers:
    how the provided scenarios will affect one’s value
  * based on the assumption that values underlie our attitudes; they are the
    guideline by which we evaluate things
  * Workers assess behaviors/events positively if they promote or protect the
    attainment of the goals we value. Behaviors/events are evaluated
    negatively if they hinder or threaten the attainment of these valued goals
  * > 21k samples, multi-dimensional knowledge base of value
  * fig 1: overall structure of ValueNet
  * Each split represents a value dimension
    identified in the theory of basic human values (Schwartz 2012)
  * value-related keywords and scenarios
  * The circular arrangement of the values represents a motivational continuum
    * By organizing data in such a structure, we anticipate ValueNet to provide
      comprehensive coverage of different aspects of human values
2. a Transformer-based value model to evaluate the utility score suggesting the
   positive or negative judgment given an utterance
  * detailed analysis of learning with multiple Transformer variants
  * a wide range of expers: value model benefits EQ-related dialogue task
    * By finetuning a generative agent with reinforcement learning and the
      reward from our value model, the method achieves SOTA performance on the
      personalized dialogue dataset: Persona-Chat (Zhang+ 2018);
    * values, as additional features in Empathetic Dialogues (Rashkin+ 2019),
      improve the emotion classification accuracy of existing models, which
      * further facilitates the empathetic response generation;
    * Visualization of the value model:
      a numerical way of user profile modeling from their utterances
* our contributions are two-fold
  * a large-scale dataset ValueNet for the modeling of human values that are
    well-defined in intercultural research
  * [apply] the value model learned from ValueNet to several EQ-related tasks
    and demonstrate its usage for building a value-driven dialogue system
  * Our methodology can be generalized to a wide range of
    * interactive situations in socially aware dialogue systems
      (Zhao, Romero, and Rudnicky 2018)
    * human-robot interactions (Yuan and Li 2017; Liang, He, and Anthony’Chen 2021)

# Related Work

* incorporating the theory of human value to dialogue systems
* our dataset shares a similar nature with multiple
  social commonsense benchmarks and knowledge bases
* we apply our ValueNet for various dialogue tasks related to EQ

## Theory of Human Value and Utility

* in intercultural research, the theory of basic human values (Schwartz 2012)
  * ten basic personal values that are recognized across cultures and explains
    where they come from, as shown in Figure 1
  * The closer/distant any two values in either direction around the circle,
    the more similar/antagonistic their underlying motivations are; the more
  * ie the pursuit of some value may result in accordance/conflict with another
    one
  * Why ten? An arbitrary convenience
    * A refinement of the theory (Schwartz+ 2012) partitions the continuum into
      19 more narrowly defined values
* utility (Fishburn 1970) is initially defined as
  a measure of pleasure or satisfaction in economics and ethics
  * drives human activities at all levels
* when we teach agents to speak and act in a socially intelligent way,
  an approach considering human value utilities should be adopted
* we aim to learn a utility function for each dimension of value and
  steer the dialogue system response generation accordingly

## Social Commonsense Benchmarks

* Hendrycks+ (2020) present the ETHICS dataset, a benchmark that
  assesses a language model’s knowledge of basic concepts of morality
* Scruples (Lourie, Bras, and Choi 2021) is
  a large-scale dataset with ethical judgments over real-life anecdotes,
  * motivated by descriptive ethics
* Forbes+ (2020) is
  * SOcial-Chem-101, a corpus that catalogs rules-of-thumb as basic concept
    units for studying people’s everyday social norms and moral judgments
  * Neural Norm Transformer to reason about previously unseen situations,
    generating relevant social rules-of-thumb
* Social IQA (Sap+ 2019) is
  a large-scale benchmark for commonsense reasoning about social situations
* He+ (2017): a task and corpus for predicting the preferable options from two
  sentences describing the scenarios that may involve social and cultural situs

## Emotionally Intelligent Dialogue Datasets

* datasets to study emotion dynamics in dialogues
* DailyDialog (Li+ 2017) is
  a multi-turn dialogue dataset, which
  reflects the way of daily communication and provides
  emotion labels for speakers
* Hsu+ (2018) present EmotionLines with
  emotions labeling on all utterances in each dialogue based on their text
* MELD (Poria+ 2019) is an extension of EmotionLines
  for multi-modal multi-party emotion recognition
* McKeown+ (2010) record a corpus SEMAINE of emotionally coloured conversations
* Ghosal+ (2020) propose a framework COSMIC for
  emotion recognition in conversations
  by considering mental states, events, actions, and cause-effect relations
* DialogRE (Yu+ 2020) is
  the first human-annotated dialogue-based dataset for
  social relation inference (Qiu+ 2021a)
* Persona-Chat (Zhang+ 2018) provides natural language profiles of speakers
  * revised in ConvAI2 (Dinan+ 2020)
* Based on Persona-Chat, Liu+ (2020) propose
  a transmitter-receiver-based framework with
  explicitly human understanding modeling
  to enhance the quality of personalized dialogue generation
* Empathetic Dialogues (Rashkin+ 2019) is a dataset that provides
  25k conversations grounded in emotional situations. Each dialogue is grounded
  in a specific situation where a speaker was feeling a given emotion

# The ValueNet Dataset

* we aim to provide a transferable knowledge base for human value modeling
* the ValueNet dataset, we
  * curated social scenarios with value-related keywords and further
  * annotated them via Amazon Mechanical Turk
  * Each sample in ValueNet is a social scenario description
    labeled with the annotator’s attitude through a specific value lens
* The dataset is organized in a circular structure as shown in Figure 1,
  aligning with the theory of basic human values (Schwartz 2012). The theory
* The ten values can be further organized into four higher-order groups
  * Openness to change: self-direction, stimulation
  * Self-enhancement: hedonism, achievement, power
  * Conservation: security, conformity, tradition
  * Self-transcendence: benevolence, universalism
* We describe the collection details of the ValueNet in the following sections

## Social Scenario Curation

* We curated a set of 21,374 social scenarios from the largescale
  social-related database Social-Chem-101 (Forbes+ 2020)
* Value-related scenarios are retrieved with value keywords after lemmatization
  and stemming
  * three sets of keywords identified for each dimension of Schwartz value:
    * the keywords in the original definition of each value in (Schwartz (2012)
    * words that share a similar meaning, words that are often used to describe
      the original keywords, and words that are triggered by (strongly
      associated with) the original keywords3
      * We use [datamuse](https://www.datamuse.com/api/) for this purpose
    * words that are near the original keywords in GloVe (Pennington+ 2014)
  * The value keywords are verified and confirmed by humans as listed in Fig 2

## Value-Aspect Attitude Annotation

* The original inter-annotator agreement is 64.9%, and
  * the Fleiss’ kappa score (Fleiss 1971) among the workers is 0.48, which
    considers the possibility of the agreement by chance
* we only retain the samples with three or more agreements
* Fig 4 shows the sample size of each value split and their label distribution
* The data is split into the train (75%), valid (15%), and test (10%)
* we quantify the annotated labels into numerical values: yes (positive): +1,
  no (negative): -1, unrelated (neutral): 0
  * Similar to polarity in sentiment analysis
    (Kouloumpis, Wilson, and Moore 2011)
* We call the numerical values _utility_ to describe
  * the effect of a scenario on one’s value
  * ie, for people who appreciate a certain value, actions with a higher
    utility in this value dimension would be more desirable
* Table 1 shows more statistical details about the ValueNet dataset
* 21,374 samples covering a wide range of scenarios in daily social life

# Value Modeling

* We experiment using Transformer-based pre-trained language models for
  modeling human values from the ValueNet dataset

## Task Formalization

## Model

* Pre-trained language model variants: BERT (Devlin+ 2018), RoBERTa (Liu+
  2019), DistilBERT (Sanh+ 2019), BART (Lewis+ 2019) are investigated for
* input format constructed as ‘[CLS][$VALUE]s’ is fed into a Transformer
  encoder, i.e., positive (+1) V$VALUE (s) = TRM([CLS][$VALUE]s), (1) ACH where
  TRM denotes the Transformer encoder, [CLS] is the special token for
  regression or classification, and [$VALUE] are special tokens we define to
* btw prompt (Li and Liang 2021; Brown+ 2020; Le Scao and Rush 2021)
  * Li, X. L.; and Liang, P. 2021.  Prefix-tuning: Optimizing continuous
    prompts for generation. arXiv arXiv:2101.00190
  * Brown, T. B.; Mann, B.; Ryder, N.; Subbiah, M.; Kaplan, J.; Dhariwal, P.;
    Neelakantan, A.; Shyam, P.; Sastry, G.; Askell, A.;+ 2020.  Language models
    are few-shot learners.  arXiv preprint arXiv:2005.14165
  * Le Scao, T.; and Rush, A. M. 2021. How many data points is a prompt worth?
    NAACL 2021
* details
  * In order to get the ten-dimensional output V(s), a batch size of 10 is
  * For the BERT, DistilBERT, and RoBERTa, a regression head on the top of
  * Mean Squared Error (MSE) loss
  * sigmoid activation to get a continuous estimation of the utility in [−1, 1]
  * different loss functions, we train the BART model with three output classes
    and the cross-entropy loss

## Result and Analysis

* pre-trained language models perform better than the fastText baseline
* no noticeable difference between the Transformer variants. The prediction
* sample imbalance across different value splits and labels (Figure 4), ~> we
  release another two versions of ValueNet: ValueNet (balanced) and ValueNet
  (augmented). The original dataset is balanced by subsampling the
  * we augment the neutral class of the original ValueNet by assigning AMT
    results with less worker agreement to “unrelated”
  * Data distribution of the balanced and augmented versions in the Appendix
* prediction accuracy in different value splits (Table 3), we find that
  * reducing the sample number of BENEVOLENCE hurts the model performance in
    that dimension. Looking at the F1 score of each class in Table 2, we
  * augmenting the neutral class improves the F1(0) but reduces F1(1) and
    F1(-1). We leave it a future work to further improve the performance

# Persona-Chat

* values are closely related to one’s personality, we first assess our value
  model on a personalized dialogue dataset: Persona-Chat (Zhang+ 2018). The
* Persona-Chat dataset contains multi-turn dialogues conditioned on personas
  * Each persona is encoded by at least 5 sentences of text, a _profile_
  * eg “I like to ski”, “I enjoying walking for exercise”, “I have 4 children”,
  * 8,939 dialogues for training, 1,000 for validation, and 968 for testing
  * It also provides revised personas by rephrasing, generalizing or
    specializing the original ones
  * public available in ParlAI5

## Task Formalization

## Model

* A decoder-only Transformer-based model is used
  to estimate the generation distribution pθ (xst | hst , p), where θ is the
* Following the practice proposed in Guo+ (2018), the
  1. trained with Maximum Likelihood Estimation (MLE) to ensure generating
     fluent responses. Then we took
  2. an interleaving of supervised training (MLE) and reinforcement learning
    * REINFORCE policy gradient algorithm (Williams 1992) in our experiment,
    * the reward assignment is described as following

## Setup

* both generation and ranking settings. In the
* response ranking setup, the candidates are scored with their
  log-likelihood. For the
* GPT2 (Radford+  2019) and DialoGPT (Zhang+ 2019) we have finetuned, we

## Result and Analysis

* metrics in tab 4
  * Following Zhang+ (2018) and Liu+ (2020), we report the
  * Hits@1, Perplexity and F1 to evaluate the methods in Table 4. By the
* P 2 B OT (Liu+ 2020) is the SOTA model reported in this task
* generative baseline using S EQ 2S EQ with attention mechanism (Bahdanau+ 14)
* finetuning GPT2 or DialoGPT2 models with our value function provides a
  significant performance boost compared to simply training them with MLE
* Our `DialoGPT + Value` model achieves
  new SOTA performance on perplexity and F1

# Empathetic Dialogues

* Empathetic Dialogues (Rashkin et al. 2019) provides
  25k conversations grounded in emotional situations
* tests the dialogue system’s capability to produce empathetic responses
* Each dialogue is grounded in a specific situation where a speaker was feeling
  a given emotion, with a listener responding. In this section, we demonstrate
* we leveraged ValueNet to improve the emotion classification accuracy and
  further improve the empathetic response generation

## Emotion Classification

* An auxiliary task that is highly related to empathetic dialogue generation
  is emotion classification. In Empathetic Dialogues, each situation is
  written in association with a given emotion label. A total of
* 32 emotion labels were annotated to cover a broad range of posit and neg emos

### Result

* baseline that directly applies the BERT model for emotion classification. As
* Table 5: the additional value information benefits emotion classification
  * relative improvement of 5.2% on DistilBERT and 6.4% on BERT

## Empathetic Dialogue Generation

* our value model helps the empathetic dialogue generation
* Empathetic Dialogues applies Prepend-K,
  when predicting the utterance given the dialogue history and the situation
  * Prepend-K is a strategy to add supervised information to data,
  * We apply the strategy of prepending the top-k emotion labels for dialog gen
  * The top predicted label from the classifiers of emotion is prepended to the
    beginning of the token sequence as encoder input, as below:
  * eg “I finally got promoted!” ~> “`proud` I finally got promoted!”

# Value Profiling

* fig 5 visualizes the 10-dimensional value of four example scenarios
* the value model provides a numerical speaker profile
