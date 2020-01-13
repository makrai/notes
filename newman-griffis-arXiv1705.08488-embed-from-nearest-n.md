Second-Order Word Embeddings from Nearest Neighbor Topological Features
Denis Newman-Griffis, Eric Fosler-Lussier
arXiv arXiv:1705.08488. 2017

ha fordítva mennének az élek?

# Intro

* Compressing this contextual information via neural language modeling gives
  representations that
  * retain some semantic and syntactic properties of the target words
    6. Tomas Mikolov, Wen-tau Yih, and Geoffrey Zweig. Linguistic Regularities in Continuous
    7.  William L. Hamilton, Jure Leskovec, and Dan Jurafsky
      Diachronic Word Embeddings Reveal Statistical Laws of Semantic Change
      2016 ACL
    8.  Oded Avraham and Yoav Goldberg
      The Interplay of Semantics and Morphology in Word Embeddings
      2017 eacl
  * large performance gains ... in downstream NLP systems 9, 10
* recent research on improving [embeddings as] features, by
  * modifying the contextual information used in training [11, 12], by
  * augmenting the embeddings with additional data relevant to the target task
    [13, 14], or
  * both [15]
* recent studies ... analyze exactly what is encoded in the [embedding] space
  [16, 17, 18]
  * features are notoriously difficult to interpret
  * Linzen [19] illustrated that in some semantic tasks,
    what matters most is neighborhood structure
* In this work
  * inducing a k–nearest neighbor graph from pre-trained embeddings
  * using recent methods for unsupervised graph embeddings to
    re-learn word representations from this graph
* [eval]
  * using these second-order embeddings in proven models for three ...  tasks:
    * named entity recognition, textual entailment, and paraphrase recognition
    * almost equivalent performance to the original word embeddings, and
      actually increases recall in some cases.  Furthermore, we show that
  * augmenting first-order embeddings with second-order information
    * can improve performance when used in non-linear models,
      especially on heterogeneous data
    * confuses linear models. Finally,
* we analyze the changes in the nearest neighborhoods of selected terms
  between first-order and second-order embeddings, and find that
  the second-order space is significantly denser
  than the original contextual embedding space

# 2 Related Work

## 2.1 Alternate features for training embeddings

* Levy and Goldberg [11] utilized syntactic dependencies as context, and found
  improved functional similarity and decreased topical sensitivity
* Morphological information about target and context words [for] language model
  * word level [20, 21, 22] and implicitly at the
  * character level [23]
* multilingual data has been extensively investigated for LM:
  * Upadhyay+ (2016 ACL) review ... multilingual corpora, while
  * Faruqui and Dyer [25] and Lu+ [26] used
    * canonical correlation analysis to learn cross-lingual embeddings
  * Vulić [15] combined multilingual corpora with syntactic dependencies in
    * improvements in both monolingual and cross-lingual tasks.  There has also
* augmenting [embeds] with information critical _to specific downstream tasks_
  * Faruqui+ [13], Mrks̆ić+ [27], and Kim+ [14] enrich
    pre-trained embeddings with semantic knowledge via lexical constraints
  * Tsvetkov+ [28]
    * tailoring the learning curriculum or embedding training to [the] tasks
  * Rothe+ [29] project pre-trained embeddings into task-specific subspaces
* Yatbaz+ (2012 acl) use second-order contexts
  in the form of possible lexical substitutions for word representations;
  * Melamud+ [31, 32, 10] adapt this approach for embedding learning, by
    using lexical substitutions to incorporate the joint contexts of two words
    and extend contextual information in training

## 2.2 Absolute positioning in the embedding space

* correlations between individual dimensions ... and semantic groupings
  16. Alona Fyshe, Leila Wehbe, P P Talukdar, Brian Murphy, and Tom M Mitchell
      A Compositional and Interpretable Semantic Space
      2015 naacl
  33. Manaal Faruqui, Yulia Tsvetkov, D Yogatama, Chris Dyer, and Noah A Smith
      Sparse Overcomplete Word Vector Representations
      2015 acl
* as well as with predictive outcomes
  17. Jiwei Li, Xinlei Chen, Eduard Hovy, and Dan Jurafsky
    Visualizing and Understanding Neural Models in NLP
    2016 naacl
  18. Jiwei Li, Will Monroe, and Dan Jurafsky
    Understanding Neural Networks through Representation Erasure
    arXiv preprint arXiv:1612.08220, 2017
* Li+ (2016 emnlp) demonstrated
  * sensitivity of neural NLP models to noise in the input space, and present
  * regularization methods for compositional models
    to more robustly handle perturbations in input
