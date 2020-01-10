Massively Multilingual Word Embeddings
W  Ammar, G  Mulcaire, Y Tsvetkov, Guillaume Lample, Chris Dyer, Noah A Smith 
acl 2016

# Abstract

* fifty languages in a single shared embedding space. Our estimation methods,
  multiCluster and multiCCA, 
* data
  * pairwise parallel dictionaries,
    * To do this, we align the corpus using fast align (Dyer et al., 2013) in
      both directions.  The estimated parameters of the word translation
      distributions are used to select pairs
      * threshold τ trades off dictionary recall and precision. We fixed τ =
        0.1 early on based on manual inspection of the resulting dictionaries.
  * monolingual data
  * Parallel corpora are not required but can be used when available.
* new evaluation method, multi `QVEC_CCA` , is shown to correlate better
  than previous ones with two downstream tasks (text categorization and
  parsing)
* web portal for evaluation that will facilitate further research in this area
* open-source releases of all our methods.

# Introduction

* shared representation of words across languages offers intriguing
  possibilities (Klementiev et al., 2012).  
* For example, in machine translation, translating a word never seen in
  parallel data may be overcome by seeking its vector-space neighbors, 
* transfer learning, in which models trained in one language can be deployed
  in other languages.  While 
  * hand-engineered features that are cross-linguistically stable as the basis
    model transfer (Zeman and Resnik, 2008; McDonald et al., 2011; Tsvetkov et
    al., 2014),
  * embedding (Klementiev et al., 2012; Hermann and Blunsom, 2014; Guo et al.,
    2016).  
* We ...  massively multilingual word embeddings (i.e., embeddings for words
  in a large number of languages)
 
# 2 Estimating Multilingual Embeddings

* We would like to estimate this function such that:
  (i) semantically similar words in the same language are nearby, 
  (ii) translationally equivalent words in different languages are nearby, and 
  (iii) the domain of the function covers as many words in V as possible.
* our baselines: a variant of Coulmance et al. (2015) and Guo et al. (2016)
  (henceforth referred to as multiSkip), and the translation-invariance
  matrix factorization method (Gardner et al., 2015).

## MultiCluster

* decompose the problem
  * deterministically maps words to multilingual clusters C, and 
  * E embed : C → R d assigns a vector to each cluster. 
* method
  * bilingual dictionary to find clusters of translationally equivalent words,
  * distributional similarities of the clusters in monolingual corpora from
    all languages in L to estimate an embedding for each cluster.
  * More specifically, we define the 
    * clusters as the connected components in a graph where nodes are
      (language, surface form) pairs and edges correspond to translation
      entries in D m,n . We assign arbitrary IDs to the clusters and replace
      each word token in each monolingual corpus with the corresponding
      cluster ID

## MultiCCA

* bilingual embeddings of Faruqui and Dyer (2014)
  * they use monolingual corpora to train monolingual embeddings for each
    language 
  * using a bilingual dictionary D m,n , they use canonical correlation
    analysis (CCA) to estimate linear projections from the ranges of the
    monolingual embeddings E m and E n , 
    * maximize the correlation between T m→m,n E m (u) and T n→m,n E n (v)
      where (u, v) ∈ D m,n
* we
  * We let the vector space of the initial (monolingual) English embeddings
    serve as the multilingual vector space (since English typically offers
    the largest corpora and wide availability of bilingual dictionaries). We
    then estimate projections from the monolingual embeddings of the other
    languages into the English space.  We start by estimating, for each m ∈ L
    \ {en}, the two projection matrices: T m→m,en and T en→m,en ; these are
    guaranteed to be non-singular.  We then define the multilingual embedding
    as E CCA (en, u) = E en (u) for u ∈ V en , and −1 T m→m,en E m (v) for v ∈
    E CCA (m, v) = T en→m,en m V , m ∈ L \ {en}.
 
## 2.3 MultiSkip

* Luong et al. (2015b) proposed a method for estimating bilingual embeddings
  * only makes use of parallel data;
  * extends the skipgram model of Mikolov et al. (2013a)
    * distribution can be estimated using ... noise contrastive estimation
      (Gutmann and Hyvärinen, 2012)
  * bilingual contexts come from aligned words.
  * can be extended for more than two languages by summing up the bilingual
    objectives for all available parallel corpora.

## 2.4 Translation-invariance

