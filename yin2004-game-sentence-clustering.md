Zero-Shot Learning of Text Adventure Games with Sentence-Level Semantics
Xusen Yin, Jonathan May
arXiv:2004.02986 [cs.CL]

# Abstract

* Reinforcement learning algorithms such as Q-learning have shown great promise
  * learn the optimal action to take for a given system state
  * exploratory or adversarial nature such as task-oriented dialogues or games.
  * [when] access to their state [ only ] via the medium of language, this can
* We introduce a new model amenable to deep Q-learning that incorporates a
  Siamese neural network architecture and 
  a novel refactoring of the Q-value function in order to better represent
  system state given its approximation over a language channel. We 
* evaluate the model in the context of zero-shot text-based adventure game learn
  * our model reaches the baseline's convergence performance point needing only
    15% of its iterations, 
    reaches a convergence performance point 15% higher than the baseline's, and
* we probe our new model's representation space
  * appropriate clustering of different linguistic mediation 
    into the same state

# Introduction

* Reinforcement learning (RL) learns policies: pick a right move at each state
* In particular Q-learning, the policy is to choose the maximum total reward
* Two key steps: game state understanding and action selection. 
  * Some games, e.g. Chess and Go, have perfect state information, 
    but the enormous number of states 
  * Other games, like action or text adventure video games, have 
    obscured game states, because the signal conveying the state (pixels on a
    screen or a continuous stream of text) is only an approximation
  * In both of these cases the role of function approximation converts an
    inappropriate state signal (whether from sparseness or noisiness) into a
    state representation proxy that is amenable to adequate action prediction
* Deep Qlearning (Mnih+ 2013) primarily differs from classical Q-learning in
  * function approximation is accomplished by a multi-layer network, e.g. a
    * Convolutional Neural Network (CNN) over image frames for Atari games
      (Mnih+ 2013) and, 
    * for text adventure games, a CNN (Zahavy+ 2018; Yin and May, 2019a) or
      Long Short-Term Memory LSTM (Hochreiter and Schmidhuber, 1997) over the
      sequences of text provided by game state and player input (Narasimhan+
      2015; Yuan+ 2018)
    * cannot easily transfer their learning between games of different genres.
* We explicitly learning a text-to-state transformation; we do this with the
  Siamese Neural Network (SNN, Bromley+ 1994), which was previously applied in
  the context of object recognition in images (Koch+ 2015) and used for data
  augmentation when the label space is large but training data scarce for some
  classes. The approach is helpful in one-shot evaluations, as it learns the
  general and easily transferable property of abstracting away unimportant
  details from signal. Our novel model integrates SNNs into a Deep Q-learning
  framework which simultaneously learns the policy that solves games and robust
  language features that discriminate states from dialogues. 
* The SNN uses the same text encoder as the RL algorithm, 
  taking a pair of game dialogues as input, then 
  feeds the difference of two encoded states into a nonlinear binary classifier
  to tell if the input pair of dialogues represent identical states or not
  (Section 3). 
  * can be used to train with games for which some state information is
    possible, 
    then ... applied to games where state information is no longer available.
* our model also contains a novel factorization of the policy calculation
  * distinguish between rewards that have different levels of time-sensitivity,
    which is crucial for good behavior in our multitask environment 

## 5.3 Clustering Evaluation

Since DQN models cannot be evaluated for their SNN classification ability, we
use the clustering method to compare the learned features among model all
learned models. 
The evaluation metric is Vmeasure (Rosenberg and Hirschberg, 2007). The
  * a combination of homogeneity score and completeness score of clusters, and
    computationally similar to the F-score. 
    * Homogeneity means each cluster should contain only one-class of
    * completeness means each cluster should contain all of these one-class
  * weighted over these two measures. These measures give scores between 0 & 1
