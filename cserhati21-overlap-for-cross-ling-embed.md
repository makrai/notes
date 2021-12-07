Identifying the Importance of Content Overlap for Better Cross-ling Embed Mappn
Réka Cserháti, Gábor Berend
1st Workshop on Multilingual Representation Learning EMNLP | MRL 2021

our codes, mapping dictionaries, and more mapping results are available at
https://github.com/xerevity/mappability

# Abstract

* we analyze cross-lingual word embedding models created by mapping-based align
* We use several measures of corpus and embedding similarity to
  predict Bilingual Lexicon Induction (BLI) scores of cross-lingual embedding
  * over three types of corpora, three embedding methods and 55 language pairs
* results corroborate that instead of mere size, the amount of common content
  in the training corpora is essential. This phenomenon manifests in that
  * despite of the smaller corpus sizes, using only the comparable parts of
    Wikipedia for training the monolingual embedding spaces to be mapped is
    often more efficient than relying on all the contents of Wikipedia,
  * the smaller, but less diversified Spanish Wikipedia works almost always
    much better as a training corpus for bilingual mappings than the
    ubiquitously used English Wikipedia

# Intro

* static word embeddings vs large pre-trained language models
  * extensive applicability, e.g. for low-resource languages or special domain
    (e.g.  medical) data
  * significantly lower resource requirements (Strubell+ 2019) and
  * often competitive results (Litschko+ 2021)
    * Robert Litschko, Ivan Vulic, Simone Paolo Ponzetto, and Goran Glavas
      Evaluating multilingual text encoders for unsup cross-lingual retrieval
      ECIR 2021, Virtual Event, March 28--April 1, 2021, Proceedings, Part I,
  * a large proportion of industrial NLP applications is still based on static
    (Arora+ 2020)
* multilingual mappings still extremely dependent on the mapping scenario
  (Søgaard+ 2018; Vulić+ 2019, 2020)
  * attributed to typological differences, domain differences in the corpora,
    insufficient resources, and under-training
    (Doval+ 2020; Søgaard+ 2018; Vulić+ 2020)
* We rely on popular bilingual alignment methods, and conduct a thorough
  analysis of the connection between the evaluation scores of the mappings and
  * language relatedness,
  * isomorphism of the source embeddings measured by several metrics, and
  * corpus properties, some newly identified, easy to calculate ones that are
    highly predictive of the bilingual mapping performance
    * token overlap ratio in the vocabularies, and the
      * Most of these shared tokens are probably words of foreign origin,
    * distance between word distributions of the corpora
    * These combined with corpus size surpass existing isomorphism measures
* from the related work section
  * we show that corpus similarity is one of the key factors
    in both supervised and unsupervised cases
  * two corpora of sufficient size, coming from the same domain (Wikipedia)
    can still be too different for good mapping scores, while
    good mappings are possible on relatively small corpora if other conds met

# 2 Related Work

## 2.1 Mapping Algorithms

* bilingual models using linear transformations (Mikolov+ 2013a)
  * minimizing the squared euclidean distance of word pairs from a seed dict
* works improved this mapping method
  * Xing+ (2015) normalize the source and target embeddings, and constrain the
    mapping to be orthogonal
  * Artetxe+  (2016) center the mean, and find the transformation in closed
    form, solving a least squares problem
  * Artetxe+ (2018a) proposed a multi-step framework consisting of
    mean-centering, normalization, whitening, and an orthogonal transformation
  * RCSLS (Joulin+ 2018) is based on relaxing the orthogonal restriction and
    returning to stochastic gradient descent with a different loss function,
    aiming to be consistent with the CSLS (Cross-domain Similarity Local
    Scaling; Conneau+ 2018) retrieval method
* unsupervised way
  * Conneau+ (2018) is based on adversarial learning
    * The first really successful solution
  * Artetxe+ (2018b) proposed an iterative self-learning method
    initialized by sorting embedding values
  * and Non-adversarial Translation by Hoshen and Wolf (2018) also uses
    self-learning, but a different method, initialized using PCA

