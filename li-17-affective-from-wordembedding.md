Minglei Li, Qin Lu, Yunfei Long, and Lin Gui
Inferring Affective Meanings of Words from Word Embedding
Journal of IEEE transactions on affective computing 2017 (under review)

extended lexicons are publicly available for access

# Abstract

* we propose a regression-based method to automatically infer
  multi-dimensional affective representation of words via their word embedding
  based on a set of seed words
* Evaluation on various affective lexicons shows that our method
  outperforms the state-of-the-art methods on all the lexicons
  under different evaluation metrics with large margins
  * different regression models:
    * Ridge regression model, the Bayesian Ridge regression model and Support
      Vector Regression with linear kernel
    * computation advantages
  * Experiments on a sentiment analysis task
    * our method achieve better results than publicly available sentiment
      lexicons on eight sentiment corpora

# 1 Intro

* applications of Affective computing from text
  * analysis of consumer opinions on a company’s products [2],
  * recommendation systems for movies, books, music or pictures
    based on user’s emotions [3],
  * detection of suicide risks based on social media [4],
  * stock market prediction based on public opinions [5],
  * product aspect extraction [6],
  * sarcasm detection [7],
  * personality detection [8],
  * intelligent human-computer interaction systems
    that can express and detect the affective states of human beings [9]
* multidimensional representation models,
  * such as the
    * valence-arousal-dominance model (VAD) [13] and the
    * evaluation-potency-activity model (EPA) [14]
  * Theoretically, discrete affective labels can always be mapped to points in
    a multi-dimensional affective space [15]
    * R A. Calvo and S. Mac Kim, “
      Emotions in text: dimensional and categorical models,”
      Computational Intelligence 2013
* Affective Control Theory (ACT),
  * affective meaning of each concept in an event is context dependent
    (in addition to cultural, behavior and other background information [16])
  * Multi-dimensional models allow for more interaction in a sequence
    * more context information can be included in affective computing of text
* resources are limited because they are based on manual annotation, such as
  * ANEW lexicon of VAD based on manual annotation [17],
  * extended ANEW lexicon based on crowdsourcing [18],
  * Chinese valence-arousal lexicon based on manual annotation [19],
  * EPA lexicon based on manual annotation [14]
* Word embedding based graph propagation method
  to predict the valence-arousal ratings from seed words [20]
* regression models to extend affective lexicons
  1. a linear regression model based on manually defined features from a
     knowledge base [22], which is limited by the manually prepared features
  2. the linear regression weighted on the the semantic similarity between a
     target word and the seed words [23], which is
     limited by the accuracy of the semantic similarity
* We infer sentiment, valence, arousal, dominance, evaluation, potency,
  activity, imagery, and also
  other meanings including perceptual sense of words, concreteness of words
* Evaluations show that
  1. SOTA on several affective lexicons
  1. rating scale insensitive, i.e. not require the rating range to be bipolar
  1. computationally more efficient than propagation based methods
  1. Several affective lexicons with about million of words are built and
    * lexicons based on word embedding perform better than previous ones

# 2 Related works 2

## affective models

* Affective meaning includes emotion, sentiment, trait, mood, and attitudes,
* several proposed emotion categorizations Ekman [24], Parrot [25],
  Frijda [26], Plutchik [26], Tomkins [27], Ortony [28] 22 Xu [29]
* multi-dimensional models including the
  * valence-arousal model (VA) [13] as shown in Figure 1; the
  * evaluation-potency-activity model (EPA) [30] as shown in Figure 2; the
  * hourglass model [31]: pleasantness, attention, sensitivity and aptitude
  * Pleasure-Arousal-Dominance (PAD) [32]; the
  * evaluation and activation [33], two continuous dimensions
  * evaluation, potency, activation, and unpredictability [34]
  * serotonin, dopamine and noradrenaline based on neuroscience [35]
* interaction information between different dimensions can be captured

## lexicon generation methods

* we will only focus on dimension based lexicons
  * sentiment: Since sentiments can be described by a one dimensional model, we
    also include methods for obtaining sentiment lexicons
  * Theoretically speaking, methods to obtain a sentiment lexicon can be
    extended to obtain other affective dimensions
* Manually annotated
  * sentiment lexicons:
    General Inquirer (GI) [10], MPQA [36], the twitter sentiment lexicon based
    on crowdsourcing [37], [38], VADER based on crowdsourcing [39], etc
  * multi-dimensional affective lexicons
    * ANEW lexicon based on the VAD model [17] which contains 1,034 English
    * extended ANEW rexicon: 13,965 words annotated through crowdsourcing
    * CVAW lexicon based on the VAD model [19] contains 1,653 traditional
      Chinese words annotated in the valence and arousal dimensions
    * Dictionary of Affect in Language (DAL) lexicon annotated in the
      dimensions of pleasantness-activation-imagery contains 8,742 terms [33]
    * EPA lexicon annotated in the evaluation-potency-activity dimensions [16]
      contains about 4,505 English terms
    * ANGST lexicon: 1,003 German words [40]
      valence-arousal-dominance-imageability-potency dimensions
* Automatic methods: three approaches
  * statistical information between a target word and the seed words
    * sentiment polarity intensities are calculated based on PMI between a
      target word and the positive/negative seeds respectively [37]/[44]
    * Similarly, PMI is used to build discrete emotion lexicon based on
      naturally annotated hashtags in twitter [45] The second approach is
  * label propagation method which firstly builds a word graph
    * graph is based on the semantic relationship in
      * WordNet and the label propagation is performed to
        infer the EPA values [46] and sentiment polarity [47]
        * confined by the coverage of the knowledge base
      * text corpus based on the cosine similarity of words [48], Word embed
        * PageRank algorithm is employed to infer VA [20]
        * to infer sentiment polarities [43]
* map word vector to some sentiment value or categories based on a regression
  model or a classifier
  1. representing words by manual defined features based on some knowledge base
     and performing linear regression on the features [22]
  2. representing words as word embeddings obtained automatically and using a
     classifier [49] or linear regression [50] to obtain sentiment
  3. mapping word embedding into sentiment space through a transformation
     matrix that minimizes intra-group distance in each sentiment category and
     maximizes intergroup distance without considering the actual values of the
     seed words [51]

## Word embedding models

# 3 Method for inferring affective meanings

# 4 Experiments

# 5 Conclsion
