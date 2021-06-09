Prior Disambiguation of Word Tensors for Constructing Sentence Vectors
Dimitri Kartsaklis, Mehrnoosh Sadrzadeh
EMNLP 2013 October Seattle, Washington, USA SIGDAT 1590–1601

# Abstract

* Recent work has shown that compositional-distributional models using
  element-wise operations on contextual word vectors
  benefit from the introduction of a prior disambiguation step
* [we] generalise these ideas to tensor-based models, where relational words
  * Furthermore, we confirm previous findings regarding the
    positive effect of disambiguation on vector mixture models, and
    we compare the effectiveness of the two approaches

# Introduction

* no text corpus, regardless of its size, can provide reliable distributional
  representations for ... phrase or sentence level
* composing the vectors of the words that comprise the sentence
* two general categories. Following an influential work
  * [what we refer to] as vector mixtures (Mitchell and Lapata, 2008)
    * compute a sentence vector as a mixture of the original word vectors,
      using simple operations such as element-wise multiplication and addition;
  * [what we refer to] as tensor-based
    * distinguish between the type-logical identities of the different words:
    * from a formal semantics point of view
    * Baroni and Zamparelli (2010), for example, model adjectives as matrices
    * formalized by Coecke+ (2010) in [as] compact closed categories
* common feature: they all rely on ambiguous vector representations
  * for the vector mixture approach
  * [ambiguous] practice has proved suboptimal: Reddy+ (2011) and
  * Kartsaklis+ (2013) test ... simple multiplicative and additive models using
    * disambiguation step prior to actual composition can [increase the qual]
* [we: how beneficial] for tensor-based approaches, which in general constitute
Specifically, this paper aims to:
  1. propose disambiguation algorithms for a number of tensor-based distri mods
  1. examine the effect of disambiguation on tensors for relational words; and
  1. compare the effectiveness of tensor-based against vector mixture models in
     a number of tasks
* algorithms
  * Based on the generic procedure of Schütze (1998),
    we propose algorithms for a number of tensor-based models, where the
    composition is modelled as ... linear maps (tensor contractions)
* test
  * Following Mitchell and Lapata (2008) and many others, we test our models on
  * two disambiguation tasks similar to that of Kintsch (2001), and on the
  * phrase similarity task introduced in (Mitchell and Lapata, 2010)
* results show that disambiguation can make a great difference in the case of
  tensor-based models; they also
  * reconfirm previous findings ... for simple vector mixture models

# 2 Vectors vs tensors

* a compositional approach based on linear maps, tensor-based models
  * e.g., one can consider building linear maps for prepositions and logical
    words, rather than treating them as noise and discard them, as common

# 3 Disambiguation in vector mixtures 3

* Pulman (2013) and Kartsaklis+ (2013): the element-wise combination of
  “ambiguous” vectors produces results that are hard to interpret;
  * two tasks that take place in parallel: composition and
    some amount of disambiguation that emerges as a side-effect of the compos
  * leaving the resulting vector in an intermediate state

# 4 Tensors as multilinear maps

* The generalization of [matrix multiplication] to tensors of higher order is
  known as tensor contraction. Given two tensors of orders n and m, the tensor
  contraction operation will always produce a tensor of order n + m − 2

# 5 Creating verb tensors 4

* [Now we review proposals for] constructing tensors for relational words
  in ... the frameworks of Coecke+ (2010) and Baroni and Zamparelli (2010),

## Relational

* Following ideas from the set-theoretic view of formal semantics,
  Grefenstette and Sadrzadeh (2011a) suggest that the meaning of a
  relational word should be represented as the sum of its arguments. The
  * e.g. meaning of adjective ‘red’ ... becomes the sum of the vectors of all
    the nouns that ‘red’ modifies in the corpus
  * relational words of any arity [are the sum of] the tensor product of their
    arguments. So for a transitive verb we have:
* arity of the head word in a sentence will also determine the order of the
  sentence space

## Kronecker

* Grefenstette and Sadrzadeh (2011b) proposes the creation of a
  verb matrix as the Kronecker product of the verb’s contextual vector with
  itself
* sentence space is of order 2

## Frobenius

* Using Frobenius algebras, Kartsaklis+ (2012) provide a unified sentence space
  * turn the matrix of Equation 3 to a tensor of order 3 (as required by the
    type-logical identities) by copying one of the existing dimensions. When

## Linear regression 5

* idea first introduced by Baroni and Zamparelli (2010) for the creation of
  adjective matrices, Grefenstette+ (2013) use linear regression in order to
  learn full tensors of order 3 for transitive verbs
* In the case of the adjective ‘red’, for example, we would need a set of the
  form (car, red car), (shirt, red shirt).. where the second vector in each
  pair is the contextual vector of the whole phrase created exactly as if it
  were a single word

# 6 Generic context-based disambiguation 5

* [clustering] the set of contexts

# Experiments 6

## Experimental setting

* ukWaC (Ferraresi+ 2008), a corpus of English text with 2 billion words
* 2000 dimensions, with weights calculated as the [conditional probability]
* 5-word window on both sides of the target word.  The
* vectors are disambiguated both syntactically and semantically: first,

## Models

### Implementation details 7

## 8.1 Verb disambiguation task 7

* Perhaps surprisingly, one of the most popular tasks for testing
  compositionality in distributional models is based on disambiguation. This
