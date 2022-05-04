From Zero to Hero:
  On the Limitations of Zero-Shot Cross-Lin Transfer with Multiling Transformers
Anne Lauscher, Vinit Ravishankar, Ivan Vulić, Goran Glavaš
arXiv:2005.00633 [cs.CL]

# Abstract

* Massively multilingual transformers pretrained with language modeling
  objectives (e.g., mBERT, XLM-R) have become a de facto default
  transfer paradigm for zero-shot cross-lingual transfer in NLP, offering
* Current downstream evaluations, however, verify their efficacy predominantly
  in transfer settings involving languages with sufficient amounts of
  pretraining data, and with lexically and typologically close languages. In
* we analyze their limitations and show that
  * cross-lingual transfer via massively multilingual transformers, much like
    transfer via cross-lingual word embeddings, is substantially less effective
    in resource-lean scenarios and for distant languages. Our
* experiments, encompassing
  * tasks
    * three lower-level tasks (POS tagging, dependency parsing, NER), as well as
    * two high-level semantic tasks (NLI, QA), empirically
  * correlate transfer performance with
    * linguistic similarity between src & tgt (Littell+ 2017)
    * size of pretraining corpora of target languages. We also demonstrate a
* surprising effectiveness of inexpensive few-shot transfer
  (i.e., fine-tuning on a few target-language instances
  after fine-tuning in the source) across the board.  This suggests that

# 1 Intro

* data typically exist only for English and a handful of resource-rich languages
  (Bender, 2011; Ponti+ 2019; Joshi+ 2020). The data scarcity issue renders the
* Recent work has placed much emphasis on the zero-shot scenario exactly
  * in theory, it offers the widest portability across the > 7,000 languages
    (Pires+ 2019; Artetxe+ 2019; Lin+ 2019; Cao+ 2020; Hu+ 2020)
    * Yu-Hsiang Lin, Chian-Yu Chen, Jean Lee, Zirui Li, Yuyan Zhang, ..
        Xuezhe Ma, Antonios Anastasopoulos, Patrick Littell, Graham Neubig
      Choosing transfer languages for cross-lingual learning. In Proceedings of
      ACL 2019
* massively multilingual transformer models pretrained on multilingual corpora
  using LM objectives (Devlin+ 2019; Conneau and Lample, 2019; Conneau+ 2020)
  * de facto become the default paradigm for cross-lingual transfer, with a
    unparalleled cross-lingual transfer performance
    (Pires+ 19; Wu and Dredze, 19; Rönnqvist+ 19; Karthikeyan+ 20; Wu+ 20)
* we analyze a variety of conditions and underlying factors in
  cross-lingual transfer via massively multilingual transformer models. We aim
* Q1 the role of language (dis)similarity and language-specific corpora size
  * Current work is still primarily focused on transfer to languages either
  * typologically or etymologically close to English
    (e.g., German, Scandinavian languages, French, Spanish)
  * with large monolingual corpora, well-represented in the pretraining corp
    (e.g., Arabic, Hindi, Chinese)
  * Wu+ (2020) suggest that pretrained transformers, much like static embeds,
    easily (linearly) alignable between languages
    * Wu+ limit their study to major languages: Chinese, Russian, and French
    * hE, language transfer with static cross-lingual word embeddings are
      ineffective when involving
      dissimilar languages (Søgaard+ 2018; Vulić+ 2019) or
      languages with small corpora (Vulić+ 2020)
  * We demonstrate that, similar to prior research in cross-lingual embeds,
      transfer performance crucially depends on these two factors
* Q2 the role of a particular task in consideration for transfer performance?
  * all our analyses across five different tasks, which we roughly divide into
    * “lower-level” tasks (POS-tagging, dependency parsing, and NER); and (2)
    * “higher-level” language understanding tasks (NLI and QA). We show that
  * transfer performance in both zero-shot and fewshot scenarios largely depends
    on the “task level”
* Q3 Can we even predict transfer performance?
  * a simple regression model on available transfer results, we show that
  * performance can (roughly) be predicted from the two crucial factors:
    * linguistic (dis)similarity (Littell+ 2017) is a strong predictor of
      transfer performance in lower-level tasks;
    * for higher-level tasks such as NLI and QA, both factors seem to contribute
