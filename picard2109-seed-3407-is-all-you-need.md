Torch.manual_seed(3407) is all you need: On the influence of random seeds in
deep learning archits for computer vision David Picard arXiv:2109.08203 [cs.CV]

* popular deep learning architectures for computer vision
* I scan a large amount of seeds (up to 104) on CIFAR 10 and I also scan fewer
  seeds on Imagenet using pre-trained models (large scale datasets)
* even if the variance is not very large
* surprisingly easy to find an outlier that performs much better or much worse

# 1 Intro

* 3. Does pretraining on larger datasets mitigate variability induced by the
  choice of seed?
* Mehrer+ (2020): these affect the obtained networks such a way that they
  differ measurably. I strongly believe it is important
* to have a sense of the influence of these factors on the results in terms of
  evaluation metrics
  * Bouthillier+ (2021) on different tasks, including computer vision, but
    limited to smaller datasets and only 200 runs.  Instead of performing the
    tedious work of measuring the influence of each source of randomness at
    larger scales, I propose instead to ask the much
* The variations I measure are thus the accumulation of all random factors
  relying on the random seed and if they are small enough, then the

# 2 experimental setup used and motivate my choice. Then I discuss the

# 3 limitations of this experiments and how they affect the conclusions we can

* the accuracy obtained in these experiments are not at the level of the SOTA
  * the variations observed in these experiments could very well disappear
    after longer training times and/or with the better setup required to reach
    higher accuracy.  This is a clear
  * Models are evaluated at convergence, as I show in the next section. On the
  * CIFAR 10, the long training setup is roughly on par with the SOTA of 2016
  * For ImageNet the baseline ResNet50 obtains an average accuracy of 75.5%,
    * not very far from the original model at 76.1%. The results using
    * SSL are also close to that of the original DINO paper
    * experiments on ImageNet underestimate the variability because they all
      start from the same pretrained model ie the effect of the seed is limited
      to the init of the classif layer and the optimization process

# 4 findings with respect to each question with the chosen experimental setup

# 5 conclusions from this findings bounded by the limitations exposed earlier

* with respect to the three opening questions:

## What is the distribution of scores with respect to the choice of seed?

* The distribution of accuracy when varying seeds is relatively pointy, which
  * fairly concentrated around the mean
  * Once the model converged, this distribution is relatively stable which ie
    some seed are intrinsically better than others

## Are there black swans, i.e., seeds that produce radically different results?

* Yes.  On a scanning of 10 4 seeds, we obtained a difference between the
  maximum and minimum accuracy close to 2% which is above the threshold
  commonly used by the computer vision community of what is considered
  significant

## Does pretraining on larger datasets mitigate variability induced by the

* It certainly reduces the variations due to using different seeds, but it does
  not mitigate it
  * On Imagenet, we found a difference between the maximum and the minimum
    accuracy of around 0.5%, which is commonly accepted as significant by the
    community for this dataset

## [recent work in computer vision: an implicit scan of seeds]

* there are more than 10 4 submissions to major computer vision confs each year
  * Of course, the submissions are not submitting the very same model
  * hE an exploration of the seed landscape comparable in scale of the present
    study, of which the best ones are more likely to be selected for publi-
    cation because of the impression it has on the reviewers
  * For each of these submissions, the researchers are likely to have modified
    many times hyper-parameters or even the computational graph through trial
    and error as is common practice in deep learning. Even if these changes
    where insignificant in terms of accuracy, they would have contributed to an
    implicit scan of seeds. Authors may inadvertently be searching for a lucky
    seed just by tweaking their model. Competing teams on a similar subject
    with similar methods may unknowingly aggregate the search for lucky seeds
* I am (definitely not) saying
  * not that all recent publications in computer vision are the result of lucky
    seed optimization. This is clearly not the case, these methods work
  * hE many results are overstated due to implicit seed selection
    be it from common experimental practice of trial and error or of the
    “evolutionary pressure” that peer review exerts on them
* doubt could easily be lifted in two ways
  * First, by having a more robust study performed. I am very much interested
    in having a study scanning 10 4 to 10 5 seeds in a large scale setup, with
    big SOTA models trained from scratch. That would give us some empirical
    values of what should be considered significant and what is the effect of
    randomness
  * more rigorous in its experimental setup. I strongly suggest aspiring
    * randomness study by varying seeds and if possible dataset splits and
      reporting average, standard deviation, minimum and maximum scores
