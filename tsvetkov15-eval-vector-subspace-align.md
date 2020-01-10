Yulia Tsvetkov Manaal Faruqui Wang Ling Guillaume Lample Chris Dyer
Evaluation of Word Vector Representations by Subspace Alignment
2015

script and linguistic vectors
https://github.com/ytsvetko/qvec

#Abstract

* correlation with similarity judgments [often correlate poorly with
  performance] as features in downstream evaluation tasks
* We present QVEC
  * evaluation measure of the quality of word embeddings 
  * based on alignment to a matrix of features 
    extracted from manually crafted lexical resources
  * obtains strong correlation with performance of the vectors
    in a battery of downstream semantic evaluation tasks

#1 Introduction

* manually constructed “linguistic” word vectors
  * whose components have well-defined linguistic properties (§2)
* our measure favors recall since
  * vectors are typically used to provide features to downstream
  * intuition:
    meaningless dimensions in induced vector representations are less harmful
    than important dimensions that are missing
* correlation
  * We align dimensions in a distributional word vector model
    with the linguistic dimension vectors to
    maximize the cumulative correlation of the aligned dimensions (§3)
* standard (semantic) extrinsic evaluation benchmarks (§4)
* data
  * nine off-the-shelf word vector representation models
* extrinsic
  * high correlation (0.34 ≤ r ≤ 0.89) with the extrinsic tasks (§5)

#2 Linguistic Dimension Word Vectors

* we exploit an existing semantic resource—SemCor (Miller et al., 1993)
* we construct a set of linguistic word vectors,
* details are given in the rest of this section;
* table 1 shows an example of the vectors
* WordNet (Fellbaum, 1998, WN)
  * partitions nouns and verbs into [supersenses i.e.] coarse semantic cats
    (Ciaramita and Altun, 2006; Nastase, 2008)
  * 41 supersense types: 26 for nouns and 15 for verbs, for example,
    * NOUN.BODY, NOUN.ANIMAL, VERB.CONSUMPTION, or VERB.MOTION 
* SemCor is a WordNet-annotated corpus that captures, among others,
  * supersense annotations of WordNet’s 13 K noun lemmas and 6 K verb lemmas
* We construct term frequency vectors normalized to probabilities 
  for all nouns and verbs that occur in SemCor at least 5 times
  The resulting ... 4,199 linguistic word vectors has 41 interpretable columns

|---------|-------|-----|-------|
|WORD	    |ANIMAL	|FOOD	|MOTION |
|---------|-------|-----|-------|
|fish	    |0.68	  |0.31	|0.33	  |
|duck	    |0.16	  |0.00	|0.67   |
|chicken	|0.00	  |0.69	|0.00   |
