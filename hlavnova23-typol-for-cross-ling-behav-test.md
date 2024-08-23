Empowering Cross-lingual Behavioral Testing of NLP Models with Typol Features
Ester Hlavnova, Sebastian Ruder
ACL 2023

code at https://github.com/google-research/multi-morph-checklist

# Abstract

* how NLP systems generalize to typological differences relevant for applics
* we propose M2C, a morphologically-aware framework for behavioral testing
  * We use M2C to generate tests that probe models’ behavior in light of
    specific linguistic features in 12 typologically diverse languages
  * M2C aims to provide flexibility in defining a suitable templating system
    with its individual dimensions and features
* We evaluate SOTA language models on the generated tests
  * models excel at most tests in English
  * generalization failures to specific typological characteristics
    eg temporal expressions in Swahili and compounding possessives in Finish
  * we quantified errors occurring due to morphology

# 1 Intro

* the World Atlas of Language Structures (WALS; Haspelmath+ 2005) records
  * 192 linguistic features along which languages differ. These range from
  * eg order of subject, object, and verb (Dryer, 2013) to the
  * number of basic color categories (Kay and Maffi, 2013)
* Languages present in existing NLP datasets mostly lie in low-density regions
  of the space of possible typological features (Ponti+ 2021)
  * ie many linguistic features that are common across the world’s languages
    are not observed in languages that are the focus of NLP research
  * eg tone is present in around 80% of African languages (Adebara and
    Abdul-Mageed, 2022), few Indo-European languages can be considered tonal
* to which linguistic features models can generalize and where challenged
  * existing datasets do not allow for a fine-grained cross-lingual evaluation
  * mainly permit comparisons on a language level (Hu+ 2020)
  * Prior studies focused on syntax and grammar with acceptability judgements
    (Ravfogel+ 2018; Ahmad+ 2019; Mueller+ 2020; Papadimitriou+ 2022)
    * enable the evaluation of what a model deems ‘natural’ in a language
    * unclear how such biases relate to real-world applications of NLP tech
* We propose Multilingual Morphological Checklist (M2C)
  * enable the investigation of a broader set of cross-lingual differences in
    practical scenarios. Specifically, we create
  * a morphologically-aware behavioral testing framework (Ribeiro+ 2020) that
    allows for the specification of tests in a diverse set of languages
  * Using this framework, we design tests that probe model’s behavior in light
    of specific capabilities and typological features in 12 typ div langs
* We focus on a question answering setting:
  * one of the most general and widely useful NLP applications (McCann+ 2018)
  * enables zero-shot evaluation of models
  * We create tests that cover a diverse set of reasoning capabilities
  * ling features
    * general linguistic features that are expressed differently across langs
      * negation, numerals, spatial and temporal expressions, and comparatives
    * features unique to certain languages eg time in Swahili, measure words in
      Chinese, compounding possessives in Finnish, and motion verbs in Russian
* We evaluate SOTA LMs on the generated tests in zero-shot and one-shot
* generalization failures to specific typological features
  * eg all models struggle with time exps in Swahili and measure words in zh
* fig 2: the workflow of using M2C, from template creation to model evaluation,
  1. Templates including context (C), question (Q), and answer (A) and
     placeholders for morphological features are created
  1. M2C is used to generate test cases
  1. A model is evaluated on the generated tests in a prompting setting and M2C
     is used to validate the predictions.  2
* contributions
  * a new morphologically-aware multilingual behavioral testing framework
  * We highlight linguistic features that are challenging in different langs
  * tests that probe model capabilities in light of practically relevant
    typological differences
  * We evaluate SOTA language models on the generated tests
  * challenges posed by typological differences in multilingual scenarios

# 2 Related Work

## Perplexity is a standard measure of evaluating language model performance,

* also been used in multilingual settings (Gerz+ 2018). Besides being
* difficult to compare across segmentations, perplexity does not provide more
* no fine-grained insights on model behavior (Meister and Cotterell, 2021)
* Acceptability evaluations compare perplexity between minimal pairs of
  grammatical and ungrammatical sentences (Linzen+ 2016; Warstadt+ 2020). Such
  * extended to other languages (Ravfogel+ 2018; Ahmad+ 2019; Mueller+ 2020;
    Xiang+ 2021; Papadimitriou+ 2022), which
    * requires writing extensive language-specific grammars while
  * the relevance of syntax biases in real-world applications remains unclear

## Evaluation of large models

* Most benchmarks: performance on a collection of complex tasks
  (Wang+ 2019; Hu+ 2020; Hendrycks+ 2021; Gehrmann+ 2021; Srivastava+ 2022)
  * unable to highlight more fine-grained model limitations
    (Ethayarajh and Jurafsky, 2020)
  * outpaced by the development of new models

