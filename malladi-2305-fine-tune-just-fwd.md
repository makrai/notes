Fine-Tuning Language Models with Just Forward Passes
S Malladi, T Gao, E Nichani, A Damian, JD Lee, D Chen, S Arora
arXiv:2305.17333

# Abstract

* Fine-tuning language models (LMs) has yielded success on diverse tasks
* hE backpropagation requires a prohibitively large amount of memory
* Zeroth-order (ZO) methods
  * can in principle estimate gradients using only two forward passes
  * hE theorized to be catastrophically slow for optimizing large models
* we propose a memory-efficient zeroth-order optimizer (MeZO),
  * adapting the classical ZO-SGD method to operate in-place
  * same memory footprint as inference
  * For example, with a single A100 80GB GPU,
    MeZO can train a 30-billion parameter model, whereas fine-tuning with
    backpropagation can train only a 2.7B LM with the same budget
* comprehensive experiments across
  * masked and autoregressive LMs
  * model scales (up to 66B)
  * tasks (classification, multiple-choice, and generation)
* Our results demonstrate that
  * significantly outperforms in-context learning and linear probing;
  * comparable to fine-tuning with backpropagation across more tasks
    * up to 12x memory reduction;
  * compatible with both full-parameter and parameter-efficient tuning techs
    * eg LoRA and prefix tuning;
  * can effectively optimize non-differentiable objectives
    (eg maximizing accuracy or F1)
* theoretical insights
  * adequate pre-training and task prompts enable MeZO to fine-tune huge models,
    despite classical ZO analyses suggesting otherwise

# 1 Intro

* Fine-tuning pre-trained language models (LMs) for
  * solving many language tasks [27], adapting to specialized domains [40], or
    incorporating human instructions and preferences [70]
  * hE as LMs are scaled up [12, 69],
    computing gradients for backpropagation requires prohibitive memory
    * 12× the memory required for inference
    * needs to cache activations during the forward pass,
      gradients during the backward pass, and,
      in the case of Adam [50], also store gradient history (see Section 3.4)
    * it is possible to run inference with a 30B parameter LM on a single
      Nvidia A100 GPU (with 80GB memory),
      hE backpropagation with Adam is feasible only for a 2.7B LM
* Parameter-efficient fine-tuning methods (PEFT [44, 55, 52])
  * references
    * [44] Edward J Hu, yelong shen, Phillip Wallis, Zeyuan Allen-Zhu,
        Yuanzhi Li, Shean Wang, Lu Wang, and Weizhu Chen
      LoRA: Low-rank adaptation of large language models
      ICLR 2022 International Conference on Learning Representations
    * [55] Xiang Lisa Li and Percy Liang
      Prefix-tuning: Optimizing continuous prompts for generation
      ACL-IJCNLP 2021
    * [52] Brian Lester, Rami Al-Rfou, and Noah Constant
      The power of scale for parameter-efficient prompt tuning
      EMNLP 2021
  * update just a fraction of the network parameters
  * hE still need to cache many activations,
    because the tuned parameters are scattered throughout the model
  * In our tests, fine-tuning an OPT-13B model with full parameter or PEFT
    requires 12× and 6× more memory than inference respectively
* In-context learning (ICL [12]) has allowed
  * solving many tasks with a single inference pass, during which
    the model processes labeled examples (demonstrations) in its context and
    then outputs a prediction on a test example. While this
    * allows for quick adaptation of the model to specific use cases, current
    * hE limited context size (and thus, limited demonstrations) and the
      performance is sensitive to the formatting and choice of demonstrations
      [58, 64]
    * often performs worse than fine-tuning of medium-sized models [12]
    * inference with ICL is more expensive, as it always requires
      demonstrations in context and thus increases the input length
* non-differentiable criteria
  * eg human preference scores or set safety standards [84, 70]
  * Another reason to consider alternatives to standard backpropagation
  * backpropagation cannot incorporate non-differentiable criteria
  * Typically with reinforcement learning from human feedback (RLHF [19]),
  * expensive
* A classical zeroth-order optimization method (ZO-SGD [83])
  * uses only differences of loss values to estimate the gradients
  * in princip, the method can update neural networks with just forward passes
    * naive implementation still doubles the memory overhead and
    * classical lower bounds [67, 31] suggest that
      convergence slows linearly with model size
  * have been applied in deep learning settings to
    find adversarial examples or tune input embeddings [86, 85] but
    * not to directly optimize large-scale models (see Liu+ [59] for a survey)
* we propose a memory-efficient zeroth-order optimizer (MeZO), which
  * adapts the classical ZO-SGD algorithm and
    reduces its memory consumption to the same as inference
  * We apply MeZO to fine-tune large LMs and show, both empir and theo,
    that MeZO can successfully optimize LMs with billions of parameters
* contributions
  1. In MeZO, we adapt the ZO-SGD algorithm [83] and a number of variants
    to operate in-place on arbitrarily large models
    with almost no memory overhead (see Algorithm 1 and Section 2)
  2. comprehensive experiments
    * across model types (masked LM and autoregressive LM),
      * model scales (from 350M to 66B), and downstream
      * tasks (classification, multiple-choice, and generation)
    * MeZO consistently demonstrates superiority
      over zero-shot, ICL, and linear probing
    * with RoBERTa-large, MeZO achieves performance close to standard
      fine-tuning within 5% gap
    * with OPT-13B, MeZO
      outperforms or performs comparably to fine-tuning on 7 out of 11 tasks,
      despite requiring roughly 12× less memory (Figure 1 and Section 3)
  3. compatibility with full-parameter tuning and PEFT
    (eg LoRA [44] and prefix-tuning [55]) in Section 3
  4. MeZO can optimize non-differentiable objectives such as accuracy or F1
    * while still requiring only the same memory as inference (Sec 3.3)
  5. Our theory suggests that adequate pre-training ensures the per-step
     optimization rate (Theorem 1) and global convergence rate (Lemma 3) of
     MeZO depend on a certain condition number of the landscape (ie, the local
     effective rank, see Assumption 1) instead of numbers of parameters
    * in sharp contrast to existing ZO lower bounds [67, 31]
      * existing lower bounds suggest that the
        converg rate can slow proport to the number of parameters (Section 4)

# 4 Theory

* when the loss landscape exhibits favorable conditions (Assumption 1), we can
  derive a convergence rate independent of the number of parameters
  * the loss decreases per step at a rate independent of the parameter
    dimension d (Theorem 1)
  * under stronger conditions, the algorithm converges in time independent of d
    (Lemma 3)
  * Together, these results imply that MeZO is not catastrophically slower than
    SGD when fine-tuning
    * Section 3 uses the standard choice of Adam for FT
    * we provide SGD experiments in Appendix E.1
* For ease of illustration, we assume that z is sampled from a sphere with
  radius √d
  * in Appendix F.2 we derive the rate for a general Gaussian z,
    which was used in the experiments
* We follow classical analyses of SGD and
  * replace the mini-batch gradient estimate with SPSA.  Consider the minibatch
    SGD update θt+1 ← θt − η∇L(θ; Bt) where Bt is a minibatch drawn uniformly
    from DB . Crucially, the SGD minibatch gradient estimate is unbiased

# 6 Conclusion

* future
  * combining MeZO with other memory-efficient methods,
    eg FlashAttention [22] and quantization [25]
  * application of MeZO to pruning, distillation, saliency, interpretability,
    and dataset selection for fine-tuning
  * Non-differentiable objectives are a particularly exciting area
    * recent advances in tuning large LMs to adapt to human feedback
    * future: theoretical analyses for how these efficient gradient estimates
      impact the performance of different applications
