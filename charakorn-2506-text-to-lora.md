Text-to-LoRA: Instant Transformer Adaption
Rujikorn Charakorn, Edoardo Cetin, Yujin Tang, Robert Tjarko Lange
Accepted at ICML 2025 arXiv:2506.06105 [cs.LG]

https://github.com/SakanaAI/text-to-lora

* Foundation Models regularly require task-specific adaptation
  * careful curation of datasets and repeated fine-tuning of the underly model
  * notably sensitive to hyperparameter choices. To overcome these limitations,
* we introduce Text-to-LoRA (T2L), a model capable of adapting LLMs on the fly
  solely based on a natural language description of the target task. T2L is
  * a hypernetwork trained to
    construct LoRAs in a single inexpensive forward pass
  * we train T2L on a suite of 9 pre-trained LoRA adapters (GSM8K, Arc, etc.),
  * the ad-hoc reconstructed LoRA instances match the performance of
    task-specific adapters across the corresponding test sets
+ T2L can compress hundreds of LoRA instances and
  zero-shot generalize to entirely unseen tasks

# 1 Intro

* practitioners often resort to re-training parts of the model
  (Gururangan+ 2020; Wei+ 2021; Dettmers+ 2022; Tay+ 2021)
  using parameter-efficient fine-tuning techniques, eg Low-Rank Adaptation
  (LoRA, Hu+ 2022). Typically, a
  * LoRA adapter has to be optimized for each downstream task and
    requires task-specific dataset and hyperparameter setting
  * structural constraints, the low-rank matrices learned by LoRA adapters can
    be further compressed. For example, one can train
    * eg lossy versions of the original adapter while maintaining performance
      (Brüel-Gabrielsson+ 2024; Kim+ 2024; Kopiczko+ 2024)
  * multiple LoRAs can be combined for new tasks at inference time
    (Ostapenko+ 2024)
  * At the core of these approaches lies the explicit use of
    decomposition or dimensionality reduction techniques (eg SVD or routing) for
    better compression and online composition of existing LoRAs
* questions:
  1. end-to-end train a neural network to compress many pre-trained LoRAs?
  2. Can we decode new task-specific LoRA adapters solely based on
     natural-language instructions for an unseen task at test time?
* We hypothesize that
  different LoRA adapters share the same underlying adaptation mechanism and
  can be optimized simultaneously without any explicit structure or recipe for
  combining them. To explicitly test this hypothesis,
* we propose T2L, a hypernetwork (Ha+ 2016) that
  compresses task-specific LoRAs and
  generates new LoRA adapters zeroshot at inference time. T2L is
  * trained to compress LoRAs on a diverse task distribution
    from the Super Natural Instructions (SNI) dataset (Wang+ 2022)
* T2L takes a natural language description of the target task as an input,
  allowing zero-shot LoRA generation to unseen tasks
* Empirically, we show that T2L can effectively be trained either/or
  * to reconstruct pre-trained adapters or
  * via supervised fine-tuning on a distribution of downstream tasks
* Figure 1:
  * Left: Conceptual overview of T2L’s training routine
    * Given a set of task description embeddings, we train a hypernetwork to
      generate LoRA adaptation matrices (∆W ) for various tasks
    * The weights of T2L are either optimized to distill pre-trained LoRA
      weights or via multi-task supervised fine-tuning on downstream tasks
  * Right,
    * Top: Relative performance to the oracles on training SNI tasks with
      varying compression ratios
    * Bottom: Zero-shot LoRA generation performance on 10 benchmark tasks
      * As we increase the number of pre-training datasets,
        the performance of T2L increases for 3 different T2L architectures

* After training, T2L
  * outperforms
    * a multitask LoRA baseline and
    * Arrow Routing (Ostapenko+ 2024), a SOTA zero-shot LoRA routing method, on
      various benchmark tasks. Furthermore, we show that T2L can
  * generate LoRA adapters for previously unseen tasks
    solely using the language-based task description. This result highlights the
    generalization capabilities and applicability of our proposed indirect
    adaptation encoding. Our
* contributions are summarized as follows:

# 2 Preliminaries

## Low-Rank Adaptation (LoRA, Hu+ 2022): a param-efficient fine-tuning method

* freezes the pretrained weights of a base model and
  only learns low-rank weight matrices, which serve as an adapter to the base
* For each selected linear transformation h = W 0 x,
  the finetuned transformation is given by h = W 0 x + ∆W x = W 0 x + B T Ax,
  * A, B ∈ R r×d are weight matrices of rank r < d
