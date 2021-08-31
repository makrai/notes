Taku Kudo and John Richardson
SentencePiece: A simple and language independent subword tokenizer and detok
EMNLP 2018

available under the Apache 2 license at https://github.com/google/sentencepiece

# Abstract

* designed for Neural-based text processing, including NMT
  open-source C++ and Python implementations for subword units
* While existing subword segmentation tools assume that the input is tokenized
  * SentencePiece can train subword models directly from raw sentences
  * end-to-end and language independent system
* experiment of NMT on English-Japanese machine translation, and find that it
  * comparable accuracy to direct subword training from raw sentences
  * We also compare the performance of subword training and segmentation with
    various configurations

# Introduction

* Deep neural networks are demonstrating a large impact on NLP
  * NMT (Bahdanau+ 2014; Luong+ 2015; Wu+ 2016; Vaswani+ 2017) has had a
    strong influence on other related NLP tasks such as
  * dialog generation (Vinyals and Le, 2015) and
  * automatic summarization (Rush+ 2015)
* many NMT systems are still relying on language-dependent pre~ and postproces-
  [from] traditional statistical machine translation (SMT) systems
  * Moses is built upon hand-crafted and language dependent rules whose
    effectiveness for NMT has not been proven. In addition, these tools are
  * mainly designed for European languages where words are segmented with space
  * for non-segmented languages such as Chinese, Korean and Japanese, we need
    to run word segmenters independently.  Such language-dependent processing
  * hard to train multilingual NMT models (Johnson+ 2016), as
    * we have to carefully manage the configurations of pre~ and postprocessors
      while the internal deep neural architectures are language-independent
* SentencePiece, a simple and language independent text tokenizer and detok
  * size of vocabulary is predetermined prior to the Neural model training
  * two subword segmentation algorithms,
    * byte-pair encoding (BPE) (Sennrich+ 2016) and
    * unigram language model (Kudo, 2018), with the extension of direct training
      from raw sentences.  SentencePiece enables building a purely end-to-end
      system that does not depend on any language-specific processing

# 2 System Overview

* four main components: Normalizer, Trainer, Encoder, and Decoder
  * Normalizer is a module to normalize semantically equivalent Unicode
    characters into canonical forms
  * Trainer trains the subword segmentation model from the normalized corpus
  * Encoder correspond to preprocessing (tokenization)
  * Decoder converts the subword sequence into the normalized text
* Encoder and Decoder manages the vocabulary to id mapping
  * useful for most of NMT systems as their input and output are id sequences

# 3 Library Design

## 3.1 Lossless Tokenization

* The information that no space exists between “world” and “.” is not kept in
  the tokenized sequence.  Detokenization has to be language-dependent
  * e.g. while the detokenizer usually puts whitespaces between the tokens
    in most European languages, no spaces are required in Japanese and Chinese

## 3.4 Customizable character normalization

* e.g. Japanese fullwidth Latin characters can be normalized into ASCII Latin
* Lowercasing is also an effective normalization, depending on the application
* Recently, Unicode standard Normalization Forms, e.g., NFC and NFKC
  * better reproducibility and strong support as Unicode standard

## 3.5 3.5 Self-contained models

* Recently, many researchers have provided pretrained NMT models
  * However, it is not always stated how the data was preprocessed
  * Post, (2018) reported that subtle differences in preprocessing schemes can
    widely change BLEU scores
  * Even using the Moses toolkit, version and command line flags
  * Strictly speaking, NFKC normalization depending on the Unicode version

# 4 Experiments

## 4.1 Comparison of different preprocessing

## 4.2 Segmentation performance

# 5 Conclusions
