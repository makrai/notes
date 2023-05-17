Factors Influencing the Surprising Instability of Word Embeddings
Laura Wendlandt, Jonathan K. Kummerfeld, Rada Mihalcea
naacl 2018

# Abstract

* even relatively high frequency words (100-200 occurrences) are often
  unstable. We provide empirical evidence for how various factors contribute
* we analyze the effects of stability on word similarity and POS tagging

# 1 Intro

* factors that play a role in the stability of word embeddings, including
  properties of the data, the algorithm, and the words
* Using the overlap between nearest neighbors as a measure of stability
* eg training word2vec on the Penn Treebank (PTB, Marcus+ 1993)
  * medium-frequency words, which show huge variance in stability
* we explore three embedding methods:
  PPMI (Bullinaria & Levy, 07), word2vec (Mikolov+ 13b), GloVe (Pennington+ 14)
* previously studied. Particularly, the effect of
  parameter choices has a large impact on how all three of these algorithms
  behave (Levy+ 2015)
* parameters of the embedding algorithm word2vec influence the geometry of word
  vectors and their context vectors (Mimno and Thompson, 2017)
* Hellrich and Hahn (2016) posit
  optimal parameters for negative sampling and the number of epochs
  * word properties, such as word ambiguity, affect embedding quality
* Antoniak and Mimno (2018) evaluates how document properties affect stability
  * to analyze language (eg Garg+ 2018), rather than to perform tasks
  * Nikhil Garg, Londa Schiebinger, Dan Jurafsky, and James Zou
    PNAS 2018
    Word embeddings quantify 100 years of gender and ethnic stereotypes
* Tan+ (2015) linearly transforming between Twitter and Wikipedia
* second-order properties of embeddings
  (eg how a word relates to the words around it)
  * Newman-Griffis and Fosler-Lussier (2017) demonstrating that
    embeddings based on second-order properties perform as well as the
    typical first-order embeddings
  * we use second-order properties of embeddings to quantify stability

# 3 Defining Stability

* using cosine similarity
  * comparable results for l 1 norm, l 2 norm, and l ∞ norm
* This definition of stability can be generalized to more than two embeddings
  * Let the stability be the average percent overlap
    over every pair of embedding spaces (x, y)
* The idea of evaluating ten best options is also found in other tasks, like
  * lexical substitution (eg McCarthy and Navigli, 2007) and
  * word association (eg Garimella+ 2017)
* how changing the number of nearest neighbors affects our stability metric,
  * Figure 2
  * Ten nearest neighbors performs approximately as well as a higher number
    of nearest neighbors (eg 100). ?
    * it is computationally less intensive to use a small number of NNs
  * We see this pattern for low frequency words as well as for high frequency
    words

# 4 Factors Influencing Stability

* we build a regression model that aims to predict the stability of a word
  given:
  1.  properties related to the word itself;
  1.  properties of the data used to train the embeddings; and
  1.  properties of the algorithm used to construct these embeddings

## 4.1 Word Properties

* (most frequent) and (second most frequent) POS
  * If the word is not present in the Brown corpus, then all of these POS
    features are set to zero. similarly for syllable count
    * nem kavar be a gyakoriság?
  * universal tagset, which consists of twelve possible POS (Petrov+ 2012)
* polysemy
  * coarse-grained representation the number of different POS present. For
  * finer-grained representation, we use the number of different WordNet senses
* number of syllables in a word, determined using the CMU Pronuncing Dictionary

## 4.3 Data Properties

* two sources: New York Times (NYT, Sandhaus, 2008) and Europarl (Koehn, 2005)
* seven domains of data: (1) NYT U.S., (2) NYT New York and Region, (3) NYT
  Business, (4) NYT Arts, (5) NYT Sports, (6) All of the data from domains 1-5
  (denoted “All NYT”), and (7) All of English Europarl

  * The first five domains are the top five most common categories of news
    articles present in the NYT corpus.  They are smaller than “All NYT” and
    Europarl, and they have a narrow topical focus
  * The “All NYT” domain is more diverse topically and larger than the first 5
  * Europarl domain is the largest domain, and it is focused on a single topic
    (European Parliamentary politics)
