A Report on the 2020 Sarcasm Detection Shared Task 
Debanjan Ghosh, Avijit Vajpayee, Smaranda Muresan
Fig-Lang 2020

# 1 Introduction

* Sarcasm and verbal irony are a type of figurative language where 
  the speakers usually mean the opposite of what they say. 
  * essential to downstream applications for correctly understanding speakers’
    intended sentiments and beliefs. Consequently, in the last decade, the
* irony and sarcasm detection has attracted a considerable interest 
* usually framed as a binary classification task (sarcastic vs. non-sarcastic)
  * either the utterance in isolation or adding 
    contextual information such as conversation context, author context, visual
    context, or cognitive features (Davidov+ 2010; Tsur+ 2010; GonzálezIbáñez+
    2011; Riloff+ 2013; Maynard and Greenwood, 2014; Wallace+ 2014; Ghosh et
    al., 2015; Joshi+ 2015; Muresan+ 2016; Amir+ 2016; Mishra+ 2016; Ghosh and
    Veale, 2017; Felbo+ 2017; Ghosh+ 2017; Hazarika+ 2018; Tay+ 2018; Oprea and
    Magdy, 2019; Majumder+ 2019; Castro+ 2019; Ghosh+ 2019).
* In this paper, we report on the shared task on sarcasm detection that we
  conducted as part of the 2nd Workshop on Figurative Language Processing
  (FigLang 2020) at ACL 2020. 
  * The task aims to study the role of conversation context for sarcasm
  * Two types of social media content are used as training data for the 
  * two tracks 
    * microblogging platform such as Twitter and 
    * online discussion forum such as Reddit.

* Table 1 and Table 2 show examples of three turn dialogues, where 
  * Response is the sarcastic reply.  
  * Without using the conversation context Context i , it is difficult to
  * The shared task is designed to benchmark the usefulness of modeling the
    entire conversation context (i.e., all the prior dialogue turns) for sarcasm

# 2 Research on sarcasm detection with a focus on the role of context. 

* isolation when predicting the sarcastic or non-sarcastic label. 
  * Initial approaches used feature-based machine learning models that rely on
    different types of features from 
    lexical (e.g., sarcasm markers, word embeddings) to 
    pragmatic such as emoticons or learned patterns of contrast between positive
    sentiment and negative situations 
  * (Davidov+ 2010; Veale and Hao, 2010; González-Ibáñez+ 2011; Liebrecht+ 2013;
    Riloff+ 2013; Maynard and Greenwood, 2014; Joshi+ 2015; Ghosh+ 2015;
    Ghosh and Muresan, 2018)
  * deep learning methods have been applied for this task
    (Ghosh and Veale, 2016; Tay+ 2018)
    * surveys on sarcasm and irony detection see (Wallace, 2015; Joshi+ 2017).
  * even humans have difficulties sometimes when in isolation (Wallace+ 2014)
* contextual information for irony and sarcasm analysis. The term 
  * context ~ any information that is availab beyond the utterance (Joshi+ 2017)
  * author context (Bamman and Smith, 2015; Khattri+ 2015; Rajadesingan+ 2015;
    Amir+ 2016; Ghosh and Veale, 2017), 
  * multi-modal context (Schifanella+ 2016; Cai+ 2019; Castro+ 2019),
  * eye-tracking information (Mishra+ 2016), or 
  * conversation context (Bamman and Smith, 2015; Wang+ 2015; Joshi+ 2016;
    Zhang+ 2016; Ghosh+ 2017; Ghosh and Veale, 2017).
* shared tasks on figurative language analysis, recently, Van Hee+ (2018) have
  * SemEval 2018 task on irony detection in Twitter focusing on utterances in
    isolation. 
  * Besides the binary classification task of identifying the ironic tweet the
  * a multi-class irony classification to identify the specific type of irony:
    whether it contains verbal irony, situational irony, or other types 
* the current shared task aims to study the role of conversation context for
  * In particular, we focus on benchmark the effectiveness of modeling the
    conversation context (e.g., all the prior dialogue turns or a subset of the
    prior dialogue turns) for sarcasm detection.

# 3 The shared task, datasets, and metrics. 

* The design of our shared task is guided by two specific issues. First, we plan
  * a particular type of context — the entire prior conversation context — for
  * two types of social media platforms: Twitter and Reddit. 
    * Both of these platforms allow the writers to mark whether their messages
      are sarcastic (e.g., #sarcasm hashtag in Twitter and “/s” marker in
      Reddit).
* we making available common datasets and frameworks for evaluation, we hope to

# Datasets

## 3.1 Reddit Training Dataset

* For Reddit, the training data was sampled from the standard corpus (Khodak+)
  
