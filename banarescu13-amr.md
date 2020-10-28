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
