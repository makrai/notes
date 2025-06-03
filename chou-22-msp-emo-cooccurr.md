Exploiting Co-occurrence Frequency of Emotions in Perceptual Evaluations
  To Train A Speech Emotion Classifier
Huang-Cheng Chou, Chi-Chun Lee, Carlos Busso
Proc.  Interspeech 2022, 161-165, doi: 10.21437/Interspeech.2022-11041

# Abstract

* categorical SER often formulated as a single-label classification problem,
  * hE emotions can co-occur, especially for more ambiguous emotional sentences
    (eg a mixture of happiness and surprise).
  * SER problems as a multi-label task, predicting multiple emotional classes.
    * hE not leverage the relation between emotions during training, since
      emotions are assumed to be independent. This study explores the idea that
* we: emotional classes are not necessarily independent and its implications on
  * we calculate the frequency of co-occurring emotions from perceptual
  ~> a matrix with class-dependent penalties, punishing more mistakes between
  distant emotional classes. 
  * We integrate the penalization matrix into three label-learning approaches
  * Merci: 	
    * hard label -- konszenzus
    * soft: egy vektor ahol az érzelem 1 ha annotálták és 0 ha nem,
    * distribution label -- a label vektor 1-re összegződik
  (hard-label, multi-label, and distribution-label learning) using the
  proposed modified loss. We train SER models using the penalty loss and
  commonly used cost functions for SER tasks.
* important relative improvements in macro F1-score for 
  hard-label learning (17.12%), 
  multi-label learning (12.79%), and 
  distribution-label learning (25.8%)
