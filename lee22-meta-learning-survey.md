Meta Learning for Natural Language Processing: A Survey
Hung-yi Lee, Shang-Wen Li, Thang Vu
NAACL 2022

# Abstract

* Deep learning has been the mainstream technique in the NLP area
  * hE requires many labeled data and is less generalizable across domains
  * limits application to different domains, languages, countries, or styles
* Meta-learning is an arising field in machine learning
  * learning better learning algorithms
  * improve algorithms in eg data efficiency and generalizability
  * efficacy in many NLP tasks, but no systematic survey
* org
  * general concepts of meta-learning and the common approaches
  * task construction settings
  * applications of meta-learning for various NLP problems
  * development of meta-learning in the NLP community

# 1 Intro

* Meta-learning, or Learning to Learn, aims to learn better learning algorithms
  * parameter initialization (Finn+ 2017),
  * optimization strategy (Andrychowicz+ 2016; Ravi and Larochelle, 2017),
  * network architecture (Zoph and Le, 2017; Zoph+ 2018; Pham+ 2018a),
  * distance metrics (Vinyals+ 2016; Gao+ 2019a; Sung+ 2018), and
  * beyond (Mishra+ 2018)
    * Nikhil Mishra, Mostafa Rohaninejad, Xi Chen, and Pieter Abbeel
      Simple neural attentive meta-learner
      ICLR 2018
* image
  * faster fine-tuning, better performance, more generalizable models, and
    outstanding results for few-shot image classification (Triantafillou+ 2020)
  * alleviate [enyhíti] the dependency of learning algorithms on labels and
    make model development more scalable
  * previous survey papers on meta-learning (Hospedales+ 2021; Huisman+ 2021)
* NLP
  * benefits in performance and data efficiency via applying meta-learning
  * Tables 2 and 3 in the appendix for NLP applications improved by metalearn
  * Tutorial (Lee+ 2021b) and Workshop (Lee+ 2021a) are organized at ACL 2021
  * survey paper on meta-learning in NLP (Yin, 2020)
    * describes meta-learning methods in general
    * we focuse on the idea of making meta-learning successful in NLP and
      * a broader review of publications on NLP meta-learning

# 2 introduction of meta-learning backgrounds, general concepts, and algorithms

* general concepts/techniques of meta-learning
  * Due to space constraints, we will not give too many detailed descriptions
  * previous overview paper (Yin, 2020; Hospedales+ 2021; Huisman+ 2021)
* In meta-learning, what we want to learn is a learning algorithm
  * can also be considered as a function, denoted as F φ (.)
  * input of F φ (.) is the training data, while the
  * output of the function F φ (.) is the learned model parameters, or θ ∗
  * parameterized by meta-parameters φ, which is what we want to learn
    * eg F φ (.) represents gradient descent for deep network,
    * φ can be initial parameters, learning rate, network architecture, etc
* meta-learning approaches focus on learning different components
  * model-agnostic meta-learning (MAML) focuses on learning initial parameters
    (Finn+ 2017), which will be further descried in Section 4.1
  * Learning to Compare methods like Prototypical Network (Snell+ 2017)
    * learn the latent representation of the inputs and their distance metrics
      for comparison, Section 4.2
  * Network architecture search (NAS) in Section 4.3
    (Zoph and Le, 2017; Zoph+ 2018; Pham+ 2018a)
* meta-training tasks T train are required, where T n is a task, n in 1..N
  * Usually, all the tasks belong to the same NLP problem
    * eg QA but from different corpora, but
    * it is also possible that the tasks belong to various problems
  * Each task T n includes a support set S n and a query set Q n
    * Both S n and Q n are paired examples as D in (1)
    * support set plays the role of training data in typical ML, while the
      query set can be understood as the testing data in typical ML
    * loss function L(φ; T train), which represents
      how “bad” a learning algorihtm paramereized by φ is on T train
    * L(φ; T train) is the [summed] performance over all the tasks in T train
    * The definition of the function l(.) above is the same as in (2)
    * within-task training
      * For each task T n in T train, we use a support set S n to learn a
        model by the learning algorihtm F φ
      * learned model is denoted as θ n, where θ n = F φ (S n). This
      * equivalent to typical ML training
    * within-task testing
      * Then θ n is evaluated on Q n to obtain l(θ n ; Q n) in (5)
    * One execution of within-task training and followed by one execution of
      within-task testing is called an episode
