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
        * an approximation to MAML obtained by ignoring second-order derivs
      * Reptile, a new algorithm that we introduce here, which works by
        repeatedly sampling a task, training on it, and moving the
        initialization towards the trained weights on that task. We expand on
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
  * humans enter the task with a large amount of prior knowledge, encoded in
    their brains and DNA. Rather than learning from scratch, they
  * humans are fine-tuning and recombining a set of pre-existing skills. The
  * Tenenbaum+: humans’ fast-learning abilities as Bayesian inference, and that
    * the key to developing algorithms with human-level learning speed is to
      make our algorithms more Bayesian
    * hE it is challenging to develop (from first principles) Bayesian machine
      learning algorithms that make use of deep neural networks and are
      computationally feasible

* Meta-learning has emerged recently
  * an approach for learning from small amounts of data.  Rather than trying to
  * directly optimize a fast-learning algorithm, using a dataset of tasks
  * given a distribution over tasks, where each task is eg a classification
    * we sample a training set and a test set of tasks
    * Our algorithm is
      fed the training set, and it
      must produce an agent that has good average performance on the test set
  * Since each task corresponds to a learning problem, performing well on a
    task corresponds to learning quickly

* approaches to meta-learning have been proposed, each with its own pros / cons
1. In one approach, the learning algorithm is encoded in the weights of a
  recurrent network, but gradient descent is not performed at test time. This
  * proposed by Hochreiter+ [8] who used LSTMs for next-step prediction and
    has been followed up by a burst of recent work, for example, Santoro+
    [16] on few-shot classification, and Duan+ [3] for the POMDP setting
2. learn the initialization of a network, which is then fine-tuned at test
   time on the new task. A classic example of this approach is
  * eg pretraining using a large dataset (such as ImageNet [2]) and
    fine-tuning on a smaller dataset (such as a dataset of different species
    of bird [20]). However, this classic pre-training approach has
    * no guarantee of learning an initialization that is good for fine-tuning
    * ad-hoc tricks are required for good performance. More recently,
  * Finn+ [4] proposed an algorithm called MAML, which
    * directly optimizes performance with respect to this
      initialization—differentiating through the fine-tuning process. In this
    * the learner falls back on a sensible gradient-based learning algorithm
      even when it receives out-of-sample data, thus allowing it to generalize
      better than the RNN-based approaches [5]
    * hE since MAML needs to differentiate through the optimization process,
      it’s not a good match for problems where we need to perform a large
      number of gradient steps at test time
    * Finn+ also proposed a variant called first-order MAML (FOMAML), which is
      defined by ignoring the second derivative terms, avoiding this problem
      * losing some gradient information.  Surprisingly, though, they found
      * worked nearly as well as MAML on the Mini-ImageNet dataset [18]. (This
        * foreshadowed by prior work in meta-learning [1, 13] that ignored
          second derivatives when differentiating through gradient descent,
          without ill effect
      * we expand on that insight and explore the potential of
        meta-learning algorithms based on first-order gradient information,
* We make the following contributions:
  * first-order MAML [4] is simpler to implement than was widely recognized
  * We introduce Reptile, an algorithm closely related to FOMAML, which is
    equally simple to implement. Reptile is
    * similar to joint training
      (ie training to minimize loss on the expecation over training tasks) that
      nL it works as a meta-learning algorithm
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
