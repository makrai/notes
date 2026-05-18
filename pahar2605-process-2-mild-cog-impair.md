PROCESS-2: A Benchmark Speech Corpus for Early Cognitive Impairment Detection
Madhurananda Pahar, Caitlin H. Illingworth, Bahman Mirheidari,
  H Elghazaly, F Peters, S Young, W Leung, L Kaur, D Blackburn, H Christensen
arXiv:2605.14888 [cs.SD]

* clinically validated datasets collected under realistic conditions. We
* PROCESS-2, a large-scale speech dataset designed to support research on
* spontaneous and task-oriented speech. The dataset comprises recordings from
* 200 healthy controls, 150 mild cognitive impairment, and 50 dementia
* collected using the CognoMemory digital assessment platform
* Each participant completed a single assessment session, including
  picture description and verbal fluency tasks, accompanied by
* manually verified transcripts and participant-level metadata. PROCESS-2
* 21 hours of speech audio with predefined train/test partitions
* demographic balance, clinical consistency, recording stability,
  embedding-space structure, and reproducible baseline modelling performance,
  * clinically meaningful group separation and stable performance across
    modelling approaches while preserving real-world conversat variability
* released under controlled access via Hugging Face to enable responsible

# 1. Background & Summary

## 1.1. Scientific Context

* Neurodegenerative disorders associated with cognitive decline, 
  including mild cognitive impairment (MCI) and dementia, represent 
  * a major and rapidly expanding global health challenge 
    driven by demographic ageing [1]. Cognitive deterioration 
  * affects memory, executive function, and language production, with 
  * early changes frequently emerging in spontaneous speech long before
    functional impairment becomes clinically evident [2–4].
* Speech production engages multiple cognitive systems simultaneously, including
  semantic retrieval, working memory, attention, and executive control, 
  * spontaneous speech is a non-invasive biomarker of cognitive decline [5, 6]
  * diagnosis enables intervention planning, patient support, and longitudinal
    monitoring that may delay progression and reduce healthcare burden [7, 8].
  * clinical evaluation, neuroimaging, and invasive biomarker testing, which are
    costly, time-consuming, and difficult to scale for population-level [9].
  * necessity for remote, smart technologies to support diagnosis [10]

## 1.2. Current Limitations

* detecting dementia-related cognitive changes from linguistic and acoustic [24]
* clinically deployable speech biomarkers remains constrained by limitations in
* datasets, should be collected in a real-world environment and achieve a
  balance between cohort scale, task diversity, multimodal availability, and
  clinically grounded diagnostic annotation.  

* Dataset
  * Year
  * Language
  * Setting
  * N (Split)
  * Main Strengths
  * Key Limitations
* CogPic [23]
  * 2026
  * Chinese
  * Semi-structured sessions
  * 574 (140 AD / 256 MCI / 178 HC)
  * Multimodal (audio, video, text); A large corpus and metadata with education
    and MoCA
  * CTD task only
* PROCESS-2
  * 2026
  * English (UK)
  * Remote real-world
  * 400 (50 AD / 150 MCI / 200 HC)
  * Ecologically valid speech; Multiple tasks: CTD, SFT & PFT; Large-scale
    remote cohort; Real-world noise diversity
  * Limited participants (174) with MMSE; British English only

* Early foundational resources, most notably the 
  * DementiaBank Pitt Corpus (1994) [11], established speech as a viable
    diagnostic signal and remain widely used benchmarking datasets. However,
  * hE collected primarily in controlled clinical environments using highly
    standardised elicitation protocols, resulting in limited ecological validity
    and reduced generalisability to real-world deployment settings. Furthermore,
  * focused on binary diagnostic distinctions between Alzheimer’s disease and
    healthy controls (HC), providing 
    limited represen- tation of intermediate cognitive states such as MCI.
* Mid-generation datasets began addressing ecological or real-world validity
  through remote and multimodal data collection. Studies such as 
  * I-CONECT (2014) [12] introduced longitudinal home-based conversational
    assessments using remote communication technologies, while 
  * Dem@Care (2016) [13] explored multimodal monitoring of cognitive decline
    * integrated audio, video, and behavioural sensing in laboratory and home
  * hE relatively small cohort sizes, technological complexity, or limited
    public data accessibility, restricting largescale, reproducible ML
* Recent datasets (2020–2026) have expanded linguistic di- versity and
  experimental scope. Further benchmark initiatives, including derivatives of
  DementiaBank such as ADReSS (2020) and ADReSSo (2021) [14, 15], improved
  methodological com- parability by introducing balanced cohorts and
  reproducible evaluation protocols. These datasets standardised evaluation
  procedures and accelerated methodological development within the field. Large
  cohort initiatives derived from structured inter- view studies, including
  Talk2Me (2022) or Framingham Voice Study (FVS) [18], provide improved
  statistical power and en- hanced MCI representation but often impose
  data-sharing re- strictions that limit reproducible benchmarking.
