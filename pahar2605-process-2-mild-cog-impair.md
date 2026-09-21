PROCESS-2: A Benchmark Speech Corpus for Early Cognitive Impairment Detection
Madhurananda Pahar, Caitlin H. Illingworth, Bahman Mirheidari,
  H Elghazaly, F Peters, S Young, W Leung, L Kaur, D Blackburn, H Christensen
arXiv:2605.14888 [cs.SD]

* dataset: https://huggingface.co/datasets/ CognoSpeak/PROCESS-2
* code required to reproduce statistical analyses, embedding generation, and
  baseline modelling experiments along with associated Anaconda environments:
  https://github.com/CognoSpeak/PROCESS-2 The codebase is

* clinically validated datasets collected under realistic conditions
* PROCESS-2, a large-scale speech dataset designed to support research
* spontaneous and task-oriented speech
* 200 healthy controls, 150 mild cognitive impairment, and 50 dementia
* collected using the CognoMemory digital assessment platform
* Each participant completed a single assessment session, including
  picture description and verbal fluency tasks
* manually verified transcripts and participant-level metadata
* 21 hours of speech audio with predefined train/test partitions
* demographic balance, clinical consistency, recording stability,
  embedding-space structure, and reproducible baseline modelling performance
  * clinically meaningful group separation and stable performance across
    modelling approaches while preserving real-world conversat variability
* released under controlled access via Hugging Face to enable responsible use

# 1. Background & Summary

## 1.1. Scientific Context

* Neurodegenerative disorders associated with cognitive decline,
  including mild cognitive impairment (MCI) and dementia
  * a major and rapidly expanding global health challenge
    driven by demographic ageing [1]. Cognitive deterioration
  * affects memory, executive function, and language production
  * early changes frequently emerging in spontaneous speech long before
    functional impairment becomes clinically evident [2–4]
* Speech production engages multiple cognitive systems simultaneously, including
  semantic retrieval, working memory, attention, and executive control,
  * spontaneous speech is a non-invasive biomarker of cognitive decline [5, 6]
  * diagnosis enables intervention planning, patient support, and 
    longitudinal monitoring 
    * may delay progression and reduce healthcare burden [7, 8]
  * clinical evaluation, neuroimaging, and invasive biomarker testing are
    costly, time-consuming, and difficult to scale for population-level [9]
  * necessity for remote, smart technologies to support diagnosis [10]

## 1.2. Current Limitations

* detecting dementia-related cognitive changes from linguistic and acoustic [24]
* clinically deployable speech biomarkers remain constrained by limitations
* datasets, should be collected in a real-world environment and achieve a
  balance between cohort scale, task diversity, multimodal availability, and
  clinically grounded diagnostic annotation

| Dataset     | Year | Language | Setting                   | N (Split)                       |
|-------------|------|----------|---------------------------|---------------------------------|
| CogPic [23] | 2026 | Chinese  | Semi-structured sessions  | 574 (140 AD / 256 MCI / 178 HC) | 
| PROCESS-2   | 2026 | en (UK)  | Remote real-world         | 400 (50 AD / 150 MCI / 200 HC)  | 

* CogPic: 
  * Main strengths: Multimodal (audio, video, text); A large corpus and metadata
    with education and MoCA | 
  * Key limitations: CTD task only
* PROCESS-2
  * main strengths: Ecologically valid speech; Multiple tasks: CTD, SFT & PFT;
    Large-scale remote cohort; Real-world noise diversity | 
  * key limitations: Limited participants (174) with MMSE; British English only

* Early foundational resources, most notably the
  * DementiaBank Pitt Corpus (1994) [11], established speech as a viable
    diagnostic signal and remain widely used benchmarking datasets
  * hE collected primarily in controlled clinical environments using highly
    standardised elicitation protocols, resulting in limited ecological validity
    and reduced generalisability to real-world deployment settings
  * focused on binary diagnostic distinctions between Alzheimer’s disease and
    healthy controls (HC), providing
    limited representation of intermediate cognitive states such as MCI
