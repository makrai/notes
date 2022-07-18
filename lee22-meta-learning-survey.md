Meta Learning for Natural Language Processing: A Survey
Hung-yi Lee, Shang-Wen Li, Thang Vu
NAACL 2022

# Abstract

* Deep learning has been the mainstream technique in the NLP area. However,
  * hE requires many labeled data and is less generalizable across domains
  * limits application to different domains, languages, countries, or styles
* Meta-learning is an arising field in machine learning. It studies approaches
  * learning better learning algorithms and aims to
  * improve algorithms in eg data efficiency and generalizability
  * The efficacy in many NLP tasks but there is no systematic survey of these
* org
  * general concepts of meta-learning and the common approaches.  Then we
  * task construction settings
  * applications of meta-learning for various NLP problems and review the
  * development of meta-learning in the NLP community

# 1 Intro

* Meta-learning, or Learning to Learn, aims to learn better learning
  algorithms,
  * parameter initialization (Finn+ 2017),
  * optimization strategy (Andrychowicz+ 2016; Ravi and Larochelle, 2017),
  * network architecture (Zoph and Le, 2017; Zoph+ 2018; Pham+ 2018a),
  * distance metrics (Vinyals+ 2016; Gao+ 2019a; Sung+ 2018), and
  * beyond (Mishra+ 2018)
    * Nikhil Mishra, Mostafa Rohaninejad, Xi Chen, and Pieter Abbeel. 2018 A
      simple neural attentive meta-learner In ICLR 2018
* image
  * faster fine-tuning, better performance, more generalizable models, and
    outstanding results for few-shot image classif (Triantafillou+ 2020)
  * alleviate [enyhíti] the dependency of learning algorithms on labels and
    make model development more scalable
  * abundant applications and established most of the examples in the previous
    survey papers on meta-learning (Hospedales+ 2021; Huisman+ 2021)
* NLP
  * benefits in performance and data efficiency via applying meta-learning to
  * Tables 2 and 3 in the appendix for NLP applications improved by metalearn
  * Tutorial (Lee+ 2021b) and Workshop (Lee+ 2021a) are organized at ACL 2021
  * survey paper on meta-learning in NLP (Yin, 2020).  While Yin (2020)
    * describes meta-learning methods in general
    * we focuse on the idea of making meta-learning successful when applied to
      NLP and provides a broader review of publications on NLP meta-learning

# 2 introduction of meta-learning backgrounds, general concepts, and algorithms

* general concepts/techniques of meta-learning
  * Due to space constraints, we will not give too many detailed descriptions
  * previous overview paper (Yin, 2020; Hospedales+ 2021; Huisman+ 2021)
* In meta-learning, what we want to learn is a learning algorithm. The learning
  * can also be considered as a function, denoted as F φ (.)
  * input of F φ (.) is the training data, while the
  * output of the function F φ (.) is the learned model parameters, or θ ∗ in
  * parameterized by meta-parameters φ, which is what we want to learn in
    * eg F φ (.) represents gradient descent for deep network,
    * φ can be initial parameters, learning rate, network architecture, etc
* meta-learning approaches focus on learning different components.  For
  * model-agnostic meta-learning (MAML) focuses on learning initial parameters
    (Finn+ 2017), which will be further descried in Section 4.1
  * Learning to Compare methods like Prototypical Network (Snell+ 2017) in
    Section 4.2 learn the latent representation of the inputs and their dis-
    tance metrics for comparison
  * Network architecture search (NAS) in Section 4.3 learns the network
    architecture (Zoph and Le, 2017; Zoph+ 2018; Pham+ 2018a)
* meta-training tasks T train are required.  where T n is a task, and N is the
  * Usually, all the tasks belong to the same NLP problem; for example, all the
    * eg QA but from different corpora, but it is also possible that the tasks
      belong to various problems
  * Each task T n includes a support set S n and a query set Q n
    * Both S n and Q n are paired examples as D in (1)
    * support set plays the role of training data in typical ML, while the
      query set can be understood as the testing data in typical ML. However,
    * loss function L(φ; T train ), which represents how “bad” a learning
      algorihtm paramereized by φ is on T train 
    * L(φ; T train ) is the [summed] performance over all the tasks in T train
    * The definition of the function l(.) above is the same as in (2). l
    * within-task training
      * For each task T n in T train , we use a support set S n to learn a
        model by the learning algorihtm F φ . The learned model is denoted as θ
        n , where θ n = F φ (S n ). This procedure is equivalent to typical ML
        training. We called this step within-task training
    * within-task testing
        * Then θ n is evaluated on Q n to obtain l(θ n ; Q n ) in (5). We
      * One execution of within-task training and followed by one execution of
        within-task testing is called an episode
