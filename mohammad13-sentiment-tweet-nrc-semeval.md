NRC-Canada: Building the State-of-the-Art in Sentiment Analysis of Tweets
Saif M Mohammad, Svetlana Kiritchenko, Xiaodan Zhu
SemEval-2013

The lexicons are made freely available www.purl.com/net/sentimentoftweets

# Abstract

* In this paper, we describe how we created
  * two SOTA SVM classifiers,
    * one to detect the sentiment of messages such as tweets and SMS (msg lev)
    * one to detect the sentiment of a term within a a message (term-level)
* features: surface-form, semantic, and sentiment features, sentiment-word
  hashtags or emoticons
  * The sentiment lexicon features
    (both manually created and automatically generated)
    along with ngram features (both word and character ngrams)
    led to the most gain in performance
  * In the message-level task, the lexicon-based features provided
    a gain of 5 F-score points over all others

# 1 Introduction

* We implemented a number of surface-form, semantic, and sentiment features
  We also generated two large word–sentiment association lexicons,
  * one from tweets with sentiment-word hashtags, and
  * one from tweets with emoticons

# 2 Sentiment Lexicons

* ie lists of words with associations to positive and negative sentiments

## 2.1 Existing, Manually Created Lexicons

* the NRC Emotion Lexicon (Mohammad and Turney, 2010; Mohammad and Yang, 2011)
  (about 14,000 words)
* the MPQA Lexicon (Wilson+ 2005) (about 8,000 words)
* the Bing Liu Lexicon (Hu and Liu, 2004) (about 6,800 words)

## 2.2 New, Tweet-Specific, Automatically Generated Sentiment Lexicons

### 2.2.1 NRC Hashtag Sentiment Lexicon

* Mohammad (2012): hashtagged emotion words eg joy, sadness, angry, and
  surprised are good indicators that the tweet as a whole (even without the
  hashtagged emotion word) is expressing the same emotion
* seed terms were chosen from entries for positive and negative in the
  Roget’s Thesaurus
* The final lexicon, ie the NRC Hashtag Sentiment Lexicon has entries for
  * 54,129 unigrams and 316,531 bigrams.  Entries were also generated for
  * unigram–unigram, unigram–bigram, and bigram–bigram pairs that were not
    necessarily contiguous in the tweets corpus
  * Pairs with certain punctuations, ‘@’ symbols, and some function words were
    removed
  * entries for 308,808 non-contiguous pairs

### 2.2.2 Sentiment140 Lexicon

* The sentiment140 corpus (Go+ 2009) is a collection of
  1.6 million tweets that contain positive and negative emoticons. The tweets
* We generated a sentiment lexicon from this corpus in the same manner
* 62,468 unigrams, 677,698 bigrams, and 480,010 noncontiguous pairs
