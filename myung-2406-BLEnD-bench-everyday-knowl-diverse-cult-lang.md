BLEnD: A Benchmark for LLMs
  on Everyday Knowledge in Diverse Cultures and Languages
J Myung, N Lee, Y Zhou, J Jin, R Afina Putri, D Antypas, H Borkakoty, E Kim,
  C Perez-Almendros, AA Ayele, V Gutiérrez-Basulto, Y Ibáñez-García, H Lee,
  SH Muhammad, K Park, AS Rzayev, N White, SM Yimam, MT Pilehvar, N Ousidhoum,
  J Camacho-Collados, A Oh
NeurIPS 2024 Datasets & Benchmark Track

https://github.com/nlee0212/BLEnD

# Abstract

* LLMs often lack culture-specific knowledge of daily life,
  especially across diverse regions and non-English languages
* benchmarks for evaluating LLMs' cultural sensitivities are
  limited to a single language or
  collected from online sources such as Wikipedia, which do
  not reflect the mundane everyday lifestyles of diverse regions
  * eg food people eat for their birthday celebrations,
    spices they typically use, musical instruments youngsters play, or the
    sports they practice in school is
* we: BLEnD, a hand-crafted benchmark designed to
  evaluate LLMs' everyday knowledge across diverse cultures and languages
  * 52.6k question-answer pairs from
  * 16 countries/regions, in 13 languages, including low-resource
    * eg Amharic, Assamese, Azerbaijani, Hausa, and Sundanese
  * two formats of questions: short-answer and multiple-choice
* results
  * LLMs perform better for cultures that are highly represented online, with
    a maximum 57.34% difference in GPT-4, the best-performing model, in the
    short-answer format
  * which query lang
    * For cultures represented by mid-to-high-resource languages,
      LLMs perform better in their local languages, but
    * for cultures represented by low-resource languages,
      LLMs perform better in English than the local languages

# Introduction

* eg “What can typically be found in the backyard of houses in your country?"
* LLMs may provide incorrect, incomplete, or nonsensical responses
* these inquiries are frequently encountered in daily lives
* cross-lingual settings, as most LLMs are primarily trained on English data
  reflecting Western perspectives [8, 20, 15]
  * LLMs reflect the stereotypes from the training data [19, 18, 21, 36, 13],
    hence these models would often respond based on Western perspectives
    rather than reflecting actual diverse practices. Ideally, language models
    would reflect the cultural norms of various regions around the world
* goal: generate culturally appropriate content when responding in local langs
  unless otherwise specified. To develop multilingual LLMs with such cultural
  appropriateness, we first need to evaluate the cultural commonsense
* ? multilingual multicultural benchmark that captures the daily lives
  people in diverse cultures
* we: BLEND, a Benchmark for LLMs on Everyday knowledge in Diverse cultures
  and languages
  * 13 languages spoken in 16 countries and regions shown in Table 1
  * including langs that are spoken in two regions with vastly diff cultures,
    eg South Korea and North Korea, both represented by the Korean language. To
  * annotators are native speakers from various countries
  * 500 socio-cultural question-answer pairs for each country/region
  * 6 categories: food, sports, family, education,
    holidays/celebrations/leisure, and work-life
  * questions and answers in two formats: short-answer and multiple-choice
* fig 1: The overall framework for construction and evaluation of BLEND
  * statistics of BLEND are shown in Table 1
  * 52.6k question-and-answer pairs,
    15k short-answer and 37.6k multiple-choice
* experimental results on BLEND show that even
  * 16 SOTA LLMs exhibit unbalanced cultural knowl and unfair cultural biases
  * average performance of all tested models on
    * short answer questions
      * about United States (US) culture in English is 79.22%
      * asked about Ethiopian (ET) culture in Amharic, the avg perf 12.18%
    * multiple-choice format: 
      choose the correct answer for each target country/region, with
      answers from other countries/regions presented as wrong options

# Related Work

* LLMs incorporate extensive parametric knowledge from large corpora [25]
  * [25] 
    Fabio Petroni, T Rocktäschel, S Riedel, P Lewis, A Bakhtin, Y Wu, A Miller
    Language models as knowledge bases? 
    EMNLP-IJCNLP 2019 Hong Kong, China, November petroni-etal-2019-language
  * models frequently display bias due to imbalanced representations [3]
  * Cultural knowledge is critical in enhancing the reasoning capabilities
