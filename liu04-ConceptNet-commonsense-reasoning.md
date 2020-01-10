ConceptNet — a practical commonsense reasoning tool-kit
H Liu and P Singh
2004 BT Technology Journal

Mindenről több helyen is beszél és emiatt redundáns. A jegyzetben a
redundanciát elkerültem, de nem refaktoráltam a cikket

#Abstract

* semantic network presently consisting of
  * over 1.6 million assertions of commonsense knowledge
    * spatial, physical, social, temporal, and psychological aspects
  * generated automatically from the 700 000 sentences of the
    Open Mind Common Sense Project — a
    * [crowd sourced] collaboration with over 14 000 authors

##1.2 Making sense of text

* defeasible
  * often just a default assumption about the typical case

##1.3

* size and scope of ConceptNet make it comparable to ... two other most notable
  largescale semantic knowledge bases in the literature: Cyc and WordNet
* differences ... these will be spelled out in the following section
  * WordNet is optimised for lexical categorisation and word-similarity
  * Cyc is optimised for formalised logical reasoning,
  * ConceptNet is optimised for making
    practical context-based inferences over real-world texts
    * its knowledge representation is itself semi-structured English
    * further discussion of [natural semantic meta-language]: 
      Liu and Singh (2004)
  * contextual reasoning
  * k-lines (Minsky 1987)
    * generic conceptual connections
    * Of the 1.6 million assertions in its knowledge base, approximately
      1.25 million are dedicated to [k-lines]
    * broadly characterise texts along ... topic and affect
    * understand novel or unknown concepts by employing
      structural analogies to situate them within what is already known

#2. Comparison to Cyc and WordNet 2

* ConceptNet
  * a richer (though still very pragmatic) set of semantic relations
    (e.g.  EffectOf, DesireOf, CapableOf) between
  * compound concepts (e.g. ‘buy food’, ‘drive car’)
* Cyc
  * begun in 1984 by Doug Lenat, tries to
  * formalise commonsense knowledge into a logical framework [5]
  * Assertions are largely handcrafted by knowledge engineers at Cycorp
  * 1.6 million facts interrelating more than 118 000 concepts
  * first [disambiguate the text manually] into its
    proprietary logical representation, described by its own language CycL
* ConceptNet is a semantic network of commonsense knowledge
  * 1.6 million edges connecting more than
  * 300 000 nodes: semistructured English fragments
  * twenty semantic relations

##2.1 Differences in acquisition 3

* WordNet and Cyc are both largely handcrafted by knowledge engineers,
* ConceptNet is generated automatically
  from the English sentences of the Open Mind Common Sense (OMCS) corpus
* OMCS is [crowd sourced]
  * 14 000 Web contributors who logged in to enter sentences in a
  * fill-in-the-blank fashion
    e.g. ‘The effect of eating food is ...’; ‘A knife is used for ...’
  * 700 000 English sentences

##2.2 Structured like WordNet, relationally rich like Cyc 4

* nodes
  * compound concepts, which compose an action verb with one or two direct or
    indirect arguments (e.g.  ‘buy food’, ‘drive to store’)
  * ConceptNet does not currently distinguish between word senses
    * affiliated project called OMCSNet-WNLG [7]
      sense-disambiguating ConceptNet nodes
* twenty semantic relations including, for example, EffectOf (causality),
  SubeventOf (event hierarchy), CapableOf (agent’s ability), PropertyOf,
  LocationOf, and MotivationOf (affect)
  * Some further intuition ... is given in the next section
  * coarse groupings of relations
  (e.g.  affect-relations versus temporal-relations versus spatial-relations)
* informal, defeasible, and practically valued nature
  * [as oppoed to WordNet that]
    * has formal taxonomic knowledge that
      ‘dog’ is a ‘canine’ is a ‘carnivore’ is a ‘placental mammal’
    * [not has the] association that ‘dog’ is a ‘pet’

##2.3 ConceptNet as a context machine

* Gelernter [8]
  * human reasoning ... along a spectrum of mental focus
    * high, logical and rational thinking happens
    * medium or low focus, where ... gestalt perception, creative analogy,
    * lowest focus, pure association
* context-friendly reasoning methods such as
  spreading activation (Collins A and Loftus E 1975) and graph traversal
* tasks
  * (spatial, affective, and temporal projections)
    * given a ... series of everyday events,
    [what is the likely location,] mood ... possible next events?
  * (contextual disambiguation)
    * given a search query (assuming the terms are commonsensical) where one
      of the terms can have multiple meanings, which meaning is most likely?
  * (analogy-making)
    * presented with a novel concept appearing in a story, which known
      concepts most closely resemble or approximate the novel concept?
