Language from police body camera footage shows
racial disparities in officer respect
Rob Voigt , Nicholas P. Camp , Vinodkumar Prabhakaran at al
2017

#[intro]

#Data p2

#Study 1: Perceptions of Officer Treatment from Language

* reliability for each item ranging from moderate (Cronbach’s α = 0.73) to high
  (α = 0.91) agreement (see SI Appendix, Annotator Agreement).

#Study 2: Linguistic Correlates of Respect

* In this study, we ... develop [NLP] models of respect and formality and tune
  them on the 414 individual utterances; 
  * in study 3, we apply these models to our full dataset of 36,738 utterances.

#Study 3: Racial Disparities in Respect. p3

#Discussion.

#Materials and Methods

##Data and Processing.

##Human Annotation of Utterances.

##Computational Annotation of Utterances.

* features include lexicons (lists of words). For example, to detect informal
  titles, we used an augmented version of a word list from ref. 34. We also
  used regular expressions, such as for detecting tag questions (“do that for
  me, will you?”), and syntactic parse features, such as a feature that detects
  when “just” is used in constructions as an adverbial modifier.  
* Features were modeled as log-transformed counts in each utterance, and were
  used as independent variables in two linear regression models predicting
  the human perceptual ratings of respect and formality obtained in study 1.
  They were introduced into the regression using stepwise forward selection by
  R 2 to remove features that don’t substantially contribute to the model’s
  accuracy.
