Sergey Bartunov, Dmitry Kondrashkin, Anton Osokin, Dmitry Vetrov
Breaking Sticks and Ambiguities with Adaptive Skip-gram
2015

* http://bayesgroup.ru/

* Ismeretlen fogalmak
  * nonparametric Bayesian model
  * variational learning

# Abstract

* Skip-gram does not take into account word ambiguity
* a number of Skip-gram modifications were proposed
  * either require a known number of word meanings or
  * using greedy heuristic approaches
* this paper
  * Adaptive Skip-gram model which is
  * a nonparametric Bayesian extension of Skip-gram
  * derive efficient online variational learning algorithm for the model and
  * empirically demonstrate its efficiency on word-sense induction task

# 1. Introduction

* word sense induction (WSI) problem
  * automatic identification of the meanings of a word
* NLP applications that benefit from
  * WSD
    * Navigli & Crisafulli, 2010; web search result clustering
    * Vickrey+ 200:5 WSD for machine translation
  * VSM
    * dependency parsing (Chen & Manning, 2014),
    * named-entity recognition (Turian+ 2010) and
    * sentiment analysis (Maas+ 2011)

# 2. Skip-gram model

* sentence boundaries
  *  For training the Skip-gram model it is common to ignore sentence and
     document boundaries and to interpret the input data as a stream of words
* we refer to the input representations as prototypes
  * following (Reisinger & Mooney, 2010b)

    *  p(v|w, θ) = \Prod_{n \in path(v)} σ(ch(n)in^T_w out_n , 3)

# 3. Adaptive Skip-gram

* variable z encodes the index of active meaning

  * p(v|z = k, w, θ) = \Prod_{n \in path(v)} σ(ch(n)in^T_{wk} out_n , 4)

* Note that only input vectors depend on the particular word meaning

* We employing Bayesian nonparametrics into Skip-gram
  * we use the constructive definition of Dirichlet process (Ferguson, 1973)
  * stick-breaking representation (Sethuraman, 1994) to define a prior
  * for automatic determination of the required number of prototypes
  * Dirichlet process (DP) has been successfully used for
    * infinite mixture modeling and other problems where the number of
      structure components (e.g.  clusters, latent factors, etc.) is not known
      a priori
      * (Shahbaba & Neal, 2009; Rasmussen, 2000)
  * stick-breaking to define a prior over meanings of a word
    * The hyperparameter alpha, resolution paramater
      * controls the number of prototypes for a word allocated a priori
    * n_w: number of occurrences of w in the text
    * Asymptotically, the expected number of prototypes of word w is
      * proportional to alpha log(n_w)
      * jó ez nekünk, hogy a gyakoribb szavaknak több van?
    * Similarly to Mikolov+ (2013a)
      * we do not consider any regularization (and so the informative prior)
        for representations and seek for point estimate of θ

## 3.1. Learning representations

* variational lower bound on the marginal likelihood
  * the marginal likelihood of the model is intractable
  * To make this tractable we consider the variational lower bound on the
    marginal likelihood \mathcal L where
    * q(Z, Beta) is the fully factorized variational approximation to the
      posterior p(Z, β|X, Y, α, θ) with possible number of representations for
      each word truncated to T
  * Blei & Jordan, 2005
    * Variational inference for Dirichlet process mixtures
  * max \mathcal L is equivalent to
    * the minimization of Kullback-Leibler divergence
      * between q(Z, β) and the true posterior (Jordan+ 1999)
* Stochastic variational inference
  * why SVI?
    * Although variational updates are tractable, they require the full
      pass over training data. In order to keep the efficiency of Skip-gram
      training procedure, we employ stochastic variational inference approach
      (Hoffman+ 2013) and derive online optimization algorithm for the
      maximization of \mathcal L
  * conservative initialization strategy for q(β)
    * starting with only one allocated meaning for each word,

## 3.2. Disambiguation and prediction

# 4. Related work

* modifications of Skip-gram proposed to learn multi-prototype representations
  * Qiu+ (2014) developed
    * Proximity-Ambiguity Sensitive Skipgram which maintains individual
      representations for different parts of speech (POS)
  * Tian+ (2014) can be considered as a parametric form of our model
    * with number of meanings for each word fixed
    * Our approach is able also to gradually increase the number of
      meanings when more data becomes available
  * Chen+ (2014)
    * incorporate external knowledge about word meanings into Skip-gram
      * in the form of sense inventory
    * First, single-prototype representations are pre-trained with sgram
    * Afterwards, meanings provided by WordNet
  * Neelakantan+ (2014) proposing
    * Multisense Skip-gram (MSSG) and
    * its non-parameteric  version (NP MSSG)
      * NP not in the sense of Bayesian nonparametrics
    * learning for NP MSSG is defined rather as ad-hoc greedy procedure that
      * allocates new representation for a word if
        * existing ones explain its context below some threshold
    * in our model the number of prototypes may not only increase
      * decrease if this leads to a better model
        * in terms of variational lower bound
    * we use models of Neelakantan+ (2014) as baselines

