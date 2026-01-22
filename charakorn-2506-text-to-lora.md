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
    be further compressed
    * eg train lossy versions of the original adapter while maintaining perf
      (Brüel-Gabrielsson+ 2024; Kim+ 2024; Kopiczko+ 2024)
      Brüel-Gabrielsson R; Zhu J; Bhardwaj O; Choshen L; Greenewald K; 
        Yurochkin M; and Solomon J
      Compress then serve: Serving thousands of lora adapters
        with little overhead. arXiv preprint arXiv:2407.00066
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
    * See Sec 4
    Wang Y, Mishra S, Alipoormolabashi P, Kordi Y, Mirzaei A, Naik A, Ashok A,
      Dhanasekaran A. S, Arunkumar A, Stap D, et al
    Super-naturalinstructions:
      Generalization via declarative instructions on 1600+ nlp tasks
    EMNLP 2022
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
    eg ∆W m,l, where m is the module type  and l is the layer index

## Hypernetworks

* a neural network that generates parameters for another ‘base’ network
  (Ha+ 2016)
* an indirect encoding (Schmidhuber, 1997; Stanley & Miikkulainen, 2003; Zhang+
  2018; Schug+ 2024) of the base network,
  given that the parameter count of the hypernetwork is much smaller
* This compression is achieved by learning to share parameters indirectly
* given a layer-specific descriptor vector ϕ l,
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
* target module (m) and layer index (l),
* a hypernetwork generates the two low-rank matrices A, B based on a task
  description z i ∈ Z i of a task t i as follows: i
  ∆W m,l = h θ (ϕ im,l ), with
  ϕ im,l = concat f (z i ), E[m], E[l]], where
  * f gives a vector representation of a text description, typically
    * the CLS token of a bidirectional transformer model or
    * last token activation of an LLM
  * E is a learnable embedding dictionary
    indexed by either a module type m or a layer index l. For legibility, we
* shorthand notation for T2L’s output ∆W i := h θ (ϕ i ) := h θ ({ϕ im,l })
* supervised finetuning training objective for T2L is
  θ = argmin E D i ∼D,z i ∼Z i L SFT (D i, Ψ, h θ (ϕ i )), (5) θ Note that
  * values of m and l can be batched, which allows T2L to
    ~> generate ∆W for all modules and layer indices efficiently
    within a single forward pass

## 3.1. Text-to-LoRA Architectures

* Most of a hypernetwork’s parameters come from the output layer, which
  * output layer scales linearly with the size of the target weights
    (Von Oswald+ 2019)
* To explore the complexity-performance trade-off, we propose
  three variants of T2L: L, M, and S . We impose
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

* utilize publicly available libraries of LoRAs
  (Brüel-Gabrielsson+ 2024; Zhao+ 2024)
* Alternatively, one can also use a two-stage procedure, in which
  1. a library of LoRAs is pre-trained in the first stage and then
  2. train T2L to reconstruct them
* For the sole purpose of compressing LoRAs, we can train T2L using
  one-hot or learnable vectors as task embeddings
* For zero-shot LoRA generation for unseen tasks
* reconstruction loss: L(Ω, θ) = E ∆W i ∼Ω |∆W i − h θ (ϕ i )|

## 3.3. Training Text-to-LoRA via Supervised Fine-Tuning (SFT)

* T2L can be directly optimized on fine-tuning datasets. Training T2L with SFT
  sidesteps the need for intermediate target LoRA adapters and allows for
  end-to-end training. This training scheme is
  * preferred if existing trained LoRAs are not naturally clustered by their
    functionalities or downstream tasks. For instance, t 1 and t 2 could be two
    related tasks requiring a similar LLM capability, but ∆W 1 and ∆W 2 could be
    in different minima. Thus, T2L trained via reconstruction training would
    have to compress numerically different ∆W 1 and ∆W 2, making it less likely
    to generalize. In fact,
  * we empirically find that a T2L trained via reconstruction fails to
    generalize to unseen tasks (Section 5.4). In contrast, an
* SFT-trained T2L can implicitly learn to cluster tasks, which has been shown to
  improve zeroshot LoRA routing performance (Ostapenko+ 2024).  The SFT
  loss for T2L is given by Equation (5)

# 4 Experiments

* contributions
  * While the compression is lossy, T2L maintains the performance of
    task-specifically tuned LoRA adapters. Furthermore,
  * T2L can generalize to unseen tasks given suitable natural language
    descriptions of the tasks
* We investigate the different T2L architectures and training schemes
  * compression of adapters (Section 4.1) and
  * zero-shot LoRA generation for unseen tasks (Section 4.2)