* Q4 Should we focus more on few-shot transfer scenarios and
  quick annotation cycles?
  * Complementary to the efforts on improving zero-shot transfer (Cao+ 2020),
    Steven Cao, Nikita Kitaev, and Dan Klein
    Multilingual alignment of contextual word representations. In Proceedings of
    ICLR 2020
  * Similar to the seminal “pre-neural” work of Garrette and Baldridge (2013),
    * several hours or even minutes of annotation work can “buy” a lot of
      performance points in the low-resource target tasks.  For all five tasks
  * in some cases surprisingly large) improvements with minimal annotation
  * e.g. dependency parsing, in some target languages we improve up to 40 UAS
    points by additional finetuning on as few as 10 target language sentences
  * most prominent exactly where zero-shot transfer fails:
    for distant target languages with small monolingual corpora

# 2 Background and Related Work

## 2.1 cross-lingual transfer, with a focus on

* discrete representations include
  * machine translation of target language text to the source language (or vice)
    (Mayhew+ 2017; Eger+ 2018), and
  * grounding texts from both languages in multilingual knowledge bases (KBs)
    (Navigli and Ponzetto, 12; Lehmann+ 15, Camacho-Collados+ 16; Mrkšić+ 17) is
    * impaired by the limited KB coverage and inaccurate entity linking
      (Mendes+ 2011; Moro+ 2014; Raiman and Raiman, 2018)
* continuous cross-lingual representation spaces. The previous SOTA approaches,
  * cross-lingual word embeddings (Mikolov+ 2013; Ammar+ 2016; Artetxe+ 2017;
    Smith+ 2017; Glavaš+ 2019; Vulić+ 2019) and
    * Mikel Artetxe, Gorka Labaka, and Eneko Agirre. 2017
      Learning bilingual word embeddings with (almost) no bilingual data. In
      ACL 2017
    * Samuel L. Smith, David H.P. Turban, Steven Hamblin, and Nils Y. Hammerla
      Offline bilingual word vectors, orthogonal transformations and the
        inverted softmax. In Proceedings of
      ICLR 2017
    * Goran Glavaš, Robert Litschko, Sebastian Ruder, and Ivan Vulić. 2019
      How to (properly) evaluate crosslingual word embeddings:
        On strong baselines, comparative analyses, and some misconceptions. In
      ACL 2019
  * sentence embeddings (Artetxe and Schwenk, 2019), are now getting replaced by
  * mas-sively multilingual transformers based on language modeling objectives
    (Devlin+ 2019; Conneau and Lample, 2019; Conneau+ 2020)

## 2.2 SOTA cross-ling transfer with massively multilingual transformers (MMT)

### The “Curse of Multilinguality”

* Conneau+  (2020) observe the following phenomenon working with XLM-R
  * for a fixed model capacity, the cross-lingual transfer performance improves
    when adding more pretraining languages only up to a certain point]
  * After that, adding more languages to pretraining degrades transfer
  * can be mitigated by increasing the model capacity (Artetxe+ 2019). However,
  * model capacity is a critical limitation to zero-shot cross-lingual transfer,
    especially when dealing with lower computational budgets
* In this work (see §4), we suggest that a lightweight strategy to mitigate the
  curse in a particular target is few-shot transfer
  * without the need to train a larger-capacity MMT from scratch

## 2.3 other studies that examine different properties of MMTs

* Libovickỳ+ (2020) analyze lang-specific versus lang-universal knowl in mBERT
* Pires+ (2019) show that zero-shot cross-lingual transfer with mBERT is
  effective for POS tagging and NER, and that it is
  more effective between related languages
* Wu and Dredze (2019) extend the analysis to more tasks and languages; they
  * transfer via mBERT is competitive to the best task-specific zero-shot
    transfer approach in each task
* Karthikeyan+  (2020) prove mBERT to be effective for NER and NLI transfer to
  Hindi, Spanish, and Russian (note that all languages are Indo-European and
  high-resource with large Wikipedias). Importantly, they show that
  * transfer effectiveness does not depend on the vocabulary overlap between the
* Hu+ (2020) introduce XTREME, a benchmark for evaluating multilingual encoders
  * 9 tasks and 40 languages in total
    * Note that individual tasks in XTREME do not cover all 40 languages, but
      rather significantly smaller language subsets
  * Their primary focus is zero-shot transfer evaluation, while they
  * also experiment with target-language fine-tuning on 1,000 instances for POS
    tagging and NER; this leads to substantial gains over zero-shot transfer
  * focus on the evaluation aspects and protocols, in this work,
    * we
      * factors that hinder effective zero-shot transfer across diverse tasks
      * few-shot learning scenarios, and
  * diff approach: we first finetune the MMTs on the (large) English
    task-specific training set and then fine-tune/adapt it further with a small
    number of target-language instances (e.g., even with as few as 10
    instances).  2
