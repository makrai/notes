ReFT: Representation Finetuning for Language Models
Zhengxuan Wu, A Arora, Z Wang, A Geiger, D Jurafsky, CD Manning, C Potts
arXiv:2404.03592 [cs.CL]

a generic ReFT training library https://github.com/stanfordnlp/pyreft

# Abstract

* Parameter-efficient finetuning (PEFT) methods seek to
  * adapt large neural models via updates to a small number of weights
  * representations encode rich semantic information
    * interpretability work has shown
    ~> editing representations might be a more powerful alternative
* we: a family of Representation Finetuning (ReFT) methods. ReFT methods
  operate on a frozen base model and learn
  task-specific interventions on hidden representations
* eg Low-rank Linear Subspace ReFT (LoReFT), and we identify
  * an ablation of this method, DiReFT, that trades some performance for
    increased efficiency. Both are drop-in replacements for existing PEFTs
  * 15x--65x more parameter-efficient than LoRA. We showcase LoReFT
  * experiments on eight commonsense reasoning tasks, four arithmetic reasoning
    tasks, instruction-tuning, and GLUE. In all these evaluations, our
  * ReFTs deliver the best balance of efficiency and performance, and
  * almost always outperform SOTA PEFTs

# 1 Intro

* Pretrained language models (LMs) are frequently finetuned to adapt them to
  new domains or tasks [Dai and Le, 2015]. With finetuning,
  * a single base model can be adapted to a variety of tasks given only small
    amounts of in-domain data. However, finetuning large LMs is expensive
* Parameter-efficient finetuning (PEFT) methods propose to address the high
  costs of full finetuning by updating a small number of weights. This
  * reduces memory usage and training time, and PEFTs achieve
    similar performance to full finetuning in many settings [Hu+ 2023]
  * current SOTA PEFTs modify weights rather than representations
* representations encode rich semantic information, suggesting that
  editing representations might be a more powerful alternative
  to weight updates
* we pursue this hypothesis by developing and motivating Representation
  Finetuning (ReFT). Instead of adapting model weights
  * train interventions that manipulate a small fraction of model reprs
    in order to steer model behaviors to solve downstream tasks at inference
  * drop-in replacements for weight-based PEFTs
* recent work in LM interpretability intervenes on representations to
  * find faithful causal mechanisms [Geiger+ 2023b] and to
  * steer model behaviours at inference time [Turner+ 2023, Li+ 2024]
* a generalisation of the representation-editing work of Wu+ [2024a], Turner+
  [2023], and Zou+ [2023], see appendix B for details
* a strong and highly efficient instance of the ReFT family that we call
  Low-rank Linear Subspace ReFT (LoReFT)
  * a parametrisation of ReFT that intervenes on hidden representations in the
    linear subspace spanned by a low-rank projection matrix,
  * building directly on the distributed alignment search (DAS) method 
    (Geiger+ [2023b] and Wu+ [2023])
* We also identify an ablation of this method (DiReFT) that
  trades some performance for increased efficiency
* We evaluate our ReFTs on LLaMA-family models and small-scale LMs
  against existing PEFTs on standard benchmarks from
  * four domains: commonsense reasoning, arithmetic reasoning,
    instruction-following, and natural language understanding. Compared to
  * LoReFT uses 15×–65× times fewer parameters than LoRA while achieving
    SOTA performance on commonsense reasoning, instruction-following, and NLU
    against the strongest PEFTs

# 2 Related work

## Parameter-efficient finetuning methods (PEFTs) train a fraction

* We classify PEFTs into three categories:

### Adapter-based methods train additional modules (eg fully-connected layers)
on top of the frozen pretrained model

* Series adapters insert components between LM attention or MLP layers
  [Houlsby+ 2019, Pfeiffer+ 2020, Wang+ 2022, He+ 2022b, Fu+ 2021], while
* parallel adapters add modules alongside existing components [He+ 2022a]
* the new components that cannot be easily folded into existing weights,
  ~> they impose an additional burden at inference time.1
* Several very recent papers introduce new adapter architectures but do
* LLaMA-Adapter [Zhang+ 2024b], LLaMA-Adapter v2 [Gao+ 2023],
  Aligner [Ziheng+ 2023]
  * hE
    * not benchmark them on the tasks we consider, or
    * they perform hyperparameter-tuning in a different setup than done by us

### LoRA [Hu+ 2022] and DoRA [Liu+ 2024c] use

* low-rank matrices to approximate additive weight updates during training, and
* require no additional overhead during inference since the weight updates can
  be merged into the model. These are the strongest PEFTs currently.2
* Additional methods not studied in this work:
  AutoLoRA [Zhang+ 2024c], ResLoRA [Shi+ 2024], SiRA [Zhu+ 2023]

### Prompt-based methods

