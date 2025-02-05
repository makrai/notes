* Abstract

* We present 
  * HuAMR, the first Abstract Meaning Representation (AMR) dataset and 
  * a suite of large language model-based AMR parsers for Hungarian, targeting
* To create HuAMR, we employed Llama-3.1-70B to automatically generate
  silver-standard AMR annotations, which we then refined manually to ensure
  quality. Building on this dataset, 
* we investigate how different 
  * model architectures — mT5 Large and Llama3.2-1B — and 
  * fine-tuning strategies affect AMR parsing performance.
* incorporating silver-standard AMRs from Llama-3.1-70B into the training data
  of smaller models does not consistently boost overall scores, our results
* these techniques effectively enhance parsing accuracy on Hungarian news data
  (the domain of HuAMR). We evaluate our parsers using 
* Smatch scores and confirm the potential of HuAMR and our parsers for
  advancing semantic parsing research.

# 1 Intro

* Dou+ (2022) further showed that leveraging AMR can improve factual consistency
  in summarization, underscoring the potential of AMR to enhance both the
* we translating the gold standard AMR (AMR 3.0 Knight+ (2020)) dataset into hu
  * publish a suite of language models, ranging from small (1B parameters) to
    large (70B parameters), capable of generating AMRs for Hungarian texts 1 .
    Our main contributions are:
  * We also publish a synthetic AMR dataset (HuAMR) generated with a Llama-
    3.1-70B model for further coverage.
  * high-performance Hungarian AMR parsers: We develop and release a series of
    * via finetuning mT5 Large and Meta Llama 3.2 models. 
  * Extensive evaluation of modeling techniques: We conduct a thorough analysis
    * different model architectures, examining 
    * the impact of additional silver training data on AMR parsing performance.
  * Evaluation of data augmentation strategies: We leverage larger models to
    generate silver-standard AMR annotations for Hungarian texts, which are then
    incorporated into the training data for smaller models. This approach
    enhances the performance of smaller models, demonstrating an effective
    strategy for low-resource settings.
