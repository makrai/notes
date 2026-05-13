Gated Delta Networks: Improving Mamba2 with Delta Rule
Songlin Yang, Jan Kautz, Ali Hatamizadeh
arXiv:2412.06464 ICLR 2025

* Linear Transformers are efficient alternatives to standard Transformers,
  * hE performance in retrieval and long-context tasks has been limited
  * recent work has explored two distinct mechanisms:
    * gating for adaptive memory control and the
    * delta update rule for precise memory modifications
* We observe that these mechanisms are complementary:
  * gating enables rapid memory erasure while
  * the delta rule facilitates targeted updates
* we introduce the gated delta rule and develop
  * a parallel training algorithm optimized for modern hardware
  * consistently surpasses existing models like Mamba2 and DeltaNet across
    multiple benchmarks, including
    language modeling, common-sense reasoning, in-context retrieval, 
    length extrapolation, and long-context understanding
    * length extrapolation: training on short texts & evaluating longer seqs
* We further enhance performance by developing hybrid architectures that
  combine Gated DeltaNet layers with sliding window attention or Mamba2 layers,
  ~> both improved training efficiency and superior task performance

# 1 Intro

* DeltaNet (Schlag+ 2021a; Yang+ 2024b)
  * the linear Transformer with the delta rule (Widrow+ 1960), known as ,
  * selectively updates memory by 
    (softly) replacing an old key-value pair with the incoming one in a
    sequential manner. This method has demonstrated 
  * impressive performance in synthetic benchmarks for in-context retrieval.
  * hE only modifies a single key-value pair at a time, the model 
    ~> lacks the ability to rapidly clear outdated or irrelevant information,
    especially during context switches where previous data needs to be erased.
  ~> perform moderately on real-world tasks (Yang+ 2024b), likely due to the
  absence of a robust memory-clearing mechanism.
* Recognizing the complementary advantages of the gated update rule and the
  delta rule in memory management, we propose 
  the gated delta rule, a simple and intuitive mechanism that combines both
  * promptly clear memory by setting α t → 0, while 
  * selectively updating specific content without affecting other information by
    setting α t → 1 (effectively switching to the pure delta rule).
* The remaining challenge lies in implementing the gated delta rule in a
  hardware-efficient manner.
  * Yang+ (2024b)’s efficient algorithm parallelizes the delta rule computation
    using the WY representation (Bischof & Loan, 1985), 
  * we carefully extend their approach to incorporate the gating terms. 
  * Our extension preserves the benefits of chunkwise parallelism (Hua+ 2022b;
    Sun+ 2023a; Yang+ 2024a;b), enabling hardware-efficient training.
* Gated DeltaNet, consistently outperforms both Mamba2 and DeltaNet across 
  language modeling, commonsense reasoning, in-context retrieval, length
  extrapolation, and long-context understanding. Building on these results, we
  also develop hybrid architectures that strategically combine Gated DeltaNet
  layers with sliding window attention or Mamba2 layers, further enhancing both
  training efficiency and model performance.

# 4 Exper

* Length extrapolation on long sequences. As shown in Fig.2, we evaluate the
  * extrapolate to sequences of up to 20K tokens across six long-context
    benchmarks. Gated DeltaNet achieves the lowest overall perplexity across
    tasks among RNN models. While we observe mixed results in length
    extrapolation, Gated DeltaNet exhibits relatively more robust performance,
    suggesting better memory management. The hybrid models further improve
    upon this by leveraging attention for local context modeling, which reduces
    the memory management burden on their recurrent components. Future work
    will explore these models’ capabilities on even longer sequences.
