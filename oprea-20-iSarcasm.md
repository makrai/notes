iSarcasm: A Dataset of Intended Sarcasm 
Silviu Oprea, Walid Magdy 
ACL 2020

https://github.com/silviu-oprea/iSarcasm

# Abstract

* intended and perceived sarcasm in the context of textual sarcasm detection.
* limitations of previous labelling methods in capturing intended sarcasm and
* we introduce the iSarcasm dataset of tweets labeled for sarcasm directly by
  their authors.
* the SOTA sarcasm detection models on our dataset showed low performance
  compared to previously studied datasets, which indicates that these 
  * old datasets might be biased or obvious and 
  * sarcasm could be a phenomenon under-studied computationally thus far. By
    providing the iSarcasm dataset, we aim to encourage future NLP research to
    develop methods for detecting sarcasm in text as intended by the authors of
* we demonstrate other labelled settings to be sub-optimal

# 1 Intro

* we asked Twitter users to provide both sarcastic and non-sarcastic tweets that
  they had posted in the past.
* For each sarcastic tweet, we asked them to explain 
  why it was sarcastic and
  how they would convey the same meaning non-sarcastically. Labels were thus
  implicitly specified by the authors themselves. We implemented 
* restrictive quality control to exclude spurious survey responses. We then
* a trained linguist to 
  * manually check the sarcastic tweets and further 
  * label them into the subcategs of sarcasm defined by Leggitt and Gibbs (2000)
* We further collected third-party sarcasm labels for the tweets in iSarcasm
  from workers on a crowd-sourcing platform. 
  * [crowd-sourced] annotation for sarcasm has been conducted before
    (Filatova, 2012; Riloff+ 2013; Abercrombie and Hovy, 2016), but 
    no studies checked the ability of the annotators to capture the actual
    sarcasm meant by the authors. On iSarcasm, 
  * annotators recognise author labels with an F-score of 0.616. This indicates
    that sarcasm is a subjective phenomenon, challenging even for humans to
    detect. Further, it demonstrates that using third-party annotators to label
    texts for sarcasm can lead to inaccurate labels.
* SOTA sarcasm detection models (Tay+ 2018; Hazarika+ 2018; Van Hee+ 2018) and
  tested them on iSarcasm, to investigate their effectiveness in capturing
  sarcasm as intended by the authors. While these models achieve 
  * on prev datasets, F-scores reaching 0.874 on existing datasets, they yield 
  * a maximum F-score of 0.364 on iSarcasm, suggesting that 
  * ie previous datasets might be biased or obvious. This highlights the
* iSarcasm contains 4,484 English tweets, each with an associated intended
  sarcasm label provided by its author, with 
  * a ratio of roughly 1:5 of sarcastic to non-sarcastic tweets. 
  * Each sarcastic tweet has an extra label indicating the category of sarcasm
  * public for research purposes

# 2 Background 

## 2.1 Intended and Perceived Sarcasm 

* The way sarcasm is used can vary across sociocultural backgrounds. 
* Dress+ (2008) notice that members of 
  * collectivist cultures tend to express sarcasm in a more subtle way 
    than individualists.
  * gender differences. Females seem to have a more self-deprecating sarcasm
* Rockwell and Theriot (2001) find 
  some cultures to associate sarcasm with humour more than others.
* cultures who do not use sarcasm at all, such as the Hua, a group of New Guinea
  Highlanders (Attardo, 2002).
~> an utterance intended sarcastic by its author might not be perceived as such
by the audience (Jorgensen+ 1984). 
  * Conversely, the audience could perceive the utterance as sarcastic, even if
    it was not intended as such.
* intended and perceived sarcasm, also referred to as encoded and decoded
  pointed out in previous research (Kaufer, 1981; Rockwell and Theriot, 2001).
  * not been considered in a computational context thus far when building
* social media posts that can reach audiences of unprecedented sizes.
  * opinion mining <~ communicative intention of the author, for tasks such as
  * hate-speech detect <~ possible interpretations by sociocultural backgrounds

## 2.2 Sarcasm Datasets

