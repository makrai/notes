Laura Banarescu, Claire Bonial, Shu Cai, Madalina Georgescu, Kira Griffitt
Abstract Meaning Representation for Sembanking
2013 7th Linguistic Annotation Workshop & Interoperability with Discourse

# Abstract

* in which we are writing down the meanings of thousands of English sentences.
* simple, whole-sentence semantic structures 
* will spur new work in statistical natural language understanding and
  generation, like the Penn Treebank encouraged work on statistical parsing.
* tools associated with AMR

# 1 Intro

* Syntactic treebanks have had tremendous impact on natural language processing.
  * rather than separate tasks and evaluations for base noun identification,
  * smaller tasks are naturally solved as a by-product of whole-sentence parsng,
    and in fact, solved better than when approached in isolation.
* By contrast, semantic annotation today is balkanized. We have separate 
  * annotations for named entities, co-reference, semantic relations, discourse
    connectives, temporal entities, etc. Each annotation has its own associated
  * evaluation, and training data is split across many resources. We lack a sim-
* principles are:
  * rooted, labeled graphs that are 
    easy for people to read, and easy for programs to traverse.
  * abstract away from syntactic idiosyncrasies. We attempt to assign the 
    * same AMR to sentences that have the same basic meaning. For example, the
    * e.g. “he described her as a genius”, “his description of her: genius”, and
      “she was a genius, according to his description” are all assigned the same
  * extensive use of PropBank framesets (Kingsbury and Palmer, 2002; 
    Palmer+ 2005). For example, we represent a phrase like “bond investor” using
    the frame “invest-01”, even though no verbs appear in the phrase.
  * agnostic about how we might want to analyze/generate
  * heavily biased towards English. It is not an Interlingua.  AMR is described
* 50-page annotation guideline. In this paper, we give a high-level description

# 2 AMR Format

* rooted, directed, edgelabeled, leaf-labeled graphs. This is 
  * a completely traditional format, 
  * equivalent to the simplest forms of 
    feature structures (Shieber+ 1986), conjunctions of logical triples,
    directed graphs, and PENMAN inputs (Matthiessen and Bateman, 1991). Figure 1
* we adapt the PENMAN notation for human reading and writing.

# 3 AMR Content

* In neo-Davidsonian fashion (Davidson, 1969), we introduce variables (or graph
  nodes) for entities, events, properties, and states. 
  * Leaves are labeled with concepts, so that “(b / boy)” refers to an in-
    stance (called b) of the concept boy. 
  * Relations link entities, so that “(d / die-01 :location (p / park))” means
    there was a death (d) in the park (p).  
  * When an entity plays multiple roles in a sentence, we employ 
    * re-entrancy in graph notation (nodes with multiple parents) or 
    * variable re-use in PENMAN notation.  
* concepts are either 
  English words (“boy”), PropBank framesets (“want-01”), or special keywords.
  * Keywords include 
    * special entity types (“date-entity”, “world-region”, etc.),
    * quantities (“monetary-quantity”, “distance-quantity”, etc.), and 
    * logical conjunctions (“and”, etc).  AMR uses 
* approximately 100 relations:
  * Frame arguments, following PropBank conventions. :arg0, :arg1, ..., :arg5
  * General semantic relations. :accompanier, :age, :beneficiary, :cause,
    :compared-to, :concession, :condition, :consist-of, :degree, :destination,
    :direction, :domain, :duration, :employed-by, :example, :extent, :frequency,
    :instrument, :li, :location, :manner, :medium, :mod, :mode, :name, :part,
    :path, :polarity, :poss, :purpose, :source, :subevent, :subset, :time,
    :topic, :value.
  * Relations for quantities.  :scale.  :quant, :unit,
  * Relations for date-entities. :day, :month, :year, :weekday, :time,
    :timezone, :quarter, :dayperiod, :season, :year2, :decade, :century,
    :calendar, :era.
  * Relations for lists. :op1, :op2, :op3, :op4, :op5, :op6, :op7, ..., :op10
  * also includes the inverses of all these relations, e.g., :arg0-of,
  * every relation has an associated reification, which is 
    * what we use when we want to modify the relation itself. For example, the
      reification of :location is the concept “be-located-at-91”.  Our set of
* rest of this section, we give examples of how AMR represents 
  various kinds of words, phrases, and sentences. For full documentation, the

## Frame arguments. We make heavy use of PropBank framesets to abstract away

## Co-reference. AMR abstracts away from co-reference gadgets like pronouns,

## Inverse relations. We obtain rooted structures by using inverse relations

## Modals and negation. AMR represents negation logically with :polarity, and it

## Questions. AMR uses the concept “amr-unknown”, in place, to indicate

## Verbs. Nearly every English verb and verb-particle construction we have

## Nouns. We use PropBank verb framesets to represent many nouns as well.

## Adjectives. Various adjectives invoke PropBank framesets.

## Prepositions. Most prepositions simply signal semantic frame elements, and

## Named entities. Any concept in AMR can be modified with a :name relation.

## Copula. Copulas use the :domain relation.

## Reification. Sometimes we want to use an AMR relation as a first-class

# 4 Limitations of AMR 6

# 5 Creating AMRs

# 6 Current AMR Bank 7

# 7 Related Work

# 8 Future Work
