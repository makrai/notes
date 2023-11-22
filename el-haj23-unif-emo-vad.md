Unifying Emotion Analysis Datasets using Valence Arousal Dominance (VAD)
Mo El-Haj, Ryutaro Takanami
Conference on Language, Data and Knowledge 2023


# Abstract

* This paper presents a novel approach to unifying various emotional datasets
  using the Valence Arousal Dominance (VAD) framework
* Emotion analysis lacks large, standard, and unified datasets
* we map diverse emotions from different datasets into four categories: joy,
  anger, fear, and sadness using the VAD framework
  * This process creates multidimensional emotional scores that are consistent
    across datasets, regardless of the number of emotions included. By unifying
* we address “weak emotions” by annotating such instances with a neutral VAD
  * Sentences that contain conflicting emotions or those that do not exhibit a
    clear or strong emotional response are referred to as weak emotion sents
  * VAD can detect and provide a more nuanced label by assigning a score range
* we train a BERT model on the combined data and
  improve the performance of emotion detection

# 2 Related work

* VAD model as a way to detect and unify different emotion datasets
  (Kulkarni and Bhattacharyya, 221 2021; Luengo+, 2010)
  * Manasi Kulkarni and Pushpak Bhattacharyya. 2021
    Retrofitting of pre-trained emotion words with vad-dimensions and the
    plutchik emotions
    ICON’21
  * I Luengo, E Navas, I Odriozola, I Saratxaga, I Hernaez, I Sainz, D Erro
    Modified ltse-vad algorithm for applications requiring reduced silence
    frame misclassification. In
    LREC 2010

# 3 Datasets

* we use five different datasets mainly focusing on text written in English
  * Four of the studied datasets are annotated with coarse-grained categorical
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

## 3.3 WASSA-2017 Shared Task on Emotion Intensity is a dataset containing

* 4,636 manually annotated tweets, categorized into
* four emotions: Anger, Fear, Joy, and Sadness (Mohammad & Bravo-Marquez, 2017)
* The authors gathered tweets containing emotional words representing each
  category
  * The emotional words were chosen using Roget’s Thesaurus (Chapman+, 1977)
* annotated using crowd-sourcing. WASSA-2017 is a useful dataset for emotion

## 3.4 SemEval-2017 Task 4 A (Polarity) is a dataset

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

* For datasets, such as SemEval-2018 and SSEC (Section 3.1), which are
  annotated with multiple categorical emotions in a single sentence, we average
  the VAD values of each emotion to obtain the overall VAD value of that
  sentence before BERT model training.

* To account for neutral, we set the intermediate value in VAD space, 500, for
  sentences without any labels.
  * as we demonstrate later in Experiment 2 (Section 5.2).

* For the EmoBank dataset (Section 3.5), the preexisting VAD values range
  between 1 and 5 points, which is different from our VAD scale -> scaled
* text: removing mentions and URLs, as they are considered unrelated to

# Experiments

## 5.1 Experiment 1: Predicting Categorical Emotions

* calculating the Euclidean Distance between the predicted VAD scores
  and the VAD scores of each of the four emotions as labeled in WASSA

## 5.2 Experiment 2: Detecting Weak Emotions

* we set polarity emotion thresholds for the V-dimension at 300 and 700

# Conclusion

* Experiments 1 and 2 demonstrate the benefits of t raining with larger
  emotion-based datasets
  * suggest that it is possible to predict a wider range of emo expressions
  * polarity analysis in Experiment 2 further support this conclusion
  * also predict weak emotions, which are often overlooked by sentiment anal
* future work, it is expected that
  * increasing the number of datasets used in training will result in improved
