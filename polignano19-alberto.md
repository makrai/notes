AlBERTo: Italian BERT LM for NLP challenging tasks based on tweets
Polignano M.; Basile P.; de Gemmis M.; Semeraro G.; Basile V
CLiC-it 2019

Model repository: https://github.com/ marcopoli/AlBERTo-it

# Abstract: 	

* AlBERTo is focused on the language used in Twitter
* evaluated AlBERTo on the EVALITA 2016 task SENTIPOLC (SENTIment POLarity
  Classification)
  * SOTA in subjectivity, polarity and irony detection on Italian tweets

# 1 Related work

* The base BERT model for English language is exactly the same used for Italian
  * we are considering the possibility to develop a large version of it soon

# 3 AlBERTo

* language used on social networks is different from the formal one
  * mentions, uncommon terms, links, and hashtags
* we excluding the step based on “next following sentence”. This is a crucial
  * in the case of tweets, we do not have cognition of a flow of tweets as it
    happens in a dialog
  * AlBERTo is not suitable for the task of question answering for this reason
* we are considering the possibility to learn an Italian ELMo model and to
  compare it with the here proposed model

# 4 Evaluation and Discussion of Results

* a task of sentiment analysis for the Italian language
* data released for the SENTIPOLC (SENTIment Polarity Classification) shared
  task (Barbieri+ 2016) carried out at EVALITA 2016 (Basile+ 2016) whose tweets
  comes from a distribution different from them used for training AlBERTo
* three subtasks:
  * Subjectivity Classification: a system must decide whether a given message
    is subjective or objective
  * Polarity Classification: a system must decide whether a given message is
    of positive, negative, neutral or mixed sentiment
  * Irony Detection: a system must decide whether a given message is ironic
* tagged with six fields containing values related to manual annotation:
  subj, opos, oneg, iro, lpos, lneg
  * subjective, positive, negative, ironical, literal positive, literal negative
  * 1 where the sentence satisfy the label, a 0 instead
  * “lpos” and “lneg” not been considered in the official and the current eval
  * 7410 tweets have been released for training and 2000 for testing
    * We do not use any validation set
  * precision (p), recall (r) and F1-score (F1) for each class

## AlBERTo fine-tuning

* We fine-tuned AlBERTo four different times, in order to obtain one classifier
  for each task except for the polarity where we have two of them
  * one classifier for the Subjectivity Classification, Polarity Positive,
    Polarity Negative and Irony Detection each
  * each time we have re-trained the model for three epochs, using a learning
    rate of 2e-5 with 1000 steps per loops on batches of 512 example from the
    training set of the specific task
  * For the fine-tuning of the Irony Detection classifier, we increased the
    number of epochs of training to ten observing low performances using only
    three epochs as for the other classification tasks. The fine-tuning process
    lasted ∼ 4 minutes every time

## Discussion of the results

* Comparing AlBERTo with the best system of each subtask, we observe an increase
  in results between 7% and 11%. The results obtained are exciting

# 5 Conclusion
