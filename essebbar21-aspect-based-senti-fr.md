Aspect Based Sentiment Analysis using French Pre-Trained Models
A Essebbar, B Kane, O Guinaudeau, Valeria Chiesa, Ilhem Quénel, Stéphane Chau
International Conference on Agents and Artificial Intelligence (ICAART 2021)

# Abstract

* Aspect Based Sentiment Analysis (ABSA) is a fine-grained task compared to
  * detect each aspect evoked in a text and the sentiment associated to each of
  * English language, many works using Pre-Trained Models (PTM) exits and 
    many annotated open datasets are also available. For 
  * French Language, many works exits in SA and few ones for ABSA.  
* We focus on aspect target sentiment analysis and we propose an ABSA using
  French PTM like multilingual BERT (mBERT), CamemBERT and FlauBERT.  
  * Three different fine-tuning methods: 
    Fully-Connected, Sentences Pair Classification and Attention Encoder Network
* SemEval2016 French reviews datasets for ABSA, our fine-tuning models
  * outperforms the SOTA French ABSA methods and is 
  * robust for the Out-Of-Domain dataset
  * the first french SemEval2016 dataset for Restaurant and Museum 
    (Apidianaki+ 2016)
* from the conclusion
  * The PTM-SPC model shows generally great performances and is 
    less complex compare to the PTM-AEN model. 
  * Our fine-tuned French PTM for ABSA are also robust for OOD Museum dataset.

# 1 Intro

* work in SA continues to rapidly grow in new directions (Lin and Luo, 2020)
* ABSA aims to split the text into Aspects (attributes or components of a
  product or service) and then give to each aspect a Sentiment level: positive,
  negative or neutral.
* ABSA tasks:
  * The Opinion Target Extraction which aims at extracting the target 
    (i.e the words reflecting the aspect)
  * The Aspect-Category Detection which aims at detecting the different types of
    aspects that are evoked in a text.;
  * The Aspect Sentiment Classification (ASC) for which the objective is to
    associate a sentiment polarity to each identified aspect.  
    * In this paper, we focus on ASC.  
    * Pre-Trained Models (PTM) appear to be very promising solutions but until
    * not been used for ABSA in French Language.  The main 

# 2 ABSA SOTA methods

## 2.1 Conventional Methods

* In this section, we present the SOTA for ASC using conventional classifiers
  like Convolutional Neural Network (CNN), Long Short-Term Memory (LSTM),
  Conditional Random Field (CRF): 
  * (Brun+ 2016) proposed a method composed by two steps : 
    * at word level, a CRF is trained to classify terms in aspect categories; 
    * at sentence level, aspect categories are associated to a sentence
    * the winner for French language SemEval2016 Challenge (slot 1 and slot 3)
      (Pontiki+ 2016).  
  * (Kumar+ 2016) used information extracted from dependency graphs  
    * very efficient results on different languages including French language .  
  * (Macháček, 2016) focused only on aspect categories and modeled the task as
    a multi-label classification with binary relevance transformation, where
    labels correspond to the aspects.  
  * (Ruder+ 2016) proposed a method using multiple CNN filters for sentiment
    and aspect detection.  
  * (Tang+ 2016b) applied a deep Memory Network (MemNet) which uses multiple
    attention to compute the importance of each context word .  
  * Target-Dependent LSTM (TD-LSTM): (Tang+ 2016a) used LSTM networks to
    model both the left context and the right context with the respect to
    given target. Then the left and right target-dependent representations are
    concatenated to predict the sentiment polarity of the target.  520 
  * Target-Connection LSTM (TC-LSTM): method uses a LSTM for which semantic
    relatedness of target with its context words are incorporated (Tang+ 2016a).
    A target vector is calculated by averaging the vectors of the words that
    compose the target.  
  * (Kooli and Pigeul, 2018) propose the CNN-LSTM-CRF model for aspects
    detection and the MEMNet model for detecting the sentiment associated with
    the aspects. these separate methods are applied on French SemEval2016 data.
* attention
  * without attention, LSTM models cannot detect which is the important part for
    ASC, given the aspect
  * attention mechanism can extract the association of important words for an
    aspect (Wang+ 2016), and can capture the key part of sentences in response
  * Attention-based LSTM with Aspect Embedding (ATAE-LSTM): model appends the
    target embeddings with each word embeddings and uses BiLSTM with attention
    to get the aspect and the associated sentiment (Wang+ 2016).  
  * Interactive Attention Network (IAN): model aims to learn the representations
    of the target and context with LSTM and attentions interactively, which
    generates the representations for targets and contexts with respect to each
    other (Ma+ 2017).  
  * Attentional Encoder Network (AEN): model proposed by (Song+ 2019) avoids
    recurrence and employs attention based encoders for modeling context and
    aspect.  
    
## 2.2 PTM Methods

* For SA, BERT outperforms previous SOTA models by simply fine-tuning on
  Stanford Sentiment Treebank and Internet Movie Database binary classification,
  which are widely used dataset for SA 1 .  
* For ABSA, BERT with fine-tuned methods using Fully-Connected (FC) called also
  BASE, AEN or Sentence Pair Classification (SPC) shows improvements compared to
  conventional methods (Song+ 2019, Gao+ 2019)

# 3 French PTM

## Existing French PTM

* Based on the impact of PTM on NLP tasks in English, some work has recently
  * mBERT: is a multilingual BERT with many languages including french language
  * CamemBERT: is the first monolingual PTM for French Language which is 
    * based on RoBERTa model (Facebook, Martin+ 2020).  
  * FlauBERT: is based on BERT model (Google, Le+ 2019) 
    * trained on almost twice as fewer text data than CamemBERT model.  1 
* (Blard, 2020) proposed CamemBERT model for SA using French 
  * movies reviews scraped from the website www.allocine.fr . SA 
  * accuracy is improved for about three points compared to SOTA methods. The
  * reduces the training dataset size.  
* (Le+ 2019) applied FlauBERT model for SA on books, DVD and music reviews .
  Their results show good performance even with small dataset.
* other tasks
  * monolingual French PTM CamemBERT and FlauBERT improved the SOTA performances
    for POS, NER, NLI, SA, and Q&A. There results are 
  * also better compare to multilingual mBERT.

## 3.2 Our Proposition: Fine-tuning PTM for ABSA

* using French language PTM (mBERT, Camem-BERT and FlauBERT): 
* PTM-FC (Pre-Trained Model Fully-Connected): Figure 1 shows the corresponding
  * not take into account the target information.  
* PTM-SPC (Pre-Trained Model Sentence Pair Classification): is used for many
  * le $T$ est très bon et bien servi! [SEP] menu du jour
* PTM-AEN (Pre-Trained Model Attention Encoded Network): uses a PTM with AEN
  * proposed by Song+ with English reviews (Song+ 2019). The corresponding


# 4 Results on SemEval2016 challenge in French

# 5 Conclusion

* future work
  * other fine-tuned models and also to use 
  * data augmentation techniques with French PTM in order to improve the
