Text Summarization with Pretrained Encoders
Yang Liu, Mirella Lapata
arXiv:1908.08345 [cs.CL]

code is available at https://github.com/nlpyang/PreSumm

# Abstract

* BERT represents the latest incarnation of pretrained language models
* we showcase how BERT can be usefully applied in text summarization
* a general framework for both extractive and abstractive models
* document-level encoder based on BERT
* extractive model is built on top of this encoder
  by stacking several inter-sentence Transformer layers
* abstractive summarization, we propose a new fine-tuning schedule
  * different optimizers for the encoder and the decoder
    as a means of alleviating the mismatch between the two
    (the former is pretrained while the latter is not)
  * two-staged fine-tuning approach can further boost the quality
    * motivated by that the combination of extractive and abstractive
      objectives can help generate better summaries (Gehrmann+ 2018)
* Experiments on three datasets
  * SOTA results across the board in both extractive and abstractive settings
  * under automatic and human-based

# 1 Introduction

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
  * different writing conventions: important information is concentrated at the
    beginning of the document or distributed more evenly throughout
  * different summary styles
    * verbose vs. more telegraphic; extractive vs. abstractive
  * SOTA across datasets, under both extractive and abstractive settings
* document encoding for the summarization task
  * copying mechanisms (Gu+ 2016; See+ 2017; Nallapati+ 2017),
  * reinforcement learning (Narayan+ 2018b; Paulus+ 2018; Dong+ 2018), and
  * multiple communicating encoders (Celikyilmaz+ 2018)
  * We achieve better results without using any of these mechanisms

# 2 Background 2

## 2.1 Pretrained Language Models

* apply pretrained models to generation problems (Edunov+ 2019; Rothe+ 2019)
* When fine-tuning for a specific task, parameters in Bert are jointly
  fine-tuned with additional task-specific parameters

## 2.2 Extractive Summarization

* SummaRunner (Nallapati+ 2017) is one of the earliest neural approaches
  adopting an encoder based on Recurrent Neural Networks
* Refresh (Narayan+ 2018b) is a reinforcement learning-based system
  trained by globally optimizing the ROUGE metric
* LAtent (Zhang+ 2018): extractive summarization as a latent variable inference
  * instead of maximizing the likelihood of “gold” standard labels, their
    latent model directly maximizes the likelihood of human summaries
    given selected sentences
* Sumo (Liu+ 2019) capitalizes on the notion of structured attention to
  induce a multi-root dependency tree representation of the document
  while predicting the output summary
* NeuSum (Zhou+ 2018) scores and selects sentences jointly, SOTA in extractive

## 2.3 Abstractive Summarization

* Neural approaches conceptualize the task as a sequence-to-sequence problem,
* Rush+ (2015) and Nallapati+ (2016) were among the first to apply the neural
  encoder-decoder architecture to text summarization
* See+ (2017):
  * pointer-generator network (PT GEN) which allows it to copy words
  * coverage mechanism (COV) which keeps track of words that have been summed
* Celikyilmaz+ (2018):
  * Deep Communicating Agents (DCA) model
  * multiple agents (encoders) represent the document together with a
    hierarchical attention mechanism (over the agents) for decoding
  * trained end-to-end with reinforcement learning
* Paulus+ (2018) also present a deep reinforced model (DRM) for abstractive
  * handles the coverage problem with an intra-attention mechanism where the
    decoder attends over previously generated words
* Gehrmann+ (2018) follow a bottom-up approach (BottomUp);
  * a content selector first determines which phrases should be in the summary,
    and a copy mechanism is applied only to preselected phrases during decoding
* Narayan+ (2018a)
  * particularly suited to extreme summarization (i.e., single sentence)
  * based on convolutional neural networks and
    additionally conditioned on topic distributions (TConvS2S)

# 3 Fine-tuning Bert for Summarization

## 3.1 Summarization Encoder

* interval segment embeddings to distinguish multiple sentences within a doc
* For sent i we assign segment embedding `E_A` or `E_B` depending on whether i
  is odd or even
* This way, document representations are learned hierarchically where
  * lower Transformer layers represent adjacent sentences, while
  * higher layers, in combination with self-attention, represent multi-sentence
    discourse
* Position embeddings in the original Bert model have a maximum length of 512;
  we overcome this limitation by adding more position embeddings that are
  initialized randomly and finetuned with other parameters in the encoder

## 3.2 Extractive Summarization

* The loss of the model is the binary classification entropy of prediction ŷ

## 3.3 Abstractive Summarization

* mismatch between the encoder and the decoder,
  * since the former is pretrained while the latter must be trained from scratch
  * can make fine-tuning unstable;
    for example, the encoder might overfit the data while the decoder underfits,
    or vice versa.  To circumvent this,
* we design a new fine-tuning schedule which 
  separates the optimizers of the encoder and the decoder
  * the pretrained encoder should be fine-tuned with a smaller learning rate and
    smoother decay (so that the encoder can be trained with more accurate
    gradients when the decoder is becoming stable)
* In addition, we propose a two-stage fine-tuning approach, where we
  * first fine-tune the encoder on the extractive summarization task (Sec 3.2)
  * then fine-tune it on the abstractive summarization task (Section 3.3)
  * extractive objectives can boost the performance of abstractive summarization
    (Gehrmann+ 2018; Li+ 2018)
  * conceptually very simple, the model can take advantage of information shared
    between these two tasks, without fundamentally changing its architecture. We
    name the default abstractive model BertSumAbs and the
    two-stage fine-tuned model BertSumExtAbs

# 4 Experimental Setup 5

## 4.1 Summarization Datasets

