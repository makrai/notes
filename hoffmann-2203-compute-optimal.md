Training Compute-Optimal Large Language Models
J Hoffmann, S Borgeaud, A Mensch, E Buchatskaya, T Cai, E Rutherford,
  DdL Casas, L Anne Hendricks, J Welbl, A Clark, T Hennigan, E Noland,+
arXiv:2203.15556 [cs.CL]

# Abstract

* We investigate the optimal model size and number of tokens
  for training a transformer language model under a given compute budget
* current large language models are significantly undertrained, a consequence
  <~ scaling language models whilst keeping the amount of training data const
* we train over 400 language models ranging
  * parameters: from 70 million to over 16 billion parameters on
  * tokens: 5 to 500 billion tokens, we find that
* for compute-optimal training, the model size and the number of training
  tokens should be scaled equally: for every doubling of model size the number
  of training tokens should also be doubled
* we train a predicted compute-optimal model, Chinchilla, that
  * uses the same compute budget as Gopher but with
    70B parameters and 4× more more data
  * uniformly and significantly outperforms Gopher (280B), GPT-3 (175B),
    Jurassic-1 (178B), and Megatron-Turing NLG (530B) on a large range of
    downstream evaluation tasks.  This also means that Chinchilla uses
* substantially less compute for fine-tuning and inference, greatly
* SOTA average accuracy of 67.5% on the MMLU benchmark, > 7% improv over Gopher

# 1. Introduction

* LLMs (Brown+ 2020; Lieber+ 2021; Rae+ 2021; Smith+ 2022; Thoppilan+ 2022),
  * the largest dense language models now having over 500 billion parameters
  * These are autoregressive transformers (Vaswani+ 2017) have demonstrated
  * evaluation protocols such as zero-shot, few-shot, and fine-tuning
* The compute and energy cost for training large language models is substantial
  (Rae+ 2021; Thoppilan+ 2022) and rises with increasing model size
  * In practice, the allocated training compute budget is often known in
    advance: how many accelerators are available and for how long we want to
  * it is typically only feasible to train these large models once,
  * estimating the best model hyperparameters for a given compute budget
    (Tay+ 2021)
* Kaplan+ (2020) showed that there is a
  * power law relationship between the number of parameters in an
    autoregressive language model (LM) and its performance
    * As a result, the field has been training larger and larger models,
      expecting performance improvements. One notable conclusion in Kaplan+
    * Following Kaplan+ (2020) and the training setup of GPT-3 (Brown+ 2020),
      many of the recently trained large models have been trained for
      approximately 300 billion tokens (Table 1), in line with the approach of
      predominantly increasing model size when increasing compute
  * large models should not be trained to their lowest possible loss to be
    compute optimal
  * we reach the same conclusion
  * hE large models should be trained for many more training tokens
    than recommended by the authors
  * eg given a 10× increase computational budget,
    * they suggests that the size of the model should increase 5.5× while the
      number of training tokens should only increase 1.8×. Instead,
    * we find that model size and the number of training tokens should be
      scaled in equal proportions
* we model the final pre-training loss2 𝐿 (𝑁, 𝐷) as a function of the number
  of model parameters 𝑁 , and the number of training tokens, 𝐷
  * the computational budget 𝐶 is a deterministic function FLOPs(𝑁, 𝐷) of the
    number of seen training tokens and model parameters,
  * we are interested in minimizing 𝐿 under the constraint FLOPs(𝑁, 𝐷) = 𝐶 :
* We empirically estimate these functions based on the losses of over
  400 models, ranging from under 70M to over 16B parameters, and trained
  on 5B to over 400B tokens – with each model configuration trained for several
  different training horizons. Our approach leads to
* considerably different results than that of Kaplan+ (2020). We highlight our
  * Figure 1 and how our approaches differ in Section 2
* for the compute budget used to train Gopher, an optimal model should be 4
  times smaller, while being training on 4 times more tokens. We verify this by
  * we train a more compute-optimal 70B model, called Chinchilla, on 1.4
    trillion tokens. Not only does Chinchilla
  * Chinchilla outperforms its much larger counterpart, Gopher, but its reduced
    * reduces inference cost considerably and
    * greatly facilitates downstream uses on smaller hardware
