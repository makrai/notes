    VALUE NET: A New Dataset for Human Value Driven Dialogue System
    Liang Qiu, Yizhou Zhao, Jinchao Li, Pan Lu, Baolin Peng, Jianfeng Gao,
      Song-Chun Zhu
    AAAI 2022 Conference on Artificial Intelligence (AAAI-22)

https://liang-qiu.github.io/ValueNet/

# Abstract

* socially intelligent agent involves speaking guided by its value like a human
  * hE value-driven chatbots are still understudied in dialogue systems.
  * Most existing datasets focus on
    commonsense reasoning or social norm modeling. In this work
* we present 
  * a new large-scale human value dataset called ValueNet, which
    * human attitudes on 21,374 text scenarios.
    * ten dimensions that conform to the basic human value theory in
      intercultural research. We further develop 
  * a Transformer-based value regression model on ValueNet
    to learn the utility distribution.
* Comprehensive empirical results show that the learned value model could
  benefit a wide range of dialogue tasks. For example, 
  * eg by teaching a generative agent with reinforcement learning and the
    rewards from the value model, our method attains
    SOTA performance on the Persona-Chat personalized dialog generation dataset
  * With values as additional features, existing
    emotion recognition models enable capturing rich human emotions in context,
    * further improves the empathetic response generation performance in the
      Empathetic Dialogues dataset.
* ValueNet is the first largescale text dataset for human value modeling, and
  we are the first one trying to incorporate a value model into emotionally
  intelligent dialogue systems

# Introduction

* Value refers to desirable goals in human life. They 
  * guide the selection or evaluation of actions, policies, people, and events.
  * A person’s value priority or hierarchy profoundly affects his or her
    attitudes, beliefs, and traits, making it one 
  * a core component of personality (Schwartz 2012)
* In dialogue systems (socially intelligent chatbots)
  * modeling human values is a critical step towards building (Qiu+ 2021b). By
  * estimate user behavior and cognitive patterns from their utterances and
  * generate responses that conform to the robot’s persona configuration. For
  * eg Jerry prefers a healthy and selfdisciplined lifestyle and steer its
* socially intelligent chatbots has been one of the longest-running goals in AI
  * Early dialogue systems such as Eliza (Weizenbaum 1966), Parry (Colby,
    Weber, and Hilf 1971), and 
  * more recent SimSimi1 , Panda Ichiro (Okuda and Shoda 2018), Replika
    (Fedorenko, Smetanin, and Rodichev 2018), XiaoIce (Zhou+ 2020), were
  * designed to mimic human behavior and incorporate emotional quotients (EQ)
  * related datasets and benchmarks
    * emotion recognition (McKeown+ 2010; Hsu+ 2018; Poria+ 2019; Ghosal+ 2020)
    * personalized dialogue generation (Zhang+ 2018; Liu+ 2020), and 
    * empathetic dialogue generation (Rashkin+ 2019). Even though value plays a
  * hE no explicit modeling of values in the dialogue domain, 
    based on social domain theory.
  * crowdsourcing social commonsense knowledge base or benchmarks
    (Forbes+ 2020; Sap+ 2019; Lourie, Bras, and Choi 2021; Hendrycks+ 2020;
    Hwang+ 2021; Gabriel+ 2021). However, it is 
  * hE not clearly shown how an agent can leverage this knowledge
  * we investigate the usage of a learned value function.
1. curating a knowledge base of human values called VALUE N ET. 
  * Samples with value-related scenarios were identified based on value-defined
    keyword searching. Next, we asked 
  * Amazon Mechanical Turk workers about how the provided scenarios will
    affect one’s value.
  * based on the assumption that values underlie our attitudes; they are the
    guideline by which we evaluate things.
  * Workers assess behaviors/events positively if they promote or protect the
    attainment of the goals we value. Behaviors/events are evaluated
    negatively if they hinder or threaten the attainment of these valued goals.
  * > 21k samples, multi-dimensional knowledge base of value. Figure 1 shows the
  * fig 1: overall structure of VALUE N ET
  * Each split represents a value dimension
    identified in the theory of basic human values (Schwartz 2012)
  * value-related keywords and scenarios
  * The circular arrangement of the values represents a motivational continuum.
    By organizing data in such a structure, we anticipate the VALUE N ET to
    provide comprehensive coverage of different aspects of human values.
2. a Transformer-based value model to evaluate the utility score suggesting the
   positive or negative judgment given an utterance. We provide a 
  * detailed analysis of learning with multiple Transformer variants. Then
  * a wide range of experiments to demonstrate that
    the value model could benefit EQ-related dialogue tasks: 
    * By finetuning a generative agent with reinforcement learning and the
      reward from our value model, the method achieves SOTA performance on the
      personalized dialogue dataset: P ERSONA -C HAT (Zhang+ 2018); 
    * By incorporating values as additional features, in E MPATHETIC D I -
      ALOGUES (Rashkin+ 2019), we improve the emotion classification accuracy
      of existing models, which further facilitates the empathetic response
      generation;
    * Visualization of the value model shows that it provides a numerical way
      of user profile modeling from their utterances.
* our contributions are two-fold. First, we present 
  * a large-scale dataset VALUE N ET for the modeling of human values that are
    well-defined in intercultural research. Second, 
  * [apply] the value model learned from VALUE N ET to several EQ-related tasks
    and demonstrate its usage for building a value-driven dialogue system. 
  * Our methodology can be generalized to a wide range of 
    * interactive situations in socially aware dialogue systems
      (Zhao, Romero, and Rudnicky 2018)
    * human-robot interactions (Yuan and Li 2017; Liang, He, and Anthony’Chen 2021).

# Related Work

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
