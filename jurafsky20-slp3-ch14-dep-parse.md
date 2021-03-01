# 14 Dependency Parsing
in Daniel Jurafsky & James H. Martin
Speech and Language Processing (3rd ed. draft) December 30, 2020 draft

* quite important in contemporary speech and language processing systems. In
* syntactic structure of a sentence is described solely in terms of
  * the words (or lemmas) in a sentence and an associated
  * set of directed binary grammatical relations that hold among the words
    * labeled arcs from heads to dependents. We call this a typed dependency
    * labels are drawn from a fixed inventory of grammatical relations. It also
  * root node explicitly marks the root of the tree, the head of the sentence
* comparison to phrase-structure analysis
  * no nodes corresponding to phrasal constituents or lexical categories in the
  * e.g. the arguments to the verb _prefer_ are directly linked to it
  * morning and Denver, modifiers of flight, are linked to it directly
* major advantage:
  * languages that are morphologically and have a relatively free word order
    * e.g. Czech can be much more flexible than in English; a grammatical object
      might occur before or after a location adverbial
  * head-dependent relations provide an approximation to the semantic relships
    * useful for many applications such as
      coreference resolution, question answering and information extraction
* organizatoin
  * inventory of relations used in dependency parsing, as well as
  * the formal basis for these dependency structures. We’ll then move on to
  * algorithms that are used to automatically produce these structures. Finally,
  * how to evaluate dependency parsers and language processing applications

## 14.1 Dependency Relations

* traditional linguistic notion of grammatical relation provides the basis
  * arguments to these relations consist of a head and a dependent
  * We’ve already discussed the notion of heads in Chapter 12 and Appendix C
    in the context of constituent structures
* head word of a constituent was the central organizing word of a larger
  * The remaining words in the constituent are either direct, or indirect,
    dependents of their head. In dependency-based approaches, the head-dependent
* classify the kinds of grammatical relations, or grammatical function, in terms
  of the role that the dependent plays with respect to its head. Familiar
  * e.g. subject, direct object and indirect object
  * In English these strongly correlate with position in a sentence and
    constituent type
  * in other languages the information encoded directly in these grammatical
    relations is critical since phrase-based constituents provides little help
* relations that go well beyond the familiar notions of subject and object
  * considerable variation from theory to theory, there is enough commonality
* Universal Dependencies project (Nivre+ 2016)
  * computationally useful standard: the
  * provides an inventory of dependency relations that are linguistically
    motivated, computationally useful, and cross-linguistically applicable
  * Fig. 14.2 shows a subset of the relations from this effort
  * Fig. 14.3 provides some example sentences illustrating selected relations
  * all of the relations is beyond the scope of this chapter, but the
  * core set of frequently used relations can be broken into two sets:
    * clausal relations that describe syntactic roles with respect to a pred
    * modifier relations categorize the ways that words can modify their heads
  * e.g. (14.2)

## 14.2 Dependency Formalisms

* directed graphs. That is, structures G = (V, A) consisting of a set of
  * will assume that the set of vertices, V , corresponds exactly to the words
    * might also correspond to punctuation, or when dealing with
    * in morphologically complex languages the set of vertices might consist of
      stems and affixes.  The set of
  * arcs, A, captures the head-dependent and grammatical function relationships
    * constraints on these dependency structures are specific to the underlying
      grammatical theory or formalism
    * e.g. structures must be connected, have a designated root node, and be
      acyclic or planar
    * Of most relevance to the parsing approaches discussed in this chapter is
      the common, computationally-motivated, restriction to rooted trees. That
  1. There is a single designated root node that has no incoming arcs
  2. With the exception of the root node, each vertex has exactly one incoming
  3. There is a unique path from the root node to each vertex in V .  Taken
  * these constraints ensure that each word has a single head, that the
    dependency structure is connected, and that there is a single root node from
    which one can follow a unique directed path to each of the words

### 14.2.1 Projectivity

* derived from the order of the words in the input
  * An arc from a head to a dependent is said to be projective if
    there is a path from the head to every word that lies between the head and
    the dependent in the sentence. A dependency
  * tree is then said to be projective if all the arcs are projective. All the
  * There are, however constructions which lead to non-projective trees,
    particularly in languages with a relatively flexible word order
  * e.g.  _JetBlue canceled our flight this morning which was already late_
    * the arc from _flight_ to its modifier _was_ is non-projective since
      there is no path from flight to the intervening words _this_ and _morning_
  * A dependency tree is projective if it can be drawn with no crossing edges
    Here there is no way to link flight to its dependent was without crossing
    the arc that links morning to its head
