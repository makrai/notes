Posthoc Interpretation via Quantization
Francesco Paissan=, Cem Subakan=, Mirco Ravanelli
arXiv:2303.12659 [cs.AI]

* we introduce a new approach, called Posthoc Interpretation via Quantization
  (PIQ), for interpreting decisions made by trained classifiers. Our method
* utilizes vector quantization to
  transform the representations of a classifier
  into a discrete, class-specific latent space
* The class-specific codebooks act as a bottleneck that
  forces the interpreter to focus on the parts of the input data deemed
  relevant by the classifier for making a prediction. Our model formulation
* enables learning concepts by incorporating the supervision of pretrained
  annotation models such as SOTA image segmentation models. We
* evaluation through quantitative and qualitative studies involving
  black-and-white images, color images, and audio. As a result of these studies
* PIQ generates interpretations that are
  more easily understood by participants to our user studies when
  compared to several other interpretation methods in the literature
