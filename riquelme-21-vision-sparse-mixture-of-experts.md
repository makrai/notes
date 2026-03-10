Scaling Vision with Sparse Mixture of Experts
Carlos Riquelme, Joan Puigcerver, Basil Mustafa, Maxim Neumann,
  Rodolphe Jenatton, André Susano Pinto, Daniel Keysers, Neil Houlsby
Advances in Neural Information Processing Systems 34 (NeurIPS 2021)

[Mixture of experts code and models](http://github.com/google-research/vmoe)

# Abstract

* Sparsely-gated Mixture of Experts networks (MoEs) have demonstrated
  * excellent scalability in Natural Language Processing
  * In Computer Vision, however, almost all performant networks are "dense",
  * dense := every input is processed by every parameter
* We present a Vision MoE (V-MoE), a sparse version of the Vision Transformer,
  * scalable and competitive with the largest dense networks. When
* applied to image recognition, V-MoE matches the performance of SOTA networks,
  * requiring half of the compute at inference time
+ an extension to the routing algorithm that can
  * prioritize subsets of each input across the entire batch, leading to
    adaptive per-image compute. This
  * allows V-MoE to trade-off performance and compute smoothly at test-time
  * we scale vision models: a 15B-param model that attains 90.35% on ImageNet

# 1 Intro

* Deep learning historically shows that
  increasing network capacity and dataset size generally improves performance
  * vision: large models pre-trained on large datasets often achieve the SOTA
    [57, 50, 36, 20, 3]. This approach has had
  * even more success in NLP, where
    large pre-trained models perform very well on many tasks [48, 18]
  * Text Transformers [61] are the largest models to date, some
  * with > 100B parameters [9]. However, training and serving such models is
  * expensive [56, 46]. This is partially because these deep networks are
  * typically “dense”– every example is processed using every parameter –thus,
* conditional computation [5] aims to
  increase model capacity while keeping the training and inference cost ~const
  [5] Y. Bengio. Deep learning of representations: Looking forward. In SLSP 2013
  * applying only a subset of parameters to each example
  * In NLP, sparse Mixture of Experts (MoEs) are popular [54, 39, 22], enabling
    training and inference with fewer resources while trillion parameter models
* we explore conditional computation for vision at scale. We introduce the
  * Vision MoE (V-MoE), a sparse variant of Vision Transformer (ViT) archit [20]
  * replaces a subset of the dense feedforward layers in ViT with sparse MoE
  * each image patch is “routed” to a subset of “experts” (MLPs)
  * challeng: unique failure modes and non-differentiability,
    routing in deep sparse models is challenging
  * We explore various design choices, and present an effective recipe for the
    pre-training and transfer of V-MoE, notably outperforming their dense
    counterparts. We further show that V-MoE models are remarkably flexible
* The performance vs. inference-cost trade-off of already trained models can be
  smoothly adjusted during inference
  by modulating the sparsity level with respect to the input and/or the weights

* Figure 1: Overview of the architecture
  * V-MoE is composed of L ViT blocks
  * In some, we replace the MLP with a sparsely activated mixture of MLPs
  * Each MLP (the expert) is stored on a separate device, and processes a fixed
    number of tokens
  * The communication of these tokens between devices is shown in this example,
    which depicts the case when k = 1 expert is selected per token
  * Here each expert uses a capacity ratio C = 43 : the sparse MoE layer
    receives 12 tokens per device, but each expert has capacity for 16 ( 16⋅1 =
    43 ; see Section 2.4)
  * Non-expert components of V-MoE such as 12 routers, attention layers and
    normal MLP blocks are replicated identically across devices
* we can scale to model sizes of 15B parameters,
  the largest vision models to date
* We match the performance of SOTA dense models, while requ fewer time to train
* trade-off
  * Alternatively, V-MoE can match the cost of ViT while achieving better perf
  * To help control this tradeoff, we propose Batch Prioritized Routing,
    a routing algorithm that repurposes model sparsity to skip the computation
    of some patches, reducing compute on uninformative image regions
* contributions as follows:
  * Vision models at scale. We present
    * the Vision Mixture of Experts, a distributed sparsely-activated
      Transformer model for vision. We train models with up to 24 MoE layers, 32
      experts per layer, and almost 15B parameters
    * these models can be stably trained, seamlessly used for transfer, and
      successfully fine-tuned with as few as 1 000 datapoints
    * our largest model achieves 90.35% test accuracy on ImageNet when
  * Performance and inference. We show
    * V-MoEs strongly outperform their dense counterparts on upstream, few-shot
      and full fine-tuning metrics in absolute terms. Moreover,
    * at inference time, the V-MoE models can be adjusted to either
      * match the largest dense model’s performance while using half the
        compute, or actual runtime, or
      * significantly outperform it at the same cost
  * Batch Prioritized Routing. We propose
    * a new priority-based routing algorithm that allows V-MoEs to
    * discard the least useful patches. Thus, we devote less compute to each
    * match the performance of the dense models while saving 20% of the training
      FLOPs
  * Analysis. We provide some
    * visualization of the routing decisions, revealing patterns and conclusions
      which helped motivate design decisions and may further improve

## 2.1 Conditional Computation with MoEs

* Conditional computation aims at
  activating different subsets of a network for different inputs [5]. A
* mixture-of-experts model is a specific instantiation whereby
  different model “experts” for different regions of the input space [31]
  [31] RA Jacobs, MI Jordan, SJ Nowlan, and GE Hinton
  Adaptive mixtures of local experts. Neural Computation, 3(1):79–87, 1991
* We follow the setting of [54],
  [54] N Shazeer, A Mirhoseini, K Maziarz, A Davis, Q Le, G Hinton, and J Dean
  Outrageous large neural networks: The sparsely-gated mixture-of-experts layer
  ICLR, 2017
* Shazeer+ present for deep learning a mixture of experts layer with E experts
  \[ MoE(x) = ∑_{i=1..E} g(x)_i e_i(x) \]
  * $x ∈ R$ is the input to the layer,
  * $e_i ∶ R ↦ R$ is the function computed by expert i, and
  * $g ∶ R D ↦ R$ E is the “routing” function which
    * prescribes the input-conditioned weight for the experts
  * Both $e_i$ and $g$ are parameterized by neural networks
* if $g$ is sparse, ie restricted to assign only $k << E$ non-zero weights,
  then unused experts need not be computed
  * super-linear scaling of the number of model parameters
    with respect to inference and training compute
