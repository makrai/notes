Recent Advances in Speech Language Models: A Survey 
Wenqian Cui, Dianzhi Yu, Xiaoqi Jiao, Ziqiao Meng, Guangyan Zhang, Qichao Wang,
  Steven Y. Guo, Irwin King
ACL 2025 cui-etal-2025-recent

https://github.com/dreamtheater123/Awesome-SpeechLM-Survey

# Abstract

* Speech Language Models (SpeechLMs)—
  foundation models designed to understand and generate speech—emerge as a
* survey: architectural components, training methodologies,
  evaluation strategies, and the challenges and potential directions for future

# Introduction

* Text-based Large Language Models (LLMs, Zhao+ 2023; Minaee+ 2024)
* Automatic Speech Recognition (ASR) + LLM + Textto-Speech (TTS) framework
  (Figure 1a) (Huang+ 2024b; Shen+ 2024). In this setup, the user’s spoken input
  * problems.
    1. loss of paralinguistic information (eg pitch, timbre, tonality, etc).
      (Zhang+ 2023a)
    1. Significant latency (Xie and Wu, 2024a; Défossez+ 2024; Fang+ 2024)
      * eg ASR often includes an additional text decoder
        (Radford+ 2023; Le+ 2020)
    1. Cumulative error, particularly during the transition between ASR and LLM
       (Fathullah+ 2024; Tang+ 2024)
* SpeechLMs (Components: Sec 3)
* training is integrated with the speech encoding
* potential to enable real-time voice interactions, 
  * allowing the model to be interrupted by users or to speak simultaneously
* taxonomy (Figure 2)

# 2 Problem Formulation

# 3 Components in SpeechLM (Fig 1b)

## 3.1 SpeechLM encode speech waveforms directly into speech tokens

* speech tokens capture both semantic and paralinguistic information from audio,

## 3.2 SpeechLMs then model these tokens autoregressively

## 3.3 Finally, the generated tokens are synthesized back to speech

# 4 Training recipes involved in their development

# 5 Metrics to evaluate SpeechLMs

# 6 Challenges and future directions in this area
