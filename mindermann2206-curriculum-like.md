Prioritized Training
  on Points that are Learnable, Worth Learning, and Not Yet Learnt
Sören Mindermann, Jan Brauner, Muhammed Razzak, Mrinank Sharma, Andreas Kirsch,
  Winnie Xu, B Höltgen, A N. Gomez, A Morisot, S Farquhar, Y Gal
ICML 2022 arXiv:2206.07137 [cs.LG] (workshop version: arXiv:2107.02565)

# Abstract

* Training on web-scale data can take months
  * most computation and time is wasted on redundant and noisy points that are
    already learnt or not learnable
* we introduce Reducible Holdout Loss Selection (RHO-LOSS),
  * a simple but principled technique which
    selects approximately those points for training
    that most reduce the model's generalization loss
* mitigates the weaknesses of existing data selection methods:
  * techniques from the optimization literature typically select 'hard' points,
    (eg high loss)
    * hE such points are often noisy (not learnable) or less task-relevant
  * curriculum learning prioritizes 'easy' points, but such points
    need not be trained on once learned
  * RHO-LOSS: points that are learnable, worth learning, and not yet learnt
    * trains in far fewer steps than prior art, improves accuracy, and speeds
      up training
      on a wide range of datasets, hyperparameters, and
      architectures (MLPs, CNNs, and BERT)
    * On the large web-scraped image dataset Clothing-1M,
      RHO-LOSS trains in 18x fewer steps and reaches
      2% higher final accuracy than uniform data shuffling

# 1. Introduction

* SOTA models such as
  GPT-3 (Brown+ 2020), CLIP (Radford+ 2021), and ViT (Dosovitskiy+ 2021)
  achieve remarkable results by training on vast amounts of web-scraped data
  * Radford A, Kim JW, Hallacy C, Ramesh A, Goh G, Agarwal S, Sastry G,
      Askell A, Mishkin P, Clark J, Krueger G, and Sutskever I
    Learning transferable visual models from natural language supervision,
    2021
  * Dosovitskiy A, Beyer L, Kolesnikov A, Weissenborn D, Zhai X, Unterthiner T,
      Dehghani M, Minderer M, Heigold G, Gelly S, Uszkoreit J, and Houlsby N
    An image is worth 16x16 words: Transformers for image recognition at scale,
    2021
* hE despite intense parallelization, training takes weeks or months
  (Radford+ 2021; Chowdhery+ 2022)
  * Even smaller models face slow development cycles, due to numerous
    iterations of algorithm design and hyperparameter selection. As a result,
    the total time required for training is a core constraint in the
    development of such deep learning models
* large batches
  * If it further sped up training, practitioners with sufficient resources
    would use much larger batches and distribute them across many more machines
    (Anil+ 2018)
  * hE, this has rapidly diminishing returns (LeCun+ 2012)
    to a point where adding machines does not reduce training time
    (McCandlish+ 2018; Anil+ 2018)—see eg GPT-3 and PaLM (Chowdhery+ 2022)
* nL Additional machines can still speed up training
  by filtering out less useful samples (Alain+ 2015)
  * Many web-scraped samples are noisy, ie their
    label is incorrect or inherently ambiguous
  * eg the text associated with a web-scraped image is rarely accurate
  * Redundant samples are commonly part of object classes that are
    over-represented in web-scraped data (Tian+ 2021)
  * web-scraped data is plentiful—often enough to finish training in 1 epoch
    (Komatsuzaki, 2019; Brown+ 2020)—one can afford to skip less useful points
* no consensus on which datapoints are the most useful
  * curriculum learning suggests prioritizing easy points with low label noise
    before training on all points equally (Bengio+ 2009)
  * training on points that are hard for the model: avoiding redundant points,
  * Online batch selection methods
    (Loshchilov & Hutter, 2015; Katharopoulos & Fleuret, 2018; Jiang+ 2019)
    * selecting points with high loss or high gradient norm
* two failure modes of prioritising hard examples
  * in real-world noisy datasets, high loss examples may be mislabelled/ambig
    * Our results show that this failure mode degrades performance severely
  * some samples are hard because they are outliers
    * points with unusual features that are less likely to appear at test time
