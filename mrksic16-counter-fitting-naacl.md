Mrkšić, Séaghdha, Thomson, Gašić, Rojas-Barahona, Su, Vandyke, Wen, Young
Counter-fitting word vectors to linguistic constraints
naacl 2016

tool and word vectors are available at github.com/nmrksic/counter-fitting

#Abstract

* we present a novel counter-fitting method which
* injects antonymy and synonymy constraints into vector space representations
* improve the vectors’ capability for judging semantic similarity
* new state of the art performance on the SimLex-999 dataset
* can be used to tailor the word vector space for the downstream task of
  dialogue state tracking, resulting in robust improvements across domains

#1 Introduction

* word representations supported by the distributional hypothesis + corpora
  (Curran, 2003; Ó Séaghdha & Korhonen, 2014; Mikolov+ 2013; Pennington+ 2014)
* useful for MT (Zou+ 2013) and dependency parsing (Bansal+ 2014)
* coalesce ... semantic similarity and conceptual association (Hill+ 2014b)
* Furthermore, even methods that can distinguish similarity from association
  (e.g., based on syntactic co-occurrences) will generally fail to tell
  synonyms from antonyms (Mohammad+ 2008)
* similarity and antonymy can be application or domain-specific. In our case,
  * e.g. for the dialogue state tracking task (DST). The DST component of a
  * e.g. a DST for the restaurant domain needs to detect whether the user wants
    a cheap or expensive restaurant
* counter-fitting, is a lightweight post-processing procedure in the spirit of
  retrofitting (Faruqui+ 2015)

#2 Related Work

* improving word vector representations using lexical resources has focused
  * modify the prior or the regularization of the original training procedure
    (Yu and Dredze, 2014; Bian+ 2014; Kiela+ 2015)
  * Wieting+ (2015) use the Paraphrase Database (Ganitkevitch+ 2013) to train
  * lightweight post-processing procedures that use lexical knowledge to refine
    off-the-shelf word vectors
    * Faruqui+ (2015)’s retrofitting approach uses similarity constraints from
    WordNet and other resources to pull similar words closer together
* complications caused by antonymy for distributional methods are well-known in
  * extracting antonym pairs from text rather than exploiting them
    (Lin+ 2003; Mohammad+ 2008; Turney, 2008; Hashimoto+ 2012; Mohammad+ 2013)
  * antonym[s as features for detecting] contradictions or logical entailment
    (Marcu and Echihabi, 2002; de Marneffe+ 2008; Zanzotto+ 2009).  As far as
  * no previous work on exploiting antonymy in dialogue systems. The modelling
  * closest to ours are
    * Liu+ (2015), who use antonymy and WordNet hierarchy information to modify
      the heavyweight Word2Vec training objective;
    * Yih+ (2012), who use a Siamese neural network to improve LSA
    * Schwartz+ (2015), who build a standard distributional model from
      co-occurrences based on symmetric patterns,
      with specified antonymy patterns counted as negative co-occurrences; and
    * Ono+ (2015), who use thesauri and distributional data
