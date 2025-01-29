Multi-Task Learning Using Uncertainty to Weigh Losses for Scene Geometry and Semantics
Alex Kendall, Yarin Gal, Roberto Cipolla
CVPR 2018 arXiv:1705.07115 [cs.CV]

* Numerous deep learning applications benefit from multi-task learning with
  multiple regression and classification objectives. In this paper 
* from sec 5: all previous methods which learn multiple tasks simultaneously
  use a naı̈ve weighted sum of losse
  * loss weights are uniform, or crudely [nyersen] and manually tuned
* we: the performance of such systems is strongly dependent on the relative
  weighting between each task's loss
  * Tuning these weights by hand is a difficult and expensive process, 
    making multi-task learning prohibitive in practice. We propose a principled
* we considering the homoscedastic uncertainty of each task. This allows us to
  * simultaneously learn various quantities with different units or scales in
    both classification and regression settings. We demonstrate our model
* exper: per-pixel depth regression, semantic and instance segmentation from a
  monocular input image. Perhaps surprisingly, we show our model can learn
  * outperform separate models trained individually on each task.

## 3.1. Homoscedastic uncertainty as task-dependent uncertainty

* In Bayesian modelling, there are two main types of uncertainty one can
  model [24].
  * Epistemic uncertainty is uncertainty in the model, which captures 
    * what our model does not know due to lack of training data. It
    * can be explained away with increased training data.
  * Aleatoric uncertainty captures our 
    uncertainty with respect to information which our data cannot explain.
    * can be explained away with the ability to observe all explanatory
      variables with increasing precision.
    * can again be divided into two subcategories.
      * Data-dependent or Heteroscedastic uncertainty is aleatoric uncertainty
        * depends on the input data and is predicted as a model output.
      * Task-dependent or Homoscedastic uncertainty is aleatoric uncertainty
        * not dependent on the input data. It is not a model output, rather it
        * stays constant for all input data and varies between different tasks.
          It can therefore be described as task-dependent uncertainty.  
* In a multi-task setting, we show that the task uncertainty
  captures the relative confidence between tasks, reflecting 
  the uncertainty inherent to the regression or classification task. It will
  * also depend on the task’s representation or unit of measure. We propose
  * we can use homoscedastic uncertainty as a basis for weighting losses in a
    multi-task learning problem.
