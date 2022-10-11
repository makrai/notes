Parameter-Efficient Transfer Learning for NLP
Giurgiu Houlsby, Morrone Jastrzebski, Gesmundo Laroussilhe, Gelly Attariyan
36th International Conference on Machine Learning, PMLR 2019

# Abstract

* Fine-tuning large pretrained models is an effective transfer mechanism in NLP
* many downstream tasks, fine-tuning is parameter inefficient: an entire new
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
* Adapter-based tuning differs from feature-based transfer and fine-tuning in
  * Consider a function (neural network) with parameters w: `φ_w (x)`
  * Feature-based transfer composes `φ_w` with a new function, `χ_v` , to yield
    `χ_v (φ_w (x))`. Only the new, taskspecific, parameters v are then trained
  * Fine-tuning involves adjusting the original parameters, w, for each new
    task, limiting compactness
  * adapter tuning, a new function, `ψ_{w,v}(x)` is defined, where
    parameters w are copied over from pre-training
    * The initial parameters v 0 are set such that the new function resembles
      the original: `ψ_{w,v_0}(x) ≈ φ_w(x)` During training, only v are tuned
  * `ψ_{w,v}` typically involves adding new layers to the original network
    * If one chooses |v| << |w|,
    the resulting model requires ∼ |w| params for many tasks. Since w is fixed,
    the model can be extended to new tasks without affecting previous ones
* relates to multi-task and continual learning
  * Multi-task learning also results in compact models
  * hE, multi-task learning requires simultaneous access to all tasks, which
    adapter-based tuning does not require. 
  * Continual learning systems aim to learn from an endless stream of tasks.
  * challenging because networks forget previous tasks after re-training
    (McCloskey & Cohen, 1989; French, 1999)
  * Adapters: tasks do not interact and the shared parameters are frozen.  This
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
