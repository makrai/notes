Towards cross-lingual utilization of sparse word representations
Gábor Berend
mszny 2018

# Intro

* [empirical comparison of cross-lingual] word representations
  (Upadhyay, Faruqui, Dyer, Roth, ACL 2016)
* there has not been any work [on]
  sparse word representations which are comparable across languages

# 2 The proposed solution

## 2.1 Preprocessing

* experiments with the embeddings
  * in their unmodified form as well as experiments that i
  * modified in ways commonly met in the literature [9,10]
    * unit length and centralizing the word representations
* orthonormal [12,9,10]

## 2.3 Determining the cross lingual representations

* sparse linear combination of an overcomplete set of basis vectors [5,6]
* The kind of decomposition we employ in this work
  * differs both from (Berend 17) and (Faruqui+ 15) as here we not only
  * require D to comprising of unit norm column vectors, convex but also
  * enforce the coefficients in α to be non-negative
  * We used SPAMS package accompanying (Mairal, Bach, Ponce, Sapiro, ICML ’09)
* Putting the various steps together, our approach can be summarized [as]:
  1. (Optionally) pre-process the embedding[s] by making [them]
    unit long and centered at the origin
  2. Create a (pseudo-)dictionary {(s i , t i )} ni=1 n P
  3. Find the translation mx based on dense vectors (optionally orthonormal)
  4. sparse coding of the source: Find `D_s` and α s such that _..._
  5. Find `α_t` by relying on `D_s` such that `min |M T − D_s α_t|_F + λ|α_t|_1`
* sparse representation being comparable across languages

# 3 Experiments

## 3.1 Evaluation on the Swadesh word list

* Swadesh lists are part of a universal basic vocabulary [14]
  * translated into various languages, including Hungarian

* For the 207-element Swadesh list there are 161 words for which Hungarian
  translations are given in a one-to-one manner, thus
  we perform our evaluation over these word pairs alone
* we calculate for every word pair (s i , t i ) [in the filtered Swadesh]
  the extent of overlap in the sparse representations of words s i and t i
* harmonic mean (F-score) of the precision and recall scores
* Setting λ to 0.1, 0.3 and 0.5 resulted in approximately
                20,   5 and   2 non-zero coefficients per word on average

## 3.2 Evaluation [in cross-lingual] POS tagging

* [in comparison to the] mono-lingual setting performance drop originates
  * not only from the insufficiencies of the cross-lingual representation, but
  * also from [that] state transition features are optimized to English
