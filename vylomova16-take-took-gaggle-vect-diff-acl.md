Take and Took, Gaggle and Goose, Book and Read:
  Evaluating the Utility of Vector Differences for Lexical Relation Learning
Ekaterina Vylomova, Laura Rimell, Trevor Cohn, and Timothy Baldwin
2016 acl

The dataset is available at http://github.com/ivri/DiffVec

# Abstract

* [we evaluate] the generality of the [vector offset method (DiffVec)]
  over a broader range of lexical relation types and
  different learning settings
    1. spectral clustering to induce word relations, and
    2. supervised learning to classify vector differences into relation types
* We find that word embeddings capture a surprising amount of information, and
  that, under suitable supervised training, vector subtraction generalises well
  to a broad range of relations,

# 1 Intro

* lexical relations is a fundamental task in many NLP applications including
  paraphrasing and generation, machine translation, and ontology building
  (Banko+ 2007; Hendrickx+ 2010)
* relational similarity prediction (Turney, 2006),
* we introduce a new, larger _dataset_ covering many well-known lexical
  relation types from the linguistics and cognitive science literature
* We then apply DIFFVECs to two new tasks:
  unsupervised and supervised relation extraction
  * First, we cluster the DiffVecs to test whether the _clusters_ map onto true
    lexical relations. We find that the clustering works remarkably well,
    although syntactic relations are captured better than semantic ones
  * Second, we perform _classification_ over the DiffVecs and obtain
    * remarkably high accuracy in a closed-world setting (over a predefined
      set of word pairs, each of which corresponds to a lexical relation in
      the training data). When we move to an
    * open-world setting including random word pairs the results are poor
      We then investigate methods for better attuning the learned class
      representation to the lexical relations, focusing on methods for
      automatically synthesising _negative instances_. We find that this
      improves the model performance substantially

# 2 Background and Related Work

* Relation learning in NLP includes relation extraction, relation
  classification, and relational similarity prediction
* Open Information Extraction paradigm
  * (Banko+ 2007; Weikum and Theobald, 2010),
  * also known as unsupervised relation extraction,
  * the relations themselves are also learned from the text (e.g. in the form
    of text labels)
* shared tasks (Girju+ 2007; Hendrickx+ 2010; Jurgens+ 2012)
* Distributional word vectors have been used for detection of relations
  * hypernymy (Geffet and Dagan, 2005; Kotlerman+ 2010; Lenci and
    Benotto, 2012; Weeds+ 2014; Rimell, 2014; Santus+ 2014) and
  * qualia structure (Yamada+ 2009)
  * adjective scales, e.g. hot—warm—cool— cold (Kim and de Marneffe 2013)
  * Fu+ (2014) similarly use embeddings to predict _hypernym_ relations,
    in this case clustering words by topic to show that hypernym DiffVecs
    can be broken down into more fine-grained relations
  * Neural networks have also been developed for joint learning of lexical and
    relational similarity, making use of the WordNet relation hierarchy
    (Bordes+ 2013; Socher+ 2013; Xu+ 2014; Yu and Dredze,
    2014; Faruqui+ 2015; Fried and Duh, 2015)
  * Makrai+ (2013) divide antonym pairs into semantic classes such as
    quality, time, gender, and distance, finding that for about two-thirds
    of antonym classes, DiffVecs are significantly more correlated than
    random
  * Necşulescu+ (2015) train a classifier on word pairs, using word
    embeddings to predict _coordinates, hypernyms, and meronyms_
  * Roller and Erk (2016) analyse the performance of vector concatenation and
    difference on the task of predicting lexical _entailment_ and show that
    vector concatenation overwhelmingly learns to detect _Hearst patterns_
    (e.g., including, such as)
  * Köper+ (2015) undertake a systematic study of morphosyntactic and
    semantic relations on word embeddings produced with word2vec (“w2v”
    hereafter; see §3.1) for English and German.  They test a variety of
    relations including word similarity, antonyms, synonyms, hypernyms, and
    meronyms, in a novel analogy task. Although the set of relations tested
    by Köper+ (2015) is somewhat more constrained than the set we use,
    there is a good deal of overlap

# 3 General Approach and Resources

