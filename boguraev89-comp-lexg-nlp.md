Computational lexicography for natural language processing
Bran Boguraev and Ted Briscoe eds
1989 Longman Publishing

# Foreword

* attention drawn to lexical resources
* theoretical role and applications in traditional linguistic professions and
  NLP-based systems
* 10--100 Ks of lexical items
* computational lexicography and lexicology as a discipline
  * workshops, confs, etc
* explicit lexical knowledge bases facilitate human use and lexicographic work
* reusability refers to two issues
  1. establish now lexical KBs for a wide variety of researchers & applications
  2. reuse existing lexical resources

# Introduction to computational lexicography for natural language processing
B. Boguraev, E. Briscoe
Pages: 1-40

* dictionaries (or lexicons, as linguists call them)
* no consensus on the information which the lexicon should contain
  or the representation
* number of words
  * Oxford English Dictionary (OED) 250 K
  * considerable divergence between the vocab of
    * Merriam-Webster Seventh Collegiate Dictionary (W7)
    * New York Times newswire
* machine readable versions of published dictionaries
  * potential sources for NLP (Walker and Zampolli, 1988)
* (dis)advantages to the use of MRDs in NLP research
  * considerable tradition
  * much work has already been done
  * produced for human, make inconvenient assumptions
* facets of research in this book
  1. techniques to make information in MRDs accessible for machine use
  2. with this information, evaluate and improve NLP systems and linguistic theories
  * based on the MRD version of Longman Dictionary of Contemporary English
    (LDOCE)
    * uniquely suitable for computational lexicography
* term computational lexicography
  * lexicons derived from MRDs for use by machine will be different from
    conventional dictionaries both in how they organize and represent info
  * use in the development of dictionary DBs for human use
  * OED (Stubbs and Tompa 1984, Stubbs 1986)
  * one dictionary DB for both automated and human use (Byrd 1988)
* rest of this chapter
  * background and motivation
  * representative work in comp lexg which is not discussed
    * MRDs other than LDOCE
    * aims not central to NLP

## NLP p3

* division between lex sem and pragmatic knowledge
  * Lyons (1981) discusses this in great detail
* rules (p5) p6 and lexicon
* POS and subcat info (syntactic feats), chaps 3--5

## Comp lexg p10

* lexicons developed for syntactic and morphological parsing (1982, 1986)
  * different representations
  * application-specific
* next two sections
  * problems in modifying and converting MRDs to database
    1. published dicts rely on the users' linguistic and common sense knowledge
    2. informal presentation, inappropriate linguistic models

### 1.2.1 The nature of a dictionary entry p13

* The entries in most dictionaries distinct 'homographs' of a word form when it
  servers as noun, verb or some other POS
* form
  * headword, spelling, hyphenation, phonetics variants,
  * use (formal/slang), allomorphs, stress
* function
  * distributional behaviour
    * simple word class tag, eg The Collins English Dictionary (Hanks, 1979)
    * elaborate subcat, eg
      * The Oxford Advanced Learner's Dictionary of Current English
        * (Hornby, 1980, OALD)
      * LDOCE
      * The Collins COBUILD English Language Dictionary
        * (Sinclair, 1987, COBUILD)
      * described in chaps 3 and 4
* meaning
  * definition(s), examples, cross references
  * grammar and stylistics of usage
  * synonyms, antonyms, related words
  * picture, etymology
  * derived words, compound terms, idiomatic or common phrases, expressions and
    collocations
  * _subject_ and _box_ codes
    * unique to LDOCE, not printed
    * semantic notions
      * context eg politics, religion, language
      * selectional restriction p14
        * eg _sandwich_ v 1 `__L_X___S` where `X` denotes the preference for
          an abstract or human subject
* experiences with the exploitation of
  * pronunciation, see chap 6
  * grammatical coding system, chaps 3--5
    * the one in LDOCE derives from a specific ling model (chap 3) that is
    * not appropriate for parsing for some NLP systems (chap 4)
    * conflates syntactic and sem info
    * our semi-automatic compilation (chap 5)
* in the lexicon vs rules division, a general-purpose dict DB should be as
  inclusive and theoretically uncommitted as possible
  * LDOCE contains _reissue, reclaim, repay_
* definitions
  * language tends to be of a restricted form
    see chap 8 for an extensive analysis
  * in LDOCE, the vocab is restricted to approximately 2200 words
    * used mainly in their most common sense
    * cut down circularities
    * liberal use of derivational morphology chaps 7 and 8
    * see 1.4 for further discussion of issues of reliability in MRDs
* none of the word reported here makes use of the box and subject codes
* semantic theories p17
  * there are underlying similarities between KR schemes
    * sec 1.3.6 and chaps 7 and 9
  * division between syn, sem and prag
    * word expert parsing (Small, 1980)
  * contextual graph (Sowa and Way, 1986)
  * parallel architectures, connectionist parsing (Cottrell and Small, 1983;
    Waltz and Pollack, 1985; McCelland, Rumelhart+ 1986)