* φ ∗ = arg min L(φ; T train)
  * If φ is differentiable with respect to L(φ; T train), then we can use
    gradient descent to learn metaparameters
  * if not, we can use reinforcement learning algorithm or evolutionary algo
  * called cross-task training in this paper, which
    usually involves running many episodes on meta-training tasks
  * cross-task testing on T test ie
    running an episode on each meta-testing task to evaluate algorithms
    parameterized by meta-parameters φ ∗
  * If the learning processing of φ also involve some hyperperparameter selec,
    then meta-validation tasks are needed, but in this paper, we ignore this

# 3 Common settings for constructing meta-learning tasks 3

## 3.1 Cross-domain Transfer

* A typical setting for constructing the tasks is based on domains
  (Qian and Yu, 2019; Yan+ 2020; Li+ 2020a; Park+ 2021; Chen+ 2020b;
  Huang+ 2020a; Dai+ 2020; Wang+ 2021b; Dingliwal+ 2021; Qian+ 2021)
  * all the tasks, no matter belonging to T train or T test, are the same NLP
    problems
  * In each task T n,
    * the support set S n and the query set Q n are from the same domain, while
    different tasks contain the examples from different domains. In each task,
    * the model is
      trained on the support set of a domain (usually small size) and
      evaluated on the query set in the same domain, which
      can be considered as domain adaptation
    * From the meta-training tasks T train, cross-task training finds
      meta-parameters φ ∗ parameterizing the learning algorithm F φ ∗
    * With a sufficient number of tasks in T train,
      cross-task training should find a suitable φ ∗ for a wide range of doms,
      and thus also works well on the tasks in T test 
    * meta-learning can be considered as
      * one way to improve domain adaptation
      * If the support set in each task includes only a few examples
      => meta-learning is considered one way to achieve few-shot learning
* The cross-domain setting is widespread. We only provide a few examples
  * In MT, each meta-training task = a domain (eg news, laws, etc), while
    each meta-testing task also contains documents from a domain
    not covered by the meta-training tasks (eg medical records, Li+ 2020a)
  * eg2, both meta-training and meta-testing tasks are Dialgoue State Tracking
    * meta-training tasks include hotel booking, flight ticket booking, etc,
      while the testing task is taxi booking
      (Huang+ 2020a; Wang+ 2021b; Dingliwal+ 2021)
  * in speech processing tasks, the domains can refer to
    * accents (Winata+ 2020b; Huang+ 2021) or
    * speakers (Klejch+ 2019; Wu+ 2021b; Huang+ 2022)

## 3.2 Cross-lingual Transfer

* If we consider different languages as different domains, then the
  cross-lingual transfer can be regarded as a special case of cross-domain tran
  * cross-task training finds meta-parameters φ ∗ from the languages in T train
  * cross-task testing evaluate the meta-parameters φ ∗ on new langauges
* applied to
  * NLI and QA in X-MAML (Nooralahzadeh+ 2020)
  * documentation classification (van der Heijden+ 2021)
  * dependency parsing (Langedijk+ 2021)
  * MT (Gu+ 2018)
  * ASR (Hsu+ 2020; Winata+ 2020a; Chen+ 2020d; Xiao+ 2021)
* For the meta-learning methods aiming at learning the initial parameters like
  MAML (will be introduced in Section 4.1),
  the network architecture have to be the same in all tasks
  * hE vocabularies in different tasks are different
  * unified word embeddings across languages are required
  * Gu+ (2018): universal lexical representation to overcome the mismatch
    * Jiatao Gu, Yong Wang, Yun Chen, Victor O. K. Li, and Kyunghyun Cho. 2018
      Meta-learning for low-resource neural machine translation EMNLP 2018
  * multilingual pretrained models as encoders, such as M-BERT (Devlin+ 2019)
    or XLM-R (Conneau+ 2020), all languages can share the same network archit
    (Nooralahzadeh+ 2020; van der Heijden+ 2021)
    * Farhad Nooralahzadeh, Giannis Bekoulis, Johannes Bjerva, I Augenstein
      Zero-shot cross-lingual transfer with meta learning EMNLP 2020
    * N van der Heijden, Helen Yannakoudakis, Pushkar Mishra, Ekaterina Shutova
      Multiling and cross-ling document classif: A meta-learning approach EACL
      2021

