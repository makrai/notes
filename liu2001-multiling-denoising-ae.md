mBART: Multilingual Denoising Pre-training for Neural Machine Translation
Yinhan Liu, Jiatao Gu, N Goyal, X Li, Edunov, Ghazvininejad, Lewis, Zettlemoyer
arXiv:2001.08210 [cs.CL]

# Abstract

* multilingual denoising pre-training produces significant performance gains
  across a wide variety of MT tasks
* mBART, a sequence-to-sequence denoising auto-encoder 
  pre-trained on large-scale monolingual corpora in many languages 
  using the BART objective
* one of the first methods for pre-training a complete sequence-to-seq model 
  by denoising full texts in multiple languages
  * previous approaches have focused only on the encoder, decoder, or
    reconstructing parts of the text
* can be directly fine tuned for MT
  * both supervised (both sentence-level and document-level) and unsupervised
  * without task-specific modifications
* mBART initialization produces performance gains in all but the
  highest-resource settings, including 
  up to 12 BLEU points for low resource MT
  and over 5 BLEU points for many document-level and unsupervised models
* transfer to language pairs with no bi-text or that were
  not in the pre-training corpus
* extensive analysis of which factors contribute the most to effective pre-train

# 1 Introduction

* self-supervised pretraining is not yet common practice in machine translation
  * Existing MT approaches only 
    * pre-train parts of the model, including 
      the encoder (Lample and Conneau, 2019) and the decoder (Edunov+ 2019), or
    * use pretraining objectives that only 
      * reconstruct parts of text (Song+ 2019), or only 
      * focus on English corpora (Lewis+ 2019; Raffel+ 2019)
* we: by pre-training a complete autoregressive model
  * objective that noises and reconstructs full texts across many languages
  * mBART – a multilingual sequence-to-sequence (Seq2Seq) denoising auto-encoder
    * applying the BART (Lewis+ 2019) to large-scale monolingual corpora 
      across many languages
    * texts are noised by masking phrases and permuting sentences, and
      a single Transformer (Vaswani+ 2017) model is learned to recover the texts
    * trained once for all languages, providing a set of parameters that 
      can be fine-tuned for any of the language pairs in both supervised and
      unsupervised settings, without any task-specific or language-specific
      modifications or initialization schemes
* experiments demonstrate that this simple approach works remarkably well
  * supervised sentence-level MT
    * mBART initialization leads to significant gains (up to 12 BLEU points)
      across low/medium-resource pairs (<10M bi-text pairs), 
      without sacrificing performance in high-resource settings
    * further improve with backtranslation (BT), setting a 
      new SOTA on WMT16 English-Romanian and the FloRes test sets
  * document-level MT, our 
    document-level pre-training improves results by up to 5.5
  * unsupervised case, we see consistent gains and produce the
    first non-degenerate results for less related language pairs
    (e.g., 9.5 BLEU gain on Nepali-English)
  * Previous pre-training schemes have only considered subsets of these tasks,
    but we compare performance where possible and demonstrate that mBART
    consistently performs the best
* new types of transfer across language pairs
  * fine-tuning on bi-text in one language pair (e.g., Korean-English) creates a
    model that can translate from all other languages in the monolingual
    pre-training set (e.g., Italian-English), with no further training
  * languages not in pre-training corpora can benefit from mBART, strongly
    suggesting that the initialization is at least partially language universal
* detailed analysis of which factors contribute the most to effective pre-traing
  * number of languages and their overall similarity

# 2 Multilingual Denoising Pre-training

## 2.1 Data: CC25 corpus

### Datasets

* We pre-train on a subset of 25 languages – CC25 – extracted from CC
  (Wenzek+ 2019; Conneau+ 2019)
  * CC25 includes languages from different families and with varied amounts of
    text (Table 1).  Following Lample and Conneau (2019), we rebalanced the
    corpus by up/down-sampling text from each language i with a ratio p_i^0.7,,,
    where p i is the percentage of each language in CC25

## 2.2 Model: mBART

## 2.3 Pre-trained Models

* different levels of multilinguality during pre-training, we built a range of
* mBART25 We pre-train a model on all 25 languages, using the setting
  described in §2.2.
* mBART06: related languages, Ro, It, Cs, Fr, Es and En. 
  * For a fair comparison, we use ∼ 1/4 of the mBART25 batch size, which allows
    our model to have the same number of updates per language during pre-trainin
* mBART02: bilingual models, using English and one other language for 
  * four language pairs: En-De, En-Ro, En-It
  * batch size of ∼ 1/12 of that in the mBART25.
* BART-En/Ro: baseline performance levels, we also train monolingual BART models
  on the same En and Ro corpus only.
* Random: model randomly inited without pre-training for each translation task.
  Since the sizes of different downstream datasets vary, 
  we always grid-search the hyper-parameters (architecture, dropout, etc.) to
  find the best non-pretrained configuration.  
* All models use the same vocabulary (§2.1).  Not all tokens will frequently
  occur in all pre-training corpora, but later experiments show that this large
  vocabulary can improve generalization in multilingual settings even for unseen
  languages.

