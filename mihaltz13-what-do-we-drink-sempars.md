Márton Miháltz 1 , Bálint Sass 1 , Balázs Indig 2
What Do We Drink? Automatically Extending Hungarian WordNet With Selectional Preference Relations 
Joint Symposium on Semantic Processing, Textual Inference and Structures 2013

#Abstract

* experiment ... aims to extend Hungarian WordNet with new verb-noun relations
  * selectional restrictions for various argument positions. We present an
* algorithm that uses 
  frequency data from a representative corpus and 
  information from a verb frame description database to generate sets of
  semantic classes, represented by WN hypernym sub-networks.
  * intends to cover ... various case inflections or postposition particles
  * The new links in HuWN are assigned corpus-based probabilities.  We present

#1 Introduction

* one of PWN’s weaknesses lies in the low number of cross-part-of-speech
  * existing: morphological (derivational)
* Hungarian WordNet (HuWN) (Miháltz+ 2008) follows the 
  * principles underlying the EuroWordNet and BalkaNet projects 
    (Vossen, 1999, Tufiş+ 2004). It uses 
  * Princeton Wordnet (version 2.0) as its inter-lingual index, meaning that
  * contains localizations of the Balkanet Core Set synsets, plus additional
  * totaling 42,000 synsets.  
* new relations to reflect some intrinsic properties of Hungarian (Kuti+ 2008).

#2 verb argument syntax and semantics and present our goals. 

* Connections between verbs and their nominal arguments show a range of types. On
  * idiomatic, non-compositional verb-argument relationships where a certain
    * lexical element in a certain argument position, 
    * e.g.: hangot ad valaminek, issza a szavát, tenyerén hordoz (“to carry someone
      around on the palm of one's hand”: to pamper someone) etc.  On the 
  * other extreme, there are verbs that impose semantic selectional
    restrictions on their preferred arguments. These arguments belong to (one
    * semantic classes: to eat something (food), to write something (piece of
      writing), to spill something (liquid) etc. These semantic classes can
* The goal of the project described in this paper is to find automatic methods
  in order to extend Hungarian WordNet ... semantic relation: argument classes.
  * two associated properties:
    * morphosyntactic information (the case mark or postposition) identifying
    * strength of the connection, expressed as a probability estimated from the
  * e.g. {to drink}– [case=acc, p=.87]–{liquid} designates
    P(liquid| drink acc) = .87

#Related Work

* relied on WordNet in the detection of selectional preferences 
  * Resnik (1996, 1998)
  * Clark and Weir, (2002, Ye, (2004, Calvo+ (2005) 
* approaches ... focused on Latent Dirichlet Allocation (LDA) methods 
  (Ritter+ 2010, Guo and Diab, 2013, Rink and Harabagiu, 2013)
  , we present an
  approach
  that more closely resembles Resnik (1998). It is applied to resources in
  Hungarian, which has not been researched previously before. Our work does 
* not only focus on the [direct object] but all possible ...  arguments (20+ in
  * as recommended by Brockmann and Lapata (2003).  
* which set of words are preferred as arguments of given verbs 
  (Erk, 2007, Tian+ 2013, Rink and Harabagiu, 2013), in line of the approach
  outlined by Resnik (1998) and also adapted by Guo and Diab (2013), our
* assign[ing] semantic class labels to verb argument positions [ enables us to
  extend] Hungarian WordNet with a new type of verb-noun (verb-argument) rel

#4 Methods

input: frequency list of nouns in a certain argument position of a given verb
returns a weighted list of Word-Net synsets that represent them (classes/genlz)
* should satisfy the following conditions as much as possible: 
  * Coverage [over arguments]
  * Density [few false positives in the synset] 
  * Meaningful generalizations
    * ez több mint az előző kettő együtt?
  *  word sense disambiguation: link the verb only to the sense(s) relevant Our
     algorithm works as follows:
  1. generates all possible [upward] paths from ...  input words 
  2. eliminate those candidate[s] that represent only a single corpus word and
  3. scores the remaining candidates based on two factors: coverage, density
  4. The top `N` candidate synsets are returned based on the ranking. To ensure
* disambiguation of input words: the lower-ranked candidate is eliminated and

New verb-noun relations can be added to the WN network in which the verb
argument positions are semantic classes represented by the winning candidates.
Link probabilities are calculated using the corpus frequencies of the input
words covered by the classes (see Section 6.)

* [frequency data from] the database of the Verb Argument Browser (Sass, 2008),
* possible argument structures [from] the lexical database of the MetaMorpho
  * 33,000 verb frame descriptions (argument structures for various senses) for
    more than 18,000 Hungarian verbs. During the construction of Hungarian
* We used a subset of the MetaMorpho syntactic analyzer’s rules to [refine the
  Mazsola DB] because Mazsola 1) employed a less sophisticated parser, 2) does
  not differentiate between verb complements and optional modifiers (adjuncts).

#5 Results and Discussion

* still working on an evaluation methodology to compare [to] judgments of human 
* we demonstrate our results on some relevant examples.
  * 6 selected verb argument positions (with argument cases indicated) along 
  iszik ACC {folyadék}
  kigombol ACC {ruha}
  olvas ACC {könyv}
  ül SUP {ülőbútor}
  vádol INS {bűncselekmény}
  megold ACC {nehézség}
  * the top 5 semantic classes obtained from the [acc] of the verb iszik  with
  {liquid}
  {beverage, drink, ...}
  {alcohol, alcoholic drink, ...}
  {liquor, spirits, ...}
  {food, nutrient}
    * {liquid} > {beverage, drink} > {alcohol, alcoholic drink}. 
    * which of these do we exactly want to link {drink} (verb) to?

#6 Future work

* It is often the case that binding one of the arguments ... entails special
  selectional preference conditions on another argument position. Examples are
  e.g. ad ACC > hírt ad DEL, húz ACC > hasznot húz ELA . As it is also stressed
* categories in WN do not completely correspond to selectional preferences, 
  * Mechura (2010)
  * “what should a [selectional preference] ontology ... look like 
