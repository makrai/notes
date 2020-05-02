XTREME: A Massively Multilingual Multi-task Benchmark
  for Evaluating Cross-lingual Generalization
Junjie Hu, Sebastian Ruder, A Siddhant, G Neubig, Orhan Firat, Melvin Johnson
arXiv:2003.11080 [cs.CL]

https://ai.googleblog.com/2020/04/xtreme-massively-multilingual-multi.html

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
* all languages out of the top 100 Wikipedias with the most articles
  * they are covered by SOTA methods such as mBERT and XLM
  * all languages that appear in at least three of our benchmark datasets
  * This leaves us with 19 languages, most[ly] Indo-European or world languages
  * 21 additional languages that appear in at least one dataset and come
    from [other] families.  Wherever possible, ... at least two languages per f
    * For the Austro-Asiatic, Kartvelian, and Kra-Dai families as well as for
      isolates, we only obtain one language
* the following 40 languages (shown with their ISO 639-1 codes for brevity)
  * af ar bg bn de el en es et eu fa fi fr he hi hu id it ja jv ka kk ko ml mr
    ms my nl pt ru sw ta te th tl tr ur vi yo zh
  * 12 language families and two isolates
* overview ... in terms of their number of Wikipedia articles,
  linguistic features, and coverage in XTREME in the appendix
* does not mean that [XTREME] covers all aspects of each language that are
  necessary for transfer. Languages may reveal different characteristics
  based on the task, domain, and register in which they are used

## 3.4. Pseudo test data for analyses

* we automatically translate the English portions of a representative
  classification and QA task to the remaining languages
  using an in-house translation system, details ... in the appendix
* We choose XNLI and XQuAD as both have test sets that are translations of the
  English data by professional translators
* We first verify that performance on the translated test sets is a good proxy
  * detailed results in the appendix
  * XQuAD: automatically translated test sets underestimate mBERT
    * similar[ly to that] reported by Agić & Schluter (2018)
  * XNLI, the automatically translated test sets overestimate mBERT
  * Note that even human translated test sets may underestimate a model
    * as such translationese has been shown to be less lexically diverse than
      naturally composed language (Koppel & Ordan, 2011)

# 4. Experiments 4

## 4.1. Training and evaluation setup

* XTREME focuses on the evaluation of multilingual representations. We do not
* [no] restriction on the amount or nature of the monolingual data used for
  pretraining multilingual representations. However, we request authors to be
* For evaluation, we focus on zero-shot cross-lingual transfer [from] English
  * many tasks only have training data available in English. Although
  * English is not generally the best source language for cross-lingual
    transfer for all target languages (Lin+ 2019), this is still the
  * A single source language also facilitates evaluation as models only need to
    be trained once and can be evaluated on all other languages. 10
  * Future work may also consider multi-source transfer, which is interesting
    particularly for low-resource languages, and transfer to unknown languages
    or unknown language-task combinations
* pretrained multilingual representations are finetuned on English labelled
  data of an XTREME task. The model is then evaluated on the test data of the

##4.2. Baselines

* strong baselines and state-ofthe-art models. The approaches we consider learn
  * multilingual representations via
    self-supervision or leverage translations—either for representation
    learning or for training models in the source or target language. We focus
* focus on models that learn a multilingual embedding space between all
  * future work to focus on these languages to capture as much language
    diversity as possible. We report hyperparameters in the appendix. All
  * hyper-parameter tuning is done on English validation data.  We encourage

### mBERT Multilingual BERT (Devlin+ 2019) is a transformer model (Vaswani+ 17)

* pretrained on the Wikipedias of 104 languages using masked language modelling

### XLM (Lample & Conneau, 2019): similar pretraining objective as mBERT but

* larger model, a larger shared vocabulary, and trained on the same Wikipedia
  data covering 100 languages

### XLM-R Large (Conneau+ 2019): similar to XLM but

* more than a magnitude more data from the web covering 100 languages

### MMTE The massively multilingual translation encoder

