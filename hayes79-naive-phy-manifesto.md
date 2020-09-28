Patrick J. Hayes
The naive physics manifesto
1979

# 0. Intro

* I propose the construction of a formalization of a sizable portion of
  common-sense knowledge about the everyday physical world
  * objects, shape, space, movement, substances (solids and liquids), time
* along the way I will outline the theory of meaning which this proposal
  assumes

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
    * a common formal framework (language, system, etc.) for the whole
      formalization, so that the inferential connections between the different
      parts (axioms, frames,...) can be clearly seen
    * it is methodologically important to allow the use of
      a variety of formalisms [in sub-areas]
    * [but] idiosyncratic formalisms [should be] systematically reducible to
      the basic formalism: they will be regarded as 'semantic sugar'

# 2 What the proposal isn't

* not a program
  * [demos] divert attention from the main goal
* not proposed to develop a new formalism or language
  * I propose that first~order logic is a suitable basic vehicle for
    representation
    1. important point is that the formalism has a clear interpretation
    2. idiosyncratic notation may sometimes be useful
      for idiosyncratic sub-theories
      * physical states of fluids as states of an FSM (Hayes 1978b)
    3. FOL needs to be extended.I have already found two tensions
      * quotation, so that the formalism can describe its own formulae
      * non-unique Skolem function, similar to Hilbert’s $\epsilon$-symbol
      * default

# 3.The axiom-concept graph: clusters and density 12%

* a naive physics formalisation consists, fundamentally, of
  * a large number of assertions, involving a large number of (nonlogical)
  * symbols = tokens: relation symbols, function and constant symbols
    (or: frame headers, slot names, etc; or: node and arc labels, etc.)
* The meaning of the tokens is defined by the structure of the formalisation, by
  the pattern of inferential connections between the assertions. This structure
* dense: for each token, there are many axioms involving it
  * they pin down exactly enough the meanings of the tokens they contain
  * e.g.  after ptckmg, the block is held, etc.  (in the familiar way); if this
* If one thing is above another, there are all sorts of consequences
  * Maybe the first will fall on the second, if its supports fail
  * there are consequences for the relative appearance of the two objects
  * the top one might provide a shelter for the bottom one
  * if the bottom one B supports the top one, then B will be under some strain
* the view of meaning espoused here differs profoundly from the view which holds
  that tokéns in a formalisation are essentially words in a natural language
  (Wilks 1977)
  * latter view, the tokens do represent the concept intended, by fiat: they are
    'semantic primitives', out of which ail other meanings are composed
* the axiom-concept (a-c) [hyper]graph
  * nodes are tokens of the formalisation, and whose
  * arcs correspond to axioms: an arc links two nodes if the corresponding axiom
  * The formalisation is dense if the a-c graph is highly connected, sparse if
  * not expect density to be uniform: there will be
    more dense clusters of concepts with many relationships between them, less
* Identifying these clusters is one of the most important and difficult tasks
  * several serious mistakes have been made in the past: here, for example,
  * e.g. causality is, I now tend to think, not a cluster: there is
    no useful, more-or-less self-con tained theory of causality.  'Causality' is
    * [effects depend] on circumstances.  e.g. If there is liquid around, for
  * What happens with liquids, however, is part of the liquids cluster, not part
    of some theory of 'what-happens-when'
  * hard, since a large conceptual structure can be entered anywhere
  * [if] it seems hard to say anything very useful about the concepts,
    * one has entered the graph at a locally sparse place,
      rather than somewhere in a cluster OR
    * having chosen one's concepts badly, lack of imagination, or any of several
  * cluster: assertions suggest themselves faster than one can write them down
* super-cluster: a cluster which is related to a large number of other clusters
  * e.g. the collection of concepts to do with three-dimensional shape and
    orientation are a super-cluster in our own mental conceptual structures:
    * concepts such as above, below, tall, fat, wide, behind, touching, resting
      on, angle of slope, edge (of a surface), surface (of a volume), side,
      vertical, top, bottom, ... These obviously have many internal
      relationships: they form a cluster
    * must appear significantly in
      * whatever conceptual frameworks underlie visual perception and locomotion
      * describing assemblies; in the
      * theory of liquids (Hayes 1978b)
      * physical actions and events (Hayes 1978c)
  * they crop up, in this way, in a variety of other clusters
  * Other [example]: a theory of measuring scales
    * notions as accuracy, vagueness, utility for various kinds of tasks), a
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
    (e.g. the integers ; the rationals ; the reals )
  * the desired properties of these concepts
    * e.g. the principle of induction for integers:
      the continuity of the real line)
    * follow from the structure of these definitions, and the axioms of the
    * theorems of the axiomatisation, not axiomatic assumptions themselves,