* features related to domain
  * frequency of word W
    in both the domain of data used for embedding space A and B
    * the higher raw frequency (between the two), the lower raw frequency, and
      the absolute difference in raw frequency
  * the vocabulary size of each corpus (again, symmetrically) and the
  * percent overlap between corpora vocabulary, as well as the
  * domain of each of the two corpora?
  * whether the two corpora are from the same domain
  * the role of curriculum learning in stability
    * the order of the training data affects the performance (Bengio+ 2009)
    * previously explored for word2vec (Tsvetkov+ 2016)
    * only affects word2vec Of the embedding algorithms we consider,
      * GloVe and PPMI use a complete matrix before building embeddings,
    * features: the first appearance of word W in the dataset for embedding
      space A and B (represented as percentages of sentences)
    * We further include the absolute difference between these percentages

## 4.4 Algorithm Properties

* different algorithms being used, as well as the different parameter settings
* window size and minimal count: standard parameter settings
* 50 iterations of the algorithm for embedding dimensions less than 300, and
  100 iterations for higher dimensions
* dimensions: 50, 100, 200, 400, or 800

# 5 Lessons Learned: What Contributes to the Stability of an Embedding

* the regression model achieves a coefficient of determination (R^2) score
  of 0.301 on the training data: the model reasonably fits the training data
* weights corresponding to each of the features, shown in Table 4
  * difficult to interpret,
    because features have different distributions and ranges
1. Curriculum learning is important
  * Figure 3 shows trends between training data position and stability
  * To further understand the effect of curriculum learning on the model, we
    train a regression model with all of the features except the curriculum
    learning features
    * R 2 score of 0.291 (compared to the full model’s 0.301)
2. POS is one of the biggest factors
  * Table 5 most stable POS are numerals, verbs, and determiners, while the
    least stable POS are punctuation marks, adpositions, and particles
3. Stability within domains is greater than stability across domains
  * “All NYT” generalizes across the other NYT domains well
    even though Europarl is much larger than “All NYT”
4. GloVe > PPMI > word2vec
  * particularly apparent when only in-domain data is considered
* how the stability of word2vec changes
  with the frequency of the word and the number of neighbors used
  * shown in Figure 6 and is directly comparable to Figure 2
  * For lower-frequency words, as the number of nearest neighbors increases,
    the stability increases approximately exponentially
  * For high-frequency words, the lowest and highest number of nearest
    neighbors show the greatest stability
  * different than GloVe as shown in Figure 2
  * agrees with the conclusion of (Mimno and Thompson, 2017)
5. Frequency is not a major factor in stability
 * separate ablation experiments without frequency features. Our current
   * raw frequency) achieves an R 2 score of 0.301. Comparably, a
   * normalized instead of raw frequency, achieves a score of 0.303
   * Removing frequency gives a score of 0.301
 * ld. a korábbi kérdésemet

# 6 Impact of Stability on Downstream Tasks

## 6.1 Word Similarity

* we take the absolute difference between our predicted value and the gold
  ground-truth value broken down by stability of the two words
* in datasets, there are substantially more unstable words than  stable
* As the combined stability of the two words increases, the average absolute
  error decreases
  * why?

## Part-of-Speech Tagging

* bidirectional LSTM implemented using DyNet (Neubig+ 2017). We train
  * input noise rate of 0.1, and recurrent dropout of 0.4
* nine sets of 128-dimensional word embeddings with word2vec
* Fixing the word vectors provides
  greater stability, but also leads to much worse performance
* In general, lower stability words are shifted more during training

# 7 Conclusion and Recommendations

* future tasks, we recommend learning a good curriculum for word2vec
