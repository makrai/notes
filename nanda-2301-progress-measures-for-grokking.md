Progress measures for grokking via mechanistic interpretability
Neel Nanda, Lawrence Chan, Tom Lieberum, Jess Smith, Jacob Steinhardt
arXiv:2301.05217 [cs.LG]

* Neural networks often exhibit emergent behavior, where
  qualitatively new capabilities arise
  from scaling up the amount of parameters, training data, or training steps
* understanding emergence <~ find continuous
  _progress measures_ that underlie the seemingly discontinuous qualitative
  * we: progress measures can be found via mechanistic interpretability:
    reverse-engineering learned behaviors into their individual components. As a
* case study: the recently-discovered phenomenon of
  ``grokking'' exhibited by small transformers trained on modular addition
  * We fully reverse engineer the algorithm learned by these networks, which
    * uses discrete Fourier transforms and trigonometric identities to convert
      addition to rotation about a circle
    * We confirm the algorithm by analyzing the activations and weights and by
      performing ablations in Fourier space
  * Based on this understanding, we define
    progress measures that allow us to study the dynamics of training and
  * split training into three continuous phases:
    memorization, circuit formation, and cleanup. Our results show that
  * grokking, rather than being a sudden shift, arises from the
    gradual amplification of structured mechanisms encoded in the weights,
    followed by the later removal of memorizing components
