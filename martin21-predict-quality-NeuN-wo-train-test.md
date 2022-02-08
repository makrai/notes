Predicting trends in the quality of SOTA neural networks
  without access to training or testing data
Charles H. Martin, Tongsu (Serena) Peng, & Michael W. Mahoney
Nature Communications volume 12, Article number: 4122 (2021)

# Abstract

* neural network models (pre)trained by someone else
  * no access to training data or test data
  * one may not know details about the model, e.g., the specifics of the
    training data, the loss function, the hyperparameter values, how reguled
* say anything about the expected performance or quality of the models
* we: a detailed meta-anal of hundreds of publicly available pretrained models
  * norm-based capacity control metrics as well as power law based metrics from
    the recently-developed Theory of Heavy-Tailed Self Regularization
* norm based metrics
  * correlate well with reported test accuracies for well-trained models, but
  * often cannot distinguish well-trained versus poorly trained models
* power law based metrics can do much better
  * quantitatively better at discriminating among series of well-trained models
    with a given architecture
  * qualitatively better at discriminating well-trained versus poorly trained
* These methods can be used to identify when a pretrained neural network has
  problems that cannot be detected simply by examining training/test accuracies

# [Intro] A common problem in machine learning (ML) is to evaluate the quality

* training/testing curves give very limited insight into the overall properties
  * not take into account the (often large human and CPU/GPU) time for
    hyperparameter ﬁddling
  * not correlate with robustness or fairness or interpretability
  * when the model user is not the model developer
    * no access to the training data or the testing data.  Instead, one may
    * use it as-is, or to ﬁne-tune and/or compress it and then use it
* need for a practical theory to guide that practice
  * Moreover, ML as an industrial process will become compartmentalized in
    order to scale: some/other groups gather data/develop models/use the models
* no obvious way to deﬁne an ideal test metric
  * for many large scale, practical applications
  * For example, models that generate fake text or conversational chatbots
    * cluster user proﬁles, which are widely used in areas such as marketing
* determining whether one has enough data for a given model
* Methods that are developed and evaluated on any well-deﬁned publicly
  available corpus of data, no matter how large or diverse or interesting, are
  clearly not going to be well-suited to address problems such as this
* examine the weight matrices of pretrained models, e.g., properties such as
  * norms of weight matrices and/or
    * have been used in traditional statistical learning theory to bound
      capacity and construct regularizers
  * parameters of Power Law (PL) ﬁts of the eigenvalues of weight matrices
    * based on statistical mechanics approaches to deep neural networks (DNNs)
* we want to examine different models across common architecture series, and we
  want to compare models between different architectures themselves
* we consider a large suite of hundreds of publicly available models,
  mostly from computer vision (CV) and natural language processing (NLP)
  * there are e.g., hundreds of pretrained models in CV (≥500) and NLP (≈100)
    (When we began this work in 2018, there were fewer than tens of such
    models)
  * in a year or two there will be an order of magnitude or more models
* main results
  * norm-based metrics do a reasonably good job at predicting quality trends in
    welltrained CV/NLP models
  * norm-based metrics may give spurious results when applied to poorly trained
    models (e.g., models trained without enough data, etc.)
    * e.g. they may exhibit what we call Scale Collapse for these models
  * PL-based metrics can do much better at predicting quality trends in
    pretrained CV/NLP models.  In particular,
    * a weighted PL exponent (weighted by the log of the spectral norm of the
      corresponding layer) is
      quantitatively better at discriminating among a series of well-trained
      versus very-well-trained models within a given architecture series; and
    * the (unweighted) average PL exponent is qualitatively better at
      discriminating well-trained versus poorly-trained models
  * PL-based metrics can also be used to
    * characterize ﬁne-scale model properties, including what we call
      layer-wise Correlation Flow, in well-trained and poorly-trained models;
    * evaluate model enhancements (e.g., distillation, ﬁne-tuning, etc.)
  * a theoretically principled empirical evaluation
    * by far the largest, most detailed, and most comprehensive to date—and
    * the theory we apply was developed previously 1–3
    * such a meta-analysis is quite rare in ML,
      where the emphasis is on develing better training protocols

# Results 2

## Overall approach

* objective/optimization function (parameterized by W l s and b l s) for a DNN
  with L layers, and weight matrices W l and bias vectors b l , as the
  minimization of a general loss function L over the training data instances
  and labels, {x i ; y i } \in D. For a typical supervised classiﬁcation problem,
  the goal of training is to construct (or learn) W l and b l that capture
  correlations in the data, in the sense of solving 
  argmin ∑ L(E DNN (x i ); y i )
  where the loss function L(; ) can take on a myriad of forms 4 , and where the
