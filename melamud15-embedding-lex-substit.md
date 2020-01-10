Oren Melamud  and Omer Levy and Ido Dagan
A Simple Word Embedding Model for Lexical Substitution
2015

#1 Introduction

* models for lexical substitution
  * sparse syntax-based vector models (Thater+ 2011),
  * probabilistic graphical models (Moon and Erk, 2013) and
  * LDA topic models (Séaghdha and Korhonen, 2014)
* distinct representation for each sense of a target word type, as induced by
  clustering the word’s contexts (Huang+ 2012; Neelakantan+ 2014)

#2 Skip-gram Word Embeddings

* word2vecf (Levy and Goldberg, 2014a) is an extension of the skip-gram
* implementation in word2vec, which supports arbitrary types of contexts
  rather than only word window contexts
  * https://bitbucket.org/yoavgo/word2vecf (ends with f)

#3 Lexical Substitution Model

* a good lexical substitute for a target word instance, under a given context,
* needs to be both
  1. semantically similar to the target word and
  2. compatible with the given context
* both target-to-target and target-to-context similarities: Cosine
* weighting:
  * arithmetic/geo mean
  * more contexts balanced

#4 Evaluation

* Our embeddings are available at: www.cs.biu.ac.il/
* nlp/resources/downloads/lexsub_embeddings/

#5 Conclusions

* future work
  * weighting the two substitutability measures
  * other types of embeddings that represent both target words and contexts
    * (Pennington+ 2014; Levy+ 2015)

#References

* Omer Levy and Yoav Goldberg. 2014a. Dependency-based word embeddings. ACL
* Omer Levy and Yoav Goldberg. 2014b. CoNLL-2014
  Linguistic regularities in sparse and explicit word representations. 
* Omer Levy, Yoav Goldberg, and Ido Dagan. TACL 2015. 
  Improving distributional similarity with lessons learned from word embeddings
