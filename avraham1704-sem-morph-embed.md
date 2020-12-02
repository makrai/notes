Oded Avraham, Yoav Goldberg
The Interplay of Semantics and Morphology in Word Embeddings
2017

# Abstract

* different types of linguistic properties (surface form, lemma, morph tag)
* We train several models, where
  each uses a different subset of these properties [as] representations

# 1 Intro

* poor performance of traditional models on morphologically complex words
* The morphology-driven models allow pooling evidence from [words with the]
  same base form. These models work by learning
  * per-morpheme representations rather than just per-word ones, and compose
* The works differ in
  * the way they acquire morphological knowledge (from using
    * linguistically derived morphological analyzers on one end, to 
    * substrings ... concatenative ... morphology, on the other) and in the
  * model form
    * cDSMs (Lazaridou+ 2013)
    * RNN (Luong+ 2013)
    * LBL (Botha and Blunsom, 2014)
    * CBOW (Qiu+ 2014)
    * SkipGram (Soricut and Och, 2015; Bojanowski+ 2016)
    * GGM (Cotterell+ 2016)
* In this work we argue that these models capture two ... aspects of word sim
  * semantic (e.g. sim(walking, hiking) > sim(walking, eating)) and
  * morphological (e.g. sim(walking, hiking) > sim(walking, hiked)), and that
  * these two aspects are at odds with each other
    (should sim(walking, hiking) be lower or higher than sim(walking, walked)?)
  * base form component of the compositional models is mostly responsible for
    semantic aspects of the similarity, while the
  * affixes are mostly responsible for morphological similarity
* questions: is the
  * [ideal] combination of semantic and morph components [for each] purpose?
  * if we exclude the morphological component, wouldn’t it improve the sem?
  * contribution of using the surface form?
  * do the models behave differently on common and rare words? We explore
* We
  * compare different configurations of morphology-driven models, while
    controlling for the components
  * separately evaluate the semantic and morphological performance
    on rare and on common words
  * focus on inflectional (rather than derivational) morphology
    * derivations (e.g.  un-) often drastically change the meaning of the word,
    * benefit of [similar repr for words with the same] base is questionable,
      (Lazaridou+ 2013; and Luong+ 2013)
* experiments are performed on Modern Hebrew, a language with rich
  * recently introduced evaluation dataset for semantic similarity in M Heb
    (Avraham and Goldberg, 2016),
* we create datasets
    * rare words. We also create
    * morphological similarity, for common and rare words
* Hebrew’s morphology is not concatenative, so unlike most previous work
  * we do not break the words into base and affixes, but instead
  * rely on a morphological analyzer and represent words using their lemmas
    (corresponding to the base form) and their morphological tags (from which)
* We also compare to a strong character ngram based model
* We observe a clear trade-off between the morphological and semantic
* work mentioned above,
  * mostly just (base + affixes) or (surface + base + affixes)
  * Lazaridou+ (2013) and Luong+ (2013) trained models which
    represent a word by its base only, and showed that these models performs
    worse than the compositional ones (base + affixes)
    * hE, poor results for the base-only models were mainly attributed to
      [over-anal] e.g. (affected, unaffected).  Working with a more
    * [we] tease apart inflectional from derivational processes, leading to
  * Most of the works [evaluate eighter the semantics or morphology]

# Conclusion

* using the lemma component (either alone or together with the surface form) is
  better [for sem].  Indeed, excluding the morphological component will make
  the morphological similarity drop, but it’s not necessarily a problem for
  every task
* should include the morphological component ... only for tasks in which
  morphological similarity is required and cannot be handled by other means
* future work can be to perform an
  * extrinsic evaluation of the different models in various downstream
    * which kinds of tasks benefit from morphological information, and
    * which can be done better by a pure semantic model
