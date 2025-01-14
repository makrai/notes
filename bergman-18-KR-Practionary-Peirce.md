Michael K. Bergman
A Knowledge Representation Practionary: Guidelines Based on CS Peirce
Springer International Publishing, 464 pp., December 2018

# Preface

* Knowledge, the actionable side of information, is rooted in something more
* communities believing different things as true, perhaps even leading to conflc
* deep learning is an opaque, black box of indecipherable inferences. We don’t
  * For further advances to occur, for general AI or cognition to arise in
* information — biological or cultural — confers adaptive advantage to deal with
  an uncertain future and as a means of generating economic wealth. My intu-
* There was a data warehousing venture to connect structured databases
  * coincided with the explosive growth of the initial Internet. To support the
  * large content suppliers were populating their web sites with searchable,
    dynamic databases, hidden from the search engines of that time (before Goog)
  * We named this phenomenon the ‘deep web’: define its extent and mine it. We
    * web [is] largely populated by text content and less so by structured data
    * place information in text onto a common, equal basis to the information
      in a database, such as a structured record
* the inventor of the World Wide Web put forward a vision of the Semantic Web
  (Berners-Lee 2000). 1 The article painted a picture of globally
* Semantic Web uses the RDF (Resource Description Framework) data model. RDF
  * subject-­ predicate-­object (s-p-o) ‘triple’ assertion to show me the way
* we provided three notable open source projects. We developed a general
  * Open Semantic Framework project. To help information interoperate, we
  * UMBEL, a subset of Cyc: a set of reference concepts for Web datasets
  * KBpedia, a combination of upper knowledge graph and leading public KB
* NLP: many semantic tasks such as tagging or categorizing or questioning
  already perform at acceptable levels for most projects. We naturally call the
  * ‘knowledge-based artificial intelligence.’ KBAI would arise from better KR
  * a common theme throughout the book
* the question of meaning, inextricably entwined with context and perspective
  * as well as the usual vagaries of imprecise semantics. Root cause analysis
  * meaningful, interoperable information suggests one pivotal factor
    * describe source content adequately in context to its use
  * capturing and reflecting context is essential for interoperability
  * reason over it and test new knowledge against it, a structural form we call
    a ‘knowledge graph.’ All of this requires
  * grounding: a logical and coherent theory a for how to represent knowledge
* philosophy: Charles Sanders Peirce and Claude Shannon,
  * each explicating one of the boundary senses of information
  * Shannon emphasized the message and mechanical aspects of information;
  * Peirce emphasized meaning in both breadth and depth. In the
  * combination, we see semantics and groundings as essential to convey
* C.S. Peirce belongs in the ranks of George Boole, Shannon, A Turing, Neumann
  from the perspective of KR, the meaning of information, and hewing to reality
* The lens I use is strictly that of Peirce and his views
  * There are neutral textbooks on KR in computer and information science
    * KR reference texts by van Harmelan [1] or Brachman and Levesque [2]
  * pragmatism, according to a specific maxim and a recommended methodology to
    * what the Peirce scholar Kelly Parker calls a ‘practionary.’ To my

## 1.1 Structur of the book

* central portion of the book (Parts II–IV) reflects
  C.S. Peirce’s universal categories of Firstness, Secondness, and Thirdness
  Across nearly five decades of writings, Peirce likens the universal
  categories to more than 60 different expressions (Table 6.2). The expression
  used for this central
  portion of the book is Peirce’s logic triad of
  * grammar (1ns),
  * logics and tools (or critic) (2ns), and
  * methods (or methodeutic) (3ns). 3 We use this triadic organization to
* Parts I and V are bookends around this central portion. Part
  * I: why one should be interested in the topic of KR and functions of KR
  * V: practical speculation [on] benefits and applications may result from a
    working KR system built according to Peircean principles. A couple of
    chapters tee up this structure.  The structural approach of this book is
    consistent with Peirce’s pragmatic maxim
to achieve the “third grade of clearness of apprehension” (1878, W 3:266) 4 covering
“all of the conceivable practical effects,” regarding an understanding of something
* a practionary is for the definition of methods and potential applications
  resulting from an explication of a domain. In the case of this book, that
  domain is KR. 5
To my knowledge, this is the only Peirce book dedicated solely to knowledge
representation, and the only KR book exclusively devoted to Peirce. 6 Some review-
* multiple parts. I
  * Early chapters discuss contexts of information theory, economics, and
    social circumstances
  * Middle parts of the book are theoretical, even philosophical, that evolve
    into how-to and practice
  * The latter parts of the book are speculative and span potential
    applications in breadth and depth. My answer
  in keeping these parts together is to try to be faithful to this overall
  ideal of a Peircean practionary. I welcome you to a soup-to-nuts banquet of
  Peircean perspectives on the challenge of KR

