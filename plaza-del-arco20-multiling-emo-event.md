EmoEvent: A Multilingual Emotion Corpus based on different Events
FM Plaza del Arco, Carlo Strapparava, L. Alfonso Urena Lopez, Maite Martin
LREC 2020

# Abstract

* emotion detection in text has become more popular due to its potential
  * potential applications in fields such as psychology, marketing, political
    science, artificial intelligence
  * While opinion mining is a well-established task with many standard data
    sets and well-defined methodologies, emotion mining has received less
  * annotated gold standard resources available are not enough. In order to
* we present a multilingual emotion data set
  * based on different events that took place in April 2019. We collected
  * tweets from the Twitter platform. Then one of
  * seven emotions, six Ekman’s basic emotions plus the “neutral or other
    emotions”, was labeled on each tweet by 3 Amazon MTurkers
  * 8,409 in Spanish and 7,303 in English were labeled
  * In addition, each tweet was also labeled as offensive or no offensive
* We report some linguistic statistics about the data set in order to observe
  * difference between English and Spanish speakers when they express emotions
    related to the same events
* in order to validate the effectiveness of the data set,
  we also propose a machine learning approach for automatically detecting
  emotions in tweets for both languages, English and Spanish

# 1 Intro

* research on emotion has become popular in numerous fields including
  psychology, sociology, neuroscience, endocrinology, medicine, history, and
  computer science
* in computational linguistics consists of identifying
  discrete emotion expressed in text and is seen as
  a natural evolution of sentiment analysis and its more fine-grained model
  (Seyeditabari+ 2018)
  * more difficult task than sentiment analysis, still a long way to go
* potential applications in a number of areas, such as
  * marketing to modify or improve business strategies according to the emotion
  * psychology to detect personal traits,
  * political science to track public emotion on any national/inter/pol event
  * education to develop efficient e-learning systems based on student’s
* different languages on the Web is growing every day. However,
  * most of the work and resources developed on emotion analysis have been Eng
  * emotions in countries and cultures are expressed in different ways
    since there is a close relationship between the language and the context of
    its learning, social pressures, cultural influences, and past experience
* we present a multilingual emotion dataset of tweets based on
  events related to different domains: entertainment, catastrophes, politics,
  global commemoration and global strikes
  * labeled with emotions by three annotators
  * languages: English and Spanish. This choice of languages intends to show

# 2 related work presenting some available datasets labelled with emotions

* EmoBank (Buechel and Hahn, 2017) is a large-scale corpus of English sentences
  annotated with the dimensional Valence-Arousal-Dominance (VAD)
  representation format
* ISEAR, the International Survey on Emotion Antecedents And Reactions is
  * one of the oldest emotion-labeled datasets and consists of about
  * 76,000 records of emotion provoking text provided by the Swiss Center for
    Affective Sciences
  * from about 3,000 people around the world who were asked to report
    situations in which they experienced each of the seven major emotions (joy,
    fear, anger, sadness, disgust, shame, and guilt), and how they reacted to
    them
* The valence and arousal Facebook posts is a dataset of 2,895 Social Media
  posts rated by two psychologically trained annotators on two separate ordinal
  ninepoint scales. These scales represent valence and arousal
* The Affective Text (Strapparava and Mihalcea, 2008)
  * developed for the shared task of affective computing in SemEval 2017
    consists of
  * news headlines taken from major newspapers
  * annotation was performed manually by six annotators, and the set of labels
  * six emotions: anger, disgust, fear, joy, sadness, and surprise
* SemEval-2019 Task 3: EmoContext (Chatterjee+ 2019), the organizers provided a
  dataset of textual dialogues annotated for
  * four classes: happy, sad, anger and others
* TEC (Mohammad, 2012) is a large dataset of more than 20,000 emotion-labeled
  tweets automatically label using hashtags. The set of labels includes
  * six basic emotions: anger, disgust, fear, joy, sadness, and surprise
* EmoTweet28 (Liew+ 2016) is a corpus developed using
  * four sampling strategies based on random sampling by topic and user. The
  * tweets annotated with 28 emotions categories and captures the language used
    to express an emotion explicitly and implicitly
* other than English is very limited
  * In SemEval-2018 Task 1: Affect in Tweets, the organizers provided the
    Affect in Tweets (AIT) dataset for English, Arabic and Spanish tweets
    (Mohammad+ 2018). It is composed of a set of
    * tweets annotated for four basic emotions: anger, fear, joy, and sadness
  * A blog emotion corpus was constructed for Chinese emotional expression
    analysis (Quan and Ren, 2009).  This corpus contains manual annotations of
    eight emotional categories: expectation, joy, love, surprise, anxiety,
    sorrow, anger and hate. In particular, we found
  * only a few resources annotated with emotions in Spanish and
* even most of the English emotion datasets have been fully annotated aut

# 3 the dataset creation process

# 4 statistics on the dataset

# 5 baseline evaluation of the dataset based on a machine learning approach

# 6 conclusions and future work

* future work: deep learning with the purpose of improving the results
  regarding those emotions which are more difficult to detect. In the same way,
* classification by event in order to observe the classification behavior of
  emotions in each of them
