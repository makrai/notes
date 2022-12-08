Attention Flows are Shapley Value Explanations
Kawin Ethayarajh, Dan Jurafsky
ACL | IJCNLP 2021

# Abstract

* Shapley Values,
  * a solution to the credit assignment problem in cooperative game theory,
  * a popular type of explanation in machine learning, having been used to
    explain the importance of features, embeddings, and even neurons
  * hE In NLP, leave-one-out and attention-based explanations still predominate
  * many desirable theoretical qualities
* Can we draw a connection between these different methods?
  * We formally prove that — save for the degenerate case —
    attention weights and leave-one-out values cannot be Shapley Values
  * Attention flow is a post-processed variant of attention weights
    * obtained by running the max-flow algorithm on the attention graph
    * are indeed Shapley Values, at least at the layerwise level
    * should be adopted alongside more traditional ones

# 1 Intro

* model prediction as a cooperative effort between the potential subjects of an
  explanation (eg input tokens) (Lundberg and Lee, 2017)
  * how should we allocate the credit for a prediction, given that
    some subjects contribute more than others
    (eg the sentiment words in sentiment classification)?
* Shapley Value is a solution to this problem
  * uniquely satisfies several criteria for equitable allocation
    (Shapley, 1953)
  * widely adopted by the ML community
    * to analyze the importance of features, neurons, and even training data
      (Ghorbani and Zou, 2019, 2020)
* eg consider a token whose masking out does not impact the prediction
  * regardless of how many other tokens in the sentence are also masked out
  * In game theory, such a token would be called a null player,
    whose Shapley Value is guaranteed to be zero (Myerson, 1977; Young, 1985)
* we first prove that — save for the degenerate case —
  attention weights and leave-one-out values cannot be Shapley Values
  * More formally, there is no
    * set of players (ie possible subjects of an explanation, such as tokens)
    * payoff (ie function defining prediction quality) such that
    the values induced by attention or leave-one-out
    also satisfy the definition of a Shapley Value
* attention flow, a post-processed variant of attention weights
  * obtained by running the max-flow algorithm on the attention graph
    (Abnar and Zuidema, 2020). We prove that
  * when the players all come from the same layer (eg tokens in the input lay)
    there exists a payoff function such that attention flows are Shapley Values
* we can extend the theoretical guarantees associated with the Shapley Value
  * these guarantees are axioms of faithful interpretation, and having them can
    increase confidence in interpretations of black-box NLP models
* NLP practitioners should use attention flow-based explanations
  alongside more traditional ones, such as gradients (Feng+ 2018; Smilkov+ 2017)
* We conclude by discussing some of the limitations in calculating Shapley
  Values for any arbitrary player set and payoff function in NLP

# 3 Attention Weights

* Many have argued that attention weights
  * not a faithful explanation, on the basis of
    * consistency (ie poor correlation with other importance measures) and
    * non-exclusivity (ie multiple explanations leading to the same outcome)
    (Jain and Wallace, 2019). Others have countered that they
  * have some utility (Wiegreffe and Pinter, 2019). Without making assumptions

# 4 Attention Flows

* Abnar and Zuidema (2020) proposed treating the self-attention graph as a flow
  network — where the attention weights are capacities — and then applying a
  max-flow algorithm (Ford and Fulkerson, 1956) to this network to calculate
  the maximum flow on each edge
* We prove (by construction) that these attention flows are Shapley Values
  when the players are restricted to those from the same layer and
  the payoff is the total flow, as visualized in Figure 1

## Attention Rollout

* Abnar and Zuidema (2020) also proposed another post-processed variant of att
* the attention weight matrices from each layer are multiplied with those before
  it to get aggregated attention values. Attention roll-out values
* cannot be Shapley Values

# 6 Applications

* Data Shapley — an extension of the Shapley Value — to
  * estimate the contribution of each example in the training data
    to a model’s decision boundary (Ghorbani and Zou, 2019). If we’re finetuning
    BERT for sentiment classification, for example, we might want to know which
    sentence is more helpful: “This movie was great!” or “This was better than I
    expected.” We can answer such questions by using the Data Shapley. To our
    knowledge, this has been done in computer vision but not in NLP

# 7 Limitations

* this equivalence only holds for a specific payoff function — the total flow
  through a layer — which is reflective of model confidence but not of the
  prediction correctness
* But why do we need attention flows at all if, in theory, Shapley Values can be
  calculated for any arbitrary player set and payoff function? While this is
  * because of the combinatorial calculation it is computationally intractable
    in most cases.  While it is possible to take a Monte Carlo estimate, in
    practice the bounds can be quite loose (Maleki et al., 2013)
* Finding TU-games for which the Shapley Value can be calculated exactly in
  polynomial time — as with attention flow -– is an important future work  These
  * may come with trade-offs
    eg SHAP is a kind of Shapley Value that assumes contributions are linear
    (ie a coalition can’t be greater than the sum of its parts), which makes
    * much faster to calculate but restricts the set of possible payoff
      functions (Lundberg and Lee, 2017).  Still, such methods
  * will be critical to providing explanations that are both fast and faithful