Multilingual and international resources such as
NCMMSC2021 (2021) [16], the Japanese cognitive assessment
corpus (2022) [17], ADReSS-M (2023) [19], TAUKADIAL(2024) [21], and large multimodal collections, including
CogPic (2026) [23] introduce broader language coverage and
richer metadata. These efforts represent important progress
toward cross-linguistic dementia assessment; however, many
remain constrained by single-task paradigms or controlled
recording conditions that limit ecological realism.
The PROCESS Grand Challenge dataset (2025) [22], de-
rived from early CognoMemory deployments [25–30], repre-
sents a step toward real-world remote assessment, although only
a restricted subset of recordings and metadata was publicly re-
leased for benchmarking [31–37].
Across three decades of dataset development (1994–2026),
several recurring limitations persist: (i) reliance on controlled or
semi-structured recording environments that only partially re-
flect real-world telehealth deployment, (ii) dependence on nar-
rowly defined elicitation paradigms capturing limited aspects
of cognition, (iii) insufficient coverage of multiple cognitive
domains, (iv) restricted accessibility of large clinically anno-
tated cohorts, and (v) limited availability of openly shareable
resources suitable for reproducible machine learning research.
These observations motivate the development of datasets
that integrate large-scale participation, clinically validated diag-
nostic labels, multimodal setup, more diverse cognitive elicita-
tion tasks, and ecologically valid remote acquisition across het-
erogeneous real-world environments, as addressed by the pro-
posed PROCESS-2 dataset.
1.3. Dataset contribution
To address the limitations identified across existing resources,
we introduce PROCESS-2, an extension of “The Prediction and
Recognition Of Cognitive declinE through Spontaneous Speech
(PROCESS)” Signal Processing Grand Challenge [22] and a
large-scale dataset of conversational speech for remote cogni-
tive assessment collected using the CognoMemory, (formerly
CognoSpeak [25]) automatic assessment platform. PROCESS-
2 aims to unify ecological validity, clinically grounded diagnos-
tic annotation, and reproducible benchmarking by integrating
realistic, naturalistic, and clinically representative data within a
single acquisition framework.
The dataset comprises recordings from 400 older adults re-
cruited across the United Kingdom (UK), spanning 50 demen-
tia, 150 MCI, and 200 cognitively healthy control participants.
All data were acquired remotely through semi-structured hu-
man–computer conversational interactions conducted in real-
world environments, including participants’ homes, community
locations, and clinical settings. Unlike controlled environment-
based datasets, recordings capture natural variability arising
from heterogeneous consumer devices, background noise con-
ditions, and spontaneous conversational behaviour, thereby re-
flecting realistic telehealth deployment scenarios.
PROCESS-2 incorporates three complementary speech
elicitation paradigms targeting distinct cognitive and linguistic
processes: SFT, PFT and CTD tasks. The inclusion of both
structured and cognitively-demanding tasks enables investiga-
tion of lexical retrieval, executive function, semantic organisa-
tion, and discourse-level language production within a single
dataset. Predefined training (80%) and held-out test (20%) par-
titions are provided to support reproducible machine learning
evaluation and standardised benchmarking.
By integrating spontaneous speech recordings collected
conversationally, diagnostic labels, demographic metadata, and
available cognitive screening measures, PROCESS-2 provides
an ecologically valid resource for developing and evaluating au-
tomated speech-based biomarkers of early cognitive decline.
1.4. Dataset overview
The PROCESS-2 release provides a structured multimodal
dataset comprising speech recordings and associated metadata
collected through a fully remote assessment workflow. The
dataset contains audio recordings from 400 participants com-
pleting three speech elicitation tasks, resulting in 1200 organ-
ised collections of task-specific audio recordings in total.
All speech data is distributed as standard waveform (.wav)
audio files accompanied by aligned textual transcripts and struc-
tured metadata tables. Metadata includes participant demo-
graphic information such as age and gender, diagnostic category
(Dementia, MCI, and HC), and available cognitive assessment
scores, such as Mini-Mental State Examination (MMSE) mea-
surements for a subset of participants. This organisation enables
transparent linkage between raw recordings, linguistic content,
and clinical annotations.
Recordings were obtained using participants’ own con-
sumer devices in natural home environments, intentionally
preserving acoustic variability characteristic of remote digital
health deployment. Rather than minimising environmental vari-
ation, PROCESS-2 captures realistic signal diversity, allowing
researchers to evaluate the robustness of speech-based models
under real-world operating conditions.
The dataset supports a broad range of secondary research
applications, including automated dementia screening, multi-
modal speech biomarker discovery, robustness analysis under
heterogeneous recording conditions, and benchmarking of ma-
chine learning systems for cognitive assessment. By provid-
ing standardised data structure, predefined evaluation splits,
manual transcriptions and clinically informed diagnostic la-
bels, PROCESS-2 enables reproducible investigation of speech-
based indicators of cognitive decline at scale.

