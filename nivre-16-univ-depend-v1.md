Joakim Nivre, Marie-Catherine de Marneffe, Filip Ginter, Yoav Goldberg, J Hajič,
CD Manning, R McDonald, S Petrov, S Pyysalo, N Silveira, R Tsarfaty, D Zeman
Universal Dependencies v1: A Multilingual Treebank Collection 2016

http://universaldependencies.org

# Abstract

* Cross-linguistically consistent annotation is necessary for
  * sound comparative evaluation and cross-lingual learning experiments. It is
  * multilingual system development and comparative linguistic studies.
* Universal Dependencies is an open community effort to create
  cross-ling consistent treebank annotation for many languages within a
  dependency-based lexicalist framework. In this paper,
* we describe v1 of the universal guidelines, the underlying design principles,
  and the currently available treebanks for 33 languages

# 1 Introduction

* striking illustration of this problem can be found in Figure 1, which shows
  * parallel sentences in Swedish, Danish and English,
    annotated according to the guidelines of the
      Swedish Treebank (Nivre and Megyesi, 2007), the
      Danish Dependency Treebank (Kromann, 2003), and
      Stanford Typed Dependencies (de Marneffe+ 2006), respectively.  The
    * syntactic structure is identical in the three languages, but the
    * shared dependency relations across pairs of languages is at most 40% (and
      0% across all three languages). As a consequence, cross-ling parsing < 40%
* capture similarities as well as idiosyncracies among typologically different
  languages (e.g., morphologically rich languages, pro-drop languages, and
  languages featuring clitic doubling). In this way, we hope to be able not only
* the framework needs to have a solid linguistic foundation and at the same time
  be transparent and accessible to non-specialists.
* initiatives exist to build consistent resources for many languages, and the
  * UD project is a merger of some of the initiatives. It combines the
  * (universal) Stanford dependencies (de Marneffe+ 2006 2008 2014), the
    universal Google dependency scheme (McDonald+ 2013), the
    Google universal partof-speech tags (Petrov+ 2012), and the
    Interset interlingua for morphosyntactic tag sets (Zeman, 2008)
      used in the HamleDT treebanks (a project that transforms existing
      treebanks under a common annotation scheme, Zeman+ 2012). UD is thus
* replace all the previous versions by a single coherent standard. 1 The general
* universal inventory of categories and guidelines to facilitate consistent
  annotation of similar constructions across languages,
  while allowing languagespecific extensions when necessary.
* In this paper, we present
  * version 1 of the univ guidelines and explain the underlying design princips
  * overview of the 37 treebanks that constitute the latest release (v1.2),
    representing 33 different languages, and conclude with a few words about the

# 2 History

* UD comprises two layers of annotation with diverse origins. The
  * Google universal tag set used in the morphological layer
    grew out of the cross-linguistic error analysis based on the CoNLL-X shared
    task data by McDonald and Nivre (2007). It was initially
    * used for unsupervised partof-speech tagging by Das and Petrov (2011), and
    * adopted as a widely used standard for mapping diverse tag sets to a common
  * morphological layer also builds on Interset (Zeman, 2008), which
    * started as a tool for conversion between morphosyntactic tag sets of langs
    * in 2006, it was used in the first experiments with cross-lingual
      delexicalized parser adaptation (Zeman and Resnik, 2008).  The
  * Stanford dependencies, used in the syntactic layer, were
    * developed for English in 2005 and eventually emerged as the de facto
      standard for dependency analysis of English. They have since been
    * adapted to a number of different languages (Chang+ 2009; Bosco+ 2013;
      Haverinen+ 2013; Seraji+ 2013; Lipenkova and Souček, 2014).
* other attempts at universal standards. The
  * Google Universal Dependency Treebank (UDT) project (McDonald+ 2013) was the
    first attempt to combine the Stanford dependencies and the Google universal
    POS tags into a universal annotation scheme: treebanks were released for 6
    languages in 2013 (English, French, German, Spanish, Swedish and Korean) and
    for 11 languages in 2014 (Brazilian Portuguese, English, Finnish, French,
    German, Italian, Indonesian, Japanese, Korean, Spanish and Swedish). The
  * first proposal for incorporating morphology was made by Tsarfaty (2013). The
    second version of HamleDT (Rosa+ 2014) provided Stanford/Google
    annotation for 30 languages by automatically harmonizing treebanks with
    different native annotations. These efforts were followed by the development
  * universal Stanford dependencies (USD), revising Stanford Dependencies for
    cross-linguistic annotations in light of the Google scheme (de Marneffe+ 2014)
