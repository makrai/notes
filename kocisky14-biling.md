Tomáš Kočiskíý  and Karl Moritz Hermann  and Phil Blunsom
Learning Bilingual Word Representations by Marginalizing Alignments
2014

# Abstract

* We present a probabilistic model that 
  * simultaneously learns alignments and distributed representations 
    for bilingual data.  
  * By marginalizing over word alignments the model 
    captures a larger semantic context than 
    prior work relying on hard alignments
* demonstrated in a cross-lingual classification task, where we
  * outperform the prior published state of the art

# 1 Introduction

* distributed representations
  * AI and reinforcement learning (Mnih+ 2013),
  * image retrieval (Kiros+ 2013),
  * language modelling (Bengio+ 2003),
  * sentiment analysis (Socher+ 2011; Hermann and Blunsom, 2013),
  * frame-semantic parsing (Hermann+ 2014), and
  * document classification (Klementiev+ 2012)
* multilingual
  * problems include
    * document classification,
    * machine translation, and
    * cross-lingual information retrieval,
    * cross-lingual information transfer,
  * previous work
    * has relied on hard alignments or bilingual lexica
      (Klementiev+ 2012; Mikolov+ 2013),
* we
  * As a by-product we develop a distributed version of FASTALIGN (Dyer+ 2013)
  * IBM model 2
  * performs on par with the original model,

# 2 Background

* we incorporate ideas from the log-bilinear language model (Mnih & Hinton 07)
* FastAlign (FA) (Dyer+ 2013),
  * a log-linear reparametrization of IBM model 2
  * uses an alignment distribution
    * defined by a single parameter that measures 
      how close the alignment is to the diagonal