* add randomly-initialised soft tokens to the input (usually as a prefix) and
  train their embeddings while keeping the LM weights frozen [Li and Liang,
  2021]. These methods are
* often far from optimal compared to other PEFTs, and come at the cost of
* significant inference overhead
* A variant of this method where hidden-layer activations are also tuned was
  introduced as a baseline in Hu+ [2022], with better performance

## Representation editing

* activation steering and representation engineering shows that
  * adding fixed or task-specific steering vectors [Subramani+ 2022,
    Turner+ 2023, Zou+ 2023, Liu+ 2024b, Vogel, 2024, Li+ 2024] or applying
  * concept erasure [Ravfogel+ 2022, Belrose+ 2023, Avitan+ 2024, Singh+ 2024]
    to the residual stream can
    enable a degree of control over pretrained LM generations
    without the need for resource-intensive finetuning [Wu+ 2024a].  The
* ie representations induced by pretrained LMs carry rich semantic structure

## Interventional interpretability. Much recent work has used

* interventions on model-internal states to test hypotheses about
  how LMs implement various behaviours
* interventions on linear subspaces of representations
  * human-interpretable concepts are encoded linearly
    [Smolensky, 1986, Rumelhart+ 1986, McClelland+ 1986]
    * Paul Smolensky. Neural and conceptual interpretation of Parallel
      Distributed Processing (PDP) models
      In PDP: Explorations in the Microstructure of Cognition, volume 2: 1986
    * David E. Rumelhart, James L. McClelland, and PDP Research Group
      Parallel Distributed Processing: Explorations in the Microstructure of
      Cognition, volume 1: Foundations. MIT Press, 1986
    * James L. McClelland, David E. Rumelhart, and PDP Research Group
      Parallel Distributed Processing: Explorations in the Microstructure of
      Cognition, volume 2: Psychological and Biological Models.  MIT Press 1986
* linguistic features such as gender and number
  [Lasri+ 2022, Wang+ 2023, Hanna+ 2023, Chintam+ 2023, Yamakoshi+ 2023,
  Hao and Linzen, 2023, Chen+ 2023, Amini+ 2023, Guerner+ 2023, Arora+ 2024]
* logical and mathematical reasoning [Wu+ 2023],
* entity attributes [Huang+ 2024], and a number of
* other domains
  [Mikolov+ 2013, Elhage+ 2022, Park+ 2023, Nanda+ 2023, Guerner+ 2023]
  * Nelson Elhage, T Hume, C Olsson, N Schiefer, T Henighan, S Kravec,
      Z Hatfield-Dodds, R Lasenby, D Drain, C Chen, R Grosse, S McCandlish,
      J Kaplan, D Amodei, M Wattenberg, Ch Olah
    Toy models of superposition
    Transformer Circuits Thread, 2022 transformer-circuits.pub/2022/toy_model
  * Kiho Park, Yo Joong Choe, and Victor Veitch
    The linear representation hypothesis and the geometry of large LMs
    arXiv:2311.03658, 2023. URL https://arxiv.org/abs/2311.03658
  * Neel Nanda, Andrew Lee, and Martin Wattenberg
    Emergent linear representations in world models of self-sup seq models
    BlackboxNLP 2023: Analyzing and Interpreting Neural Networks for NLP, 15–30
  * Clément Guerner, Anej Svete, Tianyu Liu, Alexander Warstadt, Ryan Cotterell
    A geometric notion of causal probing
    arXiv:2307.15054, 2023.  URL https://arxiv.org/abs/2307.15054

# 4 Experiments 5

* To evaluate our ReFTs against existing PEFTs, we conduct experiments across
* four diverse NLP benchmarks covering more than 20 datasets (details: App C)
* both masked and autoregressive LMs at different
* scales, ranging from RoBERTa-base [Liu+ 2019] with 125M to LLaMA models
  [Touvron+ 2023a,b] with 13B parameters
* against existing PEFTs such as
  * prefix-tuning [Li and Liang, 2021],
  * adapter-tuning with both Series Adapters and Parallel Adapters,
    * BitFit [Ben Zaken+ 2022]
      Elad Ben Zaken, Yoav Goldberg, and Shauli Ravfogel
      BitFit: Simple parameter-efficient finetuning for transformer-based
      masked language-models
      ACL 2022 (Volume 2: Short Papers), pages 1–9, Dublin, Ireland, May 2022
    * RED [Wu+ 2024a]
      Muling Wu, Wenhao Liu, Xiaohua Wang, Tianlong Li, Changze Lv,
        Zixuan Ling, Jianhao Zhu, Cenyuan Zhang, Xiaoqing Zheng, Xuanjing Huang
      Advancing parameter efficiency in fine-tuning via representation editing
      arXiv:2402.15179, 2024a. URL https://arxiv.org/abs/2402.  15179
    * LoRA [Hu+ 2022]
    * DoRA [Liu+ 2024c]
      Shih-Yang Liu, Chien-Yi Wang, Hongxu Yin, Pavlo Molchanov,
        Yu-Chiang Frank Wang, Kwang-Ting Cheng, and Min-Hung Chen
      DoRA: Weight-decomposed low-rank adaptation
      arXiv:2402.09353, 2024c