* Two methods were used so far to label texts for sarcasm: distant supervision
  and manual labelling.
* Distant supervision This is by far the most common method. Texts are
  * lásd az iSarcasmEval cikket
  * Table 1 gives an overview of datasets constructed this way, 
    along with tags or accounts they associate with sarcasm.
  * Section 3, the labels produced can be very noisy.
* Manual labelling An alternative to distant supervision is collecting texts and
  * Filatova (2012) asks annotators to find pairs of Amazon reviews where one is
    ~> 486 positive and 844 negative examples.
  * Abercrombie and Hovy (2016) annotate 2,240 Twitter conversations, ending up
    with 448 positive and 1,732 negative labels, respectively. 
  * Riloff+ (2013) use a hybrid approach, where 
    * they collect 1,600 tweets that contain #sarcasm or #sarcastic, and 
    * another 1,600 without these tags. They remove such tags from all tweets and
    * human annotators for final labelling. We call this the Riloff dataset. A
  * Van Hee+ (SemEval 2018) who recently presented their dataset as part of a
    * balanced dataset of 4,792 tweets.

## 2.3 Sarcasm Detection Models text-based models and contextual models.

### Text-based models consider linguistic incongruity (Campbell and Katz, 2012)

* Riloff+ (2013) look for a positive verb in a negative sentiment context.
* Bharti+ (2015) search for a negative phrase in a positive sentence. ()
* Hernández Farı́as+ (2015) measure semantic relatedness between words using
  WordNet-based similarity. 
* Joshi+ (2016b) use the cosine similarity between word embeddings.
* Tay+ (2018) uses a neural intraattention mechanism to capture incongruity.

### Contextual models utilize information from both the text and the context of

* context eg author information. There is a limited amount of work in this
  * Twitter data, Bamman and Smith (2015a) represent author context as
    manually-curated features extracted from their historical tweets.
  * Amir+ (2016) merge all historical tweets into one document and use the
    Paragraph Vector model (Le and Mikolov, 2014) to build an embedding of that
  * Hazarika+ (2018) extract additional personality features from the merged
    historical tweets with a model pre-trained on a personality detection
    corpus. Using the same strategy, 
  * Oprea and Magdy (2019) build separate embeddings for each historical tweet
    and identify author context with their the weighted average.

# 3 Limitations of Current Labelling Methods

* We demonstrate them empirically on the Riloff dataset (Riloff+ 2013), 
  which uses a hybrid approach for labelling.

## 3.2 Limitations of Manual labelling

* Joshi+ (2016a) provide more insight into this problem on the Riloff dataset.
  * initially labelled by Americans, to be 
  * In the Joshi project, labelled by Indians who are trained linguists. They
  * higher disagreement between Indian and American annotators, than between
  * higher disagreement between pairs of Indian annotators, ie uncertainty, than
* the Riloff dataset, which is published as a list of labelled tweet IDs. 
  * We could only retrieve 1,832 tweets, the others being removed from Twitter.
  * We looked at the agreement between the presence of tags and manual
    annotation. Table 2 shows the results. We notice that 
    * 58% of the tweets that contained the predefined hashtags were labeled
      non-sarcastic. This disagreement between distant supervision and manual
      annotation provides further evidence to doubt the ability of the latter to
      capture intended sarcasm, at least not the flavor that distant supervision
* We could not perform the same analysis on the SemEval-2018 dataset because
  only the text of the tweets is provided, hashtags are filtered out, and tweet
  IDs are not available.

# 4 Data Collection

## 4.1 Collecting Sarcastic Tweets

* We designed an online survey where we 
  asked Twitter users to provide links to one sarcastic and three non-sarc
  tweets that they had posted in the past, on their timeline, or as replies to
  other tweets.
* explanation: in full English sentences, an explanation of why it was sarcastic
* a rephrase that would convey the same message non-sarcastically. This way, 
  * we aimed to prevent them from misjudging the sarcastic nature of their
    previous tweets under experimental bias.
* we asked for their age, gender, birth country and region, and current country
  and region. We use the term _response_ to refer to all data collected from one