* dictionaries are not encyclopedias

### 1.2.2 Dictionary organization and representation p18

* reliability of the grammar coding system, chaps 3--5
* sense definitions
  * WSD, chap 9
  * genus and differentiae spotting systems, chaps 7 and 8
* a dictionary DB system developed at Cambridge, chap 2

## 1.3 Overview of work with MRDs in NLP p21

### 1.3.1 Word lists

* for spell checkers, MT, indexing, speech

### 1.3.2 Taxonomies

* Cowie (1983) presents a system for analyzing descriptive text into
  hierarchically structured knowledge fragments with the MRD source of LDOCE,
  handle fragments from the definitions
* a ‘folk taxonomy’ of English plant and animal terms
* Amsler (1980, 1981), semantic hierarchy of defining concepts
* chaps 7--9, sec 1.3.6

### 1.3.3 Access/browsing

* chap 2
* network of sense relations p20

### 1.3.4 Speech processing

### 1.3.5 Parsing

* recent grammar formalisms generalise the notion of a non-terminal symbol from
  a simple atom to a set of syntactic features
* chapters 3 and 4 for precise analysis of the codes and comparison between the
  coding systems of LDOCE grammar and OALD

### 1.3.6 Semantic processing

* MRD as a knowledge base;
* continuum between the minimal semantic knowledge implied by the use of a
  particular word (word sense) and the specialised (or expert) knowledge
  relevant to its use in a _domain_ context
  (Wilks, 1977; or more recently, Cater, 1987)
* if most of lexical sem could be derived from a machine-readable source
  * possible representations of lexical semantics
    * decomposition into semantic markers (Katz and Fodor, 1963),
    * formulae constructed from semantic primitives (Wilks, 1977),
    * frame-based structures (Hirst, 1987),
    * logical predicate/function symbols with associated sortal information
      encoded in the form of meaning postulates (Grosz and Stickel, 1983)
  * chap 9, in a preference semantics frame-work
* a common theme in many NLP systems
  * levels
    * narrowly defined language-specific data
    * general real-word knowledge
    * specialised domain and task-dependent knowledge
  * knowledge is represented using a scheme
    * based on frame-like concepts with slot-like role descriptions,
    * organised along a generalisation/specialisation axis
* WSD p22

### 1.3.7 Generation

* McDermott (1981) suggests that no significant insights into natural language
  generation are going to be made until we have a program which has something
  significant to say

## 1.4 Reliability and utility of MRDs

* coverage
  * within a single entry
  * in vocabulary
* reliability
  * does it conform to format rules
  * does it represent the facts faithfully
* LDV
  * the preface to the published version claims that ‘a rigorous set of
    principles was established to ensure that only the most ‘central’ meanings
    of a controlled vocabulary of 2000 words, and only easily understood
    derivatives, were used’ (Procter, 1978:ix)
  * `body` is part of the definitional vocabulary and has as its central (1)
    meaning “the whole of a person”. However, _parliament_ is defined as “a
    law-making body”, utilising the meaning of body(5) “a number of people who
    do something together”
  * derivatives: `container` for the definition of of box2(1),
    even though only the verb contain is considered to be primitive
  * circularity _container_ <=> _box_
  * phrasal verbs
    * made up from verbs and particles taken from the restricted vocabulary

## Organization of the contributions

2. construction of a dictionary DB system for LDOCE
3. analysing and rationalising the grammar code system (by Amsterdam group)
  * comparison with OALD
4. analysis and evaluation of the grammatical code system
  (by Cambridge and Lancaster groups)
  * subcategorisation and semantic information for verbs
  * dative alternation
5. derivation of a new subcategorisation
6. accessing entries via partial phonological information
7. automated parsing of definition fields
  * by a hierarchy of phrasal patterns
8. a taxonomy of sense definitions
  * LINKS project is the development of a semantic database in which the
    meaning descriptions in the LDOCE are stored in a systematically related
    way
  * theoretical framework is stepwise lexical decomposition (Dik 1978b)
    * not use abstract semantic meta-language
  * links, linkers, shunters, and synonyms
9. related projects designed to extract lexical semantic information from LDOCE
  * issues shared by computational lexicography and knowledge acquisition
  * experiments on extracting semantic information

## Notes p28

# Placing the dictionary on-line H. Alshawi, B. Boguraev, D. Carter p28
Pages: 41-63

# An independent analysis of the LDOCE grammar coding system
E. Akkerman
Pages: 65-83

# Utilising the LDOCE grammar codes
B. Boguraev, E. Briscoe
Pages: 85-116

