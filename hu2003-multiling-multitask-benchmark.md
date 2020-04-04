XTREME: A Massively Multilingual Multi-task Benchmark
  for Evaluating Cross-lingual Generalization
Junjie Hu, Sebastian Ruder, A Siddhant, G Neubig, Orhan Firat, Melvin Johnson
arXiv:2003.11080 [cs.CL]

# Abstract

* we introduce the Cross-lingual TRansfer Evaluation of Multilingual Encoders
  * multi-task benchmark for evaluating the cross-lingual generalization
* 40 languages and 9 tasks
  * models tested on English reach human performance on many tasks
  * sizable gap [cross-lingually] particularly on syntactic and sentence retriv

# 1. Introduction

* a pressing urgency to ... serve all of the world’s approximately 6,900 langs
  * overcome language barriers and enable universal information access for the
    world’s citizens (Ruder+ 2019; Aharoni+ 2019; Arivazhagan+ 2019b)
* Early [multilingual work] focused on single tasks, such as
  * grammar induction (Snyder+ 2009)
  * part-of-speech (POS) tagging (Täckström+ 2013)
  * parsing (McDonald+ 2011)
  * text classification (Klementiev+ 2012). Over the last few years, there has
* general-purpose multilingual representations
  * word level (Mikolov+ 2013; Faruqui & Dyer, 2014; Artetxe+ 2017) or the
  * full-sentence level (Devlin+ 2019; Lample & Conneau, 2019)
  * evaluation [often] on a very
    * limited and disparate set of tasks
      * translation (Glavaš+ 2019; Lample & Conneau, 2019) and
      * classification (Schwenk & Li, 2018; Conneau+ 2018b)— and
    * typologically similar languages (Conneau+ 2018a)
* XTREME covers
  * 40 typologically diverse languages spanning 12 families and includes
    * typologically diverse = wide set of linguistic phenomena such as
      compounding, inflection, derivation, etc. which occur in many languages 
  * 9 tasks that require reasoning about different levels of syntax or sem
  * pseudo test sets as diagnostics that cover all 40 languages
    by automatically translating the English test set of the NLI and QA dataset
  * focuses on the zero-shot cross-lingual transfer scenario, where
    * annotated training data is provided in English but none is provided in tg
    * both for
      * efficiency purposes (as it only requires testing, not training)
      * practical considerations (as annotated training data is not available)
* We evaluate a range of SOTA approaches to performing this transfer
  * machine translation (MT) and multilingual representation-based
* SOTA models come close to human performance in English on many of the tasks
  * performance drops significantly when evaluated on other languages
  * differences are highest for syntactic and sentence retrieval tasks
  * reasonably [good] in most languages in the Indo-European family
    * lower particularly for Sino-Tibetan, Japonic, Koreanic, and Niger-Congo
* contributions:
  * 9 cross-lingual benchmark tasks covering 40 typologically diverse languages
  * online platform and leaderboard for the evaluation of multilingual models
  * strong baselines, which we evaluate across all tasks, and release code
  * extensive analysis of limitations of SOTA cross-lingual models

# 2. Related Work

## Cross-lingual representations

* using either parallel corpora (Gouws+ 2015; Luong+ 2015) or a
  bilingual dictionary to learn a linear transformation
  (Mikolov+ 2013; Faruqui & Dyer, 2014)
* self-training (Artetxe+ 2017) and
* unsupervised strategies such as
  * adversarial training (Conneau+ 2018a)
  * heuristic initialisation (Artetxe+ 2018)
  * optimal transport (Zhang+ 2017)
* monolingual transfer learning
  (McCann+ 2017; Howard & Ruder, 2018; Peters+ 2018; Devlin+ 2019),
* deep cross-lingual representations (Eriguchi+ 2018; Pires+ 2019; Wu & Dredze,
  2019; Lample & Conneau, 2019; Siddhant+ 2019)

## Cross-lingual evaluation

* translation, either on the
  * word level (bilingual lexicon induction) or on the
  * sentence level (machine translation)
  * typologically related languages and similar domains; approaches have been
  * fail in less favorable conditions (Glavaš+ 2019; Vulić+ 2019; Guzmán+ 2019)
  * issues with common datasets for bilingual lexicon induction
    (Czarnowska+ 2019; Kementchedjhieva+ 2019) and a
  * weak correlation with certain downstream tasks (Glavaš+ 2019)
  * not capture differences in classification performance 
    that are due to cultural differences (Mohammad+ 2016; Smith+ 2016)
* wide range of tasks, including
  * dependency parsing (Schuster+ 2019)
  * named entity recognition (Rahimi+ 2019)
  * sentiment analysis (Barnes+ 2018)
  * natural language inference (Conneau+ 2018b)
  * document classification (Schwenk & Li, 2018)
  * question answering (Artetxe+ 2019; Lewis+ 2019)
