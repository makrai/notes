Parameter-Efficient Transfer Learning for NLP
Neil Houlsby, Andrei Giurgiu, Stanislaw Jastrzebski, Bruna Morrone,
  Quentin De Laroussilhe, Andrea Gesmundo, Mona Attariyan, Sylvain Gelly
36th International Conference on Machine Learning, PMLR 2019

# Abstract

* Fine-tuning large pretrained models is an effective transfer mechanism in NLP
* in many downstream tasks, fine-tuning is parameter inefficient
* we propose transfer with adapter modules
  * compact and extensible model; they add only a few trainable parameters per
    task, and new tasks can be added without revisiting previous ones
  * parameters of the original network remain fixed
* experiments: we transfer the recently proposed BERT Transformer model to
  26 diverse text classification tasks, including the GLUE benchmark
  * near SOTA performance, whilst adding only a few parameters per task. On
    GLUE, we attain within 0.8 of the performance of full fine-tuning,
    adding only 3.6% parameters per task. By contrast,
    fine-tuning trains 100% of the parameters per task

# 1 Introduction

* online setting, where tasks arrive in a stream
  * without training an entire new model for every new task
  * high degree of sharing between tasks is particularly useful for applics
  * eg cloud services, where models need to be trained to solve many tasks
    that arrive from customers in sequence. For this, we propose transfer
* two most common transfer learning techniques in NLP are
  feature-based transfer and fine-tuning
  * we: an alternative transfer method based on adapter modules (Rebuffi+ 2017)
  * Features-based transfer: pre-training real-valued embeddings vectors
    * word (Mikolov+ 13), sentence (Cer+ 19), or paragraph (Le & Mikolov, 14)
    * The embeddings are then fed to custom downstream models
  * Fine-tuning involves copying the weights from a pre-trained network and
    tuning them on the downstream task
    * often enjoys better performance than feature-based transfer
      (Howard & Ruder, 2018)
  * Both feature-based transfer and fine-tuning
    require a new set of weights for each task
    * Fine-tuning is more parameter efficient
      if the lower layers of a network are shared between tasks
* Figure 1 demonstrates this tradeoff
  * x-axis shows the number of parameters trained per task
  * Adapter-based tuning requires training two orders of magnitude fewer params
* Adapters are new modules added between layers of a pre-trained network
* Adapter-based tuning differs from feature-based transfer and fine-tuning
  * Consider a function (neural network) with parameters `w`: `φ_w (x)`
  * Feature-based transfer composes `φ_w` with a new function, `χ_v` , to yield
    `χ_v (φ_w (x))`. Only the new, taskspecific, parameters v are then trained
  * Fine-tuning involves adjusting the original parameters, w, for each new
    task, limiting compactness
  * adapter tuning, a new function, `ψ_{w,v}(x)` is defined, where
    parameters w are copied over from pre-training
    * The initial parameters `v_0` are set such that the new function resembles
      the original: `ψ_{w,v_0}(x) ≈ φ_w(x)` During training, only `v` are tuned
  * `ψ_{w,v}` typically involves adding new layers to the original network
    * If one chooses |v| << |w|,
    the resulting model requires ∼ |w| params for many tasks. Since w is fixed,
    the model can be extended to new tasks without affecting previous ones
* relates to multi-task and continual learning
  * Multi-task learning also results in compact models
  * hE, multi-task learning requires simultaneous access to all tasks
  * Continual learning systems aim to learn from an endless stream of tasks
  * challenging because networks forget previous tasks after re-training
    (McCloskey & Cohen, 1989; French, 1999)
  * Adapters: tasks do not interact and the shared parameters are frozen
    * the model has perfect memory of previous tasks
      using a small number of task-specific parameters
