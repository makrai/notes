1st Place Solution to Odyssey Emotion Recognition Challenge Task1: 
  Tackling Class Imbalance Problem
Mingjie Chen, Hezhao Zhang, Yuanchao Li, JIACHEN LUO, Wen Wu, Ziyang Ma,
  Peter Bell, C Lai, J D. Reiss, L Wang, P Woodland, X Chen, H Phan, T Hain
Odyssey 2024

# Abstract

* minority classes sometimes being ignored or frequently misclassified.
* Previous work has utilised class weighted loss for training, but problems
  * hE over-fitting for minor classes or under-fitting for major classes.
* we focal loss in optimisation when applying class weighted loss.
  * the focal loss is further weighted by prior-based class weights.
  * better overall performance, by sacrificing performance on major classes.
* we further employ a majority voting strategy to combine the outputs of an
  ensemble of 7 models. The models are trained independently, using different
  acoustic features and loss functions with the aim to have different
* best performance in the challenge, ranking top-1 among 68 submissions. It
* Macro-F1 score of 35.69% and an accuracy of 37.32%
