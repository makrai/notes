Adapters: A Unified Library for Parameter-Efficient and Modular Transfer Learn
Clifton Poth, Hannah Sterz, Indraneil Paul, Sukannya Purkayastha,
  Leon Engländer, T Imhof, I Vulić, S Ruder, I Gurevych, J Pfeiffer
EMNLP 2023: Systems Demonstrations arXiv:2311.11077 [cs.CL]

https://adapterhub.ml/adapters

# Ruder

* Full fine-tuning of LLMs has become prohibitive
* parameter-efficient methods
* Adapters, a library, the successor to adapter-transformers
* 10 diverse modular methods such as prompt tuning, prefix tuning, Compacter,
  LoRA, and (IA)³ into 20 SOTA models for NLP, vision, and multi-modal applics
* It supports a range of operations on these modules
  eg grouping, stacking, fusing, splitting, and parallelizing, etc
  * enable a variety of modeling approaches and research directions

# Abstract

* We introduce Adapters, an open-source library
* unifies parameter-efficient and modular transfer learning in LLM
* integrating 10 diverse adapter methods into a unified interface
* ease of use and flexible configuration
* allows researchers and practitioners to
  leverage adapter modularity through composition blocks
  enabling the design of complex adapter setups
* evaluation of its performance against full fine-tuning on various NLP tasks
* addressing the challenges of conventional fine-tuning paradigms
* more efficient and modular transfer learning

# 1 Intro

* the established transfer learning paradigm of fine-tuning all model params
  (Howard and Ruder, 2018; Devlin+ 2019)
* hE
  * parameter efficiency <=> ever-increasing size of pretrained LLMs
    (GPT3, Brown+ 2020; PaLM Chowdhery+ 2022)
  * negative interference, lack of positive transfer between tasks in
    multi-task learning (McCloskey and Cohen, 1989),
    catastrophic forgetting (French, 1999), and poor generalization
* Two closely related lines of research aimed at addressing these
  * parameter-efficient fine-tuning (Lialin+ 2023; Sabry and Belz, 2023)
    focuses on the aspect of computational efficiency and feasibility
    by only fine-tuning a small number of parameters for downstream tasks
  * modular transfer learning (Pfeiffer+ 2023) focuses on the aspect of
    knowledge transfer by designing
    * self-contained network modules which can be aggregated
      for better multi-task performance and generalization
  * adapters
    * small components within a language model for fine-tuning on labeled data,
    * both parameter-efficient and modular in nature
* The initial release of AdapterHub (Pfeiffer+ 2020a) marks the first attempt
  * make adapters accessible to researchers and practitioners, easy to use
  * integrate, train and use adapters for SOTA Transformer models
    with minimal changes
  * an open platform to share, explore and consume pre-trained adapter modules
  * bottleneck-style adapters (Houlsby+ 2019), the field initially focused on
  * many other adapter methods
    (Li and Liang, 2021; Mahabadi+ 2021; Hu+ 2022; He+ 2022; Liu+ 2022)
* new tools and libraries for adapter methods
  * OpenDelta (Hu+ 2023a), HuggingFace’s PEFT (Mangrulkar+ 2022) and
    LLM-Adapters (Hu+ 2023b) are recent examples of libraries which
    * unify adapter methods in a single code base + new model architectures
  * hE exclusively focus on the parameter-efficiency aspect of adapters,
    neglecting the modularity side of these methods
* Based on the initial version of AdapterHub, we, therefore, propose Adapters,
  a new library aimed at unifying parameter-efficient and modular transfer
  * Comparison to the first AdapterHub iteration and concurrent libraries
  * We propose a self-contained library that integrates
    10 diverse adapter methods into a unified interface for easy usage and
    flexible configuration;
  * a simple way of leveraging the modularity of adapters by designing
    composition blocks that allow flexibly defining complex adapter setups;
  * we integrate all methods into 20 Transformer-based models spanning NLP,
    vision, and multi-modal applications;
  * we evaluate the performance of our adapter implementations
    against full fine-tuning on a diverse set of tasks