# 5. Experiments

* paramaters
  * mincount = 20 occurrences
  * context width C = 10
  * truncation level of Stick-breaking approximation: T = 30
  * dimensionality D of representations: 300

## 5.1. Nearest neighbors

* The predictive probability of each meaning reflects how frequently it was
  used in the training corpus

## 5.2. Semantic resolution

  * nagyobb alfánál hosszabban sima, de kevésbé monoszém
  * For most of the words α = 0.1 results in most interpretable model
  * for values less than 0.1 for most words only one prototype is learned and
    * baj az?
  * for values greater than 0.1
    * the model becomes less interpretable
    * learned meanings are too specific, sometimes duplicating
    * decreases model performance

## 5.3. Word prediction

## 5.4. Word-sense induction p8

* paradigm
  * target word + disambig context + contexts to be labeled
  * for each target word
    * the model’s labeling of contexts and ground truth one are compared
  * The results are then averaged over all target words
  * annyiban WSI (as opposed to WSD), hogy nincs explicit jelentéskészlet

### 5.4.1. SemEval-2010 dataset

* SemEval-2010 Word Sense Induction & Disambiguation competition
  * (Manandhar+ 2010)
  * consists of 100 target words and 8915 contexts in total
  * only single-term target words
* SemEval-2013
  * (Navigli & Vannella, 2013)
  * we do not consider for evaluation as it contains many MWEs
  * consists only of 6400 contexts in total
* metrics for evaluation:
  * Manandhar+ (2010) suggested
    * V-Measure (VM) and
      * favours large number of clusters and
      * attains large values on all-singleton clustering
    * F-Score (FS)
      * biased towards small number of clusters
      * e.g. assigning each instance to the same single cluster
  * we consider adjusted Rand index (Hubert & Arabie, 1985, ARI)
    * does not suffer from such drawbacks
    * undesirable clusterings above will get ARI of nearly zero
    * We still report VM and FS values

### 5.4.2. SemEval-2007 dataset

* Agirre & Soroa, 2007
* 27232 contexts collected from Wall Street Journal (WSJ)
* We merged together train and test contexts for model comparison
* domain
  * Since WSJ corpus differs from general-domain Wikipedia corpus,
  * we retrained all considered models on
    * «One billion word benchmark» dataset (Chelba+ 2014)
      * news articles
  * difference affect the performance
* Each model was supplied with contexts of the size that maximizes ARI

### 5.4.3. New Wikipedia Word-sense Induction (WWSI) dataset

* 188 target words and 36354 contexts
* currently the largest WSI dataset available
* SemEval datasets are prepared with hand effort
* details on the dataset construction procedure: in the Appendix
* result
  * We use adjusted Rand index averaged over test words
  * compare
    * AdaGram models trained with different values of α and
    * the models of Neelakantan+ (2014)
  * Our model significantly outperforms both MSSG and NP-MSSG
  * This demonstrates that AdaGram  meanings are
    * well aligned with Wikipedia sense inventory
  * interpretability
    * a higher number of learned prototypes may become less interpretable
      * contradicting quantitative evaluation results
  * Such phenomenon is also common for topic modeling, see e.g
    * Boyd-Graber+ (2014)

# 6. Conclusion

# Appendix. WWSI Dataset construction details

* list of ambiguous words
  * Similarly to (Navigli & Vannella, 2013)
    * Wikipedia’s disambiguation pages
  * we have selected target single-term words
    * which had occurred in the text at least 5000 times
  * We also did not consider pages belonging to some categories
    * such as “Letternumber_combination_disambiguation_pages”
* contexts
  * for each page selected on the previous step we find all occurrences of the
    target word on it and use its 5-word neighbourhood (5 words on the left and
    5 words on the right) as a context.  Such size of the context was chosen to
    minimize the intersection between adjacent contexts but still provide
    enough words for disambiguation
* Our dataset
  * has the largest number of words and contexts, however it
  * consists of the words with less number of senses
