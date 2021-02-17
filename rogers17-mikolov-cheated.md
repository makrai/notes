Anna Rogers, Aleksandr Drozd, and Bofang Li
The (Too Many) Problems of Analogical Reasoning with Word Vectors
`*`SEM 2017

# Absztrakt helyett

* philosophy of analogy
* accuracy on the analogy task depends on the target [being] close to the src
  * not only for 3CosAdd, but also 3CosMul and LRCos

# 1 Intro

* Given the vital role that analogical reasoning plays in human cognition
  * automated analogical reasoning could become a game-changer in many fields,
  * a universal mechanism for detecting linguistic relations (Turney, 2008) and
    word sense disambiguation (Federici+ 1997)
  * It is already used in many downstream NLP tasks, such as
    * splitting compounds (Daiber+ 2015)
    * semantic search (Cohen+ 2015)
      Trevor Cohen, Dominic Widdows, and Thomas Rindflesch.
      Expansion-by-analogy: a vector symbolic approach to semantic search
      In Quantum Interaction, 2015 Springer, pages 54–66
    * cross-language relational search (Duc+ 2012)
* One way to explain the current limitations is to attribute them to the
  imperfections of the models and/or the corpora they are built on:
  with this view, in a perfect VSM, any linguistic relation should work
* The alternative to be explored in this of paper is that perhaps natural
  language semantics is more complex
  * there may be both theoretical and in mathematical issues with analogical
    reasoning with word vectors and 3CosAdd
* [we] show the accuracy of 3CosAdd depends on proximity of the target to its
  source (i.e. queen should be quite similar to king)

# Background: “Relational Similarity” vs “Word Analogies”

* The most fundamental term [is not analogy, but] relational similarity, i.e
  ... that pairs of words may hold similar relations
  * similarity rather than identity:
    “instances of a single relation may still have significant variability in
    how characteristic they are of that class” (Jurgens+ Semeval 2012)
* Analogy [in philosophy and logic is] quite different
  * “classical” analogical reasoning follows roughly this template:
    objects X and Y share properties a, b, and c; therefore, they may also
    share the property d
    For example, both Earth and Mars orbit the Sun, have at least one moon,
    revolve on axis, and are subject to gravity; therefore, if Earth supports
    life, so could Mars (Bartha, 2016)
* The NLP move from relational similarity to analogy follows the use of the
  term by Turney (2006)
* Bigger Analogy Test Set (BATS, Gladkova+ 2016)
* not all relations can be identified in this way, with ... synonymy and
  antonymy being particularly difficult (Köper+ 2015; Vylomova+ 2016)
* The assumption of a single best-fitting [answer is also] targeted
  (Newman-Griffis+ 2017)
* Drozd+ (2016): some relations missed by 3CosAdd could be recovered with a
  supervised method

# 3 What Does 3CosAdd Really Do?

# 3.1 Methodology

* We present a series of experiments performed with BATS dataset
* [more relations and more difficult than the] Google test
* balanced across derivational and inflectional morphology, lexicographic and
  encyclopedic semantics (10 relations of each type)
* The evaluation with 3CosAdd and LRCos methods was conducted with the Python
  script that accompanies BATS
* 3CosMul, a multiplicative objective proposed by Levy and Goldberg (2014),
  now available in the same script

## 3.2 The “Honest” 3CosAdd

* 3CosAdd as initially formulated by Mikolov+ (2013c) excludes `a`, `a_0` and b

## 3.3 Distance to the Target Vector

* Levy and Goldberg (2014) suggested that 3CosAdd method is
  mathematically equivalent to seeking a word `b_0` which is similar to `b`
  and `a_0` but is different from `a`
* the accuracy of 3CosAdd decreases as the distance in vector space increases
* 3CosAdd is the most successful when all three source vectors are relatively
  close to each other and the target vector
* could explain ... the overall lower performance on BATS derivational
  morphology questions [as opposed to inflectional] or encyclopedic semantics
  * man [and woman are] reasonably similar distributionally, as
    they combine with many of the same verbs: both men and women sit, sleep
    the same could not be said of words derived with prefixes that change POS
* snow: white :: sugar: ?white, the correct answer would a priori be excluded
  * In BATS data, this factor affects several semantic categories, including
    country:language, thing:color, animal:young, and animal:shelter

## 3.5 Density of Vector Neighborhoods

* we can hypothesize that the more crowded a particular region is, the more
  difficult it should be to hit a particular target
* density of vector neighborhoods is not ... straightforward to measure
  * we estimate density as the similarity to the 5th neighbor
* results seem counter-intuitive: denser neighborhoods actually yield higher
  * [but] there are virtually no cases of very tight neighborhoods)

# 4 Comparison with Other Methods

* 3CosAdd, has much higher chances of success where target vectors are close
* We also consider LRCos, a method based on supervised learning from a set of
  word pairs (Drozd+ 2016)
  * given a set of word pairs, the available examples of the [female class] and
    randomly selected negative examples are used to learn a representation of
    the target class with a supervised classifier. The question is this: what
    word is the closest to king, but belongs to the “women” class?
* With LRCos ..., we see the same trend: closer targets are easier to hit
* accuracy of LRCos is much higher than the top-1 3CosAdd or 3CosMul
* [the “honest” version of LRCos] performs just as well as the “dishonest” one
  * consistent with the results reported by Drozd+ (2016). As for 3CosMul,
* Levy+ (2015) show that 3CosMul outperforms 3CosAdd in PPMI, SGNS, GloVe and
  SVD models with the Google dataset, sometimes yielding 10-25% improvement
* Our BATS experiment confirms the overall superiority of 3CosMul to 3CosAdd,
  although the difference is less dramatic

# 5 Discussion: What Should We Expect from the Word Analogy Task?

## 5.1 How Regular Are “Linguistic Regularities”?

* frustratingly small margin of error

## 5.2 Can We Just Blame the Corpus?

* polysemy
* In addition to irrelevant information, there is also missing information
* data that the current VSMs do not have, including multimodal data and
  frequencies of events too commonplace to be mentioned in writing (Erk, 2016)

## 5.3 Semantics is Messy

* asymmetry of similarity judgments (Tversky, 1977)
* analogy has long been rejected in generative linguistics as a mechanism for
  language acquisition through discovery, although now it is making a comeback
  (Itkonen, 2005)
* criticisms [of analogies:] ambiguity, guesswork and puzzle-like nature
  (Pringle, 2003)

# 6 Implications for Evaluation of VSMs

# 7 Conclusion
