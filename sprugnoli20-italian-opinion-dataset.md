Sprugnoli, Rachele
MultiEmotions-it: A new dataset for opinion polarity and emotion anal for Italian
2020 7th Italian Conference on Computational Linguistics, CLiC-it 2020

# Abstract

* MultiEmotions-It: a new linguistic resource for Italian
* comments to music videos and advertisements posted on YouTube and Facebook
  * manually annotated according to four dimensions: i.e.,
  * relatedness, opinion polarity, emotions and sarcasm
  * emotions: we adopted the Plutchik (1980)’s model
    * taking into account both basic and complex emotions, i.e. dyads
    * Following Plutchik, we take into consideration both the
      * eight basic emotions (joy, sadness, fear, anger, trust, disgust,
        surprise, anticipation) and the
      * dyads, that is feelings composed of two basic emotions
        (e.g., love is a blend of joy and Trust)

# 2 Related work

* The computational study of opinions and emotions
  * falls within the scope of the Sentiment Analysis research field (Liu, 2012).
  * Opinion polarity identification: whether a text is expressing positive,
    negative or neutral sentiment towards the subject of the text. As for
  * emotions, their analysis follows two main approaches (Buechel & Hahn, 2017)
    * discrete categories based on the theories of psychologists such as those
      of Ekman (Ekman, 1992) and Plutchik whereas in the second approach
    * dimensional form using continuous values such as valence, arousal & domin
* Survey papers like the ones by
  * Hakak+ (2017), Bostan & Klinger (2018) and Kim & Klinger (2019) report on
  * text genres, mainly
    * news (Strapparava and Mihalcea, 2007),
    * social media (Mohammad, 2012) and
    * literary works (Alm+ 2005)
* social media:
  * Twitter is the most studied platform and datasets of annotated
    * emotion analysis see, EmpaTweet (Roberts+ 2012) and EmoTweet (Liew+ 2016).
  * Facebook posts and YouTube comments with corpora and systems developed for
    * languages: English (Preoţiuc-Pietro+ 2016), Thai (Sarakit+ 2015),
      Bangla (Tripto and Ali, 2018) and Indonesian (Savigny & Purwarianti, 2017)
    * Italian, there are
      * several emotion lexicons (Araque+ 2019; Passaro and Lenci, 2016;
        Mohammad and Turney, 2013; Mohammad, 2018), but, at the moment,
      * no dataset with annotated emotions has been released yet
* Similarly to SenTube (Uryupina+ 2014), MultiEmotions-It includes YouTube
  comments and contains the annotation of opinion polarity: however, we also
  include comments to Facebook posts and we pay particular attention to the
  categorical annotation of emotions. More specifically, our emotion annotation
  is inspired by that proposed by Phan+ (2016) that goes beyond the
  classification of only the basic emotions to include Plutchik’s dyads so to
  better capture the spectrum of human emotional experience

# 4 Dataset Analysis

* 36.5% of the comments with an affective contentare annotated with a dyad and
  18.3% with a mix of emotions.
* Table 4 reports the 3 most frequent dyads and mixes of emotions in the dataset
  * sentimentality (that is a combination of trust and sadness) plays an
    important role in Ads that try to induce a deep, overwhelming emotional
    response. Indeed, sentimentality is an emotion that marketing research has
    identified as a fundamental purchase decision variable (Morton+ 2013).
  * Optimism (anticipation + joy) and pessimism (anticipation + sadness) are not
    very frequent in the dataset with 65 and 16 occurrences respectively.
    * mainly associated with comments on advertisements related to the COVID-19

# 5 Baseline System

# 6 Conclusion and Future Work

* future work, we plan to:
  * extend the annotation guidelines to distinguish the specific object towards
    which the opinion is directed (e.g. the product, the actor, the location of
    the video) following the work by Severyn+  (2016),
  * extend the dataset with new comments taken also from Instagram and Twitter,
  * extract a new word-emotion association lexicon from MultiEmotions-It using
    vector space models (Passaro+ 2015) in order to cover complex emotions.
