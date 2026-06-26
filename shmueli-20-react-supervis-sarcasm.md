Reactive Supervision: A New Method for Collecting Sarcasm Data
Boaz Shmueli, Lun-Wei Ku, Soumya Ray
EMNLP 2020

https://github.com/bshmueli/SPIRS

# Abstract

* reactive supervision, a novel data collection method that
  utilizes the dynamics of online conversations to overcome limitations
* a first-of-its-kind large dataset of tweets
  with sarcasm perspective labels and new contextual features, the dataset is

# 1 Intro

* Oprea and Magdy (2019)
  * intended sarcasm (by the author) vs. perceived sarcasm (by the reader)
    in the context of sarcasm detection tasks. The training of models for these
  * Twitter becoming a major source due to its popularity as a social network as
    * huge amounts of conversational text its users generate. Previous works
  * three methods for collecting sarcasm data:
    distant supervision, manual annotation, and manual collection
  * Distant supervision automatically collects “inthe-wild” sarcastic tweets by
    leveraging author∗ generated labels such as the #sarcasm hashtag (Davidov+
    2010; Ptáček+ 2014). This method generates large amounts of data at low
    cost, but labels are often noisy and biased (Bamman and Smith, 2015)
  * manual annotation asks humans to label given tweets as sarcastic or not
    * finding sarcasm in a large corpus is “a needle-in-ahaystack problem”
      (Liebrecht+ 2013), manual annotation can be
      ~> combined with distant supervision (Riloff+ 2013). Still,
    * low inter-annotator reliability is often reported (Swanson+ 2014),
      resulting not only from/but also from
      * the subjective nature of sarcasm but also the lack of
      * cultural context (Joshi+ 2016)
  * w method w perspective
    * distant supervision collects intended sarcasm, while
    * manual annotation can only collect perceived sarcasm
  * manual collection, humans are asked to gather and report sarcastic texts,
    either their own (Oprea and Magdy, 2020) or by others (Filatova, 2012)
  * both manual methods are slower and more expensive than distant supervision,
* we propose
  * reactive supervision, a novel conversation-based method that offers
    automated, high-volume, “inthe-wild” collection of
    high-quality intended and perceived sarcasm data. We use our method to
  * the SPIRS sarcasm dataset

# 2 Reactive Supervision

* cue tweets
  * a reply that highlights sarcasm in a prior tweet
  * frequent in online conversations
  * Figure 1 (left panel) shows a typical exchange on Twitter:
    * C posts a sarcastic tweet
    * Unaware of C’s sarcastic intent, B replies with an oblivious tweet
    * Lastly, A 1 alerts B by replying with a cue tweet (She was just being s!)

|Person |Example Cue Regular   |Expression                      |Example Author Seqs|
|-------|----------------------|--------------------------------|-------------------|
|1st    |`ˆA[ˆA]* (A)[ˆA]*$`   |I was only being sarcastic lol  |ABA, ABAC, ABAB    |
|2nd    |ˆAA* (B)A*$`          |Why are you being sarcastic?    |AB, ABA, ABAA      |
|3rd    |ˆAA*B[AB]* (C)[AB]*$` |She was just being sarcastic!   |ABC, ABCB, ABAC    |

* 3rd-person cue with author sequence ABC
  `User_C` The app we use for work emails is not working
  I feel terrible about this!  `User_B` Not your fault. Do not feel guilty!  `User_A`
  Replying to @`User_B` She was just being sarcastic!  `User_C`
* 1stperson cue with author sequence ABAC
  Just watched Forrest Gump. Great film!  `User_A` So Tom Hanks can act!  Who
  knew???  `User_B` Literally everyone!!!  `User_A` Replying to @`User_B` I was
  being sarcastic lol

* To capture sarcastic tweets, we thus
  * first search for cue tweets (using the query phrase “being sarcastic”, often
    used in responses)
  * then carefully examine each cue tweet to identify the corresponding
    sarcastic tweet
  * identify the sarcastic tweet among {t n−1 , . . . , t 1 }. 
  * We first examine the personal subject pronoun used in the cue (I, you, s/he)
    and map it to a grammatical person class (1st, 2nd, 3rd). This informs us
    whether the sarcastic author is also the author of the cue (1st), its
    addressee (2nd), or another party (3rd)
  * heuristic to identify the sarcastic tweet
  * eg for a 1st-person cue tweet, the sarcastic tweet must also be authored by
    * If the earlier tweets in T contain exactly one tweet from A, it is
    * Otherwise, the sarcastic tweet cannot be unamb, entire thread is discarded
    * formalized: the author sequence to match the regular expression 
  * 2nd and 3rd-person cues produce corresponding rules and patterns.
