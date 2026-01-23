PaLM: Scaling Language Modeling with Pathways
A Chowdhery, S Narang, J Devlin, M Bosma, G Mishra, A Roberts, P Barham+
arXiv:2204.02311 [cs.CL]

* Large language models have been shown to achieve remarkable performance
  across a variety of natural language tasks using
* few-shot learning, which drastically reduces the number of task-spec training
* understanding the impact of scale on few-shot learning,
* we trained a 540-billion parameter, densely activated, Transformer LM
  * 6144 TPU v4 chips using Pathways, a new ML system which enables highly
    efficient training across multiple TPU Pods
* SOTA few-shot learning results on hundreds of NLU and generation benchmarks
* On a number of these tasks, PaLM 540B achieves breakthrough performance,
  outperforming
  * the finetuned SOTA on a suite of multi-step reasoning tasks, and
  * average human performance on the recently released BIG-bench benchmark
    * discontinuous improvements from model scale
* strong capabilities in multilingual tasks and source code generation, which
  we demonstrate on a wide array of benchmarks
* comprehensive analysis on bias and toxicity, and study (the extent of)
  * training data memorization with respect to model scale
  * ethical considerations related to large language models and
    potential mitigation strategies

# 1 Intro

* BERT (Devlin+ 2019a) and T5 (Raffel+ 2020), are trained with
  * encoder-only or encoder-decoder architectures using an infilling (“masked
    LM” or “span corruption”) pre-training objective on a large corpus of text,
    and are typically then adapted to 1/+ specific tasks through finetuning
  * near universal SOTA across thousands of natural language tasks,
  * hE
    * require a significant number of task-specific training examples to
      finetune the model
    * at least a portion of the model parameters must be updated, adding
      complexity from model finetuning and deployment
* GPT-3 (Brown+ 2020): extremely large autoregressive language models (LMs)
  * can be used for few-shot predictions
    * the model is only given a natural language task description and
      (optionally) a handful of exemplars
  * trained with a decoder-only architecture and a standard left-to-right
    language modeling objective on a large text corpus, where the objective is
    to predict the next token given the preceding tokens in the example
  * Few-shot evaluation has been shown to achieve very strong results without
    the need for large-scale task-specific data collection or model parameter
    updating
* Since GPT-3, a number of other large autoregressive language models have been
  * continued to push the SOTA forward. The most powerful of these post-GPT-3
  * GLaM (Du+ 2021), Gopher (Rae+ 2021a), Chinchilla (Hoffmann+ 2022),
    Megatron–Turing NLG (Smith+ 2022), and LaMDA (Thoppilan+ 2022),
    * all of which achieved few-shot SOTA results on a significant number of
      tasks at the time of their release
  * all trained either on English data or diverse multilingual sets. Other
  * specific non-English languages, such as Zeng+ (2021) for Chinese
  * all variants of the Transformer architecture (Vaswani+ 2017). The
* improvements in these models have primarily come from one or more of
  * scaling the size of the models in both depth and width;
  * increasing the number of tokens that the model was trained on;
  * training on cleaner datasets from more diverse sources; and
  * increasing model capacity without increasing the computational cost through
    sparsely activated modules
  * see sec 13
* we continue the scaling line of language modeling improvements
  * we: a 540 billion parameter, densely activated, autoregressive Transformer
  * trained on 780 billion tokens of high-quality text
  * achieved through the use of Pathways (Barham+ 2022), a new ML system which
    enables highly efficient training of very large neural networks across
    thousands of accelerator chips, including those spanning multiple Tensor
    Processing Units (TPU) v4 Pods
  * This new model, called Pathways Language Model (PaLM), achieves 
    SOTA few-shot results across
    100s of natural language, code, and mathematical reasoning tasks
* The key takeaways from this work are as follows:

## Efficient scaling

* We demonstrate the first large-scale use of Pathways (Barham+ 2022)
  * a new ML system which enables training a single model across thousands or
    tens of thousands of accelerator chips in a highly efficient manner. With
  * we trained a 540B parameter language model on 6144 TPU v4 chips at
    efficiency levels that could not be reached before for models of this scale
  * Most previous large language models either/or
    * trained on a single TPU system (Du+ 2021; Thoppilan+ 2022) or
    * used pipeline parallelism (Huang+ 2019) to scale across GPU clusters
      (Smith+ 2022) or multiple TPU v3 pods (Rae+ 2021a), with a maximum scale
      of 4096 TPU v3 chips