* Khodak+ (2017) introduced the self-annotated Reddit Corpus > 1 M very
  * from different subreddits eg politics, religion, sports, technology, etc.
  * self-labeled sarcastic posts where users label their posts as sarcastic by
    marking “/s” to the end of sarcastic posts. For any such sarcastic post, the
  * full conversation context, i.e., all the prior turns that took place in the
* We select the _training_ data for the Reddit track from Khodak+ (2017). We
  * a couple of criteria. First, we choose sarcastic responses with 
    * at least two prior turns. Note, for many responses in our training
      corpus the number of turns is much more. Second, we curated sarcastic re-
  * subreddits
    * from a variety of subreddits such that no single subreddit (e.g.,
      politics) dominates the training corpus. In addition, 
    * we avoid responses from subreddits that we believe are too specific and
      narrow (e.g., subreddit dedicated to a specific video game) that might not
  * The nonsarcastic partition of the training dataset is collected from the
    same set of subreddits that are used to collect sarcastic responses.
  * 4,400 posts (as well as their conversation context) for the training dataset
    * balanced between sarcastic and non-sarcastic posts.

## 3.2 Twitter Training Dataset For the Twitter dataset, 

* we have relied upon the annotations that users assign to their tweets using
  hashtags. The sarcastic tweets were collected using hashtags: #sarcasm and
  #sarcastic. As 
* non-sarcastic utterances, we consider sentiment tweets, i.e., we adopt the
  methodology proposed in related work (Muresan+ 2016). Such sentiment tweets do
  * not contain the sarcasm hashtags but 
    include hashtags that contain positive or negative sentiment words. The 
    * positive tweets express direct positive sentiment: #happy, #love, #lucky
    * negative tweets express direct negative sentiment: #sad, #hate, #angry
  * a considerably harder task than classifying against random objective tweets
    * many sarcastic utterances also contain sentiment terms. Here, we are
  * We manually evaluated around 200 sentiment tweets and found very few false
    positives in the training corpus.
* a couple of criteria while selecting the training dataset.
  * only when they appear in a dialogue (i.e., begins with “@”-user symbol) and
    at least have two or more prior turns as conversation context. Second, 
  * for the non-sarcastic posts =< 10% sentiment hashtag.
  * avoiding short tweets, discarding tweets with only multiple URLs, etc. We
* 5,000 tweets for training balanced between sarcastic and non-sarcastic tweets.
---
* Figure 1 histog of training utterances context length
  * the numbers are comparable for utterances with context length to two or 3
  * for Twitter corpus, utterances with a higher number of context (i.e., prior
    turns) is much higher.

### 3.1.3 Evaluation Data

The Twitter data for evaluation is curated similarly to the training data. For
* Reddit, we do not use Khodak+ (2017) rather collected new sarcastic and
  non-sarcastic responses from Reddit. First, for 
  * sarcastic responses we utilize the same set of subreddits utilized in the
    training dataset, thus, keeping the same genre between the evaluation and
  * non-sarcastic partition, we utilized the same set of subreddits and
    submission threads as the sarcastic partition. 
* For both tracks the evaluation dataset contains 1800 instances partitioned
  equally between the sarcastic and the non-sarcastic categories.

## 3.2 Training Phase

* In the first phase, data is released for training and/or development of
  sarcasm detection models (both Reddit and Twitter). 
* no dev 
  * Participants can choose to partition the training data further to a
    validation set for preliminary evaluations and/or tuning of
    hyper-parameters. 
  * Likewise, they can also elect to perform cross-validation on the training

## 3.3 Evaluation Phase

* In the second phase, instances for evaluation are released. Each participating
  system generated predictions for the evaluation instances, =< 999 models. 1
* Predictions are submitted to the CodaLab site and evaluated automatically
  * CodaLab is an established platform to organize shared-tasks (Leong+ 2018)
  * easy to use, provides easy communication with the participants (e.g., allows
    mass-emailing) as well as tracks all the submissions updating the
    leaderboard in real-time. The 
* metrics used for evaluation is the average F1 score between the two categories
* The leaderboards displayed the Precision, Recall, and F1 scores in the
  * separately for the two tracks Twitter and Reddit.

# 4 The participating systems

* timeline
  * The shared task started on January 19, 2020: training data was made available
  * released the evaluation data on February 25, 2020. 
  * Submissions were accepted until March 16, 2020.
* an overwhelming number of submissions: 655 for Reddit and 1070 for the Twitter
  * results from 39 systems for the Reddit track and 38 systems for the Twitter
  * 14 papers were submitted. 
  * In the following section we summarize each paper.  We also put forward a
    comparative analysis based on their performance and the choice of
    features/models in Section 5.
* from Sec 5: The large difference between the best model (miroblog) and other
  systems can be attributed to their dataset augmentation strategies. Using just

## Baseline classification model that we used.

