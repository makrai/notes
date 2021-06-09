A Coenen, E Reif, A Yuan, B Kim, A Pearce, F Viégas, M Wattenberg
Visualizing and Measuring the Geometry of BERT
arXiv:1906.02715 [cs.LG]

# Abstract

* [there seem to be] separate semantic and syntactic subspaces
* fine-grained geometric representation of word senses
* syntactic representations in attention mxs and individual word embeddings
* mathematical argument to explain the geometry of these representations

# 1 Intro

* which features are extracted [by BERT], how is this information represented?
* Similar questions [with] convolutional neural networks [10, 9]
  * how representations change from layer to layer [28]
  * individual units in a network may have meaning [3]
  * “meaningful” directions exist in the space of internal activation [8]
  * linguistic structure [2, 7, 11, 21, 25]
  * Syntactic features [extracted by RNNs [2, 11] and] BERT [25, 24, 12, 21]
  * geometric representation of entire parse trees in BERT’s activation space
    * Inspirational work from Hewitt and Manning [7]
    * squared-distance tree embedding
* Our work:
  * how BERT represents syntax
    * attention matrices contain grammatical representations
    * certain directions in space representing particular dependency relations
    * mathematical arguments that may
      explain the particular form of the parse tree embeddings described in [7]
  * semantics: BERT distinguishes word senses at a very fine level
    * much of this [information] encoded in a relatively low-dim subspace
    * mistakes in word sense disambiguation may correspond to
      changes in internal geometric representation of word meaning

# 2 Context and related work 2

* BERT model introduced in [6]. [We] set context and terminology:
  * input to BERT is based on a sequence of tokens (words or pieces of words)
  * output is a sequence of vectors, one for each input token, context embeds
  * internals consist of two parts
    * initial embedding for each token is created by
      combining a pre-trained wordpiece embed with position and segment info
    * initial sequence of embeddings is run through multiple transformer layers
      producing a new sequence of context embeddings at each step
      * two versions, a 12-layer BERT-base model and a 24-layer BERT-large
    * in each transformer layer is a set of attention matrices,
      one for each attention head,
      each [head] contains a scalar value for each pair (token_i , token_j)

## 2.1 Language representation by neural networks

* [related work on] the internal states of RNN-based models have shown that
  [RNNs] represent information about soft hierarchical syntax
  * can be extracted by a one-hidden-layer network [11]
* [from] full-sentence embeddings, a wide variety of syntactic properties could
  be extracted not just by an MLP, but by logistic regression [4]
* context embeddings in BERT and related models
  contain enough information to perform [tasks in the] “NLP pipeline” [24]
  –tagging part-of-speech, co-reference resolution, dependency labeling, etc–
  with simple classifiers (linear or small MLP models) [25, 21]
* visualization-based work [27] suggests
  attention matrices may encode important relations between words
* direct representation of a dependency parse tree (Hewitt & Manning [7])
  * a single global linear transformation [termed] a “structural probe”
  * square of the distance between context embeddings is roughly proportional
    to tree distance in the dependency parse. They ask
    * why squaring distance is necessary; we address this question in sec 3
* two motivating questions for our research
  * other examples of intermediate representations?
  * geometric perspective, how do all these [information coexist in a] vector?

# 3 Geometry of syntax 2

* [we build] on the work by Hewitt and Manning [7] in two ways
  * whether attention matrices encode syntactic features
  * a simple mathematical analysis of the tree embeddings that they found

##  3.1 Attention probes and dependency representations

* attention probe, an analog of edge probing [25]
  * a pair of tokens, `(token_i , token_j)`
  * input is a model-wide attention vector
    formed by [concating every attention matrix from every] head in every layer
  * goal is to classify a given relation between the two tokens with a linear m
    * identifying the existence and type of dependency relation

###   3.1.1 Method 3

* corpus of parsed sentences from the Penn Treebank [14]
  * filtered [to] the 30 dependency relations with more than 5,000 examples in
  * ran each sentence through BERT-base, and obtained the model-wide attention
    vector (see Figure 1) between every pair of tokens in the sentence,
* two L2 regularized linear classifiers via stochastic gradient descent
  1. linear binary classifier to predict ... the existence of a dependency rel
    * trained with a balanced class split, and 30% train/test split. The second
  2. multiclass classifier to predict [the type of the] dependency relation
    * trained with distributions outlined in table 2

###   3.1.2 Results

* binary probe achieved an accuracy of 85.8%, and the
* multiclass probe achieved an accuracy of 71.9%
* success [suggests that syntactic information is] encoded in the attention vcs

##  3.2 Geometry of parse tree embeddings 3

##    3.2.1 Mathematics of embedding trees in Euclidean space

* Hewitt and Manning ask
  * why parse tree distance [corresponds] specifically to the _square_ of Eucl
  * whether some other metric might do better [7]
  * We describe math reasons why squared Euclidean distance may be natural
    * one cannot generally embed a tree, with its tree metric d, isometrically
      into Euclidean space (Appendix 6.1). Since an isometric embedding is
      impossible, motivated by the results of [7] we might ask about other
      possible representations
    * Theorem 1. Any tree with n nodes has a power-2 embedding into R^{n−1}
    * Theorem 2. For any p < 2, there is a tree which has no power-p embedding
    * power-2 tree embeddings ... may be a useful alternative to hyperbolic geo
      [19] Maximillian Nickel and Douwe Kiela
      Poincaré embeddings for learning hierarchical representations
      NIPS 2017

