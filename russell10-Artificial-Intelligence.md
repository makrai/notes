Stuart Russell and Peter Norvig
Artificial-Intelligence
2002

# Preface

* Artificial Intelligence (AI) is a big field, and this is a big book
* We have tried to explore the full breadth of the field, which encompasses
  * logic, probability, and continuous mathematics; perception, reasoning,
    learning, and action; microelectronic devices to robotic planetary
    explorers. The book is also big because we go into some depth
* “A Modern Approach.” The intended meaning of this rather empty phrase is that
  * we have tried to synthesize what is now known into a common framework,
    rather than trying to explain each subfield [in] historical context

## New to this edition

* changes in AI ... since the last edition in 2003.  There have been important
  * widespread deployment of practical speech recognition, machine
    translation, autonomous vehicles, and household robotics. There have been
    algorithmic landmarks, such as the solution of the game of checkers
  * theoretical progress, particularly in areas such as
    probabilistic reasoning, machine learning, and computer vision

# 12 Knowledge representation

## Bibliographical and historical notes

* the first expert system, Dendral (Feigenbaum+ 1971; Lindsay+ 1980),
  interpreted the output of a mass spectrometer as accurately as experts
  * representational formalisms used in Dendral are highly specific
* Over time: standardized KR formalisms and ontologies
  * territory previously explored by philosophers of science and of language
* The problems associated with natural kinds and inexact category boundaries
  * Wittgenstein (1953), Quine (1953), Lakoff (1987), and Schwartz (1977)
* larger-scale ontologies
  * documented by the Handbook on Ontologies (Staab, 2004)
  * Open CYC project (Lenat and Guha, 1990; Matuszek+ 2006) has
  * DBpedia project extracts structured data from Wikipedia
* Suggested Upper Merged Ontology 
  (SUMO, Niles and Pease, 2001; Pease and Niles, 2002)
* representation languages are emerging
  * RDF (Brickley and Guha, 2004) [uses] relational triples, and provides some
    means for evolving the meaning of names over time
  * OWL (Smith+ 2004) is a description logic that supports inferences
  * usage seems to be inversely proportional to representational complexity:
* An inspirational discussion of the general project of commonsense knowledge
  representation appears in Hayes’s (1978, 1985b) “Naive Physics Manifesto”
* Doubts about the feasibility of a single ontology for all knowledge
  * Doctorow (2001), Gruber (2004), Halevy+ (2009), and Smith (2004)
  * largely ... abandoned
* event calculus was
  * introduced by Kowalski and Sergot (1986) to handle 
    continuous time, and variations (Sadri and Kowalski, 1995; Shanahan, 1997) 
  * overviews (Shanahan, 1999; Mueller, 2006)
  * maps onto the language (van Lambalgen and Hamm 2005)
  * fluent calculus (Thielscher, 1999).  James Allen introduced
  * time intervals for the same reason (Allen, 1984), arguing that intervals
    were much more natural than situations for reasoning
  * “concave” time intervals (intervals with gaps; (Peter Ladkin 1986a, 1986b)
  * studies (Allen 1991)
  * algorithms for temporal reasoning (van Beek and Manchak 1996)
  * analysis of events due to the philosopher Donald Davidson (1980)
  * histories in Pat Hayes’s (1985a) ontology of liquids 
  * chronicles in McDermott’s (1985) theory of plans
* A more readable exposition of [Leśniewski (1916)'s mereology] is given by
  Leonard and Goodman (1940), and Goodman’s The Structure of Appearance (1977)
  * the approach gained the support of Quine (1960)
  * Casati and Varzi (1999) cover parts, wholes, and the spatial locations
* semantic network
  * The Greek philosopher Porphyry (c. 234–305 A . D .), commenting on
    Aristotle’s Categories, drew ... the first semantic network
  * Charles S. Peirce (1909) developed existential graphs as the first semantic
    network formalism using modern logic
  * Ross Quillian (1961), driven by an interest in human memory and language
    processing, initiated work on semantic networks within AI
  * Marvin Minsky (1975) presented a version of semantic networks called
    frames; a frame was a representation of an object or category, with
    attributes and relations to other objects or categories
  * Woods’s (1975) famous article “What’s In a Link?” 
    drew the attention of AI researchers to the need for precise semantics in
    knowledge representation formalisms
  * Brachman (1979) elaborated on this point and proposed solutions
  * Patrick Hayes’s (1979)
    * “Most of ‘frames’ is just a new syntax for parts of first-order logic”
  * Drew McDermott’s (1978b) “Tarskian Semantics, or, No Notation without
    Denotation!” argued that the model-theoretic approach to semantics used
    in first-order logic should be applied to all knowledge representation
    * reversed his position in “A Critique of Pure Reason” (McDermott, 1987)
  * complexity of inheritance with exceptions (Selman and Levesque 1993)
    * in most formulations it is NP-complete
* description logics is the most recent stage in a long line of research
  aimed at finding [tractable] subsets of first-order logic [with] inference
  * Hector Levesque and Ron Brachman (1987)
    * logical systems that incorporate theoretical complexity analysis, most
      notably Krypton (Brachman+ 1983) and Classic (Borgida+ 1989)
  * Calvanese+ (1999) summarize the state of the art, and
  * Baader+ (2007) present a comprehensive handbook of description
  * Against this trend, Doyle and Patil (1991)
* three main formalisms for dealing with nonmonotonic inference
  * circumscription (McCarthy, 1980),
  * default logic (Reiter, 1980), and
  * modal nonmonotonic logic (McDermott and Doyle, 1980)

# 22 NLP

## Bibliographical notes

* There are two [non VSM-based probabilistic models of IR], one due to
  * Ponte and Croft (1998) and
  * one by Maron and Kuhns (1960) and Robertson and Sparck Jones (1976)
