Allyson Ettinger, Ahmed Elgohary, Philip Resnik
Probing for semantic evidence of composition
  by means of simple classification tasks
2016 repeval

# Abstract

* We propose a diagnostic method for probing information captured in sent vecs
  * simple classification tasks with strategically constructed sentence sets.
  * illustrate example classification tasks for targeting [some semantic] info

# 1 Introduction

* effective composition as production of sentence representations that allow
  for high performance _on a task of interest_
  (Kiros+ 2015; Tai+ 2015; Wieting+ 2015; Iyyer+ 2015)
* we propose here a linguistically-motivated but computationally
  straightforward diagnostic method,

# 2 Existing approaches

* SICK entailment dataset (Marelli+ 2014)
  * limited for a couple of reasons. First, certain cues in this dataset allow
    for strong performance without composition (for example, as Bentivogli et
    al. (2016) point out, 86.4% of sentence pairs labeled as CONTRADICTION can
    be identified simply by detecting the presence of negation; a similar
    obser-vation is made by Lai and Hockenmaier (2014)),
  * lack coverage of many linguistic characteristics important to composition
    (e.g., semantic roles)
  * even within annotated transformation categories, distributions over
    entailment labels are highly skewed
* Li+ (2015) use *visualization* techniques to better examine the par-
  ticular aspects of compositionality captured by their models. They consider
  recurrent neural network composition models trained entirely for one of
  two tasks—sentiment analysis and language modeling—and employ dimensionality
  reduction to visualize sentiment neighborhood relationships between words or
  phrases before and after applying modification, negation, and clause
  composition. They also visualize the saliency of individual tokens
* Our proposed evaluation approach follows a _similar rationale_ to that of
  the diagnostic test suite TSNLP (Balkan+ 1994) designed for evaluat-
  ing _parsers_ on a per-phenomenon basis. As highlighted by Scarlett and
  Szpakowicz (2000) the systematic fine-grained evaluation of TSNLP enables
  precise pinpointing of parsers’ limitations, while ensuring broad coverage
  and controlled evaluation of various linguistic phenomena and syntactic
  structures.

# 3 Probing for semantic information with targeted classification tasks

* decoding human brain activation patterns in cognitive neuroscience
  studies of language understanding (Frankland and Greene, 2015),

## Dataset construction

For our illustrations here, we _restrict our structural variation_
* to that available from
  * active/passive alternations, use of
  * relative clauses at various syntactic locations, and use of
  * negation at various syntactic locations.
* This allows us to demonstrate decent structural variety without distracting
  from illustration of the semantic characteristics of interest.  Many more
  components can be added to increase complexity ... More detailed discussion
  of considerations for construction of the actual dataset is given in Section
  5.

## Semantic characteristics

* semantic role information is
  * in NLP ... in the form of tasks such as abstract meaning representation
    (AMR) (Banarescu+ 2013). Similarly, the concept of
* scope
 * including negation
 * in NLP, in particular for applications such as sentiment analysis
  (Blunsom+ 2013; Iyyer+ 2015).

## Example classification tasks

* semantic role
  * positive if they contain professor in the AGENT relation with the verb
    recommend.
  * negative examples containing the relevant lexical items (professor,
    recommend) without the relation of interest,

# 4 Preliminary experiments

three sentence embedding methods:
  1. Averaging GloVe vectors (Pennington+ 2014),
  1. Paraphrastic word averaging embeddings (Paragram)
    trained with a compositional objective (Wieting+ 2015). and
  1. Skip-Thought embeddings (ST) (Kiros+ 2015).

* First, before testing actual indicators of composition, as a sanity check we
  tested whether classifiers could be trained to recognize the simple
  _presence of a given lexical item_, specifically school. As expected, we see
  that all three models are able to perform this task with 100% accuracy,
  suggesting that this information is wellcaptured and easily accessible
* sentences containing a token in the category of “human”. To test for
  generalization across the category, we ensured that no human nouns appearing
  in the test set were included in training sentences. All three models reach
  a high classification performance on this task, though Paragram lags behind
  slightly.
* preliminary experiment pertaining to an actual indicator of composition: _se-
  mantic role_
  * Note that with sentences of this level of simplicity, models can plausibly
    use fairly simple order heuristics to solve the classification task, so a
    model that retains order information (in this case, only ST) should have a
    good chance of performing well. Indeed,
  * we see that ST reaches a high level of performance, while the two
    averaging-based models never exceed chancelevel performance.

# 5 Discussion

selectional preference modeling (Resnik, 1996; Erk, 2007; Séaghdha, 2010).