## 3.3 Cross-problem Training

* meta-training and meta-testing tasks can come from different problems
  * eg the meta-training tasks include MT and NLI, while the
    meta-testing tasks include QA and DST
  * not usual setting, but there are still some examples
  * Bansal+ (2020a)
    * the meta-training tasks are the GLUE benchmark tasks (Wang+ 2018), while
      the meta-testing tasks: entity typing, NLI, sentiment & other classif
    * All the meta-training and meta-testing tasks can be formulated as
      classification but with different classes
  * In Indurthi+ (2020)
    * the meta-training tasks are MT and ASR, while
    * the meta-testing task is speech translation (ST)
  * CrossFit is a benchmark corpus for this cross-problem setting (Ye+ 2021)
* hE different NLP problems may need very different meta-parameters
  => challenging to find unified meta-parameters on the meta-training tasks
  that can generalize to meta-testing tasks
  * the meta-learning algorithms learning initial parameters such as MAML
    require all the tasks to have a unified network architecture
  * LEOPARD (Bansal+ 2020a) and ProtoMAML (van der Heijden+ 2021)
    * MAML variants that can be used in classif tasks with diff class numbers
    * Both use the data of a class to generate the class-specific head, so
      only the parameters of the head parameter generation model are required
    * The head parameter generation model is shared across all classes, so the
      network architecture becomes class-number agnostic
  * universal models for a wide range of NLP problems have been emgered
    (Raffel+ 2019; Chen+ 2021; Ao+ 2021)
    * Yi-Chen Chen, Po-Han Chi, Shu wen Yang, Kai-Wei Chang, Jheng hao Lin,
      Sung-Feng Huang, Da-Rong Liu, Chi-Liang Liu, Cheng-Kuang Lee, Hung yi Lee
      A universal modularized model for speech processing tasks
      2021 Speech-Net
    * Junyi Ao, Rui Wang, Long Zhou, Shujie Liu, Shuo Ren, Yu Wu, Tom Ko, Qing
      Li, Yu Zhang, Zhihua Wei, Yao Qian, Jinyu Li, and Furu Wei
      2021
      SpeechT5: Unified modal encoder-decoder pre-training for spoken lang proc
    * We believe the development of the universal models will intrigue the
      cross-problem setting in meta-learning

## 3.4 Domain Generalization

* Traditional supervised learning: training & testing data have the same distri
* Domain shift: training data & testing data have very different stats
* Domain adaptation (Sec 3.1) uses little domain-spec data to adapt the model
* domain generalization techniques attempt to alleviate the domain mismatch
  by producing models that generalize well to novel testing domains
* Meta-learning can also be used to realize domain generalization by learning
  an algorithm that can train from one domain but evaluate on the other
  * To simulate the domain generalization scenario,
    a set of meta-training tasks are constructed by
    sampling data from different domains as the support and query sets
  * With the meta-training tasks above, cross-task training will find the
    meta-parameters φ ∗ that work well on the scenario where the training
    (support) and testing (query) examples are from different domains
* Fig. 1 shows how to construct tasks for domain generalization and
  compares the construction with the cross-domain transfer setting
* eg improve the
  * domain generalization for semantic parsing (Wang+ 2021a) and
  * language generalization
    for sentiment classification and relevance classification (Li+ 2020c)
  * The domain-specific data are usually labelled, but
    unlabelled domain-specific data can be leveraged as well, out of scope here
    (Kouw and Loog, 2021)

## 3.5 Task Augmentation

* NLP-specific methods have been proposed in both ,,,

## Inventing more tasks (without human labeling efforts)

* general task augmentation approahces proposed for general meta-learning
  (Yao+ 2021a; Ni+ 2021; Rajendran+ 2020; Yao+ 2021b)
