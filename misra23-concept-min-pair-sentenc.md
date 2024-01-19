COMPS: Conceptual Minimal Pair Sentences for testing
  Robust Property Knowledge and its Inheritance in Pre-trained Language Models
Kanishka Misra, Julia Rayz, Allyson Ettinger
EACL 2023

code and data at: https://github.com/kanishkamisra/comps

# Abstract

* inheritance of properties (can breathe) from superordinate concepts (animal)
  to their subordinates (dog)—ie demonstrate property inheritance. In this
* we present COMPS, a collection of minimal pair sentences that jointly tests
  pre-trained language models (PLMs) on their ability to attribute properties
  to concepts and their ability to demonstrate property inheritance behavior
* Analyses of 22 different PLMs on COMPS reveal that they can
  * easily distinguish between concepts on the basis of a property when they
    are trivially different, but find it
  * relatively difficult when concepts are related on the basis of nuanced
    knowledge representations.  Furthermore, we find that PLMs can show
  * successful property inheritance in simple contexts, but
  * fail in the presence of distracting information: sometimes below chance

# 1 Intro

* inheritance crucial to lang understand (Murphy, 2002; Lake and Murphy, 2021),
* pre-trained language models stride in eliciting
  * general knowl about real world concepts & entities (Petroni+ 19; Weir+ 20)
  * isomorphism with real world abstractions like direction and color
    (Abdou+ 2021; Patel and Pavlick, 2022)
  * robustness has recently been called to question, owing to failures
    * reporting bias (Gordon and Van Durme, 2013; Shwartz and Choi, 2020),
    * lack of consistency (Elazar+ 2021; Ravichander+ 2020), and
    * sensitivity to lexical cues
      (Kassner and Schütze, 2020; Misra+ 2020; Pandia and Ettinger, 2021)
* we introduce Conceptual Minimal Pair Sentences (COMPS), a collection of
  English minimal pair sentences, where
  * each pair attributes a property (can fly) to two noun concepts: one which
    actually possesses the property (ROBIN), and one which does not (PENGUIN)
  * standard practice in the minimal pairs evaluation paradigm (Warstadt+ 2020)
    we test whether PLMs prefer sentence stimuli expressing correct property
* COMPS can be decomposed into three subsets, each containing stimuli that
  progressively isolate deeper understanding of the task of attributing
  properties to concepts, by adding controls for more superficial heuristics
  1. COMPS BASE—measures the extent to which PLMs attribute properties to the
    * varying the similarity of the positive (ROBIN) and the negative concepts
      (PENGUIN [high] vs. TABLE [low])
    * This controls for the possibility that models are relying on
      coarse-grained concept distinctions
  2. COMPS WUGS set introduces a novel concept, WUG, expressed as the
    * if a model successfully prefers (1a) over (1b), it should also prefer a,
      a. A wug is a robin. Therefore, a wug can fly
      b.  `*`A wug is a penguin. Therefore, a wug can fly
  3. COMPS WUGS DIST, combines the aforementioned controls by using
    negative concepts as distracting content and
    inserting them into the COMPS WUGS stimuli
    * Specifically, we transform the stimuli of COMPS WUGS by creating
    * two subordinates for every minimal pair; one for the positive concept
      (ROBIN, subordinate: WUG) and the other for the negative concept
      (PENGUIN, subordinate: DAX), which acts as a distractor. This way, we
      control for the possibility that models may be relying on simple word
      associations between content words—of which there are only two in the
      prior tests—by introducing additional, irrelevant but contentful words
      into the context
    * models should (3a) > (3b), given that (1a) > (1b)
      a. A wug is a robin. A dax is a penguin. Therefore, a wug can fly
      b. `*`A wug is a robin. A dax is a penguin. Therefore, a dax can fly
  * Together, the three sets of stimuli tease apart more superficial predictive
    behaviors, such as contextual word associations, from more robust reasoning
    behaviors based on understanding of concept properties. While we can expect
    superficial predictive strategies to be brittle in the face of shallow
    perturbations and irrelevant distractions, robust property knowledge and
    reasoning behaviors should not
* We use COMPS to analyze robust property knowledge and its inheritance in
  22 different PLMs, ranging from small masked language models to
  billion-parameter autoregressive language models
  * In our experiments with COMPS BASE, we find PLMs to demonstrate strong
    performance in attributing properties to the correct concepts in our
    * hE When the concept pairs are similar (on the basis of different
      knowledge representations), we find models’ performance to degrade
      substantially, by as much as 25 points
  * a similar trend in our analyses on COMPS WUGS—models first appear to show
  * overall performance declines drastically when investigated in the presence
    of distractors (ie, on COMPS WUGS ~ DIST)
  * failure is particularly pronounced in larger autoregressive PLMs, whose
    * performance in fact drops below chance in cases where distracting
      information is proximal to the queried property, indicating the
      presence of a proximity effect. Together, our findings highlight