* Mid-generation datasets began addressing ecological or real-world validity
  through remote and multimodal data collection
  * I-CONECT (2014) [12] introduced 
    longitudinal home-based conversational assessments using remote comm tech
  * Dem@Care (2016) [13] explored multimodal monitoring of cognitive decline
    * integrated audio, video, and behavioural sensing in laboratory and home
  * hE relatively small cohort sizes, technological complexity, or limited
    public data accessibility, restricting largescale, reproducible ML
* Recent datasets (2020–2026) have 
  expanded linguistic diversity and experimental scope. Further benchmark
  * derivatives of DementiaBank eg ADReSS (2020) and ADReSSo (2021) [14, 15],
    improved methodological comparability by introducing 
    balanced cohorts and reproducible evaluation protocols. These datasets
  * standardised evaluation procedures and accelerated methodological develop
* Large cohort initiatives derived from structured interview studies,
  * Talk2Me (2022) or Framingham Voice Study (FVS) [18], provide 
    improved statistical power and enhanced MCI representation but often
  * hE often data-sharing restrictions that limit reproducible benchmarking.
* Multilingual and international resources such as
  * NCMMSC2021 (2021) [16], 
  * the Japanese cognitive assessment corpus (2022) [17], 
  * ADReSS-M (2023) [19], TAUKADIAL(2024) [21], and 
  * large multimodal collections, including CogPic (2026) [23] introduce 
    broader language coverage and richer metadata. These efforts represent
    important progress toward cross-linguistic dementia assessment; however,
  * hE many: single-task paradigms or controlled recording conditions that limit
* The PROCESS Grand Challenge dataset (2025) [22], 
  derived from early CognoMemory deployments [25–30], represents 
  a step toward real-world remote assessment, although 
  hE only a restricted subset of recordings and metadata is public [31–37]
* recurring limitations persist: 
  1. controlled or semi-structured recording environments that 
    only partially reflect real-world telehealth deployment, 
  1. narrowly defined elicitation paradigms capturing limited aspects of cognit
  1. insufficient coverage of multiple cognitive domains, 
  1. restricted accessibility of large clinically annotated cohorts, and 
  1. limited availability of openly shareable resources suitable for
     reproducible machine learning research.
* addressed by PROCESS-2: development of datasets that integrate 
  large-scale participation, clinically validated diagnostic labels, 
  multimodal setup, more diverse cognitive elicitation tasks, and 
  ecologically valid remote acquisition across heterogeneous real-world environs

## 1.3. Dataset contribution: PROCESS-2, 

* an extension of “The Prediction and Recognition Of Cognitive declinE through
  Spontaneous Speech (PROCESS)” Signal Processing Grand Challenge [22] and 
* a large-scale dataset of conversational speech for remote cognitive assessment
  collected using the CognoMemory, (formerly CognoSpeak [25]) automatic
  assessment platform. PROCESS2 
* aims to unify ecological validity, clinically grounded diagnostic annotation,
  and reproducible benchmarking by integrating realistic, naturalistic, and
  clinically representative data within a single acquisition framework.
* recordings from 400 older adults recruited across the United Kingdom (UK),
  * 50 dementia, 150 MCI, and 200 cognitively healthy control participants.
  * acquired remotely through semi-structured human–computer conversational
    interactions conducted in realworld environments, including participants’
    homes, community locations, and clinical settings. 
    * Unlike controlled environment-based datasets, recordings capture 
    * natural variability arising from heterogeneous consumer devices,
      background noise conditions, and spontaneous conversational behaviour,
      thereby reflecting realistic telehealth deployment scenarios.
* three complementary speech elicitation paradigms 
  targeting distinct cognitive and linguistic processes: SFT, PFT and CTD tasks.
  * both structured and cognitively-demanding tasks enables investigation of
    lexical retrieval, executive function, semantic organisation, and
    discourse-level language production within a single dataset.
* Predefined training (80%) and held-out test (20%) partitions are provided to
* spontaneous speech recordings collected conversationally, diagnostic labels,
  demographic metadata, and available cognitive screening measures, PROCESS-2
* an ecologically valid resource for developing and evaluating automated
  speech-based biomarkers of early cognitive decline.

## 1.4. Dataset overview

* 400 participants completing three speech elicitation tasks, resulting in
  1200 organised collections of task-specific audio recordings in total.
