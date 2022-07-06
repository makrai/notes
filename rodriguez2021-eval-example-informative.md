Evaluation Examples are not Equally Informative: How should that change NLP Leaderboards?  
Pedro Rodriguez, J Barrow, A Miserlis Hoyle, J P. Lalor, R Jia, J Boyd-Graber
ACL | IJCNLP 2021

# Abstract

* Leaderboards are widely used in NLP and push the field forward. While
  * hE can mask nuances in evaluation items (examples) and subjects (NLP
    models). Rather than replace leaderboards, we advocate a re-imagining so
    that they better highlight if and where progress is made
* Building on educational testing, we create a Bayesian leaderboard model where
  latent subject skill and latent item difficulty predict correct responses.
  Using this model, we analyze the ranking reliability of leaderboards.
  Afterwards, we show the model can guide what to annotate, identify annotation
  errors, detect overfitting, and identify informative examples
* We conclude with recommendations for future benchmark tasks.

# 1 Intro

* “super-human” models that top question answering leaderboards (Najberg, 2018)
  often fail spectacularly (Feng+ 2018; Wallace+ 2019a) by learning
  non-generalizable statistical patterns (McCoy+ 2019; Niven and Kao, 2019).
* focusing solely on metrics conflates progress on a specific task with
  progress on realworld NLP problems behind the task (Bender and Koller, 2020).
* insight into what drives them” and where they fail (Lipton & Steinhardt 2019)
∗ Figure 1: Difficulty and Ability Discriminating ( DAD ) leaderboards infer
  the difficulty, discriminativeness, and feasibility of examples
  * Negative discriminability suggests an annotation error; for example, the
    question with most negative discriminability asks “Why did demand for
    rentals decrease?” when the answer is “demand for higher quality housing
    increased.”
* leaderboards should
  * enable and encourage the comparison of models and inspection of examples.
  * signal when they have outlived their usefulness
    (Boyd-Graber and Börschinger, 2020)

## 1.1 How to Direct Leaderboards’ Light

* To help focus attention on examples and models of interest, we propose
  Difficulty and Ability Discriminating ( DAD ) leaderboards that explicitly
  model both task and submissions jointly, rather than either in isolation. 1
  * underlying model is based on Item Response Theory (Lord+ 1968; Baker, 2001,
    IRT , reviewed in §2), a widely used (van Rijn+ 2016) alternative in
    educational testing to simple summary statistics (Edgeworth, 1888).
  * explicitly identify the difficulty and discriminability of items (Figure
    1), 2 which in turn can lead to a more nuanced ranking of models,
    identifying poor items, and better understanding of a dataset and task.
  * Throughout the paper, we use the question answering ( QA ) benchmark SQ u
    AD 2.0 (Rajpurkar+ 2018)
    * DAD can identify questions that are challenging to models and questions
      that are wrong (incorrectly annotated).
    * also helpful for efficiently selecting evaluation items to annotate. We
      conclude with recommendations for future leaderboards (§7) and discuss
      where IRT in NLP can go next (§8).