* We demonstrate on a large and diverse set of text classification tasks that
  adapters yield parameter-efficient tuning for NLP
  * key: an effective adapter module and its integration with the base model
  * We propose a simple yet effective, bottleneck architecture
  * On the GLUE benchmark, our strategy almost matches the performance of the
    fully fine-tuned BERT, but uses only 3% task-specific parameters, while
    fine-tuning uses 100% task-specific parameters
  * We observe similar results on a further 17 public text datasets, and
    SQuAD extractive question answering
  * In summary, adapter-based tuning yields a single, extensible, model that
    attains near SOTA performance in text classification

# 2. Adapter tuning for NLP

* our strategy for tuning a multi-task text model has three key properties
  * attains good performance,
  * permits training on tasks sequentially, that is, it does
    * not require simultaneous access to all datasets, and
  * adds only a small number of additional parameters per task. These
  * especially useful in the context of cloud services, where
    * many models need to be trained on a series of downstream tasks, so a
    * high degree of sharing is desirable
* new bottleneck adapter module
  * Rebuffi+ (2017) add a small number of new parameters to a model, which are
    trained on the downstream task
    * more general architectural modifications than fine-tuning
  * injecting new layers into the original network. The weights of the original
* two main features: a small number of parameters, and a near-identity init
  * adapter modules need to be small compared to the layers of the original
    * the total model size grows relatively slowly when more tasks are added. A
  * near-identity initialization is required for stable training of the adapted
    model; we investigate this empirically in Section 3.6. By initializing the
    * original network is unaffected when training starts
    * During training, the adapters may then be activated
      to change the distribution of activations throughout the network
    * The adapter modules may also be ignored if not required; in Section 3.6
    * some adapters have more influence on the network than others. We also
    * if the init deviates too far from the identity func, model may fail

## 2.1. Instantiation for Transformer Networks

# 3 Experiments

## 3.6. Analysis and Discussion

* fig 6: ablation to determine which adapters are influential. For this, we
  * remove some trained adapters and re-evaluate the model (without
    re-training) on the validation set. Figure 6 shows the change in
    performance when removing adapters from all continuous layer spans. The
    experiment is performed on BERT BASE with adapter size 64 on MNLI and CoLA
* removing any single layer’s adapters has only a small impact on performance
  * the heatmaps’ diagonals show the performances of removing adapters from
  * In contrast, when all of the adapters are removed from the network, the
    performance drops substantially: to 37% on MNLI and 69% on CoLA – scores
    attained by predicting the majority class. This indicates that although
* adapters on the lower layers have a smaller impact than the higher-layers
  * Removing the adapters from the layers 0 − 4 on MNLI barely affects perform
    * focusing on the upper layers is a popular strategy in finetuning
      (Howard & Ruder, 2018)
    * intuition: lower-level features that are shared among tasks
    * relates to that for some tasks, fine-tuning only the top layers
      outperforms full fine-tuning, see Table 2
* robustness of the adapter modules to (the number of neurons and) init scale
  * In our main experiments the weights in the adapter module were drawn from a
    zero-mean Gaussian with standard deviation 10 −2 , truncated to two
    standard deviations. To analyze the impact of the initialization scale on
  * we test standard deviations in the interval [10 −7 , 1].  Figure 6
  * on both datasets, the performance of adapters is robust for std < 10 −2 
  * hE when the init is too large, perform degrades, more substantially on CoLA
* robustness of adapters to the number of neurons, we
  * re-examine the experimental data from Section 3.2.  We find that the
    quality of the model across adapter sizes is stable, and a
  * fixed adapter size across all the tasks could be used with small detriment
  * For each adapter size we calculate the mean validation accuracy across the
    eight classification tasks by selecting the optimal learning rate and
    number of epochs 5
  * For adapter sizes 8, 64, and 256, the mean validation accuracies are 86.2%,
    85.8% and 85.7%, respectively
  * message is further corroborated by Figures 4 and 5, which show a
    stable performance across a few orders of magnitude