* .wav audio files accompanied by aligned textual transcripts and structured
  metadata tables.
* Metadata includes participant 
  demographic information such as age and gender, 
  diagnostic category (Dementia, MCI, and HC), and available 
  cognitive assessment scores, such as Mini-Mental State Examination (MMSE)
  measurements for a subset of participants. This organisation enables
* obtained using participants’ own consumer devices in natural home
  environments, intentionally preserving acoustic variability characteristic of
  remote digital health deployment. Rather than minimising environmental vari-
  ation, PROCESS-2 captures realistic signal diversity, allowing researchers to
  evaluate the robustness of speech-based models under real-world operat condis
* possible research applications include automated dementia screening,
  multimodal speech biomarker discovery, robustness analysis under heterogeneous
  recording conditions, and benchmarking of machine learning systems for
  cognitive assessment. By providing 
* standardised data structure, predefined evaluation splits, 
  manual transcriptions and clinically informed diagnostic labels, PROCESS-2

# 2 Methods

* CognoMemory digital cognitive assessment platform supports automated
  recruitment, electronic consent, cognitive screening, and speech recording
  through a browser-based interface accessible from participants’ personal
  devices.
* Dataset creation followed a reproducible workflow 
  * participant recruitment and diagnostic verification, remote administration
    of speech assessment tasks, automated multimedia recording, transcription
    and annotation, and structured data curation into a unified repository. All
* Ethical approval was obtained prior to data collection, and all participants
* The following sections describe 

* Figure 1: The PROCESS-2 dataset collection pipeline and shared data structure:
  Speech recordings were collected nationwide using the CognoMemory virtual
  assessment platform, where participants interacted with a conversational agent
  * tasks: clinically validated cognitive tasks, including 
    semantic fluency (SFT), phonemic fluency (PFT), and Cookie Theft picture
    description (CTD).
  Audio responses were recorded during natural speech interaction and organised
  into participant-level directories containing task-specific waveform
  recordings and manually verified transcripts. Each recording is accompanied by
  metadata describing diagnosis, demographic variables, cognitive scores
  (MMSE), and predefined dataset splits for reproducible experimentation. The
  lower panel illustrates an example CTD task, together with the corresponding
  speech spectrogram and transcript excerpt from a representative recording. The
  figure summarises the end-to-end PROCESS-2 workflow from nationwide data
  acquisition to the structured research-ready dataset released to the

## 2.1 Participant recruitment

## 2.2 Clinical characterisation

## 2.3 CognoMemory Platform architecture

## 2.4 Speech elicitation procedures

### 2.4.3. Cookie Theft Description (CTD)

* describe a complex visual scene presented on screen. Unlike fluency tasks, 
* no strict time limit was imposed, allowing natural spontaneous speech
* recordings typically ranged between approximately 60 and 75 seconds (Table 3).
* captures spontaneous narrative speech, discourse organisation, and pragmatic
  language abilities [44].

## 2.5 Preprocessing steps required for independent replication of the PROCESS-2

## 2.6. Data Curation

* Recordings were manually reviewed to ensure completeness, and incomplete
  responses to time-limited tasks were truncated to the portion containing
  participant speech.
* Transcripts manually by multiple annotators including professional
  transcribers and study authors. Some transcripts include disfluencies, speaker
  identifiers (e.g., “Pat:”, “Oth:”) and pause annotations (e.g., “(2
  seconds)”).
  * Transcript files were preserved in their original form without post-hoc
    modification to maintain fidelity to the transcription process. 
    No additional linguistic annotation schema was imposed .
    Researchers may therefore apply task-specific annotation protocols
* Some assessments were conducted in clinical environments with assistance from
  clinicians or accompanying individuals when required. To preserve ecological
  validity and reflect real-world deployment conditions, conversational
  contributions from assisting speakers were retained within recordings when
  present.
* All recordings were pseudonymised prior to release using anonymised
  participant identifiers, and no personally identifiable information was
* dataset was organised into a participant-level hierarchical repository
  described in detail in Section 3.

## 2.7. Quality Control and reproducibility statement

# 3. Data Records

## 3.3. Metadata Table

