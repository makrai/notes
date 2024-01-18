Self-deprecating Humor Detection: A Machine Learning Approach
Ashraf Kamal & Muhammad Abulaish
PACLING 2019 Intl Conf of the Pacific Association for Computational Linguistics

# Abstract

* Humor: a figurative language category, used to express emotions & sentiments
* self-deprecating humor: users generally criticize and put themselves down
  * users generally undervalue, disparage, or deprecate themselves
  * a new business marketing trend, such as brand endorsement, advertisement,
    and content marketing
* our aim: enhance self-deprecating humor based marketing strategies
* We have identified 16 new features related to 3 different feature categories
  * self-deprecating pattern, exaggeration, and word-embedding
  * 11 humor-centric features from baseline works
* random forest classifier for detecting self-deprecating humor in Twitter
* evaluated over Twitter and two baseline datasets, and it performs
  significantly better in terms of standard information retrieval metrics

# 1 Intro

* The proposed approach follows a layered design in which
  1. semi-automated process to identify candidate self-around instances
  2. feature extraction and classifier learning for self-deprecating humor

# 2 Related work

* Automatic humor recognition is a classiﬁcation problem
  * whether a textual message is humorous or non-humorous (Liu+ 2018)
* Mihalcea and Strapparava (2005) classiﬁed humorous or non-humorous text in
  One-Liners English jokes, news sentences, BNC corpus, and proverb lists
* Reyes+ (2012) considered humor generation using supervised ML techniques
* Zhang and Liu (2014) and Raz (2012) applied humor detection in Twitter
* Yang+ (2015) considered a random forest classiﬁer to identify humor using
  * features, such as incongruity, ambiguity, interpersonal effect, and
    phonetic style
  * humor anchors in the form of words or phrases that play a role in recogniz
* Zhang+ (2017): features like contextual knowledge, affective polarity, and
  subjectivity for humor recognition
* Liu+ (2018) sentiment association for humor recognition in discourse relations
* Beukel and Aroyo (2018): homonym as an indicative feature for humor recognition
* Chen and Soo (2018) applied a deep learning approach for humor recognition
  using a convolutional neural network
* Ortega-Bueno+ (2018) proposed an attention-based recurrent neural network
  for humor detection in Spanish
* Ermilov+ (2018) applied a supervised approach for Russian
* Gultchin+ (2019) applied word embedding
* none of the existing works aims to identify self-deprecating humor

# 3 Our approach

# 4 Formulation of various newly identified and existing features

# 5 Statistics of the datasets, including the data crawling and preproc

# 6 Experimental setting and evaluation results

# 7 Concludes the paper with future research directions
