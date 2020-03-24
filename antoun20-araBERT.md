AraBERT: Transformer-based Model for Arabic Language Understanding
Wissam Antoun, Fady Baly, Hazem Hajj
arXiv:2003.00104 [cs.CL], submitted to The 4th Workshop on Open-Source Arabic
Corpora and Processing Tools co-located with LREC 2020

# Abstract

* The Arabic language is a morphologically rich and complex language with
  relatively little resources and a less explored syntax compared to English
* We then compare the performance of AraBERT with multilingual BERT provided by

# 1 Intro

* We evaluate A RA BERT on three Arabic NLU downstream tasks that are different
  * Sentiment Analysis (SA),
  * Named Entity Recognition (NER), and
  * Question Answering (QA)
* A RA BERT achieves SOTA performances for most tasks, compared to several
  * superiority ... in handling dialects that were not seen during the pretrain
* contributions can be summarized as follows:
  * We present a methodology to pretrain the BERT model on a large-scale Arabic
  * We evaluate A RA BERT and show its superiority on three NLU downstream
  * To elevate the state of Arabic NLP research, we will release A RA B ERT on

# 2 previous work on language representation for English and Arabic

## 2.2. Non-contextual Representations for Arabic

* Arabic word2vec was first attempted by (Soliman+ 2017), it was then followed
  by a Fasttext model (Bojanowski+ 2017) trained on wikipedia data, showing
* dialectal variations in Arabic: Abu Farha and Magdy, (2019) provided the
  largest Arabic word embeddings trained on 250M tweets.

## 2.3. Contextualized Representations for Arabic

* Walking in the footsteps of English language understanding models, same
  * hULMonA (ElJundi+ 2019) using the ULMfit structure. Google then released a

# 3 AraBERT methodology that was used to develop A RA BERT

* We [ introduced ] preprocessing prior to the model’s pre-training, in order
  to better fit the Arabic language. 

## 3.1 pre-training setup

* Masked Language Modeling (MLM) task by adding whole-word masking; 
  * 15% of the N input tokens were selected for replacement. Those tokens are
    replaced 80% of the times with the [MASK] token, 10% with a random token,
    and 10% with the original token. 
  * Whole-word masking improves the pre-training task by forcing the model to
    predict the whole word instead of getting hints from parts of the word. We
* Next Sentence Prediction (NSP) task that helps the model understand the rel
  * can be useful for many language understanding tasks such as Question
    Answering.

## 3.2 pre-training dataset that we used to pre-train A RA BERT

* complex concatenative system of Arabic (Al-Sallab+ 2017). For
  * e.g. the definite article “Al” is always prefixed to the word
* To avoid this issue, we segmented the words using Farasa (Abdelali+ 2016)
  into stems, prefixes and sufsuf fixes. 
  * Farasa: approach is based on SVM-rank using linear kernels.  We measure the
  order of magnitude faster.
  For instance, “Alloga” becomes Al+ log +a”. 
  Then, we trained the SentencePiece (Kudo, 2018), in unigram mode, on the
  segmented pre-training dataset to produce a vocabulary of ∼60K tokens. 
* To evaluate the impact of the proposed tokenization, we also trained
  SentencePiece on non-segmented text to create a second version of A RA BERT
  (AraBERTv0.1) that does not require any segmentation. The final size of vo-
  cabulary was 64k tokens, which included nearly 4K unused tokens to allow
  further pre-training, if needed.  
  
## 3.3 Arabic-specific preprocessing

## 3.4 fine-tuning process.

# 4 downstream tasks and benchmark datasets that are used for evaluation

# 5 experimental setup and discusses the results.  Finally, section

# 6 concludes and points to possible directions for future work