* quality control steps:
  * The provided links should point to tweets posted no sooner than 48 hours
  * All tweets in a response should come from the same account;
  * Tweets cannot be from verified accounts or accounts with more than 30K
    followers to avoid getting tweets from popular accounts and claiming to be
  * Tweets should contain at least 5 words, excluding any hashtags and URLs;
  * Links to tweets should not have been submitted in a previous response;
  * Responses submitted in less than three minutes are discarded.  
  * Each contributor agreed on a consent form before entering the survey, which
    * only the IDs of the tweets they provide will be made public, to allow them
      to delete a tweet anytime and thus be in control of their own privacy in
    * we may collect public information from their profile, which is accessible
* multiple crowdsourcing platforms, including Figure-Eight (F8), Amazon
  Mechanical Turk (AMT) and Prolific Academic (PA) 3 .
  * no quality responses from F8. In fact, 
  * AMT stopped our job, considering that getting links to personal tweets of
  * We collected the majority of responses on PA.

## 4.2 Labelling Sarcasm Categories

* We then asked a trained linguist 
  to inspect each collected sarcastic tweet, along with the explanation provided
  by the author and the non-sarcastic rephrase, in order 
  to validate the quality of the response and further 
  assign the tweet to one of the following categories of ironic speech 
  defined by Leggitt and Gibbs Jr (2000):
1. sarcasm: tweets that contradict the state of affairs and are critical towards
   an addressee;
2. irony: tweets that contradict the state of affairs but are not obviously
   critical towards an addressee;
3. satire: tweets that appear to support an addressee, but contain underlying
   disagreement and mocking;
4. understatement: tweets that undermine the importance of the state of affairs
   they refer to;
5. overstatement: tweets that describe the state of affairs in obviously
   exaggerated terms;
6. rhetorical question: tweets that include 
  a question whose invited inference (implicature) is obviously contradicting
  the state of affairs;
7. invalid: tweets for which the explanation provided by their authors is
   unclear/unjustified.  These were excluded from the dataset.

## 4.3 Collecting Third-Party Labels

* we replicate the manual annotation approach presented in previous research
  (Riloff+ 2013; Abercrombie and Hovy, 2016; Van Hee+ 2018) on the test set, and
  compare the resulting perceived sarcasm labels to the intended sarcasm labels
  collected from the authors of the tweets. Our aim was 
  to estimate the human performance in detecting sarcasm as intended by the
* we aimed to reduce noise caused by variations in how sarcasm is defined 
  across socio-cultural backgrounds.
* Previous studies have shown gender (Dress+ 2008) and country (Joshi+ 2016a) to
  be the variables that are most influential on this definition.
  ~> we made sure all annotators shared the same values for these variables. 
* We used PA to collect three annotations for each tweet in iSarcasm, and
  considered the dominant one as the label, which follows the same procedure as
  with building the Riloff dataset (Riloff+ 2013).

# 5 Data Statistics and Analysis

## 5.1 iSarcasm Dataset

* We received 1,236 responses to our survey. Each response contained four tweets
  labelled for sarcasm by their author, one sarcastic and three nonsarc
  * filtered tweets using the quality control steps described in Section 4, and
  * disregarded all tweets that fall under the invalid category. The resulting
  * iSarcasm, containing 777 sarcastic and 3,707 non-sarcastic tweets. For each
  * author’s explanation as to why it is sarcastic, as well as how they would
    rephrase the tweet to be non-sarcastic. The 
  * average length of a 
    * tweet is around 20 words. Figure 1 shows the tweet length distribution
    * explanations 21 words, and of rephrases 14 words.
* Over 46% of the tweets were posted in 2019, over 83% starting with 2017, and
  the earliest in 2008.
* contributors: 56% the UK and 41% the US, while 3% other eg Canada & Australia. 
  * 51% are females, and 
  * over 72% are less than 35 years old.
* Figure 2 shows the age and gender distributions across contributors.
* hashtags #sarcasm, #sarcastic, and others often used to mark sarcasm in
  previous distant supervision datasets. 
  * None of our tweets contains any of those tags, which confirms one of our
  * tags might capture only one flavor of sarcasm, not sarcasm present on social
