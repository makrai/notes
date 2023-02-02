Systematic Inequalities in Language Technology Performance across the W's Langs
Damián Blasi, Antonios Anastasopoulos, Graham Neubig
arXiv:2110.06733 [cs.CL]

Data and code to reproduce https://github.com/neubig/globalutility

# Abstract

* Natural language processing (NLP) systems have become a central technology in
  communication, education, medicine, artificial intelligence, and many other
* world's 6,500 languages
  * from discu: pressing user needs across multiple populations and languages
* We introduce a framework for estimating the global utility of language tech
  in a comprehensive snapshot of recent publications in NLP. Our analyses
  * the field at large, but also more in-depth studies on both
  * user-facing technologies (MT, NLU, QA, text-to-speech synthesis) as well as
  * more linguistic NLP tasks (dependency parsing, morphological inflection)
* we
  * quantify disparities in the current state of NLP research,
  * explore some of its associated societal and academic factors, and
  * produce tailored recommendations for evidence-based policy making
    aimed at promoting more global and equitable language technologies

# 1 Intro

* systematic performance drops according to gender, racial, and language variet
* in virtually all stages in the process of NLP development, from the
  * training data (Caliskan+ 2017; Sap+ 2019; De-Arteaga+ 2019; Tatman, 2017;
    Tatman & Kasten, 2017; Buolamwini & Gebru, 2018; Raji & Buolamwini, 2019)
  * algorithms involved (Speicher+ 2018; Bellamy+ 2018; Adebayo+ 2016). The
* growing awareness of these biases in NLP technologies brought by these
  * novel metrics and tests to evaluate these disparities, have resulted in
* 6,500 languages spoken or signed in the world today (Hammarström, 2015), only
  * few are systematically represented in academia and industry (Joshi+ 2020)
  * data availability (Tsarfaty+ 2020; Xia+ 2020; Arivazhagan+ 2019). Hence,
* we develop novel estimates on how the utility afforded by NLP systems is
  distributed across individuals, languages, and tasks at an unprecedented
  * which languages could benefit the most individuals from focused tech devel
  * latent causes: societal, economic, and academic correlates of NLP sys perf,

# 2 Methodology

## 2.1 Quantifying utility and demand

* Our fundamental goal is evaluating the distribution of diverse representative
  language technologies (and their qualities) across the languages and popu
  * association between the demand of language technologies and their utility
1. the utility users in a given language l receive from a language technology
  * we define the utility of a task and language, u l , as the corresponding
    performance normalized by the best possible performance afforded by such
    * u l = performance l / theoretical max performance
    * In cases where the best possible performance is undefined or technically
      unattainable, we take the empirical maximum as an estimate of the
      * normalize by the best-performing language across all languages L, i.e
