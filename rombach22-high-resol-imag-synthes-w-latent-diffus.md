High-Resolution Image Synthesis with Latent Diffusion Models
Robin Rombach; Andreas Blattmann; Dominik Lorenz; Patrick Esser; Björn Ommer
2022 IEEE Conference on CVF

pretrained latent diffusion and autoencoding models at
https://github.com/CompVis/latent-diffusion

# Abstract

* diffusion models (DMs)
  * decomposing the image formation process into
    a sequential application of denoising autoencoders
  * SOTA synthesis results on image data and beyond
  * formulation allows for a guiding mechanism to
    control the image generation process without retraining
  * hE typically operate directly in pixel space
    => optimization consumes hundreds of GPU days and
    inference is expensive due to sequential evaluations
  * DM training on limited computational resources while retaining qual & flex
* we apply DMs in the latent space of powerful pretrained autoencoders
  * we reach a near-optimal point between complexity reduction and
    detail preservation, greatly boosting visual fidelity
  * with cross-attention layers in the model architecture,
    diffusion models turn into powerful and flexible generators for general
    conditioning inputs such as text or bounding boxes and high-resolution
    synthesis becomes possible in a convolutional manner
  * Our latent diffusion models (LDMs) achieve
    new SOTA scores for image inpainting and class-conditional image synthesis
    * highly competitive performance on various tasks
      eg unconditional image generation, text-to-image synthesis, and
      super-resolution, while
    * significantly reducing computational requirements compared to pixel-based

# 1. Introduction

## Departure to Latent Space

* First: analysis of already trained diffusion models in pixel space
  * Fig 2 shows the rate-distortion trade-off of a trained model
  * with a likelihood-based model, learning can be roughly divided into two
    1. perceptual compression stage which
      removes high-frequency details but still learns little semantic var
    2. semantic compression: the actual generative model learns the semantic
       and conceptual compositoin of the data
  * We thus aim to first find a perceptually equivalent, but computationally
    more suitable space, in which we will train diffusion models for
    high-resolution image synthesis
* we separate training into two distinct phases
  * Following common practice [11, 23, 64, 65, 93], we
  * First, we train an autoencoder which provides a lower-dimensional (and
    thereby efficient) representational space which is perceptually equivalent
    to the data space
  * in contrast to previous work [23,64], we do not need to rely on excessive
    spatial compression, as we train DMs in the learned latent space, which
    exhibits better scaling properties with respect to the spatial dim
  * The reduced complexity also provides efficient image generation from the
    latent space with a single network pass
  * We dub the resulting model class Latent Diffusion Models (LDMs)
* we need to train the universal autoencoding stage only once and can therefore
  reuse it for multiple DM trainings or to explore possibly completely
  different tasks [78]
  * enables efficient exploration of a large number of diffusion models for
    various image-to-image and text-to-image tasks
  * text-to-image: we design an architecture that connects transformers to the
    DM’s UNet backbone [69] and
    enables arbitrary types of token-based conditioning mechanisms, Sec  3.3
* contributions:
  * In contrast to purely transformer-based approaches [23, 64], our method
    scales more graceful to higher dimensional data and can thus
    * work on a compression level which provides more faithful and detailed
      reconstructions than previous work (see Fig 1) and
    * can be efficiently applied to high-resolution synthesis of megapixel imgs
  * We achieve competitive performance on multiple tasks and datasets
    * tasks: unconditional image synthesis, inpainting, stochastic super-resol
    while significantly lowering computational costs. Compared to pixel-based
    diffusion approaches, we also significantly decrease inference costs
  * not require a delicate weighting of reconstruction and generative
    abilities
    * in contrast to previous work [90] which learns both an encoder/decoder
      architecture and a score-based prior simultaneously
    * ensures extremely faithful reconstructions and
      requires very little regularization of the latent space
  * We find that for densely conditioned tasks
    such as super-resolution, inpainting and semantic synthesis,
    our model can be applied in a convolutional fashion and
    render large, consistent images of ∼ 10242 px
  * Moreover, we design a general-purpose conditioning mechanism based on
    cross-attention, enabling multi-modal training. We use it to train
    class-conditional, text-to-image and layout-to-image models
  * Finally, we release pretrained latent diffusion and autoencoding models at
    * might be reusable for a various tasks besides training of DMs [78]

# 2. Related Work

# 3. Method

# 4. Experiments

# 5. Conclusion
