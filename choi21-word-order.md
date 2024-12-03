Investigating Dominant Word Order on UD with Graph Rewriting
HS Choi, B Guillaume, K Fort, G Perrier
Recent Advances in Natural Language Processing (RANLP2021) 11 days ago

* experiments we performed on the Universal Dependencies 2.7 corpora in order to
  investigate the dominant word order in the available languages. For this
  * we used a graph rewriting tool, GREW, which allowed us to
    go beyond the surface annotations and identify the implicit subjects
* We first measured the distribution of the six different word orders (SVO,...)
  * investigated when there was a significant difference in the corpora within a
    given language. Then, we
  * compared the obtained results with information provided in the
    WALS database (Dryer and Haspelmath, 2013) and inÖstling (2015). Finally, we
  * examined the impact of using a graph rewriting tool for this task. The tools
    and resources used for this research are all freely available

# 1 Introduction

* Language typology has proven to be useful in natural language processing (NLP)
  (Bender, 2016; O’Horan+ 2016), for example for improving performance in
  * Emily M. Bender
    Linguistic typology in natural language processing
    Linguistic Typology, 2016 20:645– 660
  * Helen O’Horan, Yevgeni Berzak, Ivan Vulić, Roi Reichart, and Anna Korhonen
    Survey on the use of typological information in natural language processing
    COLING 2016
  * language transfer (Naseem+ 2012; Ahmad+ 2019) and joint learning
* WALS (Dryer and Haspelmath, 2013) the most popular typological NLP rsrc
  * broad coverage of features and languages”. However, the WALS database  has
  * compiled from the work of 55 linguists and is
  * not systemically based on a large quantity of data
  * not provide all the considered features for all the languages it covers
* Universal Dependencies (UD) framework (Nivre+ 2016) provides a large number of
  * in version 2.7, there are 183 corpora for 104 languages)

# 2 Previous Work

## UD-based SO Typology

* Liu (2010) presented a statistical overview of several binary parameters
  including SV vs VS, OV vs VO on 20 languages compared with WALS’. However,
  * conducted before the UD framework, on treebanks with different annotation
* closest work to ours is that of Östling (2015). He considered word order
  * based upon the translated and aligned new testament in almost 1,000 langs
  * compared his results with WALS data. The main difference with our work is
* UD treebanks were also used to study word order freedom
  * Futrell+ (2015) and Berdicevskis and Piperski (2020)
    focusing on the correlation with case marking
* Alzetta+ (2018) applied a plausibility assessment algorithm to the UD treebs
  to assess its usability in identifying typological features. They
  * focused on the subject-verb and adjective-noun orders in three languages,
    English, Italian and Spanish. While their
  * analysis is quite thorough, the algorithm they employed is not available, so
    their work cannot be extended
* Gerdes+ (2019b) tested some of Greenberg’s universals on UD. Their work does
  * 45 linguistic universals (Greenberg, 1963)
    dealing with basic word order, morphology and syntax based on 30 languages
  * focuses on only whether the verb is before or after the object/subject
  * they merge the treebanks for multi-corpora languages

## 2.2 Enriching UD Annotations

* There is no easy way to decide
  which dependency relations should be taken into account in order to observe
  * In basic UD annotations, the tree restriction impose some arbitrary choices:
  * not possible to consider that the same token can be used as subject of more
  * we try to overcome this limitation by making explicit some “syntactic” rels
* Enhanced Universal Dependencies and the Deep Universal Dependencies
  * Enhanced Universal Dependencies (EUD, Schuster and Manning 2016). The goal
  * for natural language understanding tasks,
    making some of the implicit relations between words more explicit
  * Five kinds of new annotations are considered in this framework 3: adding null nodes for elided predicates
    * propagating relations over conjuncts
    * adding subject relations for control and raising constructions
    * adding coreference in relative clause constructions and
    * modifier labels that contain the preposition or other casemarking
  * requires manual annotation, available in only 34 of the 183 treebanks in
    * some of these 34 treebanks have only a part of the five extensions
* Deep Universal Dependencies (DUD, Droganova and Zeman, 2019) is also to
  * relations that are closer to predicate-argument structure than the
  * relations names (arg1, arg2,...) borrowed from semantic frameworks like
    the Abstract Meaning Representation (AMR, Banarescu+ 2013)
  * built automatically from EUD when annotations are available or with an
    automatic production of EUD for other corpora. 4

# 3

## 3.2

* Inspired by Dryer (2013),
  dominant order for a given corpus provided that it is at least twice as freq
  * else we consider the corpus to be NDO (No Dominant Order).  This allows us
    e.g. GERMAN-GSD with implicit subjects shows 35.7% SOV and 34.8% SVO)
  * When the results differ among corpora of a given language,
    we study the corpora on a case by case basis

# 7 Comparing  with the same analysis on basic UD annotations only (no implic S)

# 8 Conclusions and Perspectives

* our results differ from WALS’ for 11 languages, and for these,
  a more thorough analysis should be conducted by specialists of said languages
* explore other universals, like Greenberg’s (Greenberg, 1963) or
* other missing features in WALS
* reorganise more deeply the tree dependency graph
  * In Gerdes+ (2019b), the observations were done on such a deeper reorg of the
    reorganisation proposed in Surface Syntactic Universal Dependency (Gerdes+
    2019a) which was already produced using Grew-based graph rewriting
