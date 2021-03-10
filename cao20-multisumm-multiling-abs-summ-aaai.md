MultiSumm: Towards a Unified Model for Multi-Lingual Abstractive Summarization
Yue Cao, Xiaojun Wan, Jinge Yao, Dian Yu
AAAI-20 Technical Tracks 1 / AAAI Technical Track: AI and the Web Vol. 34 No. 01

Codes will come up soon! https://github.com/ycao1996/Multi-Lingual-Summarization

# Abstract

* multi-lingual text summarization, where the goal is to process texts in
  multiple languages and output summaries in the corresponding languages with a
  single model, has been rarely studied
* we present MultiSumm, a novel multi-lingual model for abstractive summ. The
  * training regime i.e. two stages
    * multi-lingual learning that contains
      LM training, auto-encoder training, translation and back-translation
    * joint summary generation training. We conduct
* experiments on summarization datasets for
  * five rich-resource languages: English, Chinese, French, Spanish, and German,
  * two low-resource languages: Bosnian and Croatian. Experimental results show
  * our proposed model significantly outperforms a multi-lingual baseline model
  * comparable or better performance than models trained separately on each lang
* we construct the first summarization dataset for Bosnian and Croatian,
  containing 177,406 and 204,748 samples, respectively

# 1 Intro

* sequence-to-sequence model for abstractive summarization have shown to obtain
  * single, resource-rich language such as 
    * English (Tan, Wan, and Xiao 2017; Lin+ 2018) and 
    * Chinese (Wang+ 2018; Wei+ 2019). However, training a monolingual model for
* building a unified multi-lingual model 
  to leverage existing large-scale monolingual summarization corpora in rich-rsc
* Previous work on multi-lingual text summarization mainly focus on directly
  mixing training data from different languages, and training with a unified
  model that does not include modules handling multilingualism 
  (Litvak, Last, and Friedman 2010; Vanetik and Litvak 2015; Litvak+ 2016;
  * mostly based on 
    traditional machine learning techniques or integer linear programming, which
    can only handle a small number of training samples. 
    * As the number of training samples increases, the time cost of these models
      becomes unbearable. To the best of our knowledge, there are no deep
* parallel corpora for English, Chinese, French, Spanish, and German already
  (Graff+ 03; Hu, Chen, and Zhu 15; Mendonça, Graff, and DiPersio 09a; 09b),
  * millions of text-summary pairs.  However, to the best of our knowledge,
  * no published summarization dataset available for Bosnian and Croatian. To
* we first create a new abstractive summarization dataset for Bosnian and
  Croatian, consisting of 177,406 and 204,748 samples, respectively.  We give
  * relatively smaller (1/20) than those rich-resource summarization datasets
  * Due to the lack of training data, [monolingual] deep learning models that
    contain billions of parameters do not perform well as they could.  
  * Thus we aim at cross-lingual transfer
* two stages:
  * multi-lingual learning and 
    * enforcing a shared latent space and learn the vocabulary and grammar
      specific to each language, especially for the low-resource languages.
    * we train language model, auto-encoder, translation model, and
      back-translation model for encoders and decoders. 
  * joint summary generation training. The multi-lingual learning stage 
    * we train summarization models for all languages simultaneously.  
* experiments on English, Chinese, French, Spanish, German, Bosnian, Croatian
  * our model outperforms the multi-lingual baseline model on all languages.  
  * even surpasses monolingual models on some languages with only 1/7 parameters
    of the sum of all monolingual models, and the 
    * improvement is significant on the two low-resource languages. In summary,
* contributions are as follows: 
  * new neural model and a new training procedure for multi-lingual text summ
  * experiments on summarization datasets in seven languages, and the
    * our model outperforms the multi-lingual baseline model and achieves
      comparable or better performance than monolingual models.  
  * new summarization dataset for Bosnian and Croatian, consisting of 177,406
    samples and 204,748 samples, respectively. 1

# Experiments 5

## Datasets

### Dataset Construction for Bosnian and Croatian As there is no existing

* The process of constructing our summarization dataset is similar to the
  process of building datasets such as Gigaword and LCSTS. We crawl the news
  from a Bosnian news web-site 4 and a Croatian news website 5 , then we use
  the news description as the original text and use the title as the
  corresponding summary. A 
  * text-summary pair will be filtered out if its title contains dates in the
    format of “xx.xx.xxxx” because we find these titles only contain useless
    information such as “Newsletter, 20.05.2019”.  After filtering, the total
  * We randomly split 80% of the samples as the training set, 10% of the samples
    as the validation set, and 10% of the samples as the test set.  We show two
    text-summary examples in Table 1.

## Competitive Models

* We consider the following three competitive models for comparison.  
  * Individual For each language, we train a monolingual transformer model for
    text summarization.  
  * Individual + pretraining We train an individual transformer model for text
    summarization on each language, while the encoder and decoder are first
    pretrained (i.e., using language model training and auto-encoder training)
    on monolingual texts in the corresponding language.  
  * Multi-baseline The multi-baseline simply trains summarization generation
    model for all languages using one model without any pretraining process.

# Results and Analysis 6

## Multi-Lingual Summarization Results

* the multi-lingual baseline ?< individual model
  * worse on rich-resource languages (En, Es, Fr, and Zh), with an average 
    drop of about 1-2 points in Rouge-l. The exception
  * better on languages with small training data, which may benefit from the
    shared BPE tokens across languages.
