Cross-Lingual Ability of Multilingual BERT: An Empirical Study
Karthikeyan K, Zihan Wang, Stephen Mayhew, Dan Roth
ICLR 2020

http://cogcomp.org/page/publication_view/900

# Abstract

* multilingual BERT (M-BERT) is trained without any 
  cross-lingual objective and aligned data
* We study the impact of linguistic properties of the languages, the
  architecture of the model, and the learning objectives
* three typologically different languages: Spanish, Hindi, and Russian
* two conceptually different NLP tasks, textual entailment and NER
* conclusion
  * lexical overlap between languages plays a negligible role in the cross-ling
  * depth of the network is an integral part of it

# 1 Intro

* We analyze the two-languages version of M-BERT, bilingual BERT (B-BERT)
  in three orthogonal dimensions:
  * linguistic properties and similarities of target and source languages;
  * network architecture, and
  * input and learning objective
* Fake-English language, that is identical in all aspects to English but shares
  no word-pieces with any target language

# 2 Background

# 3 Why multilingual BERT works

## 3.1 Datasets and experimental setup

### 3.1.2 Cross-lingual named entity recognition (NER)

* dataset (Strassel & Tracey, 2016): news and social media
  * labeled by native speakers following the same guideline in several langs,
    including English, Hindi, Spanish, and Russian
* split
  * 80%, 10%, 10% of English NER data as training, development, and testing. We
  * whole dataset of Hindi, Spanish, and Russian for testing purposes.  The
* vocabulary
  * size is fixed at 60000 and is estimated through the
  * unigram language model in the SentencePiece library (Kudo, 2018)

## 3.2 Linguistic properties 4

### 3.2.1 Word-piece overlap

### 3.2.2 Word-ordering similarity

* Hindi has a Subject-Object-Verb order
* We study the effect of word-ordering similarity by randomly permuting some
  percentage of words in sentences during pre-training

### 3.2.3 WORD-FREQUENCY SIMILARITY

### 3.2.4 3.2.4 STRUCTURAL SIMILARITY

## 3.3 MODEL ARCHITECTURE

## 3.4 INPUT AND LEARNING OBJECTIVE

# 4 DISCUSSION AND FUTURE WORK 9

* finding is that
  * neither word-piece overlap nore multihead attention are significant
  * structural similarity and the depth of B-BERT are crucial for its cross-ling
* B-BERT and M-BERT
  * in order to better control interference among languages, we studied B
  * it would be interesting now to extend this study, allowing more interaction
    * adding to M-BERT languages that are related to the target language helps
* We introduced the term Structural Similarity
  * future work could be to develop a better definition and, consequently, a
    finer set of experiments, to better understand the Structural similarity
* drastic drop in the entailment performance of B-BERT
  when the premise and hypothesis are in different languages
  * (This data was created using XNLI where in the original form the languages
    contain the same premise and hypothesis pair)
  * One of the possible explanations could be that 
    BERT makes textual entailment decisions by matching words or phrases
