Mind the gap: On the value of silence representations to lexical-based SER
Matthew Perez, Mimansa Jaiswal, Minxue Niu, Cristina Gorrostieta,
  Matthew Roddy, Kye Taylor, Reza Lotfian, John Kane, Emily Mower Provost
Interspeech 2022, 156-160, doi: 10.21437/Interspeech.2022-10943

# Abstract

* Speech timing and non-speech regions (ie ``silence"), are often critical in
  the perception of spoken language. Silence represents an important
  paralinguistic component in communication. For example, some of 
  ( its functions include conveying emphasis, dramatization, or even sarcasm
  In speech emotion recognition (SER), there has been relatively little work on
  investigating the utility of silence and no work regarding the effect of
  silence on linguistics. In this work, we present a novel 
* our framework fuses linguistic and silence representations for emotion
  recognition in naturalistic speech using the MSP-Podcast dataset. We
  * two methods to represent silence in SER models; the first approach uses
    * utterance-level statistics, while the second learns 
    * a silence token embedding within a transformer language model. Our
* results show that modeling silence does improve SER performance and that
  * as a token in a transformer language model significantly improves
  * MSP-Podcast CCC of .191 and .453 for activation and valence respectively
* we analyse on the attention of silence and find that 
  silence emphasizes the attention of its surrounding words
* from the Conclusion: silence location and frequency are also important

# 2 Rel work

* on MSP-Podcast, relatively few works used linguistic features [17, 18]. One
  [17] L. Pepino, P. Riera, L. Ferrer, and A. Gravano, “Fusion approaches for
  emotion recognition from speech using acoustic and text-based features,” in
  IEEE International Conference on Acoustics, Speech and Signal (ICASSP 2020)
  [18] S. Srinivasan, Z. Huang, and K. Kirchhoff, “Representation learning
  through cross-modal conditional teacher-student training for SER"
  arXiv preprint arXiv:2112.00158, 2021.
  <~ lack of a ground truth transcription. However, a 
  * widely used approach is to apply off-theshelf automatic speech recognition
    systems to obtain the text content. 
  * Pepino+: categorical emotion classification using both GloVe and BERT
    * MSP-Podcast (version 1.6). The authors 
    * they transcribe utterances using Google Cloud Speech-to-Text and 
    * filter for Angry, Happy, Sad, and Neutral utterances to perform 4-class
    * focus: multimodal SER framework and ultimately achieve an 
    * unweighted average recall (UAR) score of 0.59 [17].
  * Srinivasan+ focused on multimodal SER for MSP-Podcast (version 1.6) 
    * by combining BERT representations with acoustic representations from ASR.
      The authors use an internal ASR system for generating transcriptions as
    * multitask learning on dimensional emotion labels and achieve 
    * CCC of 0.757 and 0.627 for activation and valence respectively using a
      multimodal student-teacher network [18].
