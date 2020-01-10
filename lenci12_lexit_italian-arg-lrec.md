LexIt: A Computational Resource on Italian Argument Structure
Alessandro Lenci, Gabriella Lapesa, Giulia Bonansinga
lrec 2012

#Abstract

* a computational framework for the automatic acquisition and exploration
* verbs, nouns and adjectives,
* available through a web interface at http://sesia.humnet.unipi.it/lexit
* the first large-scale resource for Italian in which
  subcategorization and semantic selection properties are
  characterized fully on distributional ground: in the paper
* we describe both the process of data extraction and the evaluation

#1 Intro

* extraction of
  * subcategorization frames (Korhonen, 2002; Schulte im Walde, 2008),
  * selectional preferences
    (Resnik, 1993; Light and Greiff, 2002; Erk+ 2010)
  * verb classes (Merlo and Stevenson, 2001; Schulte im Walde, 2006;
    Kipper-Schuler+ 2008).  Corpus-based information has been used to
* lexical resources like
  * VALEX for English (Korhonen+ 2006), or
  * LexSchem for French (Messiant+ 2008)
* LexIt
  * the extraction of subcategorization frames is totally unsupervised
  * using co-occurrence statistics of syntactic dependencies
  * we integrate direct and inverse preferences of target predicates in
    subcategorization frames (Erk+ 2010)
  * approach is the same for predicates belonging to different POS
* This paper is structured as follows: in the first section we describe
  1. the process we applied to extract distributional profiles; the second
  2. the LexIt query interface; in the third section we tackle the
  3. evaluation of [the] verb subcategorization frames
  4. ongoing work for the extension of the resource

#2 Building Distributional Profiles

* each target lemma is associated with a distributional profile, an array of
  * a syntactic profile, specifying the syntactic slots (subject,
    complements, modifiers, etc.) and the subcategorization frames with which
    the target predicate cooccurs
  * a semantic profile, composed by
    * the lexical set of the most prototypical fillers
    * the semantic classes characterizing the selectional preferences
* each distributional feature is weighted with corpus frequency and the
  * Local Mutual Information (LMI) score (Evert, 2008). The latter is
    * the verb-SCF joint frequency
      weighted with Pointwise Mutual Information between the verb and the SCF
    * very effective weighting scheme for sparse frequency counts
    * In LexIt, LMI is used to measure the association between
      * verb and subcategorization frames (cf.  section (4.)),
      * frame slots and their lexical fillers,
      * frame slots and semantic classes.  The current version of LexIt
        contains information gathered from
* two different corpora: the
  * La Repubblica (Baroni+ 2004) corpus (ca.  331 millions tokens)
  * the Italian section of Wikipedia (ca. 152 millions of tokens). In the
* pre-processing stage, the source corpora were
  * tokenized, lemmatized and part-of-speech tagged with TANL
  * Dependency parsing was then performed with DeSR
    (Attardi and Dell’Orletta, 2009; Bosco+ 2009)
* Subcategorization Frame (henceforth SCF)
  * complement introduced by _a_ “to” + complement introduced by _da_ “from” is
    labeled as `comp-a#comp-da`
  * argument slots that are
    * common to all predicates are
      * complements: comp-*, with * ranging over prepositions (e.g., comp-a)
      * infinitives: inf-*, with * ranging over prepositions (e.g., inf-di)
      * finite clauses: fin-*, with * ranging over subordinating conjunctions
        (e.g., fin-che, for the finite clause introduced by che, “that”)
    * [only for verbs]
      * subjects (subj) and direct objects (obj)
      * the zero argument construction (labeled as subj#0), corresponding to
        cases in which the only overtly realized argument is the is the
        subject (e.g., Gianni piange, “John cries”)
      * the reflexive pronoun si (e.g., Gianni si lava, “John washes himself”)
      * the predicative complement (cpred label) (e.g. ...  “Ann seems tired”)
* even if modifiers are not represented in the SCF labels, this type of
  information is retained in LexIt in dedicated modifier slots
  * modadv for adverbial modifiers,
  * modver for verbal modifiers
* For target nouns
  * prepositional complements, infinitives and finite clauses
  * zero argument construction, labeled as 0
  * Adjectival modifiers `modadj`
    * treated as the verbal and adverbial ones: they are not [in SCF]
* Adjective-specific argument slots are the following
  * pred, containing the verbs with which the adjective occurs as a predicate
    (i.e., essere “to be”, apparire “to appear”)
  * mod-post, containing the modified noun occurring after the adjective
    (i.e grande uomo, “a great man”)
  * mod-pre, containing the modified noun occurring before the adjective
    (i.e uomo grande, “a big man”)

###2.1.1. The SCF extraction algorithm

4. the statistical salience of each SCFs with the target predicate was
   estimated in terms of LMI (cf. section (4.)). LMI proved to be
   * LMI allowed us to downgrade [frames due to e.g. mistaken PP-attachment]

##Semantic profiles

* Semantic profiles ... are further articulated into lexical sets and
  selectional preferences of predicates over semantic classes of slot fillers
* the lexical set assigned to each slot is composed by its fillers with LMI > 0
  (computed over slot-filler co-occurrences)
* variation of the algorithm described in Schulte im Walde (2006)
* 24 mutually exclusive top-nodes: ANIMAL, ARTIFACT, ACT, ATTRIBUTE, FOOD etc.

#5 Conclusions and Future Work

ongoing work on LexIt includes
* from domain corpora
* argument polysemy and semantic roles
* multiword expressions
* semi-automatic classifications of Italian verbs
