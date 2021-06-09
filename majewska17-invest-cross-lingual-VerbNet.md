O Majewska, I Vulić, D McCarthy, Yan Huang, A Murakami, V Laippala, A Korhonen
Investigating the cross-lingual translatability of VerbNet-style classification
LREC 2017, Springer 2018

# Abstract

* systematic investigation into the applicability and accuracy of the
  translation approach across different, typologically diverse languages
* We
  * develop a systematic method for translation of VerbNet classes
  * apply to Polish as the development language,
    and subsequently to Croatian, Mandarin, Japanese, Italian, and Finnish
* results demonstrate
  * high translatability with all the classes
    (96% of English member verbs successfully translated into Polish)
  * strong inter-annotator agreement
* We make  available with this paper
  * annotation guidelines and the six language-specific verb classifications

# 1 Intro

* one of the richest lexical resources currently available is VerbNet
  (Kipper+ 2000; Kipper Schuler 2005)
* morpho-syntactic and semantic properties of verbs
* has been used to support
  * semantic role labeling, computational lexicography, information extraction,
  and question-answering
  (Swier and Stevenson 2004; SW Brown and M Palmer 2012; Crouch and King 2005)
  * machine translation, parsing, or word sense disambiguation
  (Aziz and Specia 2011; Shi and Mihalcea 2005; Bailey+ 2015;
  Dang 2004; Kawahara and Palmer 2014; Windisch Brown+ 2011)
  * class-based back-off
* semantic or syntactic features (Kipper+ 2006)
* VerbNets for other languages, including
  * Spanish and Catalan (Aparicio+ 2008),
  * Czech (Pala and Horák 2008),
  * Mandarin (Liu and Chiang 2008), and
  * Italian (Busso and Lenci 2016)
* translation of VerbNet classes has been done
  * to support both the manual development of VerbNets (Pala and Horák 2008) as
  * gold standards for (semi-)automatic verb classification
    (Sun+ 2010; Scarton+ 2014)
* the paper is organized as follows. Section
  2. linguistic hypothesis and theoretical justification
    * architecture of VerbNet and
    * related research, including recent cross-lingual work.  Section 3
  3. method adopted for translating verb classes
    * evaluation on Polish, chosen as the development language, and includes an
    * analysis of inter-annotator agreement and challenges to the translation
  4. the results of the multilingual experiment
    * evaluation of an alternative automatic approach against our manual one
    * discussion of the impact of cross-linguistic variation
  5. conclusions and directions for future work

# 2

* not be limited to English: interrelatedness of syntactic behaviour and meaning
  * discrepancies between particular verb and alternation inventories,
  * the basic meaning components of verb classes have been argued to be
    cross-linguistically valid (Jackendoff 1992). For example, Levin (1993)
  * Warlpiri manifest analogous behaviour to English with respect to the
    conative alternation 1 (it is found with hit-type and cut- type verbs, but
    not break-type and touch-type verbs). In
  * Polish verbs pattern like English verbs in terms of the middle construction:
* The stipulated cross-linguistic validity has implications for the creation of
  VerbNet style resources to support NLP in other languages. Yet few languages
  boast Levin-style classifications and resources similar to the English
  * developed manually from scratch, aiming to capture properties specific to
    the language in question, e.g., resources for Spanish and Catalan (Aparicio+
    2008), Czech (Pala and Horák 2008), and Mandarin (Liu and Chiang 2008)
  * (semi-)automatically, using already existing resources and aiming to reduce
    * Brazilian Portuguese (Scarton and Aluısio 2012), French (Pradet+ 2014),
      and Croatian (Mikelić Preradović and Boras 2013). Also
  * fully automatic methods have been used, e.g., for French (Sun+ 2010) and
    Brazilian Portuguese (Scarton+ 2014).  However, this work has been limited

# 3 Translation of verb classes: method and evaluation on Polish

* We adopt the basic method of Sun+ (2010) for translating VerbNet
* classification chosen for translation was
  the VerbNet data used by Sun+ (2008) and
  * previously translated from English into French (Sun+ 2010) and
    Brazilian Portuguese (Scarton+ 2014). This resource
  * includes 17 fine-grained classes sampled from different parts of the
    VerbNet taxonomy, with 12 member verbs each
    (e.g., ‘9.1 PUT’ class: bury, place, install, put, mount, deposit,
    position, set, situate, immerse, insert, stash)
