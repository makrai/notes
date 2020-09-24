A Spreading-Activation Theory of Semantic Processing
Allan M. Collins and Elizabeth F. Loftus

# Abstract

* based on Quillian's theory
  of semantic memory search and semantic preparation, or priming
* several of the misconceptions concerning Quillian's theory are discussed
* additional assumptions to apply it to recent experiments
* how the extended theory can account for results of several
  * production experiments by Loftus,
  * Juola and Atkinson's multiple-category experiment,
  * Conrad's sentence-verification experiments, and several
  * categorization experiments on the effect of semantic relatedness and
    typicality by Holyoak and Glass, Rips, Shoben, and Smith, and Rosch
    * a critique of the Smith, Shoben, and Rips model for categorization
      judgments

# [Intro]

* Quillian (1962, 1967) proposed a spreading-activation theory
  of human semantic processing
  * tried to implement in computer simulations of
    * memory search (Quillian, 1966) and
    * comprehension (Quillian, 1969)
    * effects of preparation (or priming)
      * spreading activation from the node of the primed concept
* organization
  1. the original theory
    * trying to correct a number of the common misunderstandings
  2. extend the theory in several respects, and in the
  3. how the extended theory deals with some recent experimental findings
  4. compare the theory to the model of Smith, Shoben, and Rips (1974)

# Quillian's theory of semantic memory

* developed as a program for a digital computer
  * We will elaborate the theory in psychological terms
* People's concepts contain indefinitely large amounts of information
  * less and less relevant
* concepts correspond to particular senses of words _or phrases_
* concept can be represented as a _node_ in a network, with
  * properties of the concept represented as labeled relational links
* links
  * usually go in both directions between two concepts
  * can have different criterialities, which are numbers indicating how
    essential each link is to the meaning of the concept. The criterialities
    [in two directions] can be different
  * the full meaning of any concept is the whole network as entered from the
    concept node
  * kinds of links:
    1. superordinate ("isa") and subordinate links,
    1. modifier links,
    1. disjunctive sets of links,
    1. conjunctive sets of links, and
    1. a residual class of links, which allowed the specification of any
       relationship where the relationship (usually a verb relationship) itself
       was a concept
  * links could be nested or embedded to any degree of depth
* search in memory between concepts involves tracing out in parallel
  (simulated in the computer by a breadth-first search) along the links from
  the node of each concept specified by the input words. The words might be
  part of a sentence or stimuli in an experimental task
  * At each node reached in this process, an activation tag is left that
    specifies the starting node and the immediate predecessor
  * intersection between the two nodes has been found
    * By following the tags back to both starting nodes, the _path_ that led
      to the intersection can be reconstructed
* evaluate the path to decide if it satisfies the constraints imposed by
  syntax and context
  * rules that are invoked
    * for comprehension of sentences ... are described in Quillian (1969)
    * For categorization tasks ... described by Collins and Quillian (1972b)
      and in the next section of this paper
* Priming
  * links as well as nodes will be primed

## Common Misinterpretations of Quillian's Theory p3

* many of them deriving from Collins's (Collins & Quillian, 1969, 1970a, 1970b)
  simplifications of the theory
* cognitive economy (JR Anderson & Bower, 1973; Conrad, 1972)
  * strong theory of cognitive economy,
    * which Conrad takes issue with in her attack on Collins and Quillian
      (1969)
    * "all properties are stored only once in memory and must be retrieved
      through a series of inferences for all words except those that they
      most directly define"
  * weak theory of cognitive economy, which Collins and Quillian were testing
    * "every time one learns that X is a bird, one does not at that time store
      all the properties of birds with X in memory"
  * measure inference time,
* all links are equal
  (RC Anderson & McGaw, 1973; Rips, Shoben, & Smith, 1973; Wilkins, Note 1)
  * In Quillian's original theory, there were criteriality tags on links, as
    we described earlier
  * In Collins and Quillian (1969, 1972b) links were assumed to have
    differential accessibility (i.e., strength or travel time)
    * accessibility of a property depends on how often a person thinks about
      or uses a property of a concept
    * Whether criteriality and accessibility are treated as the same or
      different is a complex issue,
  * related [misunderstanding]: feature models can account for data that
    network models cannot
    * feature model posits that a concept consists of a set of values on a
      large number of semantic dimensions (e.g., animateness, color, etc.)
    * network models were developed as a method of representing features in a
      computer.  Any process that can be represented in a feature model is
      representable in a network model;
    * One way that Quillian's theory is different from the Smith+ models is
      that superordinate connections, if they exist, would also be found and
      evaluated
