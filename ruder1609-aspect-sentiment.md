A hierarchical model of reviews for aspect-based sentiment analysis
S Ruder, P Ghaffari, JG Breslin
arXiv preprint arXiv:1609.02745, 2016 arxiv.org

# Abstract

* Sentences in reviews form part of a review’s argumentative structure
  * build and elaborate upon each other; knowledge of the review structure and
    sentential context should thus inform the classification of each sentence
* We demonstrate this hypothesis for the task of aspect-based sentiment analysis
  * modeling the interdependencies of sentences in a review with a hierarchical
    bidirectional LSTM
* exper
  * outperforms two non-hierarchical baselines
  * competitive with the SOTA, and
  * out-performs the SOTA on five multilingual, multi-domain datasets without
    any hand-engineered features or external resources

# 1 Intro

* Aspect-based sentiment analysis: sentiment towards aspects of an entity
* SemEval 2016 Task 5 (Pontiki+ 2016) for the first time provides a forum for
  multilingual aspectbased sentiment analysis
* deep learning-based approaches have demonstrated
  * remarkable results for text classif and sentiment analysis (Kim, 2014) A
  * largely gone untested for aspect-based sentiment analysis, particularly in
    the multilingual setting
* we introduce our deep-learningbased approach to aspect-based sentiment
  * in SemEval2016 Task 5 Aspect-based Sentiment Analysis
    * Slot 1 (Aspect Category Detection) and Slot 3 (Sentiment Polarity)

# 2 2 Related work

* aspect extraction framed the task as a multiclass classification problem and
  relied mostly on CRS that leveraged a plethora of common 
  * features, e.g. NER, POS tagging, parsing, semantic analysis, bagof-words, as
    * domain-dependent ones, such as word clusters learnt from Amazon and Yelp
* sentiment analysis approaches have used different classifiers with a wide
  * features based on ngrams, POS, negation words, and a large array of
    sentiment lexica (Pontiki+ 2014; Pontiki+ 2015).
* deep learning-based approaches have focused mostly on the sentiment analysis
  * Tang+ (2015) use a target-dependent LSTM to determine sentiment towards a
    target word, 
  * Nguyen and Shirai (2015) use a recursive neural network that leverages both
    constituency as well as dependency trees.  
* our model neither relies on expensive feature engineering, availability of a
  parser, nor positional information, but solely on a language’s input signals.
