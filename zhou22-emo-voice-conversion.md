Emotional voice conversion: Theory, databases, and [our] ESD
K Zhou, B Sisman, R Liu, and H Li,
Speech Communication, vol. 137, pp. 1–18, 2022

  All the codes and speech samples are publicly available

# Abstract

* We release the Emotional Speech Database (ESD), publicly available
  * one of the largest emotional speech databases, and is
    suitable for multi-speaker and cross-lingual emotional voice conversion,
    and other speech _synthesis_ studies
* 350 parallel utterances spoken by 10 native English and 10 native Chinese
  * 5 emotion categories (neutral, happy, angry, sad and surprise). More than
  * > 29 h of speech data were recorded in a controlled acoustic environment
* experiments on the ESD database, this paper provides a reference benchmark

# 1 Intro

* Mehrabian and Wiener, (1967) indicates that the spoken words, which are
  * verbal convey only 7% of the message when communicating feelings and
    attitudes. Non-verbal vocal attributes (38%) and facial expression (55%)
    have a major impact on the expression of social attitudes
* Emotional voice conversion (EVC) is a technique that aims to
  convert the emotional state of the utterance from one to another while
  preserving the linguistic information and speaker identity, Fig.  1(a). It
  * project the desired emotion into a human voice, for example, to act or to
  * not adequately equipped with human-like emotions (Schuller & Schuller 2018)
* Earlier studies of voice conversion are focused on modeling the mapping
  * Gaussian mixture model (GMM, Toda+ 2007)
  * partial least square regression (Helander+ 2010)
  * frequency warping (Erro+ 2009a) and
  * sparse representation (Çişman+ 2017, Sisman+ 2018b, Sisman+ 2019b)
* Deep learning approaches, such as
  * deep neural network (DNN, Chen+ 2014, Lorenzo-Trueba+ 2018a)
  * recurrent neural network (RNN, Nakashika+ 2014)
  * generative adversarial network (GAN, Sisman+ 2018c) and
  * sequence-to-sequence model with attention (Zhang+ 2019b, Huang+ 2019) have
* with non-parallel training data have been studied, for example,
  * domain translation (Kaneko and Kameoka, 2017, Kameoka+ 2018),
  * multitask learning (Zhang+ 2019a) and
  * speaker disentanglement (Hsu+ 2016, Hsu+ 2017, Tanaka+ 2019) are among the
* Both speaker voice conversion and emotional voice conversion aim to preserve
  the speech content and to convert para-linguistic information
  * speaker voice conversion, the speaker identity is thought to be
    characterized by the speaker’s physical attributes, which are determined by
    * spectrum conversion (Kain and Macon, 1998, Desai+ 2010, Sisman, 2019). It
    * prosody-related features are speaker-independent, that are to be carried
      forward from the source to the target (Liu+ 2020a).  However, in
  * emotional voice conversion, emotion is inherently supra-segmental and
    * emo involves both spectrum and prosody (Arias+ 2020, Schuller and
      Schuller, 2020)
    * it is insufficient to convert the emotion through frame-wise spectral
      mapping (Erro+ 2009b)
    * Segmental level prosodic dynamics needsed (Tao+ 2006)
* emotional voice conversion include
  * early studies on
    * GMM technique (Aihara+ 2012, Kawanami+ 2003)
    * sparse representation technique (Aihara+ 2014)
    * incorporated framework of hidden Markov model (HMM), GMM and fundamental
      frequency (F0) segment selection method (Inanoglu and Young, 2009). The
  * deep learning have seen remarkable performance, such as
    * DNN (Lorenzo-Trueba+ 2018a, Luo+ 2016, Luo+ 2017)
    * highway neural network (Shankar+ 2019a)
    * deep bi-directional long-short-term memory network (DBLSTM, Ming+ 2016a)
    * sequence-to-sequence model (Robinson+ 2019, Le Moine+ 2021)
* Beyond parallel training data, new techniques have been proposed to
  * learn the translation between emotional domains
    with CycleGAN (Zhou+ 2020b, Shankar+ 2020b) and StarGAN (Rizos+ 2020), to
  * disentangle the emotional elements from speech with auto-encoders
    (Zhou+ 2021b, Gao+ 2019, Cao+ 2020, Schnell+ 2021)
  * leverage text-to-speech (TTS, Kim+ 2020, Zhou+ 2021a) or
    automatic speech recognition (ASR, Liu+ 2020b). Such framework generally
* works well in speaker-dependent tasks. Studies have also revealed that the
* emotions can be expressed through some universal principles that are shared
  across different individuals and cultures (Ekman, 1992, Kane+ 2014, Manokara+
  2020), that motivates the study of
  * multi-speaker (Shankar+ 2019, Shankar+ 2020, Liu+ 2020b), and
    speaker-independent emotional voice conversion
    (Zhou+ 2020c, Choi and Hahn, 2021)


* Speaker-independent emotional voice conversion studies call for a large DB
  * VCTK database (Yamagishi+ 2019), CMU-Arctic database (Kominek and Black,
    2004), and Voice Conversion Challenge (VCC) corpus (Toda+ 2016,
    Lorenzo-Trueba+ 2018b, Zhao+ 2020), are designed for speaker voice
    conversion. The study of emotional voice conversion is facing the lack of a
  * no large-scale, multi-speaker, and open-source emotional speech database
  * imperfect recording condition and limited lexical variability are other
    limitations. Based on the review of the current emotional voice conversion
This paper is organized as follows

#  We first give a comprehensive overview of recent studies on emotional voice conversion in Section 2

#  3 We discuss the 19 existing databases (Zhou+ 2021c)

# 4. ESD database

*  We then formulate the design of a novel ESD database for speaker-independent emotional voice conversion, that is also suitable for other speech synthesis tasks, such as mono-lingual or cross-lingual speaker voice conversion and emotional text-to-speech
*  The ESD database consists of a total of 29 h of audio recordings from 10 native English speakers and 10 native Chinese speakers, covering 5 different emotion categories (neutral, happy, angry, sad and surprise)
*  It represents one of the largest emotional speech databases publicly available, in terms of speaker and lexical variability
*  All the recordings are conducted in the studio with professional devices to guarantee audio quality

#  5, we report the performance for the ESD database in emotional voice conversion

#  6, we show the promise of the ESD database on other voice conversion and text-to-speech tasks

#  7 concludes the study