* generic connections between concepts ... best described as k-lines, which
  Minsky [2] implicates as a primary mechanism for context and memory
  * k-line knowledge increases the connectivity of the semantic network, and
    makes it more likely that concepts parsed out of a text document can be
    mapped into ConceptNet
* ConceptNet’s [natural metalanguage]: (Liu H and Singh P 2004)

#3. Origin, construction and structure of ConceptNet 5

##3.1 History

* Open Mind Common Sense (OMCS) Web site [6] was built in 2000, a collection of
  * 30 different activities
    * e.g. simple assertions, descriptions of typical situations,
      stories describing ordinary activities and actions
  * 14 000 contributors, many with no special training in computer science
  * commonsense knowledge, expressed in natural [meta-]language
* ARIA photo retrieval system’s commonsense [inference], CRIS
  (Liu H and Lieberman H 2002)
  * earliest application of the OMCS corpus
    to mine out knowledge into a semantic network
  * extract taxonomic, spatial, functional, causal, and emotional knowledge
  * spreading activation to improve information retrieval
* OMCSNet ... semantic network with 280 000 edges and 80 000 nodes
  * three chief functions
    * FindPathsBetweenNodes(node1,node2), GetContext(node), and
      GetAnalogousConcepts(node)
  * used by early adopters to build several interesting applications, such as a
    * dynamically generated foreign-language phrasebook called GloBuddy
      (a newer version is discussed by Lieberman et al [11])
    * conversational topic spotter [12]

##3.2 ConceptNet 2.0 6

* weighting ... each binary assertion based on
  * how many times it was uttered in the OMCS corpus, and on
  * how well it can be inferred indirectly from other facts in ConceptNet
* assertions inferred
  * e.g. ‘A lime is a sour fruit’ => IsA(lime, fruit); PropertyOf(lime, sour)
* Generalisations
  * if the majority of fruits have the property ‘sweet’, then this
    property is lifted to the parent class, as: Property Of(fruit, sweet)
* Three k-line relations
  (SuperThematicKLine, ThematicKLine, and ConceptuallyRelatedTo)
  * SuperThematicKLines, which unify themes with their variations
    (e.g. ‘buy’ is a supertheme of ‘purchase groceries’ and ‘buy food’)
    * manipulations such as node reconciliation
    (e.g. dynamically merge ‘buy food’ and ‘purchase groceries’
    given the appropriate context) and
    * node-variation generation
      * applying lexical hierarchies and synonyms to generate similar nodes
* MontyLingua is
  * an end-to-end integrated natural-language-understander for English
  * written in Python and also available in Java
    * accepts the input of paragraphs and documents, automatically
    * extracts salient event-structures from parsed text, and performs the
    * inferences using the semantic network
      * discussed in a later section

##3.3 Building ConceptNet

* ConceptNet is produced by an automatic process
  1. extraction rules to the semi-structured English sentences of the OMCS
  2. ‘relaxation’ procedures (i.e.  filling in and smoothing over network gaps)
    to optimise the connectivity of the semantic network

###3.3.3 ‘Relaxation’ over the network

1. duplicate assertions are merged and ... ‘frequency’ is added
2. heuristically ‘lift’ knowledge from the children nodes to the [IsA-]parent
3. thematic and lexical generalisations are produced which
  * relate more specific knowledge to more general knowledge
  * SuperThematicKLine relation-type
  * WordNet and FrameNet’s [15] verb synonym-sets and class-hierarchies are
    used
4. when noun phrase nodes contain adjectival modifiers, these can be ‘lifted’
   and reified as additional PropertyOf knowledge, as given in the following
   example:

```
[(IsA ‘apple’ ‘red round object’);
(IsA ‘apple’ ‘red fruit’)]
IMPLIES
(PropertyOf ‘apple’ ‘red’)
```
5. noun synonyms and derivatives (_-ation_)
  * addition of a lexical SuperThematicKLine

##3.4 Structure of the ConceptNet knowledge base 7

* Figure 2 is a treemap of the ConceptNet relational ontology, showing the
  relative amounts of knowledge falling under each relation-type
* Table 1 concrete example of each relation-type
* ConceptNet’s relational ontology was determined quite organically. The
  * largely through ... users filling in the blanks of templates like
    ‘a hammer is for ...’
  * Other portions of the OMCS corpus accepted freeform input, but
    * restricted [length] to encourage pithy phrasing and simple syntax
  * choice of relation-types reflect our original choice of templates in OMCS,
    and also reflect common patterns we observed in the freeform portion
* ConceptNet knowledge base is built by an automated three-stage process:
  * extract binary-relation assertions from OMCS sentences,
    * regular expressions and syntactic-semantic constraints
  * assertions are normalised,
  * ‘relaxation’

#4.  ConceptNet’s integrated natural-language-processing engine 8