# 1.2 Overview of Contents

# 2 core concepts of information, knowledge, and representation. Gregory

* Peirce emphasized meaning and related it to the triadic relationship between
  immediate object, representation, and interpretation. We associate knowledge

Part I and its three chapters

# 3 The situation and importance of information to enterprises and society

# 4 opportunities. The path to knowledge-based artificial intelligence (KBAI)

* a framework to aid data interoperability and responsive knowledge management
  * A knowledge graph (or ontology) provides the overall schema, and
    semantic technologies give us a basis to make logical inferences across the
    * search, disambiguation, mapping, and transformation functions, all of
      which work together to help achieve data interoperability
* KBAI: use of large statistical or knowledge bases to inform feature selection
  * apply these same techniques to the infrastructural foundations of KBAI
    systems in data integration, mapping to new external structure and
    information, hypothesis testing, diagnostics and predictions
* We apply natural language processing to these knowledge bases informed by
  semantic technologies.  To complete the context, we discuss other vital

# 5. Knowledge should express a coherent reality, to reflect a logical
consistency and structure that comports with our observations about the world
How we represent reality has syntactic variation and ambiguities of a semantic
nature that can only be resolved by context. A hub-and-spoke design with a
canonical data model is a superior way to organize, manipulate, and manage
input information. By understanding the sources of semantic heterogeneity, we
set the basis for extracting meaning and resolving ambiguities. Once we resolve
(‘disambiguate’) the source information, we need to organize it into ‘natural’
classes and relate those classes coherently and consistently to one another
This organization takes the form of a knowledge graph

Part II covers the grammar of KR

# 6.  Peirce’s universal categories of Firstness, Secondness, and Thirdness in

* Peircean pragmatism: signs and representations (semiosis); logically reason
  and handle new knowledge (abduction) and probabilities (induction); make
  economic research choices (pragmatic maxim); categorize; and let the
  scientific method inform our inquiry
* sign theory, his threefold logic of deduction-induction-abduction, the
  importance of the scientific method, and his understanding about a community
  of inquiry
* We can summarize
  * Firstness as unexpressed possibilities
  * Secondness as the particular instances that may populate our information space
  * and Thirdness as general types based on logical, shared attributes
* logic, semiosis, philosophy, and knowledge are influenced by the ‘threes.’

# 7. Basic terminology We begin our analysis with the relevant

* ‘things’ (nouns, which are entities, events, types, or concepts) that
  * and how we organize them. We pair these things with
  * three kinds of internal and external relations to other things
    * Attributes are the intensional characteristics of an object, event,
      entity, type (when viewed as an instance), or concept
    * External relations are actions or assertions between an event, entity,
      type, or concept and another particular or general
    * Representations are signs and the means by which we point to, draw
      attention to, or designate, denote, or describe a specific object,
      entity, event, type, or general
* We now know that
  * attributes are a Firstness in the universal categories
  * that Secondness captures all events, entities, and relations
  * and that Thirdness provides the types, context, meaning, and ways to
    indicate what we refer to in the world

# 8 Logic basis and the actual vocabularies and languages

* deductive logic to infer hierarchical relationships,
  create forward and backward chains,
  check if domains and ranges are consistent for assertions,
  assemble attributes applicable to classes based on member attributes,
  conform with transitivity and cardinality assertions, and
  test virtually all statements of fact within a knowledge base
* language should model and
  * capture intensional and extensional relations
  * one that potentially embraces all three kinds of inferential logic
  * that is decidable
  * one that is compatible with a design reflective of particulars and generals
  * one that is open world in keeping with the nature of knowledge
* Our choice for the knowledge graph is the W3C standard of OWL 2 (the Web
  Ontology Language), though other choices may be just as valid

Part III working components of a KR system

# 9 open software and design

# 10 modular, expandable typologies

# 11. Relations between nodes, different than those of a hierarchical or

* methods: graph theory, statistical mechanics from physics, data mining and
  information visualization from computer science, inferential modeling from
  statistics, and social structure from sociology
* Graph theory and network science are the suitable disciplines for a variety
  of information structures and many additional classes of problems. We see the
  * graph theory to linguistics by the various knowledge bases such as WordNet
    (in multiple languages) and VerbNet
* Domain ontologies emphasize conceptual relationships over lexicographic ones
  for a given knowledge domain.  Furthermore, if we sufficiently populate a

Part IV, how these components are now combined to build a working platform

# 12 basic KR platform and the accompanying knowledge management (KM) capabili-

* The platform should perform these tasks:
  * insert and update concepts in the upper ontology
  * update and manage attributes and track specific entities as new sources of
    data are entered into the system
  * establish coherent linkages and relations between things
  * ensure that these updates and changes are done wholly and consistently
    while satisfying the logic already in place
  * update how we name and refer to things as we encounter variants
  * understand and tag our content workflows such that we can determine
    provenance and authority and track our content
  * and do these tasks using knowledge workers, who already have current duties
    and responsibilities
