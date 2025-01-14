Pre-Learning Environment Representations for Data-Efficient Neural Instruction Following
David Gaddy, Dan Klein
ACL 2019

#Abstract

* learning to map from natural language instructions to state transitions
  (actions) in a data-efficient manner
  * idea: ground language to concepts that have already been formed through
    pre-linguistic observation
* We augment a
  baseline instruction-following learner with an
  initial environment-learning phase that uses observations of language-free
  state transitions to induce a suitable latent representation of actions
  before processing the instruction-following training data
  * ie mapping to pre-learned representations
  * substantially improves performance
    over syss whose reprs are learned from limited instructional data alone
