Few-Shot Parameter-Efficient Fine-Tuning is
  Better and Cheaper than In-Context Learning
Haokun Liu, Derek Tam, Mohammed Muqeeth, Jay Mohta, Tenghao Huang,
  Mohit Bansal, Colin Raffel
NeurIPS 2022 arXiv:2205.05638 [cs.LG]

* Few-shot in-context learning (ICL)
  * enables pre-trained language models to perform a previously-unseen task
  * without any gradient-based training by feeding
  * a small number of training examples as part of the input
  * incurs [-val jár] substantial computational, memory, and storage costs
    because it involves processing all of the training examples at every pred
* Parameter-efficient fine-tuning (PEFT) (eg adapter modules, prompt tuning,
  sparse update methods, etc) offers an alternative paradigm where
  * a small set of parameters are trained to perform the new task
* we rigorously compare few-shot ICL and PEFT
  * PEFT offers better accuracy as well as dramatically lower computation costs
  * we introduce a new PEFT method called (IA)3 that
    * scales activations by learned vectors
    * stronger performance while only a relatively tiny amount of new params
  * a simple recipe based on the T0 model called T-Few that can be applied to
    new tasks without task-specific tuning or modifications
  * from the conclu: T-Few also uses two additional loss terms that
    * encourage the model to output lower probabilities for incorrect choices
    * account for the length of different answer choices
  * T-Few uses over 1,000× fewer FLOPs during inference than few-shot ICL with
    GPT-3 and only requires 30 minutes to train on a single NVIDIA A100 GPU
* we validate the effectiveness of T-Few on completely unseen tasks by applying
  * RAFT benchmark, attaining super-human performance for the first time and
    * outperforming the SOTA by 6% absolute
* future: generative tasks like summarization and question answering

# 1 Intro

* in-context learning (ICL) popularized by [3, 4] is , which induces a model to
  perform a downstream task by inputting prompted examples
  * Few-shot prompting converts a small collection of input-target pairs into
    (typically) human-understandable instructions and examples [3, 4], along
    with a single unlabeled example for which a prediction is desired. Notably,
  * requires no gradient-based training and therefore allows a single model to
    immediately perform a wide variety of tasks. Performing ICL therefore
    solely relies on the capabilities that a model learned during pre-training
  * a great deal of recent interest in ICL methods [5–10]
* drawbacks. First,
  * processing all prompted input-target pairs for every pred incurs
  * typically produces inferior performance compared to fine-tuning [4]
  * the exact formatting of the prompt (including the wording [11] and ordering
    of examples [12]) can have significant and unpredictable impact on the
    model’s performance, far beyond inter-run variation of fine-tuning
* ICL can perform well even when provided with incorrect labels, raising
  questions as to how much learning is taking place at all [9]
* parameterefficient fine-tuning (PEFT), where
  * paradigm for enabling a model to perform a new task with minimal updates
  * a pre-trained model is fine-tuned by only updating a small number of added
    or selected parameters
  * match the performance of fine-tuning the full model while only updating or
    adding a small fraction (eg 0.01%) of the full model’s parameters [13,
    14]. Furthermore, certain PEFT methods
  * allow mixed-task batches where different examples in a batch are processed
    differently [14], making both PEFT and ICL viable for multitask models
* PEFTs address some shortcomings of fine-tuning (when compared to ICL), there
  * hE little focus on whether PEFT methods work well with little labeled data
  * we close this gap by proposing a recipe – ie, a model, a PEFT method, and
    a fixed set of hyperparameters – that attains strong performance on novel,
    unseen tasks while only updating a tiny fraction of the model’s parameters
  * we base our approach on the T0 model [1], a variant of T5 [15] fine-tuned
    on a multitask mixture of prompted datasets
* To improve performance on classification and multiple-choice tasks, we add
  unlikelihood [16, 17] and length normalization-based [4] loss terms. In
  * we develop (IA)3 , a PEFT method that multiplies intermediate activations
    by learned vectors. (IA)3 attains stronger performance than full-model
    fine-tuning while updating up to 10,000× fewer parameters
  * benefits of pre-training the (IA)3 parameters before fine-tuning [18, 19]
  * Our overall recipe, which we dub “T-Few”, performs significantly better
    than ICL (even against 16× larger models) and outperforms humans for the
    first time on the real-world few-shot learning benchmark RAFT [2] while
    requiring dramatically less compute and allowing for mixed-task batches
    during inference. To facilitate the use of T-Few on new problems and future

# 2 Background on ICL and PEFT

* this sec: focus on characterizing the computation, memory, and on-disk
  storage costs of making a prediction. Real-world costs
  * depend on implementation and hardware, so we report costs in terms of
    FLOPs for computation and bytes for memory and storage, respectively
* Additional related work is discussed in appendix B

## 2.1

* One way to decrease computational costs is to cache the key and value vectors
  for in-context examples
  * This is possible because decoder- only Transformer language models have a
    causal masking pattern, so
    the model’s activations for the context do not do not depend on the
    unlabeled example
  * In an extreme case, 32-shot ICL with 512 tokens per in-context example
    would result in over 144 gigabytes of cached key and value vectors for the
    GPT-3 model (32 examples × 512 tokens × 96 layers × 12288 dmodel × 32 bits
    each for the key and value vectors). Separately,
* Min+ [21] proposed ensemble ICL, where
  * instead of using the output probability from concatenating the k training
    examples,
  * the output probabilities of the model on each training example (ie 1-shot
    ICL for each of the k examples) are multiplied together. This
    * lowers the non-parameter memory cost by a factor of k/2 but
    * hE increases the computational cost by a factor of 2. In terms of task
    * outperforms the standard concatenative variant

