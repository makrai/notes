Text Summarization with Pretrained Encoders
Yang Liu, Mirella Lapata
arXiv:1908.08345 [cs.CL]

code is available at this https URL

# Abstract

* BERT represents the latest incarnation of pretrained language models
* we showcase how BERT can be usefully applied in text summarization
* a general framework for both extractive and abstractive models
* document-level encoder based on BERT which is able to express the semantics
* extractive model is built on top of this encoder by stacking several
  inter-sentence Transformer layers
* abstractive summarization, we propose a new fine-tuning schedule
  * different optimizers for the encoder and the decoder
    as a means of alleviating the mismatch between the two
    (the former is pretrained while the latter is not)
  * two-staged fine-tuning approach can further boost the quality
    * motivated by that the combination of extractive and abstractive
      objectives can help generate better summaries (Gehrmann+ 2018)
* Experiments on three datasets show that our model achieves SOTA results
  across the board in both extractive and abstractive settings

# Introduction

* extractive summarization is often defined as a binary classification task
  with labels indicating whether a text span (typ sentence) should be included
* Our
  * extractive model is built on top of this encoder by stacking several inter-
    sentence Transformer layers to capture document-level features
  * abstractive model adopts an encoder-decoder architecture,
    combining the same pretrained BERT encoder with a
    randomly-initialized Transformer decoder (Vaswani+ 2017)
    * We design a new training schedule which separates the optimizers of the
      encoder and the decoder
      because the encodr is pretrained while the decodr is trained from scratch
    * two-stage approach where the encoder is fine-tuned twice,
      first with an extractive objective and subsequently on the abstractive
* We evaluate the proposed approach on three single-document news summarization
  datasets representative of different
  * writing conventions (e.g., important information is concentrated at the
    beginning of the document or distributed more evenly throughout) and
  * summary styles
    (e.g., verbose vs. more telegraphic; extractive vs. abstractive)
  * SOTA Across datasets, under both extractive and abstractive settings
* document encoding for the summarization task
  * copying mechanisms (Gu+ 2016; See+ 2017; Nallapati+ 2017),
  * reinforcement learning (Narayan+ 2018b; Paulus+ 2018; Dong+ 2018), and
  * multiple communicating encoders (Celikyilmaz+ 2018)
  * We achieve better results without using any of these mechanisms;
