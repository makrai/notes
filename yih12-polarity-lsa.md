Polarity inducing latent semantic analysis
W Yih, G Zweig, JC Platt
2012 Joint EMNLP-CoNLL

#Abstract

* new vector space representation where
  * antonyms lie on opposite sides of a sphere
  * with the aid of a thesaurus and latent semantic analysis (LSA)
  * each entry in the thesaurus – a word sense + synonyms and antonyms – is
    treated as a “document,” ...  subjected to LSA
  * how to assign signs to the entries in the co-occurrence matrix [before] LSA
* evaluate
  * with the Graduate Record Examination questions (GRE, Mohammad+ 2008)
    * test of closest-opposites
* Further improvements result from
    * discriminative training, and
    * augmenting the training data with general newspaper text
    * we improve on ... previous results by 11 points absolute in F measure

#1 Introduction

* Cruse (1986) notes that numerous kinds of antonymy are possible, for example
  antipodal pairs like “top-bottom” orgradable opposites like “light-heavy.”
  Work in this area includes (Turney, 2001; Lin et al., 2003; Turney and
  Littman, 2005; Turney, 2006; Curran and Moens, 2002; van der Plas and
  Tiedemann, 2006; Mohammad et al., 2008; Mohammad et al., 2011)
  * [still] a difficult open problem in general (Poon and Domingos, 2009)
* we present a novel method for assigning both negative and positive values
  to the TF-IDF weights used in latent semantic analysis

#2 previous work

#3 the classical LSA approach and analyzes some of its limitations. In Section

#4 we present our polarity inducing extension to LSA

#5 supervised discriminative training

#6 embedding new words in the thesaurus-derived subspace

#7 experimental results

#8 method outperforms previous approaches on a GRE