2. demand for a language technology in l
  * taking into consideration demographic and linguistic perspectives. Under
    * first perspective: number of speakers of the language itself n l (d l ∝ n
    * second perspective: uniform
    * as well as any intermediate combination of them can be simply
      parameterized through a single exponent τ ,  d l^(τ) = n_l^τ / \sum n_l'^τ
    * τ = 1 correspond to a demographic notion of demand, τ = 0 to a linguistic
* global metrics (M τ ) to what degree the global demand for lang techs is met:
  * M τ = \sum_l d_l^(τ) · u l

## 2.3 Correlates of NLP utility

* questions:
  * does the system of academic incentives promote the development of a more
    linguistically diverse NLP? and
  * is economic centrality or sheer demographic demand the best predictor of
* considering science production
  * papers in major international NLP conferences as the basic units of
* This is a simplificationl
  * some widely used language technologies are developed outside of the
    traditional scientific circuit based on proprietary technology, or they are
  * local conferences, possibly in languages other than English. 3 In spite of
    * e.g. the Japanese NLP society’s 2020 conference published 396 papers:
* we study
  * the first question by determining
    whether the cumulative number of citations a paper receives is correlated
    with the number of languages it is associated with. We investigate 3 our
  * finding the best predictive model of the number of NLP papers in any l by
    contrasting two predictors: estimated number of users worldwide and
    approximate GDP associated with its users. We model these regression
    problems in a Bayesian generalized mixed effects framework (Appendix B)

# 3 Results and Analysis 4

## 3.1 General observations

* Figure 1
  * Left panel: linguistic and demographic global utility metrics
    for a number of language technology tasks
  * The red curve corresponds to the sequence where first the language with the
    largest number of users is set to utility 1, then the second, and so on
  * Right panel: recent historical progression of Inflection and MT from En
* the task with the most linguistic coverage
  * Text-to-speech synthesis
    * published results (due to a single study (Black, 2019)) cover more than
      630 languages (or about 10% of the world’s languages).  However,
    * hE, for the vast majority of these languages the measured
      quality of the generated speech is about half as good as the English system
      (Ren+ 2021)
  * morphosyntactic analysis, i.e.  morphological inflection and dep parsing,
    * evaluated over 140 and 90 languages respectively.  For these more
    * not necessarily convey direct utility to a downstream user,
    * the majority of the systems are in general very good
* Natural language inference and question answering (QA) lie on the opposite
  * up to 15 and 17 languages respectively
* In Figure 1 (right panel) we observe the progress of the utility metrics in
  * the last 7 years. The extensive efforts of the UniMorph project (Kirov+)
* Figure 2: demographic utility across language populations for all tasks. The
  * The two bottom plots of Figure 2 display our metrics over speakers of
    Arabic/Swahili vernaculars [the dialect of ordinary people in a region]
    * based on question answering results for different spoken Arabic and
      Swahili lectal varieties (Faisal+ 2021). This analysis shows that
    * Arabic
      * utility differences are small between Arabic vernaculars although
      * these systems still lag behind the systems for Modern Standard Arabic,
    * Swahili: the utility level of Coastal Swahili speakers in Tanzania is
      about 10% lower than that for speakers in Kenya

## 3.2 Priorities in NLP development

* which languages will lead to the largest global utility improvement
  * tau determines the priority ranking, as it can be observed in Figure 3 for
  * demographic focus i.e. Mandarin Chinese, Hindi, Spanish
    * generally well-served by current technologies
  * Balancing linguistic and demographic considerations leads to prioritizing a
    * mostly Asian and African languages
      like Amharic, Bambara, Bengali, Thai, or Yoruba, which are
    * both populous and under-served, along with also large but
    * severely under-served languages like Kurdish, Urdu, and Oromo.  Further
  * emphasis on linguistic utility would lead to prioritization of
    * indigenous and potentially endangered languages of small communities like
      Aimele, Itelmen, North Sami, or Warlpiri, which are
      currently largely ignored by NLP research (Bird, 2020)

## 3.3 The role of society, economy, and academia

* analysis of NLP publications. First, this reveals that a
  * substantial proportion of publications do not even describe the language
    (or languages) they are dealing with (Bender, 2011)
* citation of papers over time
  * Independently of publication venue, year, or subfield of NLP research, the
    number of languages a publication deals with is not predictive of how many
    citations it will accrue over time (see Figure 4, top right panel). In
  * i.e. little to no additional academic reward when tackling data, problems,
    or tasks involving more than one language
* what explains the production of language technologies across languages to
  * involve agents, mechanisms, and data, outside of the scope of NLP pub thems
  * whether approximate measures of economic centrality or number of lang users
    were better predictors of sheer number of papers published for l (App C)
    * both variables are substantially collinear, we find that
    * approximate GDP (rather than number of users) leads to a substantially
      smaller prediction error of number of published papers

# 4 Discussion 7

* Inflection: there is an encouraging trend of
  both demographic and linguistic-utility improving yearover-year. This is
  * due to that reasonably accurate solutions can be achieved through small but
    highly-curated data. Since linguistic expertise on the languages of the
    world is, naturally, globally distributed, the main hurdle these tasks face
    is to pool such expertise under the premise of a common technical goal. In
* relatively low-cost and bottom-up actions that gather experts to work on
  specific NLP tasks (such as Universal Dependencies and UniMorph) have
  succeeded in accelerating the cross-linguistic development of NLP. These
  * mainly on the basis of academic incentives, as those individuals or groups
  * contributor of data and/or expertise are rewarded with individual
    publications or co-authorship in collective publications.  Many of these
  * not necessarily involve hefty resource investments but instead ling expert
    * markedly different from the typical publications in language technologies
* these tasks are tenuously [gyengén] associated with those that users are more
  likely to interact with, such as Machine Translation or Speech Synthesis
  * computational resources and large data, which hinge on substantial financ
* future developments on policies would benefit from clear (and possibly
  standardized) metrics that assist in streamlining complex decisions regarding
  resource allocation
  * Our measures of global coverage fulfill that role, and
    * help identifying large but currently under-served languages. While we do
