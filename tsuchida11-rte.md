KOMA at TAC2011: A Method for Recognizing Textual Entailment
  using Lexical-level and Sentence Structure-level features
Masaaki Tsuchida and Kai Ishikawa
2011

# Abstract

* combines the entailment score calculated by
  * lexical-level matching with the
  * machine-learning-based filtering mechanism using various
    * features obtained from lexical-level, chunk-level and predicate argument
      structure-level information. In the filtering mechanism, we
    * try to discard the T-H pairs that have high entailment score and are
      actually not entailment

# 1 Intro

* methods based on
  * logical inference (Hickl and Bensley, 2007; Clark and Harrison, 2009),
  * similarity between
    * dependency parse trees (Bar-Haim et al., 2009) or similarity between
    * syntactic graphs (Padò et al., 2009).
  * Sammons et al.  (2010) reports that such previous works have made
    significant progress (Sammons et al., 2010) beyond a smart lexical
    baseline (Do et al., 2009)
* However, the top 3 systems in RTE-6
  * (Jia et al., 2010; Majumdar and Bhattacharyya, 2010; Tateishi and
    Ishikawa, 2010)  were
  * basically lexical-level matching approaches,

# 2 Description of Our System

* discards the entailment pair candidates that have high scores but seem not
  entail.  For this filtering, we use various
  * features from word chunks and predicate-argument-structures, which are more
    than lexical-level information.  In our system, we use SENNA 1 for
    analyzing part-of-speeaches of words, word chunks, named entities and
    predicate-argument-strucures in sentences
  * three knowledge resources,
    * acronym extracted from the corpus,
    * WordNet (Fellbaum, 1998) and
    * CatVar (Habash and Dorr, 2003), which contains categorical variations of
      English lexemes.  The acronyms are created for organizational names with
      more than three words, by selecting the first letter of each word.
