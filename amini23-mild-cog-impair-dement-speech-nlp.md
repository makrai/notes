Auto detection of mild cognitive impairment and dementia from voice recordings:
  A natural language processing approach
Samad Amini, Boran Hao, Lifu Zhang, Mengting Song, Aman Gupta, Cody Karjadi,
  Vijaya B. Kolachalama, Rhoda Au, Ioannis Ch. Paschalidis

# Research in context

* No prior work has attempted to automatically process recordings of
  neuropsychological tests
  by first using voice recognition to transcribe them to text and
  then leveraging natural language processing methods for analysis.
* Our findings, based on data from Framingham Heart Study (n = 1084),
* validation area under the curve (AUC) of 92.6%, 88.0%, and 74.4% for
  differentiating Normal cognition from Dementia, Normal or Mild Cognitive
  Impairment (MCI) from Dementia, and Normal from MCI, respectively.
* method can be adapted easily to languages other than English and enable
* cost-effective remote or web-based dementia assessment.

# 1 Intro

* Alzheimer's disease (AD) and related dementias (ADRD). In the United States,
  * can be assessed using 
    * biomarkers such as amyloid beta (Aβ) plaques and neurofibrillary tangles
    * evidence of neurodegeneration from magnetic resonance imaging (MRI)
  * not necessarily determine cognitive decline, since, in some cases, AD brain
    pathology may not translate into clinical expression. Triggered by patient
  * neuropsychological (NP) exam, conducted through an in-person interview, is
    currently the primary method for assessing cognitive decline, even at the
    early stages. The Framingham Heart Study (FHS) NP tests take 45 to 90
    * cover all major cognitive domains, mostly through connected speech,5
      which is a cognitively intense activity.6, 7 FHS has been recording its
* speech can be a strong predictor of cognitive impairment in early stages.8, 9
  * Machine-learning algorithms have been developed to build diagnostic models
  * vocal and lexical features extracted from voice recordings.10-13
    * 10 Hernandez-Domınguez L, Ratte S, Sierra-Martınez G, Roche-Bergua A.
      Computer-based evaluation of Alzheimer's disease and mild cognitive impai
      during a picture description task. Alzheimers Dement. 2018;10:260-268.
    * 11 Liu L, Zhao S, Chen H, Wang A
      A new machine learning method for identifying Alzheimer's disease.
      Simul Model Pract Theory. 2020;99:102023.
    * 12 Pulido MLB, Hernandez JBA, Ballester MAF, Gonzalez CMT, Mekyska J, Smekal Z
      Alzheimer's disease and automatic speech analysis: a review
      Expert Syst Appl. 2020;150:113213.
    * 13 Berisha V, Wang S, LaCross A, Liss J
      Tracking discourse complexity preceding alzheimer's disease diagnosis:
        a case study comparing the press conferences of presidents Reagan & Bush
        J Alzheimers Dis.  2015;45(3):959-963
    * 14 Konig A, Satt A, Sorin A,+ 
      Automatic speech analysis for the assessment of patients with predement &
      Alzheimers Dement (Amst). 2015;1(1):112-124
      * Vocal features were extracted to develop a classifier to predict
    * 15 Fraser KC, Meltzer JA, Rudzicz F
      Linguistic features identify Alzheimer's disease in narrative speech
      J Alzheimers Dis. 2016;49(2):407-422. 
      * linguistic as well as vocal features, achieving accuracy of 81.9% in
* Mild cognitive impairment (MCI) was also identified from healthy cases (area
  * Asgari M, Kaye J, Dodge H
    Predicting mild cognitive impairment from spontaneous spoken utterances.
    Alzheimers Dement (N Y). 2017
    * support vector machine (SVM) on features extracted from manual transcrips
  * Using the FHS battery of tests, Lin+ presented a voice-based predictor to
    identify incidents of dementia with an AUC of 81%.17 In addition, language
    and voice features of 170 participants from FHS were analyzed to predict
    cognitive impairment with an AUC of 94%.  4

* hE, most studies relied on
  both manual transcription and 
    * lengthy and expensive procedure that might hinder it in large-scale
  * handcrafted features of the voice data. Manual
  * small sample sizes and disparities observed in the clinical population. In
  * very few researchers included both MCI and dementia cases in their
* automated detection of MCI is crucial to allow effective intervention 
  * cognitive decline can take several years to evolve from MCI to more severe
* shift toward virtual visits in response to the ongoing health care issues,
  * digital biomarkers have an important role to play.19

* we: automated diagnostic tool to detect MCI and dementia based on voice
  * input: either an audio file or a transcript of the NP interview as input
  * predicts the likelihood of cognitive impairment using machine-learning
* NLP algorithms in health care (see ref.20 for a review). Moreover, NLP has
  made it possible to automatically extract information from unstructured data
  (text, audio, video) in medical records.21-23
* Our study uses a variety of NLP methods, including speech recognition, speech
  diarization, and a transformer-based sentence encoder.
