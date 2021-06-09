Rowan Zellers and Yejin Choi
Zero-Shot Activity Recognition with Verb Attribute Induction
EMNLP 2017

http://github.com/uwnlp/verb-attributes

# Abstract

* large-scale zero-shot activity recognition
  by modeling the visual and linguistic attributes of action verbs
* e.g. _salute_ has several properties, such as being a
  light movement, a social act, and short in duration
* We use these attributes as the internal mapping between visual and textual
  * reason about a previously unseen action
  * learns to infer action attributes from
    * dictionary definitions and
    * distributed word representations
* results are reasonable

# 1 Intro

* We develop and use a corpus of verb attributes, drawing inspiration from
  * linguistic theories on aspectual verb classes of Vendler (1957)) and
  * studies on linguistic categorization of verbs and their properties
    (Friedrich and Palmer, 2014; Siegel and McKeown, 2000)

# 2 Action Verb Attributes

* seven different groups of action verb attributes
  * motivated in part by
    * potential relevance for visual zero-shot inference, and in part by
    * classical literature on linguistic theories on verb semantics
    * Each attribute group consists of a set of attributes, which sums to 24

### 1 Aspectual Classes

We include the aspectual verb classes of Vendler (1957)
* state: a verb that does not describe a change e.g. _have_, _be_
* achievement: can be completed in a short period of time (_open_, _jump_)
* accomplishment: completion over a longer period of time (e.g.  _climb_)
* activity: without a clear sense of completion (e.g. _swim_, _walk_, _talk_)

### 2 Temporal Duration

* by best-matching temporal units: seconds, minutes, hours, or days + verbs
  with unclear duration (e.g., _provide_)

### 3 Motion Dynamics

* energy level of motion dynamics in four categories
  no motion (_sleep_); low motion (_smile_); medium (_walk_); or high (_run_)
  + motion level depends highly on context, such as _finish_

### 4 Social Dynamics

* solitary act, a social act, or either. This is graded on a 5-part scale

### 5 Transitivity

* whether the verb can take an object, or be used without
* implied action dynamics of the verb between the agent and the world
* object is a person (_I hug her_ is natural), or a thing (_I eat it_), and
  whether the verb is intransitive (_I run_)
* subject is not agent (_snow_)

### 6 Effects on Arguments

* For each of the possible transitivities of the verb, we annotate whether or
  not it involves location change (_travel_), world change (_spill_), agent or
  object change (_cry_) , or no visible change (_ponder_)

### 7 Body Involvements

* body parts involved in carrying out the action
  e.g. _open_ typically involves _hands_ and _arms_ when used in a phys
* head, arms, torso, legs, and other body parts

## Action Attributes and Contextual Variations

* our work include
  1. crowd-sourcing experiments to estimate the aggreement of human judgments
  2. estimating the feasibility of learning models
  3. estimating the predictive power in zeroshot action recognition

## Relevance to Linguistic Theories

* relates to
  * Frame theories of Baker+ (1998a)
  * formal studies on verb categorization based on the characteristics of the
    actions or states that a verb typically associates with (Levin, 1993), and
  * cognitive linguistics literature (Croft, 2012) that focus on
    * causal structure and force dynamics of verb meanings
    * Croft's Radical Construction Grammar
    * Youn+ 15-nek is szerzője

# 3 Learning Verb Attributes from Language 3

* Modeling options include using
  * pretrained word embeddings, as in Section 3.1, or using a
  * sequential model to encode a _dictionary_, as in Section 3.2

## 3.1 Learning from Distributed Embeddings

* we use
  * 300-dimensional GloVe vectors trained on 840B tokens of web data
  * logistic regression to predict each attribute
* We additionally experiment with retrofitted embeddings
  * WordNet (Miller, 1995), Paraphrase-DB (Ganitkevitch+ 2013), and
    FrameNet (Baker+ 1998b)

## 3.2 Learning from Dictionary Definitions

* using a dictionary to predict word embeddings (Hill+ 2016)

### Dealing with multiple definitions per verb

* creates a dataset bias since polysemic verbs are seen more often. Ad-
* tend to be sorted by relevance, thus lowering the quality of the data if all
  definitions are weighted equally during training. To counteract this,
* we randomly oversample the definitions at training time so that
  each verb has the same number of definitions. 4
* At test time, we use the first-occurring definition per verb

# 4 Zero-Shot Activity Recognition 5

## 4.1 Verb Attributes as Latent Mappings

* Given learned attributes for a collection of activities, we would like to
  evaluate their performance at describing these activities from real world
  images in a zero-shot setting. Thus, we consider several models that classify
  an image’s label by pivoting through an attribute representation.

### Overview

* zeroshot: labels are partitioned into `V_train` and `V_test`
* see figures

TODO

# 5 Actions and Attributes Dataset

# 6 Experimental Setup

# 7 Experimental Results

# 8 Related Work
