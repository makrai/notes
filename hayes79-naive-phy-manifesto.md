Patrick J. Hayes
The naive physics manifesto
1979

# 0. Intro

* I propose the construction of a formalization of a sizable portion of
  common-sense knowledge about the everyday physical world
  * objects, shape, space, movement, substances (solids and liquids), time
* along with the theory of meaning which this proposal assumes

# 1. The proposal: a summary

* not to
  * develop a new formalism to express this knowledge
    * formalism-hacking may become necessary in due course
    * existing, well-understood formalisms have many possibilities
  * write a program which can solve problems, or plan actions, or whatever
    * control and search issues -in short, computational issues
* characteristics
  * thoroughness [i.e. coverage]
  * fidelity. It should be reasonably detailed
  * Density. The ratio of facts to concepts needs to be fairly high
    * the units have to have lots of slots
  * uniformity
    * a common formal framework (language, system, etc.)
      so that the inferential connections between the different parts (axioms,
      frames,...) can be clearly seen
    * it is methodologically important to allow the use of
      a variety of formalisms [in sub-areas]
    * [but] idiosyncratic formalisms [should be] systematically reducible to
      the basic formalism: they will be regarded as 'semantic sugar'

# 2 What the proposal isn't

* not a program
  * [demos] divert attention from the main goal
* not proposed to develop a new formalism or language
  * I propose that first~order logic is a suitable basic vehicle for repr
    1. clear interpretation
    2. idiosyncratic notation may sometimes be useful
      for idiosyncratic sub-theories
      * physical states of fluids as states of an FSM (Hayes 1978b)
    3. needs to be extended.I have already found two tensions
      * quotation, so that the formalism can describe its own formulae
      * non-unique Skolem function, similar to Hilbert’s $\epsilon$-symbol
      * default

# 3.The axiom-concept graph: clusters and density 12%

* a naive physics formalisation consists of
  * a large number of assertions
  * symbols = tokens: relation symbols, function and constant symbols
    (or: frame headers, slot names, etc; or: node and arc labels, etc.)
* The meaning of the tokens is defined by the structure of the formalisation, by
  the pattern of inferential connections between the assertions
* dense: for each token, there are many axioms involving it
  * they pin down exactly enough the meanings of the tokens they contain
  * e.g.  after ptckmg, the block is held, etc.  (in the familiar way)
* If one thing is above another, there are all sorts of consequences
  * Maybe the first will fall on the second, if its supports fail
  * there are consequences for the relative appearance of the two objects
  * the top one might provide a shelter for the bottom one
  * if the bottom one B supports the top one, then B will be under some strain
* the view of meaning espoused here differs profoundly from the view which holds
  that tokéns in a formalisation are words in a natural language (Wilks 1977)
  * latter view, the tokens do represent the concept intended, by fiat: they are
    'semantic primitives', out of which ail other meanings are composed
* the axiom-concept (a-c) [hyper]graph
  * nodes are tokens of the formalisation, and whose
  * arcs correspond to axioms: an arc links two nodes if the corresponding axiom
  * The formalisation is dense if the a-c graph is highly connected
  * not expect density to be uniform: there will be
    more dense clusters of concepts with many relationships between them
* Identifying these clusters is one of the most important and difficult tasks
  * several serious mistakes have been made in the past
  * e.g. causality is not a cluster: no useful, self-con tained theory
    * [effects depend] on circumstances, e.g. if there is liquid around
    * What happens with liquids, however, is part of the liquids cluster,
      not part of some theory of 'what-happens-when'
  * hard, since a large conceptual structure can be entered anywhere
  * [if] it seems hard to say anything very useful about the concepts,
    * one has entered the graph at a locally sparse place,
      rather than somewhere in a cluster
    * OR  having chosen one's concepts badly, lack of imagination, etc
  * cluster: assertions suggest themselves faster than one can write them down
