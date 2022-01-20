Spandana Gella, Desmond Elliott, Frank Keller
Cross-lingual Visual Verb Sense Disambiguation
NAACL 2019; fix typo in author name

# Abstract

* Recent work has shown that visual context improves cross-lingual noun WSD
* We extend this line of work to verbs
  * MultiSense dataset of 9,504 images
    annotated with English, German, and Spanish verbs. Each image in MultiSense
* We show that
  * cross-lingual verb sense disambiguation models benefit from visual context,
    compared to unimodal baselines
  * the verb sense predicted by our best disambiguation model can
    improve the results of a text-only machine translation system
    when used for a multimodal translation task

#1 Intro

* visual word sense disambiguation
  * noun senses (Barnard and Johnson, 05; Loeff+ 06; Saenko and Darrell, 08),
  * extended to verb senses (Gella+ 2016, 2019)
* ambiguity is particularly crucial for translation tasks
  * translations often correspond to word senses
    (Carpuat and Wu, 2007; Navigli, 2009)
    e.g. _ride_ in German as fahren (ride a bike) or reiten (ride a horse)
* multimodal machine translation is unresolved for verbs
  (Specia+ 2016; Shah+ 2016; Hitschler+ 2016; Lala and Specia, 2018)
* cross-lingual WSD
  * limited in scale and no visual (Lefever and Hoste, 2013)
* Visual information for bilingual lexicon induction
  * images are used as a pivot between languages or
  * visual information is combined with cross-lingual vector spaces
    (Bergsma and Van Durme, 2011; Kiela+ 2015; Vulic+ 2016)
  * mainly targeted nouns and perform poorly for verbs
* Gella+ (2017) and Kádár+ (2018) has shown using image as pivot between
  languages can lead to better multilingual multimodal representations and can
  * successful applications in
    crosslingual retrieval and multilingual image retrieval
* MultiSense dataset of 9,504 images
  annotated with English verbs and their translations in German and Spanish
  * For each image in MultiSense, the English verb is translation-ambiguous
    to German or Spanish
* We propose a series of disambiguation models that,
  given an image and an English verb, select the correct translation of the V
  * multimodal models that fuse textual context with visual features outperform
* full sentence
  * we annotate a part of our MultiSense dataset with en--de image descriptions
* two existing multimodal translation evaluation sets with ambiguous words
  * Ambiguous COCO dataset (Elliott+ 2017) contains sentences that are
    “possibly ambiguous”, and the
  * Multimodal Lexical Translation dataset is restricted to predicting single
    words instead of full sentences (Lala and Specia, 2018).  This type of
    resource is important for multimodal translation because it is known that
* humans use visual context to resolve ambiguities for nouns and gender-neutral
  words (Frank+ 2018)
* Here, we use the verbs predicted by our visual sense disambiguation model to
  constrain the output of a neural translation system and demonstrate a
  * clear improvement in Meteor, BLEU, and verb accuracy over a text-only baseln