* differen[ce] from the axiomatic approach to naive physics which I am proposing
  * Set theory is reductionist in the extreme: are extraordinarily sparse
* adding definitions [to a reduced theory], a/c tends asymptotically to unity
  * The a-c graph has one very small cluster at the centre,
    surrounded by a cloud of nodes each linked radially
  * quite a different 'shape' from the connected, clustered graph of a dense
    axiomatic theory
* if one could find an reductionist theory for common sense reasoning
  * i.e. all concepts could be defined in terms of these few. In fact, this
  * I feel confident in asserting that no such small theory exists. And yet,
  * many approaches in the A1 literature, make such an assumption. These are the
  * 'semantic primitive' approaches, exemplified by the work of
    Wilks (1975, for example) and Schank (1975, for example). Here, members of a
  * number of primitived: Wilks 90 or so, Schank 14+n for some n, as yet unknown
* In Schank and his students: axiomatic structure of the 'core' theory — cf
  * Rieger's inference molecules associated with the 14 primitive action-tokens
  * the same sort of central organising role that the set axioms play
  * desired properties of e.g. buying or giving follow from their definitions,
    and the meaning given to the primitives by the core theory. In
* Wilks (1977)' merely present a list of tokens and a brief description
  * his semantic primitives are, in fact, words, like English words, not mere
* reductionist, semantic-primitives approach to meaning is essentially bound to
  low-fidelity, low-density representations . Such representations have their
  * may be adequate for information-retrieval or machine translation appli-
  * But at some point we will have represent detailed knowledge of the world

# 5. Meanings, model theory, and fidelity

* if the meanings of tokens are not specified by definitions, then how?
* a token means a concept to the extent that the formalisatzon taken as a whole
  enables a sufficient number of inferences to be made whose conclusions contain
  the token
* if the formalisation has an adequate model theory, be recast extensionally
* widespread delusion that a first-order model is merely another formal
  description of the world, just like the axiomatisation of which it is a model;
  and that the Tarskian truth-recursion is a kind of translation (Wilks, 1977)
* the relationship between an axiomatisation and its models (or, dually) is
  * many-many rather than one-one, for example. Moreover, it has the algebraic
  * Galois connection, which is to say, roughly, that as the axiomatisation is
* the deeper mistake: confuse a formal descnptzon of a model found in the
  textbooks with the actual model
* the real world can be a model of an cciorn system
* any axiomatisation [may have a very much simpler model than] the real one
  * then the tokens occurring in it mean no more than they mean in that model
* This is exactly what I mean by 'fidelity'. A low-fidelity formalisation of,
  say, the blocks world will admit models which are very much simpler
  * An adequate formalisation of a blocks world will be such that any model of
    it must have an essentially three-dimensional structure. Ihus, SHRDLU's
    blocks-world axiomatisation (Winograd 1972) uses three-dimensional Cartesian
    coordinates
* fidelity: how closely its stmplest model resembles the intended model. This
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
  * people with different formalisations
    in their heads may understand the same token in different ways. What I mean
    * e.g. 'water': find a substance and a set of circumstances such that I
      would call it water and you would not . And yet, we nught both be nght, since
    * our theories of 'water' may not be identical. And this may
    * even be possible when our beliefs about water (i.e. all the assertions
      which actually contain the token 'water') are identical
    * The difference may lie in some related concept (such as viscosity, or
      drinkability) which we understand differently
      * It may not even be possible to say exactly which tokens we differ on:
* confusion: Wilks has argued (Anderson+ 1972) that
  since there are people who have never seen ice,
  the fact that water freezes cannot be part of the meaning of 'water':
  for if it were, one would have to say that those people did not know 'water':
  * the word evidently means more to some people than to others: and to those
* However, people's cognitive structures are stmtlar
* One of the good reasons for choosing naive physics to tackle first is that
  there seems to be a greater measure of interpersonal agreement here
* [the change in] the meaning of a token is less, the further away the token is
  from the alteration
  * identify this distance with shortest-path distance in the axiom-concept g
    * not really adequate since it ignores the structure of the axioms,
      it is the best I can do at present
