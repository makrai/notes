Gözde Gül Şahin, Clara Vania, Ilia Kuznetsov, Iryna Gurevych
LINSPECTOR: Multilingual Probing Tasks for Word Representations
arXiv:1903.09442 cs.CL (Gurevych's page calls this a _Report_)

probing datasets and the evaluation suite LINSPECTOR with
https://github.com/UKPLab/linspectoi


# Abstract

* ever growing number of word representation models [for many] languages,
* lack of a standardized technique to provide insights into what is captured
* Such insights would help the community to
  * estimate ... the downstream task performance
  * design more informed neural architectures [with less] experimentation
* recent development [is] simple classification tasks, also called probing
  * test for a single linguistic feature such as part-of-speech
  * Existing studies mostly focus on ... English text.  However,
    * from a typological perspective the [morph poor English is] an outlier:
    * information encoded by the word order and function words in English is
      often stored on a **morphological** level in other languages
      e.g. Turkish word katılamayanlardan, that means
      “he/she is one of the folks who can not participate” [távolmaradó(k)]
* we introduce
  * 15 type-level probing tasks such as
    case marking, possession, word length, morph tag count and pseudo-word id
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
  * not [equally] beneficial in a multilingual setup for several reasons
    1. information encoded by the word order and function words in English is
       encoded at the morphological, subword level information in [other langs]
    2. confusion of the signals: as pointed out by Tenney+ (2019), sometimes
       “operating on full sentence encodings [confounds] the analysis
      * such tests would carry ... undesired biases
        such as domain and majority bias
* we
  * introduce context independent, dictionary-based type-level probing tasks
  * [compare to a] set of similar, but context dependent, treebank-based and
    thereby potentially biased token-level tests
  * extend the line of work by Conneau+ (2018a) and Tenney+ (2019)
    * Our probing tasks cover a range of features: from
      * superficial ones such as word length, to
      * morphosyntactic features such as case marker, gender, and number; and
      * psycholinguistic ones like pseudo-words (phonologically well-formed)
    * languages share a large set of common probing tasks,
      each has a list of its own
      * e.g. Russian and Spanish are probed for gender, while
      * Turkish is probed for polarity and possession;
  * introduce a reusable, systematic methodology for [test] creation
    by utilizing the existing resources such as
    UniMorph (SylakGlassman+ 2015; Sylak-Glassman 2016; Kirov+ 2018),
    Wikipedia and Wuggy (Keuleers and Brysbaert 2010);
  * then use the proposed probing tasks to
    * evaluate a set of diverse multilingual embedding models and to
    * diagnose a neural end-to-end SRL model as a case study
  * introduce a set of comparable token-level probing tasks that
    additionally employs the context of the token
    * analyze the type~ and token-level probing tasks through
      a series of intrinsic and diagnostic experiments
    * show that they are similar with some exceptions:
      * token-level tasks may be influenced by domain and majority class bias,
      * type-level tasks may suffer in case of lack of lexical diversity
        and high ambiguity ratios;
  * provide comprehensive discussions for the intrinsic and extrinsic result
    * numerous factors [other than] the neural architectures play role
      e.g. out-of-vocabulary rates, domain similarity,
      statistics of both datasets (e.g., ambiguity, size),
      training corpora for the embeddings;
      typology, language family, paradigm size and morphological irregularity
* We believe our evaluation suite ... and probing datasets are useful for
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
* linguistic diagnostics factors (Rogers, Ananthakrishna, and Rumshisky 2018)
  * a comprehensive list of scores
  * [their] relation to a set of downstream tasks such as
    chunking, named entity recognition (NER), sentiment classification [analed]
  * high correlation between morphology-level intrinsic tests with such
    downstream tasks even for English
  * rely on nearest neighbor relation as a proxy to predict the performance

## 2.2 Extrinsic evaluation 5

* test a single representation model on several downstream tasks
  (Ling+ 2015; Pennington, Socher, and Manning 2014; Bojanowski+ 2017), or to
* test a number of representation models on a single task
  (Vania and Lopez 17; Ataman and Federico 18; Şahin and Steedman 18; Gerz+ 18)
* more general extrinsic evaluation
  Nayak, Angeli, and Manning (2016) introduce an evaluation suite of
  six downstream tasks: 2 syntactic + 4 semantic

## 2.3 Evaluation via probing task 6

* workshops
  * Representation Evaluation (RepEval) (Nangia+ 2017) and
  * BlackBoxNLP Workshop series (Tal Linzen, Chrupała, and Alishahi 2018)
* associate some linguistic properties such as POS, morphological, or semantic
  with representations from a trained model (hidden states or activation layer)
* called probing task or diagnostic classifier
  (Shi, Padhi, and Knight 2016; Adi+ 2017; Veldhoen, Hupkes, and Zuidema 2016),
  uses representations generated from a fully-trained model with frozen weights
  to train a classifier predicting a particular linguistic property. The
  performance of this classifier is then used to measure how well the model has
* similar study [for] syntactic features such as gender and tense (Köhn 2015)
  * [features] extracted from annotated dependency treebanks. Due to
  * that time, static word-level embeddings (word2vec, GloVe, and embeddings
    derived from Brown clusters) and find that they
  * [embeddings] are suprisingly able to capture linguistic properties, e.g POS
    particular for POS information
* syntactic parsers [probed] for ... tense and number (Köhn 2016)
* differences between Köhn and us
  * treebank ... may introduce domain, annotator and majority class bias unlike
  * unresolved ambiguity.  In addition, the study is
  * Köhn limited case, gender, tense and number; and to syntactic parsing as
    the downstream task
  * only three word embedding models, which can be considered too small
    * their training objectives and training units are similar
* effects of word inflection and typological diversity in word representation
  * Qian, Qiu, and Huang (2016) investigate the
  * language type (word order or morphological complexity) influences how
    linguistic information is encoded in the representations
  * They also compare a character-level autoencoder model to a Skip-Gram) and
    * characterlevel models are better at capturing morphosyntactic information
    * highlights the importance of utilizing word form information [with] typ
