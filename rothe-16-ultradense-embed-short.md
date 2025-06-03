Sascha Rothe and Hinrich Schütze
Word Embedding Calculus in Meaningful Ultradense Subspaces
2016 ACL (hivatkozik az NAACL-esre)

* test sets and word embeddings: http://www.cis.lmu.de/~sascha/Ultradense/
* implementation by someone else: https://github.com/joemzhao/ultradensifier

# Abstract

* We decompose a standard embedding space
  into interpretable orthogonal subspaces and a “remainder” subspace
* four interpretable subspaces in this paper:
  * polarity, concreteness, frequency and part-of-speech (POS) subspaces
* calculus for subspaces that supports operations like
  * “-1 × hate = love” and
  * “give me a neutral word for greasy” (i.e., oleaginous)
  * extends analogy computations like “king − man + woman = queen”
* tasks of
  * Antonym Classification and POS Tagging
  * our method outperforms the state of the art
  * test sets for
    * Morphological Analogies and for
    * the new task of Polarity Spectrum Creation

# 1 Intro

* antonyms are often interchangeable in context and thus have
  similar word embeddings even though they denote opposites
* we use DENSIFIER (Rothe+ 2016) to
  decompose a standard embedding space into interpretable orthogonal subspaces
* Similar to polarity, we explore other interpretable subspaces and do
  operations such as: given a
  * concrete word like _friend_, find the abstract word _friendship_;
  * frequent word _friend_, find a less frequent synonym like _comrade_;
  * noun _friend_, find the verb _befriend_ (POS)

# 2 Word Embedding Transformation

* an overview of DENSIFIER; see Rothe+ (2016) for details
  * Let Q ∈ R^{d×d} be an orthogonal matrix that
    transforms the original word embedding space into a space in which
    certain types of information are represented by a small number of dims
  * orthogonality can be seen as a hard regularization of the transformation
* By choosing an orthogonal and thus _linear_ transformation we also assume:
  the information is already encoded linearly in the original word embedding
  * a frequent assumption, as we generally use the vector addition
* Concretely, we learn Q such that the
  * dimensions `D_p` of the resulting space correspond to a word’s polarity
    * the ... remaining dimensions correspond to non-polarity information
  * Analogously, the sets of dimensions `D_c`, `D_f`and `D_m`correspond to a
    word’s concreteness, frequency and POS (or morphological) information,
  * In this paper, we assume that these properties do not correlate and
    therefore the ultradense subspaces do not overlap
  * the orthogonal complement of all trained subspaces
    * includes the not classified information, e.g., genre information
    (e.g., “clunker” is a colloquial word for “automobile”)
* training, the orthogonal transformation Q we assume we have a lexicon
  * Let `L_{!~}^*` be a set of word index pairs (v, w) with different labels,
    e.g., positive/negative, concrete/abstract or noun/verb
    * We want to maximize the distance for pairs in this group (2)
  * Another goal is to minimize the distance of two words with identical
    labels (3)
  * Eq. 2 is weighted with `α^*` and Eq. 3 with `1 − α^*`
  * batch gradient descent where
    each batch contains the same number of positive and negative examples
    * This means the number of examples in the lexica – which give rise to more
      negative than positive examples – does not influence the training

# 3 Setup and Method 2

* We use pretrained 300-dimensional English word embeddings (W2V)
* To train the transformation matrix
  * for polarity, a combination of
    * MPQA (Wilson+ 2005),
    * Opinion Lexicon (Hu and Liu, 2004) and
    * NRC Emotion lexicons (Mohammad and Turney, 2013)
  * for concreteness, BWK, a lexicon of 40,000 English words (Brysbaert+ 2014)
  * for frequency, the order in the word embedding file
  * for POS, the training set of the FLORS tagger (Schnabel and Schütze, 2014)
* embedding calculus
  * `antonym(v) = nn( u_v − 2 u_v^p )`
    * our hypothesis is that antonyms are usually very similar
      * they differ on a single “semantic axis,” the polarity axis
      * See discussion/experiments below for exceptions
      * ez mitől antonimia?
  * `neutral(v) = nn( u_v −  u_v^p )`
  * `spectrum(v) = {nn( u_v + x \cdot  u_v^p ) | \forall x ∈ R}`
  * “word v with POS of word w”: `POS_w (v) = nn( u_v −  u_m v +  u_w )`

