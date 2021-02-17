Manaal Faruqui, Jesse Dodge, Sujay K Jauhar, Chris Dyer, Eduard Hovy, NA Smith
Retrofitting Word Vectors to Semantic Lexicons
NAACL 2015 Best Student Paper Award

# Abstract

semantic lexicons such as WordNet, FrameNet, and the Paraphrase Database

# 1 Introduction

* Recent work has shown that by either
  * changing the objective of the word vector training algorithm
    * word2vec
      * similarity knowledge (Yu and Dredze, 2014; Fried and Duh, 2014)
      * word relational knowledge (Xu+ 2014; Bian+ 2014)
    * latent semantic analysis
      * antonym specific polarity induction (Yih+ 2012) and
      * multi-relational (Chang+ 2013)
  * relation-specific augmentation of the co-occurence matrix
    (Yih+ 2012; Chang+ 2013)
  * these methods are limited to particular methods for constructing vectors
* this paper is a graph-based learning technique
* belief propagation on a graph
  * constructed from lexicon-derived relational information
* the new vectors to be (i) similar to the vectors of related word types

# 2 Retrofitting with Semantic Lexicons

* Ω be an ontology, an undirected graph
* Markov random field (Kindermann and Snell, 1980)
* Euclidean distance
* convex, solving a system of linear equations
* prior approach here will serve as a baseline
* `\beta_{ij} = deg(i)^{-1}`

# 3 Word Vector Representations

* available pre-trained English word vectors
  * glove
  * sgram hs
  * Huang 2012
    * both local and global (document-level) context features
  * Multilingual Vectors (Multi)
    * Faruqui and Dyer (2014)
      * learned vectors by
        * first performing SVD on text in different languages,
        * then applying canonical correlation analysis (CCA)
          on pairs of vectors for words that align in parallel corpora
      * monolingual vectors were trained on WMT-2011 news corpus for
        English, French, German and Spanish

# 4 Semantic Lexicons

* both manually and automatically created lexicons

|	      |PPDB	    |WordNet syn	|WordNet all	|FrameNet |
|-------|---------|-------------|-------------|---------|
|Words	|102,902	|148,730	    |148,730	    |10,822   |
|Edges	|374,555	|304,856	    |934,705	    |417,456  |

* paraphrase database (Ganitkevitch+ 2013)
  * more than 220 million paraphrase pairs of English
  * 8 million are lexical (single word to single word) paraphrases
  * acquisition: two words in one language should be synonymous
    if they align, in parallel text, to the same word in a different lang
* WordNet
* FrameNet
  * For example, the frame "Cause change of position on a scale" is associated
    with push, raise, and growth (among many others)

# 5 Evaluation Benchmarks

* both semantic and syntactic aspects of the representations
* extrinsic sentiment analysis task
* Word Similarity
  * WS-353 dataset (Finkelstein+ 2001)
    * 353 pairs of English words + similarity ratings by humans
  * RG-65 (Rubenstein and Goodenough, 1965) dataset
    * 65 pairs of nouns
  * MEN dataset (Bruni+ 2012) of 3,000 word pairs
    * sampled from words that occur at least 700 times in a large web corpus
* Syntactic Relations (SYN-REL) Mikolov
* Synonym Selection (TOEFL)
* Sentiment Analysis (SA). Socher+ (2013)
  * a treebank containing sentences annotated with fine-grained sentiment
    labels on phrases and sentences from movie review excerpts

# 6 Experiments

## 6.3 Comparisons to Prior Work

* Yu and Dredze (2014)
   Mo Yu and Mark Dredze
   Improving lexical embeddings with semantic knowledge
   ACL 2014
* Xu+ (2014)
   Chang Xu, Yalong Bai, Jiang Bian, Bin Gao, Gang Wang ... Tie-Yan Liu
   Rc-net:
    A general framework for incorporating knowledge into word representations
   CIKM 2014

## 6.4 Multilingual Evaluation

* German RG-65 (Gurevych, 2005),
* French RG-65 (Joubarne and Inkpen, 2011) and
* Spanish MC-30 (Hassan and Mihalcea, 2009)
* Universal WordNet (de Melo and Weikum, 2009)

# 7 Further Analysis

* Retrofitting vs. vector length

# 8 Related Work

* graph structures to propagate information among semantic concepts
  (Zhu, 2005; Culp and Michailidis, 2008)
  * POS tags (Subramanya+ 2010; Das and Petrov, 2011)
  * frame associations (Das and Smith, 2011)
  * Broadly, graph-based semi-supervised learning
    (Zhu, 2005; Talukdar and Pereira, 2010)
    * machine translation (Alexandrescu and Kirchhoff, 2009)
    * unsupervised semantic role induction (Lang and Lapata, 2011)
    * semantic document modeling (Schuhmacher and Ponzetto, 2014)
    * language generation (Krahmer+ 2003) and
    * sentiment analysis (Goldberg and Zhu, 2006)

# 9 Conclusion
