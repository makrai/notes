Dynamic Word Embeddings
Robert Bamler, Stephan Mandt
2017

# Abstract

* We: a probabilistic language model for time-stamped text data
  * tracks the semantic evolution of individual words over time
  * represents words and contexts by latent trajectories in an embedding space
    * At each moment in time, the embedding vectors are inferred from a
      probabilistic version of word2vec [Mikolov+ 2013]
    * vectors are connected in time through a latent diffusion process
  * two scalable variational inference algorithms
    skip-gram smoothing and skip-gram filtering
    * allow us to train the model jointly over all times
* Experimental results on three different corpora
  * more interpretable and higher predictive likelihoods
    than static models trained separately on time slices

# 1 Intro

* Word embeddings
  * Bengio+ 03; Mikolov+ 13a; Pennington+ 14; Mnih & Kavukcuoglu, 13; Levy& 14
  * Vilnis & McCallum, 2014;
    Word Representations via Gaussian Embedding
    ICLR, 2014
  * Rudolph, Maja, Ruiz, Francisco, Mandt, Stephan, and Blei, David, 2016
    Exponential Family Embeddings
    NIPS 2016
  * useful for various supervised tasks, including
    sentiment analysis (Socher+ 2013b), semantic parsing (Socher+ 2013a), and
    computer vision (Fu & Sigal, 2016)
* static models [assume] that the meaning of any given word is the same across
  the entire text corpus
  * In this paper, we propose a generalization of word embeddings to sequential
    data, such as
    * corpora of historic texts or
    * streams of text in social media
* Current approaches to [dynamic embeddings] rely on
  grouping the data into time bins and training the embeddings separately
  (Kim+ 2014; Kulkarni+ 2015; Hamilton+ 2016)
  * fundamental problems. First, since word
    1. embedding vectors at successive times can only be approximately related
       to each other,
       and only if the embedding dimension is large (Hamilton+ 2016)
    2. time bins are too small
* contributions
  * probabilistic state space model generalizes the skip-gram model
    (Mikolov+ 2013b; Barkan, 2017) to a dynamic setup, which allows
    end-to-end training. This leads to continuous embedding trajectories,
    * allows us to share information across all times
  * two scalable black-box variational inference algorithms
    (Ranganath+ 2014; Rezende+ 2014) for filtering and smoothing
    * for structured Gaussian variational distributions with tridiagonal
    precision matrices, and applies more broadly
  * We analyze three massive text corpora that span over long periods of time
    * automatically find the words whose meaning changes the most. It results
    * visualize the continuous dynamics of the entire embedding cloud as it
      deforms over time

# 2. related work

* Probabilistic models that have been extended to latent time series models
  * none of them relate to word embeddings. The
  * closest of these models is the dynamic topic model
    (Blei & Lafferty, 2006; Wang+ 2008), which
    learns the evolution of latent topics over time
  * other (Sahoo+ 2012; Gultekin & Paisley, 2014; Charlin+ 2015;
    Ranganath+ 2015; Jerfel+ 2017)
* word2vec in Bayesian setup (Barkan, 2017 AAAI)
* different statistics of text data to analyze semantic changes of words
  (Mihalcea & Nastase, 2012; Sagi+ 2011; Kulkarni+ 2015)
  * they slice the data into different time bins, fit the model separately
  * can therefore not share statistical strength across time. This
  * limits the applicability of static models to very large corpora [miért
    nagyra?]
* Kim+ (2014) fit word2vec separately on different time bins, where the
  * vectors obtained for the previous bin are used to initialize the next
  * trajectories are not as smooth as ours, as we demonstrate in this paper
* Hamilton+ (2016) also trained word2vec separately on several large
  corpora from different decades
  * If the embedding dimension is large enough (and hence the optimization
    problem less non-convex), the authors argue that word embeddings at nearby
    times approximately differ by a global rotation in addition to a small
    semantic drift

# 3. Our model

# 4. Two efficient variational inference algorithms

# 5. Experimental results

* track semantic changes by following nearest-neighbor relations over time

## Algorithms and Baselines

* SGI denotes the non-Bayesian skip-gram model with independent random init
  * nearby times are made comparable by approximate orthogonal transformations,
  * corresponds to Hamilton+ (2016)
* SGP denotes the same approach as above [initialized with] the previous year,
  as in Kim+ (2014)
* DSG-F: dynamic skip-gram filtering (proposed)
* DSG-S: dynamic skip-gram smoothing (proposed)

## Data and preprocessing

* Our three corpora exemplify opposite limits
  both in the covered time span and in the amount of text per time step
1. We used data from the Google books corpus (Michel+ 2011) from the last two
   centuries (T = 209).  This amounts to 5 million digitized books and
   approximately 10^10 observed words. The corpus consists of 5-gram tables
2. “State of the Union” (SoU) addresses of U.S. presidents, which spans more
   * two centuries, resulting in T = 230 different time steps and approx-
   * 10^6 observed words lower case[d] and a context window size of 4
3. a Twitter corpus of news tweets for
  * 21 randomly drawn dates from 2010 to 2016. The
  * median number of tweets per day is 722. We converted all tweets to
  * lower case and used a context window size of 4

## Qualitative results

* Figure 4 visualizes the smoothness of the trajectories
 * histograms of the Euclidean distances ||u it − u i,t+δ ||
 * In our model, a directed motion
 * hE both baseline models show fluctuations of n ± ij,t
   * Initialization schemes alone have a minor effect on smoothness
* skip-gram smoothing (DSG-S) may diffuse information into the past
  (see ”presidential” to ”clinton-trump” in Fig 5)

## Quantitative [predictive]

* The improvement of our approach over the static model is particularly
  pronounced in the SoU and Twitter corpora, which are much smaller than the
  massive Google books corpus.  There, sharing information between across time
  is crucial

# 6. Conclusions

* Our approach may be used as a[n] and anomaly detection tool when streaming
  text on social media, as well