* NLP-specific approaches
  * Bansal+ (2020b) generates a large number of cloze tasks, which
    * can be considered as multi-class classification tasks but
      obtained without labeling effort, to augment the meta-training tasks
    * Inspired from the self-supervised learning,
  * Bansal+ (2021) further
    explores the influence of unsupervised task distribution and
    creates task distributions that are inductive to better meta-training effic
    * The self-supervised generated tasks
      * improve the performance on a wide range of different meta-testing tasks
        which are classification problems (Bansal+ 2020b)
      * performs comparably with supervised meta-learning methods on
        FewRel 2.0 benchmark (Gao+ 2019b) on 5-shot evaluation (Bansal+ 2021)

## Splitting training data from one dataset into partitions

* Huang+ (2018); Guo+ (2019); Wu+ (2019); Jiang+ (2019);
  Chien and Lieow (2019); Li+ (2020b); MacLaughlin+ (2020); Wang+ (2020a);
  Pasunuru and Bansal (2020); Xu+ (2021a); Murty+ (2021)
* First, the training set of the corpus is split into
  support partition, D s, and query partition, D q
  * Two subsets of examples are sampled from D s and D q as the support set, S,
    and query set, Q, respectively
    * In each episode, model parameters θ are updated with S, and then the
      losses are computed with the updated model and Q
    * The meta-parameters φ are then updated based on the losses, as the
      meta-learning framework introduced in Section 2
    * The test set of the corpus is used to build T test for evaluation
    * As compared to constructing T train from multiple relevant corpora, which
      are often not available, building T train with one corpus
      makes meta-learning methodology more applicable
  * more comparable with existing NLP studies
  * hE less generalizable to various attributes such as domains and languages
* How to sample the data points to form a task is the key in such category
  * NAS research (Sec 4.3): the support and query sets are randomly sampled
  * Learning to Compare (Sec 4.2) splits based on some predefined criteria
  * NLP-specific ways to construct the tasks
    * Huang+ (2018): a relevance function to sample the support set S
      based on its relevance to the query set Q
    * Guo+ (2019), a retrieval model to retrieve the support set S
    * DReCa (Murty+ 2021): clustering on BERT representations to create tasks

# 4 Adaptation of general meta-learning approaches to NLP problems 5

* This section shows the most popular meta-learning methods for NLP
* complete survey: Table 2 and 3 in the appendix

## 4.1 learning to initialize

* MAML (Finn+ 2017)
* its first-order approximations, FOMAML (Finn+ 2017) & Reptile (Nichol+ 2018)
* appendx tab 4 summs papers using MAML-based approaches to NLP applics (2019+)
  1. Method: There are many variants in the learn-to-init family
    * The most representative one is MAML (Finn+ 2017)
      * large computation intensity, so the
      * first-order approximations are widely used like
        * FOMAML (Finn+ 2017) and Reptile (Nichol+ 2018) 
      * DG-MAML (Li+ 2018) is for domain generalization
      * Typical learn-to-init assumes that all the tasks use the same archit
        * hE LEOPARD (Bansal+ 2020a) and Proto(FO)MAML (Triantafillou+ 2020)
          are proposed to overcome the limitation.
          Eleni Triantafillou, T Zhu, V Dumoulin, P Lamblin, U Evci, K Xu,
            R Goroshin, C Gelada, K Swersky, P Manzagol, H Larochelle
          Meta-Dataset: A dataset of datasets for learning to learn from few ex
          International Conference on Learning Representations 2020
  2. How to Initialize the Initialization: Learn-to-init approaches aim at
    * using self-supervised pre-training as initialization is common
    * The table specifies the pre-trained models used to initialize the l-t-ini
    * ’-’ means the initial parameters are learned from random initialization
      or cannot tell based on the descriptions in the papers.

### Learning to Initialize vs Self-supervised Learning

* self-supervised approaches like BERT also have the same target
* survey in Table 4 in the appendix,
* are they complementary? (yes)
  * it is common to use the self-supervised models to “initialize” the
    meta-parameters φ in learn-to-init approaches
    * To find the optimal φ ∗ in (5), gradient descent is used as well, and
      thus the “initial parameters for initial parameters”, or φ 0 is required
    * A self-supervised model usually serves the role of φ 0 , and the
      learn-to-init approaches further update φ 0 to find φ ∗
  * yes, self-supervised objectives are different from the objective of the
    target NLP problem, so there is a “learning gap”
  * hE learn-to-init approaches
    learn to achieve good perf on the query sets of the meta-training tasks,
    so it directly optimizes the objective of the NLP problems
  * The benefit of self-supervised learning is that it does
    not require labeled data, while
    labeling is still needed to prepare the examples in meta-training tasks

