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
* approaches to model the emotions, and it is still an open problem
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
* A recent but brief survey by Basu+ (2017) highlights publications that
  * databases, noise reduction techniques for preprocessing signals, features,
    and classifiers including recent advances such as Convolutional and
    Recurrent Neural Networks (Basu+ 2017)
* Sailunaz+ (2018) focus on emotion detection from text and speech, where
  * publications that incorporate text information as well as speech signals to
    determine speech are discussed
  * emotional models (Unlike other surveys, they also discuss them)
  * recent classifiers

# 3 emotions

# 4 surveys the databases

# 5 preprocessing, feature extraction, supporting modalities, and classif

# 6 current challenges i

* dataset that is used for the learning process
  * Most of the data sets used for SER are acted or elicited that are recorded
    in special silent rooms
  * real-life data is noisy and has far more different characteristics than the
  * natural data sets are also available, they are fewer in numbers. There are
  * legal and ethical problems to record and use natural emotions. Most of the
  * talk-shows, call-center recordings, and similar cases where the involved
    parties are informed of the recording.  These data sets do
    * not contain all emotions and may not reflect the emotions that are felt.
  * The actual emotion felt by the speaker and emotions perceived by human
    annotators may show differences. Even the recognition rates of human
* cultural and language effects on SER. There are
  * several studies available working on cross-language SER. 
  * hE, the results show that current systems and features used are not suffic
  * The intonation of emotions on speech among various languages may show diff
* multiple speech signals, where the SER system has to decide which signal to
  * can be handled via a speech separation algorithm in the preprocessing
  * current systems fail to notice this problem.

# 7 concluding remarks