* baselines, we consider
  * task-specific LoRAs,
  * element-wise averaged LoRA, and
  * multi-task LoRA
    * a LoRA adapter trained on all training tasks. We also implement
  * Hyperdecoders (Ivison & Peters, 2022)—a hypernetwork that generates LoRAs on
    a per-sequence basis—based on our proposed architectures
  * To boost the performance of the base models without finetuning, we utilize
    * few-shot in-context learning (ICL, Brown+ 2020; Dong+ 2024) and
    * task description prepending,
      ie providing task description at the beginning of each query
  * Arrow Routing zero-shot performance from Ostapenko+ (2024). Note that the
    * can only be compared indirectly as it uses a
      * different set of LoRA adapters and training tasks
      * likely differences in the benchmark evaluation prompts
* base LLM: In most experiments, we use Mistral-7B-Instruct (Jiang+ 2023) as the
  * except in Tables 7 and 8 where Llama-3.1-8B-Instruct and
    Gemma-2-2b-Instruct are used as the base models, respectively. We use
  * gte-large-en-v1.5 (Li+ 2023; Zhang+ 2024) for extracting the task embed-
    ding from a natural language task description. All
* LoRA adapters are of
  rank 8 and only target the query and the value projection modules in every
  attention block of the base LLM (totaling 3.4M parameters)
* L, M, and S have 55M, 34M, and 5M trainable parameters respectively
* train dataset: We utilize the SNI dataset (Wang+ 2022) for training LoRAs
  * 500 tasks following Brüel-Gabrielsson+ (2024)
    * 11 tasks for hold-out validation and
    * removed 10 datasets due to data contamination from the evaluation benchmark
    * 479 datasets for training. All samples are in English incl
      "Lots-of-LoRAs/task889_goemotions_classification",
      "Lots-of-LoRAs/task875_emotion_classification",
      "Lots-of-LoRAs/task517_emo_classify_emotion_of_dialogue",
      "Lots-of-LoRAs/task518_emo_different_dialogue_emotions",
      "Lots-of-LoRAs/task1489_sarcasmdetection_tweet_classification",
  * More details of the datasets can be found in Appendix J
* evaluation benchmarks: 10 widely used benchmarks that
  collectively cover a variety of LLM capability assessments,
  eg reasoning, math, science, coding, and world knowledge. Specifically, we
  * Arc-challenge (ArcC) and Arc-easy (ArcE, Clark+ 2018), BoolQ (Clark+ 2019),
    GSM8K (Cobbe+ 2021), Hellaswag (HS, Zellers+ 2019),
    OpenBookQA (OQA, Mihaylov+ 2018), PIQA (Bisk+ 2020),
    Winogrande (WG, Keisuke+ 2019), HumanEval (HE, Chen+ 2021), and
    MBPP (Austin+ 2021)
* Task descriptions for the training datasets and the benchmarks are
  fully generated, as described in Appendix L. When we use a language task
  embedding as a part of the input, we average T2L performance using three
  descriptions for each benchmark

## 4.1. LoRA Compression

* we train a task-specific LoRA (oracle) on the training split of each
  benchmark task, collectively forming a library of LoRAs
* Table 1: the benchmark performance of T2L
  by distilling 9 benchmark-specific LoRAs using
  either one-hot or natural language task embeddings from gte-large-en-v1.5. We
* the benchmark tasks are indirectly seen during training by T2L, as it learns
  to distill benchmark-specific LoRAs. We can see that
* T2L fully recovers the performance of the oracle adapters
  with both task embedding types. Notably,
  * T2L outperforms task-specific LoRAs on several benchmarks (in green)
    * We hypothesize that the gain comes from the lossy compression,
      a regularization on the already trained LoRA weights
    * most apparent on PIQA and WG benchmarks, where the oracle LoRA overfits
* whether T2L conditioned on one-hot task vectors can maintain the oracle
  single-task LoRAs’ performance when
  using an increasing number of training tasks
  * Figure 3 shows the performance of one-hot T2L on the test splits of a subset
    of 10 SNI training tasks
    with varying degrees of final average training L1 reconstruction error
  * We train various T2L instances for each architecture using {16, 32, 64,
    128, 256, 479} training tasks, leading to an effective increase in the
    training reconstruction error
  * Although T2L fully recovers the oracles’ performance when the reconstruction
    loss is less than 10 −4, the performance drops as the training error
    increases. This result suggests that T2L learns a lossy compression of the
    target LoRAs
  * all T2L architectures can maintain around 65% of oracles’ performance, and
    the performance does not drop further even at > 8 × 10 −4 per-element L1 er-
    ror. Despite the performance drop, we show that
    increasing the number of training tasks is beneficial in the SFT setup,
    increasing zero-shot benchmark performance of T2L in Section 5.1

## 4.2. Zero-Shot LoRA Generation (Tab 2)

