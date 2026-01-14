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
* Speech Language Models (SpeechLMs, Figure 1b). Specifically, SpeechLMs 
  * encode speech waveforms directly into speech tokens (Section 3.1). This
  * capture both semantic and paralinguistic information from audio, thereby
  * SpeechLMs then model these tokens autoregressively (Section 3.2), without
  * Finally, the generated tokens are synthesized back to speech (Section 3.3).
    This integrated approach eliminates the need to chain three separate
    modules, significantly reducing latency. By working directly with the
    encoded speech tokens, SpeechLMs effectively mitigate the cumulative
  * training is integrated with the speech encoding, whereas the training of the
  * potential to enable real-time voice interactions, 
    * allowing the model to be interrupted by users or to speak simultaneously
  * taxonomy (Figure 2). We explore the various 
    * components that constitute their architecture (Section 3) and the 
    * training recipes (Section 4) involved in their development. We aim to
      elucidate the current state of the field by analyzing these models from
    * metrics to evaluate SpeechLMs (Section 5) and discuss the 
    * challenges and future directions in this area, hoping to prov (Section 6)
