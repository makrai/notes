LoRA: Low-Rank Adaptation of Large Language Models
Edward J. Hu, Yelong Shen, Phillip Wallis, Zeyuan Allen-Zhu, Yuanzhi Li,
  Shean Wang, Lu Wang, Weizhu Chen
arXiv:2106.09685 [cs.CL]
  V2: better baselines, experiments on GLUE, and more on adapter latency

# Abstract

* An important paradigm of natural language processing consists of
  * large-scale pre-training on general domain data and
  * adaptation to particular tasks or domains
* larger models ~> full fine-tuning (ie retraining all params) less feasible
* eg GPT-3 175B: deploying independent instances of fine-tuned models, each
  with 175B parameters, is prohibitively expensive
  * larger models are trained every few months
* We propose Low-Rank Adaptation, or LoRA
  * freezes the pre-trained model weights and
    injects trainable rank decomposition matrices into each layer of the
    Transformer architecture,
    greatly reducing the number of trainable parameters for downstream tasks
* Compared to GPT-3 175B fine-tuned with Adam, LoRA can
  * reduce
    * the number of trainable parameters by 10,000 times and the
    * GPU memory requirement by 3 times
  * performs on-par or better than fine-tuning in model quality on RoBERTa,
    DeBERTa, GPT-2, and GPT-3, despite having fewer trainable parameters, a
    higher training throughput, and,
  * unlike adapters, no additional inference latency
* empirical investigation into rank-deficiency in language model adaptation,
* a package that facilitates the integration of LoRA with PyTorch models
* implementations and model checkpoints for RoBERTa, DeBERTa, and GPT-2
* from the Conclusion
  * LoRA neither introduces inference latency nor reduces input sequence length
  * allows for quick task-switching when deployed as a service
    by sharing the vast majority of the model parameters
  * besides Transformers, applicable to any neural networks with dense layers
* future works
  * LoRA may be combined with other efficient adaptation methods
  * The mechanism behind fine-tuning or LoRA is far from clear –
    * how are features learned during pre-training transformed to do well on
      downstream tasks?
    * LoRA makes it more tractable to answer this than full finetuning
  * how to select the weight matrices to apply LoRA to
    * We mostly depend on heuristics
    * Are there more principled ways to do it?
  * Finally, the rank-deficiency of ∆W suggests that W could be rank-deficient
    as well, which can also be a source of inspiration for future works

# 1 Intro

* adapting only some parameters or learning external modules for new tasks
  ~> we only need to store and load a small number of task-specific parameters
  in addition to the pre-trained model for each task, greatly boosting the
  operational efficiency when deployed
  * hE inference latency because of extended model depth
    (Houlsby+ 2019; Rebuffi+ 2017)
  * or reduced usable sequence length
    (Li & Liang, 2021; Lester+ 2021; Hambardzumyan+ 2020; Liu+ 2021) (Sec 3)
  * often fail to match the fine-tuning baselines
  * trade-off between efficiency and model quality
* We take inspiration from Li+ (2018a); Aghajanyan+ (2020) which show that
  * the learned over-parametrized models in fact reside on a low intrinsic dim
  * We hypothesize that
    the change in weights during model adaptation also has a low “intrinsic
    rank”, leading to our proposed Low-Rank Adaptation (LoRA) approach
* LoRA allows us to train some dense layers in a neural network indirectly by
  optimizing rank decomposition matrices of the dense layers’ change during
  adaptation instead, while keeping the pre-trained weights frozen, as shown in
  Figure 1. Using
  * eg GPT-3 175B: a very low rank (ie, r in Figure 1 can be one or two)
    suffices even when the full rank (ie, d) is as high as 12,288, making LoRA
    both storage~ and compute-efficient.  LoRA possesses several key
* advantages
  * A pre-trained model can be shared and used to build many small LoRA modules
    for different tasks. We can freeze the shared model and efficiently
    switch tasks by replacing the matrices A and B in Figure 1, reducing the
    storage requirement and task-switching overhead significantly
  * LoRA makes training more efficient and lowers the hardware barrier to entry
    by up to 3 times when using adaptive optimizers since we do not need to
    calculate the gradients or maintain the optimizer states for most
    parameters. Instead, we only optimize the injected, much smaller low-rank
    matrices
  * Our simple linear design allows us to merge the trainable matrices with the
    frozen weights when deployed, introducing no inference latency compared to
    a fully fine-tuned model, by construction
  * LoRA is orthogonal to many prior methods and can be combined with many of
    them, such as prefix-tuning. We provide an example in Appendix E

