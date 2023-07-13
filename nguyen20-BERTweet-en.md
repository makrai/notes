BERTweet: A pre-trained language model for English Tweets
Dat Quoc Nguyen, Thanh Vu, Anh Tuan Nguyen
EMNLP 2020

# Abstract

* BERTweet, the first public large-scale pre-trained LM for English Tweets
  * same architecture as BERT-base (Devlin+ 2019)
  * RoBERTa pre-training procedure (Liu+ 2019)
* outperforms strong baselines RoBERTa-base and XLM-R-base (Conneau+ 2020),
  * better results than the previous SOTA models on three Tweet NLP tasks:
    Part-of-speech tagging, Named-entity recognition and text classification

# 1 Intro

* characteristics of Tweets are generally different
  * short length of Tweets and frequent use of informal grammar as well as
    irregular vocabulary eg abbreviations, typographical errors and hashtags
    (Eisenstein, 2013; Han+ 2013)
* we using a 80GB corpus of 850M English Tweets
  * BERT-base model configuration
  * RoBERTa pre-training procedure (Liu+ 2019)
* We evaluate our model and compare it
  * with strong competitors RoBERTabase and XLMRbase (Conneau+ 2020),
  * three downstream Tweet NLP tasks: POS, NER, and text classification
  * our model outperforms RoBERTabase and XLM-Rbase as well as the prev SOTA
    on all these tasks
* exper whether lexical normalization dictionaries on Tweets (Han+ 2012) helps
* BERTweet can be used with fairseq (Ott+ 2019) and transformers (Wolf+ 2019)
* future work from the conclusion
  * “large” version of BERTweet, which possibly performs better than
    RoBERTalarge and XLM-Rlarge on all three evaluation tasks
  * identifying informative COVID-19 Tweets (Nguyen+ 2020) or
    extracting COVID-19 events from Tweets (Zong+ 2020)

# 3 Experimental setup

## Downstream task datasets

* POS tagging, we use three datasets Ritter11-T-POS (Ritter+ 2011),
  ARK-Twitter (Gimpel+ 2011; Owoputi+ 2013) and Tweebank-V2 (Liu+ 2018)
* NER: datasets from the WNUT16 NER shared task (Strauss+ 2016) and the
  WNUT17 shared task on novel & emerging entity recognition (Derczynski+ 2017)
* text classification
  * 3-class sentiment analysis dataset from the SemEval2017 Task 4A
    (Rosenthal+ 2017)
  * 2-class irony detection dataset from SemEval2018 Task 3A (Van Hee+ 2018)
* train/validation/test
  * For Ritter11-T-POS, we employ a 70/15/15 training/validation/test pre-split
    available from Gui+ (2017)
  * ARK-Twitter contains two files daily547.conll and oct27.conll in which
    oct27.conll is further split into files oct27.traindev and oct27.test
    Following Owoputi+ (2013) and Gui+ (2017), we employ daily547.conll as a
    test set. In addition, we use oct27.traindev and oct27.test as training and
    validation sets, respectively
  * For the T WEEBANK V 2, WNUT16 and WNUT17 datasets, we use their existing
    training/validation/test split
  * The SemEval2017Task4A and SemEval2018-Task3A datasets are provided with
    training and test sets only (ie there is not a standard split for
    validation), thus we sample 10% of the training set for validation and use
    the remaining 90% for training
* normalization
  * “soft” normalization strategy to all of the experimental datasets by
    * translating word tokens of user mentions and web/url links into special
      tokens @USER and HTTPURL, respectively, and
    * converting emotion icon tokens into corresponding strings. We also apply a
  * “hard” strategy by further applying lexical normalization dictionaries
    (Aramaki, 2010; Liu+ 2012; Han+ 2012) to normalize word tokens in Tweets