* energy (or optimization) landscape function
  E DNN = f (x i ; W 1 , ... , W L ; b 1 , ... , b L ) (2) depends
  parametrically on the weights and biases.
  For a trained model, the form of the function E DNN does not explicitly
  depend on the data (but it does explicitly depend on the weights and biases).
  The function E DNN maps data instance vectors (x i values) to predictions (y
  i labels), and thus the output of this function does depend on the data.
  Therefore, one can analyze the form of E DNN in the absence of any training
  or test data.
* Test accuracies have been reported online for publicly available pretrained
  pyTorch models 5 . These models have been trained and evaluated on labeled
  data {x i ; y i } \in D, using standard techniques.  We do not have access to
  this data, and we have not trained any of the models ourselves.
  * Our methodological approach is thus similar to a statistical meta-analysis,
    common in biomedical research, but uncommon in ML.
  * Computations were performed with the publicly available WeightWatcher tool
    (version 0.2.7) 6 .  To be fully reproducible, we only examine publicly
    available, pretrained models, and we provide all Jupyter and Google Colab
    notebooks used in an accompanying github repository 7 . See Supplementary
    Note 1 for details.
* Our approach involves analyzing individual DNN weight matrices, for
  (depending on the architecture) fully connected and/or convolutional layers.
  Each DNN layer contains one or more layer 2D N l × M l weight matrices, W l ,
  or pre-activation maps, W i,l , e.g., extracted from 2D Convolutional layers,
  where N > M. (We may drop the i and/or i, l subscripts below.) The best
  performing quality metrics depend on the norms and/or spectral properties of
  each weight matrix, W, and/or, equivalently, it’s empirical correlation
  matrix, X = W T W
* metrics
  * Frobenius Norm: ||W|| 2 F = ||X|| F = ∑ λ i (3)
  * Spectral Norm:  ||W|| 2 \inf = ||X|| \inf = λ max (4)
  * Weighted Alpha: `α^ = \alpha log \lambda_max` (5)
  * α-Norm (or α-Shatten Norm):
             ||W|| 2α 2α = ||X|| α α = ∑_{i=1..M}\lambda_i^\alpha
* To perform diagnostics on potentially problematic DNNs, we will decompose α ^
  into its two components, α and λ max . Here, λ i is the i th eigenvalue of
  the X, λ max is the maximum eigenvalue, and α is the ﬁtted PL exponent. These
  eigenvalues are squares of the singular values σ i of W, λ i = σ 2 i . All
  four metrics can be computed easily from DNN weight matrices. The ﬁrst two
  metrics are well-known in ML. The last two metrics deserve special mention,
  as they depend on an empirical parameter α that is the PL exponent that
  arises in the recently developed Heavy Tailed Self Regularization (HT-SR)
  Theory 1–3 .

In the HT-SR Theory, one analyzes the eigenvalue spectrum, i.e., the Empirical
Spectral Density (ESD), of the associated correlation matrices 1–3 . From this,
one characterizes the amount and form of correlation, and therefore implicit
self-regularization, present in the DNN’s weight matrices. For each layer
weight matrix W, of size N × M, construct the associated M × M (uncentered)
correlation matrix X. Dropping the L and l, i indices, one has
X = 1/N W^T W
If we compute the eigenvalue spectrum of X, i.e., λ i such that Xv i = λ i v i
, then the ESD of eigenvalues, ρ(λ), is just a histogram of the eigenvalues,
formally written as ρ(λ) = ∑ M i=1 δ(λ  λ i ): Using HT-SR Theory, one
characterizes the correlations in a weight matrix by examining its ESD, ρ(λ).
It can be well-ﬁt to a truncated PL distribution, given as
\rho(\lambda)~\lambda^{-\alpha}, which is (at least) valid within a bounded
range of eigenvalues λ ∈ [λ min , λ max ].

The original work on HT-SR Theory considered a small number of NNs, including
AlexNet and InceptionV3. It showed that for nearly every W, the (bulk and tail)
of the ESDs can be ﬁt to a truncated PL, and that PL exponents α nearly all lie
within the range α ∈ (1.5, 5) (footnotes 1–3)
* the mechanism responsible for these properties,
  statistical physics offers several possibilities 8,9 , e.g.,
  self-organized criticality 10,11 or multiplicative noise in the stochastic
  optimization algorithms used to train these models 12,13
  * related techniques have been used to analyze correlations and information
    propogation in actual spiking neurons 14,15 
  * Our meta-analysis does not require knowledge of mechanisms; and it is
  * not even clear that one mechanism is responsible for every case
* HT-SR Theory predicts that
  smaller values of α should correspond to models with better correlation over
  multiple size scales and thus to better models.
