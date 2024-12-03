XL-AMR: Enabling Cross-Lingual AMR Parsing with Transfer Learning Techniques
Rexhina Blloshmi, Rocco Tripodi, Roberto Navigli
EMNLP 2020

github.com/SapienzaNLP/xl-amr

#Abstract

* Abstract Meaning Representation (AMR) is a popular formalism
  * represents the meaning of a sentence as a semantic graph
  * agnostic about how to derive meanings from strings 
  * training data are scarce in languages other than English 
  * existing English AMR parsers are not directly suited to being used in a
    cross-lingual setting
* we explore different transfer learning techniques for producing automatic AMR
  annotations across languages and 
  * we develop a cross-lingual AMR parser, XL-AMR
    * can be trained on the produced data and does not rely on AMR aligners or
      source-copy mechanisms as is commonly the case in English AMR parsing.
* significantly surpass previous in Chinese, German, Italian and Spanish
* qualitative analysis sheds light on the suitability of AMR across languages
* conclusion
  * We created silver data based on annotation projection through parallel
    sentences and machine translation, on which we trained XL AMR
  * qualitative evaluation showed that 
    XL AMR is able to handle most of the structural divergences among langs.
  * carefully modeling cross-lingual AMR parsing leads to the production of
    suitable AMR structures across languages
  * a promising to extend this line of our research

# Introduction

* applications
  * information extraction (Rao+ 2017)
  * text summarization (Hardy and Vlachos, 2018; Liao+ 2018)
  * paraphrase detection (Issa+ 2018)
  * spoken language understanding (Damonte+ 2019)
  * machine translation (Song+ 2019b) and
  * human-robot interaction (Bonial+ 2020). It is therefore
* desirable to extend AMR across languages along the lines of
  cross-lingual representations for
  * grammatical annotation (de Marneffe+ 2014),
  * concepts (Conia and Navigli, 2020) and
  * semantic roles (Akbik+ 2015; Di Fabio+ 2019)
* AMR formalism aims at abstracting away from word forms
  * unanchored, ie, the linkage between tokens in a sentence and nodes in the
    corresponding graph is not explicitly annotated. Hence, the feature of being
  * initially designed for encoding the meaning of English sentences. Owing to
    * resources and modelling techniques focus mostly on English, while leaving
  * cross-lingual AMR understudied. Some
    * preliminary studies showed the limits of AMR as an interlingua,
      categorizing them as due to distinctions in the underlying ontologies or
      structural divergences among languages (Xue+ 2014; Hajič+ 2014). More
    * AMR or a simplified version of it can be used as a formalism for
      cross-lingual semantic representation, showing that
      it is possible to overcome some of the structural linguistic divergences
      (Damonte and Cohen, 2018; Zhu+ 2019).
* The underlying idea of this paper is that AMR can be used in different langs
  * there exist key linguistic features that are shared across languages
  * eg predicates, roles and conjunctions (Von Fintel and Matthewson, 2008).
* acquiring semantic annotations for a large number of sentences is a slow and
  expensive process in NLP (Zhang+ 2018; Pasini, 2020)
* cross-lingual AMR parsing, ie, the task of
  transducing a sentence in the source language into an AMR graph based on Engl
  (Damonte and Cohen, 2018).
* We study different transfer learning techniques to enable its training:
  * model transfer which relies on language-independent features,
  * annotation projection relying on parallel corpora and available English AMR
    parsers, and
  * automatic translation of the training corpora which guarantees gold AMR
    structures. We make the following
* contributions:
  * XL AMR, a crosslingual AMR parser which disposes of word aligners, ie,
    word-to-word and word-to-node, and surpasses the previously reported results
    on Chinese, German, Italian and Spanish, by a large margin.
  * Exploration of different techniques to create cross-lingual AMR training
    data, showing how it is possible to transfer semantic structure information
    across different languages.
  * Creation and release of diverse quality silver data for cross-lingual AMR
    parsing.
  * Qualitative analysis of the ability of XL AMR to transfer semantic
    structures across languages and of AMR to represent the meaning of sentences
    cross-lingually.

# 2 Related Work

* Our work lies between semantic parsing and cross-lingual transfer learning

## Semantic parsing 

* formalisms have been proposed over the years to encode semantic structures:
  * Elementary Dependency Structures (Oepen and Lønning, 2006, EDS)
  * Prague Tectogrammatical Graphs (Hajič+ 2012, PTG)
  * Universal Conceptual Cognitive Annotation (Abend and Rappoport, 2013, UCCA)
  * Universal Decompositional Semantics (White+ 2016, UDS)
* UCCA and UDS, have been exploited in a cross-ling (Lyu+ 2019; Zhang+ 2018),
* cross-lingual AMR has
  * within the scope of annotation analysis works (Xue+ 2014; Hajič+ 2014).
  * limitations of AMR as an interlingua, and consider them partly due to the
    distinctions in the underlying ontologies and structural divergences among
    languages.
  * Zhu+ (2019) also evaluate the properties of AMR across languages and aim at
    simplifying this formalism in order to express only essential semantic
    features of a sentence, such as predicate roles and linguistic relations.
  * lack of training data and evaluation benchmarks in languages other than
  * Damonte and Cohen (2018) propose the only cross-lingual AMR parser to date
    * cross-lingual AMR evaluation benchmark (Damonte and Cohen, 2020)
    * transition-based English AMR parser (Damonte+ 2017) for cross-lingual AMR
    * trained on silver annotated data.  However, the
    * performances it has achieved are not satisfying in terms of Smatch score
      (Cai and Knight, 2013), mostly as a result of
      * concept identification errors, which in turn are directly related to the
      * noisy word-to-node alignments projected from English.  Throughout the
        literature English AMR parsers commonly rely on
