Two Multivariate Generalizations of Pointwise Mutual Information
Tim Van de Cruys
ACL-Workshop on Distributional Semantics and Compositionality 2011

#Abstract

* [in NLP], PMI has [been a] useful association measure
  * e.g. collocation extraction and word space models
* we explore
  * two multivariate generalizations of PMI, and
  * their usefulness and nature in the extraction of SVO triples

#1 Introduction

* Mutual information (Shannon and Weaver, 1949) is a measure of mutual dep
  * instantiation for specific outcomes called pointwise mutual information
* in the NLP community 
  * collocation extraction (Church and Hanks, 1990)
  * word space models (Pantel and Lin, 2002)
* [multivariate]
  * tensor decomposition [in] the NLP community (Turney, 2007; 
    Baroni and Lenci, 2010; Giesbrecht, 2010; Van de Cruys, 2010)
* little attention has been devoted to the weighting of ...  cooccurrences

#2 Previous work, mainly in the field of information theory

* interaction information (McGill 1954)
  * based on the notion of conditional entropy
    described in section 3.2.1 below
* total correlation (Watanabe 1960)
  * solely based on the commonalities of the random variables,
  * presented in section 3.2.2

# 3 the two generalizations of PMI are

* based on their global [non pointwise] multivariate counterparts
* the global case ought to be the expected value for all the instantiations

##3.2 Multivariate mutual information

###3.2.1 Interaction information

* Interaction information (McGill, 1954) –
  also called co-information (Bell, 2003) – is
  based on the notion of conditional mutual information
* specific interaction information as follows
* [the numerator and the denominator] have been swapped ... to ensure a proper
  set-theoretic measure (Fano, 1961; Reza, 1994)

###3.2.2 Total correlation

* Total correlation (Watanabe, 1960) –
  also called multi-information (Studený and Vejnarová, 1998)
  quantifies the amount of information that is shared among the ... variables,
  thus expresses how related a particular group of random variables are
* we can straightforwardly define the correlation for specific instances
  * we coin specific correlation
  * this measure has been used in NLP tasks before, notably
    for collocation extraction (Villada Moirón, 2005)
    * Begoña Villada Moirón
      PhD 2005
      Data-driven identification of fixed expressions and their modifiability

# 4 applications in the light of NLP ,

* extraction of salient subject verb object triples ... for Dutch
  * Twente 18 Nieuws Corpus (Ordelman, 2002), a 500M Dutch word corpus, has
  * I = 10~000, J = 1~000, K = 10~000. Finally,
  * two new tensors U and V have been constructed
    * U has been weighted using specific interaction information (equation 8)
    * V has been weighted using specific correlation (equation 11)
* Table 1/2 shows the top five subject verb object triples that received the
  highest specific {interaction information/correlation} score
  (both with f > 30)
* both methods are able to extract salient subject verb object triples,
  * prototypical svo combinations (‘poll represents opinion’)
  * fixed expressions (Dutch ‘the circumstances change the course’)
* Comparing both methods, ... the extracted triples are similar for both
  * results can differ significantly for e.g. ‘play’.  Table 3 indicates that
    * specific interaction information picks up on prototypical svo combos
      e.g. ‘orchestra plays symphony’ [and] 4 other triples that
    * Specific correlation (table 4), on the other hand, picks up on the
      ‘play a role’ and salient subjects that go with the expression
* we performed a small-scale manual evaluation of the 100 [high] triples
  * A triple is considered salient when it is
    made up of a fixed (multi-word) expression, or when it 
    consists of a fixed expression combined with a salient subject or object
    (e.g. ‘argument cut wood’)
  * bare frequency tensor was used as a baseline, precision = 0 %
  * interaction .24
    correlation .31
* we computed Kendall’s `τ_b` to compare the rankings yielded by the two
  * `τ_b` = 0.21, indicating that the [methods] differ to a significant extent

#5 Conclusion and future research

* future work
  * the exact nature of the dependencies that [the two diff]  measures capture
  * proper quantitative evaluation on different multi-way co-occurrence
    (factorization) tasks, in order to indicate which measure works best, and
    which measure might be more suitable for a particular task