* We use prior published work as the baseline that used conversation context to
  detect sarcasm from social media platforms such as Twitter and Reddit (Ghosh+)
  * Ghosh+ (2018) proposed a dual LSTM architecture with hierarchical attention
  * one LSTM models the conversation context and 
    the other models sarcastic response. The 
  * hierarchical attention (Yang+ 2016) implements two levels of attention – 
    one at the word level and another at the sentence level.
* based on only the immediate conversation context (i.e., the immediate prior
  turn). 2 This is denoted as LST M attn in Table 3 and Table 4.

## 4.2 System Descriptions

We describe the participating systems in the following section (in
alphabetical order).

### miroblog * 

* improvement over the 2nd ranked system by more than 7/14% F1-score in the
* a clever mix of ensemble techniques and/or data augmentation setups, which

# 5 A comparative evaluation of the systems and our obs: designs and performance 

* Table 3 and Table 4 present the results for the Reddit track and the Twitter
* rank of the submitted systems (best result from their submitted reports) both
  * in terms of the system submissions (out of 14) as well as their rank 
  * on the Codalab leaderboard. Note, 
  * for a couple of entries, a discrepancy between their 
    best reported system(s) and the leaderboard entries. For the sake of
    fairness, for such cases, we present the leaderboard entries 
* majority of the models outperformed the LST M attn baseline (Ghosh+ 2018).
  * Almost all the submitted systems have used the transformer-architecture that
    * better than RNN-architecture, even without any task-specific fine-tuning.
  * most of the models are similar and perform comparably, we observe a
  * `miroblog` has outperformed the other models in both the tracks by posting
    * improvement over the 2nd ranked system by more than 7/14% F1-score in the
In the following paragraphs, we inspect the performance of the different
systems more closely. We discuss a couple of particular aspects.

## Context Usage: One of the prime motivating factors for this shared task

* the most common approach for integrating context was simply concatenating it
  with the response text.
Novel approaches include :
  4. Ensemble of multiple models with different depth of context (miroblog, 1st)
  1. Taking immediate context as aspect for response in Aspect-based Sentiment
     Classification architectures (taha, 3rd/6th)
  5. explicit separator between context and response (tanvidadu, 4th/8th)
  3. Time-series fusion with proxy labels for context (amitjena40, 8th/17th)
  2. CNN-LSTM based summarization of entire context thread (salokr, 10th/26th)

## Depth of Context: Results suggest that 

* beyond three context turns, gains from context information are negligible and
  may also reduce the performance due to sparsity of long context threads. The
* dependent on the architecture and 
  * CNN-LSTM based summarization of context thread (salokr) was the only
    approach that effectively used the whole dialogue.

## Discrete vs. Embedding Features The 

* leaderboard was dominated by Transformer based architectures and we saw
* BERT or RoBERTa and other variants. Other sentence embedding architectures
* Infersent, CNN/LSTM over word embeddings were also used but middling perf
* Discrete features were involved in only two submissions (duke DS, burtenshaw)

## Leveraging other datasets 

* The large difference between the best model (miroblog) and other systems can
  be attributed to their dataset augmentation strategies. 
  * Using just the context thread as a negative example when 
    the context+response is a positive example, is a straight-forward approach
    for augmentation from labeled dialogues. Their novel contribution lies in
  * miroblog leveraging large-scaled unlabelled dialogue threads, showing
    another use of BERT by 
    using NSP confidence score for assigning pseudo-labels.

## Analysis of predictions, we conducted one based on the predictions 

* ourtwo questions. First, we investigate 
  * whether any particular pattern exists in the evaluation instances that are
    wrongly classified by the majority of the systems.
  * [úgy látom, nem csinálják meg] we compare the predictions of the
    top-performing systems to identify instances correctly classified by the
    candidate system but missed by the remaining systems. Here, we attempt to
    recognize specific characteristics that are unique to a model, if any.
    * only the top-three submissions in both tracks because of their high perf.

### Instances missed by all the top 3

* 80 instances (30 sarcastic) from the Reddit evaluation dataset and 
* 20 instances (10 sarcastic) from the Twitter evaluation set, respectively,
* all these test instances more or less belong to a variety of topics including
  sarcastic remarks on baseball teams, internet bills, vaccination, etc., that
  probably do not generalize well during the training.  
* For both Twitter and Reddit, we also found many sarcastic examples that
  contain common non-sarcastic markers such as laughs (e.g., “haha”), jokes,
  positive-sentiment emoticons (e.g., :)) in terms of Twitter track. We did not
* no correlation to context length.
* Most of the instances contain varied context length, from two to six.

### miroblog

* almost equal distribution of missed sarcastic and non-sarcastic instances) in
* instances with subtle humor or positive sentiment are missed by the
