Peng Qi, Yuhao Zhang, Yuhui Zhang, Jason Bolton, Christopher D. Manning 
Stanza: A Python Natural Language Processing Toolkit for Many Human Languages
arXiv:2003.07082 [cs.CL]

# 1 Intro

* NLP toolkits
  e.g. CoreNLP (Manning+ 14), Flair (Akbik+ 19), spaCy, and UDPipe (Straka, 18)
* limitations. First, existing toolkits often support
  * only several major languages
  * under-optimized for accuracy, potentially misleading downstream
    applications and insights obtained from them
  * they sometimes assume input text has been tokenized or annotated with other
* We introduce Stanza 2 , a Python natural language processing toolkit
  * From raw text to annotations. Stanza features a fully neural pipeline
  * annotations including tokenization, multi-word token expansion,
    lemmatization, part-of-speech and morphological feature tagging, dependency
    parsing, and named entity recognition
  * Multilinguality. Stanza’s architectural design is language-agnostic
    * models supporting 66 languages, by
      training the pipeline on the UD treebanks and other multilingual corpora
  * SOTA performance
    * We evaluate Stanza on a total of 112 datasets, and find its neural
    * adapt well to text of different genres, achieving SOTA or competitive
      at each step of the pipeline
* interface to the widely used Java CoreNLP software, allowing access to richer
  functionalities such as coreference resolution and relation extraction

# 2 System Design and Architecture

## 2.1 Neural Multilingual NLP Pipeline

* high-level design choices capturing common phenomena in many languages and
  * reuses basic model architectures when possible for compactness
  * Qi+ (2018) for modeling details

### Tokenization and Sentence Split

* modeled as a tagging problem over character sequences, where the model
  * whether a given character is the end of a token/sentence/multiword token

### Multi-word Token Expansion

* MWTs ... expanded into the underlying syntactic words as the basis of downstr
* ensemble of a frequency lexicon and a neural sequence-to-sequence (seq2seq) m

### POS and Morphological Feature Tagging

* bidirectional long short-term memory network (Bi-LSTM) as the basic
  architecture
* For consistency among UPOS, treebank-specific POS (XPOS), and UFeats, we
  * condition XPOS and UFeats prediction on that of UPOS
  * [with] biaffine scoring from Dozat and Manning (2017) to

### Lemmatization

* ensemble of a dictionary-based lemmatizer and a neural seq2seq lemmatizer
* classifier is built on the encoder output of the seq2seq model, to predict
  shortcuts such as lowercasing and identity copy
  for robustness on long input sequences such as URLs

### Dependency Parsing

* Bi-LSTM-based deep biaffine neural dependency parser (Dozat & Manning, 2017)
  augment[ed] with two linguistically motivated features: one that predicts the
  * linearization order of two words in a given language, and the other that
  * typical distance in linear order between them
  * these features significantly improve parsing accuracy (Qi+ 2018)

### Named Entity Recognition

* contextualized string representationbased sequence tagger as in Akbik+ (2018)

## 2.2 CoreNLP Client

* especially for the English language

# System Usage

## 3.1 Neural Pipeline Interface

## 3.2 CoreNLP Client Interface

## 3.3 Interactive Web-based Demo

## 3.4 Training Pipeline Models

# 4 Performance Evaluation

## Datasets

* language families, including
  Indo-European, Afro-Asiatic, Uralic, Turkic, Sino-Tibetan, etc

## Training

* hyper-parameters [tuned] on several large treebanks and applied to all other
  * word2vec embeddings released as part of the 2018 UD Shared Task (Zeman+
    2018), or the
  * fastText embeddings (Bojanowski+ 2017) whenever word2vec is not available
  * For the character-level language models in the NER component, we pretrained
    them on a mix of the Common Crawl and Wikipedia dumps, and
    the news corpora released by the WMT19 Shared Task (Barrault+ 2019), with
    exceptions of English and Chinese, for which we pretrained on the Google
    One Billion Word (Chelba+ 2013) and the Chinese Gigaword corpora 5 ,
    * same hyperparameters to models of all languages

## Universal Dependencies Results

* against UDPipe and spaCy on treebanks of 5 major languages

## NER Results

* against Flair and spaCy