* “size scale”
  * well-deﬁned in physical systems, to which this style of analysis is usually
    applied, but it is
  * less well-deﬁned in CV and NLP applications
  * Informally, it would correspond to
    pixel groups that are at a greater distance in some metric, or between
    sentence parts that are at a greater distance in text.  Relatedly, previous
  * smaller exponents α correspond to more implicit self-regularization and
    better generalization, and that
  * we expect a linear correlation between α^ and model quality 1–3 .  
* For norm-based metrics, we use the average of the log norm, to the
  appropriate power. Informally, this amounts to assuming that the layer weight
  matrices are statistically independent, in which case we can estimate the
  model complexity C, or test accuracy, with a standard Product Norm (which
  resembles a data dependent VC complexity),

C ~|| W 1|| \times|| W 2|| \times ... \times|| W L ||; 
* log complexity,
  * log C ~ log ||W 1|| + log ||W 2|| + ... + log ||W L|| = ∑ log ||W l ||  (9)
  * takes the form of an average Log Norm
  * For the Frobenius Norm metric and Spectral Norm metric, we can use Eq. (9)
    directly (since, when taking log|| W l|| 2 F , the 2 comes down and out of)
* The Weighted Alpha metric is an average of α l over all layers l ∈ {1, …, l},
  weighted by the size, or scale, or each matrix,
  `α ^ = ∑ α l log λ max;l \approx <log|| X|| α α >`
  * correlate well with trends in reported test accuracies of pretrained DNNs,
    albeit on a much smaller and more limited set of models than we consider
* we introduce and evaluate the α- Shatten Norm metric,
  * ∑ log|| X l|| αl αl  = ∑ α l log|| X l|| α l:
  * α l varies from layer to layer, and so in Eq. (11) it cannot be taken out
    * For small α, the Weighted Alpha metric approximates the Log α-Shatten
* the Weighted Alpha and α-Shatten norm metrics often behave like an improved,
  weighted average Log Spectral Norm.
* Finally, although it does less well for predicting trends in SOTA model
  series, e.g., as depth changes, the average value of α, `α = 1/L ∑ α l = <α>`
  can be used to perform model diagnostics, to identify problems that cannot be
  detected by examining training/test accuracies, and to discriminate poorly
  trained models from well-trained models.
* determine α for a given layer by ﬁtting the ESD of that layer’s weight matrix
  to a truncated PL, using the commonly accepted Maximum Likelihood method
  * This method works very well for exponents between α ∈ (2, 4); and it is
    adequate, although imprecise, for smaller and especially larger α 18 .
  * Operationally, α is determined by using the WeightWatcher tool 6 to
    ﬁt the histogram of eigenvalues, ρ(λ), to a truncated PL,
    ρ(λ) ~ λ α ; λ \in [λ min ; λ max ] (13)
    where λ max is the largest eigenvalue of X = W T W, and where
    λ min is selected automatically to yield the best (in the sense of
    minimizing the K-S distance) PL ﬁt. Each of these quantities is deﬁned for
    a given layer W matrix. See Fig. 1 for an illustration.

To avoid confusion, let us clarify the relationship between α and \α^.  We ﬁt
the ESD of the correlation matrix X to a truncated  PL, parameterized by 2
values: the PL exponent α, and the maximum eigenvalue λ max.  The PL exponent α
measures the amount of correlation in a DNN layer weight matrix W. It is valid
for λ ≤ λ max , and it is scale-invariant, i.e., it does not depend on the
normalization of W or X. The λ max is a measure of the size, or scale, of W.
Multiplying each α by the corresponding log λ max weighs “bigger” layers more,
and averaging this product leads to a balanced, Weighted Alpha metric α ^ for
the entire DNN. We will see that for well-trained CV and NLP models, α ^
performs quite well and as expected, but for CV and NLP models that are
potentially problematic or less well-trained, metrics that depend on the scale
of the problem can perform anomalously. In these  cases, separating α^ into its
two components, α and λ max , and  examining the distributions of each, can be
helpful.

## Comparison of CV models. Each of the VGG, ResNet, and DenseNet series of
models consists of several pretrained DNN

## Comparison of NLP Models 8. Within the past few years, nearly 100 open source,
pretrained NLP DNNs based on the revolu-

## Comparing hundreds of models. We have performed a large-scale analysis of
hundreds of publicly available models. This

# Discussion 11

# Methods 12 [1 col]

# Data availability


Data analyzed during the study are all publicly available; and data generated
during the study are available along with the code to generate them in our
public repository (https:// github.com/CalculatedContent/ww-trends-2020).

# Code availability


Code sufﬁcient to generate the results of the study is available in our public
repository (https://github.com/CalculatedContent/ww-trends-2020).