## Behavioral testing measures model capabilities via simple targeted tasks

* Early work such as bAbI (Weston+ 2016): toy tasks requiring simple reasoning
* oLMpics (Talmor+ 2020): 8 short classification tasks for masked LMs
* LMentry (Efrat+ 2022): simple tests of fundamental generation capabilities
* natural language inference (Naik+ 2018; McCoy+ 2019) where
  * analyses of reasoning types
  * extended to other languages (K+ 2021; Joshi+ 2020; Hartmann+ 2021)
    * require existing data
* The CheckList framework (Ribeiro+ 2020) enables the generation of behavioral
  tests for NLP models but its templates are English-centric
  * extended to other languages via translation (Ruder+ 2021; K+ 2022)
  * struggle with comprehensively covering linguistic features specific to a
    language and are not able to easily represent morphological variation
* Jiang+ (2020)
  * templates that integrate morphology for simple knowledge retrieval queries
* Kassner+ (2021) automatically translate knowledge retrieval queries
  into other languages
* our framework allows for integrating morphology into a broader range of tests
  * more scalable and flexible

# 3 CheckList

* cannot effectively generating tests in languages with richer morphology,
  which require maintaining agreement between multiple parts of the template— a
* multilingual tests can be generated by translating English tests
  (Ruder+ 2021; K+ 2022)
  * optionally including template extraction and human verification, 
  * hE such generated templates struggle with handling rich morphology. In
  * in order to systematically probe linguistic features specific to a lang, 
    crucial to be able to efficiently generate in-language tests from scratch

# 4 M2C Framework

* A user provides
  * a template as a string,
  * a list of values for each placeholder, and
  * an optional configuration dictionary in case of duplicate placeholders. The
* values can either be passed without inflections (eg names in English) as a
  list of strings, or as a list of dictionaries with their corresponding
  inflected values
  * key of the dictionary is a feature combination (eg, MASC.PL) and the
  * value is the corresponding string (eg “apples”). As such, each entity can

## Morphological categories

* we follow the UniMorph Schema representation (Sylak-Glassman, 2016) , which
  * decomposes morphology into 23 dimensions and over 212 features. For
  * eg, Gender is one dimension, which contains features such as
    Feminine (FEM), Masculine (MASC), and Neuter (NEUT)
* M2C describes both the value attributes given to placeholders and their de-
  pendence on one another
  * eg in order to differentiate between “Juliette est grande” and “Julien est
    grand” in French, it is necessary to ensure gender agreement between noun
    and adjective by including the Gender attribute in the template
* we introduce a syntax describing the morphological dependence
  * `{X.<Y.D>}` signifies that X should have the same feature for dimension D
    as Y. In the above example, this is realized by
    “{first_name} est {adj.<first_name.GENDER>}”

## Language-specific dimensions While initially relying on the UniMorph schema,

* we found cases where the UniMorph dimensions are not sufficient to describe
  * especially necessary for dealing with exceptions
  * eg For instance, the trifold article distinction in Italian masculine
    gender—il treno, l’hotel, lo studente—depends on whether the noun starts
    with a consonant, vowel or h, or a specific consonant combination3
    respectively. In order to lexically encode such exceptions,
=> we provide the ability to add dimensions, in this case STARTSWITH, which
includes features VOW, CONS, and CONS 2. While the goal of M2C is not to be
exhaustive, it should enable encoding a sufficient number of dimensions to

## Advanced templating system To cover the morphological variety

* features can be added sequentially and are commutative, eg,
  `<first_name.GENDER.NUMBER>` is equivalent to `<first_name.NUMBER.GENDER>` where
  NUMBER = {singular, plural}. Often, only two or three output values are
  necessary, which directly depend on a placeholder’s feature
  * We allow a simple expression to be passed directly in the template to make
    eg, {is:first_name.SG|are:first_name.PL}, which produces “is” for a
  * Finally, we allow multiple placeholders with the same type, eg,
    {first_name1} and {first_name2}, to be populated by values of a common
    type, ie, first_name
    In the case of multiple placeholders, we can provide a configuration for
    each placeholder type that specifies boolean repetition and order fields
    to, for instance, avoid having examples like “John and John” (repetition)
    or “John and Mary” and “Mary and John” (order)
