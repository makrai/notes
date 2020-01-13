Unsupervised Neural Machine Translation
Mikel Artetxe [mikél ártedzse], Gorka Labaka, Eneko Agirre, Kyunghyun Cho
arXiv.1710 conference paper at ICLR 2018

# Abstract

* several proposals [e.g.] triangulation and semi-supervised learning
* Our model builds upon the
  * recent work on unsupervised embedding mappings, and consists of a
  * slightly modified attentional encoder-decoder model
  * denoising and backtranslation
* 15.56 and 10.21 BLEU points in WMT 2014 French-to-English and
  German-to-English translation

# 1 Intro

* NMT ... is known to fail [behind SMT?] when the training data is not big
  enough (Koehn & Knowles, 2017)
* pivoting or triangulation techniques (Chen+ 2017)
* semi-supervised approaches (He+ 2016) ... still require [parallel]
* unsupervised cross-lingual embeddings
  * (Artetxe+ 2017; Zhang+ 2017). Thanks to a
  * shared encoder for both translation directions that
  * uses these fixed cross-lingual embeddings,
  * the entire system can be trained, with monolingual data, to reconstruct its
    input
  * denoising: noise in the form of random token swaps is introduced
  * backtranslation (Sennrich+ 2016a) into the training procedure to further
  * Figure 1 summarizes this general schema of the proposed system

# 2 Related work

## 2.1 unsupervised cross-lingual embeddings

* bilingual signal at the document level, typically ... parallel corpora
  (Gouws+ 2015; Luong+ 2015a).  Closer to our scenario,
* embedding mapping methods independently train the embeddings ... using
  monolingual corpora, and then learn a linear transformation ... to a shared
  space based on a bilingual dictionary (Mikolov+ 2013a; Lazaridou et
  al., 2015; Artetxe+ 2016; Smith+ 2017)
  * dictionary ... typically contains a few thousands entries,
  * Artetxe+  (2017) propose a simple self-learning extension that gives
    comparable results with an automatically generated list of numerals
  * adversarial training has also been proposed to learn such mappings in an
    unsupervised manner (Miceli Barone, 2016; Zhang+ 2017)

## 2.2 statistical decipherment, an SMT-inspired unsupervised NMT

## 2.3 training NMT systems in different low-resource scenarios