* Our concern with projectivity arises from two related issues. First, the
  * most widely used English dependency treebanks were automatically derived
    from phrase-structure treebanks through the use of head-finding rules
    (Chapter 12). The trees generated in such a fashion are guaranteed to be
    projective since they’re generated from context-free grammars
  * computational limitations to the most widely used families of parsing algos
    * transition-based approaches discussed in Section 14.4 can only produce
      projective trees, hence any sentences with non-projective structures will
    * more flexible graph-based parsing approach described in Section 14.5

## 14.3 Dependency Treebanks

* treebanks play a critical role in the development and evaluation of dependency
* approaches to those discussed in Chapter 12 — having
  * human annotators directly generate dependency structures for a given corpus,
  * automatic parsers to provide an initial parse and then hand correct those
  * translate existing constituent-based treebanks into dependency trees through
    the use of head rules
* For the most part, directly annotated dependency treebanks have been created
  for morphologically rich languages such as Czech, Hindi and Finnish
  * Prague Dependency Treebank (Bejček+ 2013) for Czech being the most well-knon
* English: largely extracted from existing resources
  * Wall Street Journal sections of the Penn Treebank (Marcus+ 1993).  The more
  * OntoNotes project (Hovy+ 2006, Weischedel+ 2011) extends this approach going
    * include conversational telephone speech, weblogs, usenet newsgroups,
      broadcasts, and talk shows in English, Chinese and Arabic
* translation from constituent to dependency structures has two sub-tasks:
  * arc + label
  * The first task relies heavily on the use of head rules discussed in Ch 12
    first developed for use in lexicalized probabilistic parsers (Magerman 1994,
    Collins 1999, Collins 2003)
  * a simple and effective algorithm from Xia and Palmer (2001)
    1. Mark the head child of each node in a phrase structure, using the
       appropriate head rules
    2. In the dependency structure, make the head of each non-head child depend
       on the head of the head-child
* a phrase-structure parse may contain additional information in the form of
  grammatical relations and function tags, as in the case of the Penn Treebank,
* e.g When applied to the parse tree in Fig. 14.4, this algorithm would produce
  the dependency structure in example 14.4
* shortcoming of these extraction methods is that they are limited by
  * fail to integrate morphological information with the phrase-structure trees,
  * inability to easily represent non-projective structures, and the
  * lack of internal structure to most noun-phrases, as reflected in the
    generally flat rules used in most treebank grammars
  * For these reasons, outside of English, most dependency treebanks are
    developed directly using human annotators

## 14.4 Transition-Based Dependency Parsing

* a stack-based approach called shift-reduce parsing
  * originally for analyzing programming languages (Aho and Ullman, 1972). This
  * simple, elegant, and effective
  * a context-free grammar, a stack, and a list of tokens to be parsed
  * Input tokens are successively shifted onto the stack and
    the top two elements of the stack are matched against
    the right-hand side of the rules in the grammar;
    when a match is found the matched elements are replaced on the stack
    (reduced) by the non-terminal from the left-hand side of the rule
* adapting this approach for dependency parsing, we
  * forgo [lemond] the explicit use of a grammar and
  * alter the reduce operation so that
    it introduces a dependency relation between a word and its head
    * More specifically, the reduce action is replaced with two possible actions
      * assert a head-dependent relation between the word at the top of the
        stack and the word below it, or vice versa
  * Figure 14.5 illustrates the basic operation of such a parser
* configurations
  * A key element in transition-based parsing is the notion of a configuration
    which consists of a stack, an input buffer of words, or tokens, and a set of
    relations representing a dependency tree. Given this framework, the
    * parsing process consists of a sequence of transitions through the space of
      possible configurations
  * parser searches through a space of configurations for a sequence of
    transitions that leads from a start state to a desired goal state
* In the standard approach to transition-based parsing:
  a single pass over the input from left to right (Covington, 2001)
  * Assign the current word as the head of some previously seen word,
  * Assign some previously seen word as the head of the current word,
  * Or postpone doing anything with the current word, adding it to a store for
    later processing
* three transition operators operate on the top two elements of the stack:
  * leftArc: Assert a head-dependent relation
    between the word at the top of the stack and the word directly beneath it;
    remove the lower word from the stack
  * rightArc: Assert a head-dependent relation
    between the second word on the stack and the word at the top; remove the
    word at the top of the stack;
  * SHIFT: move the word from the front of the input buffer to the stack.  arc standard
