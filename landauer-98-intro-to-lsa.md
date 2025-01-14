TK Landauer, PW Foltz, & D Laham
Introduction to Latent Semantic Analysis
(1998) Discourse Processes, 25, 259-284

# [Intro]

* LSA can be construed in two ways:
  1. as a practical expedient for obtaining approximate estimates of the
    * contextual usage _substitutability_ of words in larger text segments, and
    * similarities among words and text segments
  2. as a model of the computational processes and representations underlying
     ... the acquisition and utilization of knowledge
* Another way to think of this is that LSA
  * represents the meaning of a word as a[n] average of the meaning of all the
    passages in which it appears, and the meaning of a passage as`...`
  * assumes that the choice of dimensionality ... can be of great importance,
  * the resulting dimensions ... are analogous to the semantic features
    often postulated as the basis of word meaning,
  * [but] establishing concrete relations to mentalisticly interpretable
    features poses daunting technical and conceptual problems

## Additional detail about LSA

* data preprocessing transformation, needs to be described more fully
  * subject the data in the raw word-by-context matrix to
    1. frequency (+ 1) in each cell is converted to its log
    2. each cell entry then divided by the row entropy value
      * [the result is] an estimate of its importance in the passage and
        inversely with the degree to which knowing that a word occurs provides
        information about which passage it appeared in
      * have long been known to [improve] IR (Harman, 1986)

## LSA to model human conceptual knowledge

## LSA and information retrieval

## LSA and synonym tests

## Simulating word sorting and relatedness judgments

## Simulating subject-matter knowledge

## Simulating semantic priming

## Assigning holistic quality scores to essay test answers

## LSA and Text Comprehension

## Predicting learning from text

## Summary and some caveats
