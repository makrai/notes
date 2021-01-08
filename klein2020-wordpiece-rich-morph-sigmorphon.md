Getting the ##life out of living: 
  How Adequate Are Word-Pieces for Modelling Complex Morphology?  
Stav Klein, Reut Tsarfaty
    SIGMORPHON 2020

# Abstract

* This work investigates word pieces. In 
* Morphologically-Rich Languages (MRLs) which exhibit 
  * morphological fusion and non-concatenative morphology, the different 
  * units within a word fused, intertwined, and cannot be separated linearly
* task of multi-tagging in Modern Hebrew, as 
  a proxy to evaluate the underlying segmentation. Our 
* results show that, 
  * while models trained to predict multi-tags for complete words outperform
    models tuned to predict the distinct tags of WPs, 
  * we can improve the WPs tag prediction by purposefully constraining the
    word-pieces to reflect their internal functions. We suggest that
* linguistically-informed word-pieces schemes, that make the morphological
  structure explicit, might boost performance for MRLs.

# Introduction

* we use Multilingual BERT (Devlin+ 2019) on the task of multi-tagging raw words
  in a morphologically rich and ambiguous language, Modern Hebrew.  Pre-neural
  studies on Hebrew found that explicitly modeling sub-word morphological
  information, substantially improves results on tagging and parsing down the
  NLP pipeline (More and Tsarfaty, 2016; More+ 2019). Here 
* our results show a significant drop in multi-tagging accuracy in word-level
  settings compared to settings where we aim to tag the distinct WPs.
  * when we purposefully incorporate morphological knowledge that reflect the
    internal functions of WPs, the tagging of WPs substantially improves.