* probing [representations learned] for specific downstream tasks, such as
  * MT (Shi, Padhi, and Knight 2016; Belinkov+ 2017; Bisazza and Tump 2018) or
  * dependency parsing (Vania, Grivas, and Lopez 2018). While this approach
* more general evaluation, Conneau+ (2018a) and Tenney+ (2019) each introduced
  a broad coverage evaluation suite to analyze representations on the sentence
  * focus on English. We build our methodology upon these recent works
  * our tests are type-level, rather than sentence (Conneau+ 2018a) or
    sub-sentence level (Tenney+ 2019)
* survey (Belinkov and Glass 2019) recently surveyed various analysis methods
  in NLP and mention three important aspects for model analysis:
  1. the methods (classifiers, correlations, or similarity),
  1. the linguistic phenomena (sentence length, word order, synt, or sem info)
  1. the neural network components (embeddings or hidden states).  They have
  * a non-exhaustive list of previous work which use probing task (classifier)
    method for analyzing representations, including word representations. For a


# 3. Probing Tasks 7

* we aim to cover the properties ranging from
  shallow e.g. word length (Conneau+ 2018a), to
  deeper ones e.g. distinguishing pseudowords from in-vocabulary words
1. morphosyntactic and morphosemantic features such as case marking, gender,
   tense and number
   * some features are only defined for a subset of languages,
     e.g., polarity for Portuguese and Turkish, gender for Arabic and Russian
   * we base the majority of our tasks on the universal grammatical classes
     introduced by UniMorph project (Sylak-Glassman+ 2015)
2. more general syntactic/semantic capability of the model
  such as predicting the number of morphological tags,
  detecting the shared and odd linguistic feature between two word forms
3. pseudowords
  * inspired by cognitive linguistics, we assess the ability of the embedding
  * detect pseudowords, i.e., words that are phonetically OK but lack meaning

## 3.1 Task Definitions [conceptual]

## 3.2 Dataset Creation 13

## 3.3 Type-Level Probing Tasks

* lexicon and the software provided by Wuggy to generate pseudowords
  (Keuleers and Brysbaert 2010; Erten, Bozsahin, and Zeyrek 2014). Finally we
  We follow different procedures to create datasets for each test type. Here,
* we create single form feature tests (e.g., Tense, Case) for token-sentence pairs

### single form feature tests such as Tense, Voice, Mood 14

### paired form feature tests: OddFeat and SameFeat 15

### Character Bin

### pseudoword generation via Wuggy

## 3.4 Token-Level Probing Tasks 16

* Type-level probing [is] compact and less prone to majority and domain shift
  * less realistic, since downstream NLP tasks mostly operate on full-text data
  * limits the evaluation of contextualized word representations and black-box
* token-level probing tasks using the modified Universal Dependency Treebanks
  * MSDs have been converted to the UniMorph schema (McCarthy+ 2018). Contrary
  * not filter out any infrequent or ambiguous surface forms; and we do
  * not introduce a “None" class for convenience.  Since the dataset is
* example ... from the Person-English test-language pair:
  “Looks good", 0, Third person Singular; meaning that
  the word at index 0 in the given sentence (“Looks") has the THIRD PERSON SING

# 4. Evaluation Methodology 18

## 4.2 Multilingual Embeddings 19

## 4.5 Diagnostic evaluation: a case study on SRL 23


# 5. Experiments and Results 24

## 5.2 Results

### 5.2.2 Results on Token-Level Probing Tasks 29


# 6. Analysis 30

* In this section we investigate the
  * relation between downstream and the probing tasks more closely, and report
  * with respect to language families and downstream tasks. We present the
  * show the close connection to highly correlated probing tests
  * summary of our findings related to proposed probing tasks

## 6.1 Correlation 30

## 6.2 Diagnostic Task 35

## 6.3 Summary of Experimental Findings 38


# 7. Conclusion 39

* the [set] of correlated probing tests
  * greater for agglutinative langs, especially for syntactic tasks
  * [depend] on the type of the downstream task, e.g
    * XNLI performance is strongly correlated with the SameFeat probing
    * SRL is correlated well with the Case
    * Case, POS, Person, Tense and TagCount to have significantly high
      correlations for majority of the analyzed languages and tasks; in
    * Possession was found to correlate well in cases when they were applicable
* the proposed probing tests can be used to [understand] how the performance
  on probing tests changes after increasing the model size
  * how?


# 8. Acknowledgements 40
