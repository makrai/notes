G Bouma
Normalized (pointwise) mutual information in collocation extraction
GSCL, 2009

# Abstract

* more easily interpretable and less sensitive to occurrence frequency
* small empirical study in a collocation extraction setup

# Introduction

* collocation extraction
  * identify in a corpus combinations of words that show some idiosyncrasy in
    their linguistic distribution
  * may be reduced semantic compositionality, reduced syntactic modifiability
    or simply a sense that the combination is habitual or even fixed
  * we refer the interested reader to Manning and Schütze (1999, Ch. 5) and
    especially Evert (2007). A comprehensive study of all aspects of
    collocation extraction with a focus on mathematical properties of
    association measures and statistical methodology is Evert (2005)
    * shared task of the MWE 2008 workshop
      * Baldwin (2008), Evert (2008a), Krenn (2008), and Pecina (2008b)
* dozens of association measures available
  * extreme example see Pecina (2008a), who in one paper compares 55 different
    (existing) association measures and in addition several machine learning
    techniques for collocation extraction
  * different target collocations may be found most effectively with different
    methods and measures. It is therefore useful to have access to a wide array
* In this paper, we introducing two normalized variants of (P)MI
  * motivated by the desire to
    * values have a fixed interpretation; and
    * in the case of PMI, reduce a known sensitivity for low frequency data
  * discuss some theoretical properties + a short empirical study

# 2 Mutual information and PMI

## 2.2 Mutual information in collocation extraction

* application of MI in collocation extraction see Ramish+ (2008)
* test statistic for the log-likelihood ratio G 2
  * as a collocation extraction measure in Dunning (1993)
  * equivalent to MI in collocation extraction (e.g., Evert, 2005)
* _Pointwise_ MI is also one of the standard association measures in colloc ext
  * lexicography by Church and Hanks (1990)
* The statistical measure of effect size relative risk [similarly lacks a max]
  upper bound]. Figuratively, there is a ‘probability roof’
* MWE 2008 shared task results (Evert, 2008b), we can conclude that PMI

# 3 normalized variants

* several ways of normalizing MI and PMI, as
  in both cases the maximum value coincides with several other measures

## 3.1 Normalized PMI: /= ln p(x, y)

##3.2 An aside: PMI^2 = ln (pxy^2/px py)

## 3.3 /= H(X, Y)

## 3.4 Previous work on normalizing (P)MI

* An overview of definitions and data mining references: Yao (2003)
* PMI^2, as special case of PMI^k , was introduced and studied in Daille (1994)
  * together with a range of other association measures
  * PMI^2 and PMI^3 were re-proposed as (log frequency biased) mutual
    dependency in Thanopoulos+ (2002), in an attempt to get a more intuitive
    relation between PMI’s upper bound and occurrence frequency

# 4 empirical study of the effectiveness of these normalized variants

* dataset contains
  * 1212 adjective-noun bigrammes sampled from the Frankfurter Rundschau
  * Krenn (2008) contains 5102 German verb-PP combinations, also from Frankfurt
  * 12232 Czech bigrammes, described in Pecina (2008b)
