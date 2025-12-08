Smarter, Better, Faster, Longer: A Modern Bidirectional Encoder
  for Fast, Memory Efficient, and Long Context Finetuning and Inference
B Warner, A Chaffin, B Clavié, O Weller, O Hallström, S Taghadouini,
  A Gallagher, R Biswas, F Ladhak, T Aarsen, N Cooper, G Adams, J Howard,
  I Poli

# Abstract

* Encoder-only transformer models such as BERT offer a
  * great performance-size tradeoff for retrieval and classification tasks
    with respect to larger decoder-only models
  * the workhorse of numerous production pipelines
  * hE limited Pareto improvements to BERT since its release
* we introduce ModernBERT, bringing
  modern model optimizations to encoder-only models and representing
  a major Pareto improvement over older encoders
* Trained on 2 trillion tokens with a native 8192 sequence length, ModernBERT
  * SOTA results on a large pool of evaluations encompassing
    * diverse classification tasks and
    * both single and multi-vector retrieval on different domains (including
      code). In addition to strong downstream performance, ModernBERT is also
  * the most speed and memory efficient encoder and is
  * designed for inference on common GPUs

# 1 Intro

* Large Language Models (LLMs) such as
  * GPT (Radford+, 2018, 2019; Brown+, 2020),
  * Llama (Touvron+, 2023; Dubey+, 2024), and
  * Qwen (Bai+, 2023; Yang+, 2024)
* The encoder’s popularity is largely due to their modest inference requirems,
  * efficiently process corpora of documents at scale for retrieval and quickly
    perform discriminative tasks. Encoder models offer
  * a compelling tradeoff in quality versus size, making them
    a popular option against encoder-decoder and decoder-only language models
    when dealing with substantial amounts of data (Penedo+, 2024)
  * in Information Retrieval (IR) applications, eg , semantic search, with
    notable progress on leveraging encoders for this task
    (Karpukhin+, 2020; Khattab and Zaharia, 2020)
  * LLMs also motivated a renewed interest in encoder-only models for IR
    * encoder-based semantic search is a core component of
      Retrieval-Augmented Generation (RAG) pipelines (Lewis+, 2020), where
      encoder models are used to retrieve and feed LLMs with context relevant
      to user queries
* still frequently used for a variety of discriminative tasks
  * classification (Tunstall+, 2022) or
    * L Tunstall, N Reimers, Unso ES Jo, L Bates, D Korat, M Wasserblat, O Pereg
      arXiv 2022
      Efficient few-shot learning without prompts
  * Na[med] Entity Recognition (NER) (Zaratiana+, 2024)
  * where they often match the performance of specialized LLMs
  * they can be used in conjunction with LLMs, for example
    * detecting toxic prompts (Ji+, 2023; Jiang+, 2024b) and
    * preventing responses, or
    * routing queries in an agentic framework (Yao+, 2023; Schick+, 2023)
  * hE these pipelines currently rely on older models, and
    * quite often on the original BERT itself as their backbone (Wang+, 2022;
      Xiao+, 2023), without leveraging recent improvements
    * sequence lengths limited to 512 tokens,
    * suboptimal model design (Anthony+, 2024) and
    * suboptimal vocabulary sizes (Karpathy, 2023), and
    * generally inefficient architectures
      in terms of both downstream performance or computational efficiency
    * training data is limited in volume and restricted to narrow domains
      (especially lacking code data) or lacking knowledge of recent events
* Recent modernization efforts have only partially addressed the shortcomings
  * matching BERT performance with better training efficiency
    * MosaicBERT (Portes+, 2023)
    * CrammingBERT (Geiping and Goldstein, 2023)
    * AcademicBERT (Izsak+, 2021) focused on 
  * concurrently to this work
    * NomicBERT (Nussbaum+, 2024) and GTE-en-MLM (Zhang+, 2024)
    * longer-context encoder models
    * retrieval applications, but did
    * not optimize for efficiency or classification performance, and
    * re-used older training data mixtures which is
      especially apparent in programming-related tasks
* Contributions: We present ModernBERT, a modernized encoder-only transformer
  * increase downstream performance and efficiency,
    especially over longer sequence lengths. We also bring encoder-only models
  * larger data scales, by training on 2 trillion tokens, with a data mixture
    including code data
  * two [pretrained] models, ModernBERT-base and ModernBERT-large, which reach
    SOTA overall performance against all existing encoder models
    on a wide variety of downstream tasks
  * considerably higher inference efficiency, processing sequences of 8192
    tokens almost two times faster than previous models
  * FlexBERT1, our modular architecture framework allowing easy experiments,
  * all intermediate training checkpoints (further detailed in Section 2.2.2)
    * inspired by Pythia (Biderman+, 2023),

## 3.1 Evaluation Setting

### 3.1.1 Natural Language Understanding

* General Language Understanding Evaluation (GLUE) benchmark (Wang+ 2018)
  * sentence or sentence-pair understanding tasks, such as
  * eg sentiment detection (Liu+ 2019b) or language entailment, through tasks
    eg MNLI (Williams+ 2018)
  * saturated by the best-performing models, such as LLMs (Zhao+ 2023)
  * remains one of the most commonly used evaluation suites for smaller
    encoder-based models, and
    provides a good impression of a model’s performance on classification
    (Portes+ 2023; Zhang+ 2024; He+ 2023)
