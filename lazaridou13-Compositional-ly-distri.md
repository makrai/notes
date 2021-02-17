Angeliki Lazaridou and Marco Marelli and Roberto Zamparelli and Marco Baroni
acl 2013
Compositional-ly Derived Representations of Morphologically Complex Words in
Distributional Semantics

# Introduction

* Distributional semantic models (DSMs)
  * dimensions ... encode corpus-extracted co-occurrence statistics
* correlation between word frequency and vector quality
  (Bullinaria and Levy, 2007)
* In this work, we do not treat inflectional morphology
* derive the meaning of larger constructions
  as a function of the meaning of their constituents
  (Baroni and Zamparelli, 2010; Coecke+ 2010; Mitchell and Lapata, 2008;
  Mitchell and Lapata, 2010; Socher+ 2012)
* in linguistic morphology (Dowty, 1979; Lieber, 2004)
* analogy: sentences
  * Compositional distributional semantic models (cDSMs) of word units
    aim at handling, compositionally, the high productivity of phrases and
    consequent data sparseness
    * hypothesize that the same methods can be applied to morphology
* this paper, we explore, for the first time (except for the proof-of-concept
  study in Guevara (2009)), the application of cDSMs to derivational morphology
  * lexfunc

# Related work

* Morphological induction systems
  * use corpusbased methods to decide if two words are morphologically
  * related and/or to segment words into morphemes
  * (Dreyer and Eisner, 2011; Goldsmith, 2001; Goldwater and McClosky,
  * 2005; Goldwater, 2006; Naradowsky and Goldwater, 2009; Wicentowski,
  * 2004)
  * distributional similarity among morphologically related words
* * Another emerging line of research uses distributional semantics to model
* human intuitions about the semantic transparency of morphologically
* derived or compound expressions
*   Kuperman, 2009;
  * presentation
*   Wang+ 2012

# Composition methods

* compositional DSMs has skyrocketed in the last few years, particularly
* since the influential work of Mitchell and Lapata (2008; 2009; 2010)
* Mitchell and Lapata proposed
  * component-wise operations
    * *mult*iplicative
    * *w*eighter *add*itive
      * \alpha u + \beta v
    * dilation
    * fulladd
      * Guevara (2010) and Zanzotto+ (2010)
      * Au + Bv
      * a mátrixok nem függenek a képzőtől
* we build bound morpheme vectors by accumulating the contexts in which a
* set of derived words containing the relevant morphemes occur, e.g., the
* "re-" vector aggregates co-occurrences of redo, remake, retry, etc
* lexfuncc
  * Baroni and Zamparelli (2010) and Coecke+ (2010) take
  * inspiration from formal semantics to characterize composition in
  * terms of function application
  * c = U v
  * does not require the construction of distributional vectors for
  * affixes
* *stem*
  * using the stem vector as a surrogate of the derived form is a
  * reasonable strategy
* vectors were normalized before composing both in training and in
* generation

# Experimental setup

## 4.1 Morphological data

* list of stem/derived-form pairs from the CELEX English Lexical
* Database,
* POS signature
* human similarity judgements on corpus-extracted vectors
  * Annotation of quality of test vectors
    * ugyanezt automatikusan?
  * Annotation of similarity between stem and derived forms
    * stem/derived relatedness (SDR)

## 4.2 Distributional semantic space

* We use a standard bag-of-words approach, counting collocates in a narrow
  2-word before-and-after window. We apply (non-negative)
* Pointwise Mutual Information as weighting scheme and dimensionality reduction
  by Non-negative Matrix Factorization, setting the number of reduced-space
  dimensions to 350

## 4.3 Implementation of composition methods

* frequency cutoff
* For all methods, vectors were normalized before composing both in
* training and in generation

# Experiment 1: approximating high-quality corpus-extracted vectors

* Cosine similarity
* Both fulladd and lexfunc perform significantly better than stem
* forms containing the “negative” affixes "-less", "un-" and "in-"
*   * modeling negation is a challenging task for DSMs (Mohammad+
  * 2013) as well as cDSMs (Preller and Sadrzadeh, 2011)

# Experiment 2: Comparing the quality of corpus-extracted and compositionally

* generated words
* 	lexfunc being outperformed by both wadd and fulladd
  * both models significantly outperform the stem baseline ... the latter
  * significantly outperforming the corpus-derived vectors

# Conclusion and future work

* melyik szó (szabad morféma) van legközelebb egy képző vektorához?
* morpheme composition and morphological induction jointly
  especially for cases where the complex words are more frequent
  (e.g.  comfort/comfortable)
* Overall, fulladd emerged as the best performing model, with both lexfunc and
  the simple wadd approach constituting strong rivals
