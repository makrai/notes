Evaluating Roget’s Thesauri p460
Alistair Kennedy and Stan Szpakowicz
2008 ACL

https://sites.google.com/site/openrogets/

#Abstract

* examine the differences in content between the 1911 and 1987 versions of
  Roget’s, and we test both versions 
* with each other and WordNet on 
* problems such as 
  * synonym identification and 
  * word relatedness
* novel method for measuring sentence relatedness that can be implemented in
  either version of Roget’s or in WordNet
* result
  * 1987 version of the Thesaurus is better, we show that the 
  * 1911 version performs surprisingly well and that often the 
  * differences between the versions of Roget’s and WordNet are not
    statistically significant. We 
* hope that this work will encourage others to use the 1911 Roget’s Thesaurus
in NLP tasks.

#Introduction

* 1911 Thesaurus instead of newer versions ... is in the public domain,
  along with related NLP-oriented software packages.
* a new method of representing the meaning of sentences or other short texts
  using either WordNet or Roget’s Thesaurus
  * tested on the data set provided by Li et al. (2006).
  * Jarmasz and Szpakowicz (2004) ... propose a method of determining semantic
    relatedness between pairs of terms.  Terms that appear closer together in
    the Thesaurus get higher weights than those farther apart
* Kennedy and Szpakowicz (2007) show how disambiguating one of these
  relations, hypernymy,
* interface to Roget’s Thesaurus implemented in Java 5.0 2 .  It is built
  around a large index which stores the location in the thesaurus of each
  word or phrase; the system individually indexes all words within each
  phrase, as well as the phrase itself. This was shown to improve results in a
  few applications, which we will discuss later in the paper.

#2 Content comparison of the 1911 and 1987 Thesauri

* similar in structure, there are a few differences, among them, the number
  of levels and the number of parts-of-speech represented.

| Hierarchy       | 1911  | 1987   |
|-----------------|------:|-------:|
| Class           | 8     | 8      |
| Section         | 39    | 39     |
| Subsection      | 97    | 95     |
| Head Group      | 625   | 596    |
| Head            | 1044  | 990    |
| Part-of-speech  | 3934  | 3220   |
| Paragraph       | 10244 | 6443   |
| Semicolon Group | 43196 | 59915  |
| Total Words     | 98924 | 225124 |
| Unique Words    | 59768 | 100470 |

* nine levels in Roget’s Thesaurus hierarchy, e.g. 1911
  * Class, e.g. “Words Expressing Abstract Relations”, a
  * Section in that Class is “Quantity” with a 
  * Subsection “Comparative Quantity”. 
  * Heads can be thought of as the heart of the Thesaurus
  * The Paragraph and Semicolon Group are not given names, but can often
    be represented by the first word.

#3 Comparison on applications p462

##Word relatedness

* three data sets containing pairs of words with manually assigned similarity
  scores: 
  * 30 pairs (Miller and Charles, 1991), 
  * 65 pairs (Rubenstein and Goodenough, 1965) and 
  * 353 pairs (wordsim353, Finkelstein et al., 2001). 
* We assume that all terms are nouns, so that we can have a fair comparison of
  the two Thesauri with WordNet
* Pearson’s Correlation Coefficient.
* there is a [clear] advantage to indexing the words in a _phrase_ separately,
  * e.g. “change of direction” should be indexed only as a whole, or as all of
    “change”, “of”, “direction” and “change of direction”
  * superior results on all three data sets, for both versions
* a variety of WordNet-based semantic relatedness measures – see Table 5. We
  consider 10 measures, noted in the table as 
  * J&C (Jiang and Conrath, 1997)
  * Resnik (Resnik, 1995)
  * Lin (Lin, 1998)
  * W&P (Wu and Palmer, 1994)
  * L&C (Leacock and Chodorow, 1998)
  * H&SO (Hirst and St-Onge, 1998)
  * Path (counts edges between synsets)
* large vectors of cooccurring terms from a corpus, so WordNet is only part of
  the system. We used Pedersen’s Semantic Distance software package (Pedersen
  et al., 2004).
  * Lesk (Banerjee and Pedersen, 2002)
  * and finally Vector and Vector Pair (Patwardhan, 2003)

##Synonym identification

* problem: we take a term q and we seek the correct synonym s from a set C.
* three data sets for this application: 
  * 80 questions taken from the Test of English as a Foreign Language (TOEFL)
    (Landauer and Dumais, 1997)
  * 50 questions – from the English as a Second Language test (ESL) 
    (Turney, 2001), and 
  * 300 questions – from the Reader’s Digest Word Power Game (RDWP) 
    (Lewis, 2000 and 2001)
* Roget’s Thesaurus 
  * both versions generally have fewer missing terms than WordNet

##Sentence relatedness

* data set from (Li et al., 2006).  They 
  * took a subset of the term pairs from (Rubenstein and Goodenough, 1965) and
  * chose sentences to represent these terms; 
  * the sentences are definitions from the Collins Cobuild dictionary
    (Sinclair, 2001)
  * Thirty people were then asked to assign relatedness scores
* method of sentence representation that involves mapping the sentence into
  weighted concepts in either Roget’s or WordNet. We mean a concept in
  Roget’s to be either a Class, Section, ..., Semicolon Group, while a concept
  in WordNet is any synset. Essentially a concept is a grouping of words from
  either resource. Concepts are weighted by two criteria. The first is how
  frequently words from the sentence appear in these concepts. The second is
  the depth (or specificity) of the concept itself.

###3.3.1 Weighting based on word frequency

###3.3.2 Weighting based on specificity

* concepts near the leaves of the hierarchy are more specific than those close
  to the root of the hierarchy.  

###3.3.3 Sentence similarity results

#4 Conclusion and future work p467
