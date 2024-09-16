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
  * eg the arguments to the verb _prefer_ are directly linked to it
  * morning and Denver, modifiers of flight, are linked to it directly
* major advantage:
  * languages that are morphologically and have a relatively free word order
    * eg Czech can be much more flexible than in English:
      a grammatical object might occur before or after a location adverbial
  * head-dependent relations provide an approximation to the semantic relships
    * useful for many applications such as
      coreference resolution, question answering and information extraction
* organization
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
  * eg subject, direct object and indirect object
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
  * eg (14.2)

## 14.2 Dependency Formalisms

* directed graphs. That is, structures G = (V, A) consisting of a set of
  * will assume that the set of vertices, V , corresponds exactly to the words
    * might also correspond to punctuation, or when dealing with
    * in morphologically complex languages the set of vertices might consist of
      stems and affixes.  The set of
  * arcs, A, captures the head-dependent and grammatical function relationships
    * constraints on these dependency structures are specific to the underlying
      grammatical theory or formalism
    * eg structures must be connected, have a designated root node, and be
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
  * eg  _JetBlue canceled our flight this morning which was already late_
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
  * Prague Dependency Treebank (Bejček+ 2013), Czech is the most well-known
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
* eg When applied to the parse tree in Fig. 14.4, this algorithm would produce
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
* eg Book the flight through Houston
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

* overwhelming evidence arriving later in a sentence
* Beam search: combining a breadth-first search strategy with a heuristic filter
  that prunes the search frontier to stay within a fixed-size beam width
* score the resulting configurations
* base the score for a configuration on its entire history
* we can define the score for a new configuration as the score of its
  predecessor plus the score of the operator used to produce it

## 14.5 Graph-Based Dependency Parsing

* search through the space of possible trees to maximize some score
  . These methods encode the search space as
  * methods drawn from graph theory to search the space for optimal solutions
    * More formally, given a sentence S we’re looking for the best dependency
      tree in G s , the space of all possible trees for that sentence, that
      maximizes some score
* score for a tree can be viewed as a function of the scores of the parts of the
  * this section is on edge-factored approaches where the
    score for a tree is based on the scores of the edges that comprise the tree
* motivations for the use of graph-based methods. First, unlike transition-based
  * non-projective trees.  Although projectivity is
    * not significant for English, but definitely a problem for many languages
  * accuracy, particularly with respect to longer dependencies.  Empirically,
    * accuracy of transition-based methods declines significantly with the dist
      (McDonald and Nivre, 2011)
    * Graph-based methods avoid this difficulty by scoring entire trees, rather
* organization
  * a widely-studied approach based on the use of a maximum spanning tree (MST)
    algorithm for weighted, directed graphs. We then discuss
  * features that are typically used to score trees, as well as the
  * methods used to train the scoring models

### 14.5.1 Parsing

* The approach described here uses an efficient greedy algorithm to search for
  optimal spanning trees in directed graphs. Given an input sentence, it
* begins with a fully-connected, weighted, directed graph where the vertices are
  * additional ROOT node is included with outgoing edges directed at all of the
  * weights provided by a model generated from training data
  * maximum spanning tree represents the preferred dependency parse for the
  * we’ll focus here on unlabeled dependency parsing. Graph-based approaches to
    labeled parsing are discussed in Section 14.5.3
* two intuitions about directed graphs and their spanning trees. The first
  * every connected component of a spanning tree will also have one incoming edge
  * it is the relative weights of the edges entering each vertex that matters
* Chu and Liu (1965) and Edmonds (1967) independently developed an approach
  * begins with greedy selection and
    follows with an elegant recursive cleanup phase that eliminates cycles
  * The first step: For each vertex in the graph, an incoming edge (representing
    a possible head assignment) with the highest score is chosen. If the
  * cleanup phase begins by
    * adjusting all the weights in the graph by subtracting the score of the
      maximum edge entering each vertex from the score of all the edges entering
      that vertex
    * so that the weight of the edges in the cycle have no bearing on the weight
      of any of the possible spanning trees: a weight of zero for all of the
      edges selected during the greedy selection phase,
      including all of the edges involved in the cycle
* selecting a cycle and collapsing it into a single new node
* Now, if we knew recursively the maximum spanning tree of this new graph, we
* The edge of the maximum spanning tree directed towards the vertex representing
  the collapsed cycle tells us which edge to delete to eliminate the cycle
* When each recursion completes we expand the collapsed vertex, restoring all
  the vertices and edges from the cycle with the exception of the single edge to
  be deleted
* this version of the CLE algorithm runs in O(mn) time, where
  m is the number of edges and n is the number of nodes. Since this particular
  * algorithm begins by constructing a fully connected graph m = n^2 yielding a
  running time of O(n^3)
  * Gabow+ (1986): a more efficient imp  with a running time of O(m + nlogn)

### 14.5.2 Features and Training