* Tab 3: categs of sarcasm, assigned by the linguist to the sarcastic tweets
  * overall sarcastic 777 
  * non-sarcastic 3,707
  * sarcasm 324
  * irony 245
  * satire 82
  * underst. 12
  * overst. 64
  * rhet. question 50
* Table 4 shows examples of the sarcastic tweets, 
  along with the explanations and rephrases provided by the authors.
* training set and a test set, containing 80% and 20% of the examples at random,
  * tweet IDs along with corresponding intended sarcasm labels. 
  * For sarcastic tweets we also provide the category of ironic speech they
  * we still offer the tweets text along with the explanations and rephrases for
    free for research purposes, under an agreement that protects the privacy of

## 5.2 Detecting Intended Sarcasm: Third-Party Labels for the test set of iSar-

* Cohen’s kappa (κ; Cohen (1960)) as a measure, the pairwise inter-annotator
  agreement (IAA) scores were κ 12 = 0.37, κ 13 = 0.39 and κ 23 = 0.36, which
* ie high subjectivity of the task. We used 
* majority voting to select the final perceived sarcasm label for each tweet.
* Table 5 shows the disagreement between the intended and perceived labels. As
* 30% of the sarcastic tweets were unrecognised by the annotators, while 
* 45% of the tweets perceived as sarcastic were actually not intended to be

# 6 Detecting Intended Sarcasm

* models that have achieved SOTA results on previous benchmark datasets 
* computational models perform poorly in detecting sarcasm in the new dataset,
* the task might be more challenging compared to how it was seen in earlier

## 6.1 Baseline Datasets

* We consider four previously published datasets.
* Two with hybrid
  * Riloff (Riloff+ 2013) and SemEval-2018 (Van Hee+ 2018), were 
  * labeled via a hybrid approach of distant supervision for 
    initial collection and manual annotation for actual labelling. 
* two with distant supervision
  * Ptacek (Ptáček+ 2014) and SARC (Khodak+ 2018), are 
    labeled using distant supervision. As mentioned earlier, 
    we managed to collect 1,832 tweets from the Riloff dataset.
* SemEval-2018 is a balanced dataset consisting of 4,792 tweets. For the 
* Ptáček: we collected 27,177 tweets out of the 50K published tweet IDs.
* SARC consists of Reddit comments. 
  * In a setting similar to Hazarika+ (2018) who publish SOTA results on SARC
    we consider two variants of SARC. 
    * SARC-balanced contains 154,702 comments with the same number of
    * SARC-imbalanced contains 103,135 comments with a ratio of about 20:80

## 6.2 Sarcasm Detection Models

### Riloff and Ptacek datasets 

* We replicate the models implemented in (Tay+ 2018), who report SOTA results on
  Riloff and Ptacek.
  * LSTM first encodes the 1285 tweet with a recurrent neural network with
    * binary softmax layer to output a probability distribution over labels
    * one hidden layer of dimension 100. 
  * Att-LSTM adds an attention mechanism on top of the LSTM, in the 
    * setting specified by Yang+ (2016). In particular, 
    * it uses the attention mechanism introduced by Bahdanau+ (2014), dim = 100.
  * CNN encodes the tweet with a convolutional neural network (CNN) with 100
    filters of size 3 and provides the result to feed-forward network with a
    final binary softmax layer, choosing the most probable label.
  * SIARN (Single-Dimension Intra-Attention Network; Tay+ (2018)) is 
    * the model that yields the best published performance on Riloff
    * assumption that sarcasm is caused by linguistic incongruity between words.
    * intra-attention mechanism (Shen+ 2018) between each pair or words 
      Tao Shen, Tianyi Zhou, Guodong Long, Jing Jiang, Shirui Pan, Chengqi Zhang
      Disan: Directional self-attention network for rnn/cnn-free lang understand
      AAAI 2018
  * MIARN (Multi-Dimension Intra-Attention Network; Tay+ (2018)) reports the
    best results on the Ptacek dataset. 
    * In addition to SIARN, MIARN allows multiple intra-attention scores for
      each pair of words to account for multiple possible meanings of a word
      when detecting incongruity.
    * our implementation sets the dimension of all hidden layers of SIARN and
      MIARN to 100.