* Artetxe+ (2019) and Wu+ (2020) have analyzed monolingual BERT models in
  different languages to explain transfer effectiveness of MMTs. Their main
  * conclusion, similar as with static word embeddings:
    * it is the topological similarities 4 between the subspaces of individual
      languages captured by MMTs that enable effective cross-lingual transfer
    * For cross-lingual word embedding spaces, the assumption of approximate
      isomorphism does not hold for
      * distant languages (Søgaard+ 2018; Vulić+ 2019), and in face of
      * limited-size monolingual corpora (Vulić+ 2020). In

# 3 Zero-Shot Transfer: Analyses 4

* zero-shot language transfer experiments on five different tasks
* We then analyze the drops with respect to
  linguistic (dis)similarities and sizes of pretraining corpora of target langs

## Experimental Setup

### Tasks and Languages. We experiment with –

* Cross-lingual Natural Language Inference (XNLI).  We run our experiments on
  * the XNLI corpus (Conneau+ 2018) created by crowd-translating the dev and
    test portions of the English Multi-NLI dataset (Williams+ 2018) into 14 lang
    (FR, ES, DE, EL, BG, RU, TR, AR, VI, TH, ZH, HI, SW, UR)
* Cross-lingual Question Answering (XQuAD). We rely on the
  * XQuAD dataset (Artetxe+ 2019), created by translating the 240 development
    paragraphs (from 48 documents) and their corresponding 1,190 question-answer
    pairs of SQuAD v1.1 (Rajpurkar+ 2016) to 11 languages
    (ES, DE, EL, RU, TR, AR, VI, TH, ZH, and HI)
  * the task is to identify the exact span in the paragraph, which contains the

## 3.2 Results and Preliminary Discussion

* For instance,
  * NER transfer with mBERT for IT drops a mere 0.8%, whereas it is 51% on JA
  * XNLI, transferring with XLM-R yields a moderate decrease of 6.1% for FR ,
    but a much larger drop of 20% for SW
* it would appear – as suggested in prior work – that the drops in transfer
  * no notable exception to this pattern on the three lower-level tasks,
  * language proximity alone does not explain many results obtained on XNLI and
    XQuAD
* e.g
  * XNLI (for both mBERT and XLM-R), the RU scores are comparable to those on ZH
    , while they are lower for HI and UR : this is
    * despite the fact that as Indo-European languages RU , HI , and UR are
      linguistically closer to EN than ZH 
  * we observe comparable scores on XQuAD for TH, RU , and ES . Therefore, in

## 3.3 Analysis

* we now analyze the correlations between transfer performance in the task and
  * various measures of linguistic proximity (i.e., similarity) between langs and
  * the size of MMT pretraining corpora of each target language

### Language Vectors and Corpora Sizes

* In order to estimate linguistic similarity, we rely on
  language vectors from LANG 2 VEC , which encode various
  linguistic features from the URIEL database (Littell+ 2017). We consider
  * syntax (SYN) vectors encode e.g., whether a subject appears before or after a verb
  * phonology (PHON) vectors encode e.g. the consonant-vowel ratio
  * inventory (INV) vectors encode presence or absence of natural classes of sounds, e.g., voiced uvulars
  * FAM vectors denote memberships in language families, e.g., Indo-Germanic
  * and GEO vectors express orthodromic distances for languages w.r.t. a fixed
* cosine similarity between the languages’ corresponding LANG 2 VEC vectors
  * Each aspect listed above (e.g., SYN, GEO, FAM) yields one scalar feature for
    our analysis.  We also include
* another feature: the z-normalized size of the target language corpus used in
  MMT model pretraining (SIZE). 7

### Correlation Analysis. We first correlate individual features with the

* the zero-shot scores for low-level syntactic tasks – POS and DEP – best
  correlate with syntactic similarity (SYN)
* SYN similarity also correlates quite highly with higher-level tasks, except
  for XLM-R on XQuAD.  Phonological similarity (PHON) correlates best with the
  transfer results of mBERT on NER and XLM-R on XQuAD. Interestingly, for both
  high-level tasks and both models, we observe