* super-cluster: a cluster which is related to a large number of other clusters
  * e.g. the collection of concepts to do with three-dimensional shape and
    orientation are a super-cluster
    * concepts such as above, below, tall, fat, wide, behind, touching, resting
      on, angle of slope, edge (of a surface), surface (of a volume), side,
      vertical, top, bottom, ... These obviously have many internal
      relationships: they form a cluster
    * must appear significantly in
      * conceptual frameworks that underlie visual perception and locomotion
      * describing assemblies
      * theory of liquids (Hayes 1978b)
      * physical actions and events (Hayes 1978c)
  * they crop up, in this way, in a variety of other clusters
  * Other [example]:
    * a theory of measuring scales
      * notions as accuracy, vagueness, utility for various kinds of tasks
      * theory of time-measurement, and
    * the collection of notions concerned with inside, outside, contatnment and
      ways through from one place to another

# 4.The a/c ratio and reductionist formalizations

* the ratio of axioms to concepts (the a/c ratio)
  * For a dense axiomatisation, a/c will be large
  * Any interesting axiomatisation will have a/c greater than one; but
  * there are interesting axiomatisations in which a/c will be very close to 1
* e.g. Zermelo-Fraenkel set theory: c = 2, viz. 'e' and 'set' , and a = 8, so
  * enables one to define many concepts
    (e.g. the integers; the rationals; the reals )
  * the desired properties of these concepts
    * e.g. the principle of induction for integers:
      the continuity of the real line
    * follow from the structure of these definitions, and the axioms
    * theorems of the axiomatisation, not axiomatic assumptions themselves
* differen[ce] from the axiomatic approach to naive physics which I am proposing
  * Set theory is reductionist in the extreme: extraordinarily sparse
* adding definitions [to a reduced theory], a/c tends asymptotically to unity
  * The a-c graph has one very small cluster at the centre,
    surrounded by a cloud of nodes each linked radially
  * quite a different 'shape' from the connected, clustered graph of a dense
    axiomatic theory
* if one could find a reductionist theory for common sense reasoning
  * i.e. all concepts could be defined in terms of these few
  * I feel confident in asserting that no such small theory exists
  * many approaches in the AI literature, make such an assumption
  * 'semantic primitive' approaches, exemplified by the work of
    Wilks (1975, for example) and Schank (1975, for example)
  * number of primitived: Wilks 90 or so, Schank 14+n for some n, as yet unknown
* In Schank and his students: axiomatic structure of the 'core' theory — cf
  * Rieger's inference molecules associated with the 14 primitive action-tokens
  * the same sort of central organising role that the set axioms play
  * desired properties of e.g. buying or giving follow from their definitions,
    and the meaning given to the primitives by the core theory
* Wilks (1977)' merely present a list of tokens and a brief description
  * his semantic primitives are, in fact, words, like English words
* reductionist, semantic-primitives approach to meaning is essentially bound to
  low-fidelity, low-density representations
  * may be adequate for information-retrieval or machine translation
  * But at some point we will have to represent detailed knowledge of the world

# 5. Meanings, model theory, and fidelity

* if the meanings of tokens are not specified by definitions, then how?
* a token means a concept to the extent that the formalisation
  enables a sufficient number of inferences to be made
  whose conclusions contain the token
* if the formalisation has an adequate model theory, be recast extensionally
* widespread delusion that a first-order model is merely another formal
  description of the world, just like the axiomatisation of which it is a model;
  and that the Tarskian truth-recursion is a kind of translation (Wilks, 1977)
* the relationship between an axiomatisation and its models (or, dually) is
  * many-many rather than one-one, for example
  * Galois connection
* the deeper mistake: confuse a formal description of a model found in the
  textbooks with the actual model
* the real world can be a model of an cciorn system
* any axiomatisation [may have a very much simpler model than] the real one
  * then the tokens occurring in it mean no more than they mean in that model
* This is exactly what I mean by 'fidelity'. A low-fidelity formalisation of,
  say, the blocks world will admit models which are very much simpler
  * An adequate formalisation of a blocks world will be such that any model of
    it must have an essentially three-dimensional structure. Thus, SHRDLU's
    blocks-world axiomatisation (Winograd 1972) uses three-dimensional Cartesian
    coordinates
* fidelity: how closely its stmplest model resembles the intended model
  * an excellent argument for a representational language's having a model theo
