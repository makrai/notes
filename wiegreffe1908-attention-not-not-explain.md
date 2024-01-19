Attention is not not Explanation
Sarah Wiegreffe, Yuval Pinter
EMNLP 2019 arXiv:1908.04626 [related blog post]
(https://medium.com/@yuvalpinter/attention-is-not-not-explanation-dbc25b534017)

* We urge NLP researchers to consider applying the techniques presented here on
  their models containing attention in order to evaluate its effectiveness at
  providing explanation. We offer our code for this purpose at
  https://github.com/sarahwie/attention as explanation in these cases

# Abstract

* Attention mechanisms play a central role in NLP systems, especially in RNNs
* whether the intermediate representations offered by these modules may be
  used to explain the reasoning for a model's prediction, and consequently
  reach insights regarding the model's decision-making process. A
* `Attention is not Explanation' (Jain and Wallace, 2019)
* We challenge many of the assumptions underlying this work, arguing that
  * depends on one's definition of explanation, and that
  * testing it needs to take into account all elements of the model, using a
    rigorous experimental design
  * four alternative tests to determine when/whether attention can be used as
    * a simple uniform-weights baseline
    * a variance calibration based on multiple random seed runs
    * a diagnostic framework using frozen weights from pretrained models
    * an end-to-end adversarial attention training protocol
  * Each allows for meaningful interpretation of attention mechanisms in RNNs
  * even when reliable adversarial distributions can be found,
    they don't perform well on the simple diagnostic, indicating that
    prior work does not disprove the usefulness of attention for explainability

# 1 Introduction

* Attention mechanisms (Bahdanau+ 2014) are nowadays ubiquitous in NLP, and
  * suitability for providing explanations for model predictions is a topic
    (Xu+ 2015; Rocktäschel+ 2015; Mullenbach+ 2018; Thorne+ 2019;
     Serrano and Smith, 2019)
* If they indeed offer such insights, many application areas would benefit by
  better understanding the internals of neural models that use attention as a
  * model debugging or architecture selection
* Jain and Wallace (2019) point to possible pitfalls that may cause researchers
  to misapply attention scores as explanations of model behavior, based on a
  premise that explainable attention distributions should be consistent with
  other feature-importance measures as well as exclusive given a prediction.1
  * Its core argument, which we elaborate in §2, is that if alternative attention
  distributions exist that produce similar results to those obtained by the
  original model, then the original model’s attention scores cannot be reliably
  used to “faithfully” explain the model’s prediction
  * Empirically, the authors show that achieving such alternative distributions
    is easy for a large sample of English-language datasets
* We contend (§2.1) that while Jain and Wallace ask an important question,
  and raise a genuine concern regarding potential misuse of attention
  * some key assumptions used in their experimental design leave an implausibly
    large amount of freedom in the setup, ultimately leaving
  * for practitioners, no applicable way for measuring the utility of attention
    distributions in specific settings
* We apply a more model-driven approach to this question, beginning (§3.2) with
  testing attention modules’ contribution to a model by applying a simple
  baseline where attention weights are frozen to a uniform distribution. We
  * for some datasets, a frozen attention distribution performs just as well as
    learned attention weights, concluding that randomly~ or
    adversarially-perturbed distributions are not evidence against attention
* fig 1: Our four quantitative experiments are illustrated
  * each bracket on the left covers the components in a standard
    RNN-with-attention architecture which we manipulate in each experiment

## 3.3 examine the expected variance in attention-produced weights
  by initializing multiple training sequences with different random seeds,
  allowing a better quantification of how much variance can be expected in
  trained models. We show that considering this background stochastic
  variation when comparing adversarial results with a traditional model allows
  us to better interpret adversarial results

## 3.4 a simple yet effective diagnostic tool which tests
  attention distributions for their usefulness by using them as frozen weights
  in a non-contextual multi-layered perceptron (MLP) architecture. The
  favorable performance of LSTM-trained weights provides additional support for
  the coherence of trained attention scores. This demonstrates a sense in which
  attention components indeed provide a meaningful model-agnostic
  interpretation of tokens in an instance
* Figure 1: Schematic diagram of a classification LSTM model with attention,
  including the components manipulated or replaced in the experiments
  performed in Jain and Wallace (2019) and in this work (by section)

# 4 a model-consistent training protocol for finding
  adversarial attention weights, correcting some flaws we found in the previous
  approach. We train a model using a modified loss function which takes into
  account the distance from an ordinarily-trained base model’s attention scores
  in order to learn parameters for adversarial attention distributions. We
  believe these experiments are now able to support or refute a claim of
  faithful explainability, by providing a way for convincingly saying by
  construction that a plausible alternative ‘explanation’ can (or cannot) be
  constructed for a given dataset and model architecture
* We find that while plausibly adversarial distributions of the consistent
  kind can indeed be found for the binary classification datasets in question,
  they are not as extreme as those found in the inconsistent manner, as
  illustrated by an example from the IMD B task in Figure 2. Furthermore, these
  outputs do not fare well in the diagnostic MLP, calling into question the
  extent to which we can treat them as equally powerful for explainability

# 5 theoretical discussion on the defs of interpretability and explainability,

* we ground our findings within the accepted definitions of these concepts
* “Explainable AI” encompasses at least three distinct notions:
  * transparency, explainability, and interpretability
* Lipton (2016) categorizes
  * transparency, or overall human understanding of a model, and
  * post-hoc explainability
  * as two competing notions under the umbrella of interpretability
  * The relevant sense of transparency, as defined by Lipton (2016) (§3.1.2),
    * the way in which a specific portion of a model corresponds to a
      human-understandable construct (which Doshi-Velez and Kim (2017) refer to
      as a “cognitive chunk”). Under this definition, it should appear
  * sensible to treat attention scores as a vehicle of (partial) transparency
  * Attention mechanisms do provide a look into the inner workings of a model,
    as they produce an easily-understandable weighting of hidden states
* Rudin (2018) defines explainability as simply
  a plausible (but not necessarily faithful) reconstruction of the
  decision-making process, and
* Riedl (2019) classifies explainable rationales as valuable in that
  they mimic what we as humans do when we rationalize past actions:
  we invent a story that plausibly justifies our actions,
  even if it is not an entirely accurate reconstruction of the neural processes
* Distinguishing between interpretability and explainability
  * Rudin (2018) argues that interpretability is more desirable but more
    difficult to achieve than explainability, because it
    requires presenting humans with a bigpicture understanding of the
    correlative relationship between inputs and outputs (citing the example of
    linear regression coefficients)
* Doshi-Velez and Kim (2017) break down interpretability into further subcats,
  depending on the amount of human involvement and the difficulty of the task
* Lei+ (2016) train a model to simultaneously generate rationales and
  predictions from input text, using gold-label rationales for evaluation
  * many accept the notion of extractive methods such as Lei+ (2016), in which
    explanations come directly from the input itself (as in attention), as
    plausible. Works such as
* Mullenbach+ (2018) and Ehsan+ (2019) use human evaluation to eval explanat
  * Mullenbach+ based on attention scores over the input, and the
  * Ehsan+ based on systems with additional rationale-generation capability
  * shown: rationales generated in a post-hoc manner increase user trust
* Citing Ross+ (2017), Jain and Wallace’s requisite for attention distributions
  to be used as explanation is that
  there must only exist one or a few closely-related correct explanations for a
  model prediction
  * hE Doshi-Velez and Kim (2017) caution against applying evaluations and
    terminology broadly without clarifying task-specific explanation needs
* If we accept the Rudin and Riedl definitions of explainability as providing a
  * ie plausible, but not necessarily faithful rationale for model prediction,
    then the argument against attention mechanisms because they are not exclu-
    sive as claimed by Jain and Wallace is invalid, and
  * human evaluation (which Jain& do not consult) is necessary to evaluate the
    plausibility of generated rationales
  * Just because there exists another explanation does not mean that the one
    provided is false or meaningless, and under this definition
    the existence of multiple different explanations is not necessarily
    indicative of the quality of a single one
* Jain and Wallace define attention and explanation as
  measuring the “responsibility” each input token has on a prediction
  * This aligns more closely with the more rigorous (Lipton, 2016, §3.1.1)
    definition of transparency, or Rudin (2018)’s definition of
    interpretability: human understanding of the model as a whole rather than
    of its respective parts
* The ultimate question
  * do high attention weights on certain elements in the input lead the model
    to make its prediction?  This question is
  * left largely unanswered by prior work, as we address in previous sections
  * However, under the given definition of transparency, the authors’
    exclusivity requisite is well-defined and we find value in their
    counterfactual framework as a concept – if a model is capable of producing
    multiple sets of diverse attention weights for the same prediction, then
    the relationship between inputs and outputs used to make predictions is not
    understood by attention analysis
  * This provides us with the motivation to implement the adversarial setup
    coherently and to derive and present conclusions from it. To this end, we
    additionally provide our §3.4 model to test the relationship between input
    tokens and output
* In the terminology of Doshi-Velez and Kim (2017), our proposed methods
  provide a functionally-grounded evaluation of attention as explanation, ie
  an analysis conducted on proxy tasks without human evaluation. We believe the

# 6 Attention is All you Need it to Be

* the definition of explainability one is looking for:
  plausible or faithful explanations (or both)
* prior work focused on providing plausible rationales is
  * not invalidated by Jain and Wallace’s or our results. However, we have con-
* nL adversarial distributions can be found for LSTM models in some
  classification tasks, as originally hypothesized by Jain and Wallace. This
* ? looking to attention distributions for one true, faithful interpretation of
  the link their model has established between inputs and outputs. At the same
* we have provided a suite of experiments that researchers can make use of
  to make informed decisions about the quality of their models’ attention mechs
  when used as explanation for model predictions
* We’ve shown that
  alternative attention distributions found via adversarial training methods
  perform poorly relative to traditional attention mechanisms
  when used in our diagnostic MLP model
* ie trained attention mechanisms in RNNs on our datasets do in fact learn
  something meaningful about the relationship between tokens and prediction
  which cannot be easily ‘hacked’ adversarially
* future
  * the conditions under which adversarial distris can be found in practice
  * application on other tasks such as sequence modeling and multi-document
    analysis (NLI, QA); extension to
  * languages other than English; and adding a
  * human evaluation for examining the level of agreement with our measures. We
* theoretical analysis of attention models, motivating development of
  * analytical methods to estimate the usefulness of attention as an expl
    * based on dataset and model properties
