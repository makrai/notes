Romanization-based Large-scale Adaptation of Multilingual Language Models
Sukannya Purkayastha, Sebastian Ruder, Jonas Pfeiffer, Iryna Gurevych, I Vulić
arXiv:2304.08865 [cs.CL]

# Ruder

* large-scale transliteration to enable multilingual LMs to deal with
  under-represented languages
  * we romanize (ie maps UTF-8 characters to Latin characters) text using
    uroman across 14 diverse languages, which
  * text is then used to adapt multilingual LMs
  * particularly useful on languages with unseen scripts and with limited train

# Abstract

* Large multilingual pretrained LMs (mPLMs) for cross-lingual transfer in NLP
* hE pretraining data scarcity, increase in vocabulary size, and
  limitations in their parameter budget
* we: transliteration on a massive scale
* we explore the UROMAN transliteration tool, which provides
  * mappings from UTF-8 to Latin characters for all the writing systems
  * inexpensive romanization for virtually any language
* we
  * how UROMAN compares against other language-specific and manually curated
    transliterators for adapting multilingual PLMs
  * study and compare a plethora of data-and parameter-efficient strategies for
    adapting the mPLMs to romanized and non-romanized corpora of
    14 diverse low-resource languages
* results reveal that
  UROMAN-based transliteration can offer strong performance for many languages,
  * particular gains achieved in the most challenging setups:
    on languages with unseen scripts and with limited training data
    without any vocabulary augmentation
* Further analyses reveal that
  an improved tokenizer based on romanized data can even outperform
  non-transliteration-based methods in the majority of languages

# 1 Intro

* multiling NLP (XCOPA Ponti+ 2020; XTREME Hu+ 2020; Multi3nlu++ Moghe+ 2022)
* problems
  * vocabulary size, as the vocabulary is bound to increase with the number of
    languages added if per-language performance is to be maintained
    (Hu+ 2020; Artetxe+ 2020; Pfeiffer+ 2022)
  * pretraining mPLMs with a fixed model capacity improves cross-lingual
    performance up to a point after which it starts to decrease
    * the curse of multilinguality (Conneau+ 2020)
* Transliteration: conversion between writing systems (Wellisch+ 1978)
  * Latin script-centered transliteration or romanization is the most common
    (Lin+ 2018; Amrhein and Sennrich, 2020; Demirsahin+ 2022)
    * the Latin/Roman script is by far the most widely adopted writing script
      (Daniels and Bright, 1996; van Esch+ 2022)
* Adapting mPLMs via transliteration can address the two aforementioned issues
  * Since the Latin script covers a dominant portion of the mPLM’s vocabulary
    (eg 77% in case of mBERT, see Ács), ‘romanizing’ the remaining part of the
    vocabulary might mitigate the vocabulary size issue and boost vocab sharing
  * Since no new tokens are added during the romanization process,
    reusing pretrained embeddings from the mPLM’s embedding matrix helps
    reuse the information already present within the mPLM, thereby
    allocating the model’s parameter budget more efficiently
* main drawback of transliteration: the expensive process of creating effective
  language-specific transliterators, as they
  * typically require language expertise to curate dictionaries
    that map tokens from one language and script to another
  * previous attempts at mPLM adaptation to unseen languages via transliterat
    (Muller+ 2021; Chau and Smith, 2021; Dhamecha+ 2021; Moosa+ 2022) were
    * constrained to a handful of languages due to the limited availability
    * only to languages that have ‘language siblings’ with developed translit
* we use and then evaluate the usefulness of a universal romanization tool,
  UROMAN (Hermjakob+ 2018), for quick, large-scale and effective adaptation of
  mPLMs to low-resource languages
  * no language-specific curated dictionaries and
  * maps any UTF-8 character to the Latin script, increasing the portability of
    romanization, with some examples in Figure 1
* We analyze language adaptation on a massive scale via UROMAN-based
  romanization on a set of 14 diverse low-resource languages
  * experiments within the standard parameter-efficient adapter-based
    cross-lingual transfer setup on two tasks:
  * NER on the WikiANN dataset (Pan+ 2017; Rahimi+ 2019), and
  * Dependency Parsing (DP) with Universal Dependencies v2.7 (Nivre+ 2020)
* results on par or even outperforming adaptation with language-spec translit
  * gains particularly pronounced for languages with unseen scripts
    (∼8-22 performance points) without any vocabulary augmentation

# 2 Background

## Why UROMAN-Based Romanization?

* idea, as hinted in §1, is to (learn to) map any UTF-8 character to the Latin
  * without the use of any external language-specific dictionaries
  * see Hermjakob+ (2018) for technical details

## Cross-Lingual Transfer to Low-Resource Languages

* Parameter-efficient and modular finetuning methods (Pfeiffer+ 2023)
  * eg adapters (Houlsby+ 2019; Pfeiffer+ 2020b)
  * used for cross-lingual transfer
  * focus on low-resource languages and scenarios, including languages with
    scripts ‘unseen’ by the base mPLM (Pfeiffer+ 2021)
  * Adapters are small light-weight components stitched into the base mPLM, and
    then trained for particular languages and tasks while
    keeping the parameters of the original mPLM frozen
  * circumvents catastrophic forgetting and interference (McCloskey and Cohen,
    1989) within the mPLM
  * extending its reach also to unseen languages (Pfeiffer+ 2021; Ansell+ 2021)
