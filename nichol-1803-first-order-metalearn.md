On First-Order Meta-Learning Algorithms
Alex Nichol, Joshua Achiam, John Schulman
arXiv:1803.02999 [cs.LG]

* meta-learning problems
  * there is a distribution of tasks, and
  * we would like to obtain an agent that performs well (ie learns quickly)
    when presented with a previously unseen task sampled from this distribution
* We analyze a family of algorithms for learning a parameter initialization
  that can be fine-tuned quickly on a new task,
  using only first-order derivatives for the meta-learning updates
  * This family includes and generalizes
    * first-order MAML Finn+
      * an approximation to MAML obtained by ignoring second-order derivatives
    * Reptile, a new algorithm that we introduce here, which works by
      repeatedly sampling a task, training on it, and
      moving the init towards the trained weights on that task
* first-order meta-learning algorithms
  perform well on some well-established benchmarks for few-shot classification,
* we provide theoretical analysis aimed at understanding why

# 1 Introduction

* machine learning systems have surpassed humans at many tasks,
  hE they generally need far more data to reach the same level of performance
  * Schmidt+ [17, 15] showed that human subjects can
    recognize new object categories based on a few example images
  * Lake+ [12] noted that on the Atari game of Frostbite,
    human novices could make significant progress on the game after 15 minutes,
    but double-dueling-DQN [19] required more than 1000 times more experience
    to attain the same score
* It is not completely fair to compare humans to algos learning from scratch,
  * humans enter the task with a large amount of prior knowledge,
    encoded in their brains and DNA
  * humans are fine-tuning and recombining a set of pre-existing skills
  * Tenenbaum+: humans’ fast-learning abilities as Bayesian inference
    * the key to developing algorithms with human-level learning speed is to
      make our algorithms more Bayesian
    * hE it is challenging to develop (from first principles)
      Bayesian machine learning algorithms that
      make use of deep neural networks and are computationally feasible
* Meta-learning has emerged recently
  * an approach for learning from small amounts of data
  * directly optimize a fast-learning algorithm, using a dataset of tasks
  * given a distribution over tasks, where each task is eg a classification
    * we sample a training set and a test set of tasks
    * Our algorithm is
      fed the training set, and it
      must produce an agent that has good average performance on the test set
  * Since each task corresponds to a learning problem,
    performing well on a task corresponds to learning quickly
* approaches to meta-learning
1. In one approach, the learning algorithm is encoded in the weights of a
  recurrent network, but gradient descent is not performed at test time
  * proposed by Hochreiter+ [8] who used LSTMs for next-step prediction and
    * followed up by a burst of recent work
      eg Santoro+ [16] on few-shot classif, and Duan+ [3] for the POMDP setting
2. learn the initialization of a network,
  which is then fine-tuned at test time on the new task
  * eg pretraining using a large dataset (such as ImageNet [2]) and
    fine-tune on a smaller dataset (eg that of different species of bird [20])
    * no guarantee of learning an initialization that is good for fine-tuning
    * ad-hoc tricks are required for good performance
  * Finn+ [4] proposed an algorithm called MAML, which
    * directly optimizes performance with respect to this
      initialization—differentiating through the fine-tuning process
    * the learner falls back on a sensible gradient-based learning algorithm
      even when it receives out-of-sample data, thus allowing it to
      generalize better than the RNN-based approaches [5]
    * hE since MAML needs to differentiate through the optimization process,
      it’s not a good match for problems
      where we need to perform many gradient steps at test time
    * Finn+ also proposed a variant called first-order MAML (FOMAML), which is
      defined by ignoring the second derivative terms
      * losing some gradient information
      * worked nearly as well as MAML on the Mini-ImageNet dataset [18]
        * foreshadowed by prior work in meta-learning [1, 13] that ignored
          second derivatives when differentiating through gradient descent,
          without ill effect
      * we expand on that insight and explore the potential of
        meta-learning algorithms based on first-order gradient information,
contributions:
  * first-order MAML [4] is simpler to implement than was widely recognized
  * We introduce Reptile, an algorithm closely related to FOMAML, which is
    equally simple to implement
    * similar to joint training
      (ie training to minimize loss on the expecation over training tasks)
      but it works as a meta-learning algorithm
    * Unlike FOMAML, Reptile doesn’t need a training-test split for each task,
      => more natural choice in certain settings
    * also related to the older idea of fast weights / slow weights [7]
      [7] Geoffrey E Hinton and David C Plaut
        Using fast weights to deblur old memories
        8th annual conference of the Cognitive Science Society 1987
  * We provide a theoretical analysis that
    * applies to both first-order MAML and Reptile, showing that
    * they both optimize for within-task generalization
  * empirical evaluation on the Mini-ImageNet [18] and Omniglot [11] datasets,
    => we provide some insights for best practices in implementation
