Speech emotion recognition:
  Emotional models, databases, features, preprocessing methods, supporting
  modalities, and classifiers
MB Akçay, K Oğuz
Speech Communication, 2020-Elsevier

# 1 Intro

* SER has been around for more than two decades (Schuller, 2018)
* applications in
  * human-computer interaction (Cowie+ 2001)
  * robots (Huahu+ 2010)
  * mobile services (Yoon+ 2007)
  * call centers (Gupta and Rajput, 2007)
  * computer games (Szwoch and Szwoch, 2015)
  * psychological assessment
    (Lancker, Cornelius, Kreiman, 1989, Low, Maddage, Lech, Sheeber+, 2011)
* approaches to model the emotions: still an open problem
  * discrete and the dimensional models are commonly used
  * we first review the emotional models
* classifier, a supervised learning construct, that will be trained
  * deep learning have also become common
* labeled data for emotions
* preprocessing before their features can be extracted
* Features are essential to a classification process. Four groups:
  * prosodic, spectral, voice quality, and features based on Teager energy op
* features from other modalities, such as visual or linguistic

# 2 surveys and the areas that they cover

* supporting modalities, such as linguistic, discourse, and video information
* A recent but brief survey by Basu+ (2017) highlights
  * databases, noise reduction techniques for preprocessing signals, features,
    and classifiers including
    recent advances such as Convolutional and Recurrent Neural Networks
* Sailunaz+ (2018) focus on emotion detection from text and speech, where
  * publications that incorporate text information as well as speech signals to
    determine speech are discussed
  * emotional models (Unlike other surveys, they also discuss them)
  * recent classifiers

# 3 emotions

* Emotions are convoluted psychological states that are composed of 
  * several components such as personal experience, physiological, behavioral,
    and communicative reactions. Based on these deﬁnitions, two models
* Discrete emotion theory is based on the six categories of basic emotions;
  sadness, happiness, fear, anger, disgust, and surprise, as described by
  * Ekman and Oster (1979); Ekman+ (2013)
  * inborn and culturally independent emotions are experienced for a short
    period (Ekman, 1971)
  * Other emotions are obtained by the combination of the basic ones
  * Most of the existing SER systems focus on these basic emotional categories
    * In daily life, people use this model to deﬁne their observed emotions,
    hence labeling scheme based on emotional categories are intuitive
  * unable to deﬁne some of the complex emotional states observed in communicat
* Dimensional emotional model is an alternative model that uses
  * a small number of latent dimensions to characterize emotions such as
    valence, arousal, control, power
  * Russell and Mehrabian, (1977); Watson+ (1988). These dims are deﬁnitive
  * emotions are not independent of each other; instead, they are analogous to
    each other in a systematic way. One of the most preferred dimensional
  * eg two-dimensional model that uses
    * arousal, activation, or excitation on one dimension,
      * Arousal dimension deﬁnes the strength of the felt emotion
      * It may be excited or apathetic, and it
        ranges from boredom to frantic excitement (Nicolaou+ 2011)
    * versus valence, appraisal, or evaluation on the other
      * whether an emotion is positive or negative, and it ranges between
        unpleasant and pleasant The
   * three-dimensional model includes a dimension of dominance or power, which
     * the seeming strength of the person that is between weak and strong.  For
     * differentiates anger from fear by considering the strength or weakness
       of the person, respectively (Grimm+ 2007)
  * disadvantages for the dimensional representation
    * not intuitive enough and special training may is needed for labeling
      (Zeng+ 2009)
    * some of the emotions become identical, such as fear and anger, and
    * some emotions like surprise cannot be categorized and lie outside of the
      * since surprise may have positive or negative valence

# 4 databases

# 5 preprocessing, feature extraction, supporting modalities, and classif

# 6 current challenges i

* dataset that is used for the learning process
  * Most of the data sets used for SER are acted or elicited that are recorded
    in special silent rooms
  * real-life data is noisy and has far more different characteristics than the
  * natural data sets are also available, they are fewer in numbers. There are
  * legal and ethical problems to record and use natural emotions
  * talk-shows, call-center recordings, and similar cases where the involved
    parties are informed of the recording
    * not contain all emotions and may not reflect the emotions that are felt
  * The actual emotion felt by the speaker and emotions perceived by human
    annotators may show differences
* cultural and language effects on SER
  * several studies available working on cross-language SER
  * hE, the results show that current systems and features used are not suffic
  * The intonation of emotions on speech among various languages may show diff
* multiple speech signals, where the SER system has to choose the signal
  * can be handled via a speech separation algorithm in the preprocessing
  * current systems fail to notice this problem

# 7 concluding remarks