* a range of methods have been proposed for composing word vectors
  * (Baroni+ 2012; Weeds+ 2014; Roller+ 2014),
  * in this research we focus exclusively on DiffVec
* we construct a dataset from a variety of sources,
  * focusing on lexical semantic relations (which are
    * less well represented in the analogy dataset of Mikolov+ (2013c)),
  * but also including morphosyntactic and morphosemantic relations

## Word Embeddings

* We ran a series of experiments on _normalised_ and unnormalised w2v models,
  and found that normalisation tends to boost results over most of our
  relations (with the exception of L EX S EM Event and N OUN Coll ). We leave
  a more detailed investigation of normalisation to future work

## Lexical Relations

* three broad categories: lexical semantic relations, morphosyntactic
  paradigm relations, and morphosemantic relations
* We constrained the relations to be binary and to have fixed directionality
* The final dataset consists of 12,458 triples `<relation, word 1 , word 2>`,
  comprising 15 relation types,
  * extracted from
    * SemEval’12 (Jurgens+ 2012),
    * BLESS (Baroni and Lenci, 2011), the
    * MSR analogy dataset (Mikolov+ 2013c), the
    * light verb dataset of Tan+ (2006a),
    * Princeton WordNet (Fellbaum, 1998),
    * Wiktionary, 5 and a
    * web lexicon of collective nouns, 6 as listed in Table 2. 7

# 4 Clustering

* the morphosyntactic paradigm relations (NOUN SP and the three VERB
  relations) are by far the easiest to capture. The lexical semantic rela-
  tions, on the other hand, are the hardest to capture for all embeddings
  * VERB 3 there was a single cluster consisting of around 90% of V ERB 3 word
    pairs. Most errors resulted from POS ambiguity, leading to confusion with
    V ERB N OUN in particular. Example V ERB 3 pairs incorrectly clustered
    are: (study, studies), (run, runs), and (like, likes)
  * V ERB Past , a single relatively pure cluster was generated, with minor
    contamination due to pairs such as (hurt, saw), (utensil, saw), and (wipe,
    saw). Here, the noun saw is ambiguous with a high-frequency past-tense
    verb
  * NOUN Coll , where the instances were assigned to a large mixed cluster
    containing word pairs where the second word referred to an animal,
    reflecting the fact that
    * most of the collective nouns in our dataset relate to animals, e.g
      (stand, horse), (ambush, tigers), (antibiotics, bacteria)

# 5 Classification

* For both [closed and open-world] settings, we further investigate whether
  there is a lexical memorisation effect for a broad range of relation types
  of the sort identified by Weeds+ (2014) and Levy+ (2015b) for
  hypernyms, by experimenting with disjoint training and test vocabulary

## Closed-world

* The PREFIX relation achieved markedly lower recall, resulting in a lower
  F-score, due to large differences in the predominant usages associated
  with the respective words
  * e.g., (union, reunion), where the vector for union is heavily biased by
    contexts associated with trade unions, but reunion is heavily biased by
    contexts relating to social get-togethers

## Open-world

* test set including word pairs drawn at random
* random pairs (have, works), (turn, took), and (works, started) were
  incorrectly classified as V ERB 3 , V ERB Past and V ERB 3Past, re-
  spectively. That is, the model captures syntax, but lacks the ability to
  capture lexical paradigms,

## OPEN-WORLD Training with Negative Sampling

* two types of negative distractors:
  * opposite pairs: generated by switching the order of word pairs,
  * shuffled pairs:
    * replacing w 2 with a random word w 2 0 from the same relation,
* higher F-scores, as shown in Figure 3,
  * other than for hypernyms (L EX S EM Hyper ) and prefixes (P REFIX )

## Lexical Memorisation

* To address this effect, we follow Levy+ (2015b) in splitting our
  _vocabulary_ into training and test partitions,
* Observe that the precision for the standard classifier decreases rapidly
  as more random word pairs are added to the test data. In comparison, the
  precision when negative sampling is used shows only a small drop-off,
  * This benefit comes at the expense of recall, which is much lower when
    negative sampling is used
    * At the maximum level of random word pairs in the test data, the F-score
      for the negative sampling classifier is higher

# 6 Conclusions

* This paper is the first to test the generalisability of the vector
  difference approach across a broad range of lexical relations (in raw number
  and also variety)