* extensions to the adapter’s architecture that did not yield a signific boost
  * We experimented with
    * adding a batch/layer normalization to the adapter,
    * increasing the number of layers per adapter,
    * different activation functions, such as tanh,
    * inserting adapters only inside the attention layer,
    * adding adapters in parallel to the main layers, and possibly with a
      multiplicative interaction
  * In all cases: resulting performance similar to the bottleneck in Sec 2.1

# 4. Related Work

## Pre-trained text representations are widely used to improve NLP

* Embeddings of longer texts, sentences and paragraphs, have also been developd
  (Le & Mikolov, 2014; Kiros+, 2015; Conneau+, 2017; Cer+, 2019)
* To encode context in these representations, features are extracted from
  internal representations of sequence models, such as
  * MT systems (McCann+, 2017), and
  * BiLSTM language models, as used in ELMo (Peters+, 2018). As with adapters,
    * ELMo exploits the layers other than the top layer of a pre-trained
    * hE only _reads_ from the inner layers. In contrast, adapters write to the

## Fine-tuning an entire pre-trained model has become popular in NLP

* (Dai & Le, 2015; Howard & Ruder, 2018; Radford+, 2018)
* the upstream model is usually a neural language model (Bengio+, 2003)
* question answering (Rajpurkar+, 2016) and text classification (Wang+, 2018)
* finetuning a Transformer network (Vaswani+, 2017) with a MLM Model loss
* not require task-specific model design, unlike representation-based transfer
* hE require a new set of network weights for every new task

## Multi-task Learning (MTL) involves training on tasks simult

* Caruana (1997) share weights in lower layers, specialized higher layers
* POS, chunking, NER, etc (Collobert & Weston, 2008)
* multilingual models (Huang+, 2013)
* semantic parsing (Peng+, 2017)
* machine translation (Johnson+, 2017)
* question answering (Choi+, 2017). MTL yields a single model to solve all
* unlike our adapters, MTL requires simultaneous access to the tasks

## Continual (=lifelong) Learning

* an alternative to simultaneous training, continual, or lifelong, learning
* learn from a sequence of tasks (Thrun, 1998)
* hE catastrophic forgetting (McCloskey & Cohen, 1989; French, 1999)
  * when re-trained, deep networks tend to forget previous tasks; a
* Techniques to mitigate forgetting (Kirkpatrick+, 2017; Zenke+, 2017),
  * memory is imperfect
  * Progressive Networks: a new network “column” for each task (Rusu+, 2016)
    * the number of parameters grows linearly with the number of tasks, since

## Transfer Learning in Vision

* Fine-tuning models pretrained on ImageNet (Deng+, 2009) is ubiquitous when
  building image recognition models (Yosinski+, 2014; Huh+, 2016). This
* SOTA performance on many vision tasks, including
  * classification (Kornblith+, 2018)
  * fine-grained classifcation (Hermans+, 2017)
  * segmentation (Long+, 2015)
  * detection (Girshick+, 2014).  In vision,
* convolutional adapter modules (Rebuffi+ 2017; 2018; Rosenfeld & Tsotsos 2018)
  * incremental learning in multiple domains by adding small convolutional
    layers to a ResNet (He+, 2016) or VGG net (Simonyan & Zisserman, 2014)
  * Adapter size is limited using 1 × 1 convolutions,
    whilst the original networks typically use 3 × 3. This yields
    * 11% increase in overall model size per task. Since
    * the kernel size cannot be further reduced
    * other weight compression techniques must be used to attain further saving
    * bottleneck adapters can be much smaller, and still perform well
* Concurrent work explores similar ideas for BERT (Stickland & Murray, 2019)
  * Projected Attention Layers (PALs),
    small layers with a similar role to our adapters
  * main differences are
    * different architecture, and
    * they perform multitask training, jointly fine-tuning BERT on all GLUE
  * Sina Semnani (2019): an emprical comparison
    of our bottleneck Adpaters and PALs on SQuAD v2.0 (Rajpurkar+, 2018)
