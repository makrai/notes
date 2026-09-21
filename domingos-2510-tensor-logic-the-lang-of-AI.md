Tensor Logic: The Language of AI
Pedro Domingos
arXiv:2510.12269 [cs.AI]

* Progress in AI is hindered by the
  lack of a programming language with all the requisite features. Libraries like
  * PyTorch and TensorFlow provide automatic differentiation and efficient GPU
    implementation, but are additions to
    hE Python was never intended for AI
    * lack of support for automated reasoning and knowledge acquisition
    * a long and costly series of hacky attempts to tack them on. On the other
  * AI languages like LISP and Prolog lack scalability and support for learning
* we propose tensor logic, a language that solves these problems by
  unifying neural and symbolic AI at a fundamental level. The sole construct in
  * tensor equation
    * logical rules and Einstein summation are essentially the same operation,
    * all else can be reduced to them. I show how to
* elegantly implement key forms of neural, symbolic and statistical AI in
  tensor logic,
  including transformers, formal reasoning, kernel machines and graphical models
* tensor logic makes new directions possible, such as
  sound reasoning in embedding space. This
  * combines the scalability and learnability of neural networks
    with the reliability and transparency of symbolic reasoning, and is
  * potentially a basis for the wider adoption of AI