## 2.2 Analysis of Cross-Lingual Word Embeddings

* Kementchedjhieva+ 2019; Glavaš+ 2019; Vulić+ 2019
* why some settings do not work well (also investigated)
  * Søgaard+ (2018)
    * the isomorphic assumption does not hold in many cases, and report
      * shown with eigenvector similarity of nearest neighbor graphs
    * negative effect of language and domain dissimilarity
      on the unsupervised embedding alignment method of Conneau+ (2018)
* Vulić+ (2020): small corpora and under-training also play a significant role
  in non-isomorphism of word embeddings
* Dubossarsky+ (2020): suggest some new measures to quantify transferability of
  embedding spaces based on their spectral statistics
  * how similar their singular values are on the one hand, and
  * their individual robustness measured by condition numbers, on the other hand
    * the condition number of a function measures how much f(x) can change for
      a small change in the input argument. This is used to measure how
      sensitive a function is to changes or errors in the input, and how much
      error in the output results from an error in the input

# 3 Experimental Setup

## 3.1 Corpora

* embeds trained on three types of corpora, all of them extracted from Wikiped
  * L, loosely comparable, L-Wiki
    * We use the full Wikipedia texts of our 11 languages studied:
    * Czech, Danish, German, Greek, English, Spanish, Finnish, Hungarian,
      Norwegian, Romanian and Turkish. These all come from the
    * same domain (encyclopedia articles), which condition was reported to be
      necessary for sufficient unsupervised mappings by Søgaard+ (2018)
    * sizes may be very dissimilar for different languages, but these are the
      largest among our experiments. We call this type of corpora
      loosely-comparable Wikipedia, or L-Wiki for short
  * M, mildly-comparable (M-Wiki) corpus,
    * separately for all of our 55 language pairs, by
    * filtering articles with bidirectional cross-language links between the
      two Wikipedias
    * also expected to make sizes comparable within a language pair, but the
      different length of the articles may still cause dissimilarity in size
    * the amount of filtered parts between different language pairs is
      especially variable
  * S, strictly comparable, S-Wiki, both size and content
    * we use the WikiMatrix (Schwenk+ 2021) parallel corpus
    * sizes vary by language pairs
* our experiments are the first to analyze different corpus types, and to
  dissect the effects of corpus similarity

# 3.2 Training and Test Dictionaries

* no available gold standard dictionary for most of our language pairs,
* we create silver dictionaries from the WikiMatrix parallel corpora
  * using the word2word (Choe+ 2020) tool, which generates translations
    * based on parallel sentences
  * To ensure the quality of these, we generate
    two translations for each word above the mean frequency in the corpus, and
    only keep pairs that are mutual translations of each other
* Then we randomly select (disjoint) training and test dictionaries with 3000
  and 1000 source words, respectively

## 3.3. Word Embedding Models

* We train FastText (Bojanowski+ 2017) word vectors on all of the above corpora
  using Gensim (Řehůřek and Sojka, 2010), with the following
  * hyperparameters: dimensions: 300, negative samples: 5, context window: 5,
    minimum word count: 5, maximum vocabulary size: 200 000
* To create the cross-lingual models we use three mapping methods:
  * supervised VecMap (Artetxe+ 2018a), RCSLS (Joulin+ 2018), and
    Non-adversarial Translation (NAT; Hoshen and Wolf, 2018) on the embeddings
* P@1 scores, i.e.  by finding the nearest neighbor of a source word

# 4 Results and Analysis

## 4.1 Mapping Methods

* results are much more dependent on the corpus type than on the mapping algo
  * mildly and loosely comparable corpora reach similar scores (median, extrem)
  * strictly-comparable (hence a lot smaller) corpus mapping scores
    * The median of the S-Wiki scores is very low, but the
    * highest scores and quantiles are in line with the other corpus types
    * Later we will also investigate in which cases do these mappings perform
      well, and why
* VecMap performs the best among these three algorithms
* Non-adversarial Translation reaches competitive results to the other methods,
  despite the lack of supervision
  * except some cases where it completely fails,

