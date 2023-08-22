Delays, Detours, and Forks in the Road:
  Latent State Models of Training Dynamics
Michael Y. Hu, Angelica Chen, Naomi Saphra, Kyunghyun Cho
arXiv:2308.09543 [cs.LG] Under review as submission to TMLR

# Abstract

* The impact of randomness on model training is poorly understood
  * How do differences in data order and initialization manifest in the model,
  * some training runs outperform others or converge faster?
  * how to interpret the resulting training dynamics and the phase transitions
    that characterize different trajectories?
* we train models multiple times with different random seeds and
  * we compute a variety of metrics throughout training
    * eg L2 norm, mean, and variance of the neural network's weights
  * We then fit a hidden Markov model (HMM) over the resulting seq of metrics
    * The HMM represents training as
      a stochastic process of transitions between latent states,
      providing an intuitive overview of significant changes during training
  * => low-dimensional, discrete representation of training dynamics on
    grokking tasks, image classification, and masked language modeling
  * We use the HMM representation to study phase transitions and
    identify latent "detour" states that slow down convergence

# 1 Introduction

* We possess strong intuition for how various tuned hyperparameters, such as
  learning rate or weight decay, affect model training dynamics and outcomes
  (Galanti+ 2023; Lyu+ 2022)
  * eg a larger learning rate may lead to faster convergence
    at the cost of sub-optimal solutions (Hazan, 2019; Smith+ 2021; Wu+ 2019)
  * hE, we lack similar intuitions for the impact of randomness
    * also have a significant impact on training
      (Madhyastha & Jain, 2019; Sellam+ 2022)
* we study the impact of random seeds
  through a low-dimensional representation of training dynamics
  * we visualize and cluster training trajectories
    with different parameter initializations and data orders
  * we analyze training trajectories using a hidden Markov model (HMM)
    fitted on a set of generic metrics collected throughout training
    * eg the means and variances of the neural network’s weights and biases
  * From the HMM, we derive a visual summary of how learning occurs for a task
    across different random seeds
* This work is a first step towards a
  principled and automated framework for understanding variation in training
  * low-dimensional representation of training trajectories:
    we analyze training at a higher level of abstraction
    than directly studying model weights
  * We use the HMM to infer a Markov chain over latent states in training and
    relate the resulting paths to training outcomes
* contributions:
  1. HMM as a principled, automated, and efficient method
    for analyzing variability in model training
    * We fit the HMM to a set of off-the-shelf metrics and allow the model to
      infer latent state transitions from the metrics
    * We then extract from the HMM a “training map,” which
      * describes the important metrics for each state and changes in these
        metrics during state transitions, helping to
        visualize how training evolves (Section 2)
    * experiments on grokking tasks, LM, and image classification across a
      variety of model architectures and sizes
      * training map -> characterize how
        different random seeds lead to different training trajectories
      * We analyze phase transitions in grokking by
        matching them to corresponding latent states in the training map, and
        thus the changes in metrics associated with the phase transitions
        (Section 3.1)
  2. We discover detour states := latent states associated with slower converg
    * a general way to assign semantics onto latent states in training maps
      (Sections 2.3, 3.4)
    * induce/remove detour states in image/grokking by de/stabiliz optimization
      * induce detour states in image classification by destabilizing the
        optimization process and,
      * remove detour states in grokking by stabilizing the optimizat process
    * with a few changes that are known to stabilize neural network training,
      such adding normalization layers, we find that
      the gap between memoriz and generaliz in grokking is dramatically reduced
    * Our results, along with prior work from Liu+ (2023), show that
      grokking can be avoided by changing the architecture or optimization of
      deep networks (Section 3.3)

# 2 Methods

* we cluster training trajectories from different random seeds and
  then analyze these clusters to better understand their learning dynamics
  * To cluster trajectories, we assign each model checkpoint
    to a discrete latent state using an HMM
  * HMM is the simplest time series model with a discrete latent space
* Let w1:T ∈ RD×T be the sequence of neural network weights (model checkpoints)
  * we use the Gaussian HMM to label each checkpoint w with its latent state s
  * Fitting the HMM directly over the weights is computationally infeasible,
    because the sample complexity of an HMM with O(D2) parameters would be
    prohibitively high
    => we compute a small number of metrics f1 (w1:T),,, fd (w1:T)
    where d << D and f : RD → R

## 2.1 Training an HMM over Metrics

