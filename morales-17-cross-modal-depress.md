A Cross-modal Review of Indicators for Depression Detection Systems
Michelle Morales, Stefan Scherer, Rivka Levitan
CLPsych WS 2017 4th Workshop on Computational Linguistics and Clinical Psyc
  From Linguistic Signal to Clinical Reality

# Abstract

* This paper surveys automatic detection of depression
  * the first cross-modal review of depression detection systems
  * best practices and most promising approaches to this task

# 1 Intro

* challenge: disconnect between language technology subfields
  * approaches to depression assessment from natural language processing (NLP),
    speech processing, and human-computer interaction (HCI) tend to silo by
    subfield, with little discussion about the utility of combining approaches
  * Each subfield tends to approach the task from a unique perspective, with
    slightly different goals, and completely different data sources
    => it is difficult to compare
  * Each data source is labeled for depression through different approaches,
    * rating scales, self-report surveys, manual annotation, etc
  * various definitions of how depression is defined across studies
* This survey paper aims to serve as a bridge between the subfields
  * the first review of depression detection systems across subfields & modalit
  * questions, how has depression been defined and annotated in detection syss?
    * What kinds of depression _data_ exists or could be obtained
    * What (multimodal) _indicators_ have been used for the automatic detection
    * How do we _evaluate_ depression detection systems?
    * Each research question could serve as the main focus of an entire paper
* this review briefly touches upon each question
  * reviewing indicators of depression and subsequently features for depression
  * features across modalities: visual, acoustic, linguistic, and social
  * defining and annotating depression, existing data sources, and how to eval
  * practical or ethical issues

# 2 Defining and Labeling Depression

# 3 Datasets

* Computational Linguistics and Clinical Psychology (CLPsych) Shared Task
  (2013-2017) and the
  * Audio/Visual Emotion Recognition (AVEC) Workshop Depression Subchallenge
    (2013-2016) are examples of
  * depression detection system challenges that spurred interest, promoted
    research, and built connections across the research community
  * In this section, we describe the kinds of depression data that exist,
    listed in Table 1
  * We focus solely on datasets that are publicly available to download
    * For a detailed list of databases both private and public that have been
      used in speech processing studies see (Cummins+ 2015a)
* Both the AVEC 2013 and 2014 corpora are available to download 1
  * The AVEC challenges are organized competitions aimed at comparing
    multimedia processing and machine learning methods for automatic audio,
    video and audiovisual emotion and depression analysis,
  * 2013 corpus (Valstar+ 2013) includes 340 video clips in German of
    subjects performing a HCI task while being recorded by a webcam and a
    microphone
    * The video files each contain
      a range of vocal exercises, including free and read speech tasks
    * labeled with a single value per recording using the BDI-II
  * 2014 corpus (Valstar+ 2014) is a subset of the AVEC 2013 corpus
    * 300 videos in German; the duration ranges from 6 seconds to 4 minutes
    * The files include a read speech passage (Die Sonne und der Wind) and an
      answer to a free response question
* The Crisis Text Line is a free 24/7 crisis support texting hot line
  * live trained crisis counselors receive and respond quickly to texts
  * the organization supports people with mental health issues through texting
  * open data collaboration
  * access: researchers must complete an Institutional Review Board application
    with their own university and an application with Crisis Text Line, which
  * a vast amount of text data annotated by conversation issue, including but
    not limited to
    depression, anger, sadness, body image, homelessness, selfharm, suicidal
* The Distress Analysis Interview Corpus (DAIC, Gratch+ 2014) contains
  * clinical interviews in English designed to support the diagnosis of
    psychological distress conditions
    eg anxiety, depression, and post-traumatic stress disorder
  * The interviews were conducted by an animated virtual interviewer
    * meant to simulate the first step in identifying mental illness
      in health care settings
      * a semi-structured interview where health care providers ask a series of
        open-ended questions with the intent of identifying clinical symptoms
  * audio and video recordings and extensive questionnaire responses
  * depression score from the PHQ-8 (Kroenke+ 2009)
  * A portion of the corpus was released
    during the AVEC 2016 Depression Sub-challenge and is available to download
    * includes transcripts of the interview
* The DementiaBank Database 4 represents data
  * collected between 1983 and 1988 as part of the Alzheimer Research Program
    at the University of Pittsburgh (Becker+ 1994)
  * multimedia interactions for the study of communication in dementia
  * A subset of the participants from the dataset also have HAM-D depres scores
* The ReachOut Triage Shared Task dataset 5 consists of
  65,024 forum posts written between July 2012 and June 2015 (Milne+ 2016)
  * A subset of the corpus (1,227 posts) is manually annotated by three
    separate expert judges indicating how urgently a post required a moderator
  * Labels included crisis, red, amber, and green
* The SemEval-2014 Task 7 (Pradhan+ 2014) dataset 6 represents clinical notes
  * annotated for disorder mentions, including mental disorders eg depression

# 4 Indicators of Depression

## 4.4 Multimodal Indicators

* Scherer+ (2013a), investigated visual signals and voice quality in a
  * depression vs no depression with an accuracy of 75%
* Morales and Levitan (2016b)
  * a comparative investigation of speech versus text-based features for
  * multimodal system leads to the best performing system
  * investigated using an automatic speech recognition system (ASR) to
    automatically transcribe speech and found that
    text-based features generated from ASR transcripts were useful
* Fraser+ (2016) extracted a large number of textual and acoustic features
  * Textual features included POS tags, parse tree constituents,
    psycholinguistic measures, measures of complexity, vocabulary richness, and
    informativeness
  * Acoustic features include fluency measures, MFCCs, voice quality features,
    and measures of periodicity and symmetry
  * detect depression with 65.8% accuracy
* suicide risk assessment found that multimodal indicators were able to
  discriminate between suicidal and non-suicidal patients (Venek+ 2016)

# 5 Evaluation

# 6 Discussion

* mechanical prediction (statistical, algorithmic, etc) is typically
  as accurate or more accurate than clinical prediction (Grove+ 2000)
* not require an expert judgment and completely reproducible

# 7 Conclusion

* researchers should begin to follow the best practices (Stodden & Miguez 2013)
* Best practices lead to communication standards, which will help disseminate
  reproducible research, facilitate innovation by enabling
  data and code re-use, and enable
  broader communication of the output of computational research
* Without the data and code that underlie scientific discoveries, is is all
  but impossible to verify published findings