* arc standard approach to transition-based parsing (Covington 2001, Nivre 2003)
* two notable characteristics to this approach: the
  * operators only assert relations between elements at the top of the stack,
  * once an element has been assigned its head it is removed from the stack and
    is not available for further processing
* preconditions to the operators
* oracle provides the correct transition operator to use given the configuration
* a straightforward greedy algorithm — the oracle provides a single choice at
  * no backtracking is employed, and a single parse is returned in the end
* there may be more than one path that leads to the same result,
  and due to ambiguity, there may be other transition sequences that lead to
  different valid parses
* Section 14.4.2 will introduce several techniques that allow transition-based
  approaches to explore the search space more fully
* To produce labels, we can parameterize the leftArc and rightArc operators with
  dependency labels, as in leftArc ( NSUBJ ) or rightArc ( DOBJ )
* makes the job of the oracle more difficult since it now has a much larger set
  of operators from which to choose

### 14.4.1 Creating an Oracle

* supervised machine learning methods to train classifiers that play the role of
* a function that maps from configurations to transition operators
* training data will be representative treebanks containing dependency trees
* features will consist of many of the same features we encountered in
  Chapter 8 for part-of-speech tagging, as well as those used in
  Appendix C for statistical parsing models

#### Generating Training Data

* The restriction on selecting the rightArc operator is needed to ensure that a
  word is not popped from the stack, and thus lost to further processing, before
  all its dependents have been assigned to it

#### Features

* features vary by language, genre, and the kind of classifier being employed
  * morphosyntactic features such as case marking on subjects or direct objects
  * the basic features that we have already seen with part-of-speech tagging and
    partial parsing have proven to be useful in training dependency parsers
  * Word forms, lemmas and parts of speech are all powerful features, as are the
    head, and dependency relation to the head
* to avoid sparsity and encourage generalization, it is best to focus the on the
  top levels of the stack, the words near the front of the buffer, and the
  dependency relations already associated with any of those elements
* feature template: combining simple features, with locations in a configuration
* some of these features make use of dynamic features — features such as head
  words and dependency relations that have been predicted at earlier steps in

#### Learning

* Over the years, the dominant approaches have been
  multinomial logistic regression and support vector machines, both of which can
  * effective use of large numbers of sparse features of the kind described in
* More recently, neural network, or deep learning, approaches of the kind
  described in Chapter 8 have been applied successfully
  (Chen and Manning, 2014)
  * eliminate the need for complex, hand-crafted features and have been

### 14.4.2 Advanced Methods in Transition-Based Parsing

#### Alternative Transition Systems

* arc eager transition system: assert rightward relations much sooner
  than in the arc standard approach
  * and still allow the dependent to serve as the head for later dependents
* e.g. Book the flight through Houston
  * Consider the dependency relation between book and flight in this analysis
* arc-standard approach would assert this relation at Step 8, despite the fact
  * due to the presence of the postnominal modifier _through Houston_. In an
  * dependents are removed from the stack when they are assigned their heads
  * If flight had been assigned book as its head in Step 4, it would no longer
    be available to serve as the head of Houston
* in practice the longer a word has to wait to get assigned its head the more
  opportunities there are for something to go awry. The arc-eager system
  addresses this issue by allowing words to be attached to their heads as early
  as possible, before all the subsequent words dependent on them have been seen
* changes to the leftArc and rightArc operators and the addition of a new REDUCE
  * leftArc : Assert a head-dependent relation between the word at the front
    of the input buffer and the word at the top of the stack; pop the stack
  * rightArc : Assert a head-dependent relation between the word on the top of
    the stack and the word at front of the input buffer; shift the word at the
    front of the input buffer to the stack
  * SHIFT : Remove the word from the front of the input buffer and push it onto
    the stack
  * REDUCE : Pop the stack
* flexibility of the overall transition-based approach. We were able to swap in
  * transition systems that address different aspects of syntax and semantics
    * assigning part of speech tags (Choi and Palmer, 2011a), allowing the
    * non-projective dependency structures (Nivre, 2009),
    * assigning semantic roles (Choi and Palmer, 2011b), and
    * parsing texts containing multiple languages (Bhat+ 2017)

#### Beam Search

## 14.5 Graph-Based Dependency Parsing

## 14.6 Evaluation

## 14.7 Summary