### SARC datasets 

* Hazarika+ (2018) report the best results on SARC-balanced and SARC-imbalanced,
* they model both the content of the comments as well as contextual information
  available about the authors.
* we only focus on content modelling, using a convolutional network (3CNN) in a
  setting similar to what they describe. 3CNN uses three filter types of sizes
  3, 4, and 5, with 100 filters for each size.

### SemEval-2018 dataset 

* two types of labels for each tweet: binary, type
  * binary labels that specify whether the tweet is sarcastic or not; and 
  * labels with four possible values, specifying the type of sarcasm present 4 .
  * We use “sarcasm” to mean what they refer to as “verbal irony”.
* Wu+ (2018) report the best results on both tasks with their Dense-LSTM model.
  * H conc S conc sentiment 
  * a sequence of four LSTM layers to compute a hidden vector H. 
  * tweet embedding S computed in advance by averaging embeddings of all words
    inside using the pre-trained embeddings provided by BravoMarquez+ (2016). H
  * sentiment feature vector of the tweet computed in advance using the weka
    toolkit (Mohammad and Bravo-Marquez, 2017), by applying the
    TweetToLexiconFeatureVector (Bravo-Marquez+ 2014) and
    TweetToSentiStrengthFeatureVector (Thelwall+ 2012) filters. 
  * multitask setting on the SemEval dataset (Van Hee+ 2018) to predict three
    * the binary sarcasm label, the types of sarcasm, and the hashtag, if any,
      that was initially used to mark the tweet as sarcastic, 
    * hashtag out of #sarcasm, #sarcastic, #irony and #not. 
  * Wu+ (2018) report an F-score of 0.674 using a fixed dropout rate of 0.3 in
    all layers.
    * F-score of 0.705 by averaging the performance of 10 Dense-LSTM models,
      varying the dropout rate to random values between 0.2 and 0.4. We
  * implement and train it to only predict the binary sarcasm label,
    to make the results on SemEval-2018 and iSarcasm comparable.
* For each previous dataset, we implemented the models reported previously to
  achieve the best performance on that dataset, and made sure our imple-
  mentations achieve similar performance to the published one. This is confirmed
* Table 6, providing confidence in the correctness of our implementations.

## 6.3 Results and Analysis

* Table 7 reports precision, recall and f-score results on the test set of
  iSarcasm using the detection models discussed, alongside third-party annotator
  performance. As shown, 
  * all the models perform significantly worse than humans, who achieve an
    Fscore of only 0.616. 
  * MIARN is the best performing model with a considerably low F-score of 0.364,
    compared to its performance on the Riloff and Ptacek datasets (0.741 and
    0.874 F-scores respectively). 
  * 3CNN achieves the lowest performance on iSarcasm with an F-Score of 0.286
    compared to 0.675 and 0.788 on SARC balanced and imbalanced, respectively.
  * Dense-LSTM achieves 0.318, compared to 0.666 on SemEval2018.
* ie Previous models that achieved high performance in detecting sarcasm on
  datasets sampling perceived sarcasm (third-party labels) or hash-tagged
  sarcasm (distant supervision) have failed dramatically to detect sarcasm as
  meant by its author. This motivates the need to develop more effective methods
  for detecting intended sarcasm. Potentially, building 
* future: models that account for sociocultural traits of the authors (available
  on, or inferred from, their Twitter profiles), or consider other contextual
  elements to judge the sarcasm in our dataset (Rockwell and Theriot, 2001).
* Previous research has considered certain contextual elements 
  (Bamman and Smith, 2015b; Amir+ 2016; Hazarika+ 2018; Oprea and Magdy, 2019),
  but only on sarcasm captured by previous labelling methods.
* new sub-tasks eg sarcasm category prediction, and sarcasm decoding/encoding,
  using information found both in the tweets themselves, and in the explanations
  and rephrases provided by the authors

# 7 Conclusion and Future Work

[done]
