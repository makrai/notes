What the MASK? Making Sense of Language-Specific BERT Models
Debora Nozza, Federico Bianchi, Dirk Hovy
arXiv:2003.02912 cs.CL

Street(https://bertlang.unibocconi.it/)

# Abstract

* multilingual BERT (mBERT)
  * trained on a corpus of 104 languages, which can serve as a universal
  * impressive results on a zero-shot cross-lingual natural inference task
* an abundant number of BERT models that are trained on a particular language,
  and tested on a specific data domain and task
* we compare mBERT to the performance of these more specific models
  * presents the current SOTA in language-specific BERT models
  * overall picture with respect to architectures, data domains, and tasks
  * overview of the commonalities and differences
    between Language-Specific (language-specific) BERT models and mBERT
* interactive and constantly updated website

# 1 Intro

* multilingual BERT model (mBERT) has been proposed, supporting over 100 langs
  * including Arabic, Dutch, French, German, Italian, or Portuguese
  * trained on different domains, like social media posts or newspaper
  * great capabilities in zero-shot cross-lingual tasks (Pires+ 2019)
* models are trained on a particular language and
  tested on a specific domain and task
* not been clearly demonstrated 
  whether the advantage of a lang-spec model is worth the comput
* different configurations and architectural variants
  * original BERT model was trained using the WordPiece tokenizer (Wu+ 2016),
  * Camem-BERT (Martin+ 2019)) used the SentencePiece tokenizer (available as
    Out of Specification software, Kudo and Richardson, 2018)
* we identified 30 different pretrained language-specific BERT models, covering
  18 Languages and tested on 29 tasks,
  resulting in 177 different performance results
  (Le+ 2019; Antoun+ 2020; Martin+ 2019; Alabi+ 2019; Kuratov & Arkhipov, 2019;
  Arkhipov+ 2019; Virtanen+ 2019; Polignano+ 2019; de Vries+ 2019; Cui+ 2019)
* We outline some of the parameters here, and introduce the associated website
* contributions of this paper are the following:
  1. overall picture: architecture, task and domain
  2. performance of language-specific BERT models compared with the mBERT
  3. website to interactively explore SOTA models

# 2 Bidirectional Encoder Representations from Transformers 2

## 2.1 BERT

* Transformer learns global dependencies between input and output, using only
  attention mechanisms
* Two key elements in the BERT pretraining process are the
  masked language model and the next sentence prediction
* vocabulary is defined in advance and it is based on WordPiece (Wu+ 2016), a

## 2.2 Multilingual BERT, ALBERT and RoBERTA

* Multilingual (mBERT) was part of the original paper (Devlin+ 2019)
* Lan+ (2019) introduced A Lite BERT (ALBERT), to reduce the computation
  * two parameters reduction techniques, that reduce the number of parameters
  * another self-supervised loss, related to sentence order prediction that is
    meant to address the limits of next sentence prediction used in the BERT
* BERT is sensitive to different training strategies (Liu+ 2019)
  * RoBERTA (Liu+ 2019) as a well-optimized version of BERT

# 3 Making-Sense of Language-Specific BERT Models 4

## BertLang, a website

* different language-specific models that have been introduced on a variety of
  tasks and data sets
* We do not include resources that feature only a model without reporting any
  performance results

## 3.2 Language-Specific BERT Models

* availability of data sets in that language determines the tasks and domains

|Task  Metric                 |Spec   |multi|diff	|
|-----------------------------|-------|-----|-----|
|Named Entity Recognition F1  |85.26	|80.87|4.39	|
|Natural Language Inference Ac|78.35	|74.60|3.75	|
|Paraphrase Identification Acc|88.44	|87.74|0.70	|
|Part of Speech Tagging Accur |97.06	|95.87|1.19	|
|Part of Speech Tagging UPOS  |98.28	|97.33|0.95	|
|Sentiment Analysis Accuracy  |90.17	|83.80|6.37	|
|Text Classification Accuracy |88.96	|85.22|3.75	|

