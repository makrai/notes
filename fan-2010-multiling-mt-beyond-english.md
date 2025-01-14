Beyond English-Centric Multilingual Machine Translation
A Fan, S Bhosale, H Schwenk, Z Ma, A El-Kishky, S Goyal, M Baines, O Celebi,
  Wenzek, Chaudhary, Goyal, Birch, Liptchinsky, Edunov, Grave, M Auli, A Joulin
arXiv:2010.11125 [cs.CL]

scripts and final M2M-100 model.

* massively multilingual machine translation by training a single model able to
  translate between any pair of languages.
* hE, much of this work is English-Centric by
  training only on data which was translated from or to English. While this is
  supported by large sources of training data, it does not reflect translation
* we create a true Many-to-Many multilingual translation model that can
  translate directly between any pair of 100 languages. We
  * build and open source a training dataset that covers thousands of language
    directions with supervised data, created through large-scale mining. Then,
  * increase model capacity through a combination of
    dense scaling and language-specific sparse parameters to create high quality
* gains of more than 10 BLEU when directly translating between non-English
  directions while performing competitively to the best single systems of WMT.

# 1. Introduction

* Multilingual Machine Translation (MMT) aims to build a single model to
* bilingual NMT (Bahdanau+ 2014; Gehring+ 2017; Vaswani+ 2017) and more
* neural MMT models have shown promising results (Firat+ 2016; Zhang+ 2020).
* Multilingual translation models factorize computation when translating to many
  * share information between similar languages, which
  * benefits low resource directions (Arivazhagan+ 2019) and enables
  * zero-shot translation (Gu+ 2019).  However, in the past, these systems have
  * hE, not as well as bilingual models on the same pairs (Johnson+ 2017) , as
    model capacity necessarily must be split between many languages
    (Arivazhagan+ 2019). This has been alleviated by
  * increasing model capacity (Aharoni+ 2019; Zhang+ 2020), but increased model
    * necessitates larger multilingual training datasets which are laborious and
    * English-Centric datasets and models which translate from and to English
* we create more diverse multilingual machine translation models by building a
  large-scale Many-to-Many dataset for 100 languages. We considerably reduce the
  * automatic construction of parallel corpora
    (Artetxe and Schwenk, 2018b; Schwenk+ 2019) with a
  * novel data mining strategy that
    exploits language similarity to avoid mining all directions.  We also
  * back-translation
  * improve of our model on zero-shot and low resource language pairs. Overall,
  * the first true Many-to-Many dataset comprising
    7.5B training sentences for 100 languages, providing direct training data
* The quantity of data in a Many-to-Many dataset increases quadratically with
  * making neural networks with standard capacity underfit rapidly. To that
  * we leverage progress in scaling (Kaplan+ 2020; Arora+ 2018) to train models
    * 50 times larger than current bilingual models with
    * model parallelism (Huang+ 2019; Shoeybi+ 2019).  Even with these tools,
  * we propose several scaling strategies tailored to the problem. In
    * deterministic mixture-of-experts strategy to
      split the model parameters into non-overlapping groups of languages which
      we train with a novel re-routing strategy. Language specific
    * reduce the need to densely update parameters and are
      more parallelizable in a multi-machine setting. Overall, combining these
    * 15.4B parameters and still train them efficiently on hundreds of GPUs.
* competitive with bilingual models on many competitive benchmarks, including
  WMT.  Figure 1 illustrates our data mining strategy as well as our model
  architecture.  This paper is organized as follows: first, we introduce several

# 2 standard components of modern machine translation and the multilingual settn

# 3 scale the number of language pairs to create a Many-to-Many dataset

# 4 compare this Many-to-Many dataset to an English-Centric approach

# 5 dense scaling and sparse mixture- of-experts

# 6 analysis, including human evaluation, of the quality of our 100x100
