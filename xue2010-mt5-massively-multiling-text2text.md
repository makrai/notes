mT5: A massively multilingual pre-trained text-to-text transformer
L Xue, N Constant, A Roberts, M Kale, R Al-Rfou, A Siddhant, A Barua, C Raffel
arXiv:2010.11934 [cs.CL]

* The recent "Text-to-Text Transfer Transformer" (T5) leveraged a unified text2t
  * SOTA results on a wide variety of English-language NLP tasks. In this paper,
* we introduce mT5, a multilingual variant of T5 that was
  * pre-trained on a new Common Crawl-based dataset covering 101 languages. We
  * SOTA performance on many multilingual benchmarks. We also describe
  * a simple technique to prevent "accidental translation" in the zero-shot setn
    * a generative model chooses to (partially) translate its prediction into
      the wrong language. All of the code and model checkpoints used in this

# Introduction

* T5 model (Raffel+ 2020) have been used to achieve SOTA results on many benchms
  (Khashabi+ 2020; Roberts+ 2020; Kale, 2020; Izacard and Grave, 2020;
  Nogueira+ 2020; Narang+ 2020)
* 80% of the world population does not speak English (Crystal, 2008). One way
  * dozens of models, each pre-trained on a single non-English language
    (Carmo+ 2020; de Vries+ 2019; Le+ 2020; Martin+ 2020; Delobelle+ 2020;
    Malmsten+ 2020; Nguyen and Tuan Nguyen, 2020; Polignano+ 2019, etc.). A more
  * multilingual models that have been pre-trained on a mixture of many
    * mBERT (Devlin, 2018), mBART (Liu+ 2020a), and XLM-R (Conneau+ 2020), which
      * multilingual variants of BERT (Devlin+ 2019), BART (Lewis+ 2020b), and
        RoBERTa (Liu+ 2019), respectively
* mT5, a multilingual variant of T5. Our goal with mT5 is to produce a massively
  * deviates as little as possible from the recipe used to create T5. As such,
  * inherits all of the benefits of T5 (described in section 2), such as its
    * general-purpose text-to-text format, its
    * insights from a large-scale empirical study, and its scale. To train mT5,
* we
  * introduce a multilingual variant of the C4 dataset called mC4. mC4
    * 101 languages drawn from the public Common Crawl web scrape. To validate the
  * results on several benchmark datasets, showing SOTA results in many cases
* accidental translation
  * problematic behavior of pre-trained gen multiling LMs in the zero-shot settn
  * they erroneously translate part of their prediction into the wrong language
  * we describe a simple procedure that involves
    mixing in unlabeled pre-training data during fine-tuning and
  * it dramatically alleviates this issue. We release our pre-trained models and

# 2 Background on T5 and C4

# 3 mC4 and mT5

## 3.1 mC4

* The C4 dataset was explicitly designed to be English only:
  any page that was not given a prob >= 99% of being English by langdetect was
* for mC4 we use cld3 3 to identify over 100 languages
* Since some of these languages are relatively scarce on the internet,
  * we use all the 71 monthly web scrapes released so far by Common Crawl. This
  * for C4, April 2019 web scrape alone was enough to provide plenty of
* An important heuristic filtering step in C4 was the removal of lines that did
  not end in an English terminal punctuation mark. Since
  * many languages do not use English terminal punctuation marks,
  * we instead apply a “line length filter” that requires pages to contain at
    least three lines of text with 200 or more characters
* Otherwise, we follow C4’s filtering by
  * deduplicating lines across documents and
  * removing pages containing bad words. 4 Finally, we
  * detect each page’s primary language using cld3 and
    remove those with a confidence below 70%
* include in the corpus all languages with 10,000 or more pages. This produces
  * 107 “languages” as defined by cld3. However, we note that
  * six of these are just script variants of the same spoken language (e.g. ru
    is Russian in Cyrillic script and ru-Latn is Russian in Latin script). A
    histogram of the page counts for each language is shown in fig. 1
  * Detailed dataset statistics including per-language token counts: appendix

## 3.2 mT5

* how to sample data from each language.  Ultimately, this choice is
  * If low-resource languages are sampled too often, the model may overfit;
  * if high-resource langs are not trained on enough, the model will underfit
* We therefore take the approach from (Devlin, 18; Conneau+ 20; Arivazhagan+ 19)
  p(L) ∝ |L|^α , where |L| is the number of examples in the language. The
  * hyperparameter α (typically with α < 1) allows us to control how much to
    * prior work include α = 0.7 for mBERT (Devlin, 2018), α = 0.3 for XLM-R
      (Conneau+ 2020), and α = 0.2 for MMNMT (Arivazhagan+ 2019)
    * We tried all three of these values (ablation results in section 4.2) and
      found α = 0.3 to give a reasonable compromise between performance on
      high~ and low-resource languages
* over 100 languages necessitates a larger vocabulary
  * Following XLM-R (Conneau+ 2018), we increase the vocabulary size to 250,000
  * we use SentencePiece (Kudo and Richardson, 2018; Kudo, 2018) models trained
  * To accommodate languages with large character sets like Chinese, we use a
    character coverage of 0.99999 and enable SentencePiece’s “byte-fallback”
    feature to ensure that any string can be uniquely encoded

