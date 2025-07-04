Tversky Neural Networks:
  Psychologically Plausible Deep Learning with
Differentiable Tversky Similarity
Moussa Koulako Bala Doumbouya, Dan Jurafsky, Christopher D. Manning
arXiv:2506.11035 [cs.LG]

* the geometric model of similarity standard in deep learning is 
* not psychologically plausible 
  because its metric properties such as symmetry do not align with human
  perception. In contrast, 
* Tversky (1977) proposed an axiomatic theory of similarity based on a
  representation of objects as sets of features, and their similarity as a
  function of common and distinctive features
  * not been used in deep learning before, partly due to the 
  * challenge of incorporating discrete set operations. 
* We develop a differentiable parameterization of Tversky's similarity that is
  learnable through gradient descent, and derive 
  neural network building blocks such as the Tversky projection layer, which
  unlike the linear projection layer can model non-linear functions such as XOR
* experiments with image recognition and language modeling, we show that 
  * the Tversky projection layer is a beneficial replacement for the linear
    projection layer, which employs geometric similarity. On the 
  * NABirds image classification task, a frozen ResNet-50 adapted with a Tversky
    projection layer achieves a 24.7% relative accuracy improvement over the
    linear layer adapter baseline
  * GPT-2's perplexity on PTB decreases by 7.5%, and its 
    parameter count by 34.8%. Finally, we propose 
* a unified interpretation of both projection layers as
  computing similarities of input stimuli to learned prototypes, for which we
  * we also propose a novel visualization technique highlighting the
    interpretability of Tversky projection layers. Our work offers
  * a new paradigm for thinking about the similarity model implicit in deep
    learning