* both performance and parameter efficiency
* details
  * In our comparisons, we use hyperparameter-tuned scores from previous works
    when possible
  * We load our base LMs in torch.bfloat16 to save memory. All of our
  * a single GPU: NVIDIA A100 40G/80G or RTX 6000
  * Examples of raw model generations are in appendix I

# 5 Limitations

* we mainly explored the LLaMA-family of models. In future work, we hope to
* future
  * vision–language models such as LLaVA [Liu+ 2024a]. The capabilities
  * large hyperparameter search space ~> automating this search. We provide
  * LM personalisation with ReFT in a few-shot setting in appendix G.2. We hope
  * explore why ReFT works, and we provide some of our early
  * explorations focused on memorisation (appendix F.1, appendix F.2). We are
  * whether learned orthogonal subspaces can be composed together without
    adaptation. Some encouraging initial findings are in appendix G.1

## ReFT, abstraction, and generation. Neural network interpretability research

* related work
  * The ReFT framework is rooted in work on
    causal abstraction [Geiger+ 2023a] for model interpretability, and
  * LoReFT builds directly on the distributed interchange intervention method
    of Geiger+ [2023b] and Wu+ [2023]
  * See also the interchange intervention training (IIT) method   
    (Geiger+ [2022], Wu+ [2022], Huang+ [2023c])
  * using representation-based editing of the Transformer stream
    to steer model behavior [Li+ 2024, Zou+ 2023]
* ReFT advances this line of work by showing one way that such steering can be
  learned, rather than being merely a post hoc analysis step
* ReFT may create new causal pathways
  * The precise ways in which ReFT works 
  * these methods intervene on representations,
  * hE the causal effect of such interventions may only emerge in the model’s
    upstream computations
  * ie the power of ReFT may come from the fact that
    it creates new causal pathways or modifies the strength of some existing 1s
* future: more structured ReFTs to modify complex causal pathways in LMs

## ReFT and model interpretability

* LoReFT shows that training a set of low-rank interventions on selected
  residual streams can induce a base LM to follow instructions (section 4.4)
  * ie a linear subspace distributed across a set of neurons can achieve
    generalised control over a vast number of tasks
  * a serious challenge to work seeing to interpret individual neurons in
    isolation (for related criticisms, see Huang+ 2023b)
* The success of ReFT suggests to us a quite different approach to interperet,
  * assumption: neurons will play different roles in different contexts

## Evaluation practices in PEFT research. In this work,

* we hyperparameter-tune ReFT on development sets that do not overlap with the
  test set
* hE a considerable portion of the literature on PEFTs directly hill-climbs
  performance on test sets. This results in overfitting to specific tasks,
* future work can introduce benchmarks for evaluating PEFTs and ReFTs. These
  * compute~ or time-matched hyperparameter-tuning comparisons, and they should
  * disallow any kind of tuning or model selection based on the test set

# App A `pyreft`: A ReFT-native Python Library

* To lower the cost of switching from PEFTs to ReFT, we release a Python lib
* built on top of pyvene [Wu+ 2024b], a library for performing and
  training activation interventions on arbitrary PyTorch models
* Any pretrained LM available on HuggingFace is supported through our library
* finetuned models can be easily uploaded to HuggingFace. The following example
  shows steps to wrap a Llama-2 7B model with a single intervention on the
  residual stream output of the 19-th layer:

# B Describing existing methods under the ReFT framework

## General comments about expressivity of ReFT. Given that

* previous works have unified PEFTs under a single framework [He+ 2022a], one
* why not express ReFT as a PEFT method? The main reason is that
* PEFT frameworks lack the notion of time or sequence (see the unified PEFT
  view provided in Table 1 on pg. 5 of He+ 2022a). In PEFTs,
  * representation modifications are necessarily applied to every token in the
    sequence, even in recent variants such as AdaLoRA [Zhang+ 2023]. A key
* ReFT  leverages representations over time and
  intervenes only on a small number of them while being effective. More
  * the notation of time is important for future versions of ReFT that
    intervene on representations schematically (eg intervene on the first token
    at some early layers and then intervene on the last token at some later
    layers). The ability to intervene at different layer and position
    combinations schematically is also supported in our code. Existing PEFT
    libraries 7 enforce weight-based updates without supporting flexible
    representation-based interventions

# Datasets

## C.1 Commonsense reasoning

