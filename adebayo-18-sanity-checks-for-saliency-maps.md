Sanity Checks for Saliency Maps
Julius Adebayo, J Gilmer, M Muelly, I Goodfellow, M Hardt, B Kim
NeurIPS 2018

https://github.com/adebayoj/sanity_checks_saliency

# Abstract

* Saliency methods highlight features in an input deemed relevant for the pred
  * often guided by visual appeal on image data
* we propose an actionable methodology to evaluate
  what kinds of explanations a given method can and cannot provide
  * reliance, solely, on visual assessment can be misleading
  * some existing saliency methods are independent both of the model and of the
    data generating process
  * methods that fail the proposed tests are inadequate for
    tasks that are sensitive to either data or model,
    eg finding outliers in the data, explaining the learned relationship
    between inputs and outputs, and debugging the model
  * analogy with edge detection in images, a technique that requires neither
    training data nor model
  * Theory in the case of a linear model and a single-layer convolutional
    neural network supports our experimental findings

# 1 Intro

* explanation methods to elucidate important aspects of learned models [1, 2]
  * could potentially help
    * satisfy regulatory requirements [3],
    * debug their model [4, 5], and
    * reveal bias or other unintended effects learned by a model [6, 7]
* Saliency methods
  * footnote: We refer here to the broad category of visualization and
    attribution methods aimed at interpreting trained models. These methods are
    often used for interpreting deep neural networks particularly on image
  * highlight relevant features in an input, typically, an image. Despite much
  * significant recent contribution [8–21], the valuable effort of explaining
  * hE difficulty of assessing the scope and quality of model explanations. A
  * paucity [scarcity] of principled guidelines
    confound the practitioner when deciding between an abundance of methods
* We propose an actionable methodology based on randomization tests
  * We instantiate our analysis on several saliency methods for neu image class
  * methodology applies in generality to any explanation approach. Critically,
  * easy to implement, and can help assess the suitability of an explanation
                                                        method for a given task
* we apply our methodology to numerous existing saliency methods,
  model architectures, and data sets
  * some widely deployed saliency methods are independent of both the data the
    model was trained on, and the model parameters
  * Consequently, these methods incapable of assisting with tasks that depend
    * on the model, such as debugging the model, or tasks that depend
    * on the relationships between inputs and outputs present in the data
* Figure 1 compares  standard saliency methods with an edge detector
  * visual similarity with saliency maps. This goes to show that
  * ie visual inspection is a poor guide in judging sensitivity to model & data
  * the methods most similar (see Appendix for SSIM metric) to an edge
    detector, i.e., Guided Backprop and its variants, show minimal sensitivity
    to our randomization tests
* Our methodology derives from the idea of a statistical randomization test,
  comparing the natural experiment with an artificially randomized experiment
  * two instantiations: model parameter randomization test, and a data randomiz
  * The model parameter randomization test
    compares the output of a saliency method on a trained model
    with the output of the saliency method on a randomly initialized untrained
    network of the same architecture
  * The data randomization test compares a given saliency method applied to a
    model trained on a labeled data set with the method applied
    to the same model architecture but trained on a copy of the data set in
    which we randomly permuted all labels
    * If a saliency method depends on the labeling of the data, we should again
      expect its outputs to differ significantly in the two cases
  * more broadly, any explanation method admits a set of invariances, i.e.,
    transformations of data and model that do not change the output of the
    * If we discover an invariance that is incompatible with the requirements
    * sanity checks to perform before deploying a method in practice
* Our contributions
  1. two concrete, easy to implement tests for assessing the scope and quality
  2. extensive experiments with several explanation methods across data sets
     and model architectures, and find, consistently, that
    * some of the methods tested are independent of both the model and the labl
  3. Of the methods we tested,
    * Gradients & GradCAM pass the sanity checks, while
    * Guided BackProp & Guided GradCAM fail
    * In the other cases: visual perception versus ranking dichotomy,
      which we describe in our results
  4. the saliency methods that fail our tests are incapable of supporting tasks
  5. We interpret our findings through
    * analyses of linear models and a simple 1-layer convolutional sum-pooling
    * a comparison with edge detectors
