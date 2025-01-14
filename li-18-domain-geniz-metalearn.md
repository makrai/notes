Learning to Generalize: Meta-Learning for Domain Generalization
Da Li, Yongxin Yang, Yi-Zhe Song, Timothy Hospedales
AAAI Conference on Artificial Intelligence 2018 Vol. 32 No. 1

# Abstract

* Domain shift: a model trained in one source domain performs poorly
  when applied to a target domain with different statistics
* Domain Generalization (DG) techniques attempt to alleviate this issue by
  producing models which by design generalize well to novel testing domains
* most previous DG work: designing a specific model that is robust to domn shft
* We propose a novel meta-learning method for domain generalization
  * model agnostic training procedure for DG
  * Our algorithm simulates train/test domain shift during training
    by synthesizing virtual testing domains within each mini-batch
  * The meta-optimization objective requires that
    steps to improve training domain performance
    should also improve testing domain performance
* This meta-learning procedure trains
  models with good generalization ability to novel domains
* We evaluate our method and achieve
  SOTA results on a recent cross-domain image classification benchmark, as well
  demonstrating its potential on two classic reinforcement learning tasks

# 1 Intro

* If a human discovers that their existing strategy fails in a new context
  they do not just adapt, but further
  try to update their strategy to be more context independent,
  so that next time they arrive in a new context
  they are more likely to succeed immediately
* We would like artificial learning agents to
  solve many tasks under different conditions (domains) and similarly
  solve the second order task of constructing models that are
  robust to change of domain and perform well ‘out of the box’ in new domains
* For example we might like
  * computer vision systems to recognize objects immediately and without
    retraining, when the camera type is changed (Patel+ 2015), or
  * reinforcement learning trained agents to perform well immediately when
    placed in a new environment or subjected to changed morphology
    (Taylor and Stone 2009) – without waiting for adaptation
* We take a meta learning approach to DG
  * rel work proposing a specific model suited for DG
    (Khosla+ 2012; Ghifary+ 2015; Li+ 2017),
  * we propose a model-agnostic training algorithm that
    trains any given model to be more robust to domain shift
* related to the of learning to learn
  * long standing idea (Thrun & Pratt 1998; Schmidhuber, Zhao, & Wiering 1997),
  * recently applications to
    * few-shot learning (Finn, Abbeel, & Levine 2017; Ravi & Larochelle 2017)
    * learning optimizers (Andrychowicz+ 2016)
    * The most related of these studies to ours is the MAML approach of
      (Finn, Abbeel, and Levine 2017)
* MAML takes a meta-learning approach to few-shot learning by
  training a single model on a set of source tasks that is
  only a few gradient descent steps away from a good task-specific model. This
  * trains models suited for few-shot fine-tuning to new target tasks
  * The DG problem is different because we to
    * transfer across domains rather than tasks, and because
    * DG assumes zero, rather than few training examples of the target problem
* Our meta-learning domain generalization approach (MLDG) provides
  a model agnostic training procedure that
  improves the domain generality of a base learner. Specifically,
  * trains a base learner on a set of source domains
    by synthesizing virtual training and virtual testing domains
    within each mini-batch
  * The meta-optimization objective is then:
    to minimize the loss on the training domains, while also
    ensuring that the direction taken to achieve this
    also leads to an improvement in the (virtual) testing loss
* We present analyses that give various perspectives on this strategy,
  * eg following an optimization trajectory where the virtual training and
    virtual testing gradients are aligned
* benefits:
  * As a meta-learning procedure, it does not introduce any new parameters,
    unlike other model-based DG approaches that grow parameters linearly in the
    number of source domains (Khosla+ 2012; Ghifary+ 2015; Li+ 2017; Bousmalis+
    2016) resulting in large numbers of total parameters
  * no constraint on the architecture of the base learner and moreover
    can be applied to both supervised and reinforcement learning
    * prior DG alternatives (Khosla+ 2012; Ghifary+ 2015; Li+ 2017) both
      constrain the model architecture and address supervised learning
* contributions:
  * We develop a gradient-based meta-learning algorithm that trains models for
    improved domain generalization ability
    * can train any type of base network and
      applies to both supervised and reinforcement learning settings
  * We evaluate our approach
    * SOTA on a very recent cross domain image recognition benchmark and
    * promising applicability to two classic reinforcement learning tasks
