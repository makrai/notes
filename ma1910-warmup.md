On the adequacy of untuned warmup for adaptive optimization
Jerry Ma, Denis Yarats
AAAI 2021 arXiv:1910.04209 [cs.LG]

# Abstract

* Adaptive optimization algorithms such as Adam: widely used in deep learning
  * stability often improved with a warmup schedule for the learning rate
  * difficulty of choosing and tuning warmup schedules, recent work proposes
  * automatic variance rectification of Adam's adaptive learning rate RAdam
    * surpasses the vanilla Adam algorithm and reduces the need for expensive
      tuning of Adam with warmup. In this work,
* we refute [disprove] this analysis and provide an
  * alternative explanation for the necessity of warmup based on the magnitude
    of the update term, which is of greater relevance to training stability
* We then provide some "rule-of-thumb" warmup schedules, and we demonstrate
  * simple untuned warmup of Adam performs more-or-less identically to RAdam in
    typical practical settings. We
  * suggesting that practitioners stick to linear warmup with Adam, with a
    sensible default being linear warmup over 2/(1−β_2) training iterations

# 1 Intro

* Stochastic gradient-based optimization serves as the workhorse approach for
  many classes of parametric models, including neural networks.  Stochastic
  * and its various first-order cousins (Polyak 1964; Nesterov 1983) have
  * enabled numerous advances in deep learning across domains (Krizhevsky,
    Sutskever, and Hinton 2012; He+ 2016; Gehring+ 2017)
  * adaptive optimization algorithms become prevalent in the largest models
    * Adagrad (Duchi, Hazan, and Singer 2010),
    * RMSProp (Hinton, Srivastava, and Swersky 2012), and
    * Adam (Kingma and Ba 2014)
    * scale the step size for each individual parameter based on various
      gradient moments
* Many practitioners have adopted the Adam algorithm for general-purpose use;
  * the preponderance [túlsúly] of recent SOTA results in NLP (Devlin+ 2018;
    Radford+ 2019; Liu+ 2019b; Brown+ 2020) have employed Adam,
  * effective for networks with parameter counts from 100 million to several B
* In these large-scale settings, Adam’s global learning rate is usually
  annealed with a “warmup schedule” which
  * promotes early-stage training stability by regulating the size of the
    parameter updates
  * The prevalent warmup schedule is a simple linear warmup, in which
    * the global learning rate starts at zero and increases by a constant at
      each iteration until reaching its intended value
    * footnote: also been deployed for first-order optimization (Goyal+ 2017)
  * The parameters of these warmup schedules are typically tuned for each
    problem setting and model
* Liu+ (2020) performed an analysis of Adam with warmup, concluding that
  * Adam requires a warmup schedule to mitigate the large or divergent variance
    of the perparameter scale term
  * propose the rectified Adam (“RAdam”) algorithm, which automatically
    corrects for this high variance
  * highlight the robustness of RAdam, noting in particular that
    * RAdam reduces or eliminates the need for tuning warmup schedules when
      using Adam
* RAdam has been applied to domains including
  * generative modeling (Yamamoto, Song, and Kim 2020),
  * natural language processing (Nguyen and Salazar 2019), and
  * video retrieval (Liu+ 2019a)
* Contributions
  * Reexamining RAdam and the variance-based motivation for warmup
    * We dive into the inner operation of RAdam and find that
    * RAdam is precisely Adam with a fixed warmup schedule, with the only
      deviation being to perform four iterations of heavy-ball momentum (Polyak
      1964) at the outset
    * We then argue that the variance-based motivation for warmup is impaired
      as it overlooks the correlation between the first and second moment
      estimators, which is crucial for understanding the actual parameter
      updates applied by Adam
  * Analyzing Adam’s early-stage update magnitudes
    * Shifting focus from gradients to parameter updates, we then perform a
      simulation-based analysis on the magnitudes of Adam’s parameter updates
    * We find that even at a simulated local minimum of the objective, Adam
      exhibits considerable non-regularity in its early-stage parameter
      updates, shedding light on why Adam may require learning rate warmup to a
      greater extent than first-order optimization methods
  * Demonstrating the sufficiency of untuned warmup
    * We provide some “rule-of-thumb” warmup schedules for Adam, all of which
    * require no tuning
    * As our main empirical result, we demonstrate that these schedules
      result in substantively identical performance and training dynamics to
      those of RAdam
      across a wide range of models, problem settings, and hyperparameters,
      indicating that any claimed benefits can be achieved with lower
      complexity using off-the-shelf optimization tools
    * As a sensible untuned default, we recommend
      linear warmup over `2/(1 − β_2)` iterations
