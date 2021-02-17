Functional Distributional Semantics
Guy Emerson and Ann Copestake
2016

# Intro

* vectors do not provide ‘natural’ composition operations
  that have clear analogues with operations in formal semantics,
  which makes it challenging to perform inference
* tensorial approach described by Coecke+ (2010) and Baroni+ (2014)
  * naturally captures argument structure
  * not allow an obvious account of context dependence, or logical inference
* Garrette et al. (2011) incorporate distributional information in a
  Markov Logic Network (Richardson and Domingos, 2006)

# 2 Formal Framework of Functional Distributional Semantics

## 2.1 Semantic Functions

* these functions do not directly define probability distributions over
  entities. Rather, they define binary-valued conditional distributions,
  given an entity. We can write this as P (t|x), where x is an entity, and t is
  a stochastic truth value. It is only possible to get a corresponding
  distribution over entities given a truth value, P (x|t), if we have some
  background distribution P (x)
* P (t|x) and P (x|t), we can distinguish between underspecification and
  uncertainty as two kinds of ‘vagueness’. In the first case, we want to state
  partial information about an entity, but leave other features unspecified;
* world knowledge belongs to the probability distribution over entities

# 3 Implementation

# 4 Training and Initial Experiments

## 4.3 Training Data

## 4.2 Evaluation

# 5 Related Work

* Coecke et al. (2010) and Baroni et al. (2014) introduce a
  * tensor-based framework that incorporates argument structure through tensor
    contraction
* However, for logical inference, we need to know how one vector can entail
  another
* Edward Grefenstette (2013) explores one method to do this;
  * [but] do not show that this approach is learnable from distributional
    information
  * they prove that quantifiers cannot be expressed with tensors
* Balkır (2014), working in the tensorial framework, ... quantum mechanical
* Vilnis and McCallum (2015) embed predicates as Gaussian distributions over
  vectors. By assuming covariances are diagonal,
  * does not naturally capture compositionality or argument structure ..
    because] they simply assume that nearby words have similar meanings
* In both Balkır’s and Vilnis and McCallum’s models, they use the probability
  of a vector given a word – in the notation from section 2.1, `P(x|t)`
  However, the opposite conditional probability, `P(t|x)`, more easily allows
  composition
  * we cannot easily combine `P(x|t_1)` and `P(x|t_2)` to get `P(x|t_1, t_2)`
  * In contrast, for semantic functions, we can write
    `P(t_1, t_2 |x) = P(t_1 |x) P(t_2 |x)`
* Gärdenfors (2004) argues concepts should be modelled as _convex subsets_ of a
  semantic space.  Erk (2009) builds on this idea,
* McMahan and Stone (2015) also learn representations directly, considering
  _colour terms_, which are grounded in a well-understood perceptual space
  * they use a probability distribution over subsets:
  * greenish [is] nonconvex in perceptual space,
  * our model assumes a direct mapping between predicates and semantic
* functions, with a relatively _simple_ generative structure determined by
  semantic dependencies
* Herbelot and Vecchi (2015) construct a mapping from a distributional vector
  to judgements of which _quantifier_ is most appropriate for a range of
  properties
* Erk (2016) uses distributional similarity to probabilistically infer
  properties of one concept, given properties of another
* Beltagy et al. (2016) use distributional similarity to produce weighted
  inference rules, which they incorporate in a Markov Logic Network
