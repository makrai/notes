Eval Examples are not Equally Informative: How should change Leaderboards?
Pedro Rodriguez, J Barrow, A Miserlis Hoyle, J P. Lalor, R Jia, J BoydGraber
ACL | IJCNLP 2021

# Abstract

* Leaderboards are widely used in NLP and push the field forward
  * hE they can mask nuances in evaluation items (examples) & subjects (models)
  * we advocate a reimagining so that they
    better highlight if and where progress is made
* Building on educational testing, we create a Bayesian leaderboard model where
  latent subject skill and latent item difficulty predict correct responses
  * Using this model, we analyze the ranking reliability of leaderboards
  * the model can guide what to annotate, identify annotation errors,
    detect overfitting, and identify informative examples
* We conclude with recommendations for future benchmark tasks

# 1 Intro

* “superhuman” models that top question answering leaderboards (Najberg, 2018)
  often fail spectacularly (Feng+ 2018; Wallace+ 2019a) by learning
  nongeneralizable statistical patterns (McCoy+ 2019; Niven and Kao, 2019)
* focusing solely on metrics conflates progress on a specific task with
  progress on realworld NLP problems behind the task (Bender and Koller, 2020)
* insight into what drives them and where they fail (Lipton & Steinhardt 2019)
∗ Figure 1: Difficulty and Ability Discriminating (DAD) leaderboards infer
  the difficulty, discriminativeness, and feasibility of examples
  * Negative discriminability suggests an annotation error
  * eg the question with most negative discriminability asks
    “Why did demand for rentals decrease?” when
    the answer is “demand for higher quality housing increased”
* leaderboards should
  * enable and encourage the comparison of models and inspection of examples
  * signal when they have outlived their usefulness
    (BoydGraber and Börschinger, 2020)

## 1.1 How to Direct Leaderboards’ Light

* To help focus attention on examples and models of interest, we propose
  Difficulty and Ability Discriminating (DAD) leaderboards that explicitly
  model both task and submissions jointly, rather than either in isolation
  * underlying model is based on
    Item Response Theory (Lord+ 1968; Baker, 2001, IRT , reviewed in §2),
    a widely used (van Rijn+ 2016) alternative in educational testing
    to simple summary statistics (Edgeworth, 1888)
  * explicitly identify the difficulty and discriminability of items (Fig 1), 2
    which in turn can lead to a more nuanced ranking of models,
    identifying poor items, and better understanding of a dataset and task
  * Throughout the paper, we use the QA benchmark SQuAD 2.0 (Rajpurkar+ 2018)
  * DAD can identify questions that are
    challenging to models / wrong (incorrectly annotated)
  * also helpful for efficiently selecting evaluation items to annotate
  * recommendations for future leaderboards (§7) and discuss
  * where IRT in NLP can go next (§8)

# 6 Related Work

* DAD draws together two primary threads
  * IRT to understand datasets, which has been applied to other NLP tasks, and
  * apply it to improving leaderboards
  * Finally, we explore how the insights of IRT can improve not just the
    analysis of test sets but to improve the construction of test sets

## IRT in NLP

* IRT in machine learning research (MartínezPlumed+ 2016, 2019) where
  automated metrics can be misleading (Sedoc+ 2019):
  * machine translation (Hopkins and May, 2013) and
  * chatbot evaluation (Sedoc and Ungar, 2020)
* Concurrent with/closest to our work
  * Vania+ (2021) compare NLP test sets with IRT
  * Otani+ (2016), who rank machine translation subjects and compute
    correlations with gold scores
* MartínezPlumed and HernándezOrallo (2020) use
  IRT on nonlanguage AI video game benchmarks
* Lalor+ (2016) create challenge sets for textual entailment,
  Just as we use IRT to identify difficult or easy items
* We test IRT as a way to guide annotation, but it can also
* IRT to train deed NLP models: they
  * learn “easy” examples faster (Lalor+ 2018) and
  * maintain test accuracy when training data are downsampled (Lalor+ 2019)

