Towards a Standard Upper Ontology
Ian Niles, Adam Pease
2001

# Abstract

* Suggested Upper Merged Ontology (SUMO) is an upper level ontology that has
  been proposed as a starter document for The Standard Upper Ontology Working
  Group, an IEEE-sanctioned working group of collaborators
  * from the fields of engineering, philosophy, and information science
  * SUMO provides definitions for general-purpose terms

# 1 Intro

* Recognizing both the need for large ontologies and the need for an open
  process leading to a free, public standard,
  a diverse group of collaborators from the fields of engineering, philosophy,
  and information science to make the Standard Upper Ontology (SUO) a reality
* The Standard Upper Ontology (SUO) will provide definitions for
  general-purpose terms, and it will act as a foundation for more specific
  domain ontologies
  * It is estimated that it will eventually contain between 1000 and 2500 terms
    and roughly ten definitional statements for each term

# 2 SUMO Methodology

* This content included the ontologies available on the Ontolingua server, John
  Sowa’s upper level ontology, the ontologies developed by ITBM-CNR, and
  various mereotopological theories, among other sources
* language for the SUMO is a somewhat simplified version of KIF
  (Knowledge Interchange Format, Genesereth, 1991)
* 654 terms and 2351 assertions
  * can be browsed online (http://ontologyteknowledge.com:8080/rsigma/SKB.jsp)
  * source files for all of the versions of the ontology can be downloaded
    (http://ontologyteknowledge.com/cgi-bin/cvsweb.cgi/SUO/)
* procedure that we followed in creating the SUMO
  * identify all high-level ontological content [without] licensing restrictions
    * libraries available on the Ontolingua server and from ITBM-CNR,
    * John Sowa’s upper-level ontology [19]
    * Russell and Norvig’s upper-level ontology [15]
    * James Allen’s temporal axioms [1]
    * Casati and Varzi’s formal theory of holes[4]
    * Barry Smith’s ontology of boundaries [17, 18]
    * Nicola Guarino’s formal mereotopology [2,3]
    * and representations of plans and processes including CPR [13] and PSL [16]
  * translation of the ontological content (known as the “syntactic merge”)
  * the much more difficult task of the “semantic merge”
    * ontologies were first divided into two classes, viz
      * those defining very high-level concepts
        * John Sowa’s .. and Russell and Norvig’s upper-level ontology
      * those defining lower-level notions: everything else
    * the two upper-level ontologies were melded
    * merged ontology was then used .. for aligning all of the other content
* four cases in aligning lower-level content with the foundational
  1. nothing in the tip of the ontology corresponded with the concept/axiom to
     be mapped, and the concept/axiom was deemed to be useful and not to violate
     any cherished philosophical principles
  1. the new concept/axiom was judged to be out of place in a schema that we
     hope will have broad application and acceptance
  1. perfect overlap between an element of the merged ontology and the
     concept/axiom to be mapped
  1. partial overlap in meaning between the new content and existing concepts or
     axioms in the merged ontology
    * for example, the overlap between the concepts of ‘Class’ and ‘Set’
      * ‘Class’ occurs in John Sowa’s ontology, where it refers to
        * a set of items that form something like a natural kind
    * ‘Set’, on the other hand, occurs in the set theory ontology
      available on the Ontolingua server
    * To a large extent, these two concepts behave in the same way
      * Things can be elements of classes and sets, subclasses and subsets are
        well defined, and classes and sets can be partitioned, disjoint, etc
    * Despite this strong similarity between the two concepts, it was decided
      that both of them should be maintained in the SUMO

# 3 SUMO Top Level

```
Physical -- everything that has a position in space/time
	Object
		SelfConnectedObject
			ContinuousObject
			CorpuscularObject
		Collection
	Process
Abstract
	Set
    Class
      Relation
	Proposition
	Quantity
		Number
		PhysicalQuantity
	Attribute
```
* Physical
  * The reason we adopted [Object vs Process] is that we wanted to incorporate
    content from process-related ontologies like PSL and from formal
    mereo-topologies (which assume a substantive notion of object)
  * Object/Collection
    * the relation between these parts and their corresponding ‘Collection’ is
      known as ‘member’ in the SUMO
  * Process (Levin 1993)
* Abstract
  * ‘Set’ is the ordinary set-theoretic notion, and it subsumes ‘Class’,
    which, in turn, subsumes ‘Relation’
    * ‘Class’ is understood as a ‘Set’ with a property or conjunction of
      properties that constitute the conditions for membership in the ‘Class’,
    * ‘Relation’
      * those ordered tuples that express intensional content
      * eg. ‘mother’ in the SUMO does not just denote the set of all ordered
        pairs [but] also expresses the property or conjunction of properties
        that comprise the notion of biological motherhood
  * some ‘Propositions’ are expressed by single sentences, other ‘Propositions’
    are expressed by entire books or even libraries of books
    * the musical content denoted by a printed score

[nincs 4 szakasz]

# 5 Challenges to SUMO

* our goal is to construct a single, consistent, and comprehensive ontology
  * [at least] make clear the representational choices and bundle them up in
    consistent and independent packages and, where possible, state mappings
    between corresponding packages
* Cyc. Why construct an upper-level ontology, when such already exists?
  * The Austin-based company Cycorp has devoted fifteen years to creating
  * has been used in a wide range of applications
  * Cycorp has released only a small part of its ontology to the public
  * SUMO was constructed with reference to very pragmatic principles
    * Any distinctions of strictly philosophical interest have been removed
