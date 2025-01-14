Abstractive text summarization for Hungarian
Yang Zijian Győző, Agócs Ádám, Kusper Gábor, Váradi Tamás
Annales Mathematicae et Informaticae, 53. (2021) pp. 299-316
  Selected papers of the 2020 Conference on Information Technology... Debrecen
Date Deposited: 	25 May 2021 10:13

# Abstract

* abstractive summarization
  * This method generates the summarized text by applying keywords
    that were extracted from the original text
* we have built both abstractive and extractive models for Hungarian
  * abstractive models, we have used a multilingual BERT model and Hungarian
    monolingual BERT models
  * extractive summarization, in addition to the BERT models, we have also made
    experiments with ELECTRA models
    * the Hungarian monolingual models outperformed the multilingual BERT model
    * ELECTRA small models achieved higher results than some of the BERT models
      * much fewer parameters and trained on only 1 GPU within a couple of days
* the and extractive and the first abstractive summarization systems for
  Hungarian

# 2 Related work

* two Hungarian monolingual BERT base models built by Nemeskey [16]
* In the recent months, further models for Hungarian were successfully trained:
  HIL-ELECTRA, HIL-RoBERTa, HIL-ALBERT and HILBERT [3]
  * in the present research we experimented with the HIL-ELECTRA and the HILBERT
* In recent months, autoregressive methods achieved the best results
  * rely on the decoder of the transformer model and
    use an attention mask on the top of the full sentence so the model can only
    look at the tokens before the current text
  * higher results on many text generation tasks [22]
  * [22] Z. Yang, Z. Dai, Y. Yang, J. Carbonell, R. R. Salakhutdinov, Q. V. Le:
    XLNet: Generalized Autoregressive Pretraining for Language Understanding,
    NeurIPS 2019
* BART model [6] is a denoising autoencoder for pretraining sequence-to-sequence
  * effective for fine-tuning summarization tasks
* the SOTA tool for summarization is the PEGASUS [24] system
  * important sentences are removed/masked from an input document and are
    generated together as one output sequence from the remaining sentences,
* Hungarian, the OpinHu system has a summary function [10]
  * M. Miháltz: OpinHu: online szövegek többnyelvű véleményelemzése (MSZNY 2010)
  * The system uses keywords and text context to extract information
* Lengyel[né] [12] examined automatic generation of research abstracts
  * Automatic Abstract Preparation /
    Dr. Tünde Molnár Lengyel
    ICI 2010. Proceedings, p.550-561. Delta University, Egypt, 2010
* Using the PreSumm [8] tool, Yang+ built the first extractive summarization
  tool [23] for Hungarian
* In this paper we present the first Hungarian abstractive summarization tool
  * It was built using the PreSumm system

# 4. Corpora

* 3 different kinds of resource: HVG, index.hu and the Hungarian MARCELL corpus
  (Váradi+ 2020). Table 1 displays the main characteristics of the corpora
  * T Váradi, S Koeva, M Yamalov, M Tadić, B Sass, B Nitoń, M  Ogrodniczuk+
    The MARCELL Legislative Corpus, English, LREC 2020
* hvg 480,660 doc

# 7. Results an evaluation

* In the case of HILBERT, we did not achieve the theoretical optimum, because
  the ROUGE values are increasing continuously
* abstractive samples in Table 7–10 (see Appendix)
  * When the article is long, all of our models extract phrases from the
    original article, then combine them to generate new sentences. It is similar
    to extractive models, [just not] full sentences
    * mostly grammatically correct. All the models generate several sentences,
      but by the end they “run out” and may leave sentence fragments
  * When the article is short, the models show their real abstractive feature,
    which is to generate passages that the original article did not contain
    * performance of the output is lower
* disadvantages of the automatic evaluation metric, ROUGE
* the problem of using lead as summarization
  * often the function of the lead is to attract attention and not to summarize
  * e.g. In Sample 1. (see Table 7), the article is about damages caused by
    storms and the payments by the insurers. The lead was only about the
    insurers, it did not even mention the storm and the damages, whereas our
    models described both topics
* For more examples visit our demo site 14

# 8. Summary

* For abstractive models, we used mBERT cased, huBERT base and the HILBERT large
* For extractive summarization, besides the BERT models, we trained our own
  ELECTRA models
  * To fine-tune the BERT-based models for summarization, we used PreSumm
* the monolingual Hungarian models outperformed the multilingual model
* huBERT web model that was trained on 9 billion words could gain the best
  results both in abstractive and in extractive tasks
* our ELECTRA models: better results than the huBERT wiki with less
  computational demand and much less parameters
* future: autoregressive methods, such as BART or PEGASUS