### Learning to Initialize vs Multi-task Learning

* Multi-task learning usually serves as the baseline of learn-to-init
* In multi-task learning, all the labelled data from the meta-training tasks
  is put together to train a model
  * ie, all the support sets S n and query sets Q n in the meta-training tasks
    T train are put together as a training set D, and
    the loss (3) is optimized to find a parameter θ ∗
  * Then θ ∗ is used as initial parameters for the meta-testing tasks
* Both multi-task learning and meta-learning leverage the examples in the
  meta-training tasks, but with different training criteria
  * Learn-to-init finds the initial parameters suitable to be updated by
    updating the model on the support sets and
    then evaluating it on the query sets
  * multi-task learning does not consider that
    the initial parameters would be further updated at all during training
  * performance: learn-to-init is usually better (Dou+ 2019; Chen+ 2020b)
  * training speed: meta-learning, which optimizes (5), is more comput intens

### Three-stage Initialization

* learn-to-init, multi-task, self-supervised learning all have their pros/cons,
  => they can be integrated to draw on the strong points of each other
* “three-stage initialization”
  1. initialize a model by self-supervised learning, which leverages unlabeled
    * objective is usually not directly related to the target NLP problem
  1. multi-task learning is used to fine-tune the self-supervised model
    * objective of multi-task learning is the target NLP problem but does
      not consider the update procedure in gradient descent
  1. learn-to-init, which finds the initial parameters suitable for update, is
     used to fine-tune the multi-task model
* Learn-to-init is chosen to be the last stage because
  * its training objective is closest to the target of looking for good initial
    parameters, but
  * it is the most computationally intensive method, and thus
    it is only used to change the model a little bit
* tested in several works
  (Nooralahzadeh+ 2020; Wu+ 2021b; van der Heijden+ 2021; Langedijk+ 2021)
* not always improve the performance (Wu+ 2021b; van der Heijden+ 2021)

### Challenges

* Learn-to-init is an essential paradigm for few-shot learning
* outstanding results in the few-shot learning benchmarks of image classif
  (Triantafillou+ 2020)
* hE no SOTA results on NLP few-shot learning benchmarks
  (Ye+ 2021; Chen+ 2022; Bragg+ 2021)
  * eg on the cross-task few-shot learning benchmark, CrossFit,
    simple multi-task learning outperforms existing learn-to-init in many cases
    (Ye+ 2021)
  * One possible reason is meta-learning methods are susceptible to
    hyper-parameters and even random seeds (Antoniou+ 2019)
  * research about developing more stable learn-to-init methods may lead to
    more practical real-world applications for the approaches
* There is a study about stabilizing the cross-task training of learn-to-init
  by reducing the variance of gradients for NLP (Wang+ 2021b)
  Lingxiao Wang, Kevin Huang, Tengyu Ma, Quanquan Gu, and Jing Huang.
  NAACL 2021b
  Variance-reduced first-order metalearning for NLP tasks

## 4.2 learning to compare

* widely applied to NLP tasks
  * text classification (Yu+ 18; Tan+ 19; Geng+ 19; Sun+ 19b; Geng+ 20)
  * sequence labeling (Hou+ 2020; Oguz and Vu, 2021)
  * semantic relation classification
    (Ye and Ling, 2019; Chen+ 2019a; Gao+ 2019a; Ren+ 2020)
  * knowledege completion (Xiong+ 2018; Wang+ 2019b; Zhang+ 2020; Sheng+ 2020)
  * speech recognition (Lux and Vu, 2021) tasks
* Most of the proposed methods
  * based on Matching Network (Vinyals+ 2016),
    Prototypical Network (Snell+ 2017) and Relation Network (Sung+ 2018)
  * extend these architectures in two aspects:
    * how to embed text input in a vector space with/out context
    * how to compute the distance in this space
* deep roots in the computation linguistics research
  (Schütze, 1992; Manning and Schutze, 1999)