## 3.3 Comparison to related massively multilingual pre-trained language models

* we focus on models that support more than a few dozen languages
* Table 1 gives a high-level comparison of mT5 to the most similar models
* XLM (Conneau and Lample, 2019) is also based on BERT but applies improved
  * including explicitly cross-lingual pre-training objectives. Many pre-trained
    was trained on 100 languages from Wikipedia
* XLM-R (Conneau+ 20)
  * pages from Common Crawl were filtered by an n-gram language model trained on
    Wikipedia (Wenzek+ 2020)
* mBART (Liu+ 2020a) is a multilingual encoder-decoder model that is based on
  * trained with a combination of span masking and sentence shuffling objectives
  * subset of 25 languages from the same data as XLM-R
* MARGE (Lewis+ 2020a) is a multilingual encoder-decoder model
  * trained to reconstruct a document in one language by retrieving documents in
    other languages
  * 26 languages from Wikipedia and CC-News (Liu+ 2019)

# 4 Experiments

* 6 tasks from the XTREME multilingual benchmark (Hu+ 2020): the
  * XNLI (Conneau+ 2018) entailment task covering 14 languages; the
  * reading comprehension benchmarks
    * XQuAD (Artetxe+ 2020), 10 languages
    * MLQA (Lewis+ 2019), 7 languages
    * TyDi QA (Clark+ 2020) 11 languages
  * the Named Entity Recognition (NER) dataset of WikiAnn (Pan+ 2017) restricted
    to the 40 languages from XTREME (Hu+ 2020), and the
  * PAWS-X (Yang+ 2019) paraphrase identification dataset with 7 languages. We
* all tasks into the text-to-text format, i.e. generating the
  * label text (XNLI and PAWS-X), entity tags and labels (WikiAnn NER), or
    answer (XQuAD, MLQA, and TyDi QA) directly in a generative fashion. For
  * NER, if there are multiple entities, then they are concatenated in the order
* three variants of these tasks:
  * “zero-shot”, where the model is fine-tuned only on English data,
  * “translate-train”, adding machine translations from English into each target
  * “inlanguage multitask”, training on gold data in all target languages. For
  * refer to Hu+ (2020) for further details on these benchmarks
* five model sizes:
  * Small (≈ 300M params), Base (580M), Large (1.2B), XL (3.7B), and XXL (13B)
  * increase compared to the corresponding T5 model comes from the larger vocab
  * encoder-decoder model, it has roughly twice as many parameters as XLM-R
    * computational cost for text classification is roughly the same: In both
* 1 million steps on batches of 1024 length-1024 input sequences, corresponding
  to roughly 1 trillion input tokens total. This is the same amount of
  pretraining as T5 and about 16 as much as XLM-R
  * inverse square-root learning rate schedule used by T5 during pre-training,
  * not apply dropout during pre-training.  We use the
  * same self-supervised objective as T5, with 15% of tokens masked and an
    average noise span length of 3
  * We ablate some of these experimental details in section 4.2
* For fine-tuning, we use a constant learning rate of 0.001 and dropout rate of
  0.1 for all tasks. We use batch size 2 17 for most tasks but increased this up
  to 2 20 in a few cases based on performance on the validation set. For
  * early stopping, we save checkpoints every 200 steps and choose the
    checkpoint with the highest validation performance

## 4.1 Results

* Table 2 presents our main results
* appendix Table 9: WikiAnn NER F1 score for hu: XLM-R > mT5
* mT5-XXL exceeds SOTA on all classification and QA tasks and is
  near SOTA on NER (69.2 vs. 70.1)
  * InfoXLM (Chi+ 2020) and VECO (Luo+ 2020) benefit from parallel training
  * X-STILTs (Phang+ 2020) leverages labeled data from tasks similar
* scaling up a simple pre-training recipe can be a viable alternative to more
  complex techniques relying on LM filtering, parallel data, or intermediate
  tasks.  In the
* “translate-train” setting, we exceed SOTA on all XTREME classification and QA
  * we fine-tune on the combination of the labeled English data and machine
    translations thereof. 6 This allows direct comparison with both F ILTER
    (Fang+ 2020) as well as the XLM-R baseline of Fang+ (2020). Note that this
    setup differs from XTREME “translate-train” (Hu+ 2020), which excludes
    English.  Figure 2 shows that
* model capacity is key to improving performance on variants of the TyDi QA
  GoldP task in the absence of “gold” multilingual data: For the smallest model,
  training on gold datasets (in-language multitask) achieves dramatically
  better performance than using weakly supervised data (translate-train) or
  English-only data (zero-shot), whereas the gap between these three settings is
  much smaller for the largest model.  For our two largest models, zero-shot and
  translatetrain performance is nearly the same, showing that machine
  translations of the monolingual dataset bring diminishing returns as model
  capacity increases. Overall, these trends point to the possibility of
  avoiding the costly step of annotating data in more than one language when
  using large models
