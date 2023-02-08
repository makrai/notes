PPM-Decay: A computational model of auditory prediction with memory decay
Peter MC Harrison, Roberta Bianco, Maria Chait, Marcus T Pearce
PLoS Comput Biol. 2020 Nov; 16(11): e1008304

model is available in open-source R package, https://github.com/pmcharrison/ppm

# Abstract

* Statistical learning and probabilistic prediction auditory cognition
* comput model of these processes is Prediction by Partial Matching (PPM),
* a variable-order Markov model that
  learns by internalizing n-grams from training sequences
* hE limitations as a cognitive model: in particular, it has a
  perfect memory that weights all historic observations equally, which is
  inconsistent with memory capacity constraints and recency effects observed
* We address these limitations with PPM-Decay, a new variant of PPM that
  introduces a customizable memory decay kernel
* three studies, one with
  artificially generated sequences, one with
  chord sequences from Western music, and one with
  new behavioral data from an auditory pattern detection experiment—we show
* this decay kernel improves the model’s predictive performance for sequences
  whose underlying statistics change over time, and enables the model to
  capture effects of memory constraints on auditory pattern detection

# 1 Intro

* The Prediction by Partial Matching (PPM) algorithm is a powerful approach for
  modeling this sensitivity to sequential structure
  * a variable-order Markov model originally developed for data compression
    [17] that predicts successive tokens in symbolic sequences on the
  * The power of PPM comes from combining together multiple n-gram models with
    different orders (ie different values of n), with the
  * weighting of these different orders varying according to the amount of
    training data available.  This combination process allows PPM to
  * retain reliable performance on small training datasets while
  * outperforming standard Markov chain models with larger training datasets
* PPM algorithm has been adopted by cognitive scientists and neuroscientists
  as a cognitive model for how human listeners process auditory sequences. The
  * particularly useful in modeling music perception, forming the
  * basis of the Information Dynamics Of Music (IDyOM) model of [18] which has
    * IDyOM successfully applied to diverse musical phenomena
      eg melodic expectation [19], emotional experience [20],
      similarity perception [21], and boundary detection [22]. More recently,
  * PPM algorithm has been applied to non-musical auditory modeling, including
    * acquisition of auditory artificial grammars [5] and the
      detection of repeating patterns in fast tone sequences [3]
* These cognitive studies use PPM as an idealor rational-observer model
  * ie simulates a theoretically optimal strategy for performing the task. This
  * a benchmark against which human performance can be measured; deviations
  * In artificial experimental paradigms, where the stimuli are generated
    according to a prespecified formal model, it is often possible to derive a
    ‘true’ ideal-observer model that provably attains optimal performance
  * hE, in naturalistic domains (eg music, language) no access to the true
    model that generated the stimuli, and so it is
    not possible to construct a provably optimal ideal-observer model
    * unlikely that the participant’s cognitive processes reflect a strategy
      perfectly tailored to the exact experimental task; instead, they are
      likely to reflect general principles that tend to work well for
      naturalistic perception. PPM is typically applied in these latter
      contexts: it does not constitute the provably optimal observer for most
      particular tasks, but it represents a rational model of predictive
      processing that is assumed to approximate ideal performance for a broad
      variety of sequential stimuli
  * hE2: historic observations receiving equal salience to recent observations
    This is problematic for two reasons. First, it means that
    * the model performs suboptimally on sequences where the underlying
      statistical distribution changes over time. Second, it means that the
    * not capture how human memory separates into distinct stages with
      different capacity limitations and temporal profiles, and the way that
      these different stages interact to determine cognitive performance
      [23–25]
* Some sequence modeling approaches from the cognitive literature do
  incorporate phenomena such as recency effects and capacity limits
  * [26]: hand-crafted model for expectations elicited by symbolic sequences
    that incorporates an exponential-decay component
  * [27] and [28]: Bayesian inference approaches where
    continuous observations are assumed to be generated from Gaussian
    distributions whose underlying parameters change at unknown points, a
    * the optimal infer strategy involves downweighting historic observations
    * [28] model additionally incorporates a fixed bound on memory capacity and
      a perceptual noise parameter, improving its cognitive plausibility
  * [29] describe a similar approach with categorical observations generated by
    a first-order Markov model
  * [30] model similar data using both
    a hierarchical Bayesian model and a simpler exponential-decay model
  * [31] present participants with sequences of synthetic face images, and
    model resulting brain activity with an exponential-decay memory model
  * These studies demonstrate the importance of recency effects for seq model
  * hE the resulting models generally cannot learn the kinds of higher-order
    statistics that PPM specializes in
* Some approaches from the natural language processing literature also
  incorporate recency effects
  * Here the motivation is primarily ‘model adaptation’, helping the model to
    respond to changing statistics in the data being modeled; a useful
    byproduct can be reducing the computational resources required by the
    implementation. A recency effect with a particularly efficient
    implementation is
    exponential decay, which has been applied to a variety of model types eg as
    trigram word models [32, 33], Web search term recurrence models [34], topic
    models [35], data streaming models [36], and hidden Markov models [37]
  * Related heuristics are the
    sliding window of the Lempel-Ziv data compressor [38] and the
    nonstationary update rule of the PAQ compressor [39]
  * hE, these models have yet to be integrated into mainstream cog modeling
    * having been primarily optimized for engineering applic rather than cog
* In the specific context of PPM, some attempts have been made to implement
  memory bounds and recency effects
  * Moffat’s [40] implementation allocated a fixed amount of storage space to
    the trie data structure used to store observed data, and rebuilt this tree
    from scratch each time this storage limit was exceeded, after [41]. This
    * may be computationally efficient but it has limited cognitive validity
  * [42]: a technique whereby two PPM models would be trained, a long-term
    model and a short-term model, with the
    long-term model retaining training data from all historic sequences and the
    short-term model only retaining training data from the current sequence
    The predictions from these two models would then be combined to form one
    probability distribution
    * works well for capturing the distinction between the
      structural regu characterizing a domain (eg a musical style, a language)
      statistical regularities local to a given item from the domain (eg a
      musical composition or a specific text), but it
      hE cannot capture recency effects within a given sequence or
      distinguish between historic sequences of different vintages
* Here we present a new version of the PPM algorithm: ‘PPM-Decay’
  * decay kernel that determines the weighting of historic data as a function
    of various parameters, typically
    * the time elapsed since the historic observation, or 
    * the number of subsequent observations (Fig 1)
  * stochastic noise into memory retrieval, allowing the model to capture
    analogous imperfections in human memory. We have developed an
* open-source implementation of the model in C++, made available in the R
  package ppm and released under the MIT license, that allows the user to
  configure and evaluate different variants of the PPM-Decay model on sequences
* experiments corresponding to a variety of task domains
  * Experiment 1 simulates the prediction of sequences generated from a
    prespecified statistical model, and shows that
    incorporating memory decay improves the predictive performance of PPM for
    sequences when the underlying model parameters change over time
  * Experiment 2 simulates the prediction of chord sequences from three musi-
    cal styles, and shows that
    a decay profile with a non-zero asymptote is useful for capturing a
    combination of statistical regularities specific to the current composition
    and statistical regularities general to the musical style
  * Experiment 3 models new empirical data from human listeners instructed to
    detect repeated patterns in fast tone sequences, and shows that
    a multistage decay kernel is useful for explaining human performance
  * Together these experiments speak to the utility of the PPM-Decay algorithm
    as a cognitive model of symbolic sequence processing