# 2 Background

* adapter: a broad family of transfer learning methods
  * two defining properties: parameter efficiency and modularity
* For a detailed overview of different adapter architectures, Pfeiffer+ (2023)

## 2.1 Parameter Efficiency

* Let the parameters of a language model be composed of two sets of params
  * pre-trained parameters Θ (frozen) and
  * Φ (can either be newly introduced or Φ ⊂ Θ)
* fine-tuning, adapter methods optimize only Φ according to a loss function L
* Different adapter methods insert parameters Φ at different locations
  of a pre-trained large model
* Bottleneck adapters (Rebuffi+ 2017; Houlsby+ 2019)
  * one of the early methods
  * bottleneck feed-forward layers in each layer of a Transformer model
* Subsequent designs have adapted
  * a Transformer model’s self-attentions (Li and Liang, 2021)
  * bias terms (Ben Zaken+ 2022)
  * input prompts (Lester+ 2021) or
  * embeddings (Pfeiffer+ 2021b)
* optimizing the efficiency
  * parameter efficiency (Mahabadi+ 2021; Liu+ 2022) and
  * runtime efficiency (Hu+ 2022; Lei+ 2023)
  * unify multiple components in a single framework (He+ 2022; Mao+ 2022)

## 2.2 Modularity

* modules capture a task or language capacity each
* Pfeiffer+ (2023) propose a taxonomy of modular deep learning methods
  * dimensions: computation function, routing, aggregation, and training
* Routing and aggregation are of special interest here as they coordinate the
  composition of multiple adapter modules, a key functionality
* Exemplary existing work includes using
  * stochastic routing through adapters (Wang+ 2022)
  * adapter parameter averaging (Friedman+ 2021)
  * sequential function aggregation of adapter modules (Pfeiffer+ 2022b)
  * output aggregation
    * weighted (Wang+ 2021) and
    * attention-based (Pfeiffer+ 2021a)
* training: the modularity of adapters allows using pre-trained adapters
  as initialization for further fine-tuning (Poth+ 2021; Vu+ 2022)

# 3 The Adapters Library 2

* builds on many design decisions established in the initial AdapterHub release
  (Pfeiffer+ 2020a)
* extensions with respect to AdapterHub
  * horizontally, eg many more pretrained neural architectures, adapter archits
  * vertically, eg new composition and processing capabilities
* Table 1 gives an overview of the novelties
* The core features adopted from the initial release, facilitating its ease of
  use and wider adoption by researchers and practitioners, include:
  * Tight integration into HuggingFace Transformers (Wolf+ 2020) library;
  * adaptation of pre-existing Transformers fine-tuning scripts
    with minimal changes;
  * single-line saving and loading of adapter modules from a shared commun hub

## 3.1 Transformers Integration 12

* Unlike the initial AdapterHub, Adapters is designed as a standalone package
* as an addon to the Transformers library
* adapter implementations and management methods that can be injected into
  pre-trained Transformer checkpoints without modifying the original model code
* We provide two approaches to this end:

### Attaching to existing models and

### AdapterModel: providing our own, specialized model classes

* automatic conversion
  * from HuggingFace’s model classes
    * typically paired with a single, fixed prediction head
  * to our newly introduced classes featuring flexible prediction heads

## 3.2 Unified Adapter Interface

## 3.3 Adapter Methods

### 3.3.1 Single Methods

* introduce parameters in new feed-forward modules
  eg bottleneck adapters (Houlsby+ 2019),
* introduce prompts at different locations such as Parallel prefix tuning
  (Li and Liang, 2021)
* reparameterize existing modules such as LoRA (Hu+ 2022) or
* re-scale their output representations such as (IA)³ (Liu+ 2022)
  Haokun Liu, Derek Tam, Mohammed Muqeeth, Jay Mohta, Tenghao Huang,
    Mohit Bansal, and Colin A Raffel. 2022
  Few-shot parameter-efficient fine-tuning is
    better and cheaper than in-context learning
  NeurIPS 2022, Nov 28 Dec 9, 2022, virtual and New Orleans, pages 1950–1965