* Evaluation on a single task is problematic: issues with standard datasets:
  * MLDoc (Schwenk & Li, 18) can be solved by matching keywords (Artetxe+ 19)
  * MultiNLI, the dataset from which XNLI (Conneau+ 2018b) was derived,
    contains superficial cues that can be exploited (Gururangan+ 2018)
* [monolingual] Benchmarks covering multiple tasks like
  GLUE (Wang+ 2019b) and SuperGLUE (Wang+ 2019a) have spurred [sarkantyúz] rese

# 3. XTREME

## 3.1. Design principles

### Task difficulty: Tasks should be sufficiently challenging i.e. `<` human

### Task diversity

* transfer ... at different levels, e.g. words, phrases and sentences
  * classification tasks require sentence-level transfer of meaning,
  * sequence labeling tasks like POS and NER test ... the word level

### Training efficiency

* Tasks should be trainable on a single GPU for less than a day

### Multilinguality: We prefer tasks that cover many languages and families

### Sufficient monolingual data ... for learning useful pre-trained reprs

### Accessibility: permissive license

* use and redistribution of the data for research purposes

## 3.2. Tasks

* nine tasks that fall into
* four different categories requiring reasoning on different levels of meaning

### XNLI

* train: MultiNLI (Williams+ 2018) training data is used for training
* eval: Cross-lingual Natural Language Inference corpus (Conneau+ 2018b)
  * whether a premise sentence entails, contradicts, or is neutral toward a hyp
  * Crowd-sourced English data is translated to ten other languages by profesnl

### PAWS-X, Cross-ling Paraphrase Adversaries from Word Scrambling (Yang+ 2019)

* determine whether two sentences are paraphrases
* translated to six other languages by professional translators

### POS from the Universal Dependencies v2.5 (Nivre+ 2018) treebanks

* 90 languages. Each word is assigned one of 17 universal POS tags

### NER: Wikiann (Pan+ 2017) dataset

* automatically annotated with LOC, PER, and ORG tags in IOB2 format
  using a combination of knowledge base properties,
  crosslingual and anchor links, self-training, and data selection
* We use the balanced train, dev, and test splits from Rahimi+ (2019)

### XQuAD The Cross-lingual Question Answering Dataset (Artetxe+ 2019)

* answer to a question as a span in the corresponding paragraph
* subset of the English SQuAD v1.1 (Rajpurkar+ 2016) dev set was translated
  into ten other languages by professional translators and is used for eval

### MLQA The Multilingual Question Answering (Lewis+ 2019) dataset

* similar to XQuAD. The evaluation data for English and six other languages

### TyDiQA-GoldP

* We use the gold passage version of the
  Typologically Diverse Question Answering (Clark+ 2020) dataset
  * information-seeking question answering, which covers nine languages
  * gold passage version is a simplified version of the primary task, which
    uses only the gold passage as context and excludes unanswerable questions
  * similar to XQuAD and MLQA, while being more challenging
    as questions have been written without seeing the answers, leading to
    3× and 2× less lexical overlap compared to XQuAD and MLQA respectively

### BUCC

* 2nd 3rd shared task of the workshop on Building and Using Parallel Corpora
  (Zweigenbaum+ 2017; 2018) is to extract parallel sentences
* between English and four other languages. The dataset provides train/test spl

### Tatoeba dataset (Artetxe & Schwenk, 2019)

* 1,000 English-aligned sentence pairs covering 122 languages.  We find the
  nearest neighbour using cosine similarity

## 3.3. Languages

* choose[n] based on availability of monolingual data, and typological diversit
* number of articles in Wikipedia as a proxy for the amount of monolingual data
* all languages out of the top 100 Wikipedias 6 with the most articles as of
  * they are covered by SOTA methods such as mBERT and XLM
  * all languages that appear in at least three of our benchmark datasets
    This leaves us with 19 languages, most[ly] Indo-European or world languages
  * 21 additional languages that appear in at least one dataset and come
    from [other] families.  Wherever possible, ... at least two languages per f
    * For the Austro-Asiatic, Kartvelian, and Kra-Dai families as well as for
      isolates, we only obtain one language
* the following 40 languages (shown with their ISO 639-1 codes for brevity)
  * 12 language families and two isolates:
* overview ... in terms of their number of Wikipedia articles,
  linguistic features, and coverage in XTREME in the appendix
* does not mean that [XTREME] covers all aspects of each language that are
  necessary for transfer. Languages may reveal different characteristics
  based on the task, domain, and register in which they are used. XTREME thus

## 3.4. Pseudo test data for analyses

* we automatically translate the English portions of a representative
  classification and QA task to the remaining languages using an in-house
  translation system, details ... in the appendix
* We choose XNLI and XQuAD as both have test sets that are translations of the
  English data by professional translators
* We first verify that performance on the translated test sets is a good proxy
  * detailed results in the appendix. For
  * XQuAD: automatically translated test sets underestimate mBERT’s true
    performance, similar[ly to that] reported by Agić & Schluter (2018)
  * XNLI, the automatically translated test sets overestimate the true
