M Köper, C Scheible, S Schulte im Walde
Multilingual Reliability and "Semantic" Structure of Continuous Word Spaces
Proceedings of the 11th International Conference on Computational Sem 2015

# Abstract

experiments with continuous word vectors for English and German, a
morphologically rich language
* evaluation [on existing] and newly created datasets of
  morpho-syntactic and semantic relations.  Our
* results show that
  1. morphological complexity causes a drop in accuracy, and
  1. continuous representations lack the ability to solve analogies of
     paradigmatic relations

# Intro

* Zuanović+ (2014), who achieved strong performance for superlative and
country-capital analogies in Croatian

# 2 Data

* semantic relation dataset (Sem-Para) also contains analogy tasks. Here, the
  paradigmatic relation between A and B is the same as between C and D. The
  * antonymy, synonymy, and hypernymy relation pairs
    collected by
      Lenci & Benotto for English and by
      Scheible & Schulte im Walde for German, using the
    methodology described in Scheible and Schulte im Walde (2014):
      * random selection of target nouns, verbs and adjectives from
        WordNet/GermaNet – balanced for semantic class, degree of polysemy, and
        frequency according to the WaCKy corpora (Baroni+ 2009)
      * Amazon Mechanical Turk
* we created an analogy dataset with 10 000 unique analogy questions from the
  hypernymy and meronymy relations in BLESS (Baroni and Lenci, 2011), by
  randomly picking semantic relation pairs. BLESS is available only for
  English,
* RG (Rubenstein and Goodenough, 1965) and its German equivalent Gur65
  (Gurevych, 2005)
* WordSim353 (Finkelstein+ 2001) and its translation into German
  WordSim280 by Schmidt+ (2011): As Schmidt+ did not re-rate the
  German relation pairs after translation (which we considered necessary due
  to potential meaning shifts), we collected new ratings
* 80 TOEFL (Test of English as a Foreign Language) questions by Landauer and
  Dumais (1997) for English, and 426 questions from a similar collection by
  Mohammad+ (2007) for German