* socio-cultural aspects of LLMs
  * culture (in cult NLP) := the way of life of a specific group of people [10]
  * research on the cultural knowledge of LLMs centers on the culture at a
    national level
  * Anacleto+ [1] collect commonsense knowledge about eating habits in Brazil,
    Mexico, and US through the Open Mind Common Sense portal
  * GeoMLAMA [33] introduces 16 geo-diverse commonsense concepts and uses
    crowdsourcing to compile knowledge from 5 countries, each in its
    native languages
  * Nguyen+ [22] introduce a methodology to
    extract large-scale cultural commonsense knowledge from the Common Crawl
    on geography, religion, and occupations
  * CREHate [17] is a cross-cultural English hate speech dataset covering
    annotations from 5 English-speaking countries
  * CultureAtlas [9] includes textual data encapsulating the
    cultural norms from 193 countries, primarily sourced from the en Wikipedia
  * hE the majority of these studies are conducted exclusively in English and
    focus on more objective aspects of culture that are written in formal srcs
* non-English speaking countries and languages eg
  * CLIcK [14] and HAE-RAE Bench [29] evaluate LLMs’ knowledge in Korean,
  * COPAL-ID [32], ID-CSQA [26], and IndoCulture [15] include culturally
    nuanced questions in Indonesian
  * no work compares the cultural adaptiveness of LLMs
    across diverse languages and cultures using the same question set
* social network for capturing the everyday cultural nuances of LLMs using
  * StereoKG [7] extracts cultural stereotypes of
    five nationalities and five religious groups from questions posted on X
    (formerly Twitter) and Reddit
    * many noisy and inappropriate assertions due to insufficient filtering
  * CAMEL [20] includes masked prompts from naturally occurring contexts on X,
    focusing on Arabic content, and
  * CultureBank [28] is a collection of diverse perspectives and opinions on
    cultural descriptors, including English comments from TikTok and Reddit
    * hE limited to a single language
    * social media cannot capture people’s full everyday behaviors [31]
* BLEND is carefully human-crafted, capturing everyday life cultural knowledge
  across 13 languages spoken in 16 countries/regions
  including underrepresented regions such as West Java and North Korea

# LLMs Cultural Knowledge Evaluation

* App C.1: Details for the experimental settings and the 16 evaluated models

## 4.1 Short Answer Questions (SAQ)

* two prompts:
  1. directly ask LLMs to provide the answer, and
  2. add persona to the LLMs to make them act as a person from the target
     country or region. The detailed prompts are shown in Appendix C.2.1
  * response marked as correct if it is included in the human annotators’
    responses to the same question. Then we compute the percentage of
    questions to which LLM’s answer is correct.  More details: Appendix C.2.2
* scores for all the countries based on the results obtained for
  the local language vs English
  * We use lemmatizers and stemmers to handle highly inflectional languages
    such as Arabic and variations in words.  The details in Appendix C.2.2
  * we remove accents from words in languages that contain accents, such as
    Spanish and Greek, to ensure that the annotations from human annotators
    match the responses of LLMs
* ignore questions, if three or more annotators do not know the answer

### 4.1.1 LLM Performance on SAQ

* Figure 3a: the performance of five LLMs on short answer questions in the local
  languages of target countries/regions
* Table 10: the performance of all 16 LLMs evaluated
* a consistent trend of lower performance for lower resource languages [12]
  * eg average LLM performance:

| US	    | Spain	  | Iran	  | North Korea	| Northern Nigeria	| Ethiopia	|
|---------|---------|---------|-------------|-------------------|-----------|
| 79.22%	| 69.08%	| 50.78%	| 41.92%	    | 21.18%	          | 12.18%	  |

* Countries that share a common language but differ culturally show
  significant differences, for example, GPT-4, the highest-performing model,
  * 31.63% perf diff between South Korea and North Korea
  * between Spain and Mexico, a performance gap of 4.35%

#### Performance of Region-Centric LLMs

* Models built from non-Western countries tend to show higher performance on
  that specific country/region, Figure 3a
* Qwen1.5-72B [5], made by the Qwen Team in Alibaba Group (Chinese tech comp),
  shows highest performance on Chinese among all models
* HyperCLOVA-X [34], built from the NAVER HyperCLOVA Team (Korea tech comp),
  also shows comparable results on Korean, even
  exceeding GPT-4 performance in North Korean cultural questions
* often benefit from customized datasets richer in local cultural content and
  nuances, typically underrepresented in the more universally used datasets,

#### Prompt in Local language vs. English, Fig 3b

* cultures represented by high-resource languages like Spanish and Chinese,
  the local languages show better performance across all models
* cultures represented by low-resource languages
  eg Azerbaijani, Sundanese, and Amharic,
  English results in better performance (full results are shown in Table 11)
  * ie the models’ proficiency in a particular language significantly
    influences its performance and that
    models tend to show better cultural sensitivity in the local language
    when they possess sufficient linguistic capability
* for North Korean (KP) cultural questions, both English and Korean show poor
  performance as expected, but
  Korean performs slightly better, as it is a relatively high-resource lang

