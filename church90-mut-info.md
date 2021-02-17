Kenneth Ward Church, Patrick Hanks
1990
Word association norms, Mutual information, and lexicography

# Abstract

* association: quicker response
* statistical description of linguistic phenomena
  [e.g.] semantic relations

# 1 Meaning and Association

* egy szállóige születése: a Firth híres mondatát idéző cikkek közül Church+ a
  harmadik leghivatkozottabb, és 24 évvel megelőzi a második legrégebbi
  dobogóst
* "verb patterns" described in Hornby's Advanced Learner's Dictionary
  (first edition 1948)
* computational storage and analysis of large bodies of natural language have
  developed significantly in recent years, so that it is now becoming possible
  to test and apply informal assertions of this kind

# 2 2. Practical Applications

* The proposed statistical description has a large number of applications,
  * constraining the language model both for speech recognition and OCR
  * providing disambiguation cues for parsing
    * noun compounds, conjunctions, and prepositional phrases,
  * retrieving texts from large databases (e.g., newspapers, patents),
  * compiling lexicons of lexico-syntactic facts, and
  * lexicographers in identifying normal and conventional usage.

# 4 An information theoretic measure

* mutual information (Fano 1961)
`log P(x,y) / P(x) P(y)`
* window
  * size parameter allows us to look at different scales.
    * Smaller window sizes will identify fixed expressions (idioms)
    * larger window sizes will highlight semantic concepts
    * compromise: For the remainder of this paper, ..., w, will be set to 5 words
  * This definition fw(x,y) uses rectangular window
    * alternatives (e.g., triangular window or decaying exponential)
* association ratio is different from mutual information in two respects
  1. joint probabilities are supposed to be symmetric

# 9 Conclusions

* the former is less interesting because its semantics are compositional
