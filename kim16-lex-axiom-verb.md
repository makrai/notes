High-Fidelity Lexical Axiom Construction from Verb Glosses
Gene Kim and Lenhart Schubert
2016 acl

#1 Introduction

* attempts to transduce informal lexical knowledge from machine readable
  dictionaries into a formally structured form
  (Calzolari, 1984; Chodorow et al., 1985; Harabagiu et al., 1999;
  Moldovan and Rus, 2001; Hobbs, 2008; Allen et al., 2013)

#2 Related work

* extracting lexical information from machine-readable dictionaries. Early
  approaches to this problem focused on surface-level techniques, including
  * hypernym extraction (Calzolari, 1984; Chodorow et al., 1985),
  * pattern matching (Alshawi, 1989; Vossen et al., 1989; Wilks et al., 1989),
  * co-occurrence data extraction (Wilks et al., 1989)
* Some work encodes WordNet glosses into
  * variants of
    * first-order logic (FOL)
      * Harabagiu et al., 1999; Moldovan and Rus, 2001; Hobbs, 2008
    * such as Hobbs Logical Form (HLF) (Hobbs, 1985)
  * OWL-DL
    * OWL Working Group, 2004; Allen et al., 2011; Allen et al., 2013; 
      Orfan and Allen, 2015; Mostafazadeh and Allen, 2015
    * Allen et al. (2013) ... integrates information from a high-level
      ontology with glosses of semantically related clusters of words 
      to concepts corresponding to these words

##Limitations of Logical Representations Used by Previous Approaches

#4 Gloss Axiomatization

* In this section, we describe our approach to semantic parsing and
  axiomatization of WordNet entries. Our approach consists of 
* three major steps:
  1. Argument structure inference (Section 4.1)
    * refines the WordNet sentence frames using the provided examples. Specific
      pronouns associated with argument position are inserted as dummy
      arguments
  2. Semantic parsing of the gloss (Section 4.2)
  3. Axiom construction (Section 4.3)

##Argument Structure Inference

##Semantic Parsing of Glosses

* preprocessing of the glosses is necessary because glosses often omit
  arguments, resulting in an incomplete sentence
* There are also some serious shortcomings to general semantic parsers,
  particularly in handling coordinators and/ or. 
* In this section, we describe the complete semantic parsing process of glosses
  and the details of each step. Throughout our semantic parsing implementation,
  we use the tree-to-tree transduction tool (TTT) (Purtee and Schubert, 2012)

## Axiom Construction

Dummy arguments in the parsed gloss are correlated with the arguments in the
frame using the mapping in Table 1

#6 Experiments

##Semantic Parsing Evaluation

##Inference Evaluation

* manually created verb entailment dataset (Weisman et al., 2012)
* When generating inferences, we find verbs in the consequent of the axiom
  that are not modified by a negation or negating adverb (e.g., nearly, al-
  most, etc.). Such inferences are chained up to three times, or until an
  abstract word is reached (e.g., be, go, etc.), which glosses do not
  sufficiently describe. This blacklist contains 24 abstract words

##Error Analysis

#7 Future Work and Conclusions

* include nouns, adjectives, and adverbs
* may be improved by looking through the hypernym graph and borrowing results
  from parses of parents (generalizations) of words. We can also 
* incorporate techniques from Allen et al.  (2011; 2013) and Mostafazadeh &
  Allen (2015) to integrate results from related sets of glosses. 
* The high-level TRIPS ontology could be used to improve robustness in the face
  of inconsistencies in WordNet and interpretation errors. Also,
* more sophisticated WSD techniques, such as those from the SENSEVAL3 task on
  WSD (Litkowski, 2004)
* argument coherence could be improved 
  using techniques from Mostafazadeh & Allen (Mostafazadeh and Allen, 2015)