* task, originally introduced by Kintsch (2001), has been
* adopted by Mitchell and Lapata (2008) and others for evaluating the quality
  of composition in vector spaces. Given an ambiguous verb such as ‘file’, the
  goal is to find out to what extent the presence of an appropriate context
  will disambiguate its intended meaning. The context (e.g. a subject/object
  pair) is composed with
* two landmark verbs corresponding to the different senses (‘smooth’ and
  ‘register’) to create simple sentences. The assumption is that a good
  compositional model should be able to reflect that ‘woman files application’
  is closer to ‘woman registers application’ than to ‘woman smooths
  application’
* we test our models on two different datasets of transitive sentences, that of
  * Grefenstette and Sadrzadeh (2011a) and
    * verbs and their alternative meanings have been selected automatically
      using the JCN metric of semantic similarity (Jiang and Conrath, 1997)
    * many verbs cannot be considered as genuinely ambiguous (e.g. ‘say’ with
      meanings state and allege or ‘write’ with meanings publish and spell)
  * Kartsaklis+ (2013) 4
    * selection was based on human judgements
      from the work of Pickering and Frisson (2001). So, while 4
    * landmarks ... correspond to clearly separated senses (e.g. ‘file’ with
      meanings register and smooth or ‘charge’ with meanings accuse and bill)
    * subjects and objects of this latter case are modified by appropriate
      adjectives
* Both datasets consist of 200 pairs of sentences
  (10 main verbs × 2 landmarks × 10 contexts)

# Results

* G&S dataset are shown in Table 1. 5 The verbs-only model (BL) refers to a
  * The tensor-based models present much better performance
    than the vector mixture ones, with the
  * disambiguated version of the copy-object model significantly higher than
    the relational model. By design, the copy-object model retains [the object]
  * confirms previous findings(Kartsaklis+ 2012), that in this certain dataset
    the role of objects is more important than that of subjects . In general,
  * disambiguation step improves the results of all the tensor-based models
    except Kronecker; the
  * effect is reversed for the vector mixture models
* Kartsaklis+ (Table 2)
  * disambiguation is now helpful for all models (vector mixtures and tensor-b)
  * the disambiguation of just the verb (verbs-only model), without any
    interaction with the context, is sufficient to provide the best score
  * composition of the verb with the context decreases performance,
    confirming the results reported by Kartsaklis+ (2013)
    * task ... is designed around the ambiguity of the verb, this result is not
    * no composition is necessary for this task to be successful
* However, when one use[s this task] to evaluate compositional models
  * implicitly correlate the strength of the disambiguation effect that takes
    place during the composition with the quality of composition, essentially
  * assuming that the stronger the disambiguation, the better the compositional
    model that produced this side-effect. Unfortunately, the extent to which
  * this ... is still not quite clear (Kartsaklis+ 2013). Keeping a note of

## 8.2 Phrase/sentence similarity task

* does not use disambiguation as a criterion of composition
* based on ... Mitchell and Lapata (2010). On the contrary with the task of
* We work on the verb-phrase part of the dataset, consisting of
  72 short verb phrases (verb-object structures). These 72 phrases have been
* groups exhibiting various degrees of similarity:
  36 highly similar phrasesm medium similarity, low-similarity pairs

### Verb phrases It can be shown that

* for simple verb phrases the relational model reduces itself to the copy-subj
* effects of disambiguation ... are quite impressive
* [w]hat benefit the most from disambiguation are the vector mixtures; both

### Transitive sentences

* we extend each one of the 72 verb phrases to a full transitive sentence
  by adding an appropriate subject such that the similarity relationships of
  the original dataset are retained as much as possible,
  so the human judgements for the verb phrase pairs could as well be used for
  the transitive cases
  We worked pair-wise: for each pair of verb phrases, we first selected one of
  the 5 most frequent subjects for the first phrase; then, the subject of the
  other phrase was selected by a list of synonyms of the first subject in a way
  that the new pair of transitive sentences constitutes the least more specific
  version of the given verb-phrase pair
  So, for example, the pair produce effect/achieve result became drug produce
  1598 effect/medication achieve result, while the pair pose problem/address
  question became study pose problem/paper address question. 6
* disambiguation produces better results in all cases, with highly
* best score is delivered by one of the tensor-based models (Kronecker), with a
  difference not statistically significant from disambiguated additive.  In any
* suggests that as the length of the text segments increases, the performance
  of vector mixtures and tensor-based models converges

# 9 Discussion

* The positive effect of disambiguation is more evident for the vector mixture
  * This is expected: composite representations created by element-wise
    operations are averages, and a prior step of disambiguation can make a
    great difference
* From a task perspective, the effect of disambiguation was much more definite
  in the phrase/sentence similarity task
  This observation is really interesting, since the words of that dataset were
  not selected in order to be ambiguous in any way. The superior performance of
* We believe ... that the automatic selection of landmark verbs using the JCN
  metric (as done with the G&S dataset) was not very efficient
* less conclusive for ... the comparison of the two classes of models. Despite
  * vector mixture models might constitute a hard-to-beat baseline;
  * similar observations have been made [by] Blacoe and Lapata (2012). However,
* implies that the effectiveness of each method depends to some extent on the
  length of the text segment:
  when more words are involved, vector mixture models ... less effective; on
  * performance of tensor-based models seems to be proportional to the length

# 10 Conclusion and future work 10

* future work, we aim to investigate the application of [the tensor
  contraction] procedure to the regression model of Grefenstette+ (2013)
