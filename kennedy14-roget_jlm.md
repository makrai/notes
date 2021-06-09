Evaluation of Automatic Updates of Roget’s Thesaurus
Alistair Kennedy and Stan Szpakowicz
JLM 2014

# Abstract

* three NLP tasks: selection of the best synonym from a set of candidates,
  pseudo-word-sense disambiguation and SAT-style analogy problems
* related work
  * construct or enhance a thesaurus by clustering related words goes back over
    two decades (Tsurumaru+ 1986; Crouch 1988; Crouch and Yang 1992).
    * Few methods use an existing resource in the process of updating that same
    resource
* We employ Roget’s Thesaurus in two ways when creating its updated versions
  * First, we construct a measure of semantic relatedness between terms, and
    tune a system to place a word in the Thesaurus
  * Next, we use the resource to “learn” how to place new words in the correct
    locations. This paper focusses on finding how to place a new word
* contributions:
  * measures of semantic relatedness from Kennedy and Szpakowicz (2011, 2012)
  * new datasets for
    * pseudo-word-sense disambiguation and the
    * selection of the best synonym;
  * propose and evaluate a new method for solving SAT-style analogy problems;
  * compare semantic similarity calculation with Roget’s Thesaurus and WordNet

# 1 About Roget’s Thesaurus

* revisions continuing to this day (Kendall 2008)
  * Joshua C. Kendall (2008), The Man Who Made Lists : Love, Death, Madness, and
    the Creation of Roget’s Thesaurus
* nine-level hierarchy
  * The closest counterpart of WordNet’s synsets is a Semicolon Group (SG).  An
    SG contains closely related words (usually near-synonyms); a
  * Paragraph
  * division by part-of-speech quite low in the hierarchy, not at the very top
    as in WordNet

# 2 previous work on updating thesauri

* attempts to expand the lexicon of Roget’s Thesaurus
* mapping word senses between Roget’s, WordNet and LDOCE (Procter 1978). The
* contexts: words in the same Paragraph, WordNet synset or an LDOCE definition
* contexts are used to deduce which words are likely to be related
  (Kwong 1998a,b; Nastase and Szpakowicz 2001)
* Sagot and Fišer (2011) present an automatic, language-independent method
  (tested on Slovene and French) of extending a wordnet by “recycling” freely
  available bilingual resources such as machine-readable dictionaries and
  on-line encyclopaedias

# 3 measuring semantic relatedness

* Kennedy and Szpakowicz (2011, 2012) discussed introducing supervision into
  the process of context re-weighting

# 6 automatic evaluation

1. one is given a term q and seeks its best synonym s in a set of words C
2. take two words and merge them into a pseudo-word. A WSD system, then, has the
   goal of identifying which of the two words actually belongs in a given contxt
3. Scholastic Aptitude Tests (SAT)

word: language :: note: music