* Table 1 shows a summary of the results for the most frequent NLP tasks
  * on average, language-specific BERT models obtain higher results
  * huge variation in the individual performances

### Languages Covered

* range from high-resourced languages (eg French, Italian) to
* low-resource languages, such as Yorb and Mongolian
* we are covering 18 languages
* low-resources languages (eg Yorb and Arabic) show the highest improv
* developers are more likely to be experts on other resources for that lang
  or to collect more data. This makes a greater difference for low-resource

### Architectures

* most popular architecture is the standard BERT one
* ALBERT and RoBERTA has made considered
  * RoBERTA has been used as the base model for the
    French CamemBERT (Martin+ 2019), and the Italian Gilberto and Umberto
* mBERT was used to initialize and fine-tune models for languages such as
  Russian (Kuratov and Arkhipov, 2019), Slavic languages (Arkhipov+ 2019) 7 and
  Yorb (Alabi+ 2019)
  * Here “Slavic” includes Russian, Bulgarian, Czech, and Polish
  * Yorb is a noteworthy example of cross-lingual transfer
    * Fine-tuning mBERT instead of pretraining from scratch

### NLP tasks. We currently index results for 29 NLP tasks. Table 1

* Named Entity Recognition (NER) the most frequent task (22 entries)
* there are some multilingual benchmark data: same NLP task used in diff lang
  * Some of them released by research group publishing in well-known confs
    (Yang+ 2019; Sanguinetti and Bosco, 2015; Conneau+ 2018; Völker+ 2019)
  * others released with shared tasks such as SemEval or CoNLL
    (Zeman+ 2018; Navigli+ 2013; Bosco+ 2016; Benikova+ 2014)
* noun sense disambiguation task is the only task where
  language-specific BERT (Le+ 2019) performances are lower than the mBERT ones
  * could be due to the fact that the training corpora have been
    machine-transled from English to French
* Sentiment analysis is the task where language-specific BERT models obtain the
  highest improvements with respect to mBERT
  * for Arabic (Antoun+ 2020) this can be explained that language-specific
    AraBERT model handles dialects
    — even if they were not explicitly included in the training set
* language-specific tasks, eg the Die/Dat (gendered determiners)
  disambiguation task in Dutch (Delobelle+ 2020), obtaining
  * impressive improvements with respect to SOTA (Allein+ 2020, 23% points accu)

### Domains: a huge variety

* data sets used to pretrain the models and data sets used to evaluate them
* training mainly varies across three source corpora:
  * Wikipedia,
    * 40 million articles created and maintained as an open collaboration
    * 301 different languages, making it the largest and most popular
    * mBERT, for example, was trained over 100 language-specific Wikipedia vers
  * OPUS Corpora (Tiedemann, 2012) and
    * freely available collection of parallel corpora, covering over 90 languag
    * largest domains are legislative and administrative texts, translated
      movie subtitles and localization data from open-source software projects
      (Tiedemann, 2012)
  * OSCAR (Ortiz Suárez+ 2019)
    * obtained by filtering the Common Crawl corpus, which is a parallel
  * Several models concatenate more sources to have enough data to pretrain BERT,
    * BERTje (Dutch BERT), which concatenates news, book data, and Wikipedia
    * Italian BERT model ALBERTO (Polignano+ 2019), which is
      the only one that has been trained only on social media data
      (specifically, on 2 million Twitter posts in Italian language)
* evaluate: different domain data sets to evaluate the models
  * review data for sentiment analysis tasks to
  * transcripts and news for eg POS
  * News data are the most common domain, presumably because they are
    easier to retrieve, and because their
    more formal register makes them more suited for eg POS, dependency, NER
  * social media posts from Twitter are mostly used in tasks like
    sentiment analysis and identification of offensive language

# 4 Conclusions 6

* which languages are covered, which tasks tackled, and which domains considered
  * huge variability models and the difficulty to find the best model for a
    specific task, language, and domain
* In the future, we plan to provide
  * independent verification of reported results and
  * direct comparisons of language-specific BERT models on specific domains and
    tasks
    * use the same data to fine-tune the models i.e. comparable values
