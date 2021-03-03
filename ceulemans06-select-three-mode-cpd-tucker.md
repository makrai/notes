Eva Ceulemans, and Henk A. L. Kiers
Selecting among three-mode principal component models 
  of different types and complexities: A numerical convex hull based method
British Journal of Mathematical and Statistical Psychology (2006), 59, 133–150

# Abstract

* three-mode principal component models for three-way, three-mode data,
  * Candecomp/Parafac, Tucker3, Tucker2, and Tucker1 models
  * question: given a specific data set,
    * which of these models should be selected, and at
    * what complexity, i.e. with how many components?
* a numerical model selection heuristic based on a convex hull
* Simulation results show that this heuristic performs almost perfectly,
  except for Tucker3 data arrays
  with at least one small mode and a relatively large amount of error

# 1. Introduction

* three-mode principal component models consists of the
  * Candecomp/Parafac (CP), Tucker3 (T3), Tucker2 (T2), and Tucker1 (T1) models
    (Carroll & Chang 1970; Harshman 1970; Kroonenberg 1983;
    Kroonenberg & De Leeuw 1980; Tucker 1966)
  * generalizations of standard two-mode principal component analysis (PCA),
  * summarize the main information in the data by reducing up to three modes
    to a few components and defining a linking structure between the components
  * formal relations among (most of) these models
    (Kiers 1991, and Kroonenberg 1983)
* model selection problem has almost always been addressed by
  * first choosing a model type on the basis of substantive arguments and
  * then selecting among solutions of the chosen model type with the aid of
    numerical model selection heuristics developed for the model type
    * e.g. CONCORDIA method for selecting among CP solutions of different
      complexities (Bro & Kiers, 2003) and the
    * DIFFIT method for solving the T3 model selection problem
      (Kiers & der Kinderen, 2003; Timmerman & Kiers, 2000)
* A more systematic approach may be the visual inspection based method
  * proposed by Kroonenberg and Van der Voort (1987), 
    Kroonenberg and Oort (2003), and Murakami and Kroonenberg (2003)
  * plots with a measure of the
    * badness of fit (e.g. residual sum of squares) on the y-axis and a
    * degrees of freedom associated with each solution on the x-axis. In
    * one should select a model on or close to an elbow in the lower boundary
      of the convex hull of this scree-like plot, because these ‘hull’
      solutions have the best badness-of-fit/degrees-of-freedom balance
* we propose and evaluate a numerical procedure for assessing the boundary of
  the convex hull in scree-like plots as well as the elbow in the boundary
  * In contrast to the visual inspection based procedure, this numerical model
    selection heuristic can be programmed, which is important for two reasons
* we use numbers of free parameters rather than degrees of freedom; note that
  * Weesie and Van Houwelingen (1983) pointed out that for the T3 model the
    degrees of freedom equal the number of observations in the data
    minus the number of free parameters

# 2 the family of three-mode principal component models

# 3 the numerical convex hull based model selection heuristic 5

* how one may obtain approximate goodness-of-fit measures
* how the number of free parameters is defined
* how to find the higher boundary of the convex hull as well as an elbow in it

## 3.1. Kiers and der Kinderen’s quick method for approximate T3 and T2

## 3.2. The number of free parameters

## 3.3. Ceulemans and Van Mechelen’s procedure for finding solutions

## 3.4. Selecting among the hull solutions: An implementation of the test

## 3.5. Stepwise overview of the model selection procedure

* one should not use this heuristic too rigidly, but rather as a helpful tool
  for making a first selection of interesting solutions
* for the final selection decision, one should also
  take into account substantive information and interpretability

# 4 applying the model selection heuristic to an empirical data set 10

# 5 the performance is evaluated in an extensive simulation study

# 6 a theoretical and empirical comparison to DIFFIT for T3 14

# 7 Concluding remarks

* Our numerical convex hull based model selection heuristic may also be useful
  for solving other types of complex model selection problem
  * three-mode hierarchical classes models (Ceulemans & Van Mechelen, 2005)
    * closely related to the family of principal component models
  * all model selection problems for which a degrees-of-freedom-like measure
    and a fit measure are available for all solutions considered
    * e.g. loglinear analysis and structural equation modelling
