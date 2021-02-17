mBART: Multilingual Denoising Pre-training for Neural Machine Translation
Yinhan Liu, Jiatao Gu, N Goyal, X Li, Edunov, Ghazvininejad, Lewis, Zettlemoyer
arXiv:2001.08210 [cs.CL]
Comments: 	Work in progress

# Abstract

* we: multilingual denoising pre-training produces significant performance gains
  across a wide variety of MT tasks
  * mBART -a sequence-to-sequence denoising auto-encoder pre-trained on
    large-scale monolingual corpora in many languages using the BART objective
  * one of the first methods for pre-training a complete sequence-to-sequence
    model by denoising full texts in multiple languages, while
    * previous approaches have focused only on the encoder, decoder, or
      reconstructing parts of the text
  * can be directly fine tuned for supervised (both sentence-level and
    document-level) and unsupervised machine translation, with no task-specific
    modifications
* mBART initialization produces performance gains in all but the
  highest-resource settings, including up to 12 BLEU points for low resource MT
  and over 5 BLEU points for many document-level and unsupervised models
* transfer to language pairs with no bi-text or that were
  not in the pre-training corpus, and present
* extensive analysis of which factors contribute the most to effective pre-train

# 1 Introduction

* self-supervised pretraining is not yet common practice in machine translation
  * Existing MT approaches only pre-train parts of the model, including the
    encoder (Lample and Conneau, 2019) and the decoder (Edunov+ 2019), or use
    pretraining objectives that only reconstruct parts of text (Song+ 2019), or
    only focus on English corpora (Lewis+ 2019; Raffel+ 2019). In this paper, 
* we: by pre-training a complete autoregressive model with an objective that
  noises and reconstructs full texts across many languages.
  * mBART – a multilingual sequence-to-sequence (Seq2Seq) denoising auto-encoder
    * applying the BART (Lewis+ 2019) to large-scale monolingual corpora across
      many languages.  The input texts are noised by masking phrases and
      permuting sentences, and a single Transformer (Vaswani+ 2017) model is
      learned to recover the texts.  
    * trained once for all languages, providing a set of parameters that can be
      fine-tuned for any of the language pairs in both supervised and
      unsupervised settings, without any task-specific or language-specific
      modifications or initialization schemes.  
* experiments demonstrate that this simple approach works remarkably well. We
  * supervised sentence-level MT, mBART initialization leads to significant
    gains (up to 12 BLEU points) across low/medium-resource pairs (<10M bi-text
    pairs), without sacrificing performance in high-resource settings.
    * further improve with backtranslation (BT), setting a new SOTA on WMT16
      English-Romanian and the FloRes test sets. For 
  * document-level MT, our document-level pre-training improves results by up to
    5.5. For the 
  * unsupervised case, we see consistent gains and produce the 
    first non-degenerate results for less related language pairs (e.g., 9.5 BLEU
    gain on Nepali-English). 
  * Previous pre-training schemes have only considered subsets of these tasks,
    but we compare performance where possible and demonstrate that mBART
    consistently performs the best. We also show that mBART enables 
* new types of transfer across language pairs.  For example, 
  * fine-tuning on bi-text in one language pair (e.g., Korean-English) creates a
    model that can translate from all other languages in the monolingual
    pre-training set (e.g., Italian-English), with no further training. We also
  * languages not in pre-training corpora can benefit from mBART, strongly
    suggesting that the initialization is at least partially language universal.
* detailed analysis of which factors contribute the most to effective pre-train,
  * number of languages and their overall similarity.

# 2 Multilingual Denoising Pre-training

# 3 Sentence-level Machine Translation

## 3.3 Analysis

### How many languages should you pre-train on?

### How many pre-training steps are needed? We

### How does the size of bitexts inference the gain
from pre-training? Tables 2 and 3 show that

### Is pre-training complementary to BT? Fig-

## 3.4 Generalization to Languages NOT in Pre-training

# 4 Document-level Machine Translation

# 5 Unsupervised Machine Translation

