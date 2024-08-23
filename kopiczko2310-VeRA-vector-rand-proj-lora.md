VeRA: Vector-based Random Matrix Adaptation
Dawid J Kopiczko, Tijmen Blankevoort, Yuki M Asano
ICLR 2024 arXiv:2310.11454 [cs.CL]

https://dkopi.github.io/vera

# Abstract

* Low-rank adapation (LoRA) reduces the number of trainable parameters when
  finetuning large language models
  * hE acute storage challenges when scaling to even larger models or
    deploying numerous per-user or per-task adapted models
* we present Vector-based Random Matrix Adaptation (VeRA), which
  * significantly reduces the number of trainable parameters compared to LoRA,
    yet maintains the same performance. It achieves this by using
  * a single pair of low-rank matrices shared across all layers and
    small scaling vectors 
* exper on the GLUE and E2E benchmarks, image classification tasks
  * instruction-tuning of 7B and 13B language models
* from the conclusion
  * many versions can reside in the limited memory of a single GPU, thus
    substantially improving serving efficiency and
    removing the bottleneck of loading specific models into memory
* future work
  * different architectures and domains remain an area for future
  * dynamic parameter budget allocation
  * different initialization and regularization techniques

# 1 Intro

* use case: a cloud-based operating system assistant that continuously learns
  from and adapts to individual user behaviors and feedback. The need to store
* Finetuning techniques like LoRA (Hu+ 2022), while effective, still introduce
  considerable memory overhead
  * eg applying LoRA with a rank of 16 to the query and value layers of GPT-3
    (Brown+ 2020) would demand at least 288MB of memory, if stored in
    singe-precision – at a million finetuned weights, eg one per user, that
    would amount to 275TB
* Aghajanyan+ (2021): low intrinsic dimensionality of pretrained models’
  features
  * much lower than the trainable parameters used in LoRA
* surprising effectiveness of models utilizing random weights and projections
  (Peng+ 2021; Ramanujan+ 2020; Lu+ 2022; Schrimpf+ 2021; Frankle+ 2021)
* we: Vector-based Random Matrix Adaptation (VeRA)
  * minimizes the number of trainable parameters introduced during finetuning
    by reparametrizing the weights matrices
  * “scaling vectors” to adapt a pair of frozen random matrices shared between
    layers. With this approach, many more versions of the model can reside in
    the limited memory of a single GPU
* contributions
  * novel finetuning method with no additional inference time cost
    * further reduces the number of trainable parameters compared to LoRA, with
      comparable results
  * We compare our approach with LoRA and other parameter-efficient adapt meths
    on natural language understanding (GLUE) and natural language generation
    (E2E) benchmarks, and compare against LoRA on instruction-following and
    image classification tasks
  * ablation study to better understand the individual components of our method

# 2 Related work

## Low-Rank Adaptation (LoRA, Hu+ 2022)

* low-rank matrices to approximate the weight changes during finetuning,
  effectively reducing the number of parameters that need to be trained. Among
  * significantly lowers the hardware barrier for finetuning by reducing the
    need for gradient calculation and optimizer state maintenance for most
    parameters
  * can also work with quantized model weights (Dettmers+ 2023), reducing the
    requirements even further. Furthermore, LoRA modules are
  * easily swappable, making task-switching efficient and less
    resource-intensive
  * no additional inference time cost when deployed,
    * as the trainable matrices can be merged with the frozen weights
    * unlike adapter-based finetuning approaches
      (Houlsby+ 2019; Lin+ 2020; Pfeiffer+ 2021; Rücklé+ 2021)
* AdaLoRA (Zhang+ 2023b) extends the LoRA method, introducing
  dynamic rank adjustment for the low-rank matrices during finetuning
  * idea: optimally distribute the parameter budget
  by selectively pruning less important components of the matrices
  based on an importance metric

## Parameter Efficiency in Existing Methods

* methods such as LoRA still require a considerable amount of trainable params
  * Aghajanyan+ (2021), the upper bound for intrinsic dimensions is much
    smaller than what is typically utilized in such methods
  * eg the $d_90$
    * The smallest dimension d that provides a satisfactory solution, which is
      90% of the full training metric, as defined by Li+ (2018)
    * for RoBERTabase: 896, whereas
    * hE authors of the LoRA paper reported using 0.3M trainable parameters
* AdaLoRA takes steps in this direction by dynamically allocating parameters to

## Random Models and Projections

* The concept of using random matrices and projections for model efficiency
* Frankle & Carbin (2019): randomly-initialized neural networks contain
  subnetworks that are capable of reaching high performance when trained
* Ramanujan+ (2020) revealed that there exist subnetworks that can achieve
  impressive results even in the absence of training
* Aghajanyan+ (2021) showed that training only a small number of parameters,
  randomly projected back into the full space, could achieve 90% of the
  full-parameter model performance
* Ruiz+ (2023): a parameter-efficient finetuning method for personalization of
  text-to-image models, utilising random frozen matrices inside LoRA
* frozen, randomly initialized models, with small sections finetuned, can
  perform surprisingly well (Lu+ 2022; Schrimpf+ 2021; Frankle+ 2021)
