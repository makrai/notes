      Leveraging LLMs for Sarcastic Speech Annotation in Sarcasm Detection
          Zhu Li, Yuqing Zhang, Xiyuan Gao, Shekhar Nayak, Matt Coler
         Interspeech 2025 17-21 August 2025, Rotterdam, The Netherlands

# Abstract

* existing systems often rely on multimodal data (incl facial express, gestures)
* we: only speech is available
* we propose an annotation pipeline that
  leverages LLMs to generate a sarcasm dataset
  * Using a publicly available sarcasm-focused podcast
  * GPT-4o and LLaMA 3 for initial sarcasm annotations, followed by
    human verification to resolve disagreements
  * Applying this approach to natural conversational data from OSPod
* We validate this approach by comparing annotation quality and detection perf
  on MUStARD++
  * MUStARD++: a public sarcasm dataset using a collaborative gating archit
* we introduce PodSarc, a large-scale sarcastic speech dataset
  * 73.63% F1 score, demonstrating the dataset’s potential as a benchmark

# 1 Intro

* sarcasm: complex combination of lexical content, prosodic features, and
  contextual cues to signal sarcastic intent
* sarcasm detection in speech: small annoted datasets, chall generaliz [1, 2, 3]
* Publicly available datasets eg MUStARD [4] and its extension, MUStARD++ [5]
  * compiled from TV shows, include multimodal data and enable video-level
    multimodal sarcasm detection
  * hE limited in size and scope, hindering the development of robust detection
* multimodal feature fusion [2, 6, 7, 8]
  * hE audio-only scenarios like podcasts, radio broadcasts, and telephone
* text-based sarcasm detection has progressed significantly
  * hE subtle cues in speech cannot be captured in this manner
  * eg intonation, pitch, pacing, and emphasis [9, 10]
  * the scarcity of sarcastic utterances makes training difficult
* most existing approaches rely on low-level acoustic features [5]
  * need: large-scale annotated datasets specifically targeting sarcastic speech
* LLMs for emotion [11, 12], humor [13] and sarcasm understanding [14]
  * most advancements have been in text and image modalities [15]
  * we leverage LLMs to facilitate sarcasm annotation
* Overly Sarcastic Podcast (OSPod), a series with a rich and diverse use of
  naturalistic and spontaneous sarcastic expressions
* Human annotators resolve disagreements between LLM-based annotations
* contributions:
  * We demonstrate the feasibility of using LLMs to facilitate sarcasm annot,
    enabling the creation of a bi-modal sarcastic speech dataset 
    * reduced reliance on human annotators
  * We validate the effectiveness of our LLM-based annotation approach by
    comparing annotation performance and testing detection models
    on a publicly available dataset
  * Using this pipeline, a large-scale high-quality sarcastic speech dataset
    for speech-based bi-modal sarcasm detection

# 2. Related Work

## Datasets for sarcasm detection

* sarcasm can overlap with emotions like anger, joy, or surprise

## Automatic speech data collection

* Gathering large-scale, high-quality training data with appropriate labels
* segmentation, transcription, and speaker labels, significantly advancing
* removing noise, reverberation, and overlapping speech [18, 19]

## LLMs for data annotation

* LLMs are increasingly being explored as data annotators for scenarios with
  limited or well-defined label sets [20, 21, 22]
* affective capabilities of LLMs: they can infer emotions in given contexts and
  respond with emotional support in dialogues [15]
* LLMs like GPT: promise in identifying emotions and intent from text [11, 23]
* zero~ or few-shot emotion recognition tasks: good performance [11, 24, 25]

# 4. Experiments and Results

## 4.1. Experimental setup

* We follow MUStARD++ for feature extraction and sarcasm detection [5]
  * [MUStARD++](https://github.com/cfiltnlp/MUStARD_Plus_Plus) 
  * multimodal feature fusion with a collaborative gating architecture that
  * classification through fully connected layers
  * the original implementation integrates text, audio, and visual modalities
  * we focus on the text and audio modalities

# 5 Conclu

* future:
  * distinguish sarcasm from hyperbole, irony, and other non-literal speech,
  * incorporating emerging language models to improve annotation accuracy, and
  * greater linguistic and cultural diversity. Future work could evaluate
  * whether models trained on LLM-annotated data transfer effectively to
    human-annotated test sets