* features of representational languaces to insist upon the model complexity
  * e.g. first-order logic, these include
    * functions (the use of which claims that there is a value of the function)
    * explicit existential assertions (especially 'comprehension axioms')
    * equality, and the use of
    * a highly sorted logic
      in AI terms : the presence of an isa hierarchy related to the quantifiers
* meaning of a token depends upon the entire formalisation
  * an alteration to any part of the formalisation can change every other part
  * learning a new fact or acquiring a new concept, is liable to have
    far-reaching consequences for the ways in which one understands the meanings
    of other concepts
  * people with different formalisations in their heads
    may understand the same token in different ways
    * e.g. 'water': find a substance and a set of circumstances such that I
      would call it water and you would not
    * our theories of 'water' may not be identical
    * even be possible when our beliefs about water (i.e. all the assertions
      which actually contain the token 'water') are identical
    * The difference may lie in some related concept (such as viscosity, or
      drinkability) which we understand differently
      * It may not even be possible to say exactly which tokens we differ on:
* confusion: Wilks has argued (Anderson+ 1972) that
  since there are people who have never seen ice,
  the fact that water freezes cannot be part of the meaning of 'water':
  for if it were, one would have to say that those people did not know 'water':
  * the word evidently means more to some people than to others
* However, people's cognitive structures are similar
  * One of the good reasons for choosing naive physics to tackle first is that
    there seems to be a greater measure of interpersonal agreement here
* [the change in] the meaning of a token is less, the further away the token is
  from the alteration
  * identify this distance with shortest-path distance in the axiom-concept g
    * not really adequate since it ignores the structure of the axioms,
    * it is the best I can do at present
* Thanks to this distance-dilution effect, it seems a reasonable
  strategy to work on clusters more or less independently at first
  * introduce concepts, which occur in some other cluster, fairly freely,
    assuming that their meaning is reasonably tightly specified there
  * e.g. in considering liquids, I needed to talk about volumetric shape:
  * occurrence [of shape] in the liquids cluster does alter their meaning:
  * e.g. our concept of a horizontal surface would hardly be complete if we had
    never seen a large, still body of water —
    but we assume of a fairly autonomous theory of shape
  * the 'definitions' view of meaning is wrong, but a good method
* we have to talk about the body and sensory input
  * as any consistent first-order axiomatisation has a model with only symbols
  * 'motor tokens' symbols which describe bodily movements — are
    directly related to the body
  * a naive physics has a physical body, equipped with sense organs
  * we can annotate the formalisation by noting the concepts which would be
    'attached' to bodily-movement-concepts and that this would be useful

# 6.Thoroughness and closure

* One way to have a high a/c ratio, it might seem, would be to keep c small
  * And if this could be done, it would indeed be very useful and encouraging:
  * find some small, self-contained groups of concepts which could be formalised
    in total isolation to a reasonable degree of fidelity
* typical situation: one quickly needs to introduce tokens
  * and in order to pin down thar meanings, yet more concepts
  * proliferation of tokens seems to be getting out of hand
* If one thinks of exploring the a-c graph of our conceptual structures, this
  * One needs a sense of direction, to stay within the current cluster
* proliferation must slow down eventually
* 'thoroughness' requirement is to go on until it does slow down
* collection of concepts has closed upon itself, so that
  all the things one wants to say in the formalisation can be said using the
  tokens which have already been introduced
  * we have spanned the entire graph, and need only to
    add new arcs, filling out the graph until its density is sufficient to
    capture the meanings of its tokens
* if a formalisation is closed and has high fidelity (so, high density), then it
  must, I believe, also be thorough:
  its scope must cover all the major concepts of common-sense reasoning
  * the a-c graph is fairly strongly connected
* To achieve greater fidelity, one will need greater thoroughness
  * e.g. To really capture the notion of 'above', it is probably
    * not enough to stay even within naive physics:
    * have to go into analogies to do with e.g. interpersonal status,
      (Judge's seats are raised: Heaven is high, Hell is low:
      to express submission, lower yourself, etc.)
    * Imagrne a world in which the 'status' analogy was reversed
      * a possible model of naive physics, but not of common sense
  * formalisation cannot be deep without being broad, and
    must be deep to be dense: so a dense formalisation must be deep and broad