* score for the tree = sum of the scores of the edges that comprise the tree.  X
* edge score can, in turn, = weighted sum of features extracted from it
* features used to train edge-factored models mirror those used in transition-b
  * both capture information about the relationship between heads and their deps
  * Wordforms, lemmas, and parts of speech of the headword and its dependent
  * Corresponding features derived from the contexts before, after and between
  * Word embeddings
  * The dependency relation itself
  * The direction of the relation (to the right or left)
  * The distance from the head to the dependent.  As with transition-based
  * pre-selected combinations of these features are often used as well
* weights
  * we seek to train a model that assigns higher scores to correct trees
  * inference-based learning combined with the perceptron learning rule. In this
    * parse a sentence (i.e, perform inference) from the training set using some
      initially random set of initial weights. If the resulting parse matches
    * we find those features in the incorrect parse
      that are not present in the reference parse and we
      lower their weights by a small amount based on the learning rate. We do
    * incrementally for each training sentence until the weights converge
* SOTA in multilingual parsing is based on RNNs (Zeman+ 2017, Dozat+ 2017)

### 14.5.3 Advanced Issues in Graph-Based Parsing

## 14.6 Evaluation

* labeled and unlabeled attachment accuracy (LAS and UAS)
* accuracy is the percentage of words that are assigned the correct head with
  the correct relation
* label accuracy score (LS), the percentage of tokens with correct labels,
  ignoring where the relations are coming from.  As an example, consider the
  reference parse and system parse for the following example shown in Fig
* how well a system is performing on a particular kind of dependency relation,
  for example NSUBJ , across a development corpus. Here we can make use of the
  notions of precision and recall introduced in Chapter 8, measuring the
* confusion matrix to keep track of how often each dependency type was confused

## 14.7 Summary

## Bibliographical and Historical Notes

* dependency-based approach to grammar is much older than phrase~ or constituent
* ancient Greek and Indian linguistic traditions. Contemporary
* theories draw heavily on the work of Tesnière (1959). The most influential
* frameworks include
  Meaning-Text Theory (MTT; Mel’c̆uk, 1988),
  Word Grammar (Hudson, 1984),
  Functional Generative Description (FDG; Sgall+ 1986). These frameworks
* differ along a number of dimensions including the degree and manner in which
  they deal with morphological, syntactic, semantic and pragmatic factors, their
  use of multiple layers of representation, and the
  set of relations used to categorize dependency relations
* Automatic parsing using dependency grammars was first introduced into compu-
  * early work on machine translation at the RAND Corporation led by David Hays
  * closely paralleled work on constituent parsing and made explicit use of
    grammars to guide the parsing process
* intermittent [időszakos] over the following decades
  * Notable implementations for English include
    Link Grammar (Sleator and Temperley, 1993),
    Constraint Grammar (Karlsson+ 1995), and MINIPAR (Lin, 2003)
* major resurgence in the late 1990’s with the appearance of
  large dependency-based treebanks and the associated
  advent of data driven approaches described in this chapter
  * Eisner (1996) developed an efficient dynamic programming approach
    based on bilexical grammars derived from the Penn Treebank
  * Covington (2001): deterministic word by word approach underlying current
    transition-based approaches
  * Yamada and Matsumoto (2003) and Kudo and Matsumoto (2002) introduced both
    the shift-reduce paradigm and the use of supervised machine learning in the
    form of support vector machines to dependency parsing
* Nivre (2003) defined the modern, deterministic, transition-based approach to
  * with his colleagues formalized and analyzed the performance of numerous
    transition systems, training methods, and methods for dealing with
    non-projective language Nivre and Scholz 2004, Nivre 2006, Nivre and Nilsson
    2005, Nivre+ 2007, Nivre 2007
* The graph-based maximum spanning tree approach McDonald+ 2005, McDonald+ 2005)
* data for training and evaluating dependency English parsers came from the WSJ
  Penn Treebank (Marcus+ 1993) described in Chapter 12
* head-finding rules developed for use with probabilistic parsing facilitated
  * extraction of dependency parses from phrase-based ones (Xia and Palmer 2001)
* long-running Prague Dependency Treebank project (Hajič, 1998) is the most
  * directly annotate a corpus with multiple layers of morphological, syntactic
    and semantic information
  * The current PDT 3.0 now contains over 1.5 M tokens (Bejček+ 2013)
* Universal Dependencies (UD; Nivre+ 2016) is a project directed at creating a
  consistent framework for dependency treebank annotation across languages with
  * advancing parser development across the world’s languages. The UD
  * out of several distinct efforts including
    Stanford dependencies (de Marneffe+ 2006 2008 2014),
  * Google’s universal part-of-speech tags (Petrov+ 2012), and the
  * Interset interlingua for morphosyntactic tagsets (Zeman, 2008). Under the
  * treebanks for over 90 languages have been annotated and made available in a
    single consistent format (Nivre+ 2016)
* CoNLL series of shared tasks related to dependency parsing over the years
  (Buchholz and Marsi 2006, Nilsson+ 2007, Surdeanu+ 2008, Hajič+ 2009)
* parser robustness with respect to morphologically rich langs (Seddah+ 2013)
  and social media, texts, and spoken language (Petrov and McDonald, 2012).E
* Choi+ (2015) presents a performance analysis of 10 dependency parsers across a
  range of metrics, as well as DependAble, a robust parser evaluation tool