* compared to a similarly-sized “dedicated” monolingual model (Arivazhagan+ 19)
  * we compare the performance of mT5 and T5 when fine-tuned on the SQuAD
    reading comprehension benchmark (Rajpurkar+ 2016). The results are shown in
    table 3, with results for T5 reproduced from Raffel+ (2020).  While the
  * Small and Base mT5 models fall short of their English T5 counterparts, we
  * the larger models close the gap.  This suggests
    * there may be a turning point past which the model has enough capacity to

## 4.2 Ablation

* our Large model as a baseline:
  * increase dropout to 0.1 in hopes of mitigating overfitting on low-resource
  * decrease sequence length to 512 (as was used in T5),
  * increase the average noise span length in the pre-training objective to 10
    since we observe fewer characters per token than T5,
  * adjust the language sampling exponent α to {0.2, 0.7} as used in MMNMT
    (Arivazhagan+ 2019) and mBERT (Devlin, 2018), respectively,
  * turn off the “line length filter” in the mC4 data pipeline, and
  * supplement mC4 with Wikipedia data from 103 languages
* effect of these ablations on XNLI zero-shot accuracy is shown in table 4. In
  each case, the average XNLI score is lower than the mT5-Large baseline,
  justifying our chosen settings. The line length filter provides a +2 point
  boost, corroborating the findings of Conneau+ (2020) and Raffel+ (2020) that
* the language sampling exponent α
  * Increasing to 0.7 has the expected effect of
    improving performance in high-resource languages (e.g. Russian 81.5 → 82.8),
    while hurting low-resource languages (e.g. Swahili 75.4 → 70.6), with the
    average effect being negative. Conversely,
  * lowering α to 0.2 boosts one tail language slightly (Urdu 73.5 → 73.9) but
    is harmful elsewhere. Detailed
  * per-language metrics on XNLI and the results of our ablations on zero-shot
    XQuAD are provided in the appendix, showing similar trends

# 5 Zero-shot generation

* in XQuAD zero-shot, we find that many of the gen errors are due to “accidental
  translation” into the fine-tuning language (English). In this section, we
* it can be counteracted by mixing a small amount of our multilingual
  pre-training task into the fine-tuning stage
* illegal predictions mainly fall into three categories:

## Normalization

* predictions that would be legal, except that
  “equivalent” Unicode characters have been substituted, so
* a legal span may be recovered through Unicode NFKC normalization.  This is
* particularly common in Thai, Chinese and Hindi, where most mT5-XXL illegal
  * fig. 3b

## Grammatical adjustment involves minor morphological changes

* when the target span cannot stand as a well-formed answer on its own. For
* e.g., mT5-XXL’s Arabic and Russian predictions in the middle rows of table 5
  are judged by native speakers as correct and grammatical answers to the posed
  XQuAD questions, while the gold targets are judged as ungrammatical
* most common in languages with extensive grammatical case marking, such as
  Russian, Turkish and German

## Accidental translation

* the model translating part or all of a contextual span into English. On the
  one hand, it is remarkable that mT5 performs “spontaneous” translation despite
* we would ideally be able to control this behavior.  We observe accidental
* across all model sizes and all XQuAD languages. The problem is
* most prevalent in mT5-Small and mT5-Base, where from manual inspection,
  * half or more of the illegal predictions within each language exhibit
  * many of the illegal predictions coming from Greek and Russian, as shown in
* While we do observe full phrase translations, a more common occurrence is
  partial translation, where the model outputs a token or two of English before
  reverting to the correct target language. The
* may even occur mid-word, as in the prediction “chlorопласт”, where the first
  half of the target “хлоропласт” (Russian: chloroplast) has been translated to

## 5.2 Preventing accidental translation

* The most direct solution would be
  * task-specific fine-tuning mechanism that
    restricts the model to perform ranking over legal spans, removing the
* unsatisfying for two reasons
  * not general text-to-text interface, as different tasks would demand differen
  * won’t extend to more “open-ended” zeroshot generative tasks like summ
* we consider a more general solution that remains within the text-to-text
* strategy inspired by domain/task-adaptive pre-training
  (Howard and Ruder, 2018; Gururangan+ 2020): We simply
* mix in our unsupervised multilingual pre-training task during fine-tuning. A
  * similar approach was explored by Liu+ (2020b). We use
  * the same mC4 task definition as in pre-training, with two adjustments:
    * remove all “sentinel” tokens (corresponding to non-masked spans in the
      input text) from the target sequence, as otherwise we observe occasional
      sentinels in downstream predictions.  Second, we
    * reduce the language sampling parameter α from 0.3 to 0.1. This produces a
      * near-uniform distribution of languages,
        encouraging the model to treat all languages as equally likely. 8
  * we mix a small amount of our unsupervised task (covering 101 languages) into
    XQuAD fine-tuning, at a ratio of just 1:100
* Figure 4 shows the results on XQuAD zero-shot error rates. The addition of
  * marked effect on the mT5-Small and mT5-Base models (where accidental
    translation was most rampant), reducing the illegal prediction rates by more
    than 70% (relative), and contributing to an overall reduction in errors