* Clustering is also, therefore, [hyerarchical?], and depends upon the fidelity,
  the level of detail
* The programme of tackling naive physics in isolation
  * there is a level of detail at which naive physics forms a close cluster
  * a rich but tractable level of detail
  * I believe, an order of magnitude more thoroughness than yet achieved

# 7. Some likely clusters and their concepts

* It is quite likely that many of these are not clusters in any real sense
* They may, for example, split into pieces on closer investigation; or,
* new links may be revealed which blur the edges of the clusters. Nevertheless,

# 7.1 Measuring Scales

# 7.2 Shape, Orientation and Dimension

# 7.3 Inside and Outside

## 7.4 Histories: describing happenings

* The now-classical approach to describing actions and change, pioneered by
  John McCarthy, is to use the concept of state or situation
* snapshots of the world at a given moment:
  actions and events are then functions from states to states
* I now think however, that is a mistake or at least a gross over-amplification
* e.g. Two people in New York agree to meet a week later in London
* What we need is a notion of a state of an event which has a restricted
  spatial extent
* By a _history_ I mean such an object, viz. a connected piece of space-time
  physically bounded on all four dimensions, in which ‘something happens’

# 7.5 Energy and Effort

# 7.6 Assem blies

# 7.7 Support

# 7.8 Substances and Physical States

# 7.9 Forces and Movement

# 7.10 Liquids

# 8. Some structured formalization techniques 73 %

