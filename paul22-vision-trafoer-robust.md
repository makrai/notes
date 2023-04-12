Vision Transformers Are Robust Learners
Sayak Paul Carted and Pin-Yu Chen
Vol. 36 No. 2: AAAI-22 Technical Tracks 2 / AAAI Technical Track on CV II

Code for reproducing our experiments is available at https://git.io/J3VO0

# Abstract

* Transformers, composed of multiple self-attention layers, hold strong
* generic learning primitive applicable to different data modalities,
* recent breakthroughs in computer vision achieving SOTA standard accuracy
* hE robustness evaluation and attribution is unexplored
* we study the robustness of the Vision Transformer (ViT, Dosovitskiy+ 2021)
  against common corruptions and perturbations, distribution shifts, and
  natural adversarial examples
* six different diverse ImageNet datasets concerning robust classification
* comprehensive performance comparison of ViT (Dosovitskiy+ 2021) models and
  SOTA convolutional neural networks (CNNs) like Big-Transfer (Kolesnikov+ 2020)
* six systematically designed experiments
* quantit and qualit indications to explain why ViTs are indeed more robust
  * with fewer parameters and similar dataset and pre-training combinations,
    ViT gives a top-1 accuracy of 28.10% on ImageNet-A which is
    4.3x higher than a comparable variant of BiT
* analyses on image masking, Fourier spectrum sensitivity, and spread on
  discrete cosine energy spectrum reveal intriguing properties of ViT
  attributing to improved robustness

# 1 Intro

* recent works on evaluating the robustness of ViTs (Bhojanapalli+ 2021; Shao+
  2021; Mahmood, Mahmood, and Van Dijk 2021) 
  * relatively limited scope. We build on top of these and provide further and
* we
  * use common robustness benchmark datasets
  (Hendrycks and Dietterich 2019; Hendrycks+ 2020, 2021; Xiao+ 2021). We then
  * quantitative and qualitative analyses to help understand the reasons behind
* contributions:
  * We use 6 diverse ImageNet datasets concerning
    different types of robustness evaluation and conclude that
    ViTs achieve significantly better performance than BiTs.
  * We design 6 experiments, including robustness to masking, energy/loss
    landscape analysis, and sensitivity to highfrequency artifacts
  * novel insights for robustness attribution of ViT.  Moreover, our robustness
    * our tools are generic and can be used to study future image classif

# 2 Related Work

* image generation
  * Parmar+ (2018): Transformers (Vaswani+ 2017) for image super-resolution
  * Image-GPT (Chen+ 2020) used Transformers for unsupervised pre-training from
    pixels of images.  However, the transfer performance of the pre-training
    method is not on par with supervised pre-training methods
* ViT (Dosovitskiy+ 2021) takes the original Transformers and makes very
  minimal changes to make it work with images. In fact, this was one of the
  primary objectives of ViT ie to keep the original Transformer architecture
  as original as possible and then examining how that pans out for image
  classification in terms of large-scale pretraining. As noted in (Dosovitskiy+
  2021; Steiner+  2021), because of the lesser number of inductive biases, ViT
  needs to be pre-trained on a relatively larger dataset (such as ImageNet-21k
  (Deng+ 2009)) with strong regularization for achieving reasonable downstream
  performance. Strong regularization is particularly needed in the absence of a
  larger dataset during pre-training (Steiner+ 2021).

* variants of Transformers have been proposed to show that it is possible to
  achieve comparable performance on ImageNet-1k without using additional data.
  * DeIT (Touvron+ 2020) introduces a novel distillation strategy (Hinton,
    Vinyals, and Dean 2015) to learn a student Transformer-based network from a
    well-performing teacher network based on RegNets (Radosavovic+ 2020).  With
    * 85.2% top-1 accuracy on ImageNet-1k without any external data
  * T2T-ViT (Yuan+ 2021) proposes a novel tokenization method enabling the
    network to have more access to local structures of the images
    * For the Transformer-based backbone, it follows a deep-narrow network
      topology inspired by (Zagoruyko and Komodakis 2016). With proposed
    * 83.3% top-1 accuracy on ImageNet-1k
  * LV-ViT (Jiang+ 2021) introduces a new training objective namely
    token labeling and also tunes the structure of the Transformers. It
    * 85.4% top-1 accuracy on ImageNet-1k
  * CLIP (Radford+ 2021) and Swin Transformers (Liu+ 2021) are also two recent
    * make use of Transformers for image recognition problems
  * we only focus on ViT (Dosovitskiy+ 2021).

* Concurrent works that study the robustness of ViTs from different
  * Shao+ (2021) showed that ViTs has better robustness than CNNs against
    adversarial input perturbations. The major performance gain can be
    attributed to the capability of learning high-frequency features that are
    more generalizable and the finding that convolutional layers hinder
    adversarial robustness
  * Bhojanapalli+ (2021) studied improved robustness of ViTs over ResNets (He+
    2016) against adversarial and natural adversarial examples as well as
    common corruptions. Moreover, it is shown that
    * ViTs are robust to the removal of almost any single layer
  * Mahmood, Mahmood, and Van Dijk (2021) studied adversarial robustness of
    ViTs through various white-box, black-box and transfer attacks and found
    * model ensembling can achieve unprecedented robustness
      without sacrificing clean accuracy against a black-box adversary. This
  * diff Mahmood+ vs our insights
    * we benchmark the robustness of ViTs on a wide spectrum of ImageNet
      datasets (see Table 2), which are the most comprehensive robustness
      performance benchmarks to date; 
    * we design six new experiments to verify the superior robustness of ViTs
      over BiT and ResNet models.
