FEEL-IT: Emotion and Sentiment Classification for the Italian Language
Federico Bianchi, Debora Nozza, Dirk Hovy
EACL | WASSA Workshop on ... Subjectivity, Sentiment and Social Media Anal 2021

# Abstract

* more nuanced information [than sentiment]: is the post negative because the
  user is angry or sad? An abundance of
* approaches for these tasks treat only one of the tasks. We introduce
* FEEL-IT, a novel benchmark corpus of Italian Twitter posts annotated with
  * four basic emotions: anger, fear, joy, sadness (Ekman, 1992
  * By collapsing them, we can also do sentiment analysis. We
  * first Italian dataset with a broad topic and domain coverage for emotion and
    sentiment classification. Beyond releasing benchmark results on FEEL-IT, we
* evaluate our corpus on benchmark datasets for
  * both emotion and sentiment classification, obtaining competitive results. We
  * recent neural models trained on our corpus for emotion recognition on the
  * MultiEmotions-It dataset (Sprugnoli, 2020).  It contains
    * comments on music videos and advertisements posted on YouTube and Facebook
  * sentiment classification
    * by collapsing emotions
    * on the SENTIPOLC16 benchmark dataset (Barbieri+ 2016). It comprises
      * both general and political topics.  The best-performing models are
    * we obtain SOTA performances on the current benchmark for Italian sentiment

# Intro

* detecting emotion in text is essential for analyzing people’s position towards
  * advertising campaigns and customer satisfaction measurement (Ahmad+ 2020)
  * political campaigns and discourse (Huguet Cabot+ 2020). Emotion and
  * crisis management or emergency scenarios (Stowe+ 2016; Desai+ 2020)
* benchmark datasets have been proposed for
  * English
    (Calefato+ 2017; Abdul-Mageed and Ungar, 2017; Akhtar+ 2019, inter alia)
  * other languages, such as
    German (Troiano+ 2019), Chinese (Wang+ 2018), Spanish (Navas-Loro and
    Rodrı́guezDoncel, 2019), Italian (Barbieri+ 2016; Sprugnoli, 2020), and
    multiple languages in shared tasks (Mohammad+ 2018; Pontiki+ 2016).a
* shotcomings
  * usually collected via hashtags and emojis for distant supervision
    (AbdulMageed and Ungar, 2017; Mohammad, 2012; Pak and Paroubek, 2010;
    Lamprinidis+ 2021)
    * noisy training data (Bing+ 2015)
  * very specific topics (Khanpour and Caragea, 2018; Chang+ 2018; Nozza+ 2017)

# 2 Data Collection and Annotation

## Corpus Analysis

* Table 1 shows the label distribution of the FEEL-IT corpus for the four emos
  * Examples for each class are shown in Table 2
* imbalanced
  * Similar to other realistic emotion classification datasets
    (Sprugnoli, 2020; Mohammad+ 2018; Nozza+ 2017; Mohammad, 2012), the dataset
  * distribution is similar to the SemEval-2018 Task 1 dataset (Mohammad+ 2018),
    * anger and joy account for the majority of tweets, and
      fear is the least frequent emotion. 3 In FEEL-IT,
* vary both with respect to topic domains and time
  * Topic domains ranges from
    health (#covid19, #mascherina/mask), sports (#F1, #Juventus), social issues
    (#scuola/school), TV shows (#GFvip, #pomeriggio5), individuals (#DiMaio,
    #Suarez), generic targets (#negazionisti/negationists)
  * Each topic is associated with a time range that greatly varies with subject
    * TV shows are cited when they are broadcast, e.g., #domenicalive, literally
      Sunday live is mainly commented on Sunday.  Some events, like
    * soccer matches or celebrity birthdays, are mentioned only one day, e.g.,
    * COVID-19 are present every observed day, with some
      peaks for specific events (e.g., 2nd October, Trump testing positive)

# 3 Experiments

## 3.1 Emotion Classification

* we use the Italian BERT model UmBERTo trained on Commoncrawl ITA. 4 As the
* first experimental condition, we fine-tune the UmBERTo model for the task of
  emotion classification with the considered training data (UmBERTo-FT)
* three approaches to represent tweets:
  * We collect pre-trained UmBERTo representations using average pooling of the
    last layer (UmBERToPT);
  * we use an Italian word2vec model (W2V) 5 and create the representation of
    the tweet as the average of the word embeddings;
  * we use a TF-IDF baseline with bi-grams to represent tweets.  To make
  * TF-IDF and W2V: we apply a
    * pre-processing pipeline to the text:
      * replace URLs and mentions with unique tokens;
      * replace emojis with a description of the emoji (Leonardelli+ 2020),
      * split hashtags on camel case (#HappyBirthday becomes Happy Birthday);
      * remove punctuation. Given the representations, we use
  * logistic regression with a soft-max and with
    instance-weight balancing for classification
  * 10-fold cross-validation setting
  * Most Frequent Class (MFC) as the baseline method

## Results

* The only emotion for which UmBERTo-FT obtains lower equal to TF-IDF is fear.
  * the least frequent class in the dataset and, therefore, the more difficult
    to capture. The different prediction behavior on this class is also why the
    large difference in precision in Table 3.  Indeed, precision for the class
    fear is 0.76 for TF-IDF, 0.55 for UmBERTo-FT, and 0.33 for UmBERTo-PT, while
    recall is 0.38, 0.52, and 0.53, respectively.  This discrepancy means that,
  * while TF-IDF is more cautious on assigning the label fear, UmBERTo-FT and
    UmBERTo-PT have a high number of false positives (see Appendix B for
    confusion matrices). From a 
* qualitative perspective, we see that 
  * many of these false-positive tweets could be associated with fear, even if
    the most prevalent emotion is anger or sadness. This correspondence
  * tweet authors tend to communicate their fears by other, less intimate, emos.
    Examples are “Siete un branco di egoisti che pensa solo al proprio,
> You are a bunch of selfish people who only think about themselves, not caring
> about putting everyone else’s life at risk) and “Ogni giorno compilo il mio
 
> Every day I fill an excel file on the situation in Veneto...and every day I
> close it thinking “Let’s hope that tomorrow we are going to have more
> encouraging data

## 3.2 Sentiment Analysis 4

* We test on SENTIPOLC16 (SP16, Barbieri+ 2016) to evaluate the performance of
* We collapsed the FEEL-IT classes into 2 by mapping joy to the positive class
* We use the 
  * fine-tuned UmBERTo model (UmBERTo-FT) and the 
  * logistic regression classifier applied to its representations (UmBERTo-PT).  
* SP16 also comes with a training set. We fit a classifier on this data to see
  whether it is better to train on FEEL-IT or SP16. Eventually, we also combine
  the two datasets to see if we can get the best of both worlds. 
* SP16 comprises tweets that could be both positive and negative; in our
  * we exclude the tweets that were labeled both positive and negative. Thus,

### Results

* While FEEL-IT contains roughly half of the tweets that SP16 has, the
  performance obtained with FEEL-IT on the SP16 test set is the best.
  * UmBERTo-FT leads to narrowing the differences between performance. 
* This result confirms that our dataset can 1) be used for sentiment analysis
  * we obtain SOTA performances on the current benchmark for Italian sentiment
* the combination between SP16 and FEEL-IT brings 
  good recall, with a slight drop in Precision and F1-score.

# 4 Use-cases: COVID-19 and MultiEmotions-It

* models trained on FEEL-IT and tested on two topic-specific datasets:
  * MultiEmotions-It (Sprugnoli, 2020) and
    * a linguistic resource for Italian which comprises
    * comments of music videos and advertisements posted on YouTube and Facebook
    * Each text is manually annotated according to four different dimensions:
      i.e., relatedness, opinion polarity, emotions, and sarcasm.  This dataset
    * differs from FEEL-IT both in terms of topic variety and considered social
      media
    * from the emotion classes considered in ME, we removed the ones not
      pertaining to our set of emotions. After this process, we are left with
      304 comments.  As before, we pick UmBERTo-FT and UmBERTo-PT as our
      champion models. To give a point of reference, we also show the Most
      Frequent Class (MFC) baseline results
  * a dataset of 662 tweets about COVID-19.  MultiEmotions-It (ME, Sprugnoli,

## Results. Table 6 shows that training on FEEL-IT brings

* stable performance even on datasets from different contexts. Note that the
* MFC accuracy is high because
  both datasets contain a wide range of emotions annotated as anger

# 5 Related Work

* Italian. Indeed, currently,
  * no general-purpose dataset for emotion recognition has been proposed for the
  * a dataset for emotion recognition limited to Youtube and Facebook comments
    (Sprugnoli, 2020), and one
  * for sentiment analysis SENTIPOLC16 (Barbieri+ 2016). We used these datasets
* English: Abdul-Mageed and Ungar (2017) proposes EmoNet, an English emotion
  * collected using a keyword-based approach (e.g., tweets are retrieved using
    #happy as a marker for joy). The authors have obtained high accuracy with
  * we approach the problem annotating manually and without distant supervision
  * EmoTxt (Calefato+ 2017) is an open-source toolkit for emotion prediction
    * love, joy, surprise, anger, sadness, and fear
  * Nozza+ (2017) propose a English corpus of tweets that comprises
    * five different views for each message, i.e
      subjective/objective, sentiment polarity, implicit/explicit, irony, emoton
* multiple languages
  * Lamprinidis+ (2021) introduce a novel dataset extracted from Facebook posts
  * Troiano+ (2019) introduce a dataset in two languages, English and German,
    obtained through crowd-sourcing
* Akhtar+ (2019) propose a multi-model architecture that
  * combines visual, auditory, and text information for both
    emotion and sentiment prediction in English

# 6 Conclusions

* Future work: extension of this dataset to other emotions and languages