* one of the most important methods among other meta-learning methods in the
  context of NLP despite their simplicity
* mainly applied to classification tasks

## 4.3 neural architecture search

* applied to NLP including
  * language modeling (WikiText103 (Merity+ 2017), PTB (Mikolov+ 2010)),
  * NER (CoNLL-2003 (Sang and De Meulder, 2003)),
  * text classification (GLUE (Wang+ 2019a)), and
  * MT (WMT’14 (Bojar+ 2014))
* these techniques are often trained/evaluated with a single, matched
  dataset, which is different from other meta-learning approaches
  * As discussed in Section 3.5
* NAS methods that focus on learning the topology
  in an individual recurrent or convolutional cell have to be
  redesigned in order to make the search space suitable for NLP
* NLP: contextual information often plays an important role
  * Jiang+ (2019) pioneers the application of NAS to NLP tasks beyond LM (NER)
    * improves differentiable NAS by redesigning its search space for NLP
  * Li+ (2020b) extends the search space of NAS to cover more RNN architectures
    and allow the exploring of intra~ and inter-token connection
    to increase the expressibility of searched networks
  * pretrained language models (PLM) in NLP area
    * Wang+ (2020a) introduces Hardware-Aware Transformers (HAT)
      * search Transformer architecture optimized for inference speed and
        memory footprint in different hardware platforms
    * NAS-BERT (Xu+ 2021b) and AdaBERT (Chen+ 2020a) explores
      task-agnostic and task-dependent network compression techs with NAS resp
    * EfficientBERT (Dong+ 2021) applies NAS to search for more efficient
      architecture of feed-forward network that is suitable for edge devices
* Table 5 in the appendix
  summarizes the performance of several SOTA NAS approaches on GLUE (Wang+ 9)
  * These approaches are applied to BERT to discover archits with
    smaller sizes, faster inference speed, and better model accuracy
  * For comparison, performance from original and manually compressed BERT
    is also presented
  * BERT architecture improved by NAS
    * performance competitive to BERT (82.3 from EfficientBERT vs 82.5 BERT)
    * 6.9x smaller and 4.4x faster
    * outperforms manually designed, parameterand inference-efficient model
      (MobileBERT TINY) at similar size and speed
    * we expect there will be increasing investment in innovating NAS techs to
      make PLM networks more compact and accelerate inference
      As even larger PLMs while the need of deployment on edge devices

### Challenges

* prohibitive requirement in computation resources for architecture search
* Approaches proposed to improve the search efficiency
  * Efficient Neural Architecture Search (ENAS, Pham+ (2018b)) and
  * Flexible and Expressive NAS (FENAS, Pasunuru and Bansal (2020)) are
* PLMs usually have bulky sizes and slow training speed
  => search efficiency is even more critical when applying NAS to PLM
* Weight-sharing techniques are often applied to accelerate searching
  (Wang+ 2020a; Dong+ 2021; Xu+ 2021b)

## 4.4 Meta-learning for Data Selection

* diversity of human languages
  * Multi-linguality, multi-task, and multi-label
  * much impact o[f] NLP problems due to the diversity of human languages
  * To learn models with balanced performance over attributes
  * weight the training examples for data selection
    to learn models with balanced performance over the attributes
  * assumption: meta-learning techniques derive more generalizable weighting
    than manually tuned hyperparameters
* Wu+ (2019) add
  another gradient update step wrapping the conventional classifier update
  for training meta-parameters that controls the weight when aggregating losses
  from different labels to update classifier’s parameters
  * In addition to gradient update,
    meta-learned weights are also applied directly to training examples for
    data selection to address the issue of noisy labeling
* Shu+ (2019): a technique to jointly learn a classifier and a weighting func,
  * a conventional gradient update for the classifier and
    a meta-learning update for the weighting is performed alternatively
  * The function weights examples to mitigate model overfitting towards biased
    training data caused by corrupted labels or class imbalance
* Zheng+ (2021) apply a similar framework but
  extend the weighting with a label correction model
* Both techniques show improvement over SOTA
  in text classification with biased training data
* progress in the research of pre-training and transfer learning
  * leveraging datasets in multiple languages, domains, or tasks to
    jointly pre-train models to learn transferable knowledge
  * A meta-learned data selector can also help in this scenario
    by choosing examples that benefit model training and transferability