* In Section 4, we describe how we were able to scale pipeline-free training of
  PaLM 540B to 6144 chips across two TPU v4 Pods while achieving very high
  efficiency of 46.2% in model FLOPs utilization (observed throughput relative
  to theoretical max throughput) and 57.8% in hardware FLOPs utilization

## Continued improvements from scaling

* Sec 6, we evaluate PaLM in 100s of natural language, code, and math reasoning
  * SOTA results on the vast majority of these benchmarks, typically by
    significant margins. This critically demonstrates 
  * ie scaling improvements from large LMs have neither plateaued nor reached
    their saturation point. For instance, in 
  * eg Table 4: a new few-shot SOTA on 28 out of the 29 most widely evaluated
    English language understanding benchmarks, compared against the best
    per-task result from GLaM (Du+ 2021), GPT-3 (Brown+ 2020), Megatron–Turing
    NLG (Smith+ 2022), Gopher (Rae+ 2021a), Chinchilla (Hoffmann+ 2022), and
    LaMDA (Thoppilan+ 2022)

## Breakthrough capabilities: NLU and generation across many difficult tasks

* Section 6.3 presents evaluation on a collection of reasoning tasks
  * multi-step mathematical or commonsense reasoning to produce the answer
    Prior SOTA results use a combination of task-specific finetuning,
    domain-specific architectures, and task-specific verifiers
  * when model scaling is combined with chain-of-thought prompting (Wei+ 2022b)
    simple few-shot evaluation can outperform or match the finetuned SOTA
    on a wide array of reasoning tasks
  * from Conclusion: prompting the model to generate explicit inference chains
    can drastically increase the quality of the predictions themselves
    * can be immensely beneficial even for tasks that are modeled as
      categorical prediction or regression, which typically do not require gen
* In Section 6.2 we additionally highlight breakthrough performance on
  BIG-bench (BIG-bench collaboration, 2021)
  * BIG-bench: 150+ new NLU and generation tasks, 
    many of which are extremely difficult even for humans to correctly answer.
  * Figure 1 and Section 9, we demonstrate PaLM’s exploratory capabilities to
    explicitly interpret and explain complex reasoning chains
  * Fig 1 demonstrates exploratory capabilities in prompting PaLM to generate
    explanations using chain-of-thought prompting (Wei+ 2022b)
    * All examples were generated with greedy (1-best) decoding of PaLM 540B
      The prompting was done with 2-shot exemplars, which are shown in Sec 9,
      along with output on more examples using these same exemplars

## Discontinuous improvements – To better understand the scaling behavior,

* we present results at three different parameter scales: 8B, 62B, and 540B
  * Typically, scaling from 62B to 540B results in similar performance as
    scaling from 8B to 62B, which is
  * consistent with the “power law” rule of thumb often observed in neural
    network scaling (Kaplan+ 2020)
  * hE, for certain tasks, we observe discontinuous improvements, where scaling
    from 62B to 540B results in a drastic jump in accuracy compared to
    * on roughly 25% of the BIG-bench tasks in Section 6.2. This suggests that
    * new capabilities of large LMs can emerge when the model achieves
      sufficient scale, and that these capabilities continue to emerge beyond
      previously studied scales

## Multilingual understanding

* Previous work on large language models: limited evaluations in the multiling
* we conduct a more thorough evaluation of multilingual benchmarks including
  machine translation (Section 6.5), summarization (Section 6.6), and question
  answering (Section 6.7) in a wide variety of languages. Even with a
* only ≈ 22% non-English data  in the training corpus, few-shot evaluation
* bridge the gap with prior finetuned SOTA in non-English summarization tasks
* outperform prior SOTA in translation tasks
* Further work is necessary to understand the impact of increasing the
  proportion of multilingual data on the English and multiling

## Bias and toxicity – We also evaluated model performance for

* distributional bias and toxicity, which resulted in several insights (Sec 10)
  * for gender and occupation bias, we found that accuracy on the Winogender
    coreference task improves with model scale, and PaLM 540B sets a new SOTA
    result in 1-shot and few-shot settings
  * co-occurence analysis performed on race/religion/gender prompt continuation
    demonstrates the potential for the model to falsely affirm stereotypes, for
    instance, associating Muslims with terrorism, extremism, and violence. This
    * consistent across model scales
  * toxicity analysis on prompt continuation tasks demonstrates
    a slightly higher overall toxicity level for the 62B and 540B model
    compared to the 8B model
    * the toxicity of the model-generated continuation correlates highly with
      the toxicity of the prompting text, whereas human-generation
      continuations do not have a strong toxicity correlation.  This suggests
    * the model is more heavily influenced by the style of the prompt than
      would be the case for human-generated text
    * In future work, we plan to broaden these benchmarks to non-English
      languages and more exhaustively account for potential risks

