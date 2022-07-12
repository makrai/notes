An Image is Worth 16x16 Words: Transformers for Image Recognition at Scale
A Dosovitskiy, L Beyer, A Kolesnikov, D Weissenborn, X Zhai, T Unterthiner,
  M Dehghani, M Minderer, G Heigold, S Gelly, J Uszkoreit, N Houlsby
ICLR arXiv:2010.11929 [cs.CV]

* Fine-tuning code and pre-trained models are available at this https URL
google-research/vision_transformer
* ICLR camera-ready version with 2 small modifications:
  * Added a discussion of CLS vs GAP classifier in the appendix,
  * Fixed an error in exaFLOPs computation in Figure 5 and Table 6
    (relative performance of models is basically not affected)

# Abstract

* Transformer's applications to computer vision remain limited
  * attention is either applied in conjunction with convolutional networks, or
    used to replace certain components of convolutional networks
    while keeping their overall structure in place
* We show that this reliance on CNNs is not necessary and
  a pure transformer applied directly to sequences of image patches can perform
  very well on image classification tasks
  * When pre-trained on large amounts of data and
    transferred to multiple mid-sized or small image recognition benchmarks
    (ImageNet, CIFAR-100, VTAB, etc.),
  * Vision Transformer (ViT) attains excellent results compared to SOTA CNNs
    while requiring substantially fewer computational resources to train

# 1 Intro

* Self-attention-based architectures, in particular Transformers (Vaswani+ 17),
  * pre-train on a large text corpus and then fine-tune (Devlin+ 2019)
  * models with over 100B parameters (Brown+ 2020; Lepikhin+ 2020)
  * models and datasets growing, still no sign of saturating performance
* In computer vision, however, convolutional architectures remain dominant
  (LeCun+ 1989; Krizhevsky+ 2012; He+ 2016). Inspired by NLP successes,
  * combining CNN-like architectures with self-attention
    (Wang+ 2018; Carion+ 2020)
  * replacing the convolutions entirely (Ramachandran+ 2019; Wang+ 2020a)
  * theoretically efficient
  * hE
    not yet been scaled effectively on modern hardware accelerators
    due to the use of specialized attention patterns => in large-scale image
    recognition, classic ResNet-like archits are still SOTA
    (Mahajan+ 2018; Xie+ 2020; Kolesnikov+ 2020)
* we experiment with applying a standard Transformer directly to images, with
  the fewest possible modifications
  * we split an image into patches and provide the sequence of linear
    embeddings of these patches as an input to a Transformer
  * Image patches are treated the same way as tokens (words) in an NLP
    application
  * We train the model on image classification in supervised fashion
  * When trained on mid-sized datasets such as ImageNet without strong regu,
    these models yield modest accuracies 
    * a few percentage points below ResNets of comparable size
    * may be expected: Transformers lack some of the inductive biases inherent
      to CNNs, such as translation equivariance and locality, and therefore do
  * nL, if the models are trained on larger datasets (14M-300M images). We find
  * excellent results when pre-trained at sufficient scale
    and transferred to tasks with fewer datapoints
  * When pre-trained on the public ImageNet-21k dataset or the in-house
    JFT-300M dataset, ViT approaches or beats SOTA on multiple image
    recognition benchmarks
    * best model: accuracy of 88.55% on ImageNet, 90.72% on ImageNet-ReaL,
      94.55% on CIFAR-100, and 77.63% on the VTAB suite of 19 tasks
