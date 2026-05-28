Using Computational Models to Test Syntactic Learnability
Wilcox, Ethan Gotlieb, Futrell, Richard and Levy, Roger. 
2022 Linguistic Inquiry. MIT Press hdl.handle.net/1721.1/150009

# Abstract

* We study the learnability of English filler–gap dependencies and the “island”
  constraints on them 
  by assessing the generalizations made by autoregressive (incremental) LMs that
  use deep learning to predict the next word given preceding context. Using
* factorial tests inspired by experimental psycholinguistics, we find that
* models acquire not only/but
  * the basic contingency between fillers and gaps, but also 
  * the unboundedness and hierarchical constraints implicated in the dependency.
* We evaluate a model’s acquisition of island constraints by demonstrating that
  its expectation for a filler–gap contingency is attenuated within an island
  environment. Our results provide empirical evidence against the Argument from
  the Poverty of the Stimulus for this particular structure.

## 3.3 Models Tested

* The second model, originally presented by Gulordava+ (2018), which we thus we
  refer to as GRNN, was selected for its previous success at embedding network.
  * trained on 90 million tokens of English Wikipedia, and has 
  * two 650-unit hidden layers.

# 6 General Discussion 49

* In this section, we first discuss the issue of how and why the models are
  learning what they do, arguing that .

## 6.1 How Are the Models Learning?

* similarities in models’ generalizations despite their architectural
  differences can be best understood through their objective function, which is
  to increase data likelihood
* questions adapted from Pearl and Sprouse (2013a) addressing their own
  computational model of island acquisition: Why does the system 
  * attempt to learn dependencies between tokens or sequences of tokens? 
  * attempt to learn constraints on those dependencies? and 
  * treat wh-dependencies as separate from 
    other dependencies, like RC dependencies and binding dependencies?  Before
* three properties of our models: 
  * First, as discussed in Section 3.3, 
    all of our models are weakly-biased and domain general learners, with 
    no evidence for natural-language like syntactic biases.
  * Second, the different neural networks vary widely in their assumptions about
    how the pieces of input data are related to each other and 
    how the input data should be represented: 
    * GRNN represents each word as a single token, 
      GPT-2 and GPT-3 break words down into sub-word units, and 
      JRNN processes each word as a character string using a separate CNN comp
    * In terms of the relationship among pieces of data, 
      * the two LSTM models understand the individual token-to-token
        relationships as unfolding through incremental state updates, which is
        intended to model time, whereas 
      * Transformers maintain a fully-connected network of relationships where
        each token is assigned a time ‘index.’ 
  * Third, neural networks in general, and our models in particular, are
    well-established to acquire representations that correspond to various
    levels of linguistic abstraction (Belinkov+ 2017; Belinkov and Glass, 2019).
    * LSTM models have been shown to capture syntactic part of speech (Blevins
      et al., 2018), and 
    * for transformers (including GPT-2 models) different attention heads
      specialize at processing different parts of speech as well as different
      dependencies (Vig and Belinkov, 2019).
* we can turn to the questions posed above, which we address by articulating the
  horns of the learnability debate: 
  Because the abstractions on which these dependencies operate are justified
  given the models’ inductive bias by the distributional structure of the data,
  and with these abstractions available, 
    co-variation between these categories is learned either/or because 
    * it is favored by the inductive bias, or 
    * learning these dependencies improves data likelihood. Since we know that 
  * no model architecture tested here has an obvious strongly natural language
    syntax oriented inductive bias, and, despite some differences, we find many
    similar results with multiple architectures that make different choices
    about both input representation and the relationship between these inputs,
    the most plausible conclusion is that data likelihood drives learning.
* Thus, in response to the first two questions, our hypothesis is that 
  each model learns the constrained co-variation between fillers and gaps
  because it is a generalization available within the hypothesis space
  determined by the model architecture that that allows it to successfully shift
  probability mass away from unlikely sentences and place more weight on
  sentences that are more likely to occur.
* The response to the third question (“Why does the system treat wh-dependencies
  as separate from other dependencies”) is similar. Given 
  * previous work demonstrating that individual featural dependencies are
    tracked by individual neurons (Lakretz+ 2019; Giulianelli+ 2018), 
    it is likely that the respective distributions that characterize each type
    of dependency are sufficiently distinct that they are represented
    differently in the network.
  ~> the inductive bias either/or 
  does not favor generalizing constraints from one dependency to others, or 
  such generalization hurts data likelihood. 
* In sum, the type of answer we propose for the explaining the success of our
  models stems from the nature of their objective function of maximizing data
  likelihood.
  * can be related to the success of other, more transparent models that use
    data likelihood maximization to tackle issues of learnability, 
    eg the model proposed for the acquisition of subject-auxiliary inversion in
    Perfors+ (2006).

## 6.2 Possible Concerns

## 6.3 Argument from the Poverty of the Stimulus 

# 7 Conclusion

* we: assessing the capabilities of Artificial Neural Network models by testing
  them similarly to how one would test a human subject in a pling experiment
  * test suites that mimic online processing experiments in humans makes it
  * test any model that makes incremental predictions about language, 
    even ones whose internal states are opaque, such as RNNs and Transformers.
  * can be used to test learning outcomes over a wide array of synt structs. Our
* these weakly-biased models acquire impressively sophisticated generalizations
  regarding the filler–gap dependency and island constraints from even a
  childhood’s quantity of linguistic input, though 
  * in some cases we find acquisition failures. It is our hope that this method

* Island 
  * Yes extraction 
  * No extraction
* Adjunct islands 
  * Korean, Japanese, Malayalam (Yoshida, 2006)
  * Hungarian, Russian, Spanish, Basque (Yoshida, 2006) English, Italian, Por-
    tuguese, French, German (Sprouse and Hornstein, 2013)
* Complex NP islands 
  * Swedish, Danish, Norwegian (Engdahl, 1982; Engdahl+ 1997); Japanese
    (contested) (Kuno, 1973) 
  * Serbo-Croatian, Greek, English (Bošković, 2015); Italian, Spanish,
    Portuguese, French, German, Russian, Hungarian (Sprouse & Hornstein, 2013)
* Coordination islands 
  * None — but whole conjunct extraction proposed for: Japanese, Korean,
    Serbo-Croatian, Russian, Old English, Latin (Oda, 2017) 
  * All languages (Bošković, 2020) (extraction out of conjuncts)
* Left branch islands 
  * Russian, Polish, Czech (Corver, 1991) 
  * English, Dutch (Corver, 1991)
* Sentential subject islands 
  * Palauan, Malagasy, Chamorro, Japanese, Akan, Tuki (Sabel, 2002) 
  * English
* Subject islands 
  * Japanese, Navajo, Turkish, Russian (Stepanov, 2007); Hungarian (Kiss, 2013);
    Palauan (Georgopoulos, 1991) 
  * Norwegian, Italian (Sprouse+ 2016); English, French (Sprouse & Hornstein,
    2013)
* Wh-islands 
  * Italian (Rizzi, 1982); Spanish, Portuguese (Sprouse & Hornstein, 2013);
    Scandinavian languages (Maling, 1978) 
  * English, German, Russian (Sprouse & Hornstein, 2013)
