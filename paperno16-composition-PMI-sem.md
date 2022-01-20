When the Whole Is Less Than the Sum of Its Parts: How Composition Affects PMI Values in Distributional Semantic Vectors
Denis Paperno and Marco Baroni
Computational Linguistics Volume 42 | Issue 2 | June 2016 p.345-350

# Abstract

* compositional distributional models, which derive vectors for phrases from
  representations of their constituent words (Mitchell and Lapata 2010)
* we study the relation between the PMI "dimensions" (végig koordinátákat ért
  alatta) of a phrase vector and its components in order to gain insights into
  which operations an adequate composition model should perform. We show
* the difference between the PMI dimension of a phrase vector and
  the sum of PMIs in the corresponding dimensions of the phrase’s parts
  is an independently interpretable value, namely,
  a quantification of the impact of the context associated with the relevant
  dimension on the phrase’s internal cohesion, as also measured by PMI
* We then explore this quantity empirically in adjective–noun composition
* Conclusions
  * based on the mathematical definition of PMI,
    addition is a systematic component of PMI vector composition
  * The remaining component is also an interpretable value,
    measuring the impact of context on the phrase’s internal PMI
    * typically negative
* Empirical observations about adjective-noun phrases show that
  * systematic deviations from addition are
    largely accounted for by a negative shift ∆_c PMI(ab), which
  * might be proportional to the composed vectors’ dimensions
    (as partially captured by the weighted additive method)

# 2. A General Result on the PMI Dimensions of Phrases 2

* When vectors encode PMI values, for each context c, the composition model has
  to predict PMI(ab, c) between phrase ab and context c
* Equation (1) PMI(ab, c) = = PMI(a, c) + PMI(b, c) + PMI(ab | c) − PMI(ab)
* additive approach to composition: PMI(ab, c) = PMI(a, c) + PMI(b, c)
  * Indeed, shifted by some correction ∆ c PMI(ab) = PMI(ab | c) − PMI(ab),
    measuring how the context changes the tendency of two words a, b to form a
    phrase

# 3. Empirical Observations 3

* how well actual vectors of English phrases fit the additive ideal,
  and, how good the existing composition methods are at predicting deviations

## 3.2 Divergence from Additive

* PMI(ab, c) has a strong tendency to be lower than the sum of PMI of the
  phrase’s parts with respect to the same context
* In our sample, average PMI(AN, c) was 0.80, and
  average PMI(A, c) and PMI(N, c) were 0.55 and 0.63, respectively
* Over 70% of positive PMI values in our sample are lower than additive (PMI(AN,
* reason comes from the information-theoretic nature of PMI. Recall that
  * PMI(ab) measures how informative phrase components a, b are about each other
  * context diminishes the mutual information of a and b. And indeed it is only
    * the context itself is usually informative in multiple ways. In one typical
      * the two words being composed (and the phrase) share the context topic
        (e.g., logical and _operator_ in the context of calculus, connected by
        the topic of mathematical logic)
* not symmetric
* In our sample, positive PMI values cover over half the co-occurrence table;
  * two words in a phrase will often disambiguate each other, making the phrase
    less probable in a given context than expected from the probabilities of its
    parts: _logical operator_ is very unlikely in the context of automobile even
* we obtained shifted vectors by computing, for each dimension, the average
  deviation from the additive model in the training data

## 3.3 Approximation to Empirical Phrase PMI by Composition Models

* addition is behind other models, even behind the multiplicative method, which,
  unlike others, has no theoretical motivation. The
  * relatively good result of the multiplicative model can be explained through
    the patterns observed earlier:
  * PMI(AN,c) is typically just above PMI(A,c) and PMI(N,c) for each of the
  * Adding PMI(A,c) and PMI(N,c) makes the prediction further above the observed
  * product is below it. As one could expect,
  * shifted addition is on average closer to actual PMI values than plain add.
  * Weighted addition, on the other hand, brings about large improvements in
    approximating precisely the negative subset. Weighted addition is
    * the best model overall, outperforming the parameter-rich full additive and
      lexical function models (the former only by a small margin)
* As discussed before, the observed deviation from additive PMI is
      mostly negative, due partly to the shared underlying topic effect and
      partly to the disambiguation effect

# 4. Conclusions

* future: other constructions and types of context
  to confirm the generality of our results