* We evaluated our model on three benchmark datasets, namely the
  * CNN/DailyMail and NYT are somewhat extractive, while XSum is highly abstract
  * CNN/DailyMail news highlights dataset (Hermann+ 2015), the
  * New York Times Annotated Corpus (NYT; Sandhaus 2008), and
  * XSum (Narayan+ 2018a)
  * These datasets represent different summary
    * styles ranging from highlights to very brief one sentence summaries
    * rewriting operations: cut and paste operations vs genuinely abstractive
  * Table 1 presents statistics on these datasets (test set); 
    * example (gold-standard) summaries are provided in the supplementary materl
* CNN/DailyMail contains news articles and associated highlights, i.e., a few
  bullet points giving a brief overview of the article
  * Input documents were truncated to 512 tokens
* NYT contains 110,540 articles with abstractive summaries
  * Following Durrett+ (2016), we
    * split these into 100,834/9,706 training/test examples, based on the date
      of publication (test from January 1, 2007) We used 4,000 examples from the
      training as validation set.  We also followed their
    * filtering documents with summaries less than 50 words
    * filtered test set (NYT50) includes 3,452 examples
    * Input documents were truncated to 800 tokens
* XSum contains 226,711 news articles accompanied with a one-sentence summary,
  * splits of Narayan+ (2018a) for training, validation, and testing and
    followed the pre-processing introduced in their work
    * Input documents were truncated to 512 tokens
* Table 1
  * statistics on the three datasets
  * proportion of novel bi-grams in gold summaries as a measure of their abstrac
* We would expect models with extractive biases to perform better on datasets
  with (mostly) extractive summaries, and abstractive models to perform more
  rewrite operations on datasets with abstractive summaries

## 4.2 Implementation Details

* PyTorch, OpenNMT (Klein+ 2017) and the ‘bert-base-uncased’ 2 version of Bert

# 5 Results 6

## 5.1 Automatic Evaluation

* Table 2 summarizes our results on the CNN/DailyMail dataset
  * Bert-based models outperform the Lead-3 baseline which is not a 
  * Bert models collectively outperform all previously proposed extractive and
    abstractive systems, only falling
  * BertSumExt performs best which is not entirely surprising;
    CNN/DailyMail summaries are somewhat extractive and 
    even abstractive models are prone to copying sentences 
    when trained on this dataset (See+ 2017)
  * larger versions of Bert lead to performance improvements and
    * interval embeddings bring only slight gains
* Table 3 presents results on the NYT dataset
  * we use limited-length ROUGE Recall
    * Following the evaluation protocol in Durrett+ (2016), 
    * predicted summaries are truncated to the length of the gold summaries.
      Again, we report the performance of the Oracle upper bound and
  * second block in the table contains 
    previously proposed extractive models as well as our own Transformer baselin
    * ComPress (Durrett+ 2016) is an ILP-based model which 
      combines compression and anaphoricity constraints.  The 
  * third block includes abstractive models from the literature, and our
    Transformer baseline
  * Bert-based models outperform previously proposed approaches
  * abstractive Bert models generally perform better compared to BertSum Ext,
    almost approaching Oracle performance
* Table 4 summarizes our results on the XSum dataset
  * highly abstractive (see Table 1) consisting of a single sentence
  * Extractive models here perform poorly as corroborated by the low perf of the
    * LEAD baseline (which simply selects the leading sentence)
    * ORACLE (which selects a single-best sentence in each document)
  * we do not report results for extractive models on this dataset

## 5.2 Model Analysis

### Position of Extracted Sentences

* BertSum Ext relies less on shallow position features, and learns deeper

### Novel N-grams

* Figure 3
  * CNN/DailyMail dataset, the proportion of novel n-grams in automatically
    generated summaries is much lower compared to reference summaries, but in
  * XSum, this gap is much smaller
* The supplementary material includes 
  examples of system output and additional ablation studies

## 5.3 Human Evaluation 8

* question answering (QA) paradigm (Clarke and Lapata, 2010; Narayan+ 2018b)
  * quantifies the degree to which summarization models retain key information
    from the document
  * a set of questions is created based on the gold summary under the
    assumption that it highlights the most important document content
  * Participants are then asked to answer these questions by reading system
    summaries alone without access to the article
* overall quality of the summaries produced by abstractive systems
* Best-Worst Scaling (Kiritchenko and Mohammad, 2017) method 
  * participants presented with the output of two systems (and the original doc)
  * criteria of Informativeness, Fluency, and Succinctness
* Both types of evaluation were conducted on the Amazon Mechanical Turk platform
  * CNN/DailyMail and NYT datasets: we used the same documents (20 in
    total) and questions from previous work (Narayan+ 2018b; Liu+ 2019)
  * XSum: we randomly selected 20 documents (and their questions) from the
    release of Narayan+ (2018a). We elicited 3 responses per HIT
  * QA evaluation, we adopted the scoring mechanism from Clarke & Lapata (2010);
    correct/partially correct/other answers were marked with a score of 1/0.5/0
  * quality-based evaluation, the rating of each system was computed as the
    percentage of times it was chosen as better minus the times it was selected
    as worse.  Ratings thus range from -1 (worst) to 1 (best)
* Tables 6 and 7: Results for extractive and abstractive systems respectively
  * We compared the best performing BertSum model in each setting (extractive or
    abstractive) against various SOTA systems (whose output is publicly
    available), the Lead baseline, and the GOLD standard as an upper bound
  * in both settings participants overwhelmingly prefer the output of our model
    against comparison systems across datasets and evaluation paradigms
  * All differences between BertSum and comparison models are statistically
    significant (p < 0.05),
    with the exception of TConvS2S (see Table 7; XSum) in QA

# 6 Conclusion 9

* We introduced a novel
  * document-level encoder and proposed a
  * general framework for both abstractive and extractive summarization
* in the future: BERT for language generation
