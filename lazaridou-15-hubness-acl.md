Hubness and Pollution: Delving into Cross-Space Mapping for Zero-Shot Learning
Angeliki Lazaridou, Georgiana Dinu and Marco Baroni
ACL 2015 Long, Oral

# Abstract

* Zero-shot methods in language, vision and other domains rely on a
  * cross-space mapping function that projects vectors
    * from e.g., visual feature-based image representations
    * to a large semantic word space
* current performance ... is still quite low
  * not yet usable in practical applications.
* In this paper, we explore some general properties,
  * both theoretical and empirical, of the cross-space mapping function, and we
    build on them to propose better methods to estimate it
  * large improvements over the state of the art, both in cross-linguistic
    (word translation) and cross-modal (image labeling) zero-shot experiments

# 1 Intro

* We connect hubness to least-squares estimation, and we show how it is greatly
  mitigated (enyhül) when the mapping function is estimated with a max-margin
  ranking loss instead. Still,
* max-margin
  * greatly improves accuracy in the cross-linguistic context, but
  * not for vision-to-language mapping.
* In the cross-modal setting, we observe indeed a different problem, that we
  name (training instance) pollution: The neighbourhoods of mapped test items
  are “polluted” by the target vectors used in training. This suggests that
  cross-modal mapping suffers from overfitting issues, and consequently from
  poor generalization power.
  * Taking inspiration from domain adaptation, which addresses similar
    generalization concerns, and self-learning, we propose a technique to
    augment the training data with automatically constructed examples that
    force the function to generalize better. Having shown the advantages of a
    ranking loss,
* our final contribution is the adaptation of some insights from the max-margin
  literature to our setting, in particular concerning the
  * choice of negative examples. This leads to further accuracy improvements.
    We thus conclude the paper by reporting zero-shot performances in both
    cross-modal and cross-language settings that are well above the cur-

former state of art
standard mapping
max-margin - §3
data augmentation - §4
negative evidence - §5