* metrics such as the average layer-wise L1 and L2 norm, the mean and variances
  of the weights and biases in the network, and the means and variances of each
  weight matrix’s singular values
  * we ignore embedding matrices and layer norms when computing metrics,
    as we are primarily interested in
    how the function represented by the neural network changes
  * A full list of the 14 metrics we use, along with formulae and ration: App B
  * we concatenate these metrics into an observation sequence z1:T
  * z-score normalization (also known as standardization)
    * HMMs are sensitive to the scale of features
    * To bound the impact of training trajectory length, we compute z-scores
      using the estimated mean and variance of (up to) the first 1000 checkps
* We collect N sequences `{z1:T}_1^N` from N different random seeds,
  normalize the distribution of each metric across training for a given seed,
  * train the HMM over the sequences `{z̃1:T}_1^N`
    using the Baum-Welch algorithm (Baum+ 1970)
  * number of hidden states, which is
    * typically tuned using the log-likelihood, Akaike information criterion
      (AIC), and/or Bayesian information criterion (BIC) (Akaike, 1998;
      Schwarz, 1978) of validation sequences
    * we hold out 20% of the N trajectories as validation sequences and
      choose the number of hidden states that minimizes the BIC
      * because BIC imposes a stronger preference for simpler, and thus more
        interpretable, models. Model selection curves are in Appendix G

## 2.2 Extracting the Training Map

* Next, we use the HMM to describe
  what each hidden state means and how the hidden states relate to each other
  * the “training map” represents hidden states as vertices in a graph and
    hidden state transitions as edges in the graph
* First, we extract the graph’s structure from the HMM
  * The learned HMM has two sets of parameters
    * transition matrix `p(s_t|s_t-1)` between hidden states, and the
    * emission distribution p(z̃t |st = k) ∼ N (µk , Σk)
  * The transition matrix is a Markov chain that defines the graph’s structure
    * We prune edges in the Markov chain
      if the edge is unused by the HMM for all training trajectories
* We label the hidden states s1:T by ranking the features according to how much
  each feature z̃t[i] changes the posterior probability p(st = k|z̃1:t)
  * If a change along a feature z̃t[i] leads to a large change in p, then we
    consider z̃t[i] to be an influential feature for the prediction that st = k
  * we compute the 3 most important features for each hidden state
* To characterize an edge (j → k) in the graph, we can subtract the means
  between state j and k
  * The difference vector µk − µj then describes the movement of features

## 2.3 Assigning Semantics to Latent States

* what do we learn from the path a training run takes through the map?
  * what impact does a particular state have on training outcomes?
* In order to relate HMM states to training outcomes, we select a metric and
  predict it from the path a training run takes through the Markov chain
  * <~ must featurize the sequence of latent states, and in this work
  * we use unigram featurization, or a “bag of states” model
* we investigate how particular states impact convergence time
  * convr time: the first timestep that evaluation accuracy crosses a threshold
  * threshold to be a value slightly smaller than the maximum eval accuracy
    (see Section 3.4)
    * We use linear regression to predict convergence time from P̂ 
    * Here, we are not forecasting when a model will converge from earlier
      timesteps; rather, we are simply using linear regression to learn a
      function between latent states and convergence time
* we examine the regression coefficients to see which states are correlated
  with slower or faster convergence times
  * positive: a training run spending additional time in that state implies
    longer convergence time
  * if that same state is not visited by all trajectories, then we can consider
    it a detour, because the trajectories that visit the optional state are
    also delaying their convergence time
* A learned latent state is a detour state if:
  * Some training runs do not visit the state ie the state is “optional”
  * Its linear regression coefficient is positive when predicting converg time
* Our method for assigning semantics to latent states
  can be extended to other metrics
  * gender bias can vary widely across training runs (Sellam+ 2022)
  * eg use regression to predict a measure of gender bias, from the empirical
    distribution over latent states. The training map then becomes a map of how
    gender bias manifests across training runs
* We also recommend computing the p-value of the linear regression and only
  interpreting the coefficients when they are statistically significant

# 3 Results

* We perform experiments across five tasks: modular addition, sparse parities,
  masked language modeling, MNIST, and CIFAR-100
  * training hyperparameter details, see Appendix C
  * Modular arithmetic and sparse parities are tasks where
    models consistently exhibit grokking (Power+ 2022)
* grokking
  * training and validation losses seem to be decoupled, and the
    validation loss drops sharply after a period of little to no improvement
  * The model first memorizes the training data and then generalizes to the
    validation set
  * sharp changes =: “phase transitions”, periods in training which contain an
    inflection in the loss (ie, the concavity of the loss changes)
    that is then sustained (no return to chance performance)
* How are phase transitions represented by the HMM’s discrete latent space?

## 3.1 Algorithmic Data: Modular Arithmetic and Sparse Parities 5

### Modular Arithmetic: Figure 2

