Meta-Dataset: A Dataset of Datasets for Learning to Learn from Few Examples
Eleni Triantafillou, Tyler Zhu, Vincent Dumoulin, Pascal Lamblin, Utku Evci,
  Kelvin Xu, R Goroshin, C Gelada, K Swersky, P-A Manzagol, H Larochelle
ICLR 2020 arXiv:1903.03096 [cs.LG]

* Few-shot classification refers to learning a classifier for new classes
  given only a few examples
  * a plethora of models have emerged to tackle it, we find
  * hE procedure and datasets that are used to assess their progress lacking
* we propose Meta-Dataset: a new benchmark for training and evaluating models
  * large-scale, consists of diverse datasets, and more realistic tasks
* We experiment with popular baselines and meta-learners on Meta-Dataset,
  * along with a competitive method that we propose
  * We analyze performance as a function of various characteristics of test
    tasks and examine the models' ability to leverage diverse training sources
    for improving their generalization
  * We also propose a new set of baselines
    for quantifying the benefit of meta-learning in Meta-Dataset
* Our extensive experimentation has uncovered important research challenges