* use and updates of the semantic technologies portion must be part of daily
  routines and work tasking, subject to management and incentives.  Once a

# 13 creation of the domain knowledge graph

# 14 Statistical classification problems

* in information retrieval (IR), natural language understanding or processing
  (NLP), and machine learning (ML) are all statistical classification problems,

Part V “conceivable practical effects” that may result from following these

# 15 Twelve potential applications in breadth

* Four of these are near-term applications in
  word sense disambiguation, relation extraction, reciprocal mapping, and
  extreme knowledge supervision
* Four are logic and representation applications in
  * automatic hypothesis generation, encapsulating KBpedia for deep learning,
    measuring classifier performance, and the thermodynamics of representation

# 15 New applications and uses for knowledge graphs

* self-service business intelligence and semantic learning
* apply Peirce’s ideas and guidance to nature
  * graph learning methods that we can apply to KBpedia and its KBs

# 16 Three potential uses in depth. The three application areas

## 16.1 workflows and business process management (BPM),

* involves people.  Semantic technologies are essential for shared communic

## 16.2 semantic parsing 349

* a lexical theory needs to handle word senses, sentences and semantics,
  cross-language meanings, common-sense reasoning, and learning algorithms
  We can map the compositional and semantic aspects of our language to the
  categorial perspectives of Peirce’s logic and semiosis, and then convert
  those formalisms to distributions over broad examples provided by
  KBpedia’s knowledge

### A Taxonomy of Grammars 350

### Computational Semantics 353

### Three Possible Contributions Based on Peirce 354

* principles
  * Real. Peirce advocated empirical truth for describing and organizing the
    * as opposed to based solely in the mind: psychological
    * what we retain should be true in relation to what we have already modeled,
  * Organized according to the universal categories. Continuing to maintain rea-
    soned splits into Firstness, Secondness, and Thirdness may offer some
    surprising keys and insights for our knowledge representations going forward
  * Logical
    * fits well with the ideal of formal grammars
  * Consistent with the logic of relations. Peirce has already provided us with
    significant guidance in his identification of relations and his logical
    treatments of them, including algebraic notions to inform modeling
  * A good entity-attribute distinction. We have already pointed to the importance
    of separating out attributes (a Firstness) from entities (a Secondness)
  * Capable of distinguishing generals from particulars. We want discrete
    class-level types (generals, a Thirdness) and item-level (particulars, a Seco)
  * Attentive to the sign representativeness in Peircean semiosis. Peirce’s ten
    sign classes (see Table 2.2), or even analysis of his later 28~ and 66-sign
    classifications, are a rich target for applying mathematical or logical
    analysis for teasing out rules for analyzing problems
  * Reflective of the probabilistic nature of truth. We should favor learning
    models that support inductive reasoning and allow the use of probability
    distributions to characterize some nodes
  * Contextual. In that we capture both the intensionality and extensionality of
    our lexemes and choose word senses based on the overlap with accompanying
    text. The inclusion of inference and background world knowledge supports this
    aim [13]
* below three approaches in relative order of complexity of implementation
  * Peircean part-of-speech tagging
  * machine learning, and then
  * a dedicated Peircean grammar. We can also combine these three approaches

## 16.3 robotics 361

* Cognitive robots embrace the ideas of learning and planning and
interacting with a dynamic world
* Kinesthetic robots may also be helpful to our attempts to refine NLU

# 17 Conclusions looking across the broad sweep of our completed practionary

#Appendix A is a short bio of Charles S. Peirce, a most accomplished and

#Appendix B KBpedia. It is structured to enable useful splits across a dims

* from entities to relations to types that can all be selected to create
  positive and negative training sets, across multiple perspectives
* We split the KBpedia knowledge graph into concepts and topics, entities,
  events, attributes, annotations, and relations and their associated natural
  classifications or types

#Appendix C discusses the KBpedia features suitable for use by ML

* for NLP, a feature may be a surface form, like terms or syntax or structure
  (such as hierarchy or connections); it may be derived (such as statistical,
  frequency, weighted, or based on the ML model used); it may be semantic (in
  terms of meanings or relations); or it may be latent, as either something
  hidden or abstracted from feature layers below it. I present and organize
  an inventory of more than 200 feature types applicable to natural language
  They include lexical, syntactical, structural, and other items that reflect
  how we express the content in the surface forms of various human languages


# 1.3 Key Themes

* Peirce’s universal categories of Firstness, Secondness, and Thirdness. I
* Another area of ‘threes’ in this book is the idea of a triple
* Last, let me raise a crucial theme, fallibility