* UD is the result of merging all these initiatives into a single coherent
  * based on the universal Stanford dependencies, an extended version of the
    Google universal tag set, a revised subset of the Interset feature
    inventory, and a revised version of the CoNLL-X format (which we call
    CoNLL-U). The first version of the annotation guidelines were released in

# 3 Annotation Guideline Principles

* lexicalism
  * words are the basic units of grammatical annotation
  * Words have morphological properties and enter into syntactic relations,
  * syntactic wordhood does not always coincide with whitespace-separated
    orthographic units, and another important design consideration is that
    * recoverability principle: there should be a transparent relation between
      the original textual repr and the linguistically motivated word segmentatn
* To obtain a cross-linguistically consistent and transparent annotation, we
  * maximize the parallelism between languages and make sure that the
  * same construction be annotated in the same way across languages. At the same
  * not annotate things that do not exist in a language
    simply because they exist in other languages.  The idea is to use a
* universal pool of structural and functional categories
  * possible to refine the analysis by adding language-specific subtypes of
    universal categories.
* Figure 2 uses the French sentence _Toutefois, les filles adorent les desserts
  au chocolat_ `However, the girls love chocolate desserts` to exemplify the

## 3.1 Word Segmentation

* basic annotation units in UD are syntactic words
  * (not phonological or orthographic words)
* clitics are split off (e.g., Spanish dámelo ‘give me it’ = dá me lo) and
* contractions are undone (e.g., French au = à le; see Figure 2)
  * when this is necessitated by the syntactic analysis, but
* for recoverability the original tokens are included as well
* MWE
  * annotated using special dependency relations,
    * rather than by collapsing multiple tokens into one

## 3.2 Morphology

* three levels of information: a lemma, a POS tag, and a set of features which
  encode lexical and grammatical properties associated with the word form (see)
* Table 1 lists the 17 POS tags, which come from a revised version of the Google
  universal POS, divided into
  * open class words, closed class words, and other symbols.  This tag inventory
  * meant to be fixed and used for all languages, but
    not all categories have to be used in all languages.
    * For example, the distinction between common nouns (NOUN) and proper nouns
      (PROPN) is not grammaticalized in all languages.
* Table 2 lists the current inventory of morphological features,
  * based on the Interset system.
  * Each feature is associated with a set of values
    (e.g., Number can take the values Sing, Plur, Dual, Ptan , and Coll)
  * it is also possible to add new features and values if needed.

## 3.3 Syntax

### Grammatical Relations

* three types of structure: nominals, clauses and modifier words
* a distinction between
  * core arguments (e.g., subject and object) and other dependents
* not attempt to distinguish complements vs. adjuncts
* UD indicates in the dependency labels
  whether dependents are phrases or clauses,
  * nsubj and csubj, dobj and ccomp, advmod and advcl. It also recognizes a
    non-canonical voice subject (where the proto-agent argument is not subject,
    e.g., in passives)
* Following Lexical-Functional Grammar (Bresnan, 2001), UD includes a
  distinction between ccomp and xcomp for
  clausal complements that are standalone (have an internal subject) versus
  those having obligatory control (omission) of the dependent predicate’s
  subject (have an external subject).  The non-core clausal dependents are all
  modifiers.  UD does
* not attempt to differentiate finite from non-finite clauses, but
* differentiates attachment to predicates from attachment to nominals: an
  adverbial clause advcl modifies a predicate whereas an
  acl (“clausal modifier of noun”) modifies a nominal.
* rich taxonomy of noun dependents inherited from the Stanford dependencies, as
* relations to capture phenomena appearing in non-edited or informal texts (such
  * `goeswith` to connect multiple tokens that correspond to a single standard
    word (e.g., “hand some” for “handsome”) or
  * `reparandum` to indicate disfluencies overridden in a speech repair).
