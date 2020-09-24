Text Summarization with Pretrained Encoders
Yang Liu, Mirella Lapata
arXiv:1908.08345 [cs.CL]

  code is available at this https URL 

# Abstract

* BERT represents the latest incarnation of pretrained language models which
* we showcase how BERT can be usefully applied in text summarization and
* a general framework for both extractive and abstractive models. We
* document-level encoder based on BERT which is able to express the semantics
* extractive model is built on top of this encoder by stacking several
  inter-sentence Transformer layers. For 
* abstractive summarization, we propose a new fine-tuning schedule which adopts
  different optimizers for the encoder and the decoder as a means of
  alleviating the mismatch between the two (the former is pretrained while the
  latter is not). We also demonstrate that a two-staged fine-tuning approach
  can further boost the quality of the generated summaries. 
* Experiments on three datasets show that our model achieves SOTA results
  across the board in both extractive and abstractive settings. Our 

# Introduction

* extractive summarization is often defined as a binary classification task
  with labels indicating whether a text span (typically a sentence) should be
  included in the summary.
* Our 
  * extractive model is built on top of this encoder by stacking several inter-
    sentence Transformer layers to capture document-level features for
    extracting sentences. Our 
  * abstractive model adopts an encoder-decoder architecture, combining the
    same pretrained BERT encoder with a randomly-initialized Transformer
    decoder (Vaswani+ 2017). We design a new training schedule which separates
    the optimizers of the encoder and the decoder in order to accommodate the
    fact that the former is pretrained while the latter must be trained from
    scratch. Finally, motivated by previous work showing that the combination
    of extractive and abstractive objectives can help generate better summaries
    (Gehrmann+ 2018), we present a two-stage approach where the encoder is
    fine-tuned twice, first with an extractive objective and subsequently on
    the abstractive summarization task.  
* We evaluate the proposed approach on three single-document news summarization
  datasets representative of different writing conventions (e.g., important
  information is concentrated at the beginning of the document or distributed
  more evenly throughout) and summary styles (e.g., verbose vs. more
  telegraphic; extractive vs. abstractive). Across datasets, we experimentally
  show that the proposed models achieve SOTA results under both extractive and
  abstractive settings. Our 
* document encoding for the summarization task; a variety of recently
  * copying mechanisms (Gu+ 2016; See+ 2017; Nallapati+ 2017), 
  * reinforcement learning (Narayan+ 2018b; Paulus+ 2018; Dong+ 2018), and
  * multiple communicating encoders (Celikyilmaz+ 2018).  
  * We achieve better results without using any of these mechanisms; 
