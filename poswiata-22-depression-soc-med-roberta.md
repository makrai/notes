OPI@LT-EDI-ACL2022: Detecting Signs of Depression from Social Med using RoBERTa
Rafał Poświata, Michał Perełkiewicz
LTEDI 2022 ... on Language Technology for Equality, Diversity and Inclusion

model at huggingface

# Abstract

* This paper presents our winning solution for the LT-EDI-ACL2022 Shared Task
  on Detecting Signs of Depression from Social Media Text
* given social media posts in English, should detect the level of depression
* ‘not depressed’, ‘moderately depressed’ or ‘severely depressed’
* We fine-tuned selected models: BERT, RoBERTa, XLNet
* using the prepared corpus, we trained our own language model called
  DepRoBERTa.  Fine-tuning of this model improved the results
* third solution was to use the ensemble averaging => best solution
* macro-averaged F1-score of 0.583

# 1 Intro

* rapid detection of depression signs is possible
* based on the social media posts of the individual (De Choudhury+ 2013)

# 2 Related work: depression detection in social media

* detecting depression based on social media posts
  * De Choudhury+ (2013) was one of the first papers
  * they collected a group of Twitter1 users diagnosed with depression whose
    one-year posts were used to create a statistical classifier to estimate the
    risk of depression
  * Japanese: Tsugawa+ (2015) prepared the dataset in a similar way but for
    * Support Vector Machines (SVM) classifier to estimate the presence of
  * Wolohan+ (2018) created a dataset based on Reddit2 posts, binary
    * Then, among other things, they analyzed their posts using LIWC (2015)
  * Pirina and Çöltekin (2018) also used Reddit as a data source and
    * how training data can affect the quality of a SVM-based model
  * Tadesse+ (2019) use LIWC, Latent Dirichlet Allocation (LDA) topics, N-grams
  * Arora and Arora (2019) analyze tweets for depression and anxiety by using
    Multinomial Naive Bayes and Support Vector Regression (SVR) classifier
  * Lin+ (2020) create SenseMood system to detect depression from tweets 
    * visual and textual features using 
      Convolutional Neural Network (CNN) and BERT language model
  * Zogan+ (2021) propose novel summarization boosted deep framework for
    * data filtering
  * Aswathy+ (2019); Haque+ (2021); William and Suhartono (2021)
* deep learning and large pre-trained transformer-based LMs (Min+ 2021)
  * Bonan Min, Hayley H Ross, Elior Sulem, Amir Pouran Ben Veyseh,
      Thien Huu Nguyen, Oscar Sainz, Eneko Agirre, Ilana Heinz, and Dan Roth
    Recent advances in NLP via large pre-trained language models: A survey.
    ArXiv, abs/2111.01243.
  * SOTA results for numerous classification tasks
    (Devlin+ 2019; Liu+ 2019; Chan+ 2020; Dadas+ 2020)

# 3 Dataset and its modification

* we first remove duplicate records containing the same posts =>
  * the train set consists of a large number of the same examples, and the
    unique ones are only 2,720 (out of 8,891 total).  In the case of the
    dev set, the difference was much smaller, ie, 4,481 unique against 4,496
  * make the train set larger than the dev or test set
    => we decided to use part of the dev set for training,
    leaving 1,000 examples for verification 
    * kept the class distribution close to the original one
  * As a result, the train set we used in our experiments counted 6,006 unique
    * there were overlaps between the original train and dev sets
* the dataset is unbalanced, and the severe class is underrepresented

# 4 Our solution

# 5 Experiments, the results, along with the error analysis

## 5.4 Errors Analysis

* Each model specializes in one class, ie it achieves the best results for a
  * RoBERTalarge performs best for the not depression class,
  * DepRoBERTa for the severe class, and
  * Ensemble for the moderate class
* The most common mistake is to assign a severe class to a moderate post
  * also often occurs is confusion between not depression and modereate
* analysis was carried out on the dev set
  as the competition organisers did not provide labels for the test set

# 6 Conclusion
