CCMatrix: Mining Billions of High-Quality Parallel Sentences on the WEB
Holger Schwenk, Guillaume Wenzek, Sergey Edunov, Edouard Grave, Armand Joulin
arXiv:1911.04944 [cs.CL]
text overlap with arXiv:1907.05791

* We show that margin-based bitext mining in a multilingual sentence space can
  be applied to monolingual corpora of billions of sentences. We are using ten
  snapshots of a curated common crawl corpus (Wenzek+ 2019) totalling 32.7
* unified approach for 38 languages, we were able to mine 4.5 billions par sents
  * 20 language pairs have more then 30 million parallel sentences, 
  * 112 more then 10 million, and most more than one million, including 
  * direct alignments between many European or Asian languages.  To evaluate the
* we train NMT systems for most of the language pairs and 
  * evaluate them on TED, WMT and WAT test sets. Using our mined bitexts only
* new SOTA for a single system on the WMT'19 test set for translation between
  English and German, Russian and Chinese, as well as German/French.  In
  * English/German system outperforms the best single one by close to 4 BLEU
  * almost on pair with best WMT'19 evaluation system which uses system
    combination and back-translation. We also achieve 
  * excellent results for distant languages pairs like Russian/Japanese,
    outperforming the best submission at the 2019 workshop on Asian Translation

# 1 Intro

* An important source of parallel texts are international organizations like the
  European Parliament (Koehn, 2005) or the United Nations (Ziemski+ 2016). These
  * professional human translations, but formal language and political topics.
  * projects relying on volunteers to provide translations for public texts,
    e.g.  news commentary (Tiedemann, 2012), 
    Opensub-Titles (Lison and Tiedemann, 2016) or the TED corpus (Qi+ 2018).  
* Schwenk+ (2019) mine parallel sentences for many language pairs in Wikipedia,
  including bitexts without English as one of the languages 
  * parallel sentence mining was based on a distance measure in a 
    joint multilingual sentence embedding space 
    (Schwenk, 2018; Artetxe and Schwenk, 2018a), using the freely available
    LASER toolkit 1 which provides a language agnostic sentence encoder which
    was trained on 93 languages (Artetxe and Schwenk, 2018b).  
* In this paper, we scale to a much larger corpus: ten crawls of curated CC data
  * billions of sentence embeddings have to be compared.  One the other hand, it
  * interesting research question whether global mining scales to billions 
    sentences, i.e.  systematically comparing each sentence in a source language
  * all existing large scale bitext mining techniques are hierarchical
    * First, a subset of all the texts is selected, e.g. documents, which are
      supposed to contain parallel sentences. Then, sentences limited to
      previously aligned documents are compared and the parallel ones are
      identified. This type of local mining has the advantage of being very fast
      since only a few thousand sentences need to be compared for each document.
      However, sentences which appear in documents which were not pre-selected
      can not be aligned.
* In this work, we compare all sentences against each other. Our experimental
  results seem to indicate that such an approach works surprisingly well: we are
  able to mine billions of parallel sentences which seem to be of high quality:
  NMT systems trained only on our mined data outperform the currently best single NMT systems in WMT’19 and WAT’19.

# 2  related work. We then present the 

# 3 corpus used in this work and summarize the underlying 

# 4 mining approach.  

## 4.3 how we applied this approach to extract parallel sentences. To 

# 5 asses the quality of the extracted bitexts

* we train NMT systems for a subset of language pairs and 
  evaluate them on the TED corpus (Qi+ 2018), test sets of WMT (Barrault+ 2019)
  and of the the workshop for Asian language (WAT) (Nakazawa+ 2019).

# 6 results are presented in section 6. The paper 

# 7 concludes with a discussion of future research directions.
