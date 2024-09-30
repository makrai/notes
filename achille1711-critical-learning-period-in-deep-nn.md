Critical Learning Periods in Deep Neural Networks
Alessandro Achille, Matteo Rovere, Stefano Soatto
arXiv:1711.08856 [cs.LG]

# Abstract

* Similar to humans and animals
* deep artificial neural networks exhibit critical periods
  when a temporary stimulus deficit can impair the development of a skill
  * The extent of the impairment depends on the
    * onset and length of the deficit window, as in animal models, and on the
    * size of the neural network.
* Deficits that do not affect low-level statistics, such as vertical flipping
  of the images, have no lasting effect on performance and can be overcome with
  further training. To better understand this phenomenon,
* we measure the effective connectivity between layers during training
  * using the Fisher Information of the weights
  * Counterintuitiv, information rises rapidly in the early phases of training,
    and then decreases, preventing redistribution of information resources in a
    * we call this a loss of "Information Plasticity".  Our analysis suggests
* the first few epochs are critical for the creation of strong connections that
  are optimal relative to the input data distribution
  * Once such strong connections are created, they do not appear to change
    during additional training
* ie the initial learning transient plays a key role in determining the outcome
  of the training process
  * the early transient has been under-scrutinized compared to asymptot behav
* Our findings, combined with recent theoretical results in the literature,
  also suggest that
  forgetting (decrease of information in the weights) is critical
  to achieving invariance and disentanglement in representation learning.
* Finally, critical periods are not restricted to biological systems, but can
  emerge naturally in learning systems, whether biological or artificial,
  * due to fundamental constrains arising from learning dynamics and
    information processing.
