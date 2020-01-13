Marie Candito, G Perrier, B Guillaume, C Ribeyre, K Fort, D Seddah, É Clergerie
Deep Syntax Annotation of the Sequoia French Treebank
LREC 2014, Reykjavik, Iceland

# Abstract

* abstracts away from surface syntactic variation and diathesis alternations,
* corpus, named DEEP SEQUOIA , is freely available, and hopefully useful 

# Intro

* making explicit the canonical subcategorization frame of predicates, and
  which linguistic expressions fill it. The deep annotations were added to
  the surface annotations of the Sequoia corpus (Candito and Seddah,
  2012b), following preliminary work by Bonfante et al.  (2011). The resulting
  corpus is freely available 1 .  
* organization
  2. the theoretical characteristics of our Deep Semantic Reprs (DSRs)
  3. Examples taken from the corpus illustrating some of the main difficulties
  4. the methodology we adopted for the annotation of the corpus. We then
  5. compare our work with respect to other deep annotation schemes or corpora

# 2. Deep Syntactic Representations

## 2.1.  Building on the Surface Dependency Scheme of the FTB

* the Sequoia corpus was first annotated using constituency trees, following
  the annotation scheme of the FTB (Abeillé and Barrier, 2004), except that a
  * slightly more specific set of dependency labels was used for oblique
  * only functional compound words (e.g. bien que (’although’)) or
    syntactically irregular compound words are annotated as such (syntactically
    regular compound words are not marked as such, and are represented with
    regular internal structure).
* then automatically converted into projective surface dependencies using the
  * Additional information predicted by the conversion procedure itself
    * some dependency labels, and additional structure for cases in which a
      single constituent includes several heads. Further, 
    * correction in case of wh-extraction (Candito and Seddah 2012a), to
      account for long-distance dependencies, introducing some non-projective
      arcs.
  * DSRs. We made the pragmatic decision of minimizing the changes introduced
    at the deep syntactic level, to concentrate on phenomena not
    representable in surface
    * e.g. we kept the representation of coordinating structures with the first
      conjunct as the head 3 , although it is clearly problematic for the
      representation of shared modifiers.

## 2.2 Linguistic Characteristics

* syntactic alternations or diathesis alternations. In order to 
* capture such regularities without resorting to semantic properties or
  thematic roles but sticking to syntactic generalizations, we use the
* inspired by Relational Grammar (Perlmutter, 1983), 
  * distinction between canonical grammatical function (canonical GF) and final
    grammatical function (final GF), and between canonical subcategorization
    frames (canonical SF) and final subcategorization frames (final SF).
* redistributions to a canonical subcategorization frame
  * e.g. a passive occurrence of a transitive verb

## 2.3 Deep Syntax versus Semantic Representations

* ambiguous lemmas [are] not disambiguated
* polylexical expressions  are not marked as such, and are 
  * idioms, light verb constructions, syntactically regular compounds
  * represented with regular internal syntactic structures
* the surface subject of a raising verb belongs to its canonical SF, although
  it is not a semantic argument of the raising verb.
* grammatical functions, 
  * instead of either semantic roles or argument numbering 
  * coherent with the fact that the lemmas are not disambiguated. 
    Grammatical functions are important clues for (further) disambiguation, and
    e.g. two related senses of parler (’to speak’) in 
      Paul parle italien (Paul speaks italian) and 
      Paul parle de l’Italie (Paul is speaking about Italy): 
    we only make explicit two different canonical subcategorization frames:
      parler(subject=Paul, direct_object=italien) versus 
      parler(subject=Paul, de_object=Italie)
* to obtain argument structures from of our DSRs, it is necessary to
  * disambiguate predicative lemmas, keeping only true semantic arguments
  * associate them with semantic roles or a simple number

# 5. Related Work

* two main theoretical frameworks dominate the dependency syntax landscape
  * Prague Dependency school and the 
    * Prague Dependency treebanks (for Czech, English and Arabic), and the
    * distinguishes between analytical and tectogrammatical levels. While the
    * tectogrammatical: 
      * semantic labels, called functors, such as Actor/Bearer, Addressee,etc.,
      * topic-focus articulation of a sentence, which we do not represent in
  * Meaning Text Theory (MTT, (Melčuk, 1988))
    * the basis of a new Spanish treebank (Mille et al., 2013)
    * AnCora-UPF Treebank (Mille et al., 2013) follows the MTT model with four
      layers: morphological, surface-syntactic, deep-syntactic and semantic.
* Stanford Dependency annotation schemes 
  (De Marneffe et al., 2006; De Marneffe and Manning, 2008)
