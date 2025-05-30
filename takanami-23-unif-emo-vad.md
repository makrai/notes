Unifying Emotion Analysis Datasets using Valence Arousal Dominance (VAD)
Mo El-Haj, Ryutaro Takanami
Conference on Language, Data and Knowledge 2023

# Abstract

* This paper presents a novel approach to unifying various emotional datasets
  using the Valence Arousal Dominance (VAD) framework
* Emotion analysis lacks large, standard, and unified datasets
* we map diverse emotions from different datasets into four categories:
  {joy, anger, fear, and sadness} using the VAD framework
  * This process creates multidimensional emotional scores that are consistent
    across datasets, regardless of the number of emotions included
* we address “weak emotions” by annotating such instances with a neutral VAD
  * Sentences that contain conflicting emotions or those that do not exhibit a
    clear or strong emotional response are referred to as weak emotion sents
  * VAD can detect and provide a more nuanced label by assigning a score range
* we train a BERT model on the combined data and
  improve the performance of emotion detection

# 2 Related work

* VAD model as a way to detect and unify different emotion datasets
  (Kulkarni and Bhattacharyya 2021; Luengo+, 2010)
  * Manasi Kulkarni and Pushpak Bhattacharyya. 2021
    Retrofitting of pre-trained emotion words
      with vad-dimensions and the plutchik emotions
    ICON’21
  * I Luengo, E Navas, I Odriozola, I Saratxaga, I Hernaez, I Sainz, D Erro
    Modified LTSE-VAD algorithm for ... reduced silence frame misclassification
    LREC 2010

# 3 Datasets

* we use five datasets mainly focusing on text written in English
  * Four of the studied datasets are annotated with coarse-grained categories
  * the fifth has VAD labels

## 3.1 Stance Sentiment Emotion Corpus (SSEC)

* an annotation of the SemEval-2016 Task 41 Twitter stance

* 4,870 tweets, each paired with
* eight emotional categories: Anger, Anticipation, Disgust, Fear, Joy,
  Sadness, Surprise, and Trust
* Each tweet was annotated by three to six annotators who were undergraduates

## 3.2 SemEval-2018 Task 1 EC

* a dataset of 3,259 English tweets paired with 11 categorized emotion labels:
  Anger, Anticipation, Disgust, Fear, Joy, Love, Optimism, Pessimism, Sadness,
  Surprise, and Trust (Mohammad+, 2018). The dataset was created by
* seven annotators label one or more emotions that represent the tweeter’s

## 3.3 WASSA-2017 Shared Task on Emotion Intensity

* 4,636 manually annotated tweets, categorized into
* four emotions: Anger, Fear, Joy, and Sadness (Mohammad & Bravo-Marquez, 2017)
* The authors gathered tweets containing emotional words representing each
  category
  * The emotional words were chosen using Roget’s Thesaurus (Chapman+, 1977)
* annotated using crowd-sourcing. WASSA-2017 is a useful dataset for emotion

## 3.4 SemEval-2017 Task 4 A (Polarity)

* from the Sentiment Analysis in Twitter challenge (Rosenthal+, 2017). It
* 11,906 polarity-emotion annotated tweets, with
* polarity labels of "positive," "neutral," and "negative"
* Tweets that mentioned any internationally trending events on Twitter were
  chosen for data collection, and the tweets were
* annotated with 3-point scales (positive, neutral, & neg, Rosenthal+ 2017)

## 3.5 EmoBank

* 10,062 sentences paired with continuous VAD labels (Buechel and Hahn, 2017)
* the largest VAD-model text corpus to the best of our knowledge
* sentences extracted from several online sources, such as blogs, essays, news
  headlines, and tweets
* annotated with 5-point scales (ranging from 1 to 5) by crowd workers

# 4 Preproc the train data

* SemEval-2018 and SSEC are annotated with multiple categ emos in 1 sentence,
  => we average the VAD values of the emotions to obtain the overall VAD value
  of that sentence before BERT model training
* To account for neutral, we set the intermediate value in VAD space, 500, for
  sentences without any labels
  * as we demonstrate later in Experiment 2 (Section 5.2)
* For the EmoBank dataset, the VAD values range between 1 and 5 points
  != our VAD scale -> we scaled it
* text: removing mentions and URLs, as they are considered unrelated to

# Experiments

## 5.1 Experiment 1: Predicting Categorical Emotions

* The combined model was trained on the EmoBank, SemEval-2018, and SSEC, tab 12
  * Additionally, separate models were trained for each individual dataset
* We use the WASSA dataset (Section 3.3) as the test set for this experiment,
  * each sentence in WASSA is annotated with a single category label (eg joy)
* calculating the Euclidean Distance between the predicted VAD scores
  and the VAD scores of each of the four emotions as labeled in WASSA

## 5.2 Experiment 2: Detecting Weak Emotions

* we set polarity emotion thresholds for the V-dimension at 300 and 700

# Conclusion

* Experiments 1 and 2 demonstrate the benefits of training with larger
  emotion-based datasets
  * it is possible to predict a wider range of emo expressions
  * polarity analysis in Experiment 2 further support this conclusion
  * also predict weak emotions, which are often overlooked by sentiment anal
* future work: increasing the number of datasets used in training