1. tcrononues: finite exhaustive lists
  * e.g. For example, in the case of support, we can rapidly infer that if a
    passive thing is held up by a string (and that's all), and the string
    breaks, then it must fall: for there is nothing underneath (case I), there
    is no liquid for it to float on (case 3), it isn't attached to anything
    (case 2), and it can't fly: so it must be supported
2. comprehension axioms
  * As we pointed out earlier, axioms which establish the existence of entities
    * e.g. the spaces (places) defined by physical boundaries (rooms, insides of
      cups), or by various (metric and non-metric) coordinate systems, and the
      histories which ensue when various states obtain, e.g. the falling which
      inevitably follows a state in which an object is unsupported
  * there will be comprehension atoms which assert the existence of the
    required entity, and its relationship to the entities already established
    (the space between the walls: or behind the door: the falling after (and
    below) the moment (and place) where the object loses its support, etc.)
  * these are all restricted comprehension axioms
    * We cannot take arbitrary pieces of 3-space or 4-space-time and treat them
      as individuals: only ones which are related in a describable way to
      entities we already have confidence in
  * one of the characteristic differences, between
    common-sense reasoning and 'hard' scientific or philosophical reasoning
    * Common sense's ontology is prolix entities are used with
      * scant concern for philosophical tidiness,
      * little appeal to an underlying ontological simplicity (compare
        subatomic physics, for example, or even Chemistry's periodic table):
      * yet it is also very controlled: contrast Goodman's (1966) nominalism,
        or axiomatic set theory, or the comprehension axiom scheme of the
        typed X-calculus
      * far more richly structured collection of entities
        * far more sorts on entities and relationshipd
  * global metric coordinate frameworks restores the unrestricted comprehension

# 9. Why it needs to be done

* there are those who believe [in] a simple uniform learning procedure
  * no need for naive physics
  * their pre-theoretical assumptions differ much from those made by most AI
  * essentially a different field
* disagreement on methodology
  * dominant view: construct a 'complete' program in order to demonstrate
    * applyed too soon (typically, after 3 years work)
  * The naive physics proposal avoids the construction of such a program
* Our aim is to construct a formalisation: search space of possible inferences
  * deliberately ignored:
    * implementational questions: how to search this space;
      controlling an interpreter; information retrieval and relevancy
    * computational questions: data structures; how to implement fast searches;
      the choice of programming language
  * McCarthy (1977) makes some similar arguments
  * diverting resources [munkameosztás]
  * goal: tackle the essential representation problems
* [the dominant way] happens in two ways
  * domain of the program must be restricted in some way
    * a restricted subject-matter for a reasoning program, a restricted vocab
    * It follows, then, that the representation is not **thorough**
    * techniques which work only for small 'toy' worlds'
  * low density. There is a good reason for this
    * a dense representation necessarily defines
      an explosively expanding search space of possible inferences
    * If the only heuristic devices available for controlling an inferential
      search are weak and general (numerical) heuristics, depth-first search
  * These two pressures encourage sparse representations of limited scope
* a closely related point concerned with adequacy: A popular view in AI
  * a small step to accepting a sort of behaviourist criterion of adequacy
    i.e. the representation support an adequate behaviour in some perfor program
  * it takes no account of scale effects
  * One cannot make a program which behaves adequately in a large 'world'
    by adding together programs which perform adequately in smaller sub-worlds
  * world just doesn't split up that neatly: one needs the interaction
  * e.g. representation of, say, the blocks world be less adequate for reasoning
    about blocks in the context of liquids, rods, friction, pulleys, etc
  * needed: upward compatibility of formalisations

# 10. Why it can be done

* my four reasons for feeling optimistic
1. success in individuation
  * my recent experiences in tackling the 'liquids' problem, which
    * I have long believed was one of the most difficult problems in repr theo
  * The idea of quantifying over pieces of space rather than pieces of liquid,
  * the correct procedure for individuating a liquid object:
    the criterion by which one could refer to such a thing
  * concern for individuating criteria may well lead to progress in other clus
  * McCarthy (private communication) based on the individuation of 'concepts'
2. the idea of histories outlined earlier
3. the no-programming methodology already discussed
  * hardly anybody has to build a large, heuristically adequate formalisation
  * when we are freed from the necessity to implement performance programs
4. next section: an obvious method for getting it done: successful in many areas

# 11. How to get it done

* getting knowledge out of people's heads and into a formalisation
  * Within AI, it has been called 'knowledge engineering' by Feigenbaum (1977);
  * 'expert' (i.e. a human being whose head contains knowledge)
  * a preliminary formalisation, based upon his introspective account
  * performance [of the formalisation] is compared with that of the expert
  * The expert pinpoints more exactly the inadequacies in his first introspec
  * iteratively detailed and corrected
  * the expert, continually confronted with the formal consequencies of his
    introspections, becomes better at detailed introspection
* formalisation is, typically, a collection of condition-action rules
* In linguistics, the
  * formalisation is a grammar of some sort which assigns syntactic structures
  * expert is a native speaker: indeed, the expert is usually the linguist
* this process of formalisation can also be used to develop naive physics
* The ideal way to make progress is to have a committee
  * Each member is assigned what seems to be a cluster, and has to formalise
  * They tell one another what they require from the other clusters
  * the fragmentary formalisations are put together at a group meeting,
  * some clusters will dissolve, and new ones will emerge
* Initially, the formalisations need be
  little more than carefully-worded English sentences
  * Fairly soon, it will be necessary to expres the intuitions formally
  * free choice of formal language: frame-like notations, semantic networks,
    superficial variants of first-order logic, or even more exotic formalisms
  * inferential relationships between the formalisms should be made explicit
  * = they should all be translatable into predicate calculus
  * particular clusters may suggest special ad-hoc representations, e.g. shapes
  * One can imagine a cluster, represented in some idiosyncratic way, whose
    internal inferential relationships were inaccessible from outside
    * e.g. statements of relative position and orientation
* other ways to find concept-clusters
  * thesaurus
  * choosing a particular domain (cookery, volumetric measurements)
  * analysing some everyday act in detail (e.g. spreading a sheet over a bed by
    holding two corners and flicking: why does that work?)

# 12. Is this science?

* clear criteria of success or failure?
  * needs a more adequate reply than I am currently able to give
  * the usual scientific judgements of 'elegance', 'economy', etc.
  * judgements of physical plausibility and elementary causality are certainly
    as reliable as judgements of grammaticality by native speakers
* (if) naive physics could be linked with data now available in
  Piagetian psychology on the development of physical concepts during childhood
  * but data is compatible with many different developmental theories