* AMR alignments
  * automatically created using heuristics (Flanigan+ 2014), or on
  * pretrained aligners (Pourdamghani+ 2014; Liu+ 2018),
  * treated as latent variables of the model (Lyu and Titov, 2018) or
  * implicitly modelled through source-copy mechanisms (Zhang+ 2019). These
  * take advantage of that AMR nodes and English words are highly related. 1
  * Our parser, instead, disposes of explicit and implicit AMR alignments using
    a seq2seq model for concept identification and achieves significantly
    higher performance on all the tested languages. On the other hand,
* to account for data sparsity, XL AMR employs several common techniques in
  English AMR parsing literature (Konstas+ 2017; Zhang+ 2019), such as
  anonymization and recategorization, expanding them across languages by relying
  on multilingual resources.

## Transfer learning

* idea: leverage annotations available in one language, commonly English, to
  enable learning models that generalize to languages where labelled resources
  are scarce (Ruder+ 2019).  Different
* techniques include annotation projection, machine translation and
  language-independent feature-based models.
* applied to different NLP tasks, ie,
  * WSD (Barba+ 2020)
  * SRL (Padó and Lapata, 2009; Kozhevnikov and Titov, 2013)
  * Dependency Parsing (Tiedemann, 2015)
  * concept representation (Conia and Navigli, 2020)
* In cross-lingual AMR parsing, annotation projection is employed by Damonte and
  Cohen (2018), who produce cross-lingual silver AMR annotations by exploiting
  parallel sentences selected from the Europarl corpus (Koehn, 2005): English
  sentences are parsed using an English parser (Damonte+ 2017, AMREager) and
  the resulting graphs are associated with the corresponding parallel sentences.
  However, the data on which AMREager was trained is very different from those
  used to produce the silver annotations, thus affecting the quality and
  reliability of the AMR graphs produced. Here
* we test two different techniques: we conduct experiments with
  * annotation projection using Europarl for comparison, and, in addition, we
  * translation techniques to produce better quality training corpora. This

# 5 Qualitative Analysis

## Translation divergences We investigate how deals with the cases where there

* translation divergences, ie when source and target language have different
  syntactic ordering properties (Dorr, 1990), as
  * classified by Dorr (1994) using the following 7 categories: thematic,
    promotional, demotional, structural, conflational, categorial, lexical
* thematic divergence: when the argument-predicate structure is different across
  * eg _I like travelling_ where I is the subject, in
    * Italian: _Mi piace viaggiare_, and _Mi_ is now the object
    * XL AMR overcomes this divergence and predicts the correct AMR
    (l / like-01 :ARG0 (i / I) :ARG1 (t / travel :ARG0 i))
* Promotional and demotional divergences are both head switching
  * head-switching is a macro-category
  * when a modifier in one language is promoted to a main verb in the other, or
  * eg John usually goes home is Juan suele ir a casa (John is accustomed to
    go home) in Spanish.  XL AMR correctly parses the sentence into
    (g / go01
     :ARG0 (p / person :name (n / Juan))
     :ARG4 (h / home)
     :mod (u / usual))
* A structural divergence exists when a verbal
  * object is realized as a NP in one language and as PP in the other,
  * eg _I saw John_ is translated as Vi a Juan (I saw to John) in Spanish
  * This also is not a problem for our parser, which predicts the correct graph,
    (s / see-01 :ARG0 (i / I) :ARG1 (p / person :name (n / Juan))).
* A conflational divergence: the translation of two or more words into one
  * The above errors in German compounded words fall into this category and
  * our model does not handle them properly.  However, regarding
  * other example: I fear translates into Io ho paura (I have fear) in Italian
    and the parser correctly predicts the AMR graph, (f / fear-01 :ARG0 (i / I))
* A categorical divergence: the same meaning is expressed by different syn cats
  * eg I agree, where agree is a verb, is expressed by a noun in It, Sp
  * Sono d’accordo and Estoy de acuerdo.  The parser correctly predicts
    the same AMR for both languages, (a / agree-01 :ARG0 (i / I))
* A lexical divergence arises when a verb in the source language is translated
  * eg John broke into the room, Juan forzó la entrada al cuarto `force` Sp
  * XL AMR predicts (f / force-01 :ARG0 (p / person :name (n / Juan)) :ARG2 ...)
  * even though it is correctly parsed, it results in different AMR graphs for
  * partially due to the fact that AMR is bounded to lexical forms in English.
* In summary, XL AMR overcomes most of the foregoing structural divergences with
  the exception of two cases:
  * the conflational divergence in German, that is caused by the compound words
    * better preprocessing can be beneficial;
  * the lexical divergence that persists
    * might be tackled by integrating a unified ontology for synonyms or related
      meanings within the AMR formalism,
      * along the line of disjunctive AMR (Banarescu+ 2013). We leave

# Conclusion

* future: exploit larger multilingual semantic resources, in order to further
* integrate AMR representations be into downstream crosslingual tasks to