## 4.2 Languages

* widely studied (Vulić+ 2019; Dubossarsky+ 2020; Doval+ 2020)
* our evaluation on 110 pairs of 11 languages shows interesting and instructive
* mappings of loosely comparable Wikipedia embeddings involving Spanish perform
  substantially better than English (Figure 2a )
  * English Wikipedia probably covers too diverse and deep articles that none
    of the other Wikipedias do, which makes Spanish Wikipedia a better corpus
    for embedding mappings
  * using mildly comparable Wikipedia weakens this phenomenon (see Figure 2b),
    * might suggest that instead of the corpus size, the real indicator of
      performance is the amount of overlapping information between the two
    * We will deal with this hypothesis a lot more in the rest of this article
* Figure 3 shows the average performance of loosely-comparable Wikipedia mappns
  by source and target language
  * outstanding result of the Danish–Norwegian mapping is clear
    * language relatedness, geographical and cultural similarity are all given,
    * we can assume that the two Wikipedias are also very similar in topics,
      style, editing, etc
  * only very close language relatedness is really beneficial,
    e.g. between Germanic and Romance languages, but
    * Germanic to Finno-Ugrian >= Germanic to non-Germanic Indo-European
      * might also be a useful observation for future work

## 4.3 Corpus Size and Similarity

* Our key observation is that
  one of the most required condition for good embedding mappings is corpus sim,
  more precisely the amount of common contexts the words appear in, as a
  * complement to previous claims pointing to lang similarity and corpus size
    (Dubossarsky+ 2020; Vulić+ 2020)
* We introduce two measures to quantify corpus similarity:
  * Token Overlap is the ratio |V 1 ∩ V 2 | / |V 1 ∪ V 2 |
    * Most of these shared tokens are probably words of foreign origin,
    * hE, affected by language similarity as well, and is
    * unusable with languages written in different scripts
  * Word Distribution Distance between two corpora
    * normalized frequency distribution of dictionary words
    * Jensen–Shannon divergence between them
    * small if the respective topics appear in a similar proportion
* Vulić+ (2020): mapping scores are greatly influenced by the size of the corp,
  * we include this information to our corpus data as well
  * We examined correlations using the token numbers
    of the source and the target corpus, the arithmetic and harmonic mean, min
  * min proved to be the most powerful indicator of mapping scores
* Figure 4 shows the connection of the mapping scores to the measures above
  * All of these corpus properties seem to indicate performance well
  * hE, the parameters of the regression lines for corpus types differ clearly,
    * in mildly and strictly comparable,
      * overlap ratio and word distribution similarity increase, the
      * results are not changing as much as we could have expected
  * size is neither necessary nor sufficient for good results
* Also, correlations in Table 1 show that the
  * relationship between corpus size and performance gets
    stronger as the corpus is filtered

## 4.4 Content Overlap

* controlled experiments, in which we align embeddings of the same language,
  * training corpora from subsets of a single Wikipedia
  * For 3 languages (English, Spanish and Hungarian) we create
  * corpora in different sizes, and for all of these we select subsets that are
  * second corpus to contain 0%, 33%, 66%, or 100% of the text in the first one
* examine the effects of size and content overlap explicitly (and
  * exclude the effects of typological differences between languages). These
  * parts, hE, may contain very similar articles in the same field, which are
    * small size and zero overlap still yield very high P@1 scores, as shown in
    * Still, the trends are convincing that
      content overlap is at least as important as corpus size. We show the
* These results also imply that
  word embeddings represent word usage of a specific corpus, rather than a

## 4.5 Embedding Isomorphism

* our surprising results show that
  the degree of isomorphism is generally less correlated to BLI scores
  than corpus properties
* Measuring the degree of isomorphism between word embedding models
  * several solutions have already been proposed for it
  * We adopt
    * five existing measures and introduce a
    * new one, based on the similarity of words
