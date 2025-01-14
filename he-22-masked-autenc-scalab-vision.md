Masked Autoencoders Are Scalable Vision Learners
Kaiming He, Xinlei Chen, Saining Xie, Yanghao Li, Piotr Dollár, Ross Girshick;
IEEE/CVF Conference on Computer Vision and Pattern Recognition (CVPR), 2022

# Abstract

* masked autoencoders (MAE) are scalable self-supervised learners for vision
* Our MAE approach is simple
  * mask random patches of the input image and reconstruct the missing pixels
  * two core designs
    1. asymmetric encoder-decoder architecture:
      * encoder operates only on the visible subset of patches (no mask tokens)
      * lightweight decoder that reconstructs the original image
        from the latent representation and mask tokens
    2. masking a high proportion of the input image, eg 75%,
      * ie a nontrivial and meaningful self-supervisory task
  * Coupling these two designs enables us to train large models effic & effec:
    we accelerate training (by 3x or more) and improve accuracy
    * high-capacity models that generalize well
    * eg, a vanilla ViT-Huge model achieves the best accuracy (87.8%)
      among methods that use only ImageNet-1K data
    * Transfer performance in downstream tasks outperforms supervised pre-train
      * promising scaling behavior

# 1 Intro

* models today can easily overfit one million images [13]
  * demand 100s of millions of—often publicly inaccessible—labeled images [16]
* NLP: self-supervised pretraining
  * autoregressive language modeling in GPT [47, 48, 4] and
  * masked autoencoding in BERT [14], are conceptually simple
  * both remove a portion of the data and learn to predict the removed content
    => generalizable NLP models containing over one hundred billion params [4]
* vision: masked autoencoders, a form of more general denoising autoencoders
  [58], is natural and applicable in computer vision as well
  * closely related research in vision [59, 46] preceded BERT
  * significant interest in this idea following the success of BERT,
  * hE progress of autoencoding methods in vision lags behind NLP
  * what makes masked autoencoding different between vision and language?
* perspectives:
  * Until recently, architectures were different
    * In vision, convolutional networks [34] were dominant over the last
      decade [33]
    * operate on regular grids and it is
    * not straightforward to integrate ‘indicators’ such as mask tokens [14] or
      positional embeddings [57] into convolutional networks
    * This architectural gap, however, has been addressed with the introduction
      of Vision Transformers (ViT) [16] and should no longer be an obstacle
  * Information density is different between language and vision
    * Languages are human-generated signals that are
      highly semantic and information-dense
      * When training a model to predict only a few missing words per sentence,
        this task appears to induce sophisticated language understanding
    * Images are natural signals with heavy spatial redundancy—eg
      * a missing patch can be recovered from neighboring patches with little
        high-level understanding of parts, objects, and scenes
    * To overcome this difference and encourage learning useful features, we
      show that a simple strategy works well in computer vision:
      masking a very high portion of random patches
      * largely reduces redundancy and creates a challenging selfsupervisory
        task that requires holistic understanding beyond low-level image stats.
      * see Figures 2 – 4
    * Figure 2. Example results on ImageNet validation images
      * no loss is computed on visible patches, the model output on visible
        patches is qualitatively worse
    * Figure 3. Example results on COCO validation images, using an MAE trained
      on ImageNet (the same model weights as in Figure 2)
      * Observe the reconstructions on the two right-most examples, which,
        although different from the ground truth, are semantically plausible
  * The autoencoder’s decoder, which maps the latent representation back to the
    input, plays a different role between reconstructing text and images
    * vision: the decoder reconstructs pixels, hence its
      output is of a lower semantic level than common recognition tasks
    * language: the decoder predicts missing words that contain rich sem info
    * While in BERT the decoder can be trivial (an MLP) [14], we found that for
      images, the decoder design plays a key role in determining the semantic
      level of the learned latent representations
* we: a simple, effective, and scalable form of a masked autoencoder (MAE) for
  visual representation learning
  * masks random patches from the input image and
    reconstructs the missing patches in the pixel space
  * asymmetric encoder-decoder design
    * encoder operates only on the visible subset of patches (without mask
      tokens), and our
    * decoder is lightweight and reconstructs the input from the latent
      representation along with mask tokens (Figure 1)
    * Shifting the mask tokens to the small decoder in our asymmetric
      encoder-decoder results in a large reduction in computation
* very high masking ratio (eg 75%) can achieve a win-win scenario: it
    optimizes accuracy while
    allowing the encoder to process only a small portion (eg 25%) of patches
  * reduce overall pre-training time by 3× or more and likewise reduce memory
    consumption, enabling us to easily scale our MAE to large models
* very high-capacity models that generalize well. With MAE pre-training, we
    can train data-hungry models like ViT-Large/-Huge [16] on ImageNet-1K with
    improved generalization performance. With a vanilla ViT-Huge model, we
    achieve 87.8% accuracy when finetuned on ImageNet-1K
  * outperforms all previous results that use only ImageNet-1K data
* We also evaluate transfer learning on object detection, instance
  segmentation, and semantic segmentation
  * better results than supervised pre-training counterparts, and more
  * significant gains by scaling up models
  * observations are aligned with those witnessed in self-supervised
    pre-training in NLP [14, 47, 48, 4] and we hope that they will enable our
