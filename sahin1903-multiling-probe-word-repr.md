Gözde Gül Şahin, Clara Vania, Ilia Kuznetsov, Iryna Gurevych
LINSPECTOR: Multilingual Probing Tasks for Word Representations
arXiv:1903.09442 cs.CL (Gurevych's page calls this a _Report_)

probing datasets and the evaluation suite LINSPECTOR with
https://github.com/UKPLab/linspectoi


# Abstract

* ever growing number of word representation models [for many] languages,
* lack of a standardized technique to provide insights into what is captured
* Such insights would help the community to
  * estimate ... the downstream task performance, as well as to
  * design more informed neural architectures [with less] experimentation
* recent development [is] simple classification tasks, also called probing
  * test for a single linguistic feature such as part-of-speech
  * Existing studies mostly focus on ... English text.  However,
    * from a typological perspective the [morph poor English is] an outlier:
    * information encoded by the word order and function words in English is
      often stored on a **morphological** level in other languages
* we introduce
  * 15 type-level probing tasks such as
    case marking, possession, word length, morph tag count and pseudoword ident
    * 24 languages; reusable methodology
* experiments
  * several diverse multilingual word embedding models
  * we relate the probing task performance [to] five classic NLP tasks:
    POS-tagging, dep parsing, sem role labeling, NER, and nat lang infer
* a number of probing tests have significantly high positive correlation
  especially for morphologically rich languages


# 1 Introduction

* embedding models ... differ in terms of
  * design objective
    * monolingual (Mikolov+ 2013b)
    * cross-lingual (Ruder, Vulić, and Søgaard 2017)
    * contextualized (Peters+ 2018)
    * retrofitted (Faruqui+ 2015)
    * multi-sense (Pilehvar+ 2017)
    * cross-domain (Yang, Lu, and Zheng 2017)
    * dependency-based (Levy and Goldberg 2014)
  * encoding architecture,
    * convolution (Kim+ 2016)
    * linear vector operations (Bojanowski+ 2017)
    * bidirectional LSTM (Ling+ 2015)
  * units: words, characters, character n-grams, morphemes, phonemes
* performance of unsupervised embeddings may differ [by] language and task
  * word2vec (Mikolov+ 2013b) and GloVe (Pennington, Socher, and Manning 2014)
    [suffer on] agglutinative languages like Turkish and Finnish
* representation well-suited for some task[, but bad] at other tasks
  (Rogers, Ananthakrishna, and Rumshisky 2018)
* word vectors [tested] directly in downstream tasks, such as
  * machine translation (MT) (Ataman and Federico 2018),
  * semantic role labeling (SRL) (Şahin and Steedman 2018) or
  * language modeling (LM) (Vania and Lopez 2017)
* probing tasks (Köhn 2016; Shi, Padhi, and Knight 2016; Adi+ 2017;
  Veldhoen, Hupkes, and Zuidema 2016; Conneau+ 2018a)
  * multi-class classification problems that probe a learned word vector
  * e.g. part-of-speech (POS), semantic, or morphological tag
  * (Belinkov+ (2017); Bisazza and Tump (2018), among others)
  * simplicity, low computational cost, and ability to provide some insights
  * limitations
    * mostly designed for English language only, and
    * sentence-level
      (e.g. tree depth, word count, top constituent by Conneau+ (2018a))
  * not be [equally] beneficial in a multilingual setup for several reasons
    1. information encoded by the word order and function words in English is
       encoded at the morphological, subword level information in [other langs]
       e.g. Turkish word katılamayanlardan, that means
       “he/she is one of the folks who can not participate” [távolmaradó(k)]
    2. confusion of the signals: as pointed out by Tenney+ (2019), sometimes
       “operating on full sentence encodings [confounds] the analysis
      * such tests would carry ... undesired biases
        such as domain and majority bias
* we
  * introduce context independent, dictionary-based type-level probing tasks
    that operate on word-level and do not contain domain or majority biases
  * [compare to a] set of similar, but context dependent, treebank-based and
    thereby potentially biased token-level tests
* In this work,
  * We extend the line of work by Conneau+ (2018a) and Tenney+ (2019)
    * Our probing tasks cover a range of features: from
      * superficial ones such as word length, to
      * morphosyntactic features such as case marker, gender, and number; and
      * psycholinguistic ones like pseudowords (phonologically well-formed)
    * languages share a large set of common probing tasks,
      each has a list of its own, e.g., Russian and Spanish are probed for
      gender, while Turkish is probed for polarity and possession;
  * We introduce a reusable, systematic methodology for [test] creation
    by utilizing the existing resources such as
    UniMorph (SylakGlassman+ 2015; Sylak-Glassman 2016; Kirov+ 2018),
    Wikipedia and Wuggy (Keuleers and Brysbaert 2010);
  * We then use the proposed probing tasks to
    * evaluate a set of diverse multilingual embedding models and to
    * diagnose a neural end-to-end SRL model as a case study
  * We introduce a set of comparable token-level probing tasks that
    additionally employs the context of the token
    * We analyze the type~ and token-level probing tasks through 
      a series of intrinsic and diagnostic experiments
    * show that they are similar with some exceptions:
      * token-level tasks may be influenced by domain and majority class bias,
      * type-level tasks may suffer in case of lack of lexical diversity
        and high ambiguity ratios;
  * We provide comprehensive discussions for the intrinsic and extrinsic result
    * numerous factors [other than] the neural architectures play role
      e.g. out-of-vocabulary rates, domain similarity, 
      statistics of both datasets (e.g., ambiguity, size), 
      training corpora for the embeddings; 
      typology, language family, paradigm size and morphological irregularity
* We believe our evaluation suite [and probing datasets are useful for]
  * comparing [multilingual word representations such as] cross-lingual embeds
  * exploring the linguistic features captured by word encoding layers
  * systematic searching of model or architecture parameters, or
  * comparing transfer learning techniques


# 2. Related Work on Word Representation Evaluation

## 2.1 Intrinsic evaluation 4

* word similarity datasets ... in other languages
  * Leviant and Reichart (2015) collected human-assessed translations of
    WordSim-353 and SimLex-999 on three languages, Italian, German and Russian
  * SemEval 2017 shared task, Camacho-Collados+ (2017) introduced manually
    curated word-sim datasets for English, Farsi, German, Italian, and Spanish
* word analogy test ... introduced by Mikolov+ (2013a)
* Tsvetkov+ (2015) introduced QVEC, an intrinsic word evaluation method which
  aligns word vector representations with hand-crafted features extracted from
  lexical resources, focusing on the semantic content. They showed that their
  evaluation score correlates strongly with performance in downstream tasks
* Rogers, Ananthakrishna, and Rumshisky (2018) proposed
  a comprehensive list of scores, so-called linguistic diagnostics factors, and
  analyzed their
  relation to a set of downstream tasks such as chunking, named entity
  recognition (NER), sentiment classification
  * high correlation between morphology-level intrinsic tests with such
    downstream tasks even for English one of the morphologically poorest
  * rely on nearest neighbor relation as a proxy to predict the performance

## 2.2 Extrinsic evaluation 5

* test a single representation model on several downstream tasks
  (Ling+ 2015; Pennington, Socher, and Manning 2014; Bojanowski+ 2017), or to
* test a number of representation models on a single task
  (Vania and Lopez 17; Ataman and Federico 18; Şahin and Steedman 18; Gerz+ 18)
* more general extrinsic evaluation
  Nayak, Angeli, and Manning (2016), which introduces an evaluation suite of
  six downstream tasks: 2 syntactic + 4 semantic

## 2.3 Evaluation via probing task 6


# 3. Probing Tasks 7

## 3.1 Task Definitions

## 3.2 Dataset Creation 13

## 3.4 Token-Level Probing Tasks 16


# 4. Evaluation Methodology 18

## 4.2 Multilingual Embeddings 19

## 4.5 Diagnostic evaluation: a case study on SRL 23


# 5. Experiments and Results 24

## 5.2 Results

### 5.2.2 Results on Token-Level Probing Tasks 29


# 6. Analysis 30

## 6.2 Diagnostic Task 35

## 6.3 Summary of Experimental Findings 38


# 7. Conclusion 39

* the number of correlated probing tests was higher for agglutinative
  languages, especially for syntactic tasks
* We showed that the sets of correlated tests differ depending on the type of
  the downstream task
  * e.g. XNLI performance is strongly correlated with the SameFeat probing
    * SRL is correlated well with the Case.  We observed 
    * Case, POS, Person, Tense and TagCount to have significantly high
      correlations for majority of the analyzed languages and tasks; in
    * Possession was found to correlate well in cases when they were applicable
* the proposed probing tests can be used to [ understand ] how the performance
  on probing tests changes after increasing the model size
  * how?


# 8. Acknowledgements 40