* list
  * Laplacian Isospectrality (Søgaard+ 2018) measures the difference between
    the Laplacian eigenvalues of word nearest neighbor graphs
    * We take the average isospectrality of 10 graphs, each constructed of 50
      random words from our dictionary and their translations
  * Singular Value Gap (SVG; Dubossarsky+ 2020) is the distance between the
    sorted singular values of the two word embedding matrices
  * Spectral Condition (Dubossarsky+ 2020)
    * harmonic mean of the condition numbers of the two embedding matrices,
      which measure their sensitivity to noise
  * Effective Spectral Condition (Dubossarsky+ 2020)
    * harmonic mean of the effective condition numbers of the two embedding mxs
  * Relational Similarity (Vulić+ 2020) quantifies how similarly the two
    models rate the proximity of word pairs
    * We take 10,000 random word pairs and their translations, and compute the
      Pearson correlation coefficient between the two lists of cosne sim scores
  * Neighbor Overlap quantifies the overlap between the neighborhood of words
    in the embedding models
    * for 1000 words w, We find w's 10 nearest neighbors among the dictionary
    * how many of the translations of these appear among the nearest neighbors
      of the translation of w
* In Table 2 we show the correlations [to] the above isomorphism measures
  * while the connection between corpus properties and bilingual scores was the
    strongest in strictly-comparable corpora, the opposite is true in this case
  * the performance of mapping embeddings trained on S-Wiki is not very
    dependent on isomorphism
  * Often it even happens that the correlation to embedding sim/dissimilarity
    turns into negative/positive in the strictly-comparable case
  * This raises the question if it is possible that
    * two models, in which the same word has different neighbors, are
      transformed so that the appropriate words still become nearest neighbors,
    * or above a certain score, isomorphism remains a requirement for perform
    * To answer this, we compute the correlations between iso and mapping only
      among mappings with P@1 score 0.6 or higher.  Table 3
    * performance does indeed depend on isomorphism,
      especially on Laplacian, relational, and neighbor similarities
* we can use both isomorphism and corpus similarity to predict bilingual perf

## 4.6 Predicting BLI Scores

* from the above studied corpus and isomorphism measures. We make predictions
* our three corpus properties, six isomorphism measures, and all of these
  combined, using random forest regression with the default parameters in
  Scikit-learn (Pedregosa+ 2011), evaluating the model with the
  Leave-One-Out method
* Table 4 shows that mapping scores are very well predictable in most cases,
  * varies between corpus types and alignment methods
  * Properties of the corpus are almost always better predictors than isomorphz
    * only exception is Non-adversarial Translation of loosely comparable Wiki
* Combining corpus and isomorphism measures usually does not improve either,
  * could mean that isomorphism depends on corpus properties as well
    * [quality depend on isomorphism only through these corpus properties]
  * To check this, we make predictions of all isomorphism measures
    from our three corpus properties, and show the results in Table 5
  * although isomorphism is greatly influenced by corpus similarity
    * not depend solely on it
* It is important to note that we did not use language information at all,
  * therefore these high scores mean that the above corpus measures are more
    important than language similarity, or at least they carry this info
  * support our observation on the importance of corpus similarity

## 5 Conclusion

* Spanish Wikipedia is better for this purpose
  * explained by our other experiments
  * corpus similarity is at least as important as corpus size
  * lang sim is really beneficial for very closely related languages only, e.g
    between Germanic or Romance
  * Mapping scores are well predictable even without any information about the
    languages, based on three properties of the corpora: corpus size,
    proportion of common tokens, and distance of the word distributions. These
    data also surpass existing embedding isomorphism measures as predictors
* hE, this paper focuses on BLI scores only
  * BLI not correlate perfectly with downstream bilingual perf (Glavaš+ 2019)
  * The main difference between downstream and BLI evaluation scores is
    probably the importance of monolingual embedding quality:
    while two embedding matrices can be trained almost perfectly isomorphically
    on a relatively small parallel corpus,
    the monolingual performance of these embeddings probably lags behind
    embeddings trained on a big corpus, Wikipedia for example
  * i.e. embeddings can be mapped very well even if they are not of the highest
    quality, but their corpora are similar enough
