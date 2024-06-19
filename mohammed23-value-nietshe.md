Friedrich Nietzsche at SemEval-2023 Task 4 Detection of Human Values from Text
Abdul Jawad Mohammed, Sruthi Sundharram, Sanidhya Sharma
SemEval-2023 Toronto, Canada

# Abstract

* [people] relate to, accept or disregard, debate over, or enlighten ourselves
  with texts
* Trained on the ValueEval data set as a multi-label classification problem,
  F1 metrics at most 0.04 for each value. Noting this, 
* the limitations and weaknesses of our approach are discussed in our paper

# 1 Intro

* humanistic archetypes of freedom, creativity, self-preservation, etc. upon
  * religious beliefs and concerns about nature and the environment. At other
* SemEval 2023 ValueEval task (Kiesel+ 2023), we seek to explore the
  * we: Decision Trees, Logistic Regression, Support Vector Machines, and
    Random Forest in the extraction of implicit themes within the liter; Python
* With the problem being of multi-label nature and the SemEval2023 dataset as
* we: TF-IDF vectorization before being fed to ensembles of ML models
* 20 human value themes on the test data. The hyper-parameters for each model
  were also tuned to inspect for changes in performance.
* we placing last in the rankings for scoring the main test set 

# Background

## Rel work

* values have been analyzed for personality profiling (Maheshwari+ 2017), but
* data sets for human values. One such data new data set is the
  * ValueNet (Qiu+ 2022) contains human attitudes on 21,374 text scenarios 
    * 10 categories, namely, Universalism, Benevolence, Conformity, Tradition,
      Security, Power, Achievement, Hedonism, Stimulation, and Self-direction.
    * Their train a Transformer based regression model and apply it to dialogue
  * The ETHICS data set (Hendrycks+ 2020) predicts moral judgments.
    * assess a language model’s knowledge of morality.

## Dataset Information:

* SemEval Task 2023, containing arguments categorized under 20 labels, 
  * each representing one or more humanistic themes as shown in Figure 1. An
    argument sample consists of three attributes:
  * Premise: A text feature showcasing the main argument.
  * Conclusion: A text feature representing the conclusion inferred from the Premise.
  * Stance: Value indicating if the conclusion is in ‘favor of’ or ‘against’
    the premise
* fig 2: Across the training data set, words like ‘abolish’, ‘ban’, ‘adopt’,
  and ‘legalize’ were among the most frequent non-stop words for all
  categories, suggesting that a great portion of the conclusion-premise pairs
  revolved around legislation, moral discussions, and societal issues as seen