* memory search to make a categorization judgment _proceeds from the instance
  to the category_
  * Juola and Atkinson's (1971) work on categorization judgments
  * categorization task, response time is measured for a subject to decide
    whether or not a particular instance (e.g., "car") is a member of one or
    more categories (e.g., "flower" or "vehicle")
* Anderson and Bower (1973)
  * parallel model: search rate is slower in proportion to the number of paths
    that must be searched" (p.  371)
  * independent parallel search is like a race where the speed of each runner
    is independent of the other runners
    * a common assumption in psychology, because it makes it possible to
      assign an upper bound to reaction time (see Sternberg, 1966)
  * there is no difficulty for Quillian's theory if the parallel search rate
    depends on the number of paths searched
* other misconceptions
  * discussed in
    * Collins and Quillian (1972b)
    * We will return to some of these same papers below,
  * e.g
    * rigidly hierarchy
      * which Anderson and Bower (1973, p.  379) still believe, and
    * the theory predicts it will always take less time to compare
      concepts that are close together in the semantic network
      * Schaeffer and Wallace's (1970)

# The extended theory

* more processing and structural assumptions

## Local Processing Assumptions

* transform the theory from computer terms to quasi-neurological terms,
1. activation spreads out along the paths of the network in a decreasing
   gradient. The decrease is inversely proportional to the accessibility
   or strength of the links
2. The longer a concept is continuously processed ..., the longer activation
   is released from the node of the concept at a fixed rate
   * Only one concept can be actively processed at a time
     * a limitation imposed by the serial nature of the human central process
       (Collins & Quillian, 1972b)
3. Activation decreases over time and/or intervening activity
  * Assumptions 2 and 3 impose a limitation on the amount of activation that
    can be allocated in priming more than one concept, because the more
    concepts that are primed, the less each will be primed
4. With the assumption that activation is a variable quantity,
  * intersection requires a threshold for firing
  * activation from different sources summates

## Global Assumptions About Memory Structure and Processing

* These are generalizations of Loftus's (Note 2) arguments that
  * semantic memory is organized primarily into _noun categories_ and that
  * there is a _"dictionary" (or lexical memory)_ separate from the conceptual
    network
5. network is organized along the lines of semantic similarity
  * The more properties two concepts have in common,
    the more links there are between the two nodes
    * different vehicles or different colors will all be highly interlinked
    * red things (e.g., fire engines, cherries, sunsets, and roses) are not
      closely interlinked, despite the one property they have in common
  * Semantic relatedness is a slightly different notion from semantic distance,
    though the two terms are sometimes used interchangeably
    * distance is along the shortest path, and
    * relatedness (or similarity) is an aggregate of all the paths
6. The names of concepts are stored in a lexical network (or dictionary)
   that is organized along lines of phonemic (and to some degree
   orthographic) similarity
   * properties that Brown and McNeill (1966) found people could identify
     about words on the "tip of their tongue"
7. people can control whether they
  prime the lexical network, the semantic network, or both

## Assumptions About Semantic Matching Process

* whether or not two concepts match semantically
* occurs in many aspects of language processing, such as
  * matching referents,
  * assigning cases, and
  * answering questions
    (Collins & Quillian, 1972b; Collins, Warnock, Aiello, & Miller, 1975)
* Categorization tasks, which ask "Is X a Y?"
* The decision process described here
  * is a more explicit and somewhat revised version of the process postulated
    by Collins and Quillian (1972b), with
  * additions to encompass the results of Holyoak and Glass (1975)
8. In order to decide whether or not a concept matches another concept,
   enough evidence must be collected to exceed either a positive or a
   negative criterion
   * evidence consists of various kinds of intersections that are found
   * Evidence from different paths in memory sum together
   * Positive and negative evidence act to cancel each other out
   * Failure to reach either criterion before running out of relevant evidence
     leads to a "don't know" response (Collins+ 1975)
   * This process is essentially the Bayesian decision model
     * common in the reaction time literature (e.g. Fitts, 1966; Stone, 1960)
 * types of paths listed in Table 1 and described below in Assumptions 9-13

* TABLE I, Types of paths that constitute positive or negative evidence
   * Positive evidence
     * Superordinate connection
     * Property comparison, matching property
     * Wittgenstein strategy, matching property
   * Negative evidence
     * Negative superordinate connection
     * Property comparison, distinguishing property
     * Wittgenstein strategy, distinguishing property
     * Mutually exclusive subordinates
     * Counterexamples

9. If the memory search finds that there is a superordinate (or a negative
   superordinate) [path] from X to Y, that fact alone can push the decision
   over the positive (or negative) criterion
   * Superordinate links act like highly criterial property links
