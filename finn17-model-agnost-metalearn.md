Model-Agnostic Meta-Learning for Fast Adaptation of Deep Networks
Chelsea Finn, Pieter Abbeel, Sergey Levine
International Conference on Machine Learning, PMLR 70:1126-1135, 2017

# Abstract

* We propose an algorithm for meta-learning that is model-agnostic, in the sense
  * ie compatible with any model trained with gradient descent and
  * applicable to a variety of different learning problems, including
    classification, regression, and reinforcement learning
* The goal of meta-learning is to train a model on a variety of learning tasks,
  such that it can solve new learning tasks using only a few training samples
* In our approach, the parameters of the model are explicitly trained such that
  a small number of gradient steps with a small amount of training data from a
  new task will produce good generalization performance on that task. In
  => our method trains the model to be easy to fine-tune. We demonstrate that
* SOTA performance on two few-shot image classification benchmarks, produces
  good results on few-shot regression, and
  accelerates fine-tuning for policy gradient reinforcement learning with
  neural network policies

# 1 Intro

* Our artificial agents should be able to do the same,
  * learning and adapting quickly from only a few examples, and
  * continuing to adapt as more data becomes available. This kind of fast and
    * while avoiding overfitting to the new data
  * the form of prior experience and new data will depend on the task

* we propose a meta-learning algorithm that is general and model-agnostic, in
  the sense that it can be directly applied to any learning problem and model
  * Our focus is on deep neural network models, but we illustrate how our
    approach can easily handle different architectures and different problem
    settings, including classification, regression, and policy gradient
    reinforcement learning, with minimal modification

* The key idea underlying our method is to
  train the model’s initial parameters such that
  the model has maximal performance on a new task
  after the parameters have been updated through one or more gradient steps
  computed with a small amount of data from that new task
  * prior meta-learning methods
    * learn an update function or learning rule
    (Schmidhuber 87; Bengio+ 92; Andrychowicz+ 16; Ravi & Larochelle 17)
    * constraints on the model architecture
      (eg by requiring a RNN (Santoro+ 2016) or a Siamese network (Koch, 2015))
  * our algorithm does
    * not expand the number of learned parameters
    * no constraints on the model architecture and it
    * can be readily combined with fully connected, convolutional, or recurrent
    * can also be used with a variety of loss functions, including
      differentiable supervised losses and
      nondifferentiable reinforcement learning objectives

* The process of training a model’s parameters such that a few gradient steps,
  or even a single gradient step, can produce good results on a new task can be
  viewed from a feature learning standpoint as
  building an internal representation that is broadly suitable for many tasks
  * then fine-tuning the parameters slightly (eg by primarily modifying the top
    layer weights in a feedforward model) can produce good results. In effect,
    * models that are easy and fast to fine-tune, allowing the adaptation to
* From a dynamical systems standpoint, our learning process can be viewed as
  maximizing the sensitivity of the loss functions of new tasks with respect to
  the parameters: when the sensitivity is high, small local changes to the
  parameters can lead to large improvements in the task loss
* The primary contribution of this work is a simple model~ and task-agnostic
  algorithm for meta-learning that trains a model’s parameters such that a
  small number of gradient updates will lead to fast learning on a new task
* We demonstrate the algorithm
  * on different model types, including fully connected and convolutional
  * in several distinct domains, including few-shot regression, image
    classification, and reinforcement learning
  * Our evaluation shows that our meta-learning algorithm
    compares favorably to SOTA one-shot learning methods designed specifically
    for supervised classification, while using fewer parameters, but that it
    * can also be readily applied to regression and
      can accelerate reinforcement learning in the presence of task variab,
      substantially outperforming direct pretraining as initialization
* conclusion
  * since our method merely produces a weight initialization, adaptation can be
    performed with any amount of data and any number of gradient steps, though
    we demonstrate SOTA results on classification with only one or five
    examples per class
  * our method can adapt an RL agent using policy gradients and a very modest
    amount of experience
  * Reusing knowledge from past tasks may be a crucial ingredient in making
    high-capacity scalable models, such as deep neural networks, amenable to
    fast training with small datasets
  * Further research in this area can make multitask initialization a standard
    ingredient in deep learning and reinforcement learning.

# 2 

* In our experiments, we also include a comparison to
  dropping this backward pass and using
  a first-order approximation, which we discuss in Section 5.2.

## 5.2. Classification 6

* A significant computational expense in MAML comes from the use of second
  derivatives when backpropagating the meta-gradient through the gradient
  operator in the meta-objective (see Equation (1))
* On MiniImagenet, we show a comparison to a first-order approximation of MAML,
  where these second derivatives are omitted. Note that the resulting method
  still computes the meta-gradient at the post-update parameter values θ i 0 ,
  which provides for effective meta-learning. Surprisingly however, the
* nL performance of this method is nearly the same 
  * ie most of the improvement in MAML comes from the gradients of the
    objective at the post-update parameter values, rather than the second order
    updates from differentiating through the gradient update
* ReLU neural networks are locally almost linear (Goodfellow+ 2015), which
  => second derivatives may be close to zero in most cases, partially
  * removes the need for computing Hessian-vector products in an additional
    backward pass
  * 33% speed-up in network computation.
