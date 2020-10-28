Robert Speer and Catherine Havasi
Representing General Relational Knowledge in ConceptNet 5
2012 LREC

# Abstract

* ConceptNet is a knowledge representation project, providing 
* a large semantic graph that describes 
  _general human knowledge_ and how it is expressed in _natural language_. 
* This paper presents the latest iteration, ConceptNet 5, including its
  fundamental design decisions, ways to use it, evaluations (coverage, accuracy)

# 1.  Introduction

* words and common phrases in any written human language
* an open domain of predicates `AtLocation(jazz, new orleans)`
* history
  * _Open Mind Common Sense_ KR project (Singh+ 2002), which uses a long-running
    interactive Web site to collect new statements from visitors to the site,
    and asks them target questions about statements it thinks may be true
  * knowledge from similar websites in other languages, such as Portuguese and
    Dutch, and
  * collaborations with online word games that automatically collect general
    knowledge, yielding further knowledge in English, Japanese, and Chinese
* applications of Previous versions of ConceptNet (Havasi+ 2007)
  * emotional content of text (Cambria+ 2010)
  * dialog system for improving software specifications (Korner and Brumm, 2009)
  * recognize activities of daily living (Ullberg+ 2010), to
  * visualize topics and trends in a corpus of unstructured text (Speer+ 2010),
  * create public information displays by reading text about people and
    projects from a knowledge base (Havasi+ 2011)
* both specific facts and the messy, inconsistent world of common sense
* fork: Should we make sure to distinguish the eating utensil from the
  branching of a path?

# 2.  Motivation for ConceptNet 5

* goals
  * include knowledge from other crowd-sourced knowledge
    * particularly data mined from Wiktionary and Wikipedia
  * add links to other resources such as DBPedia (Auer+ 2007), 
    Freebase (Bollacker+ 2008), and WordNet (Fellbaum, 1998)
  * support machine-reading tools
    * such as ReVerb (Etzioni+ 2008),
    * which extracts relational knowledge from Web pages
  * find translations
* history
  * _Open Mind Common Sense_ project, a Media Lab project to collect the things
    that computers should know in order to understand what people are talking
    about, which then grew into an international, multi-homed project called the
    _Common Sense Computing Initiative_
  * The first publicly released version: ConceptNet 2 (Liu and Singh, 2004).
    * distributed as a packed Python data structure, along with code to read it
    * operations such as _spreading activation_ from a set of words
  * sister project
    * OMCS no Brasil (Anacleto+ 2006) in Brazilian Portuguese, and
    * GlobalMind (Chung, 2006) in English, Chinese, Japanese, and Korean
  * SQL

# 3.  Knowledge in ConceptNet 5

* _concepts_, which are words and phrases that can be extracted from natural
  language text, and _assertions_ of the ways that these concepts relate to each
  other
* ... [entities]
* sources that may be added
  * plan-oriented knowledge in Honda’s Open Mind Indoor Common Sense
    (Kochenderfer, 2004)
  * Freebase (Bollacker+ 2008),
  * ontological connections to SUMO and MILO (Niles and Pease, 2001)
  * well-structured Wiktionaries in other [languages, e.g.] Japanese and German

## 3.1 Representation

* Its _assertions_ can be seen as
  * edges that connect its nodes, which are concepts (words and phrases)
  * can be justified by other assertions, knowledge sources, or processes
  * predicates that label them can be
    * one of a set of interlingual relations, such as “IsA” or “UsedFor”, or
    * automatically-extracted relations that are specific to a language, such
      as “is known for” or “is on”
* hypergraph
  * One way to represent a hypergraph is to reify all edges as nodes,
  * Asking simple questions such as “What are the parts of a car?” in a
    hypergraph is a complex, multistep query, and we found no mature database
    system that could perform all the queries we needed efficiently
* The sources that justify each assertion form a disjunction of conjunctions
  * Each edge indicates a conjunction of sources that produced that edge, while
  * bundle of edges making up an assertion represents the disjunction of all
    those conjunctions
* Each conjunction comes with a positive or negative score,
  * negative weight means we should conclude from these sources that the
    assertion is not true
  * its negation not necessarily true either:  It may in fact be a _nonsensical_
    or irrelevant
  * To represent a true _negative_ statement, such as “Pigs cannot fly”,
    ConceptNet 5 uses negated relations such as /r/NotCapableOf

## 3.2.  Relations

* In addition to free-text relations, the standard interlingual relations we
  identify in ConceptNet appear in Table 1

## 3.3.  Granularity

## 3.4.  Normalizing and aligning concepts

* ConceptNet deals with natural-language data, but 
  “a cat is an animal” = “cats are animals”
* The normalization process
  * in English is an extension of WordNet’s Morphy, plus removal of a very
    small number of stopwords, and a transformation that undoes CamelCase
  * In Japanese, we use the commonly-used MeCab algorithm for splitting words
    and reducing the words to a dictionary form (Kudo+ 2004), and
  * in many European languages we use the Snowball stemmer (Porter, 2001) to
    remove stop words and reduce inflected words to a common stem
* Concepts (normalized terms) are the fundamental unit of representation 
  * concept is represented by a URI that
  * identifies that it is a concept, what language it is in, its normalized
    text, and possibly its part of speech and disambiguation
  * looks like `/c/en/run/n/basement`
* _multilingual relations_ such as `/r/IsA`
* Processes that read _free text_, such as ReVerb, will produce relations that
  not aligned  with multilingual relations.  In this case, the relation is in
  * specified language and a normalized form. In the text 
  * e.g. “A bassist performs in a jazz trio”, the relation is `/c/en/perform_in`
* namespace /s/ for data sources that justify an edge, e.g
  * information extraction rules such as /s/rule/reverb,
  * human contributors such as /s/contributor/omcs/rspeer, and
  * curated projects such as /s/wordnet/3.0
* assertion URI
  * e.g. “jazz is a kind of music” has the URI
    `/a/[/r/IsA/,/ c/en/jazz/,/c/en/music/]`
  * [brackets] express arbitrary tree structures
* edge IDs are the hexadecimal SHA-1 hash of all the unique components,
  separated by spaces: its assertion URI, its context, and its conjoined
  sources
* flat files
* we build indexes on top of ConceptNet 5
  * Using the Solr server, we can efficiently index all edges by all lemmas
    (normalized words) they contain and prefixes of any URIs they involve
    * A search for `rel:/r/PartOf` and `end:/c/en/wheel OR end:/c/en/wheel/*`
      will find all edges describing the parts of a wheel, automatically
      ordered by the absolute value of their score

## 4.2 Downloading

* Web API at its web site, http://conceptnet5.media.mit.edu, and may be
  redistributed or reused under a choice of two Creative Commons licenses.  The
* flat files containing ConceptNet 5 data are available at:
  http://conceptnet5.media.mit.edu/ downloads/
* Python code for working with this data, transforming it, and building indexes
  from it is maintained on GitHub in the “conceptnet5” project:
  https://github.com/ commonsense/conceptnet5

# 5 Evaluation

* showed the natural language form of the text (which was machine-generated in
  the cases where the original data was not in natural language) and asked
  people to classify the statement as
  * Generally true
  * Somewhat true
  * I don’t know
  * Unhelpful or vague
  * Generally false”, and “This is garbled nonsense”
* ConceptNet rated better than WordNet data perhaps 
  * WordNet edges inherently form assertions that sound too unnatural, or
  * our English language glosses of them are at fault. The processes of
* translations from Wiktionary and triples from DBPedia performed very well,
  while the ReVerb data – faced with the hardest task, extracting knowledge from
  free text – did poorly
