An Effective BERT-Based Pipeline for Twitter Sentiment Analysis:
  A Case Study in Italian
Marco Pota, Mirko Ventura, Rosario Catelli
Sensors 2021, 21, 133. https://doi.org/10.3390/s21010133

# Abstract

* SOTA results have been recently achieved using AlBERTo trained from scratch on
  corpora made up exclusively of tweets
* This work aims to introduce a different approach for Twitter sentiment
  * two steps
    * tweet jargon, including emojis and emoticons, is transformed into plain
      text, exploiting procedures that are language-independent or easily
      applicable to different languages
    * tweets are classified using the language model BERT
* we use BERT pre-trained on plain text, instead of tweets, for two reasons:
  * pre-trained models on plain text are easily available in many languages,
    avoiding resource~ and time-consuming model training directly on tweets
  * available plain text corpora are larger than tweetonly ones