* differentiates compounding from modification or complementation, and there are
  * three relations for compounding. We use
    * `mwe` for fixed grammaticized expressions with function words, left-headed
      (e.g., instead of : mwe(instead, of), de facto: mwe(de, facto)). We use
    * `name` for names constituted of multiple proper nouns, leftheaded. That
      * used between the words of Hillary Rodham Clinton but
        not to replace the usual relations in a phrasal or clausal name like The
        Lord of the Rings.  And we use
    * `compound` to label other types of multiword lexemes, with
      headedness according to the language and/or compound type.  Thus, compound
      * any kind of X 0 compounding:
      * noun compounds (e.g., phone book), but also
      * verb and adjective compounds that are more common in other languages
        (such as Persian or Japanese light verb constructions); for
      * numbers (e.g., three thousand books gives compound(thousand, three));
      * particles of phrasal verbs (e.g., put up: compound(put, up)).

### Relations between Content Words

* three principles:
  * content words are related by dependency relations;
  * function words attach to the content word they further specify; and
  * punctuation attaches to the head of the phrase or clause in which it
* illustrated in Figure 2.  Giving priority to dependency relations between
  * increases the probability of finding parallel structures across languages,
    since function words in one language often correspond to morphological
    inflection (or nothing at all) in other languages.
* treatment of copula and auxiliaries: they are not the head of a clause, but
  depend on a lexical predicate, as in (1a) and (2a). Such treatment maximizes
  the parallelism between dependency trees in different languages: compare (1a)
  and (1b) where Russian does not have an overt copula. Similarly, compare (2a)
  and (2b) where the future tense in French can be marked morphologically.  nmod
* any case-marking element (including prepositions, postpositions, and clitic
  case markers) is treated as a dependent of the noun it attaches to or
  introduces.
  * As can be seen in (3a) and (3b), nmod labels the relation between the two
    content words office and Chair, whereas the preposition or the possessive
    marker is a case depending on its complement. In general,
  * `nmod` expresses some form of oblique or adjunct relation which
    can be further specified by the case or be morphologically marked as in
    (3c).
* Coordination follows a similar treatment: the leftmost conjunct is the head,
  and other conjuncts as well as the coordinating conjunction depend on it, as
  in (4).
* These principles provide parallelism across and within languages, see (3)
  * possessive (possessive clitic, preposition or morphologically marked) are
  * in English, we also obtain parallel representations between prepositional
    phrases and subordinate clauses, which are in practice often introduced by a
    preposition, as in (5)
* The choice to make content words the backbone of the syntactic representations
  may seem to be at odds with the
  strong tendency in modern syntactic theory to give priority to functional
  heads, a tendency that is found
  in both constituency-based and dependency-based approaches to syntax
  (Brugé+ 2012; Osborne and Maxwell, 2015)
* Functional heads are instead represented as specifying features of content ws,
  using dedicated relation labels, features which can alternatively be specified
  through morphological processes. In the dependency grammar tradition, this is
  * very close to the view of Tesnière (1959), according to whom
    * dependencies hold between nuclei that always contain a content word, and
    * function words combine with content words to form dissociated nuclei.
* highly compatible with typologically grounded synt theos e.g. Dixon (2009)

### Enhanced Representation

* basic dependency structure forms a (possibly non-projective) tree but
* UD also allows additional dependencies in an enhanced dependency repr. 2 The
* explicitly mark external subjects and the external role in relative clauses as
  well as to propagate relations over conjunctions, as shown in (6) where
  additional dependencies are indicated with dashed arrows below the sentence.

### Language-specific Relations

* language-specific subtypes to capture special phenomena in different languages
* e.g. UD has a single relation `acl` for adnominal clauses, several languages
  make use of the subtype acl:relcl to distinguish _relative_ clauses as an
  important subtype of adnominal clauses. By design,
* we can always map back to the core label set by stripping the specific
  relations that appear after the colon. For a complete list of currently used
  language-specific relations, we refer to the UD website.

## Format and Tools

* CoNLL-U format, which is an evolution of the widely used CoNLL-X format
* Python and JavaScript libraries for reading and validating CoNLL-U. 3 The UD
* visualizations generated using brat (Stenetorp+ 2012). 5 Figure 4 shows an
* can also be queried online using the SETS 6 and PML TreeQuery 7 tools
  (Luotolahti+ 2015; Štěpánek and Pajas, 2010). These tools allow querying any
  * combining restrictions on the existence or absence of wordforms, lemmas, POS
    tags, morphological features, dependency labels, and subtrees. The results

# Existing Treebanks

# Conclusion

* these languages cover almost 35% of native speakers in the world (adding
  Chinese would bring us up to almost 60%). Although there is still a strong
  bias towards contemporary Indo-European
