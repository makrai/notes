Robust Handling of Polysemy via Sparse Representations
Abhijit A. Mahabal, Dan Roth, Sid Mittal
2018 naacl

* heuristics

# Abstract

* tasks
  * set expansion task is well suited to study these meaning distinctions
    * since a word may belong to multiple sets with a different reason
  * analogy problems such as “the Ganga [Ganges] of Egypt” or “the Voldemort of
    Tolkien”
    * Category Builder is shown [ to outperform ] Word2Vec in analogy
    * despite being shown only two of the three input terms

# 1 Introduction

* bib
  James Pustejovsky and Bran Boguraev. 1997
  Lexical semantics: The problem of polysemy. Clarendon Press
* Our notion of Polysemy here is quite broad, since words can be similar to one
  another along a variety of dimensions
  * (a) {ring, necklace}, (b) {ring, gang}, and (c) {ring, beep}
  * examples where a single sense has multiple facets:
    * Clint Eastwood, who is both an actor and a director, shares different
      aspects with directors than with actors, and
    * Google, both a website and a major corporation, is
      similar to Wikipedia and General Electric along different dimensions
* the task of set expansion (Wang and Cohen, 2007; Davidov+ 2007;
  Jindal and Roth, 2011), which highlights the similarity of an item (a
  e.g. {Ford, Nixon}  quite different from the expansion of {Ford, Chevy},
  * whether a word (say, BMW or FDR) belongs in the expansion
  * can even support multi-granular similarity since while
    * {Chevy, Chrysler, Ford} represent the facet of A MERICAN CARS ,
    * {Chevy, Audi, Ford} define that of CARS
* Fixed Inventory Problem
  * Either senses are
    * obtained from a hand curated resource such as a dictionary, or are
    * induced from the corpus directly by mapping contexts clusters
  * by the time the [representation] is obtained,
    the number of different senses of each term has become fixed
* senses of a term are not independent (Hofstadter and Sander, 2013)
  * facet-based splitting is evident in Neelakantan+ (2014, Table 3)
    Similarly, in the vectors they released, november splits into ten senses,
    likely based on facets
* in the Category Builder approach ..., relevant contexts are chosen given the
  task at hand

# 3 Related Work

## 3.1 Set Expansion

* two large families, differing on whether the expansion
  * packaged families is based on a preprocessed, limited corpus (Shen+ 2017)
    * use some form of distributional similarity
    * Our work is [here], and we use sparse representations
  * much larger corpus (such as the entire web) is accessed on demand by making
    use of a search engine such as Google (Wang and Cohen, 2007, for example)
    * work better for sets whose instances show up in lists or other repeated
      structure on the web, and thus perform much better on sets of nouns
* two subfamilies within the packaged family: (Gyllensten & Sahlgren 2018)
  * centrality-based methods use a prototype of the seeds (say, the centroid)
  * classification-based methods (a strict superset), which produce a
  * Our approach is classification-based

## 3.2 Analogies

* people can solve [analogies] even if the first term is not shown.  That is,
  e.g. “What is the glove for the foot?”. People also answer questions such as
  * Hofstadter and Sander (2013) discuss [the cogsci of this ability]
* no one has presented a computational model
  * Linzen (2016) briefly discusses this problem
* [nonproportional analogy is] close to that used by Turney (2012) for word
  compounds. Understanding what a dog house is can be phrased as “What is the
  house of a dog?”, with kennel being the correct answer. This is solved using
  [a] pair of similarity functions
  * evaluations provided in that paper are for ranking of five provided
    terms
  * Here, we evaluate for retrieval, where we are ranking over all words

## 3.3 Similarity

* priming effects [and] categorization can change the perceived similarity
  between items (Goldstone+ 2001; Medin+ 1993 Lakoff, 1987;
  Ellis, 1993; Agar, 1994; Goldstone+ 2001; Hofstadter and Sander, 2013)

# 4 Representations and Algorithms

## 4.1 Contexts

* contexts in literature. Levy (2018) provides a comprehensive overview
* We use contexts derived from syntactic parse trees
* PPMI comments are in order
  * ad-hocness of the “0” in [its def]
    * in the presence of polysemy, especially lopsided polysemy
      such as Cancer (disease and star sign), a “0” threshold is arbitrary:
      * even if every occurrence of the star sign sense of cancer was seen in
        some context c, because of the rarity of that sense, the overall PMI
        between c and (non-disambiguated) Cancer may well be negative
    * Relatedly, Shifted PPMI (Levy and Goldberg, 2014b) uses a non-0 cutoff
  * large value when the word or the context is rare
    * see Role and Nadif, (2011) for fixes that have been proposed
* We introduce Asymmetric PMI, which takes frequency into account by adding
  a second log term
  * reminiscent of PPMI 0.75 from Levy+ (2015)
  * two matrices thus produced are shown in Equation 5

## 4.2 Focused Similarity and Set Expansion

* a matrix multiplication as shown in Equation 6
  * if we had used PPMI in Equation 5, the matrices would be each other’s
    transposes and each entry in SimMatrix in Equation 6 would be the
    dot-product-based similarity for a word pair
* context weighting by inserting a square matrix W between the two
  * If, for instance, all contexts other than those indicative of cars are
    zeroed out in W , ford and obama will have no similarity
  * The contexts we care about are those that are shared [by the query words]
    * intersection is not sensible, [because of] family resemblance and have a
    * weighting contexts based on what fraction of the seeds are associated
      with that context. The parameter ρ described in [4.4] achieves this

## 4.3 Set Expansion via Matrix Multiplication

* The score for a term in E is the sum of its focused similarity to each seed
* disease-related context for cancer [still] rank high in the expansion
  * To address this, we can limit ourselves to only the top n contexts
    (typically, n = 100 is used)

## 4.6 Sparse Representations for Analogies

* To solve the analogy problem “What is the Ganga of Egypt?” we are looking for
  * something that
    * [is in] set expansion of the (singleton) set {Ganga}, as described above)
    * we see often with Egypt

# 5.5 Qualitative Demonstration

* synthetic corpus produced by replacing all instances of cat and denver into
  the hypothetical CatDenver