* context vs logic
  * logic is microscopic, highly granular, well-defined, and static,
  * context is macroscopic, gestalt, heuristic, and quite dynamic
* In this section
  1. ConceptNet’s integrated natural-language-processing engine
  2. three basic node-level reasoning capabilities
    * contextual neighbourhoods, analogy and projection
  3. four document-level reasoning capabilities newly supported in ConceptNet —
    * topic gisting, disambiguation/classification,
      novel-concept identification, and affect sensing

##4.1 An integrated natural-language-processing engine

* MontyLingua performs language-processing functions including text
  normalisation, _commonsense-informed_ part-of- speech tagging, semantic
  recognition, chunking, surface parsing, lemmatisation, thematic-role
  extraction, and pronominal resolution

##4.2 Contextual neighbourhoods 9

###4.2.1 Realm-filtering

* the relevance of each relation-type varies with respect to each task or applc
  * relation-types are assigned [different] numeric weights for each task
  * [for] spreading activation

###4.2.2 Topic generation

The GetContext() function is useful for
  * semantic query expansion and topic generation
  e.g. Musa et al’s GloBuddy system ... a dynamic foreign-language phrase book
  * querying the contextual intersection of multiple concepts. If we
    * topic gisting
    * extract all the concepts from a text document and take their intersection

##4.3 Analogy-making

* [Analogy] is a process of
  * decomposing an idea into its constituent aspects and parts, and then
  * seeking out the idea or situation in the target domain that shares a
    salient subset of those aspects and parts
* in AI
  * dissecting ideas into representations like schemas and frames
  * Minsky M: ‘The society of mind’, Simon & Schuster (1987)
  * pseudonyms [álnév] like
    * fuzzy matching
    * case-based reasoning (Leake DB 1996)
    * structure-mapping theory (Gentner D 1983)
      * shared syntactic relations between concepts
    * high-level perception (Chalmers, French, and Hofstadter 1991)
    * slipnets (Hofstadter and Mitchell)
* Analogy in ConceptNet can be coaxed to resemble either
  * structure-mapping or
    * weakly semantic relations (e.g.  ‘LocationOf’, ‘IsA’) or
  * slipnets depending on whether
    * strongly semantic relations (e.g. ‘PropertyOf’, ‘MotivationOf’) are
    * connections between nodes are heuristically weighted
* dimensionally bias the GetAnalogousConcepts() feature
  * emphasise functional versus affective versus attribute similarity

##4.4 Projection 10

* Subevent projection may be useful for goal planning, while
* causal projection
  * MAKEBELIEVE (Liu and Singh)... interactive storytelling system
  * selection of discourse transitions in SAM
    Collaborative Storytelling Agent (Wang)

##Summary

* three node-level functionalities are implemented,
  context-finding, analogy-making, and projection
* four document-level functions, topic-gisting, disambiguation and
  classification, novel-concept identification, and affect sensing

#5. Characteristics and quality of the ConceptNet knowledge base 12

* difficult to evaluate
  * What is and is not ‘common sense?’
  * How does one assess the goodness of knowledge that is defeasible
  * How much commonsense about a topic or concept constitutes completeness?
* how is it improving the behaviour of the intelligent system ... Section 6
* In this section, we attempt to characterise very broadly the
  * coverage by making some quantitative inquiries
  * goodness [by] human evaluations of OMCS and ConcepNet

##5.1 Characteristics of the knowledge base

* [informativeness] of ConceptNet’s nodes
  * Are concepts expressed simply or obscurely?
  * histogram of nodal word-lengths
* the frequency with which ConceptNet’s unique assertions are
  * uttered in the OMCS corpus (Fig 7), and the frequency with which one
  * inferred from other assertions
  * Relaxation assists in convergence
    * by finding echoes that corroborate and strengthen uttered assertions
    * there is much potential for improvement in this regard
* connectivity of the semantic network by measuring [node degree], Fig 8
  * With the addition of k-line knowledge
    * either ... k-lines are very well-connected among themselves, or
      k-lines mainly facilitate the connectivity of nodes otherwise already
      connected. The truth is probably a mix of the two extremes

##5.2 Quality of the knowledge

* quality of the Open Mind Common Sense corpus
  * original OMCS corpus was previously evaluated by Singh et al [6]. Human
  * 75% of items as largely true, 82% as largely objective,
    85% as largely making sense, and
    84% as knowledge someone would have by high school

###5.2.1 Evaluation of ConceptNet version 1.2

* Concepts were judged along these two dimensions,
  * results for this concept are fairly comprehensive,
  * results for this concept include incorrect knowledge, nonsensical data, or
    non-commonsense information
* each on a Likert 1 (strongly disagree) to 5 (strongly agree) scale
* inter-judge agreement

#6. research applications of ConceptNet 14

#7. how ConceptNet fits into a bigger picture