10. If the memory search finds properties on which X and Y [resp. mis]match
    (i.e., common properties), this is positive [resp. positive] evidence
    proportional, to the criteriality of the property for Y
    * asymmetry in the weighing of positive and negative evidence in a
      property comparison (Collins & Quillian, 1972b)
    * mismatch on just one fairly criterial property can lead to a negative
        decision, whereas
      * most of the highly criterial properties must match in order to reach a
        positive decision
11. Wittgenstein strategy is a variant of the property comparison strategy
  * to decide whether something is a game (for example, frisbee), a person
    compares it to similar instances that are known to be games
  * matching properties count just as much toward a positive decision as
    distinguishing properties count toward a negative decision
12. mutually exclusive subordinates strategy
  * if two concepts have a common superordinate with mutually exclusive links
    into the common superordinate, then this constitutes strong negative
    evidence, almost comparable to a negative superordinate link
  * was necessary for programming a computer to answer questions (Collins+ 1975)
  * Holyoak and Glass (1975) argue that this strategy accounts for some of
    their _reaction time_ data (they call it a contradiction)
  * lacking specific information to the contrary,
    people may make a default assumption of mutual exclusivity
    when two concepts have a common superordinate
13. Counterexamples also can be used as negative evidence. This strategy
    * derives from Holyoak and Glass (1975), who argue that statements of the
    * e.g. "All birds are canaries" are disconfirmed by finding e.g. a "robin."
    * If the question is of the form "Is X a Y?" and
      there is a superordinate link from Y to X
      Z that also has X as superordinate and is mutually exclusive from Y
      This is conclusive evidence that X is not always a Y
* there are many other kinds of evidence people use for answering more
  complicated questions (Collins+ 1975)

# Recent experiments p9

* how the theory deals with some different kinds of recent experiments
* production experiments by Loftus p9
* Juola and Atkinson's (1971) multiple-category experiment; p13
* the Conrad (1972) sentence-verification experiment; p15
* several categorization experiments
  on the effects of semantic relatedness and typicality p17

## Production Experiments of Loftus

* Freedman & Loftus, 1971; Loftus, 1973a, 1973b, Note 2
* in Freedman and Loftus (1971), subjects had to produce an instance of a
  category that began with a given letter or was characterized by a given
  adjective
* Recently Loftus (Note 2) has found two different ways in which presenting a
  letter acts differently from presenting an adjective
* The second result that shows up the difference between adjectives and
  letters was predicted by Loftus from the dictionary-network model
* priming
  * Loftus has also run a series of experiments in which
    subjects were asked to produce a member of a category and
    a short time later asked to produce a different member of that category
    (Loftus, 1973a; Loftus, Senders, & Turkletaub, 1974; Loftus & Loftus, 1974)
  * retrieval is faster if related information has been accessed a short time
    previously (Meyer, 1973; Meyer & Schvaneveldt, 1971; Schvaneveldt & Meyer,
    1973; Meyer, Schvaneveldt, & Ruddy, Note 3)

## Juola and Atkinson's Study with Multiple Categories

An increase in reaction time with multiple categories
has been found by Juola and Atkinson (1971) in a task where
subjects had to decide whether a stimulus word belonged to one of a variable
number (1-4) of prespecified (target) categories

## Conrad's Study

Using a true-false reaction time technique for sentences (e.g., the task is to
decide whether "A salmon can eat" is true or false), Conrad (1972) found
results which she interpreted as contradictory to Quillian's (1966, 1969)
theory

## Effects of Typicality and Semantic Relatedness in Categorisation Tasks

* (Holyoak & Glass, 1975; Rips+ 1973; Rosch, 1973; Smith+ 1974)
* Rips+ (1973), Rosch (1973), and Smith+ (1974) have shown that
  reaction time in a categorization task corresponds very closely to ratings
  of how _typical_ the instance is of the category
* The way evidence is aggregated in the theory also explains the common finding
  (Collins & Quillian, 1970a, 1972b; Holyoak & Glass, 1975; Rips+ 1974) that
  people are fast to decide that semantically unrelated concepts are different
  (e.g., that a book is not a dog)
* Recently, Holyoak and Glass (1975) have isolated two different cases where
  semantic relatedness or typicality does not produce the usual effect on
  reaction time for negative judgments
  * when the decision depends on what they call a contradiction
  * when the decision depends on a counterexample
  * The importance of these two findings by Holyoak and Glass (1975), in our
    view, is that they demonstrate that different kinds of evidence can be
    involved in making categorization judgments

# Relation of the theory to the model of Smith, Shoben, and Rips P18