* a one-layer autoregressive transformer to predict z = (x + y) mod 113
  * a replication of the experiments in Nanda+ (2023)
* In modular arithmetic, the number of epochs that different training runs take
  to converge differ by thousands of epochs
  * training map: we find that there exist paths of different lengths
    * some training runs take the shortest path through the map to convergence,
      while others do not. We feature three such paths in Figure 2
  * All runs initialize in state 1 and achieve low loss in state 3, but
    * there are several paths from 1 to 3
    * The longest path (1 → 5 → 2 → 3) coincides with the longest time to
      convergence of the three featured runs, and
      the shortest path (1 → 3) with the shortest
* we relate the edges exiting state 1 to how fast or slow generaliz runs differ
  * Figure 2
  * we take the top 3 features of states 2, 5, and 3 via the learned covar mxs,
    and quantify the feature movements of the top 3 features by subtracting the
    learned means (recall z̃) between these states and state 1
  * We find that the fast-generalizing path (1 → 3) is characterized by a
    “just-right” drop in the L2 norm (↓1.68, see table)
    * The slower-generalizing runs (1 → 2 → 3) and (1 → 5 → 2 → 3) are
      characterized by either smaller (↓0.59) or larger (↓2.08) drops in L2
* State 1 encapsulates the memorization phase transition
  * the training loss drops to near-zero in state 1, while
    validation loss increases
  * Thus, according to the training map,
    the epoch in which the generalization phase transition happens is
    affected by how fast the L2 norm drops immediately after the memorization
    phase transition
  * A “just-right” drop in the L2 norm is correlated with the quickest onset of
    generalization

### Sparse Parities: Figure 8 in Appendix E. Sparse parities is a similar

* a multilayer perceptron must learn to apply an AND operation to 3 bits within
  a 40-length bit vector
  * the crux of the task is learning which 3 of the 40 bits are relevant. We
  * 40 training runs
* Similar to modular arithmetic, path variability through the training map also
  appears at the beginning of training
  * Slow-generalizing runs take the path (2 → 0 → 5), while
    fast-generalizing runs take the more direct path (2 → 5)
  * The L2 norm remains important here, with the
    edge (2 → 0) characterized by an increase in the L2 norm and the
    edge (2 → 5) characterized by a decrease
  * Once again, the speed at which the generalization phase transition occurs
    is associated with a specific change in the L2 norm
    immediately after the memorization phase transition

## 3.2 Image classification: CIFAR-100 and MNIST 6

### CIFAR-100: Figure 3

* As a counterpoint to grokking, consider image classification, well-studied
  * 40 runs of ResNet18 (He+ 2016) trained on CIFAR-100 (Krizhevsky 09)
* the learning dynamics are smooth and insensitive to random seed
  * The training map is a linear graph, and the
    state transitions all tend to feature increasing dispersion in the weights.
  * We show the top 3 features for each state transition in fig 3
* The L1 , L2 and average singular value are
  increasing monotonically across all state transitions

### MNIST: Figure 9 in Appendix F. Like CIFAR-100

* a two-layer MLP learning image classification on MNIST, with
  * hyperparameters based on Simard+ (2003)
* The training runs of MNIST follow a single trajectory through the train map
* the transitions are also characterized by similar changes between features

## 3.3 Destabilizing Image Classification, Stabilizing Grokking 7

* So far, we have observed that the training dynamics of neural networks
  * algorithmic data: highly sensitive to random seed
  * image classification: relatively unaffected by random seed
  * One possible explanation: a property of the data
  * In this section, we will show that this explanation is incomplete
  * grokking is also affected by model architecture and optimizat hyperparams,
  * small changes to training can
    * close the gap between memorization and generalization in grokking and
    * make training robust to changes in random seed
* First, we examine the training dynamics of ResNets
  without batch normalizat (Ioffe & Szegedy, 2015) and residual connections
  * Residual connections help ResNets avoid vanishing gradients (He+ 2016) and
    smooth the loss landscape (Li+ 2018)
  * Batch norm has similarly been shown to
    * add smoothness to the loss landscape (Santurkar+ 2018) and also
    * contributes to automatic learning rate tuning (Arora+ 2019)
  * we train the ablated networks from scratch on CIFAR-100, 40 random seeds
    * All hyperparameters are in Appendix C
* training dynamics become significantly more sensitive to random, fig 4
  * Depending on the random seed, the model may stagnate for many updates
    before generalizing
  * training map now forks when exiting state 3, the initialization state
    * slow-generalizing path (3 → 1) and a fast-generalizing path (3 → 2),
      characterized by feature movements in opposite directions
    * In the slow-generalizing path, norms and average singular value increase,
      while in the fast-generalizing path these features slightly decrease