* very high correlations between transfer performance and the size of
  pretraining corpora of the target language (SIZE). On the other hand,
  * SIZE shows substantially lower correlations with transfer performance across
    lower-level tasks (DEP, POS, NER). We believe that this is because language

### Meta-Regression. We observe high correlations between the transfer scores

* we further test if even higher correlations can be achieved by a (linear)
  combination of the individual features. For each task, we fit a linear
* greedy forward feature selection: we start from an empty feature set and in
  * we stop when none of the remaining features further improve the Pearson corr
* XNLI, the transfer results are best explained with the combination of
  structural language proximity (SYN) and the size of the target-language
  pretraining corpora (SIZE)
* XQuAD with mBERT, SIZE alone best explains zero-short transfer scores.  We
* the features are also mutually very correlated (e.g., languages closer to EN
  tend to have larger corpora): if the regressor selects only one feature, this
  does not suggest that other features do not correlate with transfer results
* summ: pretraining corpora sizes are stronger features for predicting zero-shot
  performance in higher-level tasks, whereas the results in
  * lower-level tasks are more affected by typological language proximity

# 4 From Zero to Hero: Few-Shot 7

* we continue the fine-tuning process by feeding k additional training examples
  randomly chosen from reserved target language data portions, disjoint with
* lower-level tasks: we compare three sampling methods:
  * random sampling (RAND) of k target language sentences,
  * selection of the k shortest (SHORTEST) but > 3
  * the k longest (LONGEST) but <= 50 sentences

## 4.1 Results and Discussion

* substantial improvements in few-shot learning setups for all tasks. However,
  * higher-level language understanding tasks the improvements are less pronounc
  * lower-level tasks are massive: between 14.11 and 26 percentage points,
    choosing the best sampling strategy for each task.  Moreover, the gains in
    * substantial even when we add only 10 annotated sentences in the target
    * additional experiments (omitted for brevity) show substantial gains for
      DEP and POS even when we add fewer than 5 annotated sentences
* different sampling strategies for the lower-level tasks is also shown in
  * DEP and POS: adding longer sentences results in better scores. For
  * NER, however, RAND appears to perform best, with a larger gap between RAND
    * We hypothesize that this is due to very long sentences being relatively
      sparse with named entities, resulting in our model seeing a lot of
  * shorter sentences are also less helpful than for DEP and POS because they
    consist of (confirmed by inspection) a single named entity mention, without
    non-NE tokens
* performance for individual languages
  on one lower-level (DEP) and one higher-level task (XQuAD), for different `k`s
  * more distant target languages benefit much more from the few-shot data
    * e.g. SV (DEP, a) or DE (XQuAD, b). Both are closely related to EN , both
      generally have high scores in the zero-shot transfer, and both benefit
      only marginally from few-shot data points
  * In stark contrast, KO (DEP, a) and TH (XQuAD, b), both exhibit
    * fairly poor zero-shot performance given their linguistic distance to EN 
    * Given in-language data, however, both see rapid leaps in performance,
      * a gain of almost 40% UAS on DEP, and almost 5% on XQuAD. In a sense,
* interesting are DEP results for JA and AR , where we observe
  * massive UAS improvements with only 10 annotated sentences. For
* XQuAD, substantial improvement from only 2 in-language documents for TH . In

## 4.2 Further Discussion

* What are the annotation costs, and at which conversion rate do they trans-
  late into performance points? Here, we provide some ballpark estimates based
  on annotation costs reported by other researchers

### Natural Language Inference

* Marelli+ (2014) reportedly paid $2,030 for 200k judgements, which would amount
  to $0.01015 per NLI instance and, in turn, to $10.15 for 1,000 annotations. In
  our few-shot experiments this would yield an average improvement of 2.24 and
  2.54 accuracy points for mBERT and XLM-R, respectively

### Question Answering

* Rajpurkar+ (2016) report a payment cost of $9 per hour and a time effort of 4
  minutes per paragraph. With an average of 5 paragraphs per article, our
  few-shot scenario (10 articles) roughly requires 50 paragraphs-level
  annotations, i.e., 200 minutes of annotation effort and would in total cost
  around $30 (for respective performance improvements of 4.5 and 2.1 points for
  mBERT and XLM-R)

* our lower-level (DEP, POS) tasks are presumably more expensive to annotate, as
  * they require some linguistic knowledge and annotation training
  * On the other hand, we typically need much fewer annotated instances
