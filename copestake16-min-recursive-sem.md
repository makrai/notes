Resources for building applications with Dependency Minimal Recursion Semantics 
Ann Copestake, Guy Emerson, Michael Wayne Goodman, Matic Horvat, Alexander Kuhnle, Ewa Muszyńska
LREC 2016

# Abstract

* DELPH-IN (Deep Linguistic Processing with HPSG) consortium
  * effective but complex DELPH-IN resources
* We describe resources aimed at increasing the usability of the semantic
  representations
* We concentrate in particular on the
  Dependency Minimal Recursion Semantics (DMRS) formalism,
  * a graph-based representation designed for compositional semantic repr with
    deep grammars
* focus is on English, and specifically English Resource Semantics (ERS) as
  used in the English Resource Grammar
* We give an
  * introduction to ERS and DMRS and a brief overview of some existing
    resources and then
  * describe in detail a new repository which has been developed to simplify
    the use of ERS/DMRS
    * We explain a number of operations on DMRS graphs which our repo supports,
      * sketches of the algorithms, and illustrate
        how these operations can be exploited in application building. We
        believe that this work will aid researchers to exploit the rich and

# 1 Intro

* DELPH-IN (http://www.delph-in.net) 
  * an international collaboration between researchers with an interest in
    ‘deep’, linguistically-motivated, language processing
  * Several broad-coverage computational grammars have been produced, together
    * experimental grammars for languages in all the main language families.
  * in a framework for compositional meaning representation known as
    Minimal Recursion Semantics (MRS; Copestake+ (2005)), which has
    * several variants, collectively referred to as ``*MRS``
    * the most used and widest coverage DELPH-IN grammar is the
      English Resource Grammar (ERG; Flickinger (2000)).  
* applications of ``*MRS`` from the ERG (henceforth English Resource Semantics:
  ERS) and other DELPH-IN grammars 
  * machine translation (eg Bond+ (2011))
  * information extraction and question answering
    (eg Copestake+ (2006), Frank+ (2005), MacKinlay+ (2009), MacKinlay+ (2012))
  * extraction of ontological relationships (eg Herbelot and Copestake (2006))
  * question generation (eg Yao and Zhang (2010), Yao+ (2012))
  * entailment recognition (eg Lien and Kouylekov (2014))
  * detection of scope of negation (eg Packard+ (2014)) and
  * natural language interfaces (eg Packard (2014))
* ERS-based system has outperformed other approaches in a competitive task  .
  (Packard+ (2014), Lien and Kouylekov (2014), Packard (2014),
  Yao and Zhang (2010), MacKinlay+ (2009)) an 
* pros and cons of ERG-based system 
  * not suitable for applications which require rapid analysis of very large
    quantities of text,
  * parsing accuracy is competitive with other approaches and is
  * generally good on new domains without any need for substantial training or
    adaptation (MacKinlay+ (2010), Dridan and Oepen (2013)).  ERS is
  * especially suitable in applications which require high precision in
    semantic tasks and where some lack of recall due to parse failure rates is
    tolerable.
  * the ERG is bidirectional and ERSs can also be used for realization.

* the adoption of ERS (and `*MRS` with other grammars) has been limited outside
  the DELPH-IN community, despite the fact that the resources are all Open Src
  * a major problem is the complexity of the analyses. The DELPH-IN community
  * There is a standardized semantic interface to the grammars (the SEM-I:
    Flickinger+ (2005))
  * Flickinger+ (2014) described an approach to documenting the fundamentals of
    ERS, allowing users to look up the detailed analysis of particular
    grammatical constructions
  * The Elementary Dependency representation (Oepen and Lønning, 2006) is
    simpler than `*MRS` and captures many aspects of ERS while being relatively
    similar to familiar syntactic dependency formalisms
    * can be used for comparative parser evaluation as well as other
      applications (Ivanova+ (2012), Dridan and Oepen (2011)).

* Dependency MRS (DMRS; Copestake (2009))
  * In this paper, we concentrate on resources for processing ~ 
  * a version of MRS can be represented as a dependency graph, with no need for
    variables
  * proper representation of scope and is fully inter-convertible with other
    forms of `*MRS`.
    * Unlike Elementary Dependencies, DMRS has a
    * It thus makes use of the full power of the ERG for semantic description. DMRS
    * has been used in many applications (eg Reiplinger+ (2012), Schäfer+
      (2011), Herbelot (2013), Horvat+ (2015), Emerson and Copestake (2015))

* earlier graph-based semantic representation languages, including
  * some support genuine logical forms (eg Allen+ (2008))
  * popularity of Abstract Meaning Representation (AMR; Banarescu+ (2013)) has
    led to increased interest in graph-based formalisms
  * Bender+ (2015) discusses why compositionality (as assumed in `*MRS` but not
    in AMR) is an important property of semantic representations. We believe
  * DMRS is interestingly different from these other representations and that
    the coverage and depth of ERS have significant potential advantag in applic

# outlining DMRS and some existing resources and then move on to describe

# a repository which supports developers by providing standard operations on
DMRS and giving illustrative examples of their potential use in applications.
