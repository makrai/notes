Frederick Jelinek
Statistical Methods for Speech Recognition +22
1997

# 3 The Acoustic Model 39

## 3.11 Additional Reading 52

* Baum algorithm aims at estimating HMM parameters in a maximum likelihood way
  * to maximize P(A)
  * What one would really wish is to maximize ...  P(W|A)
    where W is the spoken word string and A is the observed acoustic[s]
    * This turns out to be a rather difficult problem
      requiring in practice various assumptions and approximations
  * first attempts at solution can be found in [16] and [17]
* Kanevsky and colleagues ... an adjustment to the Baum algorithm that allows
  * optimization of the a posteriori probability criterion [18]. A
  * survey of these approaches can be found in [19]

# 4 Basic Language Modeling 57 79

* We will return ... to language modeling [and discuss considerably more
  sophisticated methods than those introduced here] in chapters
  10. Application of Decision Trees to Language Modeling
    * 10.2 a basic class based technique
  13. Maximum Entropy Probability Estimation and Language Models
  14. Three Applications of Maximum Entropy Estimation to Language Modeling
  15. Estimation of Probabilities from Counts and the Back-Off Method
    15.7 The Back-Off Language Model 271
    15.8 Additional Reading 273

## 4.1 Introduction 57
## 4.2 Equivalence Classification of History 59
## 4.3 The Trigram Language Model 60

P(w3|w1,w2) = lambda_3 f(w3|wi, w2) + lambda_2 f(w3|w2) + lambda_1 f(w3) (10)

## 4.4 Optimal Linear Smoothing 62
## 4.5 An Example of a Trigram Language Model 66
## 4.6 Practical Aspects of Deleted Interpolation 66
## 4.7 Backing-Off 69
## 4.8 HMM Tagging
## 4.9 Use of Tag Equivalence Classification in a Language Model 72

* [the Brown clusters by P. F. Brown] can be found in section 10.12 [11]
* Others are discussed in section 4.11

## 4.10 Vocabulary Selection and Personalization from Text Databases 73
## 4.11 Additional Reading 75 References 76

* linear smoothing. Ney and Essen [13] and Essen and Steinbiss [14]
* it [is in general not] useful to attempt n-gram language models with n > 3
  * However Guyon and Pereira [15] ...  keeps complexity within ...  limits
  * slight improvement over this approach and some alternatives [16]
* A generalization [of trigrams] by Lafferty and colleagues [17]
  * Basing their technique on link grammars [18], they are able to
    take into account nonlocal influences in the text
* classes
  * As mentioned in sections 4.8 and 4.9
    * Based on (multiple) part-of-speech classification ... for Italian [19]
    * [11] is based on unique class assignment of words
  * Jardino improves on this method [21] [22]
    * Using simulated annealing [20],
    * by allowing multiple classification of words ... (as seen in section 4.9)
  * classification ... based directly on semantics [23, WordNet]
* collocations like New York or _nuclear magnetic resonance_
  * Smadja's technique (1993) can be used

# 8 The Complexity of Tasks—The Quality of Language Models

## 8.5 Additional Reading 166

* Cover and King ... [2] estimates text _entropy_ somewhat differently than
  does Shannon's method described in section 8.2
  * upper bound on the entropy ... Nemetz method [4]
* Mercer and colleagues (Brown+ 1992) tried to create the best (essentially)
  trigram language model for unlimited vocabulary text,
  measured its perplexity, and challenged the world to do better
* Feretti, Maltese, and Scarci define a new concept, speech decoder entropy,
  which attempts to measure the quantity Hx defined in (5). They describe their
  method and present their result in ... [6]

# 10 Decision Trees and Tree Language Models

## 10.11 Construction of Decision Trees Based on Word Encoding 184 206

* decision tree construction is equivalent to successive refinement of
  equivalence classes driven by answers to questions.  We will introduce
*  We will ... describe
  * Chou's method [3] of quasi-optimal question determination (section 10.7).
  * another decision tree construction method, due to [Brown+ 91]
    specifically aimed at language modeling (section 10.11).  Throughout this
* idea is due to Mercer and is presented in Brown et al. [4]
