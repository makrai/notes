Hubert Soyer and Pontus Stenetorp and Akiko Aizawa
Leveraging monolingual data for crosslingual compositional word representations
2015

https://github.com/ogh/binclusion

#Abstract 

* three criteria; 
  * it constrains the word-level representations to be compositional, 
  * it is capable of leveraging both bilingual and monolingual data, and 
  * it is scalable to large vocabularies and large quantities of data
* monolingual inclusion criterion
  * phrases are ... closely semantically related to their sub-phrases 
* evaluate [on] crosslingual document classification task 
  * either comparable, or greatly improve upon previous state-of-the-art
  * Concretely 
    * ... for the English to German
    * ...

#1 Introduction

* Hermann & Blunsom (2014) introduced ... compositional crosslingual word repr
* short-comings.  
  * Klementiev et al. (2012); Mikolov et al. (2013); Gouws et al.  (2014) 
  * compositionality is not encouraged by the monolingual objective
    * problematic when composing word representations for a phrase or document
  * Hermann & Blunsom (2014) 
    * limited to using sentence-aligned bilingual data 
    * not ... can be extended to make use of monolingual data
  * Chandar A P et al.  (2014) 
    * words vector with the size of the whole vocabulary.  
    * leads to 
      * computational scaling issues and necessitates a 
      * vocabulary cut-off which may 
    * hamper performance for compounding languages such as German
* In this work
  * neural network based architecture 
  * agnostic to the choice of composition function 
  * novel way of training monolingual word representations
  * evaluate [on] document classification task 
    * results for both sub-tasks 
    * comparable or greatly improve upon the previous state of the art
      * German to English sub-task...

#2 Model

#2.1 Inducing crosslingual word representations

#2.2 Creating representations for phrases and documents

* we use separate word representations for each language.
* composition
  * addition
  * bigram based addition

#2.3 Objective

* 2.3.1 Bilingual objective
* 2.3.2 Monolingual objective

#3 Experiments

#3.1 Crosslingual document classification

#3.2 Inducing crosslingual word representations

* preproc
  * Following Turian et al. (2010) we remove all English sentences ... that
  * have a lowercase/nonlowercase ratio of less than 0.9.
* implemented in a high-level, dynamic programming language 
  * (Bezanson et al., 2012),

#4 Results

#4.1 Crosslingual document classification

#4.2 Interesting properties of the induced crosslingual word representations

#5 Conclusion and future work

* we plan to investigate more complex composition functions, possibly based on
* convolution