* φ ∗ = arg min L(φ; T train )
  * If φ is differentiable with respect to L(φ; T train ), then we can use
    gradient descent to learn metaparameters
  * if not, we can use reinforcement learning algorithm or evolutionary algo
  * called cross-task training in this paper, which usually involves running
    many episodes on meta-training tasks
  * cross-task testing on T test ie running an episode on each meta-testing
    task to evaluate algorithms parameterized by meta-parameters φ ∗ 
  * If the learning processing of φ also involve some hyperperparameter sel,
    then meta-validation tasks are needed, but in this paper, we ignore this

# 3 Common settings for constructing metalearning tasks 3

* In this section, we discuss different settings of constructing meta-training
  tasks T train and metatesting tasks T test 

## 3.1 Cross-domain Transfer

* A typical setting for constructing the tasks is based on domains (Qian and
  Yu, 2019; Yan+ 2020; Li+ 2020a; Park+ 2021; Chen+ 2020b; Huang+ 2020a; Dai+
  2020; Wang+ 2021b; Dingliwal+ 2021; Qian+ 2021)
  * all the tasks, no matter belonging to T train or T test , are the same NLP
    problems
  * In each task T n , the support set S n and the query set Q n are from the
    same domain, while different tasks contain the examples from different
    domains. In each task, the model is trained on the support set of a domain
    (usually having a small size) and evaluated on the query set in the same
    domain, which can be considered as domain adaptation. From the
    meta-training tasks T train , cross-task training finds meta-parameters φ ∗
    parameterizing the learning algorithm F φ ∗ . With a sufficient number of
    tasks in T train , cross-task training should find a suitable φ ∗ for a
    wide range of domains, and thus also works well on the tasks in T test
    containing the domains unseen during cross-task training. Hence, meta-
    learning can be considered as one way to improve domain adaptation. If the
    support set in each task includes only a few examples, the meta-learning
    has to find the meta-parameters φ ∗ that can learn from a small support set
    and generalize well to the query set in the same domain. Therefore, meta-
    learning is considered one way to achieve few-shot learning
* The cross-domain setting is widespread. We only provide a few examples in
  * In MT, each meta-training task = a domain (eg news, laws, etc), while each
    meta-testing task also contains documents from one domain but not covered
    by the meta-training tasks (eg medical records) (Li+ 2020a)
  * eg1, both meta-training and meta-testing tasks are Dialgoue State Tracking
    * meta-training tasks include hotel booking, flight ticket booking, etc,
      while the testing task is taxi booking (Huang+ 2020a; Wang+ 2021b;
      Dingliwal+ 2021)
  * Domain has different meanings in different NLP problems. For example, in
    * speech processing tasks, the domains can refer to accents (Winata+ 2020b;
      Huang+ 2021) or speakers (Klejch+ 2019; Wu+ 2021b; Huang+ 2022)

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
  MAML (will be introduced in Section 4.1), the network architecture used in
  all tasks must have the same network architecture. A unified network
  * hE vocabularies in different tasks are different
  * unified word embeddings across languages are required
  * Gu+ (2018) uses the universal lexical representation to overcome the
    input-output mismatch across different languages
    * Jiatao Gu, Yong Wang, Yun Chen, Victor O. K. Li, and Kyunghyun Cho. 2018
      Meta-learning for low-resource neural machine translation EMNLP 2018
  * multilingual pretrained models as encoders, such as M-BERT (Devlin+ 2019)
    or XLM-R (Conneau+ 2020), all languages can share the same network
    architecture (Nooralahzadeh+ 2020; van der Heijden+ 2021)
    * Farhad Nooralahzadeh, Giannis Bekoulis, Johannes Bjerva, I Augenstein
      Zero-shot cross-lingual transfer with meta learning EMNLP 2020
    * N v d Heijden, Helen Yannakoudakis, Pushkar Mishra, and Ekaterina Shutova
      Multiling and cross-ling document classif: A meta-learning approach EACL
      2021