* Gardner et al. (2015) proposed that multilingual embeddings should be
  translation invariant. Consider a 
* mxs 
  * X ∈ R |V|×|V| which summarizes the pointwise mutual information statistics
    between pairs of words in monolingual corpora, and let 
    * UV ⊤ be a low-rank decomposition of X where U, V ∈ R |V|×d
  * A ∈ R |V|×|V| which summarizes bilingual alignment frequencies in a
    parallel corpus.  
* Gardner et al. (2015) solves for a low-rank decomposition UV ⊤ which 
  approximates X as well as its transformations A ⊤ X, XA and A ⊤ XA
* multilingual embeddings are then taken to be the rows of the matrix U.

# 3 Evaluating Multilingual Embeddings

* Multi QVEC-CCA extends QVEC (Tsvetkov et al., 2015), a recently proposed
  monolingual evaluation method, addressing fundamental flaws and extending it
  to multiple languages.

## 3.1 Word similarity

* focuses on monolingual word similarity to evaluate embeddings (e.g., Faruqui
  and Dyer, 2014)
* we report results on an 
  * English word similarity task, the Stanford RW dataset (Luong et al.,
    2013), as well as 
  * a combination of several cross-lingual word similarity datasets
    (Camacho-Collados et al., 2015).

## Word translation

## Correlation-based evaluation

* an improvement of QVEC —a monolingual evaluation based on alignment of
  embeddings to a matrix of features extracted from a linguistic resource
  (Tsvetkov et al., 2015).
* QVEC
  * linguistic matrix S ∈ R P×N is constructed from a semantic database, with
    a column vector for each word. Each word vector is a distribution of the
    word over P linguistic properties, based on annotations of the word in the
    database.
  * S and X are aligned to maximize the cumulative correlation between the
    aligned dimensions of the two matrices. Specifically, let 
    * A ∈ {0, 1} D×P be a matrix of alignments such that a ij = 1 iff x i is
      aligned to s j , otherwise a ij = 0. If 
    * r(x i , s j ) is the Pearson’s correlation between vectors x i and s j ,
    * QVEC
  * weaknesses. First, it is 
    * not invariant to linear transformations of the embeddings’ basis,
      whereas the bases in word embeddings are generally arbitrary (Szegedy
      et al., 2014)
    * the more dimensions in the embedding matrix the higher the score
* QVEC-CCA
  * CCA finds two sets of basis vectors, one for X ⊤ and the other for S ⊤ ,
    such that the correlations between the projections of the matrices onto
    these basis vectors are maximized. 
      * ensures invariance to the matrices’ bases’ rotation, and 
      * since it is a single correlation, it produces a score in [−1, 1].
        de ettől még előnyben részesítheti a nagyobb dimenziót
* linguistic [mx for] multilingual evaluations
  * supersense tag annotations for 
    * English (Miller et al., 1993)
    * Danish (Martı́nez Alonso et al., 2015; Martínez Alonso et al., 2016) 
    * Italian (Montemagni et al., 2003).

## Extrinsic tasks

* multilingual document classification and multilingual dependency parsing.
  For document classification, we follow Klementiev et al. (2012) in using the
  RCV corpus of newswire text, and train a classifier which differentiates
  between four topics.
* dependency parsing, we train the stack-LSTM parser of Dyer et al. (2015) on
  a subset of the languages in the universal dependencies v1.1, 6 and test on
  the same languages, reporting unlabeled attachment scores. We remove all
  part-of-speech and morphology features from the data, and prevent the model
  from optimizing the word embeddings

# 5 Experiments

## 5.1 Correlations between intrinsic vs. extrinsic evaluation metrics

* four intrinsic evaluation metrics (cross-lingual word similarity, word
  translation, multi QVEC and multi `QVEC_CCA` ) and 
* two extrinsic evaluation metrics (multilingual document classification and
  multilingual parsing).

## 5.2 Evaluating multilingual estimation methods

# 6 Related Work

* bilingual embeddings, including work on machine translation 
  (Zou et al., 2013; Hermann and Blunsom, 2014; Cho et al., 2014; Luong et
  al., 2015b; Luong et al., 2015a, inter alia)
* crosslingual dependency parsing (Guo et al., 2015; Guo et al., 2016), and
* cross-lingual document classification 
  (Klementiev et al., 2012; Gouws et al., 2014; Kociskỳ et al., 2014)

# 7 Conclusion
