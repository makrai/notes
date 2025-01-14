Francis Ferraro, Adam Poliak, Ryan Cotterell, Benjamin Van Durme
Frame-Based Continuous Lexical Semantics
  through Exponential Family Tensor Factorization and Semantic Proto-Roles
Joint Conference on Lexical and Computational Semantics (`*`SEM) 2017

tensor factorization code https://github.com/fmof/tensor-factorization

# Abstract [and Conclusions]

* learn embeddings enriched with multiple, automatically obtained frames from
  large, disparate corpora
* QVEC evaluation for semantic proto-roles (SPR)
* experiments, our extension of Cotterell+ (2017)’s tensor factorization
  * including syntactic-semantic information not often captured
  * multiple 10% [sic] gains over baselines [in] SPR-based correlations

# 1 Intro

* Frame semantics generalize word meanings to that of analyzing structured and
  interconnected labeled “concepts” and abstractions
  (Minsky, 1974; Fillmore, 1976, 1982)
  * concepts [aka.] roles, implicitly encode expected properties of that word
  * e.g. the segment “would try” triggers the ATTEMPT frame,
    filling the expected roles AGENT and GOAL with “Bill” and “the tactic” resp
  * a structured form for analyzing words with crisp [szabatos?], categorically
    labeled concepts, the encoded properties and expectations are implicit
* Semantic proto-role (SPR) theory,
  * motivated by Dowty (1991)’s thematic proto-role theory
  * offers a [(meta)semantics of frames]
* can view SPR as ... a type of continuous frame semantics because
  * captures the likelihood of certain properties and
  * characterizes roles as groupings of properties
* We
  * interested in capturing these SPR-based properties and expectations
    within word embeddings
  * method that learns frame-enriched embeddings from millions of documents
    * docs semantically parsed with multiple different frame analyzers
      (Ferraro+ 2014)
    * leverages Cotterell+ (2017)’s formulation of Mikolov+ (2013)’s popular
      skip-gram model as exponential family principal component analysis (EPCA)
      and tensor factorization
* contributions are:
  * word embeddings with multiple ... frames from large, disparate corpora
  * demonstrating these enriched embeddings better capture SPR-based properties
  * generalize Cotterell+’s method to arbitrary tensor dimensions
    * allows us to include an arbitrary amount of semantic information

# 2 Frame semantics and proto-roles

* distinctions in proto-roles are based on clusterings of logical entailments
  * PROTO-AGENTs often ...  manipulating other objects or willingly
    participating in an action;
  * PROTO-PATIENT ... changed or affected by some action. By decomposing the
  * proto-roles:
    a form of vector representation within structured frame semantics

# 3 Continuous Lexical Semantics

## 3.1 Skip-Gram as Matrix Factorization

* Levy and Goldberg (2014b), and subsequently Keerthi+ (2015), showed how
  vectors learned under SG with the negative sampling are, under certain
  conditions, the factorization of (shifted) positive PMI
* Cotterell+ (2017) showed that SG is a form of exponential family PCA that
  factorizes the matrix of word/context cooccurrence counts (rather than
  shifted positive PMI values). With this interpretation, they generalize SG

## 3.2 Skip-Gram as n-Tensor Factorization

* n-dimensional tensor to include an arbitrary number of L annotations
* `X i,j,l_1,..,l_L` representing the number of times word j appeared in
  context i with features `l_1` through `l_L`

# 4 Experiments

* We utilize majority portions of the Concretely Annotated New York Times and
  Wikipedia corpora from Ferraro+ (2014)
  * annotated with three frame semantic parses: FrameNet from Das+ (2010), and
    both FrameNet and PropBank from Wolfe+ (2016)

## Extracting Counts

* The baseline extraction we consider is a standard sliding window and word2vec
* We also follow Cotterell+ (2017)
  * augment the above with the signed number of tokens separating w i and w j
  * these counts form a 3-tensor
* To turn semantic parses into tensor counts, we first identify relevant
  9-tensor:
  * Each record consists of the trigger, a role filler,
    the number of words between the trigger and filler, and
    the relevant frame and roles from the three semantic parsers
* Although we always treat the trigger as the “original” word later we consider
  1. what to include from X,
  1. what to predict (what to treat as the “context” word i), and
  1. what to treat as auxiliary features

## Data Discussion

[in] the frame extraction, there are an order-of-magnitude fewer triggers than
target words, but up to an order-of-magnitude more surrounding words

## Implementation

* We generalize Levy and Goldberg (2014a)’s and Cotterell+ (2017)’s code to
  enable any arbitrary dimensional tensor factorization
* We learn 100-dimensional embeddings for words that appear at least 100 times

### Metric

* We evaluate our learned (trigger) embeddings via QVEC (Tsvetkov+ 2015)
* QVEC uses canonical correlation analysis to measure the Pearson correlation
  between w and [oracle lexical vectors derived from human annotation]

## Evaluating Semantic Content with SPR

* Motivated by Dowty (1991)’s proto-role theory, Reisinger+ (2015), with a
  subsequent expansion by White+ (2016),
  annotated thousands of predicate-argument pairs (v, a) with (boolean)
  applicability and (ordinal) likelihoods of well-motivated semantic properties
  applying to/being true of `a`
* Thus, the combined 20 properties of Reisinger+ (2015) and White+
  (2016)—together with the four basic grammatical relations nsubj, dobj, iobj
  and nsubjpass—result in 80-dimensional oracle vectors

### Predict Fillers or Roles?

* we predict the words filling the roles
* we also train a model to predict PropBank frames and roles
* we only consider up to 6-tensors:
  trigger, role filler, token separation between the trigger and filler,
  PropBank frame and role, FrameNet frame, and FrameNet role

### Results

# Related Work

* linguistic annotations and resources to learn embeddings
  * Cotterell+ (2017) and Levy and Goldberg (2014a) incorporate additional
    syntactic and morphological information in their word embeddings
  * Rothe and Schütze (2015) use lexical resource entries, such as WordNet
    synsets, to improve pre-computed word embeddings
  * generalized CCA, Rastogi+ (2015) incorporate paraphrased FrameNet
  * applied side, Wang and Yang (2015) used frame embeddings
    produced by training word2vec on tweet-derived semantic frame (names)
* relationship between semantic frames and thematic proto-roles
  * Teichert+ (2017) ... proposed using a Conditional Random Field
    (Lafferty+ 2001) to jointly and conditionally model SPR and SRL
    * demonstrated slight improvements in jointly and conditionally predicting
    PropBank (Bonial+ 2013)’s semantic role labels and
    Reisinger+ (2015)’s proto-role labels

# 6 Conclusion