# 3 Sentence-level Machine Translation

## 3.3 Analysis

### How many languages should you pre-train on?

* when is it helpful for pre-training to include languages other than the tg par
* helps most when the target language monolingual data is limited
  (e.g.  En-My (Burmese), the size of My is around 0.5% of En)
  * when monolingual data is plentiful (De, Ro), it slightly hurts
    * may reduce the capacity available for each test language
* pre-training with similar languages is particularly helpful
  * the fact that mBART06 performs similar to mBART02 on Ro-En suggests

### How many pre-training steps are needed?

### How does the size of bitexts inference the gain from pre-training? 

* Tables 2 and 3

### Is pre-training complementary to BT?

## 3.4 Generalization to Languages NOT in Pre-training

# 4 Document-level Machine Translation

# 5 Unsupervised Machine Translation

* three types of unsupervised translation:
  1. No bi-text of any kind is given. A common solution is to learn from
     back-translation (BT; Artetxe+ 2017; Lample+ 2018c)
     * mBART provides a simple and effective initialize scheme for these methods
  2. No bi-text for the pair is available, but the languages both appear in
     bi-text corpora for other language pairs
    * Previous work has shown that zero-shot transfer is possible via
      * massively multi-lingual MT (Johnson+ 2017; Gu+ 2019) or
      * distillation through pivoting (Chen+ 2017)
      * We limit our focus to building MT models for single language pairs, and
        leave multi-lingual pre-training for multi-lingual MT to future work
  3. No bi-text for the pair is available, but 
     there is bi-text for translating from some other language into the target
    * a new evaluation regime, where we will show that
      mBART supports effective transfer,
      even if the source language has no bi-text of any form
* we focus on applications to the first and the third kinds

## 5.1 back-translation

## 5.2 language transfer

### When is language transfer useful? Table 11 on page 10

# 6 Related Work

## Pre-training for Text Generation

* self-supervised pre-training for NLP applications
  (Peters+ 2018; Radford+ 2018; Devlin+ 2019; Yang+ 2019; Liu+ 2019)
  * for text generation tasks (Radford+ 2019; Song+ 2019; Dong+ 2019; Raffel+
    2019; Lewis+ 2019) where different self-supervised objectives are designed
* fine-tuning varous downstream tasks such as
  * controllable language modeling (Shirish Keskar+ 2019),
  * machine translation (Song+ 2019),
  * summarization (Liu and Lapata, 2019) and
  * dialogue generation (Zhang+ 2019)

## Multilinguality in NLP tasks

* multilingual language learning, including
  * aligning multilingual word embeddings (Mikolov+ 2013; Chen and Cardie, 2018;
    Lample+ 2018b) into universal space
  * cross-lingual models (Wada and Iwata, 2018; Lample and Conneau, 2019;
    Conneau+ 2019) to exploit shared representations across languages
* multilingual translation
  (Firat+ 2016; Viégas+ 2016; Aharoni+ 2019; Arivazhagan+ 2019)
  * jointly train one translation model that 
    translates multiple language directions at the same time, and 
    shares representations to improve the translation performance on
    low-resource languages (Gu+ 2018)
  * we focus on multilingualism in the pre-training stage and
    fine-tune the learned model in the standard bi-lingual scenario
  * interference problems between dissimilar languages is typical for regular
    multilingual translation models

## Document Translation

* incorporating document-level contexts into neural machine translation
  (Wang+ 17; Jean+ 17; Tiedemann and Scherrer, 17; Miculicich+ 18; Tu+ 18)
* Li+ (2019) utilized pre-trained encoder (BERT) for handling longer context
* no positive results on pure Seq2Seq models at document-level, which involved
  task-specific techniques, and usually only worked on sentence-level
  translation with a constrained range of context
* our multilingual pre-trained model is the first-of-its-kind work that shows
  improved results on document-level translation with standard Seq2Seq learning

## Unsupervised Translation

* When no parallel corpus of any kind is available,
  * Artetxe+ (2017); Lample+ (2018a,c) proposed to jointly learn 
    denoising auto-encoder and back-translation from both directions, which,
    hE, required good initialization and only worked well on similar lang pairs;
    * Similarly, we follow this approach and treat 
      our pretrained model as the initialization step
  * Wu+ (2019a) replaced back-translation with retrieved similar sentences from
    target monolingual data;
  * Wu+ (2019b) solves the problem by mining sentences from Wikipedia and use
    them as weakly supervised translation pairs
* unsupervised translation using language transfer is similar to
  * Pourdamghani+ (2019) generate translationese of the source language and
    train a system on high-resource languages to correct these intermediate
    utterances
  * Conneau+ (2018); Artetxe+ (2019): cross-lingual representation learning

## 2.1 Data: CC25 corpus

# 7 Conclusion

* future work, we will scale-up the current pre-training to
  * more languages, e.g., an mBART100 model
  * more size-efficient models
    the size of our model makes it expensive to deploy in production