## Terminologies and Conventions. We make frequent references to the Transformer

* input and output dimension size of a Transformer layer `d_model`. We use
* Wq , Wk , Wv , and Wo to refer to the query/key/value/output projection mxs
  in the self-attention module
* W or W0 refers to a pretrained weight matrix and
  * ∆W its accumulated gradient update during adaptation. We use
* r to denote the rank of a LoRA module
* We follow the conventions set out by Vaswani+ (2017) and Brown+ (2020)
  * Adam (Loshchilov & Hutter, 2019; Kingma & Ba, 2017) for model optimization
  * Transformer MLP feedforward dimension d_{ffn} = 4 × d_model

# 2 Problem statement

* our proposal is agnostic to training objective
* nL we focus on language modeling as our motivating use case
* Below is a brief description of the language modeling problem and, in
  * the maximization of conditional probabilities given a task-specific prompt
* we: the task-specific parameter increment ∆Φ = ∆Φ(Θ) is further encoded by a
  much smaller-sized set of parameters Θ with |Θ| << |Φ0 |. The task of finding
  ∆Φ thus becomes optimizing over Θ
  * low-rank representation to encode ∆Φ that is both compute~ and
    memory-efficient. When the pre-trained model is GPT-3 175B, the number of
    trainable parameters |Θ| can be as small as 0.01% of |Φ0|

# 3 Aren’t existing solutions good enough?

* make model adaptation more parameterand compute-efficient. See
  * Section 6 for a survey of some of the well-known works. Using language
  * two prominent strategies when it comes to efficient adaptations:
    * adding adapter layers
      (Houlsby+ 2019; Rebuffi+ 2017; Pfeiffer+ 2021; Rücklé+ 2020)
    * optimizing some forms of the input layer activations
      (Li & Liang, 2021; Lester+ 2021; Hambardzumyan+ 2020; Liu+ 2021)
    * limitations, especially in a large-scale and latency-sensitive production

## Adapter Layers Introduce Inference Latency

* There are many variants of adapters
  * original design by Houlsby+ (2019) which has
    * two adapter layers per Transformer block and
  * a more recent one by Lin+ (2020) which has
    * only one per block but with an additional LayerNorm (Ba+ 2016)
* While one can reduce the overall latency by pruning layers or exploiting
  multi-task settings (Rücklé+ 2020; Pfeiffer+ 2021), there is
  * hE no direct ways to bypass the extra compute in adapter layers. This seems
  * ? issue since adapter layers are designed to have few parameters
    (sometimes <1% of the original model) by having a small bottleneck
    dimension, which limits the FLOPs they can add. However,
  * hE large NNs rely on hardware parallelism to keep the latency low, and
    adapter layers have to be processed sequentially. This makes a difference
    in the online inference setting where the batch size is typically 1
  * OK: running inference on GPT-2 (Radford+ b) medium on a single GPU, we see
    a noticeable increase in latency when using adapters, even with a very
    small bottleneck dimension (Table 1)
  * hE when we need to shard the model as in Shoeybi+ (2020); Lepikhin+ (2020),
    * the additional depth requires more synchronous GPU operations
      eg AllReduce and Broadcast,
      unless we store the adapter parameters redundantly many times

## Directly Optimizing the Prompt is Hard

* The other direction eg prefix tuning (Li & Liang, 2021), faces a different
* prefix tuning is difficult to optimize and that its
* performance changes non-monotonically in trainable parameters,
  confirming similar observations in the original paper
+ reserving a part of the sequence length for adaptation necessarily
  reduces the sequence length available to process a downstream task, which we
  suspect makes tuning the prompt less performant compared to other methods
  * we study task performance in Section 5

# 4 Our method

* The principles outlined here apply to any dense layers in deep models,
  though we only focus on certain weights in Transformer language models

## 4.1 Low-rank-parametrized update matrices

* We scale ∆Wx by α/r, where α is a constant in r
  * When optimizing with Adam, tuning α is roughly the same as tuning the
    learning rate if we scale the initialization appropriately
  * we simply set α to the first r we try and do not tune it
  * This scaling helps to reduce the need to retune hyperparameters when we
    vary r (Yang & Hu, 2021)

# 6 Related works

## Transformer Language Models