* Details: Appendix A, see also Table 2 again

### 3.3.2 Complex Methods

* combining fine-tuning methods and configurations for joint training is benef
  (He+ 2022; Mao+ 2022)
* Adapters provides the possibility to
  group multiple configuration instances using the ConfigUnion class
  * integration of multiple complex methods proposed in the literature
    (as the two examples outlined below), as well as the
  * construction of other, new complex configurations
    currently not available nor benchmarked in the literature (Zhou+ 2023)
    * Han Zhou, Xingchen Wan, Ivan Vulić, and Anna Korhonen. 2023
      AutoPEFT: Automatic configuration search for parameter-efficient
      fine-tuning
      https://arxiv.org/abs/2301.12132

#### Mix-and-Match Adapters (He+ 2022) was proposed as

* a combination of Prefix-Tuning and parallel bottleneck adapters
* Using ConfigUnion, this method can be defined as:
```python
  config = ConfigUnion(
      PrefixTuningConfig(bottleneck_size=800),
      ParallelConfig(),)
  model.add_adapter("name", config=config)
```

#### UniPELT (Mao+ 2022) combines LoRA, Prefix Tuning, and bottleneck adapters

* additionally introduces a gating mechanism that
  controls the activation of the different adapter modules. Gm ← σ(WGm · x)

## 3.4 Adapter Composition

* the modularity and composability aspects of adapters, increasing research
* hE overlooked by open-source libraries (Mangrulkar+ 2022; Hu+ 2023a)
* Adapters makes adapter compositions central and accessible
  by enabling the definition of complex, composed adapter setups
  * a set of simple composition blocks that each capture a specific method of
    aggregating the functionality of multiple adapters

### Stacking multiple adapters sequentially within a Transformer layer

* used eg in the MAD-X framework for cross-lingual transfer (Pfeiffer+ 2020b),
  where language and task adapters are stacked

### Fuse("d", "e", "f"): activate an AdapterFusion layer (Pfeiffer+ 2021a)

* a non-destructive way to combine the knowledge of multiple pre-trained
  adapters on a new downstream task. Listing 2

### Split an input sequence between multiple adapters

* enables eg splitting multimodal input sequences to modality-specific adapters
  (Pfeiffer+ 2022a)

```python
Split("g", "h", splits=[64, 64])
```

* we split each input sequence between adapters g and h
  * All tokens with indices 0 63 are forwarded through g while
  * the next 64 tokens beginning at index 64 are forwarded through h

### BatchSplit("i", "j", batch_sizes=[2, 4])

* splits inputs along the batch size dimension between several adapters
* ie different adapters receive different sub-batches of the input batch
* eg we split the input batch between adapters i, and j
  * Adapter i receives two sequences and j receives four sequences. The sum of
    all specified sub-batches has to match the batch size of the input

### Parallel("k", "l", "m")

* enable independent parallel training and inference on different adapters,
  where each adapter has its own prediction head
* automatically replicates all inputs at the first occurrence of parallel
  adapter modules, sharing the inputs in all lower layers without parallel
  modules. This mechanism was first used in Rücklé+ (2021)
* eg we forward all inputs via adapters k, l, and m in parallel

### Average("n", "o", weights=[0.3, 0.7])

* Following approaches of ensembling full models at inference,
  recent work has explored methods of averaging pre-trained adapters
  * averaging adapter output representations (Wang+ 2021) as well as
  * averaging adapter parameters
    (Friedman+ 2021; Wang+ 2022; Chronopoulou+ 2023)
