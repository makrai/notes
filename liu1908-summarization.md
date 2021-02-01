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
    * We design a new training schedule which 
      separates the optimizers of the encoder and the decoder
      because the encodr is pretrained while the decodr is trained from scratch
    * two-stage approach where the encoder is fine-tuned twice,
      first with an extractive objective and subsequently on the abstractive
* We evaluate the proposed approach 
  on three single-document news summarization datasets
  * different writing conventions (e.g., important information is concentrated
    at the beginning of the document or distributed more evenly throughout) and
  * different summary styles
    (e.g., verbose vs. more telegraphic; extractive vs. abstractive)
  * SOTA Across datasets, under both extractive and abstractive settings
* document encoding for the summarization task
  * copying mechanisms (Gu+ 2016; See+ 2017; Nallapati+ 2017),
  * reinforcement learning (Narayan+ 2018b; Paulus+ 2018; Dong+ 2018), and
  * multiple communicating encoders (Celikyilmaz+ 2018)
  * We achieve better results without using any of these mechanisms;

## Human Evaluation

* questionanswering (QA) paradigm (Clarke and Lapata, 2010; Narayan+ 2018b)
  which quantifies the degree to which summarization models retain key
  information from the document. Under this paradigm, 
  * a set of questions is created based on the gold summary under the 
    assumption that it highlights the most important document content.
  * Participants are then asked to answer these questions by reading system
    summaries alone without access to the article. The more questions a system
* overall quality of the summaries produced by abstractive systems which due to
  their ability to rewrite content may produce disfluent or ungrammatical
  output.
* Best-Worst Scaling (Kiritchenko and Mohammad, 2017) method where participants
  were presented with the output of two systems (and the original document) and
  * according to the criteria of Informativeness, Fluency, and Succinctness.  
* Both types of evaluation were conducted on the Amazon Mechanical Turk platform.
  * CNN/DailyMail and NYT datasets: we used the same documents (20 in
    total) and questions from previous work (Narayan+ 2018b; Liu+ 2019). For
  * XSum: we randomly selected 20 documents (and their questions) from the
    release of Narayan+ (2018a). We elicited 3 responses per HIT. With regard to
    QA evaluation, we adopted the scoring mechanism from Clarke and Lapata
    (2010); correct answers were marked with a score of one, partially correct
    answers with 0.5, and zero otherwise. For quality-based evaluation, the
    rating of each system was computed as the percentage of times it was chosen
    as better minus the times it was selected as worse.  Ratings thus range from
    -1 (worst) to 1 (best).
* Tables 6 and 7: Results for extractive and abstractive systems respectively.
  We compared the best performing B ERT S UM model in each setting (extractive
  or abstractive) against various SOTA systems (whose output is publicly
  available), the L EAD baseline, and the G OLD standard as an upper bound. As
  shown in both tables participants overwhelmingly prefer the output of our
  model against comparison systems across datasets and evaluation paradigms.
  All differences between B ERT S UM and comparison models are statistically
  significant (p < 0.05), with the exception of TC ONV S2S (see Table 7; XSum)
  in the QA evaluation setting.
