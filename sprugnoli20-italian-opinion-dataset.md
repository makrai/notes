MultiEmotions-it: A new dataset for opinion polarity and emotion anal for Ital
Sprugnoli, Rachele
2020 7th Italian Conference on Computational Linguistics, CLiC-it 2020

# Abstract

* MultiEmotions-It: a new linguistic resource for Italian
* comments to music videos and advertisements posted on YouTube and Facebook
* manually annotated according to four dimensions: ie,
  * relatedness, opinion polarity, emotions and sarcasm
  * emotions: we adopted the Plutchik (1980)’s model
    * taking into account both basic and complex emotions, ie dyads
    * Following Plutchik, we take into consideration both the
      * eight basic emotions (joy, sadness, fear, anger, trust, disgust,
        surprise, anticipation) and the
      * dyads, that is feelings composed of two basic emotions
        (eg love is a blend of joy and Trust)

# 2 Related work

* The computational study of opinions and emotions
  * falls within the scope of the Sentiment Analysis research field (Liu, 2012)
  * Opinion polarity identification: whether a text is expressing positive,
    negative or neutral sentiment towards the subject of the text
  * emotions, their analysis follows two main approaches (Buechel & Hahn, 2017)
    * discrete categories based on the theories of Ekman, (1992) or Plutchik
    * dimensional form using continuous values such as valence, arousal & domin
* Survey papers like the ones by
  * Hakak+ (2017), Bostan & Klinger (2018) and Kim & Klinger (2019)
  * text genres, mainly
    * news (Strapparava and Mihalcea, 2007),
    * social media (Mohammad, 2012) and
    * literary works (Alm+ 2005)
* social media:
  * Twitter is the most studied platform and datasets of annotated
    * emotion analysis see, EmpaTweet (Roberts+ 2012) and EmoTweet (Liew+ 2016)
  * Facebook posts and YouTube comments with corpora and systems developed for
    * languages: English (Preoţiuc-Pietro+ 2016), Thai (Sarakit+ 2015),
      Bangla (Tripto and Ali, 2018) and Indonesian (Savigny & Purwarianti, 2017)
    * Italian, there are
      * several emotion lexicons (Araque+ 2019; Passaro and Lenci, 2016;
        Mohammad and Turney, 2013; Mohammad, 2018), but, at the moment,
      * no dataset with annotated emotions has been released yet
* MultiEmotions-It includes YouTube comments with annotation of opinion polar
  * Similarly to SenTube (Uryupina+ 2014)
  * nL we also include comments to Facebook posts and we pay particular
  * categorization inspired by that proposed by Phan+ (2016) that
    * goes beyond the classification of only the basic emotions to
    * include Plutchik’s dyads so to better capture the spectrum of human emo

# 4 Dataset Analysis

* 36.5% of the comments with an affective content are annotated with a dyad and
  18.3% with a mix of emotions
* Table 4 reports the 3 most frequent dyads and mixes of emotions in the dataset
  * sentimentality (trust + sadness) plays an important role in Ads that
    * ads try to induce a deep, overwhelming emotional response
    * marketing research has identified it as
      a fundamental purchase decision variable (Morton+ 2013)
  * Optimism (anticipation + joy) and pessimism (anticipation + sadness) are
    not very frequent in the dataset with 65 and 16 occurrences respectively
    * mainly associated with comments on advertisements related to the COVID-19

# 5 Baseline System

# 6 Conclusion and Future Work

* future work:
  * extend the annotation guidelines to distinguish the specific object
    towards which the opinion is directed (eg the product, the actor, the
    location of the video) following the work by Severyn+  (2016)
  * extend the dataset with new comments taken also from Instagram and Twitter,
  * extract a new word-emotion association lexicon from MultiEmotions-It using
    vector space models (Passaro+ 2015) in order to cover complex emotions