Participant-level metadata are provided in meta-info.csv.
The table contains the following variables:
  * IDs: anonymised participant directory identifier,
  * diagnosis: clinical diagnostic category (Dementia, MCI, HC),
  * age: participant age at assessment (years),
  * gender: self-reported gender,
  * MMSE: Mini-Mental State Examination score where available,
  * Split: predefined experimental partition (Train/Test).

# 4. Data Overview

* As expected, cognitive scores measured using the MMSE show a decreasing trend
  from HC to dementia partics. Gender distris were relat balanced for HC and MCI 
* Our dataset is imbalanced toward cognitively healthy adults due to open
  volunteer recruitment; however, this distribution reflects the true prevalence
  of cognitive impairment in the UK [47].
* Acoustic and linguistic embedding representations were 
  * derived using pretrained self-supervised speech models and sentence-level
    language models to facilitate dataset validation and exploratory analyses.
  * provided as supplementary resources and are primarily used for technical
    validation rather than constituting core dataset contents.

# 5. Technical Validation

* aims to verify data reliability, clinical consistency, recording quality, and
  suitability for computational modelling. The PROCESS-2 dataset underwent
* across five key dimensions: 
* For continuous variables such as age and MMSE, the 
  * normality of the age distributions within each group was first assessed
    using the Shapiro–Wilk test [48, 49]. If the normality assumption is
    violated in at least one diagnostic group, nonparametric statistical tests,
    such as both a one-way analysis of variance (ANOVA) [50], and the
    Kruskal-Wallis test [51, 52], were considered in addition to parametric
    methods when evaluating group differences. To further investigate pairwise
    differences where the Kruskal-Wallis test produces a significant p, Dunn’s
    post-hoc test with Bonferroni correction [53, 54] was applied. 
* Pearson correlation coefficients were computed to discover relationships
  between variables [55]. All statistical results are summarised in Table 5 and
  Table 6.
* training vs test subsets was analysed across diagnostic groups (Dementia, MCI,
  and HC) for the training and test subsets using raincloud plots.
  * This visualisation combines kernel density estimates, boxplots, and
    individual observations to provide a detailed view 
  * training vs test subsets within each diagnostic group: 
    two-sided Mann-Whitney U tests [56] were conducted.

## 5.1 Demographic integrity

## 5.2 Clinical validity

## 5.3 Recording and acquisition stability

## 5.4 Computational representation analysis

## 5.5 Baseline benchmarking performance.

## 5.6. Summary of Validation Findings

* Collectively, the validation analyses demonstrate that PROCESS-2 exhibits:
  * demographic comparability across diagnostic groups,
  * clinically meaningful MMSE separation,
  * stable recording quality despite remote acquisition,
  * measurable disease-related structure in representation space,
  * reproducible benchmark modelling performance.
These results confirm that PROCESS-2 constitutes a reliable, high-quality
dataset suitable for reproducible research in speech-based cognitive assessment.

# 6. Data Availability

* The PROCESS-2 dataset contains human speech recordings collected under
  clinical ethical approval and therefore cannot be released as unrestricted
  public data.  Access is provided through a controlled access framework to
  ensure responsible reuse and protection of participant privacy.
The dataset is hosted on the Hugging Face data repository: requires submission
of a request describing institutional affiliation and intended research use.
Applicants must agree to the PROCESS-2 Data Use Agreement prior to access
being granted. Approved researchers obtain access through a gated repository
mechanism. The released dataset includes:
  * speech recordings in waveform audio format (.wav),
  * manually generated transcripts (.txt),
  * participant-level metadata tables,
  * dataset documentation and usage guidelines.
* All participants provided informed consent permitting controlled research data
  sharing, and the dataset was anonymised prior to release and contains no
  direct personal identifiers.
* Redistribution, commercial use, or attempts at participant reidentification
  are prohibited under the data use agreement.

# 7. Code Availability

* code under the Apache License 2.0, permitting reuse, modification, and
  redistribution subject to the terms of the licence. Version control is
  maintained through GitHub to ensure transparency and reproducibility of all
  results reported in this study. Code archived at Zenodo DOI:
  https://doi.org/10.5281/zenodo.19900225 All analyses reported in this study
  can be reproduced using the publicly available code [58] together with
  approved access to the PROCESS-2 dataset.
