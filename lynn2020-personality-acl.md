Hierarchical modeling for user personality prediction: 
  The role of message-level attention
V Lynn, N Balasubramanian, HA Schwartz 
ACL 2020

* model that uses message-level attention to 
  learn the relative weight of users’ social media posts 
  for assessing their five factor personality traits. We demonstrate that models
* message-level attention outperform those with word-level attention, and
* SOTA accuracies for all five traits by using both word and message attention
  in combination with past approaches  In addition, 
* examination of the high-signal posts identified by our model provides insight
  into the relationship between language and personality, helping to inform

# 1 Introduction

* both NLP and psychology have turned toward more accurately assessing
  personality and other human attributes via language 
  * Mairesse+ 2007
    * Using linguistic cues for the automatic recognition of personality in
  * Schwartz+ 2013
    * Personality, gender, and age in the language of social media: open-vocab
  * Park+ 2015
    * Automatic personality assessment through social media language.
  * Kulkarni+ 2018
    * Latent human traits in the language of social media: An open-vocabulary ap
* “language-based assessments” (Park+ 2015) is that 
  * language use patterns can supplement and, in part, replace traditional and
    expensive questionnaire-based human assessments.  
* we present a hierarchical neural sequence model over both the words and messgs
  * attention to each level.  
* Contributions. Our main contributions include:
  1. A neural model for personality prediction that uses message-level attention
  2. empirical demonstration: models with message-level attention outperform
  3. SOTA performance for languagebased assessment of personality.
  4. Insight into the relship between message-level language use and personality
