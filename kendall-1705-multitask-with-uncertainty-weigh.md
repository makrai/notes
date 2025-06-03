Multi-Task Learning Using Uncertainty to Weigh Losses
  for Scene Geometry and Semantics
Alex Kendall, Yarin Gal, Roberto Cipolla
CVPR 2018 arXiv:1705.07115 [cs.CV]

* deep learning applications benefit from multi-task learning with
  multiple regression and classification objectives
* from sec 5: all previous methods which learn multiple tasks simultaneously
  use a naı̈ve weighted sum of losses
  * loss weights are uniform, or crudely [nyersen] and manually tuned
* we: the performance of such systems is strongly dependent on
  the relative weighting between each task's loss
  * Tuning these weights by hand is a difficult and expensive process,
    making multi-task learning prohibitive in practice
* we considering the homoscedastic uncertainty (sec 3.1) of each task
  * simultaneously learn various quantities with different units or scales in
    both classification and regression settings
* exper: per-pixel depth regression, semantic and instance segmentation from a
  monocular input image
  * outperform separate models trained individually on each task

## 3.1. Homoscedastic uncertainty as task-dependent uncertainty

* In Bayesian modelling, there are two main types of uncertainty [24]
  * Epistemic uncertainty is uncertainty in the model
    * what our model does not know due to lack of training data
    * can be explained away with increased training data
  * Aleatoric uncertainty captures our
    uncertainty with respect to information which our data cannot explain
    * can be explained away with the ability to observe all explanatory
      variables with increasing precision
    * can again be divided into two subcategories
      * Data-dependent or Heteroscedastic uncertainty
        * depends on the input data and is predicted as a model output
      * Task-dependent or Homoscedastic uncertainty
        * not dependent on the input data
        * stays constant for all input data and varies between different tasks
        * ie task-dependent uncertainty
* In a multi-task setting, we show that the
  task uncertainty captures the relative confidence between tasks,
  reflecting the uncertainty inherent to the regression or classification task
  * also depend on the task’s representation or unit of measure
  * we can use homoscedastic uncertainty as a basis for weighting losses in a
    multi-task learning problem