* stages of the proposed method
  1. translation of the 12 member verbs from each class
  2. selection and elimination of candidate verbs based on
    * syntax i.e., participation in diathesis alternations and subcat
      * involved translation of syntactic frames and diathesis alternations
    * semantic characteristics

## 3.2 Test case: Polish

* characteristics which distinguish it from English are
  verbal aspect and its extensive case system, which have been
  argued to pose a challenge to Levin-style classification (Gawronska 2001;
  Pala and Horák 2008)

## 3.3 Data analysis

* 74% of VerbNet frames could be directly translated into Polish
* those derived from [English] were sufficient
  as evaluation criteria of class membership

# 4 Multilingual transfer of verb classes

## 4.2 Comparison of manual versus automatic approach

* we chose Mandarin as the test language

## 4.3 Discussion of the impact of language differences

### 4.3.1 Morphosyntactic alignments and morphological complexity

* In Mandarin, an SVO language, there is a serial verb constructions, where
  * two or more verbs (or VPs) appear concatenated together,
  * often involving the so-called coverbs,
    sharing properties of verbs and prepositions, and thus posing a challenge
    for classification
* Finnish, an agglutinative nominative-accusative language + extensive case
  * different verb forms to convey transitivity distinctions
* Italian, characterised by the
  * same basic word order as English but allowing for much more flexibility,
  * distinct English verbs translated into the same Italian verbs or
    into phrases and idiomatic expressions rather than single words, which

### 4.3.2 Lexicalization patterns and varying verb inventories

* what elements of an event are encoded in or outside the verb. The
* assumption
  * languages analyse similar events using similar types of conceptual
    components and that cross-linguistic variation is constrained,
  * it is therefore possible to classify languages into types
    based on the lexicalization options (Levin and Hovav 2015)
* Talmy’s (1985) examination of directed motion verbs reveals that
  * languages encode ‘Path’ and ‘Manner’
    1. conflating ‘Manner’ with ‘Motion’ inside the verb, e.g.  English _roll_
    2. expressing ‘Motion’ + ‘Path’ in the verbal root or
      e.g. Romance languages (Folli and Ramchand 2005)
      * ‘Manner’ may be expressed as a gerundive
    3. ‘Motion’ + ‘Figure’ are lexicalized in the verb root, e.g. Navajo

### 4.3.3 Causativity and transitivity

* Croatian, Polish ..., and Italian require a reflexive pronoun to
  accompany the non-causative verb
  * The basic verb form is agentive (transitive),
* whereas Japanese verbs referring to states are
  * mainly lexicalized in the non-causative type and a
  * agentive: causative verb form, with an inflection added to the stem,
* Finnish, however, two different verbs [_kuivasi_; _kuivuivat_]
  express the transitive (22a) and intransitive meaning

### 4.3.4 Cross-linguistic commonalities

* e.g. all languages studied allow ‘remove’ verbs to appear in frames such as
  NP V NP PP.SOURCE (I removed the stains from the tablecloth)
* Further research is necessary to investigate the applicability of the method
  to e.g. ergative and active-stative languages,

# 5 Conclusion and future work

* stages
  * detailed, language-independent translation guidelines were developed and
    the task was completed by the pilot linguist
  * five native speakers of Polish, two with linguistic training and three
    without it, completed the gold standard translation task following the
    * recorded information about every stage of the process, which provided
  * another five participants performed the translation of verb classes into
    their native languages, Croatian, Mandarin, Italian, Japanese, and Finnish
* the translation approach allows creation of verb classifications
  in languages lacking NLP resources
  * language-specific expertise of the translator will likely be indispensable
* future work
  * use this type of classification to support multilingual NLP
    * cross-lingual word embeddings can support cross-lingual projection
      (Guo+ 2015; Ammar+ 2016; Upadhyay+ 2016; Vulić+ 2017)
  * how verb classes obtained here compare to Brown-style clusters
    as in the work of Täckström+ (2012) and Ammar+ (2016)
  * extend the study to WordNet, FrameNet and PropBank