## 2.2 Parameter-efficient fine-tuning

* adapters [22–24] are small trainable feed-forward networks inserted between
  the layers in the fixed pre-trained model. Since then, various
  * sophisticated PEFT methods have been proposed, including methods that
  * choose a sparse subset of parameters to train [25, 26]
  * produce low-rank updates [13]
  * perform optimization in a lower-dimensional subspace [27]
  * add low-rank adapters using hypercomplex multiplication [i, j...] [28]
  * prompt tuning [14] and prefix tuning [29] concatenate learned continuous
    embeddings to the model’s input or activations to induce it for a task;
    this can be seen as a PEFT method [30]. SOTA PEFT methods
  * can match the performance of fine-tuning all of the model’s parameters
    while updating only a tiny fraction (eg 0.01%) of the model’s parameters
* drastically reduces the memory and storage requirements for training & saving
  * certain PEFT methods straightforwardly allow mixed-task batches – for
    * eg prompt-tuning enables a single model to perform many tasks simply by
      concating different prompt embeddings to each example in the batch [14]
  * PEFT methods that re-parameterize the model (eg  [27, 13]) are costly or
    onerous [nehézkes] for mixed-task batches
* different PEFT methods increase the computation and memory required to
  perform inference by different amounts
  * adapters effectively add additional (small) layers to the model, resulting
    in small but non-negligible increases in computational costs and memory. An
  * the cost of fine-tuning itself, which must be performed once and is then
    amortized as the model is used for inference. However, we will show that
  * nL PEFT can be dramatically more computationally efficient when considering
    both fine-tuning and inference while achieving better accuracy than ICL

# 3 The design of T-Few

## 3.2 Unlikelihood Training and Length Normalization

* unlikelihood training
* length normalization
  * The possible target sequences for a given training example can have
    significantly different lengths, especially in multiple-choice tasks
  * Ranking each choice based on probability can “favor” shorter choices
  * (as used in GPT-3 [4]). When using length normalization during evaluation,

# 4 Experiments comparing T-Few to strong ICL baselines

## 4.4 Ablation of some of the ingredients of T-Few on T0

* our T-Few design experiments were on T0-3B
* Detailed results are shown in appendix G
* the gains from adding each ingredient does not always significant increase
  the accuracy on each individual dataset,
* nL each ingredient consistently improves the average performance across
  datasets: Removing
  * pre-training decreases accuracy by 1.6%
  * unlikelihood training and length normalization decreases accuracy by 4.1%
  * both pre-training and our additional loss terms reduces accuracy by 2.5%

# B Related work

* prompt tuning is one of the most parameter-efficient methods for LLMs [29,
  14, 53]
  * Liu+ [54] introduce several tricks to improve prompt tuning,
  * An+ [55] tune prompts along with input embeddings for boost in performance,
  * Chen+ [56] improve prompt embeddings through continued pre-training
  * optimization difficulties when training prompt embeddings,
  * Diao+ [57] recently used black-box optimization to train prompt embeddings
    without requiring gradients. Several works have analyzed prompt tuning
  * from the perspective of interpretability Khashabi+ [58] and its
  * similarity to other PEFT methods He+ [30]
  * applications for NLP including continual learning [59], model robustness
    [60, 61], summarization [62], machine translation [63], co-training [64],
    probing language models [65, 65], inverse prompting [66] and transfer
    learning [67]
  * He+ [68] recently proposed the use of a hypernetwork to predict prompts for
    new tasks (rather than training the prompt parameters with gradient
    descent)
  * outside of the context of language models, Prompt tuning & other PEFT meths
    * vision [22, 69] and vision-and-language models [26]
* few-shot full-model fine-tuning with discrete prompts [70]. Recent work has
  * boost in performance with prompting when training on various numbers of
    examples [71], finding that
  * models perform similarly when trained on good and bad prompts [11], and
  * which prompts work well for few-shot and full-shot setting [72]
  * methods that find performant discrete prompts [73, 74] and
  * training prompts using methods similar to prompt tuning [75]
* improving ICL
  * Chen+ [5], Min+ [6] use ICL for meta-learning to perform few-shot learning
  * Lampinen+ [7] show ICL can improve when explanations are provided and
  * Lazaridou+ [8] use ICL with text retrieved from the web for open-domain QA
  * Min+ [9]: ICL can still perform well when incorrect labels are provided
    for the in-context examples
* LLMs with billions of parameters ~> much recent interest in PEFT methods
  * PEFT methods in the few-shot setting
  * Mahabadi+ [28] found that PEFT can outperform standard fine-tuning in the
    low-resource setting
  * Mahabadi+ [76] compare PEFT to the use of discrete prompts (eg PET [70])
    during few-shot fine-tuning and find that PEFT compares favorably
  * Moosavi+ [77] propose a framework for introducing adapters whose
    architecture and design vary from task to task and demonstrate improved
    results in few-shot settings
  * Gu+ [18] and Vu+ [19] both explored how pre-training prompt tuning
    parameters can improve when limited labeled data is available
  * few-shot learning, Triantafillou+ [78] explore learning universal and
    dataset dependent parameters that can be blended for generalization
  * Requeima+ [79] use conditional neural adaptive processes and
  * Li+ [80] leverage distillation from multiple feature extractors for
    learning new classes or domains in few-shot learning
