Leveraging LLMs for Sarcastic Speech Annotation in Sarcasm Detection
Zhu Li, Yuqing Zhang, Xiyuan Gao, Shekhar Nayak, Matt Coler
Interspeech 2025 17-21 August 2025, Rotterdam, The Netherlands

# Abstract

* existing detection systems often rely on multimodal data (ie visual)
  * including facial expressions, gestures
* we: only speech is available
* we propose an annotation pipeline that leverages large language models (LLMs)
  to generate a sarcasm dataset
  * Using a publicly available sarcasm-focused podcast
  * GPT-4o and LLaMA 3 for initial sarcasm annotations, followed by
    human verification to resolve disagreements
  * Applying this approach to natural conversational data from OSPod, we
.
* We validate this approach by comparing annotation quality and detection perf
  on a publicly available sarcasm dataset using a collaborative gating
  architecture
* we introduce PodSarc, a large-scale sarcastic speech dataset
  * 73.63% F1 score, demonstrating the dataset’s potential as a benchmark

# 1 Intro

* sarcastic: complex combinations of lexical content, prosodic features, and
  contextual cues to signal sarcastic intent. While humans generally interpret
* sarcasm detection in speech: small annoted datasets, chall generaliz [1, 2, 3] 
* Publicly available datasets eg MUStARD [4] and its extension, MUStARD++ [5]
  * compiled from TV shows, include multimodal data and enable video-level
    multimodal sarcasm detection. However, these multimodal datasets are 
  * limited in size and scope, hindering the development of robust detection
* multimodal feature fusion [2, 6, 7, 8]. However, in realworld applications,
  * hE audio-only scenarios like podcasts, radio broadcasts, and telephone
* text-based sarcasm detection has progressed significantly in NLP
  * hE subtle cues in speech cannot be captured in this manner, since sarcasm
  * eg intonation, pitch, pacing, and emphasis [9, 10]. More importantly, 
  * the scarcity of sarcastic utterances makes it difficult for detection models
* most existing approaches rely on low-level acoustic features [5]. Thus, we
  * need: large-scale annotated datasets specifically targeting sarcastic speech
* LLMs for emotion [11, 12], humor [13] and sarcasm understanding [14]. However,
  * most advancements have been in text and image modalities [15]. This work
    leverages LLMs to facilitate sarcasm annotation of real-world
* Overly Sarcastic Podcast (OSPod), a series with a rich and diverse use of
  naturalistic and spontaneous sarcastic expressions.
* Human annotators are incorporated to resolve disagreements between LLM-based
  annotations.
* contributions: 
  * We demonstrate the feasibility of using LLMs to facilitate sarcasm annot,
    enabling the creation of a bi-modal sarcastic speech dataset with reduced
    reliance on human annotators. 
  * We validate the effectiveness of our LLM-based annotation approach by
    comparing annotation performance and testing detection models on a publicly
    available dataset. 
  * Using this pipeline, a large-scale high-quality sarcastic speech dataset for
    speech-based bi-modal sarcasm detection, with potential applications

# 2. Related Work

## Datasets for sarcasm detection

* sarcasm can overlap with emotions like anger, joy, or surprise

## Automatic speech data collection 

* Gathering large-scale, high-quality training data with appropriate labels has
* segmentation, transcription, and speaker labels, significantly advancing
* removing noise, reverberation, and overlapping speech [18, 19]

## LLMs for data annotation 

* LLMs are increasingly being explored as data annotators for scenarios with
  limited or welldefined label sets [20, 21, 22]. Recent studies have explored
* affective capabilities of LLMs, demonstrating their ability to 
  infer emotions in given contexts and 
  respond with emotional support in dialogues [15].
* LLMs like GPT: promise in identifying emotions and intent from text [11, 23].
* zero~ or few-shot emotion recognition tasks: good performance [11, 24, 25]

## 4.1. Experimental setup

* We follow MUStARD++ for feature extraction and sarcasm detection [5].
  * [MUStARD++](https://github.com/cfiltnlp/MUStARD_Plus_Plus) MUStARD++
    introduces a collaborative gating architecture that enables multimodal
    feature fusion, followed by classification through fully connected layers.
    While 
  * the original implementation integrates text, audio, and visual modalities 
  * we focus on the text and audio modalities. Below, we briefly describe the

# 5 Conclu

* future: 
  * distinguish sarcasm from hyperbole, irony, and other non-literal speech,
  * incorporating emerging language models to improve annotation accuracy, and
  * greater linguistic and cultural diversity. Future work could evaluate
  * whether models trained on LLM-annotated data transfer effectively to
    human-annotated test sets.