* semi-automatic inflection
  * Manual enumeration of features and their values is a barrier to scaling. To
  => we integrate UnimorphInflect (Anastasopoulos and Neubig, 2019), which
  * uses models trained on Unimorph data using the Unimorph Schema to generate
    inflections in 55 languages. As Unimorph models are imperfect—
  * test accuracies range from 90%+ in many languages to 23% in Arabic—we
    => semi-automatic workflow: inflections are generated at scale using
    UnimorphInflect and then manually inspected by annotators for correctness

## Answer validation

* Most prior benchmarks for behavioral testing of language models have focused
  on classification tasks (Talmor+ 2020; Ribeiro+ 2020)
* M2C aims to support the evaluation of generative models using arbit templates
=> we implement functionality to match a range of outputs for each template,
based on morphology, string matching and regex

## Summary

* M2C framework enables the systematic and controlled generation
  of highquality tests at scale in a broad set of languages
* a middle ground between libraries such as
  * SimpleNLG (Gatt and Reiter, 2009) that generate high-quality data but
    require encoding each language-specific rule, and
  * template expansion via generative language models (Honovich+ 2022)
    * highly scalable but less reliable and
      underperform on languages with limited data (Hu+ 2020)
* modular design by allowing the addition of user-specified dimensions and
  features for specific templates and languages
  without requiring to encode all possible rules of a language.  Furthermore,
* an advanced templating syntax and the semi-automatic generation of
  inflections may improve user productivity

# 5 Capabilities and Typological Features

* Languages We generate tests targeting capabilities and typological features
  in 12 typol div langs: en, es, it, fr, de, sv, fi, sk, ru, sw, zh, ar
* Recent models have excelled
  at a wide range of tasks in English requiring a diverse set of reasoning and
  understanding capabilities (Wang+ 2019; Hendrycks+ 2021)
  * most languages are morphologically richer than English, they encode the
    linguistic features representing such capabilities in more complex ways
* The features we investigate are relevant in a variety of real-world applics
  * sentiment analysis (Wiegand+ 2010),
  * question answering (Dua+ 2019),
  * grounding (Kordjamshidi+ 2020),
  * reasoning with temporal change (Lazaridou+ 2021) and
  * quantitative attributes (Elazar+ 2019)
* We investigate capabilities and linguistic features
  * features present in all our investigated languages as well as linguistic
  * features unique to certain languages
* For each feature, we highlight
  * differences in its cross-lingual instantiation and
  * challenges for natural language understanding and generation. We create

## 5.1 Language-agnostic features

### Negation

* In Indo-European languages, negation is often expressed via a particle eg not
* in eg Swahili negation morphemes are fused with the verb root and thus harder
* agreement
  * _kein_ (German): models need to produce the correct agreement 
  * Arabic: In addition to gender and number agreement with the subject, Arabic
    * five forms in singular, three forms in dual, and five forms in plural,

### Numerals Models must be able to recognize and reason with numbers

* spelled-out and numerical forms across different writing and numeral systems,
  eg 17 vs ١٧
* in Russian and Slovak, models must inflect the noun depending on the quantity
  * eg Slovak has separate inflections for quantities of 1, 2--4, 5+
  * also vary based on the object’s animacy

### Spatial expressions

* In Russian, prepositions are associated with different cases, for example the
  eg instrumental case for за (behind) and the prepositional case for on. Such
* Finnish, in addition to prepositions, follows a system of postpositions,
  which relate the location of one thing to another and require
  objects to be inflected in either partitive or genitive case

### Temporal expressions

* eg Finnish and Swahili encode temporal expressions in less complex ways than
* In Swahili, verbal structure follows a simple compounding schema of
  subject marker + tense marker + verb,
  eg a-na-soma (he reads) or u-ta-soma (you will read)

### Comparatives

* Commonly expressed by a suffix or using a quantifier eg _more/less_
* Spanish and French follow the latter approach by placing más/menos and
  plus/moins before the adjective with only a few standard exceptions
* in eg Finnish: complex system includes categories depending on the endings of
  adjectives and a suffix mpi

## 4.2 Language-specific features

### Time in Swahili

* In many languages,
  * the day is divided into two periods: a.m. and p.m., with
  * the daily cycle starting at midnight (0:00) and running through noon
* In Swahili, time is based on sunset and sunrise, defined to be 6 pm and 6 am
  * eg 11.30 am in standard time is 5.30 in the morning in Swahili time
  * key for in-language reasoning and also for cross-lingual applications

### Possessives in Finnish

* Compounding in Finnish along with its system of 15 cases is one of the most
* possessive suffixes attach to the stem of nouns, eg koulu (school) becomes
  kouluni (my school) and koulumme (our school).  Possession is expressed via a
  suffix -lla, which compounds with other suffixes, eg siskollani (my sister
  has), which must be correctly inflected by models in order to achieve the
  intended meaning

