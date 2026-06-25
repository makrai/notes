Reactive Supervision: A New Method for Collecting Sarcasm Data 
Boaz Shmueli, Lun-Wei Ku, Soumya Ray
EMNLP 2020

https://github.com/bshmueli/SPIRS

# Abstract

* reactive supervision, a novel data collection method that 
  utilizes the dynamics of online conversations to overcome limitations
* a first-of-its-kind large dataset of tweets 
  with sarcasm perspective labels and new contextual features, the dataset is.

# 1 Intro

* Oprea and Magdy (2019)
  * intended sarcasm (by the author) vs. perceived sarcasm (by the reader) 
    in the context of sarcasm detection tasks. The training of models for these
  * Twitter becoming a major source due to its popularity as a social network as
    * huge amounts of conversational text its users generate. Previous works
  * three methods for collecting sarcasm data: 
    distant supervision, manual annotation, and manual collection.
  * Distant supervision automatically collects “inthe-wild” sarcastic tweets by
    leveraging author∗ generated labels such as the #sarcasm hashtag (Davidov+
    2010; Ptáček+ 2014). This method generates large amounts of data at low
    cost, but labels are often noisy and biased (Bamman and Smith, 2015).
  * manual annotation asks humans to label given tweets as sarcastic or not.
    * finding sarcasm in a large corpus is “a needle-in-ahaystack problem”
      (Liebrecht+ 2013), manual annotation can be 
      ~> combined with distant supervision (Riloff+ 2013). Still, 
    * low inter-annotator reliability is often reported (Swanson+ 2014),
      resulting not only from/but also from
      * the subjective nature of sarcasm but also the lack of 
      * cultural context (Joshi et al., 2016).
  * w method w perspective
    * distant supervision collects intended sarcasm, while 
    * manual annotation can only collect perceived sarcasm.
  * manual collection, humans are asked to gather and report sarcastic texts,
    either their own (Oprea and Magdy, 2020) or by others (Filatova, 2012).
  * both manual methods are slower and more expensive than distant supervision,
* we propose 
  * reactive supervision, a novel conversation-based method that offers
    automated, high-volume, “inthe-wild” collection of 
    high-quality intended and perceived sarcasm data. We use our method to
  * the SPIRS sarcasm dataset

# 2 Reactive Supervision

* cue tweets 
  * frequent in online conversations 
  * a reply that highlights sarcasm in a prior tweet. 
  * Figure 1 (left panel) shows a typical exchange on Twitter: 
    * C posts a sarcastic tweet. 
    * Unaware of C’s sarcastic intent, B replies with an oblivious tweet. 
    * Lastly, A 1 alerts B by replying with a cue tweet (She was just being s!)

|Person |Example Cue Regular   |Expression                      |Example Author Seqs|
|-------|----------------------|--------------------------------|-------------------|
|1st    |`ˆA[ˆA]* (A)[ˆA]*$`   |I was only being sarcastic lol  |ABA, ABAC, ABAB    |
|2nd    |ˆAA* (B)A*$`          |Why are you being sarcastic?    |AB, ABA, ABAA      |
|3rd    |ˆAA*B[AB]* (C)[AB]*$` |She was just being sarcastic!   |ABC, ABCB, ABAC    |

* 3rd-person cue with author sequence ABC. 
`User_C` The app we use for work emails is not working.
I feel terrible about this!  `User_B` Not your fault. Do not feel guilty!  `User_A`
Replying to @`User_B` She was just being sarcastic!  `User_C` 
* 1stperson cue with author sequence ABAC.
Just watched Forrest Gump. Great film!  `User_A` So Tom Hanks can act!  Who
knew???  `User_B` Literally everyone!!!  `User_A` Replying to @`User_B` I was
being sarcastic lol 

* To capture sarcastic tweets, we thus 
  * first search for cue tweets (using the query phrase “being sarcastic”, often
    used in responses)
  * then carefully examine each cue tweet to identify the corresponding
    sarcastic tweet.
Algorithm Given a thread {t n , t n−1 , . . . , t 1 } with cue tweet t n by a n
= A, our aim is to identify the sarcastic tweet among {t n−1 , . . . , t 1 }. We
first examine the personal subject pronoun used in the cue (I, you, s/he) and
map it to a grammatical person class (1st, 2nd, 3rd). This informs us whether
the sarcastic author is also the author of the cue (1st), its addressee (2nd),
or another party (3rd).
For each person class we then apply a heuristic to identify the sarcastic tweet.
For example, for a 1st-person cue tweet (e.g., I was just being sarcastic!), the
sarcastic tweet must also be authored by A. If the earlier tweets in T contain
exactly one tweet from A, it is unambiguously the sarcastic tweet. Otherwise,
if there are two or more earlier tweets from A (or none), the sarcastic tweet
cannot be unambiguously pinpointed and the entire thread is discarded. We
formalize this rule by requiring the author sequence to match the regular
expression /ˆA[ˆA]* (A)[ˆA]*$/, where the capturing group (A) corresponds to the
sarcastic tweet 2 . We are able to use regular expressions because we use a
string of letters to represent the author sequence. 2ndand 3rd-person cues
produce corresponding rules and patterns. Table 1 lists the three person
classes, corresponding regular expressions, and example author sequences.
The following formalizes our method.