###   3.2.2 Visualization of parse tree embeddings 4

* compare [parse tree embeddings in BERT] to exact power-2 embeddings?
  * layer 16 (following [7]),
    transformed by the Hewitt and Manning’s “structural probe” matrix B,
    yielding a set of points in 1024-dimensional space
  * used PCA to project to two dimensions
    * t-SNE and UMAP [16], were harder to interpret
* whether the difference between these projected trees and the canonical ones
  is merely noise, or a more interesting pattern. By looking at the
  * average embedding distances of each dependency relation (see Figure 3)
    * vary widely from around 1.2 (compound:prt, advcl)
    to 2.5 (mwe, parataxis, auxpass): systematic differences

# 4 Geometry of word senses 5

##  4.1 Visualization of word senses 6

* sentences [from] the introductions to English-language Wikipedia articles
  * interactive application. A user enters a word. 1,000 sentences. BERT-base
  * visualizes 1,000 context embeddings using UMAP [16]
  * e.g. _die_
    * crisp, well-separated clusters: German article, be killed, game tool
    * within one of these clusters there is a kind of
      quantitative scale, related to the number of people dying
* two immediate questions. First, is it possible to find
  * quantitative corroboration that word senses are well-represented?
  * seeming contradiction: position represented syntax or semantics?

##  4.2 Measurement of word sense disambiguation capability

* a simple classifier on these internal representations [for] WSD
  * procedure described in [21]: a similar experiment with the ELMo model
    * ME Peters, M Neumann, M Iyyer, M Gardner, C Clark, K Lee, L Zettlemoyer
      Deep contextualized word representations
      arXiv preprint arXiv:1802.05365,
  * nearest-neighbor classifier: centroid[s] of a given word sense’s BERT-base
    embeddings in the training data
  * data and evaluation from [22]:
    * training data was SemCor [18] (33,362 senses), and the
    * testing data was the suite described in [22] (3,669 senses)
* achieves an F1 score of 71.1, higher than the current state of the art
  * accuracy monotonically increasing through the layers
  * an even higher score of 71.5 was obtained using the technique in next sec

### 4.2.1 An embedding subspace for word senses? 7

* hypothesized: a linear transformation under which distances between
  embeddings would better reflect their semantic relationships
* we trained a probe following Hewitt and Manning’s methodology
  * initialized a random matrix B ∈ R k×m , testing different values for m
  * Loss is,
    * roughly, defined as the difference between the average cosine similarity
      between embeddings of words with different senses, and that between
      embeddings of the same sense
    * we clamped the cosine similarity terms
      to within ±0.1 of the pre-training averages for same and different senses
      * Without clamping, the trained matrix simply ended up taking
        well-separated clusters and separating them further)
      * [clamping values tested] between 0.05 and 0.2
  * corpus was the same dataset from 4.1.2., filtered to ambiguous words
    * each [sense] with at least two occurrences
      (for 8,542 out of the original 33,362 senses)
  * Embeddings came from BERT-base (12 layers, 768-dimensional embeddings)
  * evaluat[ion on the] WSD task used in 4.1.2 (Table 1)
  * control: random probe of the same shape
  * untransformed BERT embeddings achieve a SOTA accuracy rate of 71.1%
  * trained probes ... achieve slightly improved accuracy down to m = 128
  * layers
    * only a modest improvement in accuracy for final-layer embeddings
    * more dramatically improve the performance of embeddings at earlier layers
      * there is [much] semantic information in the geometry of earlier-layers
* word sense information may be contained in a lower-dimensional space
  * a resolution to the seeming contradiction mentioned above
  * syntax and semantics ... in separate complementary subspaces

##  4.3 Embedding distance and context: a concatenation experiment

* influence context embedding positions by systematically varying the context
  * concatenating sentences where the same word is used in different senses

###   4.3.1 Method

* 25,096 sentence pairs from SemCor, using the same keyword in different senses
  A: He thereupon _went_ to London and spent the winter talking to men of w
  B: He _went_ prone on his stomach, the better to pursue his examination
* each individual sentence in the pair to BERT-base
  * cosine similarity between the keyword embeddings and matching/opposing cent
  * ratio between the two similarities the individual similarity ratio
    * Generally ... greater than one: closer to the matching centroid
  * We joined each sentence pair with the word _and_
  * concatenated similarity ratio
  * [contror: Concatenating a random sentence]

###   4.3.2 Results 8

* projecting the final-layer keyword embeddings into the semantic subspace
  discussed in 4.1.3
  * i.e. multiplying each embedding by our trained semantic probe
  * higher ratio, lower average misclassification rates

# 5 Conclusion and future work

* future research
  * What other meaningful subspaces exist?
  * what the geometry can tell us about the specifics of the transformer

# Appendix 10

## 6.1 Embedding trees in Euclidean space

## 6.2 Ideal vs. actual parse tree embeddings

## 6.3 Additional BERT parse tree visualizations

## 6.4 Additional word sense visualizations

## 6.5 Dependency relation performance 14

## 6.6 Semantic probe performance across layers 15