* SFT on 479 SNI tasks, each with 128 task descriptions
* For each data point in a training minibatch, we sample a description from the
  corresponding dataset in an online fashion
* Table 2 shows the zero-shot performance on 10 benchmark tasks
* Here, we present the best model of each variant from our scaling experiment in
  Section 5.1. We observe that
* a multitask LoRA adapter performs well on the benchmarks
  despite no additional fine-tuning. Still,
* there is a performance gap between task-specific LoRAs and MT LoRA. We observe
* SFT-trained T2L indeed generates useful LoRAs, thus
  improving over the multi-task LoRA adapter consistently and across benchmarks
  (indicated by bold numbers). Notably, even though
  T2L cannot fully bridge the performance gap with task-specific LoRAs,
  nL it outperforms the oracles on a subset of tasks (highlighted in green)
* Appa A: ? the generality of our proposed method with
  different base models including Llama (Dubey+ 2024) and Gemma (Team+ 2024)
* one of the main advantages of T2L is its efficiency
  * an ad-hoc FLOPs analysis in Appendix I

# 5 ablations including
  * T2L scaling with datasets (see Figure 1, bottom right),
  * the impact of different task description embeddings,
  * the training routines, and
  * text-based task descriptions

## 5.1. Increasing Training Compute Proportional to the Number of Training Tasks

* Table 3: after increasing the number of training tasks and compute budget, T2L
  generally benefits from the additional training tasks. However,
  * hE S does not benefit from extended training with 479 tasks,
    potentially due to its limited model capacity
* App C: task diversity ?~> robustness
  * by training on more tasks without scaling the training budget in Appendix C
  * it is crucial to scale the compute budget according to the number of
    training tasks. For instance,
  * eg M with scaled compute budget improves over training runs with a fixed
    budget when using 256 or more training tasks

## 5.2. Task Embedding Models (Tab 4)

* Table 4 shows the zero-shot benchmark performance with
  two different embedding models: gte-large-en-v1.5 and Mistral-7B-Instruct
* For the gte model, we extract a task description by using the activation of
  the CLS token in the last layer as the model is a bidirectional model
* For Mistral, we use the activation of the last token in the sequence to
  represent a given description (BehnamGhader+ 2024). Table 4 shows the
* 128 tasks
* Both embedding models yield T2L instances with comparable generalization
  capability, suggesting T2L’s robustness to task description embedding methods

## 5.3. Varying Task Descriptions

* four types of descriptions:
  * aligned
    * Train: Training descriptions of corresponding tasks
    * Eval: Unseen descriptions of corresponding tasks
  * unaligned
    * Random strings: Random literal strings
    * Train (random): Training descriptions randomly sampled from other tasks
* For each description type, we use the gte-large-en-v1.5 embedding
  * we report the average performance using three descriptions. The four types
* we use reconstruction-trained T2L in this experiment. That is, the
  hypernetwork has seen training descriptions of the benchmarks during training
* We observe a performance gap between aligned and unaligned
  * aligned matching the performance of oracle LoRAs, despite the evaluation
    * ie T2L is robust to changes in the task description as long as the
* qualitative result demonstrating steerability and an unsuccessful example of
  T2L in Figure 4. Importantly, the last two examples in
  * Figure 4 (iii) and (iv) are both correct but have
    different answer styles thanks to different descriptions
  * Hyperdecoders (Ivison & Peters, 2022) cannot exhibit such steerability as
    it uses the problem instance as the input to the hypernetwork

## 5.4. Training Schemes

* zero-shot performance of SFT-trained and reconstruction-trained T2L
* All model instances are trained with roughly equal wall-clock time of 10 hours
* Tab 6: clear performance gap between reconstruction and SFT training schemes
  * SFT produces T2L instances that perform significantly better (
    * 66.3 vs 61.83 benchmark performance averaged over model architectures). We
* For reconstruction-trained T2L to generalize, the target LoRA adapters of
  similar tasks should be clustered in some latent manifold. In contrast,
  * SFT training does not need pre-trained task-specific LoRA adapters, thus
* Appendix D: that pre-trained adapters for similar tasks do not live nearby in
  the weight space, supporting our claim of a
  ie potential problem when reconstructing pre-trained LoRAs

## 5.5. Visualization of T2L Activations

* We probe SFT T2L M trained on 256 training tasks in the zero-shot evaluation
  * all the benchmark tasks, each with three unseen descriptions. Figure 5 shows
* Fig 5: 2D t-SNE projection of T2L’s task encoder activations and the outputs
  of the last MLP block. We can see
