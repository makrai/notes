Cognitively Decoupled Meta-Induction for Out-of-Distribution Generalization
Yuqian Wang, Y Wang, C Xiao, K Xu, B He, J Tan, Z Chen, L Chen, Y Huo, M Sun
EMNLP 2026

tl;dr (Figure 1) 
  * ICL (left) surface-matches and fails OOD.  
  * TIR-based reasoning (right) induces a task-level rule 
    that generalizes to both ID and OOD.

[paper](https://arxiv.org/abs/2610.25749)

* In-context learning (ICL)
  tackles downstream tasks conditioned on demonstrations
  * relies heavily on neighbor-based matching between queries and
    demonstrations, limiting out-of-distribution (OOD) performance
* rule-based inductive reasoning derives task-level regularities, which we term
  task-level inductive representations (TIR), before directly answering.
* hE existing methods lack generalizable inductive ability across diverse tasks.
* Inspired by meta-learning,
* we propose Cognitive-Decoupling meta-Induction (CoDI) for TIR-based inductive
  reasoning on general tasks. CoDI
  * comprises
    * a Cognitive-Decoupling Framework for query-blind TIR induction, and
    * a Dual-Loop Meta-Inductive Learning method for cross-task inducer optimiz
* Empirically
  * substantial performance gains on five ID and OOD benchmarks, and
  * preserves OOD gains without explicit induction at inference.
  Code is available at this https URL.

# Intro

* In-context learning (ICL) is a prevalent paradigm for tackling downstream
  * LLMs to solve new queries conditioned on limited contextual labeled
    demonstrations (Brown+ 2020).
  * hE rely heavily on demonstration format, label space, and
    nearestneighbor-style similarity between queries and demonstrations 
    (Min+ 2022b; Li+ 2025)
  * distribution shifts and unseen task functions, such similarity-dominated
    behavior often suffers substantial performance degradation (Wang+ 2025).
  * what we name task-level inductive representations (TIR):
    rule-based inductive reasoning derives generalizable principles 
    for straight answering, 
* difference between ICL and TIR-based reasoning is shown in Figure 1. The
  * ICL relies on surface matching with certain demonstrations, while the latter
  * TIR learns universal task patterns from all supports for better transfer.
* previous alternatives
  * elicit intermediate reasoning 
    through chain-of-thought (CoT) prompting and structured reasoning plans 
    (Wei+ 2022; Zhou+ 2024). Yet these reasoning structures are 
    * usually produced at inference time for the prompted query or task context,
    * ie not reusable cross-task inducer (Li+ 2025; Zhou+ 2024). A complementary
  * task-level rules via automated prompt optimization 
    (Zhou+ 2023; Fernando+ 2024; Agrawal+ 2026), but such methods 
    * optimize prompts per task or system and 
      must re-optimize when the task setting changes.
* human concept learning can infer compact, program-like rules from very few
  examples (Lake+ 2015), suggesting an 
  * ie induction-before-straight-answering pattern even on unfamiliar tasks. We
  * this cross-task TIR inference capability =: meta-induction. Recent work
* LLMs are weak at this capability (Li+ 2025), as 
  their inductive behavior is dominated by neighbor-based matching 
  rather than reusable abstract rules.
* instilling this capacity in LLMs presents two challenges: 
  * ensuring metainduction generalizes across tasks 
    without overfitting to instance-specific patterns or task-local rules; 
  * learning TIR in the absence 
    of ground-truth labels and established evaluation criteria.
* we propose Cognitively Decoupled meta-Induction (CoDI), 
  a TIR-based inductive reasoning method on general tasks. As shown in Figure 2,
  * comprises 
    Cognitive-Decoupling Framework and Dual-Loop Meta-Inductive Learning
  * CognitiveDecoupling Framework, 
    a query-blind inducer induces TIR solely from demonstrations, and 
    an executor executes TIR for each query.
  * Dual-Loop Meta-Inductive Learning 
    optimizes the inducer across tasks via meta-RL, 
    guided by execution feedback without ground-truth TIR labels, where 
    an inner loop applies candidate TIR and an 
    outer loop refines induction via 
    two complementary rewards for extrinsic correctness and intrinsic certainty.
* Experiments on BBH (Suzgun+ 2023), BIGBench (Srivastava+ 2023), MATH-500
  (Lightman+ 2024), StrategyQA (Geva+ 2021), and ReClor (Yu+ 2020) show that
  * CoDI (Qwen3-4B) outperforms ICL on in-distribution (ID) and
    out-of-distribution (OOD) evaluations.
  * On BIG-Bench, CoDI achieves +120% and +18% gains on ID and OOD splits, resp.
  * a smaller trained inducer surpasses a larger untrained one on OOD tasks,
    confirming TIR quality as an independently optimizable capability orthogonal
    to model scale. Notably, 
  * OOD gains persist even without the induction step at inference, indicating
    that meta-inductive training 
    internalizes inductive priors into model parameters.
In summary, our contributions are as follows:
  * TIR-based inductive reasoning as a learning problem that requires 
    inferring reusable task rules from support examples alone before execution.
  * We present CoDI to instill meta-induction without TIR supervision,
    decoupling rule induction from straight answering and 
    optimizing inducers across tasks via reinforcement learning on execution
    feedback.
  * Experiments on five benchmarks show 
    CoDI outperforming few-shot ICL in~ and out-ofdistribution, with 
    smaller trained inducers beating larger untrained ones and 
    OOD gains persisting without inference-time induction.
