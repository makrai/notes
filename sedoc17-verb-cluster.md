J Sedoc, D Wijaya, M Rouhizadeh, A Schwartz, L Ungar
Deriving Verb Predicates By Clustering Verbs with Arguments
arXiv preprint arXiv:1708.00416

# Abstract

* Verb classes
  * Hand-built verb clusters such as Levin classes (Levin, 1993)
    * useful, but have limited coverage
  * automatically induced from corpus data such as
    e.g. VerbKB (Wijaya, 2016), on the other hand, can give clusters with much
* We present a method for clustering the outputs of VerbKB
  * e.g. "marry(person, person)", "feel(person, emotion)."
  * make use of a novel low-dimensional embedding of verbs and their arguments
  * the same verb can be in different clusters depending on its argument type
  * eval in predicting sarcasm, sentiment, and locus of control in tweets

# 1 Introduction

* selectional preferences
  * strong indicators of verb diathesis alternations (McCarthy, 2001)
  * can be assigned to verb classes in VerbNet (Schuler, 2005). In this
* we show that clustering verbs along with their subject and object types
  yields better verb clusters. Verbs are ’disambiguated’
* categorization is not limited to verbs: arguments
* eval: predicting attributes of Facebook messages and Tweets
  * predicting sarcasm, sentiment, and locus of control: 
    * locus of control: whether the author feels in control or being controlled
      * a relatively novel task
* contributions
  * a novel method for learning the low-dimensional embeddings of verbs and
    their arguments
    * takes into account selectional preferences and distribution (5.3)
  * we present an algorithm for clustering verbs and their arguments based on
    the embeddings (section 3)
  * predicting control, sarcasm, and sentiment in tweets (section 6)

# 2 Related Work

## Verb Clustering

* applications including e.g.,
  * metaphor detection (Shutova+ 2010)
  * semantic role labeling (Palmer+ 2010)
  * language acquisition (Hartshorne+ 2016)
  * and information extraction (Nakashole and Mitchell, 2016). Verb classes are
* VerbNet (Schuler, 2005) is a widely-used hand-built verb classification which
  * over 6,00 verbs that are categorized into 280 classes. The
  * based on Levin’s verb classification (Levin, 1993), which is motivated by
* automatically induce verb clusters from corpus data
  (Sun and Korhonen, 2009; Nakashole+ 2012; Kawahara+ 2014; Fader+ 2011)
  * VerbKB (Wijaya, 2016; Wijaya and Mitchell, 2016), which contains
    * large-scale, automatically induced from ClueWeb (Callan+ 2009). Unlike
    * semantically typed verbs: verbs (+ prepositions) whose
    * types from NELL knowledge base (Carlson+ 2010)
      e.g., “marry on(person, date)”, “marry(person, person)”
      * poor coverage for common nouns in NELL KB
    * 65,000 verbs (+prepositions) and outperforms other large-scale verb
    * clusters align well to hand-built verb classes. Unlike these previous

## Verb Embeddings

* Schwartz+ (2016) has observed that verbs['s] distributional representation
  can benefit from taking verb argument role into account
  * roles or types can be provided by existing semantic resources
  * sense-aware embeddings that take into account information from existing
    semantic resources (Iacobacci+ 2015)
    * requires large amounts of sense-annotated corpora
* Since we have only data in the form of (subject, verb, object) triples
  extracted from ClueWeb, the limited context also means that
  traditional word embedding models or word sense disambiguation systems may not
  learn well on the data (Melamud+ 2016)
* verb selectional preferences are useful for verb clustering
  (Sun and Korhonen, 2009; Wijaya, 2016)
* we cluster VerbKB typed verbs by first learning novel, low-dimensional
  representations of the typed verbs, thus encoding information about the verb
  selectional preferences and distribution in the data
* We learn embeddings of typed verbs in VerbKB
* Using only triples in the form of (subject, verb, object) extracted from
  ClueWeb, we
  * learn verb embeddings by treating each verb as a relation between its
    subject and object (Bordes+ 2013). Since verbs are predicates that express
    relations between the arguments and adjuncts in sentences, we believe this
    is a natural way for representing verbs.  We cluster typed verbs based on
    their embeddings
* at run time, given any text containing a verb and its arguments, we
  * using NELL’s noun phrase to category mapping to obtain the types

# Results and Discussion

* baselines: we use Levin classes, VerbNet, as well as
  clusters of subject, verb, object GloVe embeddings

# 8 Conclusion