* part of an NMT model that has been trained on in-house parallel data of 103
  languages extracted from the web (Arivazhagan+ 2019a). For transfer, we
  fine-tune the encoder of the model (Siddhant+ 2019)

### Translate-train

* For many language pairs, an MT model may be available, which can be used to
* we translate the English training data ... using our in-house MT system. We
* then fine-tune mBERT on the translated data
* answer spans in the source and target language for the QA tasks in the append
* [not] for structured prediction tasks due to an abundance of in-language
  data and a requirement for annotation projection

### Translate-train multi-task: fine-tune mBERT on the combined translated
training data of all languages jointly

### Translate-test

* English BERT Large (Devlin+ 2019) model on the English training data
* test data translated from the target language to English
  using our in-house MT system

### In-language model For the POS, NER, and TyDiQA GoldP tasks where

* target-language training data is available, we
* fine-tune mBERT on monolingual data in the target language
  to estimate how useful target language labelled data is
  compared to labelled sr

### In-language few-shot

* In many cases, it may be possible to procure a small number of labelled
  examples in the target language (Eisenschlos+ 2019).  To evaluate the
* mBERT model fine-tuned on 1,000 target language examples for the tasks where
  monolingual training data is available in the target languages

### In-language multi-task For the tasks where monolingual training data is
available, we additionally compare against an
* mBERT model that is jointly trained on the combined training data of all lang

### Human performance For XNLI, PAWS-X, and XQuAD, we obtain human performance

* from the English datasets they are derived from, MNLI, PAWS-X, and SQuAD
  respectively (Nangia & Bowman, 2019; Zhang+ 2019; Rajpurkar+ 2016). 12 For
* TyDiQA-GoldP, we use the performance estimate of Clark+ (2020). For
* MLQA, as answers are annotated using the same format as SQuAD, we employ the
  same human performance estimate.  For
* POS tagging, we adopt 97% as a canonical estimate of human performance
  based on Manning (2011). We are not able to obtain human performance
* [no] for
  * NER as annotations have been automatically generated and for
  * sentence retrieval as identifying a translation among a large number of
    documents is too time-consuming

## 4.3. Results 5

### Overall results We show the main results in Table 2

* zero-shot: XLM-R is the best-performing zero-shot transfer model and
  generally improves upon mBERT significantly
  * improvement is smaller, however, for the structured prediction tasks
  * MMTE achieves performance competitive with mBERT on most tasks, with
    * stronger results on XNLI, POS, and BUCC
* If a strong MT system is available, translating the training sets provides
  improvements over using the same model with zero-shot transfer
  * Translating the test data provides similar benefits
    * particularly effective for the more complex QA tasks,
    * while more expensive during inference time
* For the tasks where in-language training data is available,
  * multilingual models trained on in-language data outperform zero-shot
  * zero-shot transfer models nevertheless outperform multilingual models
    trained on only 1,000 in-language examples on the complex QA tasks as long
    as more samples in English are available
  * structured prediction tasks, 1,000 in-language examples enable the model to
    achieve performance that is similar to being trained on the full labelled
    dataset, similar to findings for classification (Eisenschlos+ 2019)
* multitask learning on the Translate-train and In-language setting generally
  improves upon single language training

### Cross-lingual transfer gap

* i.e. the difference between ... English test set and all other languages in
* Table 3
* This comparison should be taken with a grain of salt, as
  scores across languages are not directly comparable
  for the tasks where test sets differ, i.e. POS, NER, MLQA, and TyDiQA-GoldP
  * differences in scores may not be linearly related
* powerful models such as XLM-R reduce the gap significantly (< mBERT)
* XLM-R reduce the gap significantly compared to mBERT
  * for challenging tasks such as XQuAD and MLQA
  * not have the same impact on the syntactic structured prediction tasks
  * classification tasks, the transfer learning gap is lowest
* MT reduces the gap across all tasks

# 5. Analyses [of the limitations of state-of-the-art cross-lingual models] 6 