* modular addition with layer norm and smaller batches
  * If removing batch normalization destabilizes ResNet training in CIFAR-100,
  * layer normalization was removed from modu addit by Nanda+ (2023)
  * we add layer normalization back in and train over 40 random seeds
  * We also decrease the batch size
    * leads SGD to flatter minima (Keskar+ 2017)
  * => transformer converges around 30 times faster on modular addition data
  * sensitivity to random seed disappears
    * the training map in Figure 5 becomes a linear graph
* conclusions of this section
  * grokking is caused by both the data and model training choices, and
    * changes to model training can minimize the grokking effect
  * different hyperparameters or architectures can result in
    different training maps for the same task
    * In training setups sensitive to random seed, the HMM associates
      differences in training dynamics with different latent states

## 3.4 Predicting Convergence Time 9

* now we formalize the connection between latent states and convergence time
* We use these state models as features in a linear regression to identify
  convergence time, as described in Section 2.3
  * convergence time := the iteration where validation accuracy > threshold,
    * threshold to be 0.9 in modular addition and sparse parities,
      0.6 for the stable version of CIFAR-100, 0.4 for destabilized CIFAR-100,
      and 0.97 for MNIST
    * slightly less than the maximum evaluation accuracy for each task,
  * To visualize the variance in convergence times, see Appendix H
* trajectory dissimilarity (Table 1)
  * if the training map contains forked paths,
    linear regression predicts convergence time
    from a given training run’s distribution over latent states very accurately
  * If the training map is instead linear, training follows similar paths
    through the HMM across different random seeds
  * We formalize this intuition of trajectory dissimilarity
    by measuring the expected Wasserstein distance W (·, ·)
    (Kantorovich, 1939; Vaserstein, 1969) between empirical distributions for
    any two random seeds p, q over latent states, sampled uniformly at random
* With statistically significant (p < 0.001) regression models for modular
  addition, sparse parities, and destabilized CIFAR-100, we can use the learned
  regression coefficients to find detour states
  * In Table 2, we highlight these detour states
    * detour state := state with a positive regression coefficient that is
      only visited by a strict subset of training trajectories
  * In our tasks with linear graphs, there are no detour states,
    because every training run visits every latent state
  * Our regression analysis largely confirms observations drawn from looking at
    the training maps and trajectories in sections prior
    * states 2 and 5 are detour states in modular addition,
      state 0 is a detour state in sparse parities, and
      state 1 is a detour state in destabilized CIFAR-100
* Detour states signal that the outcome of training is unstable
  * they appear/disappear in training setups
    that are sensitive/robust to randomness
  * By adding layer norm and decreasing batch size, we
    * decreased both the mean and variance of convergence time
      in modular addition (see Table 1)
    * detour states disappear, as the training map becomes a linear graph
  * Conversely, removing batch norm and residual connections destabils ResNets
    * forks in the training map that lead to detour states

# 4 Related Work

* relate state machines to the internals of a neural network
  * Weiss+ (2018; 2019) extract deterministic finite automata (DFA) from neural
    networks
    * some similarity to the annotated Markov chain we extract from training
  * Williams (1992) use an extended Kalman filter (EKF) to train a RNN
    * he notes the similarity between
      EKF and the real-time recurrent learning algorithm (Marschall+ 2020)
  * In contrast to the existing literature, we use state machines to understand
    the training process rather than the inference process
  * Measuring the state of a neural network using vari metrics: Frankle+ (2020)
* Analyzing time series data using a probabilistic framework in other tasks
  (Kim+ 2017; Hughey & Krogh, 1996; Bartolucci+ 2014)
  * Batty+ (2019) use an autoregressive HMM (ARHMM) to
    segment behavioral videos into semantically similar chunks
    * capture both discrete and continuous latent dynamics
    * an interesting model to try for future work
    * These modeling decisions (discrete vs continuous latent space,
      dimensionality reduction) all impact the interpretation of the trained
      model, so we invite readers to consider them carefully
* measures literature: find metrics that can
  predict discontinuous improvement or convergence in neural networks
  * Barak+ (2022) first hypothesized the existence of hidden progress measures
  * Olsson+ (2022) found a progress measure for induction heads
    in Transformer-based language models, and
  * Nanda+ (2023): a progress measure for grokking in the modular arithm task
