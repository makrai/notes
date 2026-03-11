A Large Self-Annotated Corpus for Sarcasm 
Mikhail Khodak, Nikunj Saunshi, Kiran Vodrahalli
LREC 2018 khodak-etal-2018-large

# Abstract

* We introduce the Self-Annotated Reddit Corpus (SARC), a large corpus for
* 1.3 million sarcastic statements — 10 times more than any previous dataset —
  and many times more instances of non-sarcastic statements, 
  * allowing for learning in both balanced and unbalanced label regimes. Each
* self-annotated — sarcasm is labeled by the author, not an independent
* provided with user, topic, and conversation context
* We evaluate the corpus for accuracy, construct benchmarks for sarcasm, and
  evaluate baseline methods.

## 3.2 Constructing SARC

* Reddit comments from December 2005 have been made available due to
* we construct our dataset as a subset of comments from January 2009-April 2017,
* For each comment we provide a sarcasm label, author, the subreddit, 
  the comment score as voted on by users, the date of the comment, and
  identifiers linking back to the original dataset of all comments.

# 5 Benchmarks for Sarcasm Detection

* we use the raw corpus described in Section 3 to 
* we construct several useful benchmarks for the task of classifying statements
* All benchmarks provide the full conversation thread leading up to the target
  * along with comment metadata. Following their specification 
* we consider a few context-free baseline methods depending only on linear
  classification over simple featurizations. Code to reproduce our results is
  
## 5.1 Evaluation Task

* In the most general case, we use the provided raw files to construct
* given a post and a sequence of comments, determine which comments among the
* measured by average precision, recall and F 1 scores.
* we first remove all comments that are not complete sentences and not between 2
  and 50 tokens long, allowing for cleaner comments in the evaluation. Although
  the responses are still largely non-sarcastic, the proportion of sarcastic
* each datapoint must correspond to a thread where at least one sarcastic
  annotation occurred. In total we construct 
* 8.44 million sequences, the average proportion of sarcastic responses is 28.1%
* Figure 3: Score distributions of sarcastic and non-sarcastic comments in the
  raw SARC dataset

### 5.1.1 Balanced Labels

* one sarcastic and one non-sarcastic response from each set of responses to a
* The task then becomes one of picking which of two statements is sarcastic,
* performance measured by accuracy.
* increases the false negative rate as 
  comments warranting a sarcastic response often draw other sarcastic statements
  that are similar in content to the labeled sarcastic responses, but which
  themselves may not be labeled. Thus 
* to reduce this issue when picking the nonsarcastic statement, we featurize all
  statements using the normalized sum of Common Crawl GloVe embeddings of the
* we pick from only those non-sarcastic statements that have similarity ≤ 0.95
  with the sarcastic statement (Pennington+, 2014).

### 5.1.2 Politics

* The difficulty of detecting sarcasm rests 
  not only on the need to understand the context of previous statements 
  but also on understanding background information on the topic being discussed.
* Even humans will struggle with sarcastic comments drawn from unfamiliar
  topics, for instance, obscure hobbies or art forms. Thus 
* we also test human and machine performance on comments drawn solely from the
  politics subreddit, a topic for which 
  all evaluators had sufficient background information. This subsample contains
* 17 thousand sequences, with the 
* average proportion of sarcastic responses being 23.2%.

## 5.3 Results 
