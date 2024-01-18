How to Design a Relevant Corpus for Sleepiness Detection Through Voice?
VP Martin, Jean-Luc Rouas, J-A Micoulaud-Franchi, Pierre Philip, J Krajewski
Front Digit Health, 22 September 2021, Sec Health Informatics, Volume 3 ~ 2021

# Abstract

* automatic detection of pathologies affecting speech
  * Voice processing has been used for eval Parkinson, Alzheimer, or depression
  * are any results sufficient for clinical?
  * not the case for the detection of sleepiness
  * Even two international challenges and the recent advent of deep learning
    have still not managed to change this situation
* we: the observed average performances find their cause in corpus design
* organization
  * we refine the concept of sleepiness related to the ground-truth labels
  * in-depth study of four corpora
    * the methodological choices
    * the underlying biases they may have induced
  * guidelines for the design of new corpora

# Intro

* psychiatric pathologies that impact both motorical actions and cognitive plan
  * bipolar disorders [57.4% of accuracy in Ringeval (7)]
  * autism spectrum [69.4% on four categories in Asgari (8)] or, so far,
  * depression [88% of accuracy in in Vázquez-Romero and Gallardo-Antolín (9)]
    * the most studied
* a complete review is proposed in Cummins (10)
  * we focus on chronic and instantaneous sleepiness
* two main objectives of sleepiness detection through voice

## Chronic sleepiness

* two corpora have been designed at the Sleep Clinic of Bordeaux Hospital
* Maintenance of Wakefulness Test Corpus (MWTc) 2018--2019
  * recordings of 75 patients undertaking a Maintenance of Wakefulness Test
  * multiple methodology defects prevented us from exploiting it
  * no study has been published based on this corpus
* Multiple Sleep Latency Test corpus (termed hereafter MSLTc, sec 3.4)
  * studies aiming at estimating chronic sleepiness through voice are
    based on the MSLTc (13)
  * recordings of 106 patients affected by sleep pathologies
    * These patients present symptoms such as hypersomnolence,
      a chronic sleepiness impacting their everyday life
  * labels are
    * the sleep latencies to a medical test measuring their daytime propensity
      to fall asleep [the Multiple Sleep Latency Test (MSLT)], and
    * the answer to a short-term subjective sleepiness questionnaire
      [Karolinska Sleepiness Scale (KSS)]
  * studies based on this corpus only led to preliminary results
    * Martin (2020 in fr): an Unweighted Average Recall (UAR) of 60%
      on the detection of daytime propensity to sleep based on voice biomarkers
      * UAR: mean of the recall on the two classes
      * an UAR of 82.6% with a system based on reading errors (15)
      * the implementation of these systems in medical applications is not
        ready yet
      * the first suffers from too low accuracy, and
      * the second was a proof of concept based on manual annotation of the
        recordings by human annotators, not a fully automated process

## Immediate sleepiness: short-term subjective sleepiness on healthy subjects

* applic in the monitoring of perf for tasks requiring high cognitive loads,
* two international challenges: the
  * Interspeech 2011 (IS11) challenge on speakers state estimation (17),
    introducing the Sleepy Language Corpus (SLC), and the
  * Interspeech 2019 (IS19) challenge on continuous sleepiness estimation (18)
    that introduced the SLEEP corpus (aka the Dusseldorf Sleepy Language Corp)
  * both label instantaneous sleepiness with the KSS, a medical questionnaire
    aiming at measuring instantaneous subjective sleepiness (see section 2.1.1)
