SemEval 2014 TaskBroad-Coverage Semantic Dependency Parsing
Stephan Oepen, Marco Kuhlmann, Yusuke Miyao, Daniel Zeman, Dan Flickinger, Jan
  Hajič, Angelina Ivanova, and Yi Zhang

# Abstract

* Task 8 at SemEval 2014 defines Broad-Coverage Semantic Dependency Parsing
  (SDP) as the problem of recovering sentence-internal predicate–argument rela-
  tionships for all content words
* organization
  * we position the problem in comparison to other sub-tasks in computational
    language analysis
  * target representations used, reflect on
    * high-level commonalities and differences between these representations,
  * task setup,
  * participating systems, and main results.

# 1 Background and Motivation

* predominant data structure in dependency parsing to date are trees, in the
  formal sense that every node in the de- pendency graph is reachable from a
  distinguished root node by exactly one directed path.
* in semantic analysis, where a node will often be the argument of multiple
  predicates (i.e.  have more than one incoming arc), and it will often be
  desirable to leave nodes corresponding to se- mantically vacuous word classes
  unattached
* several independent annotations of sentence meaning over the venerable Wall
  Street Journal (WSJ) text of the Penn Treebank (PTB; Marcus et al., 1993).
  These resources constitute parallel semantic annotations over the same common
  text, but to date they have not been related to each other and, in fact, have
  hardly been applied for training and testing of data- driven parsers. In this
  task, we have used three different such target representations for bi-lexical
  semantic dependencies,
* A similar technique is almost impossible to apply to other crops, such as
  cotton, soybeans, and rice.  Semantically, technique arguably is dependent on
  the determiner (the quantificational locus), the mod- ifier similar, and the
  predicate apply. Conversely, the predicative copula, infinitival to, and the
  vac- uous preposition marking the deep object of ap- ply can be argued to not
  have a semantic contri- bution of their own.
* [comparison] with Se- mantic Role Labeling (SRL; Gildea & Jurafsky, 2002)
  * [SRL is] limited to argument identification and labeling for verbal and
    nominal predicates. A plethora of semantic phenomena— for example negation
    and other scopal embedding, comparatives, possessives, various types of
    modi- fication, and even conjunction—typically remain unanalyzed in SRL.
    Thus, its target representations are partial to a degree that can prohibit
    seman- tic downstream processing, for example inference- based techniques.
    In contrast, we require parsers to identify all semantic dependencies, i.e.
    compute a representation that integrates all content words
  * SDP 2014 task defini- tion does not encompass predicate disambiguation
    * focus on parsing-oriented, i.e.  structural, analysis
    * lacking consensus on sense inventories
* ‘semantic parsing’
  * Kate and Wong (2010) define as “the task of mapping natural language
    sentences into complete formal meaning representations which a computer can
    execute for some domain-specific application.”
  * In contrast ... SDP target representations aim to be task- and domain-
    independent,
