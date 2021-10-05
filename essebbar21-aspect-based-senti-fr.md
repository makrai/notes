Aspect Based Sentiment Analysis using French Pre-Trained Models
A Essebbar, B Kane, O Guinaudeau, Valeria Chiesa, Ilhem Quénel, Stéphane Chau
International Conference on Agents and Artificial Intelligence (ICAART 2021)

# Abstract

* Aspect Based Sentiment Analysis (ABSA) is a fine-grained task
  * detect each aspect evoked in a text and the sentiment associated to each
  * English: many works using Pre-Trained Models (PTM) exits and
    many annotated open datasets are also available
  * French: many works exits in SA and few ones for ABSA
* We focus on aspect target sentiment analysis and we propose an ABSA using
  French PTM like multilingual BERT (mBERT), CamemBERT and FlauBERT
  * Three fine-tuning methods:
    Fully-Connected, Sentences Pair Classification, & Attention Encoder Network
    * The PTM-SPC model shows generally great performances and is
      less complex compared to the PTM-AEN model
* SemEval2016 French reviews datasets for ABSA, our fine-tuning models
  * outperforms the SOTA French ABSA methods
  * robust for the Out-Of-Domain dataset
    * the first french SemEval2016 dataset for Restaurant and Museum
      (Apidianaki+ 2016)

# 1 Intro

* work in SA continues to rapidly grow in new directions (Lin and Luo, 2020)
  * Lin, P. and Luo, X.
    A survey of sentiment analysis based on machine learning
    NLP and Chinese Computing 9th CCF International Conference, NLPCC 2020,
* ABSA aims to split the text into Aspects (attributes or components of a
  product or service) and then give to each aspect a Sentiment level +/-/0
* ABSA tasks:
  * Opinion Target Extraction: extracting the words reflecting the aspect
  * Aspect-Category Detection
    * detecting the different types of aspects that are evoked in a text
  * Aspect Sentiment Classification (ASC):
    associate a sentiment polarity to each identified aspect
    * In this paper, we focus on ASC
    * Pre-Trained Models (PTM) appear to be very promising solutions but
      * not been used for ABSA in French Language

# 2 ABSA SOTA methods

## 2.1 Conventional Methods

* In this section, we present the SOTA for ASC using conventional classifiers
  like Convolutional Neural Network (CNN), Long Short-Term Memory (LSTM),
  Conditional Random Field (CRF):
  * Brun+ (2016) proposed a method composed by two steps:
    * at word level, a CRF is trained to classify terms in aspect categories;
    * at sentence level, aspect categories are associated to a sentence
    * the winner for French language SemEval2016 Challenge (slot 1 and slot 3)
      (Pontiki+ 2016)
  * Kumar+ (2016) used information extracted from dependency graphs
    * very efficient results on different languages including French language
  * Macháček, (2016) focused only on aspect categories and modeled the task as
    a multi-label classification with binary relevance transformation, where
    labels correspond to the aspects
  * Ruder+ (2016) proposed a method using multiple CNN filters for sentiment
    and aspect detection
  * Tang+ (2016b) applied a deep Memory Network (MemNet) which uses multiple
    attention to compute the importance of each context word
  * Target-Dependent LSTM (TD-LSTM, Tang+ 2016a) model both the left context and
    the right context with the respect to target
    * Then the left and right target-dependent representations are concatenated
      to predict the sentiment polarity of the target
  * Target-Connection LSTM (TC-LSTM, Tang+ 2016a)
    * semantic relatedness of target with its context words are incorporated
    * A target vector is calculated by averaging the vectors of the words that
      compose the target
  * Kooli and Pigeul, (2018) propose the
    * CNN-LSTM-CRF model for aspects detection and the
    * MEMNet model for detecting the sentiment associated with the aspects;
    * these separate methods are applied on French SemEval2016 data
* attention
  * without attention, LSTM models cannot detect which is the important part for
    ASC, given the aspect
  * attention mechanism can extract the association of important words for an
    aspect (Wang+ 2016), and can capture the key part of sentences in response
  * Attention-based LSTM with Aspect Embedding (ATAE-LSTM)
    * appends the target embeddings with each word embeddings and uses BiLSTM
      with attention to get the aspect and the associated sentiment (Wang+ 2016)
  * Interactive Attention Network (IAN)
    * learn the representations of the target and context with LSTM and
      attentions interactively, which generates the representations for targets
      and contexts with respect to each other (Ma+ 2017)
  * Attentional Encoder Network (AEN, Song+ 2019) avoids recurrence and
    employs attention based encoders for modeling context and aspect

## 2.2 PTM Methods

* For SA, BERT outperforms previous SOTA models by simply fine-tuning on
  Stanford Sentiment Treebank and Internet Movie Database binary classification,
  which are widely used dataset for SA
* For ABSA, BERT with fine-tuned methods using Fully-Connected (FC) called also
  BASE, AEN or Sentence Pair Classification (SPC) shows improvements compared to
  conventional methods (Song+ 2019, Gao+ 2019)

# 3 French PTM

## Existing French PTM

* Based on the impact of PTM on NLP tasks in English
  * mBERT: is a multilingual BERT with many languages including french language
  * CamemBERT: is the first monolingual PTM for French Language which is
    * based on RoBERTa model (Facebook, Martin+ 2020)
  * FlauBERT: is based on BERT model (Google, Le+ 2019)
    * trained on almost twice as fewer text data than CamemBERT model
* Blard, (2020) proposed CamemBERT model for SA using French
  * movie reviews scraped from the website www.allocine.fr
  * accuracy is improved for about three points compared to SOTA methods
  * reduces the training dataset size
* Le+ (2019) applied FlauBERT model for SA on books, DVD and music reviews
  * Their results show good performance even with small dataset
* other tasks
  * monolingual French PTM CamemBERT and FlauBERT improved the SOTA performances
    for POS, NER, NLI, SA, and Q&A
  * also better compared to multilingual mBERT

## 3.2 Our Proposition: Fine-tuning PTM for ABSA

* using French language PTM (mBERT, Camem-BERT and FlauBERT):
* PTM-FC (Pre-Trained Model Fully-Connected): Figure 1
  * not take into account the target information
* PTM-SPC (Pre-Trained Model Sentence Pair Classification)
  * le $T$ est très bon et bien servi! [SEP] menu du jour
* PTM-AEN (Pre-Trained Model Attention Encoded Network)
  * proposed by Song+ with English reviews (Song+ 2019)

# 4 Results on SemEval2016 challenge in French

# 5 Conclusion

* future work
  * other fine-tuned models
  * data augmentation techniques with French PTM