* Table 1 lists the three person classes, corresponding regular expressions, and

## 2.2 Advantages

### Additional Tweet Types. Along with each sarcastic tweet, 

* we collect the oblivious tweet (the unsuspecting reply to the sarcastic tweet)
  when available.
* we are the first work that identifies and collects oblivious texts, a new type
* can improve research on the (mis)understanding of sarcasm, with 
* applications such as automated assistive systems 
  * for people with emotional or cognitive disabilities. 
* If the sarcastic tweet is a reply, we also capture the eliciting tweet, which
* more details in Appendix A.

### Extraction of Semantic Relations. Being able to identify the 

* various tweets types (cue, oblivious, sarcastic, eliciting), 
* reactive supervision can be understood more abstractly as 
  capturing semantic dependency relations between utterances 3 . Reactive
* can thus be useful in the context of discourse analysis.

### Context-Aware Annotation. Our method uses cues from 

* thread participants, who therefore serve as de facto annotators. As
  * they are familiar with the conversation’s context, 
  * <~> external annotators, who are often unfamiliar with the conversat context 
    due to cultural and social gaps (Joshi+ 2016)

### Sarcasm Perspective: both intended and perceived 

* Previous datasets contain either intended or perceived (Oprea and Magdy, 2019)
* Our method identifies and labels both intended and perceived sarcasm within
* 1st-person cue tweets capture intended sarcasm, while 
* 2nd~ and 3rd-person cues capture perceived sarcasm. We label a tweet as
* perceived sarcasm when at least one reader posts a cue tweet. Detecting
* useful, for example, for training algorithms that flag sensitive texts which
  might be (mis)perceived as sarcastic (even by a single reader).

### Faster Data Collection than `#sarcasm`

* We tested González-Ibáñez+ (2011)’s distant supervision method of collecting
  tweets ending with #sarcasm and related hashtags, fetching 
  171 tweets/day on average.
* During the same period, our method collected 312 tweets/day on average ie +82%

### Summary of Advs: automated, in-the-wild, context-aware, intended & perceived

# 3 SPIRS Dataset

* a 4-step pipeline (see Algorithm 1):
  1. Fetch calls the Twitter Search API to collect cue tweets, using “being
     sarcastic” as the query.
  2. Classify is a rule-based, precision-oriented classifier that 
    classifies cues as 1st-, 2nd-, or 3rd-person according to the pronoun (I,..)
    * If !=1 pronoun found, or negation words are present, the cue is discarded
  3. Traverse calls the Twitter Lookup API to retrieve the thread by 
    starting from the cue tweet and repeatedly fetching the parent tweet 
    up to the root tweet.
  4. Match matches the thread’s author sequence with the corresponding reg exp
* the sarcastic tweet is identified and saved along with the cue tweet, as well
  as the eliciting and oblivious tweets when available.
* The pipeline collected 65K cue tweets containing the phrase “being sarcastic”
  * threads during 48 days in October and November 2019. 
  * 77% of the cues were classified as unknown and discarded, 
  * ending with 15 000 English sarcastic tweets. In addition, 
  * 10 648 oblivious and 9 156 eliciting tweets were automatically captured.
  * Table 3 summarizes the SPIRS dataset. We added 
  * 15 000 negative instances by sampling random English tweets 
    captured during the same period, discarding tweets with sarcasm-related
    words or hashtags.

| Person | Perspective | Sarcastic | Oblivious | Eliciting |
|--------|-------------|-----------|-----------|-----------|
| 1st    | Intended    | 10 300    | 9 065     | 8 075     |
| 2nd    | Perceived   | 3 000     | —         | 842       |
| 3rd    | Perceived   | 1 700     | 1 583     | 239       |
| Total  |             | 15 000    | 10 648    | 9 156     |

