SemEval-2018 Task 3: Irony Detection in English Tweets
Cynthia Van Hee, Els Lefever, Véronique Hoste
SemEval | `*`SEM 2018

# Abstract

* the first shared task on irony detection: given a tweet, determine
  * whether the tweet is ironic (Task A) and
  * which type of irony (if any) is expressed (Task B)
    * verbal irony by means of a polarity clash,
    * situational irony, or
    * another type of verbal irony, see further, or 
    * not ironic. Concretely, participants should define which one out of four
* The ironic tweets were collected using irony-related hashtags (ie #irony,
  `#sarcasm`, #not) and were subsequently
  * manually annotated to minimise the amount of noise in the corpus
  * hashtags that were used to collect the tweets were removed from the corpus
  * without metadata (eg user id, time stamp, location)
    * could help to recognise irony
    * nL the objective of this task is to learn,
      at message level, how irony is linguistically realised
* For both tasks, a
  * training corpus of 3,834 tweets was provided, as well as a
  * test set containing 784 tweets. Our shared tasks received
* submissions from
  * 43 teams for the binary classification Task A and from
  * 31 teams for the multiclass Task B
* The highest classification scores obtained are resp F1= 0.71 and F1= 0.51
  * ie fine-grained irony classification is much more challenging than binary

# 1 Introduction

* The development of the social web has stimulated the use of figurative and
  creative language, including irony, in public (Ghosh+ 2015)
  * philosophical/psychological perspective,
    discerning the mechanisms that underlie ironic speech
    improves our understanding of human reasoning and communication
  * machine learning community . Although an
  * definition
    * unanimous definition of irony is still lacking in the literature
    * a trope whose actual meaning differs from what is literally enunciated
  * important implications for NLP (Wallace, 2015)
    * NLP aims to understand and produce human language. In fact, automatic
  * potential for various applications in the domain of text mining,
    especially those that require semantic analysis, such as
    * author profiling, detecting online harassment, and sentiment analysis
  * sentiment analysis research is abundant and significant progress made
    * SemEval (Rosenthal+ 2017))
    * SemEval-2014 shared task Sentiment Analysis in Twitter (Rosenthal+ 2014)
      demonstrated the impact of irony on automatic sentiment classification by
      including a test set of ironic tweets. The results revealed that, while
      sentiment classification performance on
      * regular tweets reached up to F1 = 0.71, scores on the
      * ironic tweets varied between F1 = 0.29 and F1 = 0.57.  In fact, it has
  * several applications struggle to maintain high performance on ironic text
    (eg Liu, 2012; Maynard and Greenwood, 2014; Ghosh and Veale, 2016)
* ironic text should not be interpreted in its literal sense; it requires a
  * understanding based on associations with the context or world knowledge

# 3 Task Description

## 3.2 Task B: Multiclass Irony Classification

* submitted systems have to predict one out of four labels describing
  * verbal irony realised through a polarity contrast,
  * verbal irony without such a polarity contrast (ie other verbal irony)
  * descriptions of situational irony, and
  * non-irony
* The following paragraphs present a description and some examples

## Verbal irony by means of a polarity contrast

* instances containing an evaluative expression
* eg5 I love waking up with migraines #not
* eg6 I really love this year’s summer; weeks and weeks of awful weather In the

## Other verbal irony: instances that show no polarity

* eg7 @someuser Yeah keeping cricket clean, that’s what he wants `#Sarcasm`
* eg8 Human brains disappear every day. Some of them have never even appeared
  http://t.co/Fb0Aq5Frqs #brain #humanbrain #Sarcasm

## Situational irony or situations that fail to meet some expectations

* eg by Shelley (2001), firefighters who have a fire in their kitchen while
  they are out to answer a fire alarm would be a typically ironic situation
* Some other examples of situational irony are the following:
* eg9 Most of us didn’t focus in the #ADHD lecture. #irony
* eg10 Event technology session is having Internet problems. #irony #HSC2024

## Non-ironic or lack context to be sure that they are ironic

* eg10 And then my sister should be home from college by time I get home from
  babysitting. And it’s payday. THIS IS A GOOD FRIDAY
* eg12 Is Obamacare Slowing Health Care Spending? #NOT

# 8 Conclusions

* scores per class label in Task B, we observe that
  * high scores were obtained for the non-ironic and ironic by clash classes,
  * other irony appears to be the most challenging irony type
