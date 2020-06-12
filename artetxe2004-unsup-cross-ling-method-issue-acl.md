A Call for More Rigor in Unsupervised Cross-lingual Learning
Mikel Artetxe, Sebastian Ruder, Dani Yogatama, Gorka Labaka, Eneko Agirre
ACL 2020 arXiv:2004.14958 [cs.CL]

# Abstract

* motivations, definition, approaches, and methodology for unsupervised cross-l
* we call for a more rigorous position in each of them
* the scenario that is most often used to motivate methods is unrealistic
  * i.e. no parallel data and abundant monolingual data
* We also discuss different training signals that have been used in previous
  * depart from the pure unsupervised setting
* issues in tuning and evaluation of unsupervised cross-lingual models and
* best practices
* a unified outlook for different types of research in this area (i.e.,
  cross-lingual word embeddings, deep multilingual pretraining, and
  unsupervised machine translation) and we argue for comparable evaluation

# Introduction

* connection among human languages has contributed to major discoveries
  * evolution of languages, the
  * reconstruction of proto-languages, and an
  * language universals (Eco and Fentress, 1995)
* In NLP: bridge the digital language divide, to
  * enable access to information and tech for the 6,900 langs (Ruder+ 2019)
* For the purpose of this paper, we define “multilingual learning” as learning
  a common model for two or more languages from raw text,
  without any downstream task labels
  * e.g. translation as well as pretraining multilingual representations
  * will use the term interchangeably with “cross-lingual learning”
* purely unsupervised cross-lingual learning (UCL): no parallel signal
  * overview in §2. Such work has been motivated by the apparent dearth
* We [argue with] the scenario (§3.1)
* Nevertheless, UCL is an important research direction and we advocate for its
  * inherent scientific interest (understand and make progress on general NLU)
  * usefulness as a lab setting, and simplicity (§3.2)

# 2 Background

## 2.1 Cross-lingual word embeddings

* traditionally relied on parallel corpora (Gouws+ 2015; Luong+ 2015)
* separately learning monolingual word embeddings in each language and mapping
  them into a shared space through a linear transformation
* Early work required a bilingual dictionary to learn such a transformation
  (Mikolov+ 2013a; Faruqui and Dyer, 2014). This requirement was later reduced
* self-learning (Artetxe+ 2017), and ultimately removed via
* unsupervised initialization heuristics (Artetxe+ 2018a; Hoshen and Wolf,
  2018) and adversarial learning (Zhang+ 2017a; Conneau+ 2018a). Finally,
* as an optimal transport problem
  (Zhang+ 2017b; Grave+ 2019; Alvarez-Melis and Jaakkola, 2018)

## 2.2 Deep multilingual pretraining

* shallow word embeddings (Mikolov+ 2013b; Pennington+ 2014), there has been an
* contextual word reprs (Dai & Le, 2015; Peters+ 2018; Howard & Ruder, 2018)
* Recent research has been dominated by BERT (Devlin+ 2019), which uses a
  * bidirectional transformer encoder trained on
    masked language modeling and next sentence prediction, which led to
    impressive gains on various downstream tasks
* multilingual extension of BERT (mBERT) has been shown to also be effective at
  * combine monolingual corpora in different languages, upsampling those with
  * Conneau and Lample (2019) perform a
    * more thorough evaluation and report substantially stronger results, 2
    * further scaled up by Conneau+ (2019)
* analyze mBERT to get a better understanding of its capabilities
  (Wu and Dredze, 2019; Pires+ 2019; Artetxe+ 2020b; Wu+ 2019)
  * Mikel Artetxe, Sebastian Ruder, and Dani Yogatama
    On the Cross-lingual Transferability of Monolingual Representations
    ACL 2020
  * Telmo Pires, Eva Schlinger, and Dan Garrette
    How multilingual is multilingual BERT?
    ACL 2019
  * Shijie Wu, Alexis Conneau, Haoran Li, Luke Zettlemoyer, Veselin Stoyanov
    Emerging cross-lingual structure in pretrained language models
    arXiv preprint arXiv:1911.01464
  * Shijie Wu and Mark Dredze. 2019
    Beto, bentz, becas: The surprising cross-lingual effectiveness of BERT
    EMNLP-IJCNLP

## 2.3 Unsupervised machine translation

* MT using monolingual data alone go back to statistical decipherment 
  (Ravi and Knight, 2011; Dou and Knight, 2012, 2013). However, this approach
* first convincing results on standard benchmarks
  * Artetxe+ (2018c) and Lample+ (2018a) on unsupervised Neural MT
  * Both approaches rely on cross-lingual word embeddings to initialize a
  * combination of denoising autoencoding, backtranslation, and 
    optionally adversarial learning
* principles adapted to unsupervised phrase-based Statistical MT
  * large improvements over the original NMT-based systems 
    (Lample+ 2018b; Artetxe+ 2018b)
  * uses cross-lingual n-gram embeddings to build an initial phrase table,
    which is combined with an n-gram language model and a distortion model, and
    further refined through iterative backtranslation
* follow-up attempts to combine NMT and SMT based approaches 
  (Marie and Fujita, 2018; Ren+ 2019; Artetxe+ 2019b)
* deep multilingual pretraining rather than cross-lingual word embeddings to
  initialize unsupervised NMT systems
  * Conneau and Lample (2019), Song+ (2019) and Liu+ (2020) obtain strong

# Motivating fully unsupervised learning 2

* we elucidate [=explain] what we believe should be the true goals of this dir

## 3.1 How practical is the strict unsupervised scenario?

## 3.2 A scientific motivation

# 4 existing training signals and other signals that may be of interest for

## 4.1 Monolingual training signals

### Nature of atomic symbols. A more important

### Linguistic information. Finally, one can exploit

## 4.2 Cross-lingual training signals

## 4.3 Multilinguality

## 4.4 Discussion

# 5 methodological issues and best practices in UCL 6

## 5.1 validation, hyperparameter tuning

## 5.2 Evaluation practices

### Over-reliance on translation tasks. Most work

### Lack of an established cross-lingual enchmark. At the same time, there is

# 6 unified outlook of established research areas and recommendations

* i.e. (cross-lingual word embeddings, deep multilingual models and
  unsupervised machine translation)

# 7 Recommendations

# 8 Conclusions