* IS11: the objective was to achieve the highest UAR on binary classification
  Sleep (SL) and Non-Sleepy (NSL, delimited by a 7.5 threshold in the KSS
  * six systems have been proposed for the IS11 challenge,
  * only three outperformed the baseline UAR of 70.3%. The best performances
    have been obtained by a system based on the ASIMPLS algorithm
  * More recently, a work focusing on the longer reading tasks of the SLC has
    reported an accuracy of 76.4% (21)
    * still below the necessary 80–85% for medical uses
  * 9 K samples
* IS19 brought both a new paradigm and a new corpus: the SLEEP corpus
  * regression between the estimated label and the ground-truth KSS
  * > 16,000 samples, seemed more suited for regression (that requires more)
* two studies (22, 23) introduced deep learning systems for the first time in
  the task of sleepiness detection through voice
  * winner of the challenge, who used Fischer vectors and bag-of-features (24),
    achieved a correlation of ρ = 0.387
  * Since then, two other systems using deep learning have been proposed (25,
    26), both achieving performances below the winner of the challenge
* pitfalls and problems in analyzing sleepiness through voice
  * semantics plays an important role
  * the wording of questions and the used scales significantly affect the
    response of the patients when self-assessing their sleep duration (27)
  * the definition of task impacts the experimental conditions and the labeling
    * in common language, _lack of vigilance, a drop of performances,_
      _fatigue, sleepiness_ or _drowsiness_ are interchangeable
    * hE different medical definitions, remediation, measures, and voice expr
* Huckvale+ (2020) questioned the feasibility of the task
  * is it even possible to estimate sleepiness through voice?  
  * Are the vocal changes induced by sleepiness visible enough for classif?
  * a sub-corpus of 99 samples of the SLEEP corpora has been annotated by
    25 trained annotators.  The labels obtained in this way have reached a
    correlation of ρ = 0.72 with the ground-truth KSS and
  * binarizing the KSS label using the same 7.5 threshold as in the SLC, they
    achieved an UAR of 93.6%
  * ie human audition can detect subjective sleepiness in the SLEEP corpus
  * hE 
    * there are too many samples per speaker and 
    * recorded in a too restrained diversity of sleepiness states
    * there's a link between the identity of speakers and their KSS levels,
      that prevents algos from learning the impact of sleepiness through voice
* our objective is fourfold
  * a practical definition of sleepiness and related concepts
  * the tools used in the corpora to measure sleepiness
  * corpora
    * we study extensively the four previously mentioned corpora
    * guidelines to design relevant corpora for voice sleepiness detection

# 1. Task statement

# 3. Corpora 5 for automatic detection of sleepiness or excessive sleepiness

* few databases contain enough data for machine learning purposes (13)
* we focus on four of them.  Two of them each have been 
  * used for international challenges on sleepiness
  * recorded to design a virtual physician
* On every one of them, we have computed statistics of the available data,
  dividing the speakers and samples between two classes (SL and NSL), following
  the threshold detailed in each part.  When this piece of information is
  available for both the speakers and the samples, the two levels are labeled
  individually: the label of the speakers does not influence the label of the
  individual sample. Besides statistics on the data available on the corpora,
  * total length of recordings, the mean length of the recordings, and,
  * when the IDs of the patients were available,
    the mean number of samples per speaker

## 3.1. Sleepy Language Corpus (SLC, Düsseldorf and Wuppertal, Germany)

* released in 2011 during the IS11 paralinguistic challenge (17)
* 99 German speakers
* the reference corpus for all the SOTA systems (28)
  Before the release of the SLEEP corpus in 2019

## 3.2. SLEEP Corpus. Collected at the same location as the SLC

* released in 2019 during the IS19 paralinguistic challenge (18)
* great number of speakers (915) that were recorded, producing 16,464 samples

## 3.3. Maintenance of Wakefulness Test Corpus (MWTc)

* the first attempt to elaborate a large voice corpus
  annotated with objective sleepiness, measured by EEG
* recorded at the Sleep Clinic of Bordeaux’s University Hospital
* 75 patients undertaking an MWT
* numerous biases and incomplete data for a large number of speakers, this
  => not been released
  * nL paved the way for other corpora, such as the MSLTc, presented in sec 3.4
    * interesting characteristics to nourish the later methodology discussions

## 3.4. Multiple Sleep Latency Test Corpus. Elaborated following the MWTc

* Also recorded at the Sleep Clinic of the Bordeaux’s University Hospital
* the same goal as the MWTc
  ie linking objective measures of hypersomnolence and vocal recordings

# 4. Comparison between corpora 9

## 4.1. Speech Tasks and Audio Samples Measures

## 4.2. Medical Labels

## 4.3. Metadata

# 5. GUIDELINES 13

* FIGURE 9 | The different sleepiness measures of this study
  * three axes of the ideal label:
    medical validation, machine learning fitting, and goal fitting
    * KSS: Karolinska Sleepiness Scale
    * ESS: Epworth Sleepiness Scale
    * MSLT: Multiple Sleep Latency Test
    * MWT: Maintenance of Wakefulness Test
  * ML-friendly and fits the goal:
    KSS; MSLT/MWT iteration value without saturation