* Sarcastic tweets can be either root tweets or replies. We found that the
  * majority of intended sarcasm tweets are replies (78.4%), while 
  * the majority of perceived sarcasm tweets are root tweets (77.0%). 
  * Further dataset statistics on author sequence and tweet position: Apps B, C

## Reliability. To assess our method’s reliability in capturing sarcastic

* we manually inspected 200 random sarcastic tweets, along with their cue
  from each person class. The accuracy of sarcastic tweet labeling was high:
* accuracy is 98.5%, 98%, and 97% for 1st-, 2nd-, and 3rd-person cues , respect
* Table 4 shows samples of correct and incorrect cue tweet classifications.

# 5 Experiments and Analysis

* We present baselines for three tasks: 
  * sarcasm detection, 
  * sarcasm detection with conversation context, and 
  * sarcasm perspective classification, a new task enabled by our dataset.

## 4.1 Sarcasm Detection

* three models:
  * CNN (100 filters with a kernel size 3) and BiLSTM (100 units), both
    max-pooled and Adam-optimized with a learning rate of 0.0005; data was
    preprocessed as described in Tay+ (2018); the embedding layer was pre-
    loaded with GloVe embeddings (Twitter data, 100 dimensions) (Pennington+)
  * We also fine-tuned a pre-trained base uncased BERT model (Devlin+ 2019). 
* For all three models, we used 5-fold cross-validation for training, holding
* Results (Table 5, top panel)
  * BERT is the best performing model, with 70.3% accuracy.
* We compared SPIRS’s classification results to the Ptáček+ (2014) dataset,
  * Ptáček is commonly used in sarcasm benchmarks. We found that 
  * Ptáček’s accuracy is significantly higher (86.6%). We posit that it is
  * may be because sarcasm is confounded with locale in the Ptáček: 
    * sarcastic tweets are from worldwide users; non-sarcastic tweets are from
    users near Prague, and thus classifiers learn features correlated to locale
  * We tested our hypothesis by replacing our negative samples with Ptáček’s,
    which indeed resulted in boosting the accuracy by 19.1%.

## 4.2 Detection with Conversation Context

* adding eliciting and oblivious tweets to the model. As far as we know, 
* we are the first sarcasm-related task that uses oblivious texts. 
* Our model concatenated the outputs of three identical 100-unit BiLSTMs (one
  per tweet: sarcastic, oblivious, eliciting) before feeding it into dense
  layers for classification.
* Tweets without surrounding context were not used in this task. 
* Results (Table 5 middle panel): accuracy was 74.7% (MCC 0.398)

### Ablation study to identify the contribution of each tweet type. We found

eliciting tweets reduces accuracy by 0.5% and MCC by 0.026.
oblivious tweets, however, lowered accuracy by 3.4% to 71.4%, and the 
  MCC dropped significantly by 31%, from 0.398 to 0.275.
* This illustrates the importance of the new oblivious text data provided in the

## 4.3 Perspective Classification

* a new task to classify a sarcastic text’s perspective: intended vs. perceived.
  * results are displayed in Table 5 (bottom panel), demonstrating the
    superiority of BERT over the other models, with an 
    accuracy of 68.2% and MCC of 0.366.

### Error Analysis We carefully examined the errors to analyze the causes of

* misclassified-as-intended tweets 
* eg, “You’re lost!”, “Omg that was so funny” had, on average, almost half the
  word count of misclassified-as-perceived tweets (17.2 vs. 27.8).
* ie longer, more informative texts make sarcasm easier to perceive; hence,
  short perceived sarcasm or long intended sarcasm might introduce errors.
* Fig 2: Analysis of the dataset’s word count distribution supports our hypoth
* Looking for further error sources, we inspected 
  short intended tweets that were misclassified, for example 
  “great friends i have!” and “My mom is so beautiful”.
  * can be read as root tweets and not as replies, yet 
    most intended sarcasm tweets are replies while 
    most perceived sarcasm tweets are root tweets (see Section 3). We
  * ie the classifier may learn discourse-related features (original tweet vs.
    reply tweet), which can lead to these errors.
* future: Further anal of sarc perspective and its interplay with sarc pragmat

# Conclusion

* Reactive supervision generalized, By modifying the cue tweet selection
  criteria, to related domains such as sentiment analysis and emotion detection,
  * advancing the quality and quantity of data collection and offering new