# 6 Evaluation

6.1 English NLP tasks
6.2 BIG-bench
6.3 Reasoning
6.4 Code Tasks
6.5 Translation
6.6 Multilingual Natural Language Generation
6.7 Multilingual Question Answering
6.8 Analysis

# 13 Open Questions in Scaling

* In our introductory section, we described the four main axes which have led
  to significant quality improvements of large LMs for few-shot learning
  * model depth and width,
  * number of tokens trained,
  * training corpus quality,
  * increased model capacity without increased compute (ie sparse models)
* Throughout the rest of the paper [ie so far], we primarily focus on (1)
3. PaLM 62B outperforms GPT-3 and other large LMs on a significant number of
tasks, despite having a much lower total training FLOP count. This would hint
at (3) being a major factor, although we do not perform the necessary ablation
studies to say this conclusively
  * Du+ (2021) did perform ablation studies on the same training corpus, and
    * improvement in few-shot learning from careful data filter is extr signif
* ablation studies to tease out the effects of (1) vs (2),
  * we did not perform such, due to the high training cost
    * a critical open scaling question is: “How would a 62B parameter model
      trained for 7T tokens compare to our 540B parameter model trained for
      780B tokens?  What about a 120B model for 3.6T tokens? 240B for 1.8T
      tokens?”
    * such a model would have roughly the same total training cost as PaLM 540B
    * if downstream task performance were to be comparable, the smaller model
      would certainly be preferable, as the inference cost is proportional to
      its size
* Hoffmann+ (2022) was published to explore this exact question. There, the
  authors train a new LM called Chinchilla, a 70B parameter model trained on
  1.4T tokens of data. This is compared against Gopher—a 280B parameter model
  trained on 300B tokens of
  * using the same training corpus and general training setup
  * similar training cost, but Chinchilla outperforms Gopher by a large
    margin across many tasks
  * many of the benchmark tasks reported by Chinchilla do not overlap with
    those evaluated by PaLM,
    we can compare results on the benchmarks that do overlap. Specifically,
* Chinchilla and PaLM have comparable results on 58 BIG-bench tasks and 9
  English NLP tasks
  * The task-specific results on the 9 English NLP benchmarks are shown in
    Table 20. 19 Task-specific results on BIG-bench are excluded for space
* Fig24: aggregate results on both sets of tasks,
  as a function of total training FLOP count
  * Chinchilla
    * moderately outperforms PaLM’s interpolated scaling curve on BIG-bench,
    * slightly underperforms the scaling curve on the 9 English NLP tasks
  * Gopher significantly underperforms both scaling curves
  * the training corpus used for Gopher and Chinchilla were identical, so they
    can be compared minimally using factors (1) and (2), whereas PaLM used a
    different corpus, which creates additional complications in drawing
    conclusions due to factor (3)
  * results certainly support the conclusion drawn in Hoffmann+ (2022) that
    Gopher was under-trained for a model of its size, however,
    we cannot use these results to extrapolate an answer to our critical
    scaling question
    (“How would a model of size X trained on Y tokens compared to PaLM 540B?”)
* There are several reasons why this is a difficult question to answer:
  1. In order to draw strong conclusions, such experiments would have to be
     performed at scale, which has a large computational cost
  2. If the smaller model were trained using fewer/the same number of TPU chips
     than the larger model
    * fewer: this would proportionally increase the wall-clock time of training,
       since the total training FLOP count is the same
    * same: it would be very difficult to maintain TPU compute efficiency
      without a drastic increase in batch size
      * The batch size of PaLM 540B is already 4M tokens, and it is unclear if
        even larger batch sizes would maintain sample efficiency
  3. Although there is a large amount of very high-quality textual data
     available on the web, there is not an infinite amount
    * For the corpus mixing proportions chosen for PaLM,
      data begins to repeat in some of our subcorpora after 780B tokens, which
      is why we chose that as the endpoint of training
    * It is unclear how the “value” of repeated data compares to unseen data
      for large-scale language model training
* In future work, we plan to investigate the
  * trade-off between different factors that lead to more capable LMs which
    generalize well across a number of tasks.  We hope to further explore the
    four factors described here, in addition to
  * other factors such as model architecture, pre-training tasks, and
    optimizer configuration
