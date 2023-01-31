SemEval 2014 Task: Broad-Coverage Semantic Dependency Parsing
Stephan Oepen, Marco Kuhlmann, Yusuke Miyao, Daniel Zeman, Dan Flickinger, Jan
  Hajič, Angelina Ivanova, and Yi Zhang

# Abstract

* Task 8 at SemEval 2014: Broad-Coverage Semantic Dependency Parsing (SDP) as
  the problem of recovering sentence-internal predicate–argument rels
  for all content words
* organization
  * we position the problem in comparison to other sub-tasks in comp lang anal
  * target representations used, reflect on
    * high-level commonalities and differences between these representations,
  * task setup,
  * participating systems, and main results

# 1 Background and Motivation

* predominant data structure in dependency parsing to date are trees, in the
  formal sense that every node in the dependency graph is reachable from a
  distinguished root node by exactly one directed path
* in semantic analysis, where a node will often be the argument of multiple
  predicates (ie have more than one incoming arc), and it will
  * often desirable to leave nodes corresponding to semantically vacuous word
    classes unattached
* several independent annotations of sentence meaning over the venerable Wall
  Street Journal (WSJ) text of the Penn Treebank (PTB; Marcus+ 1993)
  * constitute parallel semantic annotations over the same common text, but to
  * they have not been related to each other and, in fact, have hardly been
  * not applied for training and testing of data-driven parsers. In this task,
  * our tasks uses three such target representations for bi-lexical sem dep
* _A similar technique is almost impossible to apply to other crops, such as
  cotton, soybeans, and rice._
  * Semantically, _technique_ arguably is dependent on the determiner (the
    quantificational locus), the modifier _similar_, and the predicate _apply_.
  * Conversely, the predicative copula, infinitival _to_, and the vacuous
    preposition marking the deep object of _apply_
    can be argued to not have a semantic contribution of their own
* [comparison] with Semantic Role Labeling (SRL; Gildea & Jurafsky, 2002)
  * [SRL is] limited to argument identification and labeling for verbal and
    nominal predicates
  * A plethora of semantic phenomena typically remain unanalyzed in SRL
    * eg negation and other scopal embedding, comparatives, possessives,
      various types of modification, and even conjunction—
  * Thus, its target representations are partial to a degree that can prohibit
    semantic downstream processing, for example inference-based techniques
  * our task requires parsers to identify all semantic dependencies,
    ie compute a representation that integrates all content words
  * SDP 2014 task definition does not encompass predicate disambiguation
    * focus on parsing-oriented, ie structural, analysis
    * lacking consensus on sense inventories
* ‘semantic parsing’
  * Kate and Wong (2010) define as “the task of mapping natural language
    sentences into complete formal meaning representations
    which a computer can execute for some domain-specific application.”
  * In contrast SDP target representations aim to be task~ and domain-indep