## 3.3 Cross-problem Training

* meta-training and meta-testing tasks can come from different problems. For
  * eg the meta-training tasks include MT and NLI, while the meta-testing tasks
    include QA and DST. The cross-problem setting is
  * not usual, but there are still some examples
  * Bansal+ (2020a)
    * the meta-training tasks are the GLUE benchmark tasks (Wang+ 2018), while
      the meta-testing tasks: entity typing, NLI, sentiment & other classif
    * All the meta-training and meta-testing tasks can be formulated as
      classification but with different classes
  * In Indurthi+ (2020)
    * the meta-training tasks are MT and ASR, while
    * the meta-testing task is speech translation (ST)
  * CrossFit is a benchmark corpus for this cross-problem setting (Ye+ 2021)
* challenge: different NLP problems may need very different meta-parameters in
  learning algorithms, so it may be challenging to find unified meta-parameters
  on the meta-training tasks that can generalize to meta-testing tasks
  * the meta-learning algorithms learning initial parameters such as MAML
    require all the tasks to have a unified network architecture. If different
    problems need different network architecture, then the original MAML cannot
    be used in the crossproblem setting
  * LEOPARD (Bansal+ 2020a) and ProtoMAML (van der Heijden+ 2021) are the
    * MAML variants that can be used in the classification tasks with different
      class numbers
    * Both approaches use the data of a class to generate the class-specific
      head, so only the parameters of the head parameter generation model are
      required
    * The head parameter generation model is shared across all classes, so the
      network architecture becomes class-number agnostic
  * universal models for a wide range of NLP problems have been emgered
    (Raffel+ 2019; Chen+ 2021; Ao+ 2021)
    * Yi-Chen Chen, Po-Han Chi, Shu wen Yang, Kai-Wei Chang, Jheng hao Lin,
      Sung-Feng Huang, Da-Rong Liu, Chi-Liang Liu, Cheng-Kuang Lee, and Hung yi
      Lee. 2021 Speech-Net: A universal modularized model for speech processing
      tasks
    * Junyi Ao, Rui Wang, Long Zhou, Shujie Liu, Shuo Ren, Yu Wu, Tom Ko, Qing
      Li, Yu Zhang, Zhihua Wei, Yao Qian, Jinyu Li, and Furu Wei. 2021
      SpeechT5: Unifiedmodal encoder-decoder pre-training for spoken lang proc
    * We believe the development of the universal models will intrigue the
      cross-problem setting in meta-learning

## 3.4 Domain Generalization

* Traditional supervised learning: training & testing data have the same distr
* Domain shift: when training data & testing data have very different stats
* Domain adaptation (Sec 3.1) uses little domain-spec data to adapt the model 2
* domain generalization techniques attempt to alleviate the domain mismatch
  issue by producing models that generalize well to novel testing domains
  * Meta-learning can also be used to realize domain generalization by learning
    an algorithm that can train from one domain but evaluate on the other. To
    simulate the domain generalization scenario, a set of meta-training tasks
    are constructed by sampling data from different domains as the support and
    query sets. With the meta-training tasks above, cross-task training will
    find the meta-parameters φ ∗ that work well on the scenario where the
    training (support) and testing (query) examples are from different domains
  * Fig. 1 shows how to construct tasks for domain generalization and
    compares the construction with the cross-domain transfer setting.  The
* eg improve the domain generalization for
  * semantic parsing (Wang+ 2021a) and
  * language generalization 3 for
    * The domain-specific data are usually labelled, but unlabelled
      domain-specific data can be leveraged as well (Kouw and Loog, 2021),
      which is out of scope here
  * sentiment classification and relevance classification (Li+ 2020c)

## 3.5 Task Augmentation

*  NLP-specific methods have been proposed in both categories

## Inventing more tasks (without human labeling efforts) to increase the number
and diversity of the meta-training tasks T train

* general task augmentation approahces proposed for general metalearning
  (Yao+ 2021a; Ni+ 2021; Rajendran+ 2020; Yao+ 2021b)
