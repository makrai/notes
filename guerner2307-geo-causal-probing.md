A Geometric Notion of Causal Probing
Clément Guerner, Anej Svete, Tianyu Liu, Alexander Warstadt, Ryan Cotterell
arXiv:2307.15054 [cs.CL]

# Abstract

* The linear subspace hypothesis (Bolukbasi+ 2016)
  * in a language model's representation space, all information about a concept
    eg verbal number is encoded in a linear subspace
* auxiliary classification tasks to identify and evaluate candidate subspaces
  that might give support for this hypothesis 
* We: intrinsic criteria which characterize an ideal linear concept subspace
  * identify the subspace using only the language model distribution
  * information-theoretic framework accounts for spuriously correlated features
    in the representation space (Kumar+ 2022)
  * we hypothesize a causal process for
    how a language model might leverage concepts during generation
  * LEACE (Belrose+ 2023) returns a one-dimensional subspace containing roughly
    half of total concept information under our framework for verbal-number
  * causal intervention for controlled generation shows that, 
    * for at least one concept, the subspace returned by LEACE can be used to
      manipulate the concept value of the generated word with precision