* The L2 norm is also known to be important to and predictive of grokking,
  * motivates the use of weight decay to accel convergence in grokking settings
    (Nanda+ 2023; Power+ 2022; Thilak+ 2022)
  * Liu+ (2023) highlight the importance of the L2 norm by
    correcting for grokking via
    projected gradient descent within a fixed-size L2 ball;
    * conversely, they also induce grokking on new datasets
      by choosing a disadvantageous L2 norm
  * Our results mirror their work
    * nL grokking has other available remedies
      beyond ones that directly manipulate the L2 norm
* the empirical study of training dynamics
  * learning = when increases in training data lead to predictable increases in
    * test performance (Kaplan+ 2020; Razeghi+ 2022) and in
    * model complexity (Choshen+ 2022; Mangalam & Prabhu, 2019; Nakkiran+ 2019)
  * hE this ignores how heterogeneous the factors of training can be
    * Different capabilities are learned at different rates (Srivastava+ 2022),
      different layers converge at different rates (Raghu+ 2017), and
      different latent dimensions emerge at different rates
      (Jarvis+ 2023; Saxe+ 2019)
  * early stages in training can be modeled nearly exactly through simple meths
    (Hu+ 2020; Jacot+ 2018)
    * hE these early stages are notably distinct from later stages
    * Early stages exhibit unique phenomena such as
      * critical learning periods (Achille+ 2019) and
      * break-even points (Jastrzebski+ 2020)
    * => methods like ours which treat training as a heterogeneous process are
      crucial in understanding realistic training trajectories

# 5 Discussion

* The training maps derived from HMMs are
  interpretable descriptions of training dynamics that
  summarize similarities and differences between training runs
* a low-dimensional, discrete representation of training dynamics
* Via the HMM, this representation is generally predictive of the next set of
  metrics in the training trajectory, given the previous metrics
* Furthermore, in some cases this low-dimensional, discrete representation can
  even be used to predict the iteration in which models converge

## 5.1 Grokking and the Optimization Landscape

* We conjecture that
  grokking is the consequence of a sharp optimization landscape
* the edits we performed to significantly decrease the grokking effect:
  * adding layer normalization and decreasing batch size
  * these have been documented as increasing smoothness in the loss landscape
    (Santurkar+ 2018; Arora+ 2019; Keskar+ 2017)
  * Image classification is a well-studied task with many tricks
  * perhaps learning algorithmic data will become just as efficient in the
    future, such that grokking is no longer a concern

## 5.2 Progress Measures and Phase Transitions

* By modeling convergence time in grokking settings, we analyze phase transits
  * generalization phase transition can be sped up by avoiding detour states
  * These detour states are generally characterized by specific requirements in
    metrics such as the L2 norm
  * eg in the modular arithmetic setting, avoiding detour states requires a
    “just-right” decrease in the L2 norm–not too little, and not too much
  * Liu+ (2023): grokking occurs because the weight norm is slow to reach a
    shell of particular L2 norm in weight space, previously called
    the “Goldilocks zone” (Fort & Scherlis, 2018)
  * our results suggest that the rate of change is also crucial
    * not only the momentary value of the norm

## 5.3 The Impact of Random Seed

* We recommend a large number of training seeds for studying training dynamics
* with a small number of runs, anomalous training phenomena might be missed,
  simply due to sampling
* These anomalous phenomena can be the most elucidating, as in grokking,
  where a small number of runs converge faster than the rest
* The role of random variation has been highlighted for the performance and
  generalization of trained models (McCoy+ 2020; Sellam+ 2022; Juneja+ 2023),
  hE there are fewer studies on variation in training dynamics
* We recommend studying training across many runs, and
  possibly relying on state diagrams like ours
  to distinguish typical and anomalous training phenomena

## 5.4 Limitations and Future Work

* Our work assumes that training dynamics can be represented by a linear,
  discrete, and Markovian model
* a higher-powered model might capture even more information about training dyn
* Relaxing the assumptions of the HMM is likely a fruitful area for future
* we perform dimensionality reduction via hand-picked statistics. We use these
  statistics as interpretable features for our training maps, but
  * a fully unsupervised approach also deserves exploration
* hyperparameter search
  * training instability to random seed is highly dependent on hyperparameters,
  * instability manifests early in training
    => it may be more efficient to measure early variation across a few seeds
    to quickly evaluate a hyperparameter setting,
    rather than waiting to measure accuracy on the trained model

# 6 Conclusion

1. directly modeling training dynamics as a new avenue for interpretability
  * even with a simple model like the HMM, we can learn representations of
    training dynamics that are predictive of key metrics like convergence time
2. we discover detour states of learning, and show that
  * detour states are related to both how quickly models converge and
    how sensitive the overall training process is to random seed
3. stability across random seeds is empirically linked to generalization,
   * a possible criterion for model tuning and selection