* three types of unsupervised translation:
  1. No bi-text of any kind is given. A common solution is to learn from
     back-translation (BT; Artetxe+ 2017; Lample+ 2018c). We show that 
     * mBART provides a simple and effective initialize scheme for these methods
  2. No bi-text for the pair is available, but the languages both appear in
     bi-text corpora for other language pairs. 
    * Previous work has shown that zero-shot transfer is possible via 
      * massively multi-lingual MT (Johnson+ 2017; Gu+ 2019) or 
      * distillation through pivoting (Chen+ 2017). 
      * We limit our focus to building MT models for single language pairs, and
        leave multi-lingual pre-training for multi-lingual MT to future work.
  3. No bi-text for the pair is available, but 
    there is bi-text for translating from some other language into the target
    * a new evaluation regime, where we will show that 
      mBART supports effective transfer, 
      even if the source language has no bi-text of any form.  
* we focus on applications to the first and the third kinds

## 5.1 back-translation ( §5.1) and 

## 5.2 (3) language transfer (§5.2). An illustration of both approaches are

### When is language transfer useful? Table 11

# Related Work

## Pre-training for Text Generation 

* selfsupervised pre-training for NLP applications (Pe-ters+ 2018; Radford+
  2018; Devlin+ 2019; Yang+ 2019; Liu+ 2019), especially 
  * for text generation tasks (Radford+ 2019; Song+ 2019; Dong+ 2019; Raffel+
    2019; Lewis+ 2019) where different self-supervised objectives are designed
* fine-tuning varous downstream tasks such as 
  * controllable language modeling (Shirish Keskar+ 2019), 
  * machine translation (Song+ 2019), 
  * summarization (Liu and Lapata, 2019) and 
  * dialogue generation (Zhang+ 2019).  In contrast to most prior work, we focus

## Multilinguality in NLP tasks 

* multilingual language learning, including 
  * aligning multilingual word embeddings (Mikolov+ 2013; Chen and Cardie, 2018;
    Lample+ 2018b) into universal space, and learning 
  * cross-lingual models (Wada and Iwata, 2018; Lample and Conneau, 2019;
    Conneau+ 2019) to exploit shared representations across languages.  
* multilingual translation (Firat+ 2016; Viégas+ 2016; Aharoni+ 2019;
  Arivazhagan+ 2019) where the ultimate goal is to 
  * jointly train one translation model that translates multiple language
    directions at the same time, and shares representations to improve the
    translation performance on low-resource languages (Gu+ 2018). In this paper,
  * we focus on multilingualism in the pre-training stage and 
    fine-tune the learned model in the standard bi-lingual scenario.
  * interference problems between dissimilar languages is typical for regular
    multilingual translation models.

## Document Translation 

* incorporating document-level contexts into neural machine translation (Wang+
  2017; Jean+ 2017; Tiedemann and Scherrer, 2017; Miculicich+ 2018; Tu+ 2018).
* Li+ (2019) utilized pre-trained encoder (BERT) for handling longer context.
* no positive results on pure Seq2Seq models at document-level, which involved
  task-specific techniques, and usually only worked on sentence-level
  translation with a constrained range of context. To the extent of our
* our multilingual pre-trained model is the first-of-its-kind work that shows
  improved results on document-level translation with standard Seq2Seq learning

## Unsupervised Translation 

* When no parallel corpus of any kind is available, 
  * Artetxe+ (2017); Lample+ (2018a,c) proposed to jointly learn denoising
    auto-encoder and back-translation from both directions, which, however,
    required good initial- ization and only worked well on similar language
    pairs; 
    * Similarly, we follow this approach and treat our pretrained model as the
      initialization step
  * Wu+ (2019a) replaced back-translation with retrieved similar sentences from
    target monolingual data; 
  * Wu+ (2019b) solves the problem by mining sentences from Wikipedia and use
    them as weakly supervised translation pairs. 
* unsupervised translation using language transfer, which is similar to
  * Pourdamghani+ (2019) generate translationese of the source language and
    train a system on high-resource languages to correct these intermediate
    utterances. It is also closely related to 
  * Conneau+ (2018); Artetxe+ (2019): cross-lingual representation learning.

# 7 Conclusion 

* future work, we will scale-up the current pre-training to 
  * more languages, e.g., an mBART100 model. The 
  * more size-efficient models: size of our model makes it expensive to deploy
    in production