* we introduce reducible holdout loss selection (RHO-LOSS)
  * selection function grounded in probabilistic modelling that
    quantifies by how much each point would reduce the loss on unseen data if
    we were to train on it, without actually training on it. We show that
  * optimal points for reducing holdout loss are
    non-noisy, non-redundant, and task-relevant
  * To approximate optimal selection, we derive an efficient and
    easy-to-implement selection function: the reducible holdout loss
* extensive experiments on 7 datasets. We evaluate the
  * reduction in required training steps
    compared to uniform sampling and SOTA batch selection methods
  * Clothing1M, the main large benchmark with noisy, web-scraped labels,
    matching our main application
  * RHO-LOSS reaches target accuracy in 18x fewer steps than uniform selection
    and achieves 2% higher final accuracy (Fig. 1)
  * RHO-LOSS consistently outperforms prior art and speeds up training across
    datasets, modalities, architectures, and hyperparameter choices
* from Conclusion: our selection function should be combined with methods in
  Section 5 for cheap and fast selection with maximal speedups

# 4. Experiments

## 4.1. Impact of Approximations

## 4.2. Cheap Irreducible Loss Models & Robustness

## 4.3. Properties of RHO-LOSS & Other Selection Functions

## 4.4. Speedup

# 5. Related Work

## Time-efficient data selection

* Forward passes for selection can be accelerated using low-precision hardware
  or parallelization
* While backward passes typically require high precision, forward passes can
  tolerate lower precision (Jouppi+ 2017; Jiang+ 2019), especially as we only
  need the loss (not the activations which would be needed for backprop)
* A forward pass by default requires roughly 3x less time than a
  forward-backward pass but this speedup can be increased to a factor around
  10x when using the low-precision cores available in modern GPUs and TPUs
  (Jouppi+ 2017; Jiang+ 2019)
* prior work uses
  a set of workers that perform forward passes on B t or on the entire dataset
  asynchronously while
  the master process trains on recently selected data (Alain+ 2015)

## Compute-efficient data selection

* we limit our scope to comparing selection functions & we compute them naively
* nL. Selection can be made cheaper by
  * reusing losses computed in prev epochs (Loshchilov & Hutter 15; Jiang+ 19)
  * training a small model to predict them
    (Katharopoulos & Fleuret, 2017; Zhang+ 2019; Coleman+ 2020)
* Alternatively, core set methods perform selection once before training
  (Mirzasoleiman+ 2020; Borsos+ 2020),
  although typically with more expensive selection functions
  * Mirzasoleiman (2020)
    * CRAIG, a method to select a weighted subset (or coreset) of training data
      that closely estimates the full gradient by maximizing a submodular func

## Data selection functions

* RHO-LOSS is best understood as an alternative to existing selection functions
* selection functions can be categorized
  by the properties of points they select and whether they use info about label
  * “Hard” points are selected both by
    * high loss (Loshchilov & Hutter, 2015; Kawaguchi & Lu, 2020; Jiang+ 2019)
    * high prediction uncertainty (Settles, 09; Li & Sethi, 06; Coleman+ 20)
      * not require labels and can thus be used for active learning
    * both suffer from the same problem: high loss and high uncertainty
      can be caused by noisy (in particular, ambiguous) labels
      * This also applies to selection of points whose labels are easily
        forgotten during training (Toneva+ 2018)
* Noisy points are avoided by our negative IL baseline and similar methods
  (Pleiss+ 2020; Chen+ 2019)
* Points that reduce (expected) holdout loss are also selected for other
  applications (Kirsch+ 2021; Killamsetty+ 2020; Ren+ 2018), although using
  much more computation

## Variance reduction methods

* Online batch selection is also used
  to reduce the variance of the gradient estimator computed by SGD
  (Katharopoulos & Fleuret, 2018; 2017; Johnson & Guestrin, 2018; Alain+ 2015)
* typically use importance sampling
* points with high (approximate) gradient norm are sampled with high prob
  but then down-weighted in the gradient calculation to de-bias the
  gradient estimate
* Without de-biasing, methods like RHO-LOSS also create selection bias
* nL, bias can improve test performance, both in theory and practice
  (Farquhar+ 2021; Kawaguchi & Lu, 2020)

# 6. Conclusion

# Author Contributions