* Quillian's (1966, 1969) theory was a forerunner of a number of global
  theories of semantic processing based on network representations
  * Anderson and Bower (1973),
  * Norman and Rumelhart (1975), and
  * Schank (1972)
  * These theorists have made important advances on the Quillian theory
    (especially in the representation of acts and causes) which in no way
    contradict the basic thrust of Quillian's theory. There are some
    differences between these theories and Quillian's
* this paper is to deal with those aspects of semantic processing where the
  model of Smith+ (1974) is the major competitor to Quillian's theory
* Smith+ represents concepts as bundles of semantic features
  * quite clear and explicit
  * agrees quite well with the reaction time data for categorization
    judgments, except for the Holyoak and Glass (1975) results
  * we want to emphasize
    * how it differs from spreading-activation theory
    * its inherent difficulties
* semantic features of two kinds: defining and characteristic features
  * Defining features are those that an instance must have to be a member of
    the concept, and features can be more or less defining
  * Characteristic features are those that are commonly associated with the
    concept, but are not necessary for concept membership
  * In a categorization task, two concepts are compared
    * Stage 1 with respect to _all their features_, both characteristic and
      defining. If the match is above a positive criterion, the subject
      answers "yes"; if it is below a negative criterion, the subject answers
      "no"; and if it is in-between, the subject makes a second comparison
    * Stage 2 based on _just the defining features_. If the instance has all
      the defining features of the category, the subject says "yes"
* the distinction between defining and characteristic features has the
  inherent difficulty, pointed out through the ages, that there is no feature
  that is absolutely necessary for any category
  * There is for living things a biologists' taxonomy, which categorizes
    objects using properties that are not always those most apparent to the
    layman.  Thus, _there are arbitrary, technical definitions_ that are
    different from the layman's ill-defined concepts, but this is _not true in
    most domains_. There is no technical 'definition of a game, a vehicle, or a
    country that is generally accepted
  * Smith+ recognized that features are more or less defining (or criterial),
    but they were forced into making the artificial distinction between
    defining and characteristic in order _to have a two-stage model_ Still, the
    model could be revised to work without the two stages and make essentially
    the same reaction time predictions
* they exclude the use of superordinate links
  * The decision that a `wren` [ökörszem] is not a `sparrow` would be made
    because they are mutually exclusive kinds of birds (See assumption 12)
    They are both small songbirds, and it is hard to believe that many people
    know what the defining features of a sparrow are that a wren does not have
    The fact that there are cases where people must use superordinate
    information to make correct categorization judgments makes it unlikely that
    they do not use such information in other cases
* the results of the Loftus (1973b) categorization experiment described earlier
  do not fit the Smith+ model very well. If a person is merely comparing
  features between the instance and the category, then it should not matter
  whether the instance or category is presented first. It is the asymmetry in
  the superordinate connections that predicts the _asymmetry_ Loftus found
* One experiment that might show difficulties with the Smith+ (1974) model is a
  categorization task
  * of birds and animals on the one hand, and mammals and animals
  * both Collins and Quillian (Note 4) and Rips+ (1973) report
    * faster at deciding that bird names are in the category "bird" than in
      the category "animal," whereas they are
    * slower at deciding that mammal names are in the category "mammal" than
      in the category "animal."
    * Collins and Quillian argue that this is the way people learn the
      superordinates: that pigeons are birds and lions are animals
* people have _incomplete knowledge_ about the world (see Collins+ 1975),
  * often do not have stored particular superordinate links or criterial
    properties
  * Any realistic data base for a computer system will have this same kind
    of incomplete knowledge
  * our strongest criticism of the Smith+ (1974) model is that it breaks
    down _when people lack knowledge about defining features_
* By viewing superordinate links as highly criterial properties, the theory
  becomes a simple Bayesian model. It is only in specifying the particular
  configurations of knowledge that constitute positive or negative evidence for
  the Bayesian process that the theory becomes complicated. The difference
  between the two theories is that the Smith+ model allows only one kind of
  evidence (matching or mismatching features), whereas the theory presented
  here allows other kinds of evidence as well. Thus the theory encompasses a
  revised version of the Smith+ model as a special case of a more general
  procedure

# Conclusion

* We have extended Quillian's spreadingactivation theory of semantic processing
in order to deal with a number of experiments that have been performed on
* The result is a
  * fairly complicated theory with enough generality to apply to the expers
  * can also be considered as a prescription for building human semantic
    processing in a computer, though at that level
    * many details are omitted about decision strategies for different
      judgments that arise in language processing (see Carbonell & Collins,
      1973; Collins+ 1975; Quillian, 1969).  We would argue that
    * the adequacy of a psychological theory should no longer be measured
      solely by its ability to predict experimental data
    * theory [should] produce the behavior that it purports to explain
