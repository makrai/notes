Beto, Bentz, Becas: The Surprising Cross-Lingual Effectiveness of BERT
Shijie Wu, Mark Dredze
EMNLP 2019 arXiv:1904.09077 [cs.CL]

# Abstract

* mBERT (Devlin, 2018) includes a model simultaneously pretrained on 104 langs
  * impressive performance for zero-shot cross-lingual transfer on a NLI
* This paper explores mBERT as a zero shot language transfer model on 5 tasks
  * 39 languages from various language families:
  * NLI, document classification, NER, POS tagging, and dependency parsing
  * compare mBERT with the best-published methods for zero-shot cross-lingual
    * mBERT competitive on each task
  * investigate the most effective strategy for utilizing mBERT in this manner,
  * to what extent mBERT generalizes away from language specific features, and
  * measure factors that influence cross-lingual transfer

# Intro

* competitive or even SOTA performance with the recommended _fine-tune all
  parameters_ scheme (Devlin+ 2019)
* we explore different fine-tuning and feature extraction schemes and
  * with parameter freezing, we further outperform the suggested fine-tune all
    approach. Furthermore, we explore the extent to which mBERT generalizes
  * accuracy on language ID using each layer of mBERT
  * how subword tokenization influences transfer by measuring subword overlap

# 5 Experiments 4

* We use the base cased multilingual BERT, which has N = 12 attention heads and
  M = 12 transformer blocks. The dropout probability is 0.1 and d h is 768. The
* 179M parameters with about 120k vocabulary

## Training

## Maximum Subwords Sequence Length

## Hyperparameter Search and Model Selection

* Note the best hyperparameters and model are selected by development
  performance in English

## 5.1 Question #1: Is mBERT Multilingual?

### Summary Across all five tasks, mBERT demonstrate strong (sometimes SOTA)

* outperforms cross-lingual embeddings in four tasks

## 5.2 Question #2: Does mBERT vary layer-wise?

* goal of a deep neural network is to abstract to higher-order (Yosinski+ 2014)
* Peters+ (2018) empirically show that for ELMo in English
  the lower/upper layer is better at syntax/semantics
* We consider two schemes. First, we follow the
  * feature-based approach of ELMo by taking a learned weighted combination of
    all 13 layers of mBERT with a two-layer bidirectional LSTM with d h hidden
    size (Feat). Note the LSTM is trained from scratch and mBERT is fixed
  * fine-tuning mBERT, we fix the bottom n layers (n included) of mBERT,
    * where layer 0 is the input embedding. We consider n ∈ {0, 3, 6, 9}
* Freezing the bottom layers of mBERT,
  in general, improves the performance in all five tasks (Fig. 1)
  * sentence-level tasks like document classification and natural language
    inference, we observe the largest improvement with n = 6.  For
  * word-level tasks like NER, POS tagging, and parsing, we observe the largest
    improvement with n = 3
  * More improvement in under-performing languages is observed
* feature-based approach with LSTM under-performs fine-tuning approach
  * We hypothesize that initialization from pretraining with lots of languages
    provides a very good starting point that is hard to beat
  * the LSTM could also be part of the problem
  * Ahmad+ (2019): an LSTM encoder for dependency parsing

## 5.3 Question #3: Does mBERT retain language specific information?

* All tested layers achieved around 96% accuracy (Fig. 2), with
  * no clear difference between layers.  This suggests each layer contains
* This may be encouraged during pretraining [with] the cloze task

## 5.4 Question #4: Does mBERT benefit by sharing subwords across languages?

* representation of a shared subword
  * explicitly trained to contain enough information for the cloze task in all
    languages in which it appears.  During fine-tuning for zero-shot
  * could overfit to the source language and potentially hurt transfer
* In four out of five tasks (not XNLI) we observed a strong positive corr
  * In Indo-European languages, we observed
    * subwords shared across languages are usually high freq
    * p_token is usually around 50% to 75% while p_type is less than 50%

# 6 Discussion

* mBERT outperforms crosslingual embeddings, which have more cross-ling supervs
* Language-specific information is preserved in all layers
* Sharing subwords helps cross-lingual transfer
  * strong correlation is observed
* XNLI
  * a variant of mBERT pretrained with bitext (Lample and Conneau, 2019) shows
    even stronger performance
  * Future work could investigate how to use
    * weak supervision to produce a better cross-lingual mBERT, or
    * adapt an already trained model for cross-lingual use
* With POS tagging in §5.1, we show mBERT, in general, under-performs models
  with a small amount of supervision
  while Devlin+ (2019) show that in English NLP tasks, fine-tuning BERT only
  needs a small amount of data
* Future work could investigate
  * when cross-lingual transfer is helpful in NLP tasks of low resource langs
  * prob mBERT from a linguistic perspective in