* clear clustering in both projection plots based on the tasks (colors and
* T2L generates different adapters for different tasks, confirming that T2L
* similar tasks, eg MBPP and HumanEval, are clustered together in both plots,
  * MBPP: Program synthesis
  * HumanEval: LLMs trained on code

# Appendix D. we analyze the nature of T2L generations 14

* contributions
  * we study the relationship between LoRA adapters
  * compelling [lenyűgöző] evidence why reconstr-trained T2L cannot generalize
* Here, we investigate the relationship between LoRA adapters by inspecting
  their similarity in the parameter space, performance on the benchmarks, and
  similarity of their description embeddings. To
* measure
  * adapter similarity, we compute the cosine similarity of the concatenation of
    flattened low-rank A and B matrices of all layers
  * task description similarity (using the mean embedding of each task)
* Fig 6
  * top row the adapters’ similarity against task description similarity
    * near 0 Pearson correlation
  * bottom row of Figure
    * relative benchmark performance of SNI-trained adapters
      * adapters’ relative benchmark performance
        among? benchmark-specific adapters
    * positive correlation
* ie
  * adapters perform better on a benchmark if their task descriptions are
    similar to those of the benchmark
  * hE adapters with similar descriptions are not similar in the parameter space
  * We believe that this relationship has a significant impact on the limited
    generalization of reconstruction-trained T2L.  We further discuss this topic
    in Appendix K

# K. Utilizing Full Adaptation Matrix vs Low-Rank Matrices

* Fig 11
  * Similar to Figure 6
    * the similarity of SNI adapters to benchmark-specific adapters, but
  * instead of using the concatenation of flattened A and B matrices,
  * we use flattened ∆W instead. With the change, we find a
  * positive correlation between the task embedding similarity and the adapter
    similarity in the weight space
  * likely because, for a given ∆W matrix, there are many possible permutations
    of low-rank matrices A and B. This suggests that
    if we compute the reconstruction loss in the full adaptation matrix space,
    reconstruction-trained T2L could generalize better
    However, we empirically find that it does not outperform T2L trained to
    reconstruct low-rank matrices at zero-shot LoRA generation

# 6. Related Work

## Hypernetworks for Adaptation:

* Hypernetworks (Ha+ 2016) provide a general indirect encoding method for neural
  network weights
* They have been applied to different
  * architectures (eg in attention, Schug+ 2024) and
  * training paradigms (eg in continual learning, Von Oswald+ 2019)
* hypernetworks for LLM adaptation in a multi-task context
  (Mahabadi+ 2021; He+ 2022; Ortiz-Barajas+ 2024)
  * only learned task identifiers instead of natural language for adaptation
  * not enable task-wise zero-shot generalization

## Hypernetworks for Zero-Shot LLM Adaptation:

* Xiao+ (2023) explore the use of hypernetworks on a limited set of English
  dialects; they only consider five dialects, one of which is unseen
  Furthermore, the hypernetwork relies on an expert-based transformation of the
  dialects, limiting the possibility for generalization
* Mu+ (2024) propose Gisting, a method that learns to
  compress an in-context task description to prefix tokens, allowing the
  language model to follow instructions with fewer tokens. However, Gisting is
  * limited to prefix tokens—only influencing the attention matrices of the base
    model. Thus, prefix tokens are less flexible compared to
  * LoRAs can modify different parts of LLMs, eg attention blocks
* Hyperdecoders (Ivison & Peters, 2022) is a hypernetwork that generates
  adapters on the fly based on the input sequence
  * desirable for benchmark evaluation—where the LLM should always output the
    correct answer—we argue that
  * hE description-based adaptation gives more control to users since they can
    steer the LLM in creative ways based on user-generated descriptions (see
    Figure 4). Furthermore, the generated
  * These adapters cannot be efficiently fused into the base model, leading to
    significant overhead for each query
* Closely related to our work are
  HyperTuning (Phang+ 2023), HNET-LM (Deb+ 2022), and HINT (Ivison+ 2023)
* base model
  * prior work heavily focuses on pre-trained encoder-decoder models,
    eg T5 (Raffel+ 2020) or BART (Lewis, 2019),
  * we use frontier instruction fine-tuned models as the base models,
    ie Mistral, Llama, Gemma. Also,
* init
  * prior work typically relies on initializing a part of their hypernetworks
    from the base model (eg tying task encoder’s weights to the base model) to
    achieve good performance or stable training as opposed to
  * ours are task-embedder agnostic and can freely change the task embedding
    model (Section 5.2)
* descriptions
  * our work utilizes generated descriptions instead of the ones provided by the
    SNI dataset
  * App B: using generated descriptions increase the performance of T2L
    considerably. Overall, our work improves upon prior work in several ways,
* Concurrent to our work, Lv+ (2024) propose a similar approach that utilizes a
  hypernetwork to generate LoRA adapters at inference time. However, their
  * Lv's hypernetwork assumes that the context vector provided to the
    hypernetwork contains few-shot examples

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