* For our main empirical analyses, we adopt a SOTA modular method for
  cross-lingual transfer: MAD-X (Pfeiffer+ 2020b)
  * MAD-X is based on language adapters (LA), task adapters (TA), and
    invertible adapters (INV)
  * LAs are trained for specific languages relying on masked language modeling,
  * TAs are trained with high-resource languages relying on task-annotated data
    and task-specific objectives
  * At inference, the source LA is replaced with the target LA
    while the TA is kept
  * INV (Pfeiffer+ 2020b)
    * In order to do
      * parameter-efficient learning for the token-level embeddings across
        different languages and to
      * deal with the vocabulary mismatch between source and target languages,
    * INV adapters are placed on top of the embedding layer and
      their inverses precede the output embedding layer
  * We adopt the better-performing MAD-X 2.0 setup (Pfeiffer+ 2021) where
    * the adapters in the last Transformer layer are dropped at inference

# 3 Experiments and Results

## 3.2 Results and Discussion

### UROMAN versus Other Transliterators and Transliteration Strategies

* transliteration options using the TransLA + INV setup as the most efficient
  scenario. First, we compare UROMAN with
  * language-specific transliterators available for selected languages: amseg
    (Yimam+ 2021) for Amharic, ai4bharat-transliteration (Madhani+ 2022) for
    Hindi and Sindhi, lang-trans for Arabic, and transliterate for Russian and
    Georgian.7 The results are provided in Table 1
  * On average, UROMAN performs better or comparable to the languagespecific
* compared to two other transliteration strategies
  * BORROW refers to borrowing transliterators from languages within the same
    language family and written in the same script.8 Since building
  * RAND refers to a random setting where we associate any non-ASCII character
* The results are provided in Table 2
  * UROMAN is largely and consistently outperforming both BORROW and RAND,
    * single exception is BORROW from Hindi to Bhojpuri. Surprisingly,
  * RAND also yields reasonable performance and
    * on average even outperforms the Non-TransLA+INV variant with
      non-transliterated data (21.59 vs 18.39 in Table 3 later). This provides

### Performance on Low-Resource Languages is summarized in Table 3 and Table 4

* TransLA+INV outperforms Non-TransLA+INV for all the langs with unseen scripts
  * with huge margins (∼ 8-22 points for NER and ∼ 17 points in UAS scores). We
  * similar trends for some of the languages with seen scripts such as
    Min Dong (cdo), Sindhi (sd), Mingrelian (xmf) on NER tasks and
    Erzya (myv) on DP
* The less efficient TransLA+mPLMft , as expected, further improves the
  performance for all the languages except for Tibetan (bo).9
  * For Tibetan, longer words are composed using shorter words separated by
    tsek (“.”) which is not a valid space delimiter for the mBERT tokenizer;
    the number of produced subwords is thus much higher than for the other
    languages
* Non-TransLA+EmbLex outperforms UROMAN-based methods for most languages. This
  * can be attributed to various factors related to mBERT’s tokenizer, App E
  * strong and competitive performance of TransLA + mPLMft in both tasks, again

### Sample Efficiency. We simulate a few-shot setup

* to study translit in data-scarce scenarios
* NER: we evaluate performance on all the languages and on languages with
  unseen scripts
* DP, we evaluate on all the languages
* Figure 2:
  * sample sizes 100 (ie 100 sentences in the target language) and 1, 000
    * TransLA+INV on average performs better than all the other methods
  * from 10, 000 sentences onward, Non-TransLA+EmbLex takes the lead. We
  * similar trends in the DP task (see Appendix D). This establishes the
  * ie utility of transliteration for (extremely) low-resource scenarios

# Limit

* UROMAN (Hermjakob+ 2018) which is an unsupervised romanization tool.  While
  * effective tool for romanization at scale, it still has potential drawbacks
  * hE only based on lexical substitution, its transliterations may not
    semantically or phonetically align with the source content and may dif-
  * not invertible—as we have highlighted—and may thus be less appealing when
  * Our proposed method still underperforms language-specific tokenizer-based
    non-transliteration methods
* Future work may focus on developing an improved and more efficient tokenizer
  for transliteration-based methods as we highlight in the Appendix

# App E Further Analyses

* analyze tokenization quality of the mBERT tokenizer
  (Ács; Rust+ 2021; Moosa+ 2022)
  * metrics:
    * % of “UNK”s measures the % of “UNK” tokens produced by the tokenizer,
      * we compare their rate before and after transliteration;
    * fertility measures the number of subwords that are produced per word;
    * proportion of continued subwords
      * the proportion of words for which the tokenized word is split to >=2
        subwords (denoted by the symbol ##)
* results summarized in Figure 4
  * transliteration drastically reduces % of UNKs
  * mBERT’s tokenizer underperforms as compared to monolingual tokenizers based
    on fertility and the proportion of continued subwords (Rust+ 2021)
  * Transliteration performs better for some languages
    where the quality of the mBERT tokenizer is similar to the monolingual
    * eg dv, km, and cdo
  * transliteration methods perform worse on languages
    where the quality of the underlying mBERT tokenizer is relatively poor
* is the tokenizer quality the principal reason for the performance gap for the
  transliteration-based methods in comparison to the non-transliteration based?
  * experiment: we adapt the Non-TransLA+EmbLex to operate on transliterated
  * we call this variant TransLA+EmbLex
  * we train a new tokenizer on the transliterated data
  * initialize lexically overlapping embeddings with mBERT’s pretrained embeds
* fig 5 plots the performance
  * TransLA+EmbLex now outperforms the nontransliteration-based variant
    on 8/12 languages and also on average
  * this validates our hypothesis and is in line with the prev work (Moosa+ 22)
  * hE drop in performance in the case of mhr (-10.71) and cdo (-10.14)
    when compared to TransLA + mPLMft
    * may be attributed to the
      lower degree of lexical overlap with mBERT’s vocabulary, and consequently
      a higher number of randomly initialized embeddings for those languages
