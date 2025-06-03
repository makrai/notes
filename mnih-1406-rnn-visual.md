Recurrent Models of Visual Attention
Volodymyr Mnih, Nicolas Heess, Alex Graves, Koray Kavukcuoglu
arXiv:1406.6247 [cs.LG]

# Abstract

* Applying convolutional neural networks to large images is computat expensive
  * the amount of computation scales linearly with the number of image pixels.
* We present a novel recurrent neural network model that is capable of
  * adaptively selecting a sequence of regions or locations and
    only processing the selected regions at high resolution
  * Like convolutional neural networks, the proposed model
    has a degree of translation invariance built-in, but
  * unlike CNNs, the amount of computation it performs can be controlled
    independently of the input image size. While the model is
  * non-differentiable, nL it can be trained using reinforcement learning
    * task-specific policies
* evaluation on several image classification tasks, where it
  * significantly outperforms a convolutional neural network baseline
    on cluttered images, and on a dynamic visual control problem, where it
  * learns to track a simple object without an explicit training signal
