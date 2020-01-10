Saif Mohammad, Bonnie Dorr, Graeme Hirst
Computing Word-Pair Antonymy
emnlp 2008

Both datasets are apparently in the public domain and
will be made available on request

#8 Evaluation

##8.1 Task and data

* a set of closest-opposite questions
* Each question has one target word and five alternatives
* The objective is to identify that alternative which is the closest opposite
* e.g. adulterate: a. renounce b. forbid c. purify d. criticize e. correct
  * _correct_ as a verb has a meaning that contrasts with that of adulterate;
    however, _purify_ has a greater degree of antonymy with adulterate
* similar to how Turney (2001) has evaluated semantic distance on TOEFL synonym
* two independent sets of questions designed to prepare students for the
  Graduate Record Examination
  1. 162 questions. We used this set to develop our approach
    * [no] tuned parameters per se, the development set helped determine which
      cues of antonymy were useful and which were not. The second set has
  2. 1208 closest-opposite questions
    * We discarded questions that had a multiword target or alternative. After
      removing duplicates we were left with 950 questions, which we used as the
* the data contains many instances that have the same target word used in
  different senses
  * we relied on the hypothesis that the intended sense of the alternatives are
    those which are most antonymous to one of the senses of the target word

##8.2 Experiments

#8.3 Discussion
