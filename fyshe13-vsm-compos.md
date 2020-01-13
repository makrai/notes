Alona Fyshe, Partha Talukdar, Brian Murphy and Tom Mitchell 
2013
Documents and Dependencies:
  an Exploration of Vector Space Models for Semantic Composition

http://www.cs.cmu.edu/~afyshe/papers/conll2013/

* Mintha a cikk két felének nem lenne egymáshoz köze
  * Az első felében a témajegyek és a típusjegyek kigészítik egymást a
    korpuszos-vektoros feladaton, és a vektorok összeadása adja a legjobb
    vektorkompozíciót
  * A második felében az agyi tevékenységből jósolják a vektorokat, és a
    tisztán témajegyes modell győz vektorok dilatációval
    (a főnévnek a melléknévvel párhuzamos komponensének a nyújtásával)

* topical information (e.g., documents in which a word is present)
  `+` syntactic/semantic types of words
  (e.g., dependency parse links of a word in sentences)
  -> VSM for semantic composition of adjective-noun phrases new evaluation task
  -> brain activity

# 1 Introduction

* two feature types
  * global corpus co-occurrence patterns
    (e.g. how often a word appears in each document), or
  * local corpus cooccurrence patterns patterns
    (e.g.  how often two words appear together in the same sentence, or are
    linked together in dependency parsed sentences)
* can be compared with the paradigmatic/syntagmatic distinction
  (Sahlgren, 2006)
* Global patterns have been used in 
  * Latent Semantic Analysis (Landauer and Dumais, 1997) and 
  * LDA Topic models (Blei et al., 2003). 
* Local patterns based on word co-occurrence in a fixed width window
  * Hyperspace Analogue to Language (Lund and Burgess, 1996). Subsequent
  * increasing linguistic sophistication, up to full syntactic and dependency
    parses (Lin, 1998; Padó and Lapata, 2007; Baroni and Lenci, 2010).
    
## In this paper we systematically explore the utility of a 

* global, topic-based VSM built from what we call Document features, and a
* local, type-based VSM built from Dependency features
* third Combined VSM in which the word vector is the 
  concatenation of its Document and Dependency features. 
* All three models subsequently 
  * normalize frequencies using positive pointwise mutual-information (PPMI) +
  * dimensionality reduc[tion] using singular value decomposition (SVD)
* To our knowledge, [ours] is the first freely available VSM that includes
  entries for both words and adjective-noun phrases
* novel task: to predict the vector representation of a composed phrase
  * from the brain activity of human subjects reading that phrase
* two composition methods, addition and dilation
  * addition performs well on corpus-only tasks,
  * dilation performs best on the brain activity task

# 2 Related Work

* Mitchell and Lapata (2010) explored several methods of
  combining adjective and noun vectors
* Baroni and Zamparelli (2010) ... used matrices to represent adjectives,
  while nouns were represented with column vectors
* Socher et al. (2012) assigns each word a vector and a matrix
* tasks involving neural activation data (Murphy et al., 2012b)
* (Blacoe and Lapata, 2012) ... compared several methods
  to create phrase vectors, point-wise multiplication

# 3 Creating a Vector-Space

* A series of three additional filtering steps selected [phrases and features]
  1. co-occurrence frequency cut-off ... of 
    * 20 ... to the dependency counts, and of 2 to document counts.  
    * Positive pointwise-mutual-information (PPMI) was used as an association
      measure to normalize the observed co-occurrence frequency for the varying
      frequency of the target word and its features, and to discard negative
      associations.  
  2. filtered to the 57 thousand words and phrases which had at least 20
     non-“stop word” Dependency co-occurrence types, where a “stop word” was
     one of the 100 most frequent Dependency features observed (so named be-
     cause the dependencies were largely incident on function words). 
  3. features observed for no more than one target were removed, as were 
    empty target entries

# 4 Experiments

* filtering, cutoff, _..._

## 4.1 Judgements of Word Similarity

* cosine distances

## 4.2 Judgements of Phrase Similarity

* addition
* dilatation
  * coherent with the notion of cocomposition (Pustejovsky, 1995)

## 4.3 Composed vs Observed Phrase Vectors

* overrepresentation of operational adjectives
  like “better” and “more”

## 4.4 Brain Activity Data

* Magnetoencephalography (MEG)
  * much higher temporal resolution (1 ms) than fMRI
* 9 participants viewed 38 phrases, each repeated 20 times
* nouns were chosen because previous research had shown them to be
  decodable from MEG recordings, and the
  * adjectives were selected to modulate their most decodable ...  properties
    (e.g. edibility, manipulability)
* To determine if the recorded MEG data can be used to predict our composed
  vector space representations
  * Predicting brain activity from VSM representations
    provides additional challenges, as
    parts of the observed brain activity are not driven by semantics
  * Zero Shot Learning (Palatucci et al., 2009)
* best: dilatation
