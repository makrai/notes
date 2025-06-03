Dániel Lévai, András Kornai
The impact of inflection on word vectors
MSZNY 2019

# Abstract 249

* We present a method to evaluate the [coherence (self-similarity) and]
  similarity of [morphological] word vector clusters
* Because of the high dimension, naive statistical testing of the distances
  from [of?] the mean does not produce easily interpretable results

# 1 Introduction

# 2 Methods

* derivation does not concern us in this paper, and we used the <> sign
* The model was generated using the surface forms only and
  morphological analyses were assigned to the words subsequently. In the
* we can project the vectors to the unit sphere without great loss of info
  * strong correlation (ρ = 0.939) between the log-frequency and the length of
    [as] in Arora (2016) (Fig. 2)
* we use a set of 200000 uniformly distributed random vectors as a baseline
  for comparing to the actual word vectors
* skip-gram model prefers placing the words in a specific part of space
  (Mimno EMNLP 2017)
  * [we] count the relative frequency of each coordinate being positive, then
    plotting these numbers in an ascending order
  * Fig. 3 shows that some coordinates are highly likely to be positive and
    others negative, whereas for a random set of points the line would be flat

# 3 The statistics of grammatically defined clusters 251

* Visualizing high-dimensional data is a difficult exercise [13]
  Grinstein, G., Trutschl, M., Cvek, U.:
  High-dimensional visualizations
  Visual Data Mining Workshop, KDD 2, 120. (2002)
* We use principal component analysis
  * fig 4: Plotting a sample of 1000 vectors from the spherical projection of the
    first 3 principal components of some clusters of word vectors
    * we have 3 clusters each restricted to a dominant orthant.  What we need to
      verify is that this phenomenon persists in the whole 200-dimensional space
* comparing the standard deviations and the entropy of the clusters. If a
  * mit ért egy klaszter std-je és entrópiája alatt?

# 4 Quantifying similarity 253

* Here we [introduce] a similarity measure between sets of vectors on the sphere
* we begin with the definition of a cap (vectors at a small angle to an axis):
* To measure the compactness of clusters, we use an
  * increasing cap [jobbról]
    * [/Num|Digit][Nom] shows the strongest coherence, which seems intuitive,
    * UNKNOWN cluster shows high coherence, as it is dominated by nouns
    * The [/V][Prs.NDef.3Sg] cluster show the same coherence as the [/N][Acc]
    * [/Adj][Nom] cluster shows lower coherence than any non-random cluster
  * ratio of the [in and out-cluster] words in a cap α with fixed α
    * [choosing alpha;] on Fig. 8, we show the ratios with that corresponding
      to RANDOM subtracted
      * maximal difference to be around cos(α) = 0.13
    * sim(C_1, C_2) = what ratio of C_2 is in the cap of C_1

# 5 The role of affix frequency 255

* We begin by examining the clusters based on their case endings
  * the more specific case endings like [/Adj][Transl] and [/Adj][Temp]
    (translative and temporal case for adjectives) show higher self-similarity,
    while the more general ones like [/Adj][Nom] and [/Adj][Supe] (nominative and
    superessive) show lower self-similarity
  * [similar] with the cases affixed to nouns, where [/N][All] and [/N][Transl]
    (allative and translative) are among the highest self-similarity cases and
    [/N][Nom] has one of the lowest self-similarity from the paradigm
* clusters that are more frequent or have higher entropy
  * We partitioned the clusters into 20 equal bins by their standard deviation,
  * very coherent
    * nouns, be they plural or singular, form highly coherent clusters
    * infinitive and plural third person verbs
      * [note that] verbs in general did not show strong coherence

# 6 Asymmetrical similarity 257

* [how asymmetric]
  * When comparing not round-shaped clusters, this way of measuring similarity
    introduces asymmetry
    * mi köze az asymmetrynek a roundnesshez?
  * Plotting a histogram of the differences sim(C 1 , C 2 ) − sim(C 2 , C 1 )
    shows a distribution quite close to normal [and low std]
  * [example for The tails] is the pair of
    [/N|Pro][Subl][1Sg] énrám, reám, rám, énreám, 42228 occurrences
    [/N|Pro][3Pl][Dat]< >[/N|Pro][Poss.3Pl][Dat]    545 occurrences
    némelyiküknek, valamelyiküknek, mindegyiküknek, bármelyiküknek

In the following sections [we symmetrize] the similarity measure

## 6.1 Subcategories [ for adjectives, nouns and numbers]

* If some subcategories show high similarity, we can say that it is not worth
  preserving as separate categories
* In [/Adj], We can see a declining similarity when comparing more and more
  specific clusters, with the
  [/Adj|col][.] (adjectives describing colors) and
  [/Adj|nat][.] (adjectives describing nationality) being relatively similar to
  [/Adj][.], while
  [/Adj|Pro][.] (pronominal adjectives) and especially the
  [/Adj|Pro|Rel] (relative pronouns) show significantly less similarity. As we
  * treating [/Adj|Pro|Rel] as a subcategory of [/Adj] shows to be mistake
* [for] plural adjectives, the similarities are significantly higher than their
  singular counterparts’ similarities

## 6.2 Paradigm self-similarities

[itt már egyáltalán nem értem]

# 7 Conclusions and further research

* future work may also include
  * using disambiguated text corpus to have bigger clusters thus more data to
  * supervised methods for creating meaningful ultradense subspaces for
    polarity, concreteness, frequency and part-of-speech (POS) [15,16],
    support- ing operations like ‘give me a neutral word for greasy’. We plan
    on analyzing the POS subspace, comparing the similarities of the clusters
    projected onto the subspace with the similarities obtained without
    projection

# Acknowledgment 260
