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

* incorporating the theory of human value to dialogue systems by
* our dataset shares a similar nature with multiple social commonsense
  benchmarks and knowledge bases
* we apply our ValueNet for various dialogue tasks related to EQ

## Theory of Human Value and Utility

* in intercultural research, the theory of basic human values (Schwartz 2012)
  * ten basic personal values that are recognized across cultures and explains
    where they come from, as shown in Figure 1
  * The closer/distant any two values in either direction around the circle,
    the more similar/antagonistic their underlying motivations are; the more
  * why ten? an arbitrary convenience. It is reasonable to partition the value
    * A refinement of the theory (Schwartz+ 2012), partitions the same
      continuum into 19 more narrowly defined values that permit more precise
* utility (Fishburn 1970) is initially defined as
  a measure of pleasure or satisfaction in economics and ethics that
  * drives human activities at all levels. Therefore,
* when we teach agents to speak and act in a socially intelligent way,
  an approach considering human value utilities should be adopted. In this
* we aim to learn a utility function for each dimension of value and steer the
  dialogue system response generation accordingly

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
  a transmitter-receiver-based framework with explicitly human understanding
  modeling to enhance the quality of personalized dialogue generation
* Empathetic Dialogues (Rashkin+ 2019) is a dataset that provides
  25k conversations grounded in emotional situations. Each dialogue is grounded
  in a specific situation where a speaker was feeling a given emotion

# The ValueNet Dataset

## Social Scenario Curation

## Value-Aspect Attitude Annotation

# Value Modeling

## Task Formalization

## Model

## Result and Analysis

# Persona-Chat

## Task Formalization

## Model

## Setup

## Result and Analysis

# Empathetic Dialogues

## Emotion Classification

## Empathetic Dialogue Generation

# Value Profiling

* fig 5 visualizes the 10-dimensional value of four example scenarios
* the value model provides a numerical speaker profile
