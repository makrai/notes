# 14 Dependency Parsing
in Daniel Jurafsky & James H. Martin
Speech and Language Processing (3rd ed. draft) December 30, 2020 draft

* quite important in contemporary speech and language processing systems. In
* syntactic structure of a sentence is described solely in terms of
  * the words (or lemmas) in a sentence and an associated 
  * set of directed binary grammatical relations that hold among the words.
    * labeled arcs from heads to dependents. We call this a typed dependency
    * labels are drawn from a fixed inventory of grammatical relations. It also
  * root node explicitly marks the root of the tree, the head of the sentence 
* comparison to phrase-structure analysis
  * no nodes corresponding to phrasal constituents or lexical categories in the
  * e.g. the arguments to the verb _prefer_ are directly linked to it
  * morning and Denver, modifiers of flight, are linked to it directly
* major advantage: 
  * languages that are morphologically and have a relatively free word order.
    * e.g. Czech can be much more flexible than in English; a grammatical object
      might occur before or after a location adverbial. 
  * head-dependent relations provide an approximation to the semantic relships
    * useful for many applications such as 
      coreference resolution, question answering and information extraction.
* organizatoin
  * inventory of relations used in dependency parsing, as well as 
  * the formal basis for these dependency structures. We’ll then move on to
  * algorithms that are used to automatically produce these structures. Finally,
  * how to evaluate dependency parsers and language processing applications

## 14.1 Dependency Relations

* traditional linguistic notion of grammatical relation provides the basis 
  * arguments to these relations consist of a head and a dependent. 
  * We’ve already discussed the notion of heads in Chapter 12 and Appendix C 
    in the context of constituent structures.
* head word of a constituent was the central organizing word of a larger
  * The remaining words in the constituent are either direct, or indirect,
    dependents of their head. In dependency-based approaches, the head-dependent
* classify the kinds of grammatical relations, or grammatical function, in terms
  of the role that the dependent plays with respect to its head. Familiar
  * e.g. subject, direct object and indirect object
  * In English these strongly correlate with position in a sentence and
    constituent type
  * in other languages the information encoded directly in these grammatical
    relations is critical since phrase-based constituents provides little help.
* relations that go well beyond the familiar notions of subject and object.
  * considerable variation from theory to theory, there is enough commonality
* Universal Dependencies project (Nivre+ 2016) 
  * computationally useful standard: the 
  * provides an inventory of dependency relations that are linguistically
    motivated, computationally useful, and cross-linguistically applicable.
  * Fig. 14.2 shows a subset of the relations from this effort. 
  * Fig. 14.3 provides some example sentences illustrating selected relations.  
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
      acyclic or planar.  
    * Of most relevance to the parsing approaches discussed in this chapter is
      the common, computationally-motivated, restriction to rooted trees. That
  1. There is a single designated root node that has no incoming arcs.
  2. With the exception of the root node, each vertex has exactly one incoming
  3. There is a unique path from the root node to each vertex in V .  Taken
  * these constraints ensure that each word has a single head, that the
    dependency structure is connected, and that there is a single root node from
    which one can follow a unique directed path to each of the words

### 14.2.1 Projectivity

* derived from the order of the words in the input. 
  * An arc from a head to a dependent is said to be projective if 
    there is a path from the head to every word that lies between the head and
    the dependent in the sentence. A dependency 
  * tree is then said to be projective if all the arcs are projective. All the
  * There are, however constructions which lead to non-projective trees,
    particularly in languages with a relatively flexible word order 
  * e.g.  _JetBlue canceled our flight this morning which was already late_
    * the arc from _flight_ to its modifier _was_ is non-projective since 
      there is no path from flight to the intervening words _this_ and _morning_
  * A dependency tree is projective if it can be drawn with no crossing edges.
    Here there is no way to link flight to its dependent was without crossing
    the arc that links morning to its head.
* Our concern with projectivity arises from two related issues. First, the 
  * most widely used English dependency treebanks were automatically derived
    from phrase-structure treebanks through the use of head-finding rules
    (Chapter 12). The trees generated in such a fashion are guaranteed to be
    projective since they’re generated from context-free grammars.  
  * computational limitations to the most widely used families of parsing algos.
    * transition-based approaches discussed in Section 14.4 can only produce
      projective trees, hence any sentences with non-projective structures will
    * more flexible graph-based parsing approach described in Section 14.5.

## 14.3 Dependency Treebanks

* treebanks play a critical role in the development and evaluation of dependency
* approaches to those discussed in Chapter 12 — having 
  * human annotators directly generate dependency structures for a given corpus,
  * automatic parsers to provide an initial parse and then hand correct those
  * translate existing constituent-based treebanks into dependency trees through
    the use of head rules.
* For the most part, directly annotated dependency treebanks have been created
  for morphologically rich languages such as Czech, Hindi and Finnish that lend
  themselves to dependency grammar approaches, with the 
  * Prague Dependency Treebank (Bejček+ 2013) for Czech being the most well-knon
* English: largely extracted from existing resources 
  * Wall Street Journal sections of the Penn Treebank (Marcus+ 1993).  The more
  * OntoNotes project (Hovy+ 2006, Weischedel+ 2011) extends this approach going
    * include conversational telephone speech, weblogs, usenet newsgroups,
      broadcasts, and talk shows in English, Chinese and Arabic.
* translation from constituent to dependency structures has two sub-tasks:
  * arc + label
  * The first task relies heavily on the use of head rules discussed in Ch 12
    first developed for use in lexicalized probabilistic parsers (Magerman 1994,
    Collins 1999, Collins 2003). 
  * a simple and effective algorithm from Xia and Palmer (2001).
    1. Mark the head child of each node in a phrase structure, using the
       appropriate head rules.
    2. In the dependency structure, make the head of each non-head child depend
       on the head of the head-child.  
* a phrase-structure parse may contain additional information in the form of
  grammatical relations and function tags, as in the case of the Penn Treebank,
* e.g When applied to the parse tree in Fig. 14.4, this algorithm would produce
  the dependency structure in example 14.4.  
The primary shortcoming of these extraction methods is that they are limited by
* most impor- tant issues are the 
  * fail to integrate morphological information with the phrase-structure trees,
  * inability to easily represent non-projective structures, and the 
  * lack of internal structure to most noun-phrases, as reflected in the
    generally flat rules used in most treebank grammars. 
  * For these reasons, outside of English, most dependency treebanks are
    developed directly using human annotators.

## 14.4 Transition-Based Dependency Parsing
