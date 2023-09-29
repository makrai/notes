The GEM Benchmark: Natural Language Generation, its Evaluation and Metrics
S Gehrmann, T Adewumi, K Aggarwal, P Sasanka Ammanamanchi, A Aremu, A Bosselut,
  K Raghavi Chandu, M Clinciu, D Das, K Dhole, W Du, E Durmus, O Dušek, et al
the 1st Workshop on Natural Language Generation, Evaluation, and Metrics (GEM 2021)

# Abstract

* We introduce GEM, a living benchmark for natural language Generation (NLG),
  its Evaluation, and Metrics
* Measuring progress in NLG relies on a constantly evolving ecosystem of
  automated metrics, datasets, and human evaluation standards. Due to this
* new models often still evaluate on divergent anglo-centric corpora with
  * well-established, but flawed, metrics.  This disconnect makes it
    challenging
* GEM provides an environment in which 
  * models can easily be applied to a wide set of tasks and in which 
  * evaluation strategies can be tested
  * Regular updates to the benchmark will help NLG research become more
    multilingual and evolve the challenge alongside models. This paper serves
    as the description of the data for the 2021 shared task at the associated
    GEM Workshop.

# 5 Results

* aim of GEM: measure the progress in NLG without misrepresenting the complex
  interactions between the sometimes contradicting measures
  * We thus will not distill the complex interplay of the data, metrics, and
    model outputs into a single number or statement, and 
  * we do not present results in a traditional leaderboard. Instead, 
* we developed an interactive result exploration system that allows analyses of
  model results, and which we describe in this section.  To
* Our interactive system aims to enable more nuanced statements such as: System
  Foo leads to consistent performance increases in Bar-type metrics on
  challenges that measure Baz while maintaining equal performance on most
  metrics of type Qux.
* A screenshot of our system is presented in Figure 2.
  * Our interactive system is centered around a parallel coordinates plot
    (Inselberg, 1985) which shows all results as lines through parallel axes.
    Every line intersects the axes at the corresponding mapped value. For
    instance, see the red line representing the results for task “ToTTo” of
    baseline “t5-small”.
* eg the highlighted line in Figure 2 uncovers that, for the T5 baseline on
  ToTTo, 
  * the diversity metrics score higher than other systems while 
  * scoring lower on reference-based metrics
    * Since we only have a single baseline for ToTTo, it is unclear whether
      this difference can be attributed to the dataset or the system but this
* eg comparison of human annotation and automatic measures could lead to a
  better understanding how fluency affect BERTScore.
