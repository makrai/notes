Transfer Learning Approach for Detecting Psycho Distress in Brexit Tweets
Sean-Kelly Palicki, Shereen Fouad, Mariam Adedoyin-Olowe, Zahraa S. Abdallah
SAC ’21, March 22–26, 2021, Virtual Event, Republic of Korea

# Abstract

* Sentiment analysis has been recently considered as
  an important tool for detecting mental well-being in Twitter
* hE lack of explicit sentences describing the depression/anxiety status
* this paper leverages a transfer learning approach for sentiment analysis to
  measure the non-clinical psychological distress status in Brexit tweets
  * a classifier is trained to identify users with psychological distress and
    * then applied to find signs of distress in an other domain
  * from self-reported psychological distress tweets (source domain)
  * to detect the distress status in Brexit tweets (target domain)
  * domain adaptation technique to decrease the impact of negative transfer
    between source and target domains
  * accuracy of 66% and 62% on the source and target domains, respectively

# 1 Intro

* analysis of social media for studying a wide range of mental health problems
 * [39] Yazdavar, Mahdavinejad, Bajaj, Romine, Sheth, Monadjemi+
   Multimodal mental health analysis in social media
   Plos one 15, 4 (2020), e0226248
  * multidisciplinary: linguistics, computer science, medicine, and psychology
    to use social media to automatically determine the mental state [19, 30]
    * [19] SC Guntuku, DB Yaden, ML Kern, LH Ungar, and JC Eichstaedt
      Detecting depression and mental illness on social media: integrat review
      Current Opinion in Behavioral Sciences 18 (2017), 43–49
    * [30] Michelle Morales, Stefan Scherer, and Rivka Levitan.
      A cross-modal review of indicators for depression detection systems
      Workshop on computational linguistics and clinical psychology 2017
* two major approaches
  * social media to model public mood as it relates to major public events
    * Changes correlated with major political events, natural disasters,
      cultural phenomena, and in the prediction of stock prices [8, 35]
  * clinical approach: using social media and machine learning techniques to
    classify abnormal psychological states (depression, anxiety, PTSD, etc)
    in populations [7, 16]
  * Our research exploits both techniques
    to understand the impact of major Brexit events on the mental well-being
* Automatic detection of non-clinical depressive states (ie psychological
  distress status) in social media political-related contents (tweets)
  * difficult task: no clear posts in which users explicitly share their
    mental health problems, medical diagnosis or depressive thoughts
* we train a supervised learning model on labelled distress tweets and use it
  as a baseline to train Brexit tweets to detect the non-clinical psycho status
  * we introduce a Brexit Distress Index that may serve to characterise levels
    of psychological distress in populations in Brexit related tweets

# 2 LITERATURE REVIEW

## 2.1 Brexit and Psychological Well-Being

## 2.2 Automatically Detecting Mental Health Signals

* Social networks have been used to detect a list of conditions, including:
  Depression, PTSD, Anxiety, Bipolar Disorder, Seasonal Affective Disorder,
  Eating Disorder, Schizophrenia, Suicidal Ideation, Phobias, and others [38]
* [19] reviewed mental health disorder classifiers
  * Support Vector Machine, Regression, and Random Forest can identify patterns
* labelled mental health related data
  * manual labelling by clinical mental health experts,
    getting consent to access patient health records, having individuals
    complete psychometric surveys, and self-declaration by users
* [12] distinguished between ‘diagnosed’ and ’non-diagnosed’ participants, but
  not between Depression and PTSD, using language patterns
  * Using over 13 million tweets from individuals who explicitly stated they
    had been diagnosed with clinical depression or PTSD,
* [14] used a similar data collection strategy to identify mental health
  * found groups of words that classified between Depression, PTSD, and Control
    with 80-90% precision
* [16] users completed a psychometric survey querying signs of depression and
  shared three months of Twitter posts
  * features from the tweets including post sentiment, linguistic style,
    n-grams, proportion of posts with reply, and number of followers
  * depressed users had significantly less Twitter engagement,
    more emotional word related n-grams, negative affect, and less followers
  * These features were then included in a classification model and achieved
    82% precision with 72% accuracy
* identify depression and other mental health conditions from Twitter posts
  * [12] provided a technique to gather open data
    * no details on a method to evaluate unlabelled population level depression
* [16] used proprietary data, they developed a useful technique to
  extract features and analyse tweets to detect signals of mental health issues

## 2.3 Transfer Learning Approach for Sentiment Analysis

* Transfer learning [26] works for classification, regression, and clustering
  * with no or limited labelled data [15]
  * source dataset (D s) and target dataset (D t) must be related [32]
  * particularly if there is poor data availability in a target domain [37]
* especially successful in the field of sentiment analysis
  * [4] applied transfer learning to binary and multi-class sentiment classif
    on the Rakuten product review and Yahoo movie review datasets
    * these methods out-performed task-specific models
  * [11] applied transfer learning for opinion holder bias prediction in an
    example of topic-based real time sentiment analysis
  * [17]: transfer learning to prompt sentiment embedding that portrayed
    sentiment polarity in multiple domains across diverse sentiment tasks
  * applied to social media data: classify positive/negative/neutral sentiment,
    to detect adverse reactions, and to identify irony [1, 15, 40]
* beneficial when combined with rich representations of words
  * particularly when there is a large amount of vocabulary intersection

# 3 PROPOSED METHOD 3

# 4 EXPERIMENTS AND RESULTS 4

# 5 Discussion

* promising transfer learning approaches based on deep learning
  * may be well-suited to this problem [1, 4, 15]
* This research extended upon the work from [16] and [12–14]
  * signals of psychological distress for tweets related to a specific hashtag
  * the distress and Brexit datasets were too dissimilar
    -> a domain adaptation technique was utilised to minimise these differences
* trends compared favourably to major Brexit headlines
  * Other sentiment analysis techniques show spikes in activity related to
    major political, cultural, economic, and natural events [8, 22, 23, 31]
  * time lag between the date of event and the change in public sentiment
* some/other residents expressed  
  * fear and sadness related to leaving the EU
  * anger that it has taken so long for the government to compl