* Thanks to this distance-dilution effect, it seems a reasonable strategy to
  work on clusters more or less independently at first: the meaning of the
  * introduce concepts, which occur in some other cluster, fairly freely,
    assuming that their meaning is reasonably tightly specified there
  * e.g. in considering liquids, I needed to talk about volumetric shape:
  * occurrence [of shape] in the liquids cluster does alter their meaning: our
    concept of a horizontal surface would hardly be complete if we had never
    seen a large, still body of water —
    but we assume of a fazrly autonomous theory of shape
  * the 'definitions' view of meaning is wrong, but a good method
* we have to talk about the body and sensory input
  * as any consistent first-order axiomatisation has a model with only symbols
* 'motor tokens' symbols which describe bodily movements — are directly related
  to the body
* a naive physics has a physical body, equipped with sense organs: the notion of
* we can annotate the formalisation by noting the concepts which would be
  'attached' to bodily-movement-concepts and that this would be useful

# 6.Thoroughness and closure

* One way to have a high a/c ratio, it might seem, would be to keep c small, and
  * And if this could be done, it would indeed be very useful and encouraøng:
  * find some small, self-contained groups of concepts which could be formalised
    in total isolation to a reasonable degree of fidelity
* typical situation:  one quickly needs to introduce tokens
  * and in order to pin down thar meanings, yet more concepts
  * proliferation of tokens seems to be getting out of hand.  If one thinks of
* exploring the a-c graph of our conceptual structures, this phenomenon is of
  * One needs a sense of direction, to stay within the current cluster while
* proliferation must slow down eventually: for the formalisation is finite. The
* 'thoroughness' requirement is to go on until it does slow down: until one
* collection of concepts has closed upon itself, so that
  all the things one wants to say in the formalisation can be said using the
  tokens which have already been introduced. In the graphical analogy, until
  * we have spanned the entire graph, and need only to
    add new arcs, filling out the graph until its density is sufficient to
    capture the meanings of its tokens

This idea of closure is familiar to anyone who has built toy-world axiomati-
sations. One finds, suddenly, that there are enough concepts around so that one
can say 'enough' about them all: enough, that is to enable the inferences that
one had had in mind all along to be made. Closure can be achieved in very small
* if a formalisation is closed and has high fidelity (so, high density), then it
  must, I believe, also be thorough: its scope must cover all the major concepts
  of common-sense reasoning. This amounts to claiming that
  * the a-c graph is fairly strongly connected

This correlation between thoroughness and fidelity is a matter of degree

* To achieve greater fidelity, one will need greater thoroughness
  * e.g. To really capture the notion of 'above', it is probably
    * not enough to stay even within naive physics:
    * have to go into the various analogies to do with e.g. interpersonal status,
      (Judge's seats are raised: Heaven is high, Hell is low:
      to express submission, lower yourself, etc.) Only a very broad theory can
    * Imagrne a world in which the 'status' analogy was reversed, so that to be
      * a possible model of naive physics, but not of common sense: and it would
  *  formalisation cannot be deep without being broad, and
    must be deep to be dense: so a dense formalisation must be deep and broad

Clusters are exactly partial closures in this sense. A cluster contains a group
of concepts which close in on one another to some extent: one does need
other concepts, but within the cluster there are a long of things to be said about
* Clustering is also, therefore, [hyerarchical?], and depends upon the fidelity,
  the level of detail
* The programme of tackling naive physics in isolation
  * there is a level of detail at which naive physics forms a close cluster
  * a rich but tractable level of detail: it represents,
  * I believe, an order of magnitude more thoroughness than yet achieved; but

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
      inevitably follows a state in which an object is unsupported. In these,
  * there will be comprehension crtoms which assert the existence of the
    required entity, and its relationship to the entities already established
    (the space between the walls: or behind the door: the falling after (and
    below) the moment (and place) where the object loses its support, and so
    on)
  * these are all restrtcted comprehension axioms
    * We cannot take arbitrary pieces of 3-space or 4-space-time and treat them
      as individuals: only ones which are related in a describable way to
      entities we already have confidence in, as it were
  * one of the characteristic differences, between common-sense reasoning and
    'hard' scientific or philosophical reasoning
    * Common sense's ontology is prolix entities are used with
      * scant concern for philosophical tidiness,
      * little appeal to an underlying ontological simplicity (compare
        subatomic physics, for example, or even Chemistry's periodic table):
      * yet it is also very controlled: contrast Goodman's (1966) nominalism,
        or axiomatic set theory, or the comprehension axiom scheme of the
        typed X-calculus
      * far more richly structured collection of entities: fewer than in these
        * far more sorts on entities and relationshipd
  * global metric coordinate frameworks restores the unrestricted comprehension

# 9. Why it needs to be done

# 10. Why it can be done

# 11. How to get it done

# 12. Is this science?