# The derivation of a large computational lexicon for English from LDOCE
J. Carroll, C. Grover
Pages: 117-133

# LDOCE and speech recognition
D. Carter
Pages: 135-152

# 7 Analysing the dictionary definitions p84
H. Alshawi
Pages: 153-169

* the small vocabulary problem does not disappear in limited domain because
  of synonyms and specialised words and the difficulty of delimiting domains
* partial syntactic analysis

## Def anal
## Analysis examples
## Some problems
## Phrasal analysis hierarchies
## Analysis rules
## Performance remarks
## Further research
## Notes

# 8 Meaning and structure in dictionary definitions p93
P. Vossen, W. Meijs, M. den Broeder
Pages: 171-192

* syntactic typology is developed for the structures of the meaning
  descriptions of each of the major parts of speech (POS)
* hyponyms, adjectives involved
* combine them with subject field, speech register, and sociolect codes

## 8.5 p99

# 9 A tractable machine dictionary as a resource for comp sem p104
Y Wilks, D Fass, C Guo, J McDonald, T Plate, B Slator
Pages: 193-228

* comp sem in the 1970s
  * We begin with a review of computational semantics, starting with what may
    now be called the historical background in computational semantics
  * nearly all the work in the early seventies on AI approaches to NLU
    fall under the term computational semantics
* history
  * Schank (CD)
  * Wilks' Preference Semantics
  * SHRDLU (procedural semantics)
  * Simmons' (1973) semantic network and Charniak’s (1972) inferential system
  * Lehnert (1987) is a fusion of Preference Semantics and CD
* comp sem is opposed to any claims as to the necessity or sufficiency of
  syntactic analysis, logical semantics, and expert systems
  * substantial algorithms and the right level of analysis lie elsewhere
  * natural language interfaces, especially expert systems
    * a false claim: if the knowledge structure is adequate, practical problems
      of semantics (like lexical ambiguity) do not arise
    * knowledge of language and the world are not ultimately separable
* connectionism
  * properties shared with comp sem
  * sub-symbolic approaches within connectionism (Smolensky, 1987)
    * not expect to distinguish representations for particular word senses,
      they would be simply different aspects of a single non-symbolic
      representation, and would correspond (if to anything) to a selection
      of different weighted arcs
  * those usually called localist
    * eg Cottrell and Small (1983); Waltz and Pollack (1985)
    * weighted symbolic representations
    * used in this chapter
* the difference as they apply to issues of word sense for comp sem
  * set out in the next section of the chapter as
  * the key issue in computational semantics at the moment
  * discreteness of word senses vs continuity
  * how distinction can be made at the appropriate time,
    as information enters the systems
    * Mellish (1985), Hirst (1987), and Small and Rieger (1982),
* Small, Cottrell and Tanenhaus (forthcoming)
  * boundaries of discreteness, in word-senses continuity and vagueness, and ML
* position in this chapter
  * inseparability of knowledge and language goes far
  * knowledge for certain purposes should be stored in text-like forms
* semantic structure of dictionaries has been analysed,
  compared to the underlying organisation of knowledge representations, and
  similarities have been observed, p106
  * genus and differentia, genus -> hierarchies
* computational semantics converges with
  knowledge acquisition and computational lexicography
  1. whether it is right to assume word ‘sense’,
    direct from traditional lexicography and MRDs (yes) p106
    * MT
    * arbitrary number of senses
    * [WSI] is plausible if it can extend to new senses from text
    * learning (Dreyfus, 1972)
    * _metaphor_
  2. sufficiency of a dictionary as a strong enough knowledge base
    * no (Hobbs, 1987);
    * can be made explicit by information from other entries
      (Amsler 1987; Boguraev, 1987; Slocum and Morgan, 1988; Kegl 1987)
  3. extricability
    * can automatic procedures extract semantic information
  4. bootstrapping
    * collecting the initial information that is needed
      * internal: from the dictionary itself
      * external (eg noun is_a POS)
    * syntax and case
* organization
  2. three approaches that extract information from LDOCE
  3. how such information can be used in
    Preference Semantics, and Collative Semantics

## 9.2 The extraction of semantic information from LDOCE

* organization
  * description of LDOCE
  * the three approaches
* LDOCE
  * about 30 non-LDV words are used in definitions
    eg aircraft is used 267 times
  * senses of LDV words constitute 24k of the 74k senses in LDOCE
  * box codes CONCRETE, ABSTRACT, and ANIMATE, hierarchy
  * pragmatic (`subject`) codes

### 9.2.1 Az LDOCE -- cooccurrence stat (Tony Plate)

### 9.2.2 Building a MRD based on LDOCE

1200-word key defining vocabulary (KDV)

### 9.2.3 genus

## taxonomy p108

## 9.3 utilisation LDOCE p118