#### Performance by Question Category, Fig 15

* six socio-cultural categories
* lower performance on questions related to
  food and holidays/celebrations/leisure
  than those concerning work-life or education
* more subjective topics like food and leisure are
  more challenging for LLMs to show cultural adaptiveness

## 4.2 Multiple-Choice Questions (MCQ)

* SAQ is effective for multilingual evaluation,
  hE LLMs often generate responses that deviate from the annotators’ one
  or few-word answers, for example, generating long sentences, especially in
  languages that do not follow the instructions well
* MCQ to enable simpler evaluation of LLMs
  * hE only available in English,
    as the incorrect options were chosen from different cultures’ responses to
    the same questions, and translating all of those requires additional work

### 4.2.1 MCQ Construction

* We make the multiple-choice questions about each target country/region in
  English, with other answer options from other countries/regions. For fair
* we remove questions for which
  at least one country has an annotation of ‘not applicable to our culture,’
  or more than three annotators don’t know the answer. We also remove
  all annotations have one vote each, indicating no typical answer from that
  * We determine the correct answer for each question by selecting the
    annotation with the highest votes from each country
* four answer options for each question, with
  no more than one option from any of the other countries
* detailed process of choosing plausible incorrect answer options: App C.3.1
* multiple-choice question prompt is shown in Appendix C.3.3

### 4.2.2 LLM Performance on MCQ

* higher performance in MCQ than in SAQ as shown in Figure 4
  <~ well-defined answers for multiple-choice questions
* hE higher performance in high-resource cultures remains consistent
* When considering the tendencies of all countries/regions for each model, the
  average Pearson correlation between
  the average performance in SAQ in the local languages and English across all
  countries/regions and
  the MCQ performance across all countries/regions is
  notably strong at 0.93
* Pearson correlation between the average model performance in
  English SAQ for all countries and that in
  MCQ exhibits a
  considerably high value of 0.98

# 5 Human Evaluation

* We conduct a human evaluation for short-answer responses from LLMs to
  * responses from GPT-4, the best-performing model, for short-answer questions.
* We define the following categories: stereotypical, partially correct, refusal,
  nonsensical, unnatural language, and different country’s view 
  * we analyze 120 wrong answers based on the automated evaluation. The 
  * detailed instructions and the definitions of each category in App D.3.1
  * summary of the human evaluation results can be found in Table 13.
* stereotypical
  * lang/cult: The most stereotypical responses came from answers generated for
    underrepresented languages/cultures such as Ethiopia, West Java, and Assam,
    with 48.33% of responses from Ethiopia being stereotypical. 
  * category: Most stereotypical questions were related to food or festivals,
    * the LLM attempted to provide traditional information 
      without fully understanding the context. For instance, for 
    * West Java, the LLM frequently answered any food-related questions with
      ‘Seblak,’ one of the most famous dishes originating from the region.
* countries with a high percentage of
  partially correct answers or refusals were all from underrepresented cultures,
  such as Azerbaijan, North Korea, Northern Nigeria, and Ethiopia. This
  * the LLMs tend to provide a long list of multiple answers or even refuse to
    answer when there is insufficient information about the topic/question. The
* nonsensical: same trend was observed for nonsensical answers, indicating that
  * ie the capability of LLMs to comprehend questions is limited for
    low-resource languages. There were also 
* many hallucinations for low-resource languages, such as providing 
  eg ‘Ruslan Cfrov’ as the most famous basketball player in Azerbaijan
  (no famous player with that name)
* answers from the perspective of other countries when responding to queries
  about Azerbaijan and North Korea. For 
  * Azerbaijan, many answers were from the perspectives of other countries in
    the Caucasus region, and for 
  * North Korea, most responses were from the perspective of South Korea. This
    aligns with the annotations for unnatural language, as 
  * the same two countries had the highest ratio of unnatural language. In the
    * Azerbaijan, there were instances where the LLM even responded in Turkish.
    * North Korea, a surprising 18.33% of the responses were marked as unnatural
      * phrased in the words used exclusively in South Korea.

# 6 Conclusion

no novelty

# 7 Limitations and Future Work

* relatively small number of annotators, typically five per question, sometimes
  from the same locality within one country. This might not fully represent the
* most language experts involved in the benchmark creation were academics
  proficient in English, the reference language for communication and
  translation. This may bias part of the construction process as they 
  * may not be fully representative of the population of each country. We do not
* evaluating 
  * short-answer questions poses noticeable challenges.  Despite the
    * accounting for all word variations is difficult, leading to 
    * we: extensive human effort and using lemmatizers/stemmers, 
    * hE correct answers not being evaluated accurately. Our dataset also faces
  * long-form responses from LLMs, as 
    * the annotated data is based on short answers. Future work should focus on