We train and evaluate our models on eight datasets of open-ended QA tasks:
1. The BoolQ [Clark+ 2019] dataset, which is a question-answering dataset for
   yes or no naturally occurring questions. We remove the provided passage in
   the dataset following previous works to ensure a fair comparison
2. The PIQA [Bisk+ 2020] dataset, which tests physical commonsense reasoning
   and requires the model to choose one of the provided actions to take based
   on a hypothesised scenario
3. The SIQA [Sap+ 2019] dataset, which focus on reasoning about people’s
   actions and their corresponding social consequences
4. The HellaSwag [Zellers+ 2019] dataset, which asks the model to choose an
   appropriate ending (or sentence completion) given a context
5. The WinoGrande [Sakaguchi+ 2021] dataset,
  * inspired by Winograd Schema Challenge [Levesque+ 2012], asks the model to
    fill-in-a-blank with binary options given a sentence which requires
    commonsense reasoning
6. The ARC Easy set (ARC-e [Clark+ 2018]), which includes genuine grade-school
   level multiple-choice science questions
7. The ARC Challenge set (ARC-c) [Clark+ 2018]), which is like ARC-e but
   designed in a way that co-occurrence methods are expected to fail to answer
8. The OBQA [Mihaylov+ 2018] dataset, which is a knowledge-intensive and
   open-book QA dataset that requires multi-hop reasoning
* Dataset statistics and simplified training examples from each dataset are
  provided in Hu+ [2023]
* experimental setup from Hu+ [2023] and
* we finetune our models on a combined training dataset (C OMMONSENSE 170K) of
  the tasks mentioned above, and evaluate on their individual test set

## C.2 Arithmetic reasoning

We train and evaluate with seven datasets of math world problems:
1. The AddSub [Hosseini+ 2014] dataset, which involves solving arithmetic word
   problems that include addition and subtraction
2. The AQuA [Ling+ 2017] dataset, which formulates algebraic word problems as
   multiple-choice problems
3. The GSM8K [Cobbe+ 2021] dataset, which consists of grade-school math word
   problems that require multi-step reasoning
4. The MAWPS [Koncel-Kedziorski+ 2016] dataset, which contains math word
   problem with varying complexity
5. The MultiArith [Roy and Roth, 2015] dataset, which contains multi-step
   arithmetic problems
6. The SingleEq [Koncel-Kedziorski+ 2015] dataset, which has grade-school math
   word problems that map to single equations with different length
7. The SVAMP [Patel+ 2021] dataset, which enhances the original Math World
   Problem (MWP) challenge by requiring robust reasoning ability that is
   invariant to structural alternations of the posing problem
* Dataset statistics and simplified training examples from each dataset are
  provided in Hu+ [2023]
* We replicate the experimental setup in Hu+ [2023] and
* we finetune our models on a combined training dataset (M ATH 10K) of four
  tasks mentioned above: GSM8K, MAWPS, MAWPS-single and AQuA. Different from
* some tasks are excluded for testing since the original paper accidentally
  leaks testing examples from these tasks into the training set, affecting
  AddSub, MultiArith and SingleEq. They are included in the MAWPS training

## C.3 Natural language understanding

* We follow Wu+ [2024a] for proper evaluation on the GLUE validation set
* We split the validation set into two subsets, using one subset guarded by a
  random seed for in-training evaluation and the other for testing
  * Specifically, after each training epoch, we evaluate the model on our
  in-training evaluation set and select the best model across all epochs for
  testing. For datasets with a large validation set (ie QQP, MNLI, and
  QNLI), we select 1,000 samples for in-training evaluation. For the remaining
  smaller datasets, we select half of the samples for this purpose. For the
* evaluation metric, we use the Matthews correlation coefficient for CoLA, the
  Pearson correlation coefficient for STS-B, and accuracy for the other
  datasets. For MNLI, we report results only on the matched version

## Suggestions on choosing hyperparameters for ReFT

* Intervening on multiple positions delivers significant gains. We find that
  * intervening only on a single token position (eg just the first one or the
    last one) is always less optimal than intervening on multiple tokens
  * However, intervening on excessive number of tokens might harm performance
    by slowing down convergence
* Intervening on all layers first, and then shrink down. Intervening on all
  layers often provides a good baseline. We recommand users to start with all
  * shrink down the number of intervening layers depending on the desired
    performance–parameter count balance
* Higher rank may not entail better performance. High rank entails higher
  * (likely due to slower convergence)
  * We recommend users to start with a rank that is lower than 32 (eg rank 4)
* Tie intervention weights as much as you can
  * In the paper, we explore tying the intervention weights between prefix and
    suffix token positions. It automatically halves the parameter count, and it
  * We suspect weight sharing across layers may also help
* Hyperparameter tuning with learning rate, warmup ratio, dropout rate and
  weight decay should go after other hyperparameters
  * they have much smaller effect than ReFT-spec ones