* Transformer (Vaswani+ 2017) is a sequence-to-sequence architecture that makes
  heavy use of self-attention
* Radford+ (a) applied it to autoregressive language modeling by using a
  stack of Transformer decoders. Since then,
* Transformer-based language models have dominated NLP, achieving the SOTA in
* pretraining + finetuning paradigm emerged with BERT (Devlin+ 2019b) and GPT-2
  (Radford+ b) – both are large Transformer language models trained on a large
  amount of text – where fine-tuning on task-specific data after
* larger Transformers generally results in better performance and remains an
* GPT-3 (Brown+ 2020) is the largest single Transformer language model
  trained to-date with 175B parameters

## Prompt Engineering and Fine-Tuning. While

* GPT-3 175B can adapt its behavior with just a few additional examples, the
  * hE result depends heavily on the input prompt (Brown+ 2020). This
  * ~> empirical art of composing and formatting the prompt to maximize a
* Fine-tuning retrains a model pre-trained on general domains to a specific
  task Devlin+ (2019b); Radford+ (a). Variants of it include
  * learning just a subset of the parameters Devlin+ (2019b); Collobert &
    Weston (2008), yet
  * practitioners often retrain all of them to maximize the downstream perf
  * the enormity of GPT-3 175B makes it challenging to perform fine-tuning in
    the usual way due to the large checkpoint it produces and the high hardware
    barrier to entry since it has the same memory footprint as pre-training

## Parameter-Efficient Adaptation. Many have proposed

* inserting adapter layers between existing layers in a neural network
  (Houlsby+ 2019; Rebuffi+ 2017; Lin+ 2020)
  * Our method uses a similar bottleneck structure to impose a
    low-rank constraint on the weight updates
  * The key functional difference is that
    our learned weights can be merged with the main weights during inference,
    ~> no latency unlike the adapter layers (Section 3)
* A comtenporary extension of adapter is COMPACTER (Mahabadi+ 2021)
  * parametrizes the adapter layers using Kronecker products with some
    predetermined weight sharing scheme
  * combining LoRA with other tensor product-based methods could potentially
    improve its parameter efficiency, which we leave to future work
* optimizing the input word embeddings in lieu of fine-tuning, akin to a
  continuous and differentiable generalization of prompt engineering
  (Li & Liang, 2021; Lester+ 2021; Hambardzumyan+ 2020; Liu+ 2021)
  * We include comparisons with Li & Liang (2021) in our experiment section
  * hE conti prompt engin can only scale up by using more special tokens in the
    * take up available sequence length for task tokens
      when positional embeddings are learned

## Low-Rank Structures in Deep Learning. Low-rank structure is very common in

* A lot of machine learning problems have certain intrinsic low-rank structure
  (Li+ 2016; Cai+ 2010; Li+ 2018b; Grasedyck+ 2013) Moreover, it is known that
* for many deep learning tasks,
  especially those with a heavily over-parametrized neural network,
  the learned neural network will enjoy low-rank properties after training
  (Oymak+ 2019)
* explicitly impose the low-rank constraint when training the original NN
  (Sainath+ 2013; Povey+ 2018; Zhang+ 2014; Jaderberg+ 2014; Zhao+ 2016;
  Khodak+ 2021; Denil+ 2014); however, to the best of our knowledge,
  * none of these works considers low-rank update to a frozen model for
    adaptation to downstream tasks. In
* theory literature, it is known that
  * neural networks outperform other classical learning methods, including the
    corresponding (finite-width) neural tangent kernels (Allen-Zhu+ 2019; Li &
    Liang, 2018) when the underlying concept class has certain low-rank
    structure (Ghorbani+ 2020; Allen-Zhu & Li, 2019; Allen-Zhu & Li, 2020a)
  * Allen-Zhu & Li (2020b) suggests that
    low-rank adaptations can be useful for adversarial training

# App A. Large language models still need parameter update

* Few-shot learning, or prompt engineering, is very advantageous
  when we only have a handful of training samples. However
* hE in practice, we can often afford to curate a few thousand or more examples
  for performance-sensitive applications. As shown in
* Table 8, fine-tuning improves the model performance drastically vs few-shot
  * on datasets large and small. We take the
* eg GPT-3 few-shot result on RTE from the GPT-3 paper (Brown+ 2020)
  * MNLI-matched, we use two demonstrations per class and
    six in-context examples in total