### Measure words in Mandarin Chinese, which include over 150 cases

* used for different types of objects depending on their characteristics, eg
  “本” for books, “双” for pairs, or “辆” for vehicles

### Motion verbs in Russian and most Slavic languages behave differently

* most verbs have two forms (imperfective and perfective),
* motion verbs have three forms: one perfective form and two imperfective forms
  * Of the imperfective forms, the
    * definite form indicates unidirectional or current one-time motion while
    * indefinite form represents multi-directional or habitual motion

# 6 Experiments

## Experimental setting We evaluate models on

* one-shot setting, a test randomly generated using the same template is used
  as the exemplar
* This simplifies the task in two ways:
  * it provides the model with a clear format for generating the answer and
  * may enable the model to infer the answer’s relationship to the rest of
    the template. While we conduct one-shot experiments to show the impact of
    additional instructions,
* confounder: the exemplar choice (Zhao+ 2021)
* prior work on behavioral testing (Ribeiro+ 2020; Efrat+ 2022)
* zero-shot evaluation is the only setting that fully tests underst, generative

## Models. We evaluate five SOTA pretrained language models of different size:

* an LM-adapted version (Vu+ 2022) of mT5-XXL (13B parameters; Xue+ 2021);
  * Tu Vu, Aditya Barua, Brian Lester, Daniel Cer, Mohit Iyyer, & Noah Constant
    Overcoming catastrophic forgetting in zero-shot cross-lingual generation
    EMNLP 2022 pages 9279–9300, Abu Dhabi, United Arab Emirates
* PaLM-S (8B parameters), PaLM-M (62B parameters), and PaLM-L (540B parameters;
  Chowdhery+ 2022); and PaLM 2 (Anil+ 2023)
* none spec fine-tuned for instruction-following or few-shot learning

### Generation Predictions are generated using greedy decoding with a

* temperature of 0 and a maximum of 20 decoding steps

# 7 Results, tab 4

## 7.1 Performance across Languages

* across the other languages both models only pass at most 50% of tests—and
  * less than a third for SK, SW, and AR for PaLM-S.  These results highlight
  * ie the tests generated with M2C are challenging for the majority of SOTA
    models and demonstrate that a clear gap under performance on English
* Competence with language-agnostic features emerges at scale
  * 20 point improvement in average performance from PaLM-S to PaLM-M to
    PaLM-L
  * PaLM 2 achieves the largest improvements on Slovak, Russian, Swahili, Arab
  * hE On Finnish, Slovak, Chinese, and Swahili average performance of PaLm 2
    is still below 90% indicating that there is headroom left

## 7.2 Performance across Linguistic Features

### Language-agnostic features

* The most challenging test types for mT5-XXL and PaLM 2 are numer and compar
* mT5 performs poorly on addition and only slightly better on subtraction while
* PaLM 2 achieves around 90% performance on most languages
* On comparatives, both models have more difficulty in the conditional case
* negation: While PaLM 2 passes negation tests with ~ perf accur across lings
  * mT5 displays reduced performance,
    particularly when the question is negated and for non-Indo-European
* spatial and temporal tests,
  * mT5 achieves reasonable performance in most languages, while
  * PaLM 2 achieves perfect performance in most cases except for Swahili

### Language-specific features, tab 5

* easy: All models have acquired a reasonable ability to distinguish between
  different forms of motion verbs in Russian
* Small and medium-sized models generally fail to reason with compounding
  possessives in Finnish and time expressions in Swahili while
* all models are unable to perfectly {employ the correct/reason with}
  * measure words in Chinese, despite it being a high-resource language
  * time expressions in Swahili
* examples of errors for each test type together with English glosses in App B

## 7.3 Evaluating Morphological Correctness

* we additionally calculate the fraction of errors due to morphology in the
  * for the tests with morphological variation in the answer. This enables us
* a non-negligible fraction of errors are due to incorrect morphological forms
  * For negation in Slovak, around half of PaLM-L’s errors are due to morph
    * eg incorrect use of diacritics or suffixes, highlighting
    * a weakness of subword-based models. For
  * numerical reasoning, models frequently produce incorrectly inflected nums
    * spatial, temporal, comparatives: Similarly, incorrect case or number

## 7.4 One-shot Evaluation

* Improvements are larger for smaller models, which benefit more from informa-
  * even in this setting models are unable to achieve perfect accuracy across
    all languages
* Reasoning with numerals and comparatives are still challeng for most models
  * improvements on numerals are also relatively smaller than on other
* Models struggle particularly in Swahili across different test types

# Conclusion
