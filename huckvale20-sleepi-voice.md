Prediction of sleepiness ratings from voice by man and machine
Huckvale, M; Beke, A; Ikushima, M; (2020)
Huckvale, M; Beke, A; Ikushima, M; (2020)
Interspeech.2020 pp. 4571-4575

# Abstract

* we look in more detail at the Interspeech 2019 comp paralinguistics challenge
  on the prediction of sleepiness ratings from speech
  * regression task to predict sleepiness from
    samples of the Düsseldorf Sleepy Language Corpus (DSLC)
  * the performance of all entrants was uniformly poor, with even the winning
    system only achieving a correlation of r=0.37. We look at
  * whether
    * the task itself is achievable, and whether
    * the corpus is suited to training a machine learning system for the task
* We perform a listening experiment using samples from the corpus and show that
  a group of human listeners can achieve a correlation of r=0.7 on this task,
  * hE this is mainly by classifying the recordings into one of three
    sleepiness groups
* the corpus confounds variation with sleepiness and with speaker identity, and
  this was the reason that machine learning systems failed to perform well. We
  * training and test contains different speakers, and
    each speaker only produced a narrow range of sleepiness ratings. This makes
    => very hard to learn features of sleepiness from the training set without
    at the same time learning features of identity
  * When those features are exploited by the prediction model, they may work
    well to measure similarity between speakers in the test set to speakers in
    the training set, but it is not necessarily the case that those similar
    speakers have similar sleepiness ratings
* human listening experiment described in section 3 is much more encouraging
  * The listeners as a group were able to separate the recordings in the test
    into three groups on the basis of sleepiness
  * binary task of distinguishing sleepy from non-sleepy, accuracy was > 90%
  * knowledge that helped them solve this problem without need for the training
    * knowledge might be in two forms:
    * how sleepiness changes the way in which speakers speak, and knowledge
    * how speech varies across individuals
* Future: separate out characteristics of identity and sleepiness in voice
  * the kind of factor analysis used in speaker recognition
    to separate out speaker identity from speaking environment
* requires labelling for speaker as well as labelling for sleepiness
