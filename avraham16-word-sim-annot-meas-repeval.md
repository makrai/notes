Improving Reliability of Word Similarity Evaluation 
  by Redesigning Annotation Task and Performance Measure
Oded Avraham and Yoav Goldberg
2016 repeval

# Abstract

we 
* redesigning the annotation task to achieve higher inter-rater agreement, and
* a performance measure which takes the reliability of each annotation de-
  cision in the dataset into account.

# 1 Introduction

* a dataset of Hebrew nouns similarity

# 2 Existing Methods and Datasets for Word Similarity Evaluation

* several datasets
  * RG (Rubenstein and Goodenough, 1965), 
  * WordSim-353 (Finkelstein et al., 2001),
  * WS-Sim (Agirre et al., 2009) and 
  * MEN (Bruni et al., 2012)
* evaluated by [rank] correlation (Spearman’s ρ)
* Hill et al 
  * associated but dissimilar words, e.g.  (singer, microphone): 
    * ranked high, sometimes even above pairs of similar words. 
    * Other datasets (WS-Sim and RG) do not contain pairs of associated words 
  * low inter-rater agreement

# 3 Problems with the Existing Datasets

Hill et al (2015) ... found a clear preference for 
  * hyponym-hypernym pairs (e.g. (cat, pet) and (winter, season) higher than 
      * cohyponyms pair (cat, dog) and the 
      * antonyms pair (winter, summer))
1. the use of rating scales
  * vulnerable to a variety of biases (Friedman and Amoo, 1999).
  * Bruni et al (2012) addressed this problem by asking the annotators to
    rank each pair in comparison to 50 randomly selected pairs
      * daunting annotation task
2. rating different relations on the same scale
  sim(smart, dumb) = 0.55), others got significantly higher ones (e.g.
  sim(winter, summer) = 2.38). A difference of 1.8 similarity scores should not
  be underestimated – in other cases it testifies to a true superiority of one
  pair over another, e.g.: sim(cab, taxi) = 9.2, sim(cab, car) = 7.42
3. The third problem is rating different targetwords on the same scale. Even
   within preferredrelation pairs, there are ill-defined comparisons, e.g.:
   (cat, pet) vs. (winter, season). It’s quite unnatural to compare between
   pairs that have different target-words, in contrast to pairs which share the
   target word, like (cat, pet) vs. cat, animal).  Penalizing a model for
   preferring (cat, pet) over (winter, season) or vice versa impairs the
   evaluation reliability. ?
4. evaluation measure does not consider annotation decisions reliability
  * determined by the agreement of the annotators on this decision.
  * addressed by Luong et al (2013) which included many rare words in their
    dataset, and thus allowed an annotator to indicate “Don’t know” for a pair
    if they does not know one of the words.

# 4 Proposed Improvements

1. (1) The annotation task will be an explicit ranking task. Similarly to Bruni
   et al (2012), each pair will be directly compared with a subset of the other
   pairs. Unlike Bruni et al, each pair will be compared with only a few
   carefully selected pairs, following the principles in (2) and (3).
2. (2) a single preferredrelation type (we can create other datasets for tasks in
   which the preferred-relation is different), and only preferred-relation
   pairs will be presented to the annotators. We suggest to spare the
   annotators the effort of considering the type of the similarity between
   words, in order to let them concentrate on the strength of the similarity.
   Word pairs following unpreferred-relations will not be included in the
   annotation task but will still be a part of the dataset – we always add them
   to the bottom of the ranking
3. (3) Any pair will be compared only with pairs sharing the same target word
4. (4) The dataset will include a reliability indicator

## A Concrete Dataset

* the preferred-relation (to apply improvement (2)). In what follows we use the
  hyponym-hypernym relation.
* binary comparison is a value R > (w 1 , w 2 ; w t ) indicating how likely
  it is to rank the pair (w t , w 1 ) higher than (w t , w 2 )
  target word

## Scoring Function # TODO megérteni

# 5 Experiments

We created 
* two datasets following the proposal discussed above: one preferring
the hyponymhypernym relation, and the other the cohyponym relation. 
* Hebrew nouns
* we used 
  * a dictionary, an encyclopedia and a thesaurus to create the
  hyponym-hypernym pairs, and 
  * databases of word association norms (Rubinsten et
  al., 2005) and categories norms (Henik and Kaplan, 1988) to create the
  distractors pairs and the cohyponyms pairs, respectively
* agreement was quite high