* variability in the reliability of semantic and syntactic information
  as encoded linearly in the vector space
  35. Billy Chiu, Anna Korhonen, and Sampo Pyysalo
    Intrinsic Evaluation of Word Vectors Fails to Predict Extrinsic Performance
    2016 repeval
  36. Anna Gladkova, Aleksandr Drozd, and Satoshi Matsuoka
    Analogy-based Detection of Morphological and Semantic Relations With Word
    Embeddings: What Works and What Doesn’t
    2016 NAACL
  37. Aleksandr Drozd, Anna Gladkova, and Satoshi Matsuoka
    Word Embeddings, Analogies, and Machine Learning: Beyond king - man + woman
    COLING 2016
* Linzen (2016 repeval) illustrated that many of the successes on similar tasks
  have relied more on nearest neighborhood structure
  than consistent affine transformations

# 3 Second-order embeddings

* graph: directed edge (v, w) is added for each w ∈ NN_v^k
* node2vec (Grover and Leskovec. 2016)
  * method for learning unsupervised embeddings of graphs nodes
    based on weighted random walks,
* our graph induction step can be adjusted to accommodate multiple samples of
  nearest neighborhoods for each word,
  to make it more robust to random initializations
  With sample embedding sets V, we can k calculate the nearest average weight

# 4 Exper

* for the first two tasks, we use deep and highly non-linear neural models,
* the model for paraphrase recognition is a simple logistic regression
* word2vec [4] for 10 iterations, with vector dimensionality of 100,
  window size of 8, and minimum word frequency of 4
* To induce the nearest neighbor graph, we choose k = 10
  * varying the neighborhood size k to k ∈ {5, 25}
* node2vec
  * [dimensionality] of 100; all other settings are node2vec defaults
  * three samples in the graph induction step

## 4.1 NER

* We adopt the NER system of Lample+ [40], which is
  * based on a bidirectional long short-term memory (LSTM) network with a
  * conditional random field (CRF) over the output layer. 3 They use
  * character embeddings,
* broken down by named entity type, shown in Table 3. Most strikingly,
  * nearest neighbor information is critical for recognizing MISC entities,
    * 8.4% absolute increase in precision
    * Recall on MISC falls slightly
  * converse pattern emerges for PER entities
  * ORG and LOC are less clear, with small variations in precision and recall

## 4.2 Recognizing textual entailment

* Stanford Natural Language Inference (SNLI) dataset [42]. The dataset consists
  * 570,152 sentence pairs
  * label entailment, contradiction, or neutral
    * roughly equally distributed
* the Long Short-Term Memory Network model proposed by Cheng+ [43],
  We ... compare second-order embeddings with skip-gram embeddings as
  pre-initialization
* increase in overall performance when augmenting skip-gram embeddings with
  second-order information
  * concatenating skip-gram with a single k = 10 second-order embedding
    decreases performance, but using multiple samples or different settings for
    k show equivalent or superior performance

## 4.3 Paraphrase recognition

* Microsoft Research Paraphrase Corpus (MSRPC) [44], consisting of
  5,801 sentence pairs (67%)
* methodology of Blacoe and Lapata [45]
  * represent each sentence as the sum of the embeddings of its in-vocabulary
    words;
    * We also experimented with the alternative
      point-wise multiplication: impractical for all but the shortest sentences
  * our results mirror their findings
  * the feature vector for a sentence pair is then either the
    concatenation or difference of the two sentence embeddings
  * For classification, we use logistic regression as implemented in LIBLINEAR
* Table 5

## 4.4 Neighborhood analysis

* Qualitatively,
  * unrelated nearest neighbors in the first-order space
    lead to unrelated nearest neighbors in the second-order space, while
  * highly related neighbors stay nearby.  In a
* quantitative analysis
  * We took the 10 words in each of the first-order and second-order embedding
    spaces with maximal or minimal average similarity to its nearest neighbors,
  * the second-order space is strikingly denser than the first-order space: the
    * lowest pairwise similarity of a word to one of its nearest neighbors
      in the second-order space is 0.75, in contrast to
      0.24 in the first order space.  Moreover,
    * already dense areas of the first-order space become appreciably denser,
      with all 100 of the top pairwise similarities clustering around 0.999

# 5 Discuss

* On the NER task, the
  * distinct increase in precision for MISC entities
    (which are highly heterogeneous in their textual realizations), and a
  * large drop in precision for the much more consistent PER category,
  * suggest that the second-order embeddings
    * handle variance in textual patterns more effectively, but
    * loss of specificity
* reflected as well in the paraphrase recognition results, where
  second-order representations trade lower precision for higher recall
* aligning the [1st and 2nd order] signals with a linear transformation is a
  challenge