## Improving Leaderboards The rise NLP leaderboards has encouraged

* critical thought into improving them (Linzen, 2020),
* improving evaluation more broadly (Eger+ 2020), and
* thoughtful consideration of their influence on the direction of research
  (Sculley+ 2018; Dotan and Milli, 2020)
* DAD aims make leaderboard yardsticks (HernandezOrallo, 2020)
  more reliable, interpretable, and
  part of curating the benchmark itself
* statistical tests should
  * appear in publications (Dror+ 2018; Dodge+ 2019), they should
  * be “freebies” for leaderboard participants (Ethayarajh and Jurafsky, 2020)
* Hou+ (2019) posit that leaderboards could be automatically extracted from
  publications
* How to aggregate
  multitask benchmarks (Wang+ 2019b,a; Fisch+ 2019) and
  multimetric benchmarks (Ma+ 2021) is an open question which—although we do

* leaderboards should be continually updated. As a (static) leaderboard ages,
  the task(s) overfit (Recht+ 2019) which—although
  * mitigable (Blum and Hardt, 2015; AndersonCook+ 2019)—is
  * best solved by continually collecting new data (Kiela+ 2021)
  * Ideally, new data should challenge models through adversarial collection
    (Wallace+ 2019b; Nie+ 2020)
    * related methods (Gardner+ 2020)
    * if making an easy leaderboard more difficult is possible, the leaderboard
      has outlived its helpfulness and should be retired (Voorhees, 2000)
* alternate task effi cacy rankings, but this naïvely assumes that
  * hE task efficacy is not the sole use case of leaderboards. In deed,
  * focusing solely these factors can mislead the public (Paullada+ 2020) and
    may not reflect human language capabilities (Schlangen, 2020)
  * Leaderboards are also well positioned to provide incentive structures for
    participants to prioritize
    * fairness (Bender and Friedman, 2018) and
    * efficiency (Strubell+ 2019; Schwartz+ 2020; Min+ 2021) or
    * testing of specific capabilities (Ribeiro+ 2020; Dunietz+ 2020)
    * To enable these more nuanced analyses, leaderboards should
      accept runnable models rather than static predictions (Ma+ 2021)

## Active Learning: Beyond IRT, the analysis of training dynamics and ~

* active learning (Settles, 2009) is helpful for actively
  * sampling specific items or identifying low-quality items
    (Brodley and Friedl, 1999)
* Swayamdipta+ (2020) and Pleiss+ (2020)
  * alternative training dynamics-based methods
    for identifying difficult items as well annotation errors
* Rahman+ (2020) use active learning to build a test collection (closer to us)
* Explicitly
  measuring how effectively examples separate the best subject from the rest
  allows test set curators to “focus on the bubble”
  (BoydGraber and Börschinger, 2020), prioritizing examples most likely to
  reveal interesting distinctions between submitted systems

## Alternate Formulations

* IRT is an example of convergent evolution of
  models that predict subject action given an item
* Ideal point models (Poole and Rosenthal, 2017) consider
  how a legislator (subject) will vote on a bill (item) and use a
  similar mathematical formulation
* venerable ELO model (Glickman and Jones, 1999)
  * and modern extensions (Herbrich+ 2007)
  * predict whether a player (subject) will defeat an opponent (item) with,
    again, a similar mathematical model
* Certain IRT models can be formulated as nonlinear mixed models (Rijmen+ 2003)
  * item parameters are fixed effects and the
    latent subject parameters are random effects
  * allows for comparisons between IRT models and other mixed effects models
    under a consistent framework
* IRT base and IRT disc can be formulated as nonlinear mixed models, and
  * IRT feas can be formulated as a discrete mixture model over items
* DAD ’s application of IRT can further be improved by adopting interpretable
  extensions of these models, we discuss further in the next section
