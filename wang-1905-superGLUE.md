SuperGLUE: A Stickier Benchmark for General-Purpose Language Understanding Syss
A Wang, Y Pruksachatkun, N Nangia, A Singh, J Michael, F Hill, O Levy, S Bowman
NeurIPS 2019, 1905.00537

https://super.gluebenchmark.com/

# Abstract

* In the last year, new models and methods for pretraining and transfer learn
  * striking performance improvements across a range of NLU tasks
* GLUE (English), introduced a little over one year ago,
  offers a single-number metric that summarizes progress on a diverse set of
* performance on the benchmark has recently surpassed non-expert humans
* we present SuperGLUE, a new benchmark styled after GLUE with
  * a new set of more difficult language understanding tasks, a
    software toolkit, and a public leaderboard

# 1 Intro

* GLUE
  * accompanied by an expertconstructed diagnostic set
  * designed to provide a general-purpose evaluation of language understanding
  * covers a range of training data volumes, task genres, and task formulations
  * We believe it was these aspects that made GLUE particularly appropriate for
    exhibiting the transfer-learning potential of approaches like OpenAI GPT
* The progress of the last twelve months has eroded headroom on GLUE dramatical
  * While some tasks (Figure 1) and some linguistic phenomena (Figure 2 in
    Appendix B) measured in GLUE remain difficult
  * 88.4 from Yang+ (2019) surpasses human performance (87.1 from Nangia and
    Bowman, 2019) by 1.3 points, and in fact
    * exceeds this human performance estimate on four tasks
* Figure 1: GLUE benchmark performance for submitted systems, rescaled
* More information on the tasks included in GLUE can be found in
  * Wang+ (2019a) and in Warstadt+ (2019, CoLA)
  * Socher+ (2013, SST-2)
  * Dolan and Brockett (2005, MRPC)
  * Cer+ (2017, STS-B)
  * and Williams+ (2018, MNLI)
  * and Rajpurkar+ (2016, the original data source for QNLI)
* we introduce SuperGLUE, a new benchmark designed to pose a more rigorous test
  * the same high-level motivation as GLUE: simple, hard-to-game
  * We anticipate that significant progress on SuperGLUE should require
    substantive innovations in a number of core areas of machine learning,
    * sample-efficient, transfer, multitask, and unsupervised or
      self-supervised learning
  * follows the basic design of GLUE
    * public leaderboard built around eight language understanding tasks,
      drawing on existing data, accompanied by a single-number perf metric, and
      an analysis toolkit
  * improves upon GLUE in several ways

## More challenging tasks

* SuperGLUE retains the two hardest tasks in GLUE
* The remaining tasks were identified from those submitted to an open call for
  task proposals and were selected based on difficulty for current NLP

## More diverse task formats

* GLUE are limited to sentence and sentence-pair classification
* We expand to include coreference resolution and question answering (QA)

## Comprehensive human baselines

* human performance estimates for all benchmark tasks, which verify that
  substantial headroom exists between a strong BERT-based baseline and human

## Improved code support: new, modular toolkit

* for work on pretraining, multi-task learning, and transfer learning in NLP,
  built around standard tools eg PyTorch (Paszke+ 17) & AllenNLP (Gardner+ 17)

## Refined usage rules

* The conditions for inclusion on the SuperGLUE leaderboard have been revamped
  to ensure fair competition, an informative leaderboard, and
  full credit assignment to data and task creators
