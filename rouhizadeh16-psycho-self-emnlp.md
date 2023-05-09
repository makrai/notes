Using Syntactic and Semantic Context to Explore
  Psychodemographic Differences in Self-reference
Masoud Rouhizadeh, Lyle Ungar, Anneke Buffone, H Andrew Schwartz
2016 EMNLP

# Abstract

* rate of 1sg pronouns predicts demographic and psychological factors
* We find that
  * pronouns are overall more predictive when taking into account
    * dependency relations and
    * verb semantic categories
  * the direction of the relationship can change

# Introduction

* organization
  * relationship between first person singular pronouns and
    age, gender, and depression
  * syntactic position of the pronoun
    * occurrence in the subject and direct object position
  * self-referenced use of verbs compared to their general use
    across different semantic categories
  * rate of 1st-person singular pronoun as the subject and the object
    with different verb categories
* contributions include:
  1. taking the role of context into account
    in the psychological analysis of personal pronouns,
  1. distributional clustering of verbs using Canonical Correlation Analysis
  1. exploring the integration of verbal semantic categories
    in the analysis of pronouns

# 2 Background

* pronoun use with regard to age, gender, and personality types
  * “The Secret Life of Pronouns” summarizing such studies (Pennebaker, 2011)
  * Pennebaker+ (2003) and Chung & Pennebaker (2007) found that the use of
    self-references (i.e. ‘I’, ‘me’) decreases over age.
  * Pennebaker+ (2003), and Argamon+ (2007) showed that females use
    significantly more first-person singular personal pronouns
  * first-person singular pronouns are positively correlated with depress sympt
    * Bucci and Freedman (1981), Weintraub (1981), and Zimmermann+ (2013)
  * not take the role of syntactic and semantic context into consideration

# 3 Method

## Data Set: Facebook Status Updates

## Dependency Features

## Verb categorization

* two verb categorization methods
  1. linguistically-driven Levin’s Verb Classes, and
  1. empirically-driven verb clustering based on CCA
* Canonical Correlation Analysis (CCA)
  * a multiview dimensionality reduction technique
  * previously ... used in word clustering methods such as
    * word embeddings (Dhillon+ 2011), or
    * multilingual word embeddings (Ammar+ 2016)
    * advantage[:] we can leverage both the subject and object context
    * we performed sparse CCA on
  * input matrices
    * x that includes 5k by 10k verb-by-nominal-subject (nsubj) co-occurrences,
    * z that includes 5k by 10k verb-by-direct-object (dobj) co-occurrences
  * output of CCA is
    * a _subject by component_ matrix (u: subject-view), and
    * an _object by component_ matrix (v: object-view)
  * We then build matrix
    * S by multiplying x by u to get the verbs by CCA-components
    * O by multiplying z by v to get the ... verbs by object components
  * cluster verbs from direct CCA components,
    we use the average score of subject-view and object-view components,
    assigning verbs to those components
    for which they have a non-zero absolute weight (CCA-D)
  * Sparse CCA zeros-out verbs from multiple components so as to assign verbs
    to components, but we also explore
  * normal CCA and cluster the verbs using
    k-means (k = 30) clustering from the z-scaled values of S
    * z-scale
      * Standardization or z-scores is the most commonly used method. It
        converts all indicators to a common scale with an average of zero and
        standard deviation of one
      * aka standard score[,] z-values, z-scores, normal scores, etc
      * the signed number of standard deviations by which the value of an
        observation or data point differs from the mean value
* Both Levin’s and CCA-based verb classes are derived from syntactic
  * not distinguish antonyms
  * we integrate sentiment information in our verb clustering
    * positive and negative sentiment scores
      from EmoLex word-emotion association lexicon (Mohammad and Turney, 2013),
    * dividing each of our clusters into positive, negative, and neutral

## Analysis

* encoded as the mean from maximum likelihood estimation over the probability
  of mentioning a first person singular pronoun in a given context
* The overall usage of a first person singular pronoun: P (1p) = P (P N = 1p)
* The probability ... in the nsubj, and the dobj positions: P (1p|r)
* The probability ... in the nsubj[/dobj] positions of a given verb category

# Evaluation

* first replicating known general relationships of 1st-person singular
  pronouns with gender, age, and depression

## Replication of the gender, age, and depression effects

* linear and logistic regression to correlate gender, age, and depression
  with P (1p) (first-person singular pronoun use)
* We control for age in the case of gender, gender in the case of age, and both
  gender and age in the case of depression
  * by including them as covariates in the regression and reporting the unique
    coefficient for the variable in question
  * Logistic regression is used for gender, since it is binary, while
  * linear regression is used for the continuous age and depression variables
* we found significant relationships with gender (β = .11, p < .001),
  age (r = −0.17, p < .001), and depression score (r = −0.06, p < .01)

## Syntactic Context

* we observed shifts in the magnitude of correlations

## Syntactic and Semantic Context

* Table 1 reports
  * the area under the ROC curve (AUC) for gender prediction and the
  * Mean Square Error (MSE) for predicting age and depression
* AUC evaluates the class probabilities of test instances
* classifier
  * linear-SVM in the case of gender, and
  * ridge-regression in the case of depression
* all the features that take context into account outperform P (1p) which is
* best performance by utilizing verb categories
  * integrating sentiment helps in nearly all verb categorization approaches
  * verb clusters: gains using the data-driven CCA-based verb clustering are
    not as large as that from Levin’s linguistically-driven classes
* In the case of correlating behavior with a psychological measure, Pearson
  coefficients
  * above .1 are considered noteworthy and
  * above .3 are considered approaching a “correlational upper-bound"
    (Meyer+ 2001)
* Tables 2, 3, and 4 show the most predictive features,
  using the best performing clustering method (i.e. Levin & Sentiment)
  * in the case of age and gender ...  the direction completely changes