* layer index and module type (eg query projection) in the notation
  * We omit the layer index and module type of the LoRA weights
    when referring to all LoRA weights
  * Otherwise, we use subscripts to represent the layer index and module type,
    eg ∆W m,l , where m is the module type  and l is the layer index

## Hypernetworks

* a neural network that generates parameters for another ‘base’ network
  (Ha+ 2016)
* an indirect encoding (Schmidhuber, 1997; Stanley & Miikkulainen, 2003; Zhang+
  2018; Schug+ 2024) of the base network,
  given that the parameter count of the hypernetwork is much smaller
* This compression is achieved by learning to share parameters indirectly
* given a layer-specific descriptor vector ϕ l ,
* a hypernetwork with parameters θ generates the parameters of the base model at
  layer l ∈ {1, . . . L} as follows: W l = h_θ (ϕ_l)
* the layer descriptors are either one-hot or learned vectors
* The weights θ are trained via end-to-end optimization on a downstream task

# 3. Text-to-LoRA: Learning to Compress and Generate LoRAs

* contributions:
  * hypernetwork-based architectures for producing LoRA adapters
    with a single forward pass based on text descriptions
  * T2L architectures can be trained using
    both distillat of pretrained adapters and supervised multi-task fine-tuning

## 3.1. Text-to-LoRA Architectures

* Most of a hypernetwork’s parameters come from the output layer, which
  * output layer scales linearly with the size of the target weights
    (Von Oswald+ 2019)
* To explore the complexity-performance trade-off, we propose
  three variants of T2L: L , M , and S . We impose
  * different output spaces on the hypernetwork that represent
    different inductive biases and parameter counts (see Figure 2)
  * all variants use the same backbone architecture and
    only differ in their output heads and learnable embeddings
  * L architecture is the largest variant. Its
    * final linear layer outputs low-rank A and B matrices simultaneously
    * the number of weight connections to the output head is d out × 2 × r × d,
      * d out is the output size of the last MLP block
  * M architecture is the medium-sized model with a
    * shared output layer between the low-rank A and B matrices. That is,
    * ie the head outputs a low-rank matrix, either A or B, depending on the
      learnable embedding. The size of the output head is d out × r × d
  * S architecture is
    the most parameter-efficient model with the strongest inductive biases,
    * outputs only one rank of a low-rank matrix at a time
    This output space makes the size of the head much smaller: d emb × d
  * For reference, a LoRA adapter has r × d × 2 × L × |M | trainable parameters,
    * L is the number of layers and |M | is the number of target modules
    * The default value of d out is 512. We note that
* every architecture can generate all the low-rank matrices A and B
  in a single forward pass by batching all the input embeddings. We provide
  * more details of the architectures in Appendix F and the
  * weight initialization method that leads to stable training in Appendix G

## 3.2. Training Text-to-LoRA via LoRA Reconstruction

## 3.3. Training Text-to-LoRA via Supervised Fine-Tuning

# 4 T2L can efficiently encode hundreds of LoRA adapters (Section 4)

* While the compression is lossy, T2L maintains the performance of
  task-specifically tuned LoRA adapters. Furthermore,
* T2L can generalize to unseen tasks given suitable natural language
  descriptions of the tasks

# 5 ablations including
  * T2L scaling with datasets (see Figure 1, bottom right),
  * the impact of different task description embeddings,
  * the training routines, and
  * text-based task descriptions

## 5.5 semantically meaningful LoRA clusters

* when visualizing the generated LoRAs in a dimensionality-reduced space

# Appendix D. we analyze the nature of T2L generations

* we study the relationship between LoRA adapters and find
* compelling [lenyűgöző] evidence
  why reconstruction-trained T2L cannot generalize

# 7. Discussion and Limitations

## Discussion

* We rely on generated descriptions from GPT-4o mini
  to ensure high-quality and consistent task descriptions. It is plausible that
  * hE in real-world scenarios, users might not input high-quality descriptions,
* future
  * adapt vision language models. Finally, the potential for
  * T2L trained on a smaller base model to transfer effectively to larger models
    within the same architecture class remains an open area for exploration

## Limitations (Future work continued)

  * other efficient ways to modulate LLMs given a text description, eg
    eg directly modulating the activations of the base model
  * the compression achieved by T2L can be further optimized using well-designed
    inductive biases
  * although T2L exhibits robustness and signs of scalability,
  * T2L still does not reach the benchmark performance of taskspecific LoRAs
    in a zero-shot manner

# References 10

# A. Generalization to Llama and Gemma Models 13