# 4 Evaluation 3

## Antonym Classification

* We evaluate on Adel and Schütze (2014)’s data; the
  * task is to decide for a pair of words whether they are antonyms or synonyms
  * 2,337 positive and negative pairs each
  * split into 80% training, 10% dev and 10% test
  * [positive/negative both collected] from the nearest neighbors of the word
    embeddings to make it hard to solve the task using word embeddings
* We train an SVM (RBF kernel) on ... the three cosine distances in: the
  polarity subspace; the orthogonal complement; and the entire space
  * improvement of precision is minor (.76 vs. .75), but
    recall and F 1 improve by a lot (+.30 and +.16)
  * melyik cimke a pozitív? gondolom, az antonym

## Polarity Spectrum Creation

* PSC-SET: Given a query word how well can we predict a spectrum?
* PSC-ORD: How good is the order in the spectrum?
* Our gold standard is Word Spectrum, included in the Oxford American Writer’s
  Thesaurus (OAWT) and therefore also in MacOS
* We look for words that are also present in Adel and Schütze (2014)’s Antonym
  Classification data and retrieve 35 spectra
* PSC-ORD:
  * The best one, beautiful ↔ ugly, is given as an example
  * The worst performing spectrum is fat ↔ skinny (ρ = .13)
    * presumably because both extremes are negative, contradicting our modeling
      assumption that spectra go from positive to negative
      We test this hypothesis by separating the spectrum into two subspectra
      We then report the weighted average correlation of the optimal
      separation. For fat ↔ skinny, this improves ρ to .67

## Morphological Analogy

* derivational forms from WordNet (Fellbaum, 1998)
  * We discard words with ≥2 derivational forms of the same POS
  * most frequent 30,000
* We then randomly select
  * 26 pairs for every POS combination for the dev set and
  * 26 pairs for the test set
* example of the type of equation we solve here is

      prediction − predict + symbolize = symbol (from the dev set)

* W2V embeddings are our baseline
* POS(prediction) + Semantics(symbolize) with
  * POS(v) being  `u_v^m` and
  * Semantics(v) being  `u_v −  u_v^m`
* The dev set indicates that a 8-dimensional POS subspace is optimal

## POS Tagging

* FLORS (Schnabel and Schütze, 2014), a state-of-the-art POS tagger which was
  extended by Yin+  (2015) with word embeddings as additional features
  * W2V gives us a consistent improvement on OOVs (Table 3, line 4)
  * However, training this model requires about 500GB of RAM. When we use the
* 8-dimensional UD embeddings (the same as for Morphological Analogy), we
  * outperform W2V except for a virtual tie on news (Table 3, line 5)
  * need 100GB of RAM,

# 5 Related Work

* antonyms having similar embeddings
  * in Yih+ (2012), the antonym is the inverse of the entire vector
  * Schwartz+ (2015) present a method that switches an antonym parameter on or
    off (depending on whether a high antonym-synonym similarity is useful for
    an application) and learn multiple embedding spaces
* unsupervised approach using linguistic patterns
  * ranks adjectives according to their intensity (de Melo and Bansal 2013)
  * Sharma+ (2015) present a corpus-independent approach for the same problem
* Weinberger and Saul (2009)
  * resemblance to us
    * supervised learning on a set of desired (dis)similarities
    * can [be though of] as learning specialized metrics for particular
      subtypes of linguistic information or particular tasks
  * Using the[ir method], one could
    * learn k metrics for k subtypes of information and then simply
      represent a word w as the concatenation of (i) the original embedding and
      (ii) k representations corresponding to the k metrics
    * In case of a simple one-dimensional type of information, the
      corresponding representation could simply be a scalar
    * this approach [should] have similar advantages for practical applications
    * our orthogonal transformation of the original space [is] more elegant and
      it gives rise to a more compact representation
