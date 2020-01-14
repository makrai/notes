Richard Futrell, E Wilcox, TMorita, Peng Qian, Miguel Ballesteros, Roger Levy
Neural Language Models as Psycholinguistic Subjects:
  Representations of Syntactic State
arXiv preprint arXiv:1903.03260

# Abstract

* We deploy the methods of controlled psycholinguistic experimentation to [see
  whether] neural network language models [represent] syntactic state
  * artificial sentences, syntactically complex
  * We test four models:
    * two publicly available LSTM sequence models of English (Jozefowicz+ 2016;
      Gulordava+ 2018) trained on large datasets; an
    * RNNG (Dyer+ 2016) trained on a small, parsed dataset; and an
      * calculates Penn Treebank-style context-free syntactic reprs [in LM]
      * found to outperform LSTMs in
        * overall test-set perplexity (Dyer+ 2016), but also in
        * modeling long-distance number agreement in Kuncoro+ (2018)
    * LSTM trained on the same small corpus as the RNNG
* We find evidence that the LSTMs trained on
  * large datasets represent syntactic state over large spans of text
    in a way that is comparable to the RNNG, while the LSTM trained on the
  * small dataset does not or does so only weakly

# 1 Introduction

* sentence representations using neural sequence models of various kinds
  (Elman, 1990; Sutskever+ 2014; Goldberg, 2017; Peters+ 2018; Devlin+ 2018)
* studying neural language models using experimental techniques that were
  originally developed in the field of psycholinguistics
  * sentences chosen to probe particular aspects of the learned repr
  * approach was introduced by Linzen+ (2016),
  * (Bernardy and Lappin, 2017; Enguehard+ 2017; Gulordava+ 2018), who used an
  * agreement [egyeztetés] prediction task (Bock and Miller, 1991) to study
    * positive (Gulordava+ 2018). Subsequent work has extended this approach to
  * positive results for filler–gap dependencies
    (Chowdhury and Zamparelli, 2018; Wilcox+ 2018)
  * negative results for anaphoric dependencies (Marvin and Linzen, 2018)
* In this work, incremental syntactic state representations
  * targeted evaluation approach (Marvin and Linzen, 2018) to elicit ev-
    idence for syntactic state representations from language models. That is,
    we examine language model behavior on artificially constructed sentences
    designed to expose behavior that is crucially dependent on syntactic
  * complex subordinate clauses and garden path effects (based on
    mainverb/reduced-relative ambiguities and NP/Z ambiguities). We ask three
  * questions:
    1. Is there basic evidence for the representation of syntactic state?
    1. textual cues [used for] the beginnings and endings of such states?
    1. [are syntactic states maintained] over long spans of complex text?
