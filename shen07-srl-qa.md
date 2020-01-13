Using Semantic Roles to Improve Question Answering
Dan Shen and Mirella Lapata
2007

# Abstract

Shallow semantic parsing, the automatic identification and labeling of
sentential constituents
* Our work ... general framework for answer extraction which 
  * exploits semantic role annotations in the FrameNet paradigm
  * role assignment as an optimization problem in a bipartite graph and 
  * answer extraction as an instance of graph matching. 
  * Experimental results on the TREC datasets ... over state-of-the-art models.

# Intro

* labeling of semantic roles conveyed by sentential constituents
  * refer ... to Carreras and Màrquez (2005) for an overview [of approaches]
* shallow semantic parsing (Gildea and Jurafsky, 2002)
* resources like 
  * FrameNet (Fillmore et al., 2003) and 
    * frames, schematic representations of situations.
    * Semantic roles (or frame elements) are defined for each frame and corre-
      spond to salient entities present in the evoked situation. 
    * Predicates with similar semantics instantiate the same frame
    * surface syntactic realizations of semantic roles, and provides 
    * annotated example sentences
  * PropBank (Palmer et al., 2005),
    * greater coverage
* Question answering (QA) is often cited as an obvious beneficiary of SRL 
  * (Gildea and Jurafsky, 2002; Palmer et al., 2005; Narayanan and Harabagiu,
    2004).
  * little work has been done to [test] this effect (see Section 2 for details)
    and initial results have been mostly inconclusive or negative (Sun et al.,
    2005; Kaisser, 2006). There are at least two good 
    * reasons for these findings
      * trained on declarative sentences will typically have poor performance
        on questions and generally on 
      * out-of-domain data

# 2 Related work

* QA-related tasks ranging from 
  * query expansion, to 
  * axiom-based reasoning (Moldovan et al., 2003)
  * passage scoring (Paranjpe et al., 2003)
  * and answer filtering (Leidner et al., 2004).
* Narayanan and Harabagiu (2004) were the first to stress the importance of
  semantic roles in answering complex questions. Their system identifies
  predicate argument structures by merging semantic role information from
  PropBank and FrameNet.