* Wang+ (2020b) investigate the common challenge of
  imbalanced training examples across languages in multilingual MT
  * conventionally addressed by tuning hyperparameters manually
    to up-sample languages with less resources
  * Differentiable Data Selection (DDS) to parameterize the sampling strategies
    * trained with episodes and REINFORCE algorithm to
      optimize parameters of sampler and MT models in an alternating way
      for the MT models to converge with better performance across languages
* Pham+ (2021) formulate data sampling for multilingual MT as a problem of
  back-translation to
  generate examples of parallel utterances from unlabeled corpora in targ lang
  * The back-translation is jointly trained with MT models
    to improve translation result through
    better distribution of training examples and data augmentation
* Tarunesh+ (2021): knowledge transferring across tasks and languages
  * combine Reptile and DDS to metalearn samplers with
    six different languages (en, hi, es, de, fr, and zh) and
    five tasks (QA, NLI, paraphrase identification, POS tagging, and NER)
  * competitive performance on XTREME multilingual benchmark dataset (Hu+ 2020)

# 5 Meta-learning beyond Accuracy 8

## 5.1 Learn to Knowledge Distillation

* Knowledge distillation method was proposed in (Hinton+ 2015)
* transfer knowledge from/to a so-called
  * teacher model, eg a vast neural network trained with a lot of training data
  * a more compact student, eg a neural network with much less trainable params
* main weaknesses:
  * the number of teacher models is fixed to one that
    could limit the power of the transferring process;
  * the teacher model is not optimized for the transferring process and
  * the teacher model is not aware of the student model
* Meta-learning methods can be applied to partially fix these issues
  * idea: increase the number of teacher and student models and
    * each pair of a teacher model and a student model as a task in the meta-l
  * ie meta teacher model that works better than a single teacher (Pan+ 2020),
    * optimize the transferring process, and
      force the teacher model to be aware of the student model (Zhou+ 2022)

## 5.2 Learn to Life-long learning

* use meta-learning to improve lifelong learning (LLL, Chen and Liu, 2018)
* The real world is changing and evolving from time to time, and therefore
  machines naturally need to update and adapt to the new data they receive
* hE catastrophic forgetting (McCloskey and Cohen, 1989)
* LLL approaches aiming for solving catastrophic forgetting (Parisi+ 2019)
* the following directions apply meta-learning
* usually, we assume stationary task distribution
  * meta-learning with distribution shift or when tasks arrive sequentially:
  * There is also research along this direction (Finn+ 2019; Yap+ 2021)
  * out of the scope of this review paper

### Meta-learning for Regularization-based LLL methods

* aim to consolidate essential parameters in a model when adapting with new dat
  (Kirkpatrick+ 2017; Zenke+ 2017; Schwarz+ 2018; Aljundi+ 2018; Ehret+ 2021)
* some successful examples in NLP applications
  * KnowledgeEditor (De Cao+ 2021) learns the parameter update strategies that
    can learn the new data and
    simultaneously retain the same predictions on the old data
    * applied to fact-checking and QA
  * Editable Training (Sinitsin+ 2020) employs learn-to-init approaches
    ensuring that new knowledge can be learned after updates
    without harming the performance of old data
    * empirically demonstrates the effectiveness on MT

### Meta-learning for Data-based LLL Methods

* idea: store a limited number of previously seen training examples in memory
  and then use them for empirical replay ie training on seen examples to
  * recover knowledge learned
    (Sprechmann+ 2018; de Masson d'Autume+ 2019; Sun+ 2019a) or to
  * derive optimization constraints
    (Lopez-Paz and Ranzato, 2017; Li and Hoiem, 2017; Saha and Roy, 2021)
* hE need to store an unrealistically many training examples in memory
  to achieve good performance
* To achieve sample efficiency:
  meta-learning to learn a better adaptation algorithm that
  recovers the knowledge learned with a limited amount of previously seen data
  * Obamuyide and Vlachos (2019a); Wang+ (2020c); Wu+ (2021a)
  * Experiments on text classification and QA benchmarks validate effectiveness
    * SOTA performance using only 1% of the memory size (Wang+ 2020c)