* Adapters provides built-in support for both types of inference time averaging
  * Output averaging allows to dynamically aggregate the output representations
    of multiple adapters in a model forward pass via weighted averaging
    * realized via the Average composition block
    * eg two adapters are averaged with the weights 0.3 for n and 0.7 for o
  * Parameter averaging enables creating a new adapter via weighted averaging
    of the parameters of multiple pre-trained adapters
    * typically not done dynamically at runtime, Adapters provides
      average_adapter() as a dedicated method.  Compared to output averaging,
    * advantage: no additional inference time relative to a single adapter

### Nesting eg `Stack("p", Parallel("q", "r"))`

* a set of allowed nestings to restrict the users to setups that are sensible

## 3.5 Supported Models

* At the time of release, Adapters has built-in support for 20 widely adopted
  model architectures included in the Transformers library
  * text encoder models such as BERT (Devlin+ 2019) and DeBERTa (He+ 2021),
  * text decoder models such as GPT-2 (Radford+ 2019),
  * sequenceto-sequence models such as BART (Lewis+ 2020) and T5 (Raffel+ 2020)
  * vision encoder models such as ViT (Dosovitskiy+ 2021), as well as
  * multimodal models such as CLIP (Radford+ 2021)
* adapter-related implementations mostly can be shared across all supported
  models
  * hE correctly integrating them into each model implementation requires
    manual effort
* shared interfaces and step-by-step documentation
  * it is difficult to standardize this process
    due to differences between model architectures,
    nL we provide clear guidelines for integrating new models
    in the form of shared interfaces and step-by-step documentation

## 3.6 AdapterHub Ecosystem

* Adapters is integrated into the extensive existing open-source ecosystem
  introduced by AdapterHub (Pfeiffer+ 2020a)
  * AdapterHub.ml as a platform to share and discover pre-trained adapter
    modules
* Adapters further broadens the possibilities for sharing adapters by
  integrating with HuggingFace’s Model Hub
  * programmatic methods of discovering and publishing pre-trained adapter
    modules, in addition to the previously available methods for downloading
    and saving adapters. Now > 700 pre-trained adapters

# 4 Adapter Evaluation 6

* we conduct evaluations on the single adapter implementations made available
  by Adapters (see §3.3.1). We demonstrate the effectiveness of these methods
* task types:
  * extractive question answering (Rajpurkar+ 2018)
  * multiple choice classification (Huang+ 2019)
  * sequence tagging (Tjong Kim Sang, 2002)
  * sequence to sequence summarization (Narayan+ 2018)
  * sequence classification and sequence regression (Wang+ 2019)
* user experience, we experiment using the two most commonly used base model
  variants on AdapterHub: roberta-base (Liu+ 2019) and bart-base (Lewis+ 2020)

## Setup

* tab A: grid search over
  * common training hyper-parameters, varying
    * learning rates between {10−5, 10−4, 5 · 10−4, 10−4, 10−3} and the
    * number of epochs between {5, 10, 20, 30}
  * adapter-specific hyper-parameters
  * the minimum and maximum trainable parameters added across the
    configurations also in Table A
* The highest attained performance (and the standard deviation of results
  across the grid) for the two chosen base models are outlined in Tabs 3 and 4,

## Results. The obvious takeaway from our evaluations is that

* all adapter implementations offered by our framework are
  competitive with full model fine-tuning, across all task classes
* Approaches that offer more tunable hyper-parameters (for scaling)
  eg Bottleneck adapters, LoRA, and Prefix Tuning predictably have
  the highest topline performance, often surpassing full finetuning
* nL, extremely parameter-frugal [economical] methods
  like (IA)3, which add < 0.005% of the parameters of the base model,
  also perform commendably and only fall short by a small fraction
* the Compacter is the least volatile [romlandó] among the single methods,
  obtaining the lowest standard deviation between runs on the majority of tasks

# 5 Conclusion

* Unlike comparable solutions, Adapters
  equally focuses on the parameter-efficiency and modularity side of adapters
* tightly integrates into the HuggingFace and AdapterHub ecosystems
* performances competitive to full fine-tuning
* research on adapters and LLMs continues to advance rapidly,
  our library will evolve as well
* extensibile with new adapter methods and model architectures,
  both from us and the community
