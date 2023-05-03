Imbalanced regression and extreme value prediction
Rita P. Ribeiro & Nuno Moniz
Machine Learning volume 109, pages 1803–1835 (2020)

# Abstract

* imbalanced domain learning has
  almost exclusively focused on solving classification tasks for
  accurate pred of cases labelled with a rare class. Approaches for addressing
  * regression tasks are still scarce due to two main factors
    1. standard regression tasks assume each domain value as equally important
    2. standard evaluation metrics focus on assessing the performance of models
       on the most common values of data distributions
* we imbalanced regression tasks: objective is to predict extreme (rare) values
  * We propose an approach to formalise such tasks and to optimise/evaluate
    predictive models, overcoming the factors mentioned and issues in rel work
  * an automatic and non-parametric method to obtain relevance functions,
  * relevance as the mapping of target values into non-uniform domain preferenc
  * SERA, a new evaluation metric capable of assessing the effectiveness and of
    optimising models towards the prediction of extreme values while penalising
    severe model bias
  * An experimental study demonstrates how SERA provides valid and useful
    insights into the performance of models in imbalanced regression tasks

# 1 Intro

* domains such as finance, meteorology or environmental sciences, the
  * goal is often the prediction of uncommon events, also known as rare/extreme
  * Imbalanced domain learning
  * two characteristics (Branco+ 2016): 
    * skewed distribution of target variables and 
    * domain preference for underrepresented cases.
* research aspects include 
  (Fernández+ 2018; Branco+ 2016; López+ 2013; Krawczyk 2016; He and Ma 2013).
  * the formalisation of the task, 
  * shortcomings of standard learning algorithms, 
  * strategies to overcome such limitations, and 
  * the search for appropriate evaluation metrics
* classification and, especially, binary classification, has been the main
  * liter on regression is negligible.
* two significant challenges. 
  1. to provide a principled approach capable of describing non-uniform
     preferences over continuous domains.
    * Figure 1 illustrates the difference between the standard assumption of
      uniform and that of non-uniform preferences. Although trivial for
      classification tasks (eg deciding the positive class), ad-hoc solutions
    * require a specification of preferences over a potentially infinite
    * require automatic methods for specifying those preferences. Nonetheless,
    * assumptions concerning the shape of the distribution, such as the
      * eg normality.  Such assumption has long-standing reports of its
      * theoretical and practical inconsistencies (Hald 1998; Wilcox 1990)
        especially when assumed in continuous distributions (Wilcox 2005).
      * a common assumption in machine learning and in
        the related topic of utility-based regression
  2. evaluation and optimisation criteria without severe model biasing
    * standard metrics for regression focus on the normal behaviour of models.
    * alternative metrics, these either/or
      * consider all target values as equally important (Crone+ 2005), ie uniform
      * allow for extraordinary model biasing towards extreme values, resulting
        => low generalisation capability. In this work, we tackle these challs

* we provide a new basis for the formalisation of imbalanced regression tasks
  and metrics for model evaluation and optimisation in this context.
  * identification of issues in related work and the proposal of new methods.
  * a review of earlier work on utility-based regression, and non-standard
    evaluation metrics for numerical prediction;
  * an automatic and non-parametric method to infer non-uniform domain
    preferences biased to extreme values, tackling the assumption of an
    underlying normal distribution in earlier work (Torgo and Ribeiro 2007);
  * a new evaluation metric SERA (Squared Error-Relevance Area) allowing the
    optimisation and evaluation of models as to their ability to predict
    extreme values, while robust to severe model biasing;
  * an extensive experimental study which shows that 
    * SERA provides a robust tool for
      * selection and optimisation procedures, as well as
      * the analysis of prediction models’ performance and, 
    * its impact and predictive trade-offs;
  * an open-source package containing all developed methods.1

# 2 The task of imbalanced regression along with a motivating example. 

* preference criterion L on the training set
* In regression, overall error estimates are used as standard preference criter
  * eg mean absolute error or mean squared error.
  * They focus on minimising the avg error across the domain of the target var
  * predominance of cases with target values within/near the central tendency

## 2.1 Taxonomy for imbalanced domain learning

* Three factors must be considered when analysing imbalanced learning tasks: 
  * the distribution of the target variable: balanced or imbalanced
  * domain preferences concerning accurate predictions: uniform or non-uniform
  * their predictive focus
    * Balanced distributions with non-uniform preferences have
      a predictive focus on specific intervals or classes
    * As for imbalanced distributions, their predictive focus is either on
      average values/common cases or extreme values/rare cases
* fig 2: A schematic definition of such type of tasks
  * The characteristic conditions for imbalanced domain learning are marked red

### 2.1.1 Target variable distribution

* classification tasks, assuming a binary class scenario, the target variable
  * imbalanced if the discrepancy in class cardinality is large, ie given a
