Scaling Laws for Transfer
Danny Hernandez, Jared Kaplan, Tom Henighan, Sam McCandlish
arXiv:2102.01293 [cs.LG]

* We study empirical scaling laws for transfer learning between distributions
  in an unsupervised, fine-tuning setting
  * When we train increasingly large neural networks from-scratch on a
    fixed-size dataset, they eventually become data-limited and stop improving
    in performance (cross-entropy loss)
  * When we do the same for models pre-trained on a large language dataset, the
    slope in performance gains is merely reduced rather than going to zero
  * We calculate the effective data "transferred" from pre-training
    by determining how much data a transformer of the same size would have
    required to achieve the same loss when training from scratch
    * ie we focus on units of data while holding everything else fixed. We find
  * the effective data transferred is described well in the low data regime by
    a power-law of parameter count and fine-tuning dataset size. We believe the
    * exponents in these power-laws correspond to measures of the generality of
      a model and proximity of distributions (in a directed rather than
      symmetric sense)
    * pre-training effectively multiplies the fine-tuning dataset size.
    * Transfer, like overall performance, scales predictably in terms of
      parameters, data, and compute. 
