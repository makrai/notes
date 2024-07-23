Compacter: Efficient Low-Rank Hypercomplex Adapter Layers
Rabeeh Karimi Mahabadi, James Henderson, Sebastian Ruder
NeurIPS 2021 arXiv:2106.04647

https://github.com/rabeehk/compacter

# Abstract

* fine-tuning is the standard method for achieving SOTA performance on NLP
  * hE fine-tuning all weights of models with Ms/Bs of parameters is
    sample-inefficient, unstable in low-resource settings, and wasteful as it
    requires storing a separate copy of the model for each task
* parameter-efficient fine-tuning methods
  * hE either still require a relatively large number of parameters or
    underperform standard fine-tuning
* we propose Compacter, a method for fine-tuning large-scale language models
  with a better trade-off between task performance and the number of trainable
  parameters than prior work
  * building on top of ideas from adapters, low-rank optimization, and
    parameterized hypercomplex multiplication layers
  * Compacter inserts task-specific weight matrices into a pretrained model,
    which are computed efficiently as a sum of Kronecker products between
    shared "slow" weights and "fast" rank-one mxs defined per Compacter layer
* By only training 0.047% of a pretrained model's parameters, Compacter
  * performs on par with standard fine-tuning on GLUE and
  * outperforms standard fine-tuning on SuperGLUE and low-resource settings

# 1 Intro

* SOTA pretrained language models (PLMs) in NLP have used
  heavily over-parameterized representations consisting of 100 M/Bs of params
  to achieve success on a wide range of NLP benchmarks [2, 3, 4]
  * generally applied to downstream tasks via fine-tuning [5], which
    requires updating all parameters and storing one copy of the fine-tuned
    model per task
* causes substantial storage and deployment costs and hinders the applicability
  * on low-resource datasets has been shown to be subject to instabilities and
    may lead to poor performance [6, 7]
* we aim to develop practical, memory-efficient methods that train a minimum
  set of parameters while achieving performance on par or better than full
  fine-tuning for state-of-the-art NLP models
* parameter-efficient fine-tuning methods. These approaches generally
  * keep the pretrained model’s parameters fixed and
    introduce a set of trainable parameters per task,
  trading off the number of trainable parameters with task performance
  * prompts,
    * At one end of the spectrum
    * ie natural language descriptions of a task, together with demonstrations
    * reasonable performance without any parameter updates on some benchms [8]
    * their performance generally lags behind fine-tuned models
    * They also require huge models to work well but
    * choosing good prompts becomes harder with larger model sizes [9]
  * Soft prompt methods treat prompts as trainable continuous parameters, which
    * prepended to the inputs at the input layer or intermediate layers [10,
      11, 12]. Such methods, however,
    * often require large models to achieve good performance and are
    * very sensitive to initialization and unstable during training
* The theoretically motivated low-rank methods
  * train a small number of parameters that lie in a low-dimensional subspace
    using random projections [13, 14]. However,
  * hE storing the random projection matrices causes substantial memory
    overhead and leads to slow training times
* adapter methods [1, 15]
  * At the other end of the spectrum,
  * insert trainable transformations at different layers of the pretred model
    require more parameters than the aforementioned approaches but are
    more memory-efficient and
  * performance comparable to full fine-tuning [1, 16]
* we propose Compacter, a method for fine-tuning large-scale language models
  with an excellent trade-off between the number of trainable parameters, task
  performance, and memory footprint, compared to existing methods (see Fig 1)
  * builds on ideas from adapters [1], low-rank methods [13], as well as recent
    hypercomplex multiplication layers [17]
  * Similar to adapters, Compacter inserts task-specific weight matrices into a
    pretrained model’s weights
  * Each Compacter weight matrix is computed as the sum of Kronecker products
    between shared “slow” weights and “fast” rank-one matrices defined per
    Compacter layer (see Figure 3). As a result, Compacter achieves a
  * parameter complexity of O(k+d) compared to O(kd) for regular adapters,
    where the adapters are of size k×d. In practice, Compacter
  * trains 0.047% of a PLM’s parameters
* exper
  * On the standard GLUE [18] and SuperGLUE [19] benchmarks, Compacter
    outperforms other parameter-efficient fine-tuning methods and obtains
    performance on par or better than full fine-tuning
  *  low-resource settings, Compacter outperforms standard fine-tuning
In summary, we make the following contributions:
  * Compacter (Compact Adapter) layers, a parameter-efficient method to adapt
    large-scale language models
  * Compacter obtains strong empirical performance on GLUE and SuperGLUE
  * Compacter outperforms fine-tuning in low-resource settings
  * parameter complexity analysis of Compacter, showing that it requires
    dramatically fewer parameters than adapters and fine-tuning
  * systematic evaluation of recent parameter-efficient fine-tuning methods
    in terms of training time and memory consumption. We release our code

## 3.2 Beyond Hypercomplex Adapters

### Low-rank parameterization [13, 14]: optimization in a low-rank subspace

* The LPHM layer can also be seen as leveraging
  * “slow” weights Ai that are shared across adapters and capture general
    information and
  * “fast” weights Bi that learn adapter-specific information for adaptation of
    each individual layer [25]

## 5.1 Baselines

### Intrinsic-SAID The Structure Aware Intrinsic Dimension [14]

* fine-tunes the model by reparameterizing the parameters in a lower-dim
  subspace where
  * parameter θi,0 are the pretrained model’s parameters and
  * P ∈ Rd −m → RD is a random linear proj via the Fastfood transform [32]
* They then consider the total number of weight matrices in the PLM, m, and
  attribute a weight to each of them, resulting in λ ∈ Rm in total by trading m
  parameters from the low dimensional space θ d ∈ Rd . Then, the total
  trainable parameters are θ d −m ∈ Rd −m and λ

## 5.5 Efficiency Evaluation

* Intrinsic-SAID and Prompt Tuning methods have the lowest number of
  parameters. However, they
  * hE both come with high memory overhead (41.14% and 24.42% relative to full)
  * slowest to train, and their performance substantially lags behind full
    fine-tuning (see Table 1). For
  * Prompt Tuning, high memory costs are due to the fact that the computational
    complexity of self-attention, which requires storing the full attention
    matrix for gradient computation, scales quadratically with the sequence
    length [36]. For
  * Intrinsic-SAID, the high memory requirement is due to storing large random
    projection matrices, which limits the application of Intrinsic-SAID for
    fine-tuning large-scale PLMs. Moreover,
    * computing projections via FastFood transform, although
      * theoretically possible in O(Dlogd0 ) [32], is
      * slow in practice even with a CUDA implementation
      * For pretrained language models with a large number of parameters,
        allocating random projections for the full parameter space is
        intractable. While using
      * Fastfood transform partially ameliorates this issue by reducing the
        memory usage from O(Dd0 ) to O(D),
        the memory issue with such methods remains unresolved