* regression tasks, we consider that the target variable distribution is
  imbalanced when extreme values (or outliers) are present
  * Commonly—but not necessarily—it translates to a skewed distribution.

### 2.1.2 Domain preferences

* eg the temperature at noon in a season of wildfire danger, consider the task
  * a predicted value of 30 °C for true values of 20 °C or 40 °C incurs an
    error of equal magnitude.  hE, the latter presents a more hazardous

### 2.1.3 Predictive focus

* Fig. 3 The pdf of the log-transformed NO2 hourly concentration values (LNO2)
  * vertical line: the limit threshold established by Directive 2008/50/EC
* which intervals have more or less importance wrt precise predictions. In case
  * if the underlying distribution is considered balanced, under non-uniform
    domain preferences, the predictive focus will concern specific intervals of
    values or a given class (or set of classes). As for the case where the
  * if the distribution of values is considered imbalanced, possibilities
    mainly concern focusing on average/common values or extreme/rare values.

* imbalanced regression tasks when, given a distribution of continuous values, 
  * such distribution shows the presence of outliers, 
  * domain preferences are not uniform, and 
  * predictive focus is on extreme values. The following sec: motivating exampl

## 2.2 Application: prediction of outdoor air pollution

* why not simplify the predictive task by casting it as a classification task,
  aggregating in a class all the extreme and dangerous values? In addition to
  * multiple issues extensively raised in previous research (Royston+ 2006)
  * two key issues
    1. it does not solve the imbalance issue,
      ie the most important class would be much less frequent than any other
      * unless the number of bins and the respective cut-off points can be
        defined based on domain knowledge
    2. creates crisp and artificial divisions between values of the target
       variable. This causes the relationship between the response and the
       predictors to be flat within intervals, thus dismissing the notion of
       numeric precision to a great extent
      * the mentioned air pollution study
        * limit concentration value of 150 μg/m3, let ŷ 1 = 149 and ŷ 2 = 200
          be predictions of models M1 and M2, respectively, for a
          true value y = 151. If transformed into a classification problem,
        * model M2 would be more precise, although M1 presents the best
          approximation (smallest numeric deviation).  Also,
        * consider a prediction from a third model M3 where ŷ 3 = 151. As a
          * predictions of models M2 and M3 would be considered equally correct
          * hE M3 presenting a precise prediction of the true value.
* two challenges
 1. describe non-uniform preferences over continuous (and infinite) domains;
 2. properly optimise and evaluate predictive models in such settings. We

# 3 Relevance and a new non-parametric method to generate relevance funcs auto

* domains such as
  climate/weather (Freemeteo 2017),
  electricity (Koprinska+ 2011) and
  water demand (Herrera+ 2010) or
  financial markets (Akbilgic+ 2014)
* In such domains, there are multiple tasks focused on models’ ability to
  * eg prediction of extremely/abnormally/harmfully high or low stock market
* this section: review and formalise an approach to obtain relevance functions,
  * a non-parametric approach for its automatic definition.

## 3.1 Definition 7

* Torgo and Ribeiro (2007) translate a target value into a scale of relevance,
  describing the importance of obtaining an accurate prediction.
* Ribeiro (2011) proposes a first approach for obtaining relevance functions,
  used in forecast (Torgo+ 2013; Branco+ 2016; Moniz+ 2017b, a; Branco+ 2019)

* Definition 1 (Relevance function) A relevance function 𝜙(Y) ∶ Y → [0, 1] is a
  continuous function that expresses the application-specific bias concerning
  * 0 and 1 represent the minimum and maximum relevance, respectively.

* given the potentially infinite nature of the target variable domain,
  specifying the relevance of all values is virtually impossible, requiring an
  approximation. Two essential components are necessary

### control points: a set of data points where relevance is known

### which interpolation method to use

## 3.2 Illustrative example

## 3.3 Automatic and non‑parametric relevance functions

* the most extreme values should have maximum relevance. On the contrary,
  * the most common values of the distribution should have minimum relevance.
* Determining which values of a distribution should be considered extreme
  * outlier/anomaly detection and extreme value analysis
* there are several unsupervised approaches (Chandola+ 2009)
* eg statistical-based, proximity-based, using notions of distance or density,
  and clustering-based detection techniques
* distribution-based analysis, ie statistical techniques
  * if our problem is univariate, resort to them
  * parametric and non-parametric approaches
  * parametric: approaches based on Gaussian or a mixture of parametric distris
  * non-parametric is commonly based on histograms and kernel functions
* thorough analyses and discussions of outlier/extreme value detection
  * Aggarwal (2013), Chandola+ (2009) and Hodge and Austin (2004).