## Best zero-shot model analysis

* i.e. XLM-R Large ... by task and language in Figure 1
* Figure 1. An overview of XLM-R’s performance on the XTREME tasks across all
  * an estimate of human performance, performance on the English test set,
    the average of all languages excluding English, and the family of each lang
  * pseudo test sets for XNLI and XQuAD is shown with slightly transparent mark
* std
  * XNLI, probably the most common standard cross-lingual evaluation task, and
    PAWS-X, scores cluster in a relatively small range—even considering pseudo
  * the remaining tasks have significantly wider spread, particularly as we
    include pseudo test sets
  * [English is lowest] For TyDiQA-GoldP, English performance is lowest in
    * high performance on Indonesian and Finnish may be due to less complex
      Wikipedia context passages for these languages. Across tasks, we
  * lower performance for other language families, particularly for
    Sino-Tibetan, Japonic, Koreanic, and Niger-Congo languages. Some of these
    * may be due to tokenisation and an
      under-representation of ideograms in the joint sentencepiece vocabulary,
      * important in a cross-lingual model’s (Artetxe+ 2019; Conneau+ 2019). We
* similar trends for mBERT, for which we show the same graph in the appendix

## Correlation with pretraining data size, Pearson ρ with the number of Wp art

* mBERT, which was pretrained on Wikipedia, we observe a
  * high correlation for most tasks (ρ ≈ 0.8) except for the structured
  * similar trends for XLM and XLM-R, with lower numbers for XLM-R due to the
    different pretraining domain (see the appendix). This indicates that
* similar correlations when using the number of tokens in Wikipedia instead

## Language characteristics

* language families and writing scripts in Figure 3. For
* mBERT, we observe the best transfer performance on branches of the
  * family
    * Indo-European language family such as Germanic, Romance and Slavic
    * e.g. Niger-Congo and Kra-Dai is still low. Looking at
* scripts, we find that the
  performance on syntactic tasks differs among popular scripts such as Latin
  and ideogram scripts. For example in the
  * NER task, mBERT performs better on data in Latin script than that in
    Chinese or Japanese ideograms.  This indicates that the current models
    * i.e. difficulty transferring word-level syntactic information

## Errors across languages

* XNLI and XQuAD where the other test sets are translations from English, we
* whether approaches make the same type of errors in the source and target
  * whether examples that are correctly and incorrectly predicted in English
    are correctly predicted in other languages.  On the
* XNLI dev set, mBERT
  * en correct -> correctly predicts on average 71.8% of examples that were
  * en misclass-> performance is about random. On average,
  * predictions ... consistent between English and another language for 68.3%
* XQuAD test set, mBERT
  * en correct -> correctly predicts around 60% of examples
  * en incorr  -> 20%

## Generalization to unseen tag combinations and entities

* possible reasons for the less successful transfer on structured prediction
* Universal Dependencies dataset used for POS tagging uses a
  common set of 17 POS tags for all languages, so a
  model is not required to generalize to unseen tags at test time. However, a
  * hE model may be required to generalize to unseen tag combinations at test
  * e.g. due to differences in word order between languages
* We gauge [megmér] a model’s accuracy for [unseen] POS tag n-grams in the trgt
  * n=3,4 mBERT in Table 4. We observe the
  * largest differences in performance for unseen trigrams and 4-grams, which
    highlights that existing cross-lingual models struggle to transfer to the
    syntactic characteristics of other languages. For
* NER, we estimate how well models generalize to unseen entities at test time
  * largest ... for Indonesian and Swahili
  * Isolating for e.g. entity length, frequency, and Latin script, we find the
    largest differences in performance for Swahili and Basque. Together, this
* detailed results for both analyses in the appendix

# 6. Conclusions

* varies significantly both between tasks and languages. XTREME is a first step
* Our future work is to package the demonstration codes for fine-tuning models
  on tasks in XTREME and provide analysis tools, and these will be released
  upon publication