* Here we only focus on NLP-specific approaches
  * Bansal+ (2020b) generates a large number of cloze tasks, which
    * can be considered as multi-class classification tasks but obtained
      without labeling effort, to augment the meta-training tasks
    * Inspired from the self-supervised learning,
  * Bansal+ (2021) further explores the influence of unsupervised task
    distribution and creates task distributions that are inductive to better
    meta-training efficacy. The self-supervised generated tasks improve the
    performance on a wide range of different meta-testing tasks which are
    classification problems (Bansal+ 2020b), and it even
    * performs comparably with supervised meta-learning methods on FewRel 2.0
      benchmark (Gao+ 2019b) on 5-shot evaluation (Bansal+ 2021)

## Splitting training data from one single dataset into homogenous partitions
that allow applying meta-learning techniques and therefore improve the perf

* Huang+ (2018); Guo+ (2019); Wu+ (2019); Jiang+ (2019);
  Chien and Lieow (2019); Li+ (2020b); MacLaughlin+ (2020); Wang+ (2020a);
  Pasunuru and Bansal (2020); Xu+ (2021a); Murty+ (2021)
* First, the training set of the corpus is split into
  support partition, D s , and query partition, D q
  * Two subsets of examples are sampled from D s and D q as the support set, S,
    and query set, Q, respectively.  In each episode, model parameters θ are
    updated with S, and then the losses are computed with the updated model and
    Q. The meta-parameters φ are then updated based on the losses, as the
    metalearning framework introduced in Section 2. The test set of the corpus
    is used to build T test for evaluation. As compared to constructing T train
    from multiple relevant corpora, which are often not available, building T
    train with one corpus makes metalearning methodology more applicable
  * more comparable with existing NLP studies. However, only using a single
    data stream makes the resulting models less generalizable to various
    attributes such as domains and languages
* How to sample the data points to form a task 4 is the key in such category
  * NAS research (Sec 4.3) the support and query sets are usually randomly samp
  * Learning to Compare in Section 4.2 splits the data points of different
    classes in different tasks based on some predefined criteria
  * NLP-specific ways to construct the tasks
    * Huang+ (2018), a relevance function is designed to sample the support set
      S based on its relevance to the query set Q
    * Guo+ (2019), a retrieval model is used to retrieve the support set S from
      the whole dataset
    * DReCa (Murty+ 2021) applies clustering on BERT representations to create
      tasks

# 4 Adaptation of general meta-learning approaches to NLP problems 5

* This section shows the most popular meta-learning methods for NLP and how
* Please refer to Table 2 and 3 in the appendix for a complete survey

## 4.1 learning to initialize

* representative approaches of learn-to-init
  * MAML (Finn+ 2017) and
  its first-order approximation, FOMAML (Finn+ 2017),
  Reptile (Nichol+ 2018), etc., are the
* ap tab 4 summs many papers using MAML-based approaches to NLP applics (2019+)

### Learning to Initialize v.s.  Self-supervised Learning

### Learning to Initialize v.s. Multi-task Learning

* Multi-task learning is another way to initialize model parameters, which
  usually serves as the baseline of learn-to-init in the literature

### Three-stage Initialization

Since learn-to-init, multi-task, self-supervised learning all have their pros
and cons, they can be integrated to draw on the strong points of each other. A

### Challenges Learn-to-init is an essential paradigm for few-shot learning and

* usually outstanding results in the few-shot learning benchmarks of image
  classification (Triantafillou+ 2020). However, it has fallen short

## 4.2 learning to compare

## 4.3 neural architecture search

## 4.4 Meta-learning for Data Selection

# 5 special topics eg knowledge distillation and life-long learning for NLP

## 5.1 Learn to Knowledge Distillation

## 5.2 Learn to Life-long learning

### Meta-learning for Regularization-based LLL methods

* aim to consolidate essential parameters in a model when adapting models with
  new data
  (Kirkpatrick+ 2017; Zenke+ 2017; Schwarz+ 2018; Aljundi+ 2018; Ehret+ 2021)

### Meta-learning for Data-based LLL Methods

* idea: store a limited number of previously seen training examples in memory
  and then use them for empirical replay, that is, training on seen examples to
  recover knowledge learned (Sprechmann+ 2018; de Masson d'Autume+ 2019; Sun+
  2019a) or to derive optimization constraints (Lopez-Paz and Ranzato, 2017; Li
  and Hoiem, 2017; Saha and Roy, 2021)
