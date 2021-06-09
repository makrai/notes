Developing a French FrameNet: Methodology and First results
M Candito, P Amsili, L Barque, F Benamara, G de Chalendar, M Djemaa, P Haas,
  R Huyghe, Y Yannick Mathieu, P Muller, B Sagot, L Vieu
lrec 2014

# Invited talk at TLT 2016

* The Asfalda project aims to develop a French
  * corpus with frame-based semantic annotations and automatic
  * tools for shallow semantic analysis
* We present the first part of the project:
* focusing on a set of notional domains, we delimited a subset of English
  frames, adapted them to French data when necessary, and developed the
  corresponding French lexicon. We believe that working domain by domain helped
  us to enforce the coherence of the resulting resource, and also has the
  advantage that, though the number of frames is limited (around a hundred), we
  obtain full coverage within a given domain

# 1 Introduction

* resources built within ASFALDA will consist in a French
  * lexicon in which lexical units are associated to FrameNet frames, and a
  * semantic annotation [of] French treebanks (the
    * French Treebank (Abeillé and Barrier, 2004) and the
    * Sequoia treebank (Candito and Seddah, 2012))
* project also aims at investigating new models for frame-based semantic anal
* original FrameNet project 2 provides a
  * structured set of prototypical situations, called frames, along with a
  * semantic characterization of the participants (called frame elements, FEs).
  * development was carried along annotation of [examples] from the BNC. While
* [compared to] other English semantic resources
  * (such as PropBank (Palmer et al., 2005) or VerbNet (Schuler, 2005))
    * also provide semantic classes and/or semantic roles for predicate arguments,
  * FrameNet [has] more semantic orientation, which is crucial for portability
    to other languages
    * generalization both over
      * syntactic variation (e.g. diathesis alternation) but also
      * lexical variation (like VerbNet but unlike PropBank),
        grouping together lexical units of various categories, on the basis of
        criteria that are not primarily syntactic (unlike VerbNet).
* FrameNet structure [ported] to other languages (Boas, 2009) such as
  * Spanish (Subirats-Rüggeberg and Petruck, 2003)
  * Japanese (Ohara et al., 2004)
  * German (Aljoscha et al., 2009) or
  * Swedish (Friberg Heppin and Toporowska Gronostaj, 2012) (among others).
* corpus annotations have also proved largely portable:
  * Padó (2007) found a high degree of parallelism of the annotations
    for the English/German and the English/French pairs
* building on previous work that automatically projects [FrameNet] to French
  (Padó, 2007; Mouton et al., 2010)

# 2 General Strategy

* Two main strategies have been proposed in the past for FrameNet developments:
  * frame-by-frame strategy, that
    enforces coherence of annotations within a frame, and a
    * prevalent within FrameNetrelated projects,
    * account for the full lexical diversity available to a frame
  * lemma-by-lemma strategy that provides annotations
    reflecting the full ambiguity of a given lemma within the target corpus, a
    * key aspect for the usability of the resource as training data
    * characteristic of the German FrameNet, and also partly adopted by the
      Japanese FrameNet.
* senses ...  with no existing frame in the English FrameNet database,
  including rarer senses or cases in which the lemma is part of [an MWE]
  (Aljoscha et al., 2009)
  * the SALSA project proposed ... creating sense-specific proto-frames,
    without lexical generalization nor semantic relations to other frames
* hybrid strategy, phases
  1. specific notional domains.
  2. In a second phase (not started yet), we will perform
  exhaustive annotation for some lexical units (highly
  frequent verbs, leaving aside the top n most frequent
  verbs, to avoid auxiliaries and modals).