* Tukey’s boxplot rule (1970) is one of the most frequently used statistical
  graphic methods (Wickham and Stryjewski 2012) for depicting data from
  continuous distributions. This method
  * illustrates information concerning the location, spread, skewness and tails
  * a box to represent the interquartile range (IQR) and
  * two whiskers that define the fences of the boxplot, based on the IQR
    * ie limits for values considered normal.
  * This interval frames average values; when outside such interval, values are
    considered probable outliers—the target cases in imbalanced regression.
  * hE assumes a normal distribution of data points, ie distribution symmetry.
  * When learning with skewed and asymmetrical distributions, this rule is
    prone to erroneously classifying specific data points as being outliers
    (Hoaglin+ 1983)
    * apply a transformation, eg logarithm, to make the data distri symmetrical
      and detect outliers afterwards
    * finding a robust transformation to symmetry with application to all
      distributions is far from trivial.  An adaptation to Tukey’s original
    * adjusted boxplot, proposed by Hubert and Vandervieren (2008). The
      * using a robust measure of skewness when determining the fences of the

* The interval proposed by Tukey (1970) for determining outliers cutoff values
  is [Q1 − 1.5 IQR, Q3 + 1.5 IQR] where
  Q1 and Q3 are the first and third quartile, respectively, and
  IQR = Q3 − Q1 is the interquartile range. To make this interval less prone to
* Hubert and Vandervieren (2008) propose to incorporate the medcouple,
  introduced by Brys+ (2004), into the definition of the whiskers
  * The medcouple is a robust alternative to the classical skewness coefficient 
    based on variance and skewness of data. It is location and scale-invariant,
    and defined as
`MC = med_{xi ≤Q2 ≤xj} h(xi , xj )`, (1) where
  Q2 is the second quartile (median) and
  for all xi ≠ xj the kernel function h is given by h(xi , xj ) = (xj − Q2 ) −
  (Q2 − xi ) xj − x i (2)

* the following intervals will mark points outside them as potential outliers:
  * if MC ≥ 0, then the interval is [Q1 − 1.5 e−4MC IQR, Q3 + 1.5 e3MC IQR];
  * if MC < 0, then the interval is [Q1 − 1.5 e−3MC IQR, Q3 + 1.5 e4MC IQR].

* the use of such exponential functions, allows the boxplot to be more
  skewness-adjusted as the fences might be asymmetric around the box.
  (Hubert and Vandervieren 2008)

* in context of imbalanced regression tasks, the adjusted boxplot method
  presents a better alternative for two main reasons. First, it is
  1. non-parametric, therefore more flexible to underlying distributions.
  2. by using a robust measure of skewness, the method is
    better suited to avoid missing real cases of extreme values (outliers).

* fig 5 To illustrates the difference between the two types of boxplots, in
  * Tukey’s boxplot and the adjusted boxplot for a set of
  * 1000 artificial generated values from different theoretical distributions.
    * for Binomial, Logistic and Poisson distributions there is almost no diff
    * symmetric distributions such as Normal and Student t distributions
      present a slight difference between the two boxplots (blue). Finally, we
    * heavily skewed distributions (red), namely 𝜒 2, Exponential, Gamma,
      Geometric, LogNormal and Weibull distributions. For these distributions,
      the diff between Tukey’s boxplot and adjusted boxplot is more evident:
      * the number of extreme values (outliers) identified by the latter is
        much smaller in comparison to the former.
* We propose the use of adjusted boxplot to automatically supply the control
  points, based on the methodology presented by Ribeiro (2011)—initially
  => obtaining a continuous relevance function that maps the domain of the
  target variable Y to the relevance interval [0, 1] so that the extreme values
  of Y are assigned maximum relevance. As such, the upper and lower adjacent
  values are considered threshold values for extremes. Also, the median value
  of Y is considered as a centrality value of irrelevance
  * Three points compose the set of control points:
    the median value of Y with relevance value equal to zero and
    the upper and lower adjacent values with relevance value equal to one
  * All these control points are assumed to have a derivative of zero so that
    they represent local maximum and minimum of the relevance function. The
    pchip interpolation method (cf. Algorithm 1) receives this set of control
    points and derives an extreme-based relevance function 𝜙().
* tab 2 and fig 6 Re[turn]s to the air pollution scenario
  * regarding the most critical values in this particular data set,
    the proposed automatic method (red) obtains a relevance function similar to
    the relevance function obtained by the established guidelines based on
    Directive 2008/50/EC (blue).

## 3.4 Discussion on relevance functions

* without the introduction of domain knowledge, automatic relevance functions
  cannot approximate such knowledge naturally. This might only occur when the
  control points derived by the sample distribution approximate those of domain
  knowledge.
* the ideal scenario is to have access to domain knowledge that would allow the
  relevance function to express as closely as possible the reality
* As that is often hard to obtain, we present a non-parametric alternative to
  automatically induce a relevance function based on the target variable sample
  distribution. We assume that extreme values are the most relevant ones

# 4 Evaluation metrics for imbalanced regression tasks and a new metric 14 for
assessing model performance. 

# 5 An extensive experimental study to support initial claims

# 6 Results

# 7 Conclusions
