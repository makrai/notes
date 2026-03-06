Systematic Inequalities in Language Technology Performance across the World’s Languages
Damian Blasi, Antonios Anastasopoulos, Graham Neubig
ACL 2022 Dublin, Ireland blasi-etal-2022-systematic

[Data and code on GitHub](https://github.com/neubig/globalutility)

# Abstract

* NLP is central technology in communication, education, medicine, AI, res, dev
* performance of NLP methods has grown enormously over the last decade, this
* progress has been restricted to a minuscule subset of the world’s ≈6,500
* We introduce a framework for estimating the global utility of NLP as revealed
  in a comprehensive snapshot of recent publications in NLP. Our analyses
  * the field at large
  * user-facing technologies (machine translation, language understanding,
    question answering, text-to-speech synthesis) as well as
  * foundational NLP tasks (dependency parsing, morphological inflection). In
* process, we
  * quantify disparities in the current state of NLP research,
  * explore some of its associated societal and academic factors, and
  * produce tailored recommendations for evidence-based policy making
    aimed at promoting more global and equitable LT (LT)

# 1 Intro

* applications such as translation and question answering, but also tasks as
  * detection of neurodegenerative diseases (Orimaye+ 2017),
  * exposing widespread gender and ethnic biases in societies (Caliskan+ 2017),
  * pred large-scale trends in collective consumer behavior (Kallus, 2014)
* an English speaker with a smartphone can now easily get accurate information
  * query to a virtual assistant, they can consult an
  * online translation service to translate a foreign language web page with a
  * interact with many different machines and computers through simple speech
* developments over the last few decades:
  * the advent of deep learning methods, which allow for more effective creation
    of NLP systems from existing data (Goldberg, 2017),
  * the existence of standardized benchmark datasets and evaluation metrics
    (Wang+ 2018; Hu+ 2020),
  * the prestige afforded by the research community to researchers who improve
    upon these benchmarks,
  * the resulting large number of resources, be they computation, data, or
    ingenuity, that are poured into optimizing performance thereon. As both a
* NLP is experiencing an explosive increase: the annual conference of the
  * ACL received in 2000 less than 300 papers, growing in 2010 to 1,000, to over
    > 3,500 submissions in its 2020 edition. Largely as a result of this
  * evaluation benchmark scores on par with human performance on a variety of
    eg question answering on English (He+ 2021), or on
    automatic translation of news from German, Russian, and Chinese to English
    (Barrault+ 2020). 2 These upward slanting curves on standard benchmarks fail
* hE how uneven this development has been for all potential NLP users
  * systematic performance drops according to dimensions such as gender, racial
    identity, and language varieties, among others. The reasons for
  * these biases can be traced to virtually all stages in the process of NLP
    * data used to train systems
      (Caliskan+ 2017; Sap+ 2019; De-Arteaga+ 2019; Tatman, 2017; Tatman and
      Kasten, 2017; Buolamwini and Gebru, 2018; Raji and Buolamwini, 2019)
    * algorithms involved (Speicher+ 2018; Bellamy+ 2018; Adebayo+ 2016)
    * growing awareness of these biases in NLP technologies brought by these
    * novel metrics and tests to evaluate these disparities, have resulted in
    * progressively more efficient and principled strategies to mitigate them
* hE systematic approaches are still lacking in lang
  * only a handful are systematically represented in academia and industry
    (Joshi+ 2020; Yin+ 2021)
  * near-human results on translation or understanding of languages from the
    world’s economic and political superpowers, the experience of any NLP
  * for the vast majority of languages, MT falls far below such standards
  * the languages of the world showcase substantial variation in most domains of
    description, and in fact,
  * the performance of LT is sensitive to diverse aspects of the language under
    * morphology, word order, or phonologic repert, writing script or data avail
      (Arivazhagan+ 2019; Tsarfaty+ 2020; Xia+ 2020; Muller+ 2021)
* need for measuring and understanding NLP performance inequalities across the
* we develop novel estimates on
  how the utility afforded by NLP systems is distributed
  across individuals, languages, and tasks at an unprecedented global scale
  * which languages are systematically underserved by LT and
    could benefit the most individuals from focused technology development
* We finally trace these inequalities to the societal, economic, and academic
  correlates of NLP systems’ performance, shedding light on its latent causes,
  * how our results favor specific evidence-based policies in research and dev

# 2 Method

## 2.1 utility and demand

### utility

* utility users in a given language l receive from a language technology
* to what extent a given NLP system solves the specific problems an individual
  * eg how successfully the user can obtain information from an MTed web page,
    or how satisfied the user is by a speech-based virtual assistant’s execution
    of a series of verbal commands
* Intuitively, utility is associated with the nominal performance of the
  * a more performant system will allow the user to obtain a greater utility
  * How “performance” is measured depends on the task (see Section 1)
  * we define the utility of a task and language, u l , as the corresponding
    performance normalized by the best possible performance afforded by such
    task, ie performance l u l = theoretical max performance
  * we take the empirical maximum as an estimate of the theoretical one and

| Task                             | Description                                                 | Metric                   |
| -------------------------------| ----------------------------------------------------------| -----------------------|
| Syntactic Analysis (DEP)         | Infer syntactic dependencies between words in text          | Labeled attachment score |
| Morphological Inflection (INF)   | Produce an inflection given a lemma and morphological tags  | Accuracy                 |
| Machine Translation (MT)         | Translate text from a language into another                 | BLEU score               |
| Speech Synthesis (TTS)           | Produce speech on the basis of textual input                | Mel-cepstral distortion  |
| Natural Language Inference (NLI) | Recognize entailment or contradiction between two sentences | Accuracy                 |
| Question Answering (QA)          | Produce an answer for a textual query                       | F-score                  |

* simplifying assumptions. As we pointed out before,
  * not all users of the same language technology might benefit in the same
    manner given a fixed performance, and the relation between nominal
  * eg in machine-assisted human translation, the relationship between MT
    accuracy and productivity gain (directly associated with utility) is complex
    (Sanchez-Torron and Koehn, 2016)

### Demand for a language technology

* taking into consideration demographic and linguistic perspectives
* demog: the demand for a given technology in a language is estimated to be
  proportional to the number of speakers $n_l$ of the language itself
* ling: the demand across the approximately 6,500 languages of the world is
  identical (d l ∝ 1)
* any combination of them can be simply parameterized:
  \[ n_l^\tau / \sum n_l'^\tau \]
  * τ = 1 correspond to a demographic notion of demand, τ = 0 to a linguistic
* we construct a simple family of global metrics
  \[ M_\tau = \sum_l d_l(\tau) \cdot u_l \]
  * to what degree the global demand for LT is actually met:
  * M τ is bounded between 0 and 1; 0 corresponds to a case where no-one

# 3 Results and Analysis

## 3.1 General observations

* Figure 1:
  * Left panel: linguistic and demographic global utility metrics for tasks
    * The red curve corresponds to the sequence where first the language with
      the largest number of users is set to utility 1, then the second, and so
      on
  * Right panel: recent historical progression of Inflection and MT from English

* the most linguistically diverse tasks
  * Text-to-speech synthesis is the task with the most linguistic coverage: the
    * Black (2019) covers more than 630 languages (or about 10% of the world’s ls)
    * hE for the vast majority of these languages
      the measured quality of the generated speech is about half as good as the
      exceptionally good English system (Ren+ 2021). The next  are those
  * morphosyntactic analysis, ie morphological inflection and dependency parsing
    * evaluated over 140 and 90 languages respectively.  For these more esoteric
    * the majority of the systems are in general very good
* opposite side
  * Natural language inference (NLI) and question answering (QA)
  * the established benchmarks have only focused on up to 15 and 17 languages
  * very low scores on the linguistic axis
* In Figure 1 (right panel): the progress of the utility metrics in tasks for
  which we had access to comparable data across a span of the last 7 years. The
  * the UniMorph project (Kirov+ 2018) to cover as many languages as possible
* Figure 2 additionally presents demographic utility across language populations
  for all tasks. The visualization allows for identification of ostensive gaps
  * The two bottom plots of Figure 2 display our metrics over speakers of a
    single language, based on question answering results for different spoken
    Arabic and Swahili lectal varieties (Faisal+ 2021)
  * that utility differences are small between Arabic vernaculars although these
    systems still lag behind the systems for Modern Standard Arabic, while the
    utility level of Coastal Swahili speakers in Tanzania is about 10% lower
    than that for speakers in Kenya

## 3.2 Priorities in NLP development

* which languages will lead to the largest global utility improvement
* The relative importance of linguistic vs. demographic demands determines the
  priority ranking, as it can be observed in
  Figure 3 for a sample of five tasks. Improving on the
  * demographic-focused utility entails a greater emphasis on Mandarin Chinese,
    Hindi, Spanish, and other populous languages that are generally well-served
  * Balancing linguistic and demographic considerations leads to prioritizing a
    more diverse set of languages, mostly Asian and African languages like
    Amharic, Bambara, Bengali, Thai, or Yoruba, which are
    both populous and under-served, along with
  * also large but severely under-served languages like Kurdish, Urdu, and
    Oromo
  * Further emphasis on linguistic utility would lead to prioritization of
    indigenous and potentially endangered languages of small communities like
    Aimele, Itelmen, North Sami, or Warlpiri, which are
    * currently largely ignored by NLP research (Bird, 2020)

## 3.3 The role of society, economy, and academia

* large-scale analysis of NLP publications. First, this reveals that a
  * substantial proportion of publications do not even describe in a clear and
    unequivocal manner the language (or languages) they are dealing with
    (Bender, 2011)
* citation of papers over time
  * Independently of publication venue, year, or subfield of NLP research, the
    number of languages a publication deals with is not predictive of how many
    citations it will accrue over time (see Figure 4, top right panel)
* ie scientists and developers are presented with little to no additional
  academic reward when tackling data, problems, or tasks involving >1 language
* what explains the production of LT across languages to start with, which will
  necessarily involve agents, mechanisms, and data, outside of the scope of NLP
  publications themselves
* whether approximate measures of economic centrality or number of lang users
  were better predictors of sheer number of papers published for any given
  language (see Appendix C)
* both variables are substantially collinear, we find that
  approximate GDP (rather than number of users) leads to a substantially smaller
  prediction error of number of published papers

# 4 Discu

* After English, a handful of Western European languages dominate the field --
  * German, French, and Spanish -as well as
  * even fewer non-Indo-European languages, primarily Chinese, Japanese, Arabic
  * it is the economic prowess of the users of a language (rather than the sheer
    demographic demand) what drives the development of LT
* eg Inflection) there is an encouraging trend of both demographic~ and
  linguistic-utility improving year-over-year. This is
  * due to the nature of the task; reasonably accurate solutions can be achieved
    through small but highly-curated data. Since
  * linguistic expertise on the languages of the world is, naturally, globally
    distributed, the main hurdle these tasks face is to pool such expertise
  * relatively low-cost and bottom-up actions that gather experts to work on
    specific NLP tasks (such as Universal Dependencies and UniMorph) have
    succeeded in accelerating the cross-linguistic development of LT
    * mainly on the basis of academic incentives, as those individuals or groups
      who contribute data and/or expertise are rewarded with individual
      publications or co-authorship in collective publications. Many of these
      contributions -which do not necessarily involve hefty resource investments
    * markedly different from the typical publications in LT

* Figure 4:
  * Left panel: treemap of the number of NLP publications per language
    eng zho deu fra spa jpn rus nld ces por tur swe ita fin ell lat hun ara kor
    hin pol dan
  * Right top panel: Relative citation rate vs number of languages in the
    publication
  * Right bottom panel: Number of publications according to number of language
    users and approximate GDP. Point size and transparency scales with number of
    publications

* hE Machine Translation or Speech Synthesis. User-facing tasks all have in
  * a tight dependency on computational resources and large data, which in
  * hinge on substantial financial means. In a context of pressing user needs
    across multiple populations and languages, we submit that
  * future developments on policies aimed at furthering cross-linguistic
    technologies would benefit from clear (and possibly standardized) metrics
    that assist in streamlining complex decisions regarding resource allocation
  * Our measures of global coverage fulfill that role, and help identifying
  * we do not attempt to supplement the necessary in-depth evaluation of the
    need of each individual group and language, they provide a common ground for
* simplifying assumptions to even attempt to quantify disparities in LT utility
  * the measurement of demand (native-speaker population and/or economic indics)
  * utility (based on simple accuracy metrics)
  * Future: estimates of user demand on a technology-by-technology level, or
    more accurately clarifying the relationship
    between standard accuracy metrics and the utility derived by users
