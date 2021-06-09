The Unstoppable Rise of Computational Linguistics in Deep Learning
James Henderson
ACL 2020, in the theme track arXiv:2005.06420 [cs.CL]

# Abstract

* we identify key contributions which the nature of language has made
  to the development of neural network architectures
  * variable binding and its instantiation in attention-based models
  * Transformer is not a sequence model but an induced-structure model
  * challenges facing research in deep learning architectures for NLU

# 1 Intro

* unbounded discrete structured representations !< vector-space representations
  * the successful uses of neural networks in computational linguistics
    * replaced specific pieces of computational-linguistic models with new NN
    * bring together continuous vector spaces with structured representations
* the process
  * insights from grammar formalisms about the nature of language, with their
    multiple levels, structured representations and rules
  * rules were soon learned with statistical methods
  * neural networks replace symbols with induced vectors, but
    * kept structured representations, such as syntactic trees
  * attention-based models have replaced hand-coded structures with induced str
    * multiple levels of structured representations, much as has always been

# 2 Grammar Formalisms versus Connectionism

## 2.1 Grammar Formalisms

* we will refer to the
  * sub-parts in each level of representation as entities,
  * labels as their properties, and
  * structure of inter-dependence as their relations
* specifications of the allowable structures may take the form of
  * hard constraints or soft objectives, or of deterministic rules or
    stochastic processes
  * we will refer to these specifications of allowable structures as rules
    * These rules may apply within or between levels of representation
* expressive power. Certain types of rules simply cannot be specified
  * differ across formalisms, but [there are] key principles (Joshi+ 1990)
  * the number of entities grows linearly with the length of the sentence
  * each level can have at most a number of entities which is linear in the
    number of entities at the level(s) below

## 2.2 Connectionism 2

* multi-layered perceptrons (MLPs, Rumelhart+ 1986b),
* connectionism: an approach to modelling cognitive phenomena
  * MLPs are arbitrary function approximators (Hornik+ 1989)
  * backpropagation learning (Rumelhart+ 1986a) in neural network models
  * Simple Recurrent Networks (SRNs, Elman, 1990)
  * many argued that the complex discrete structured representations were
    neither necessary nor desirable
    (Smolensky (88, 90); Elman (91); Miikkulainen (93); Seidenberg (2007))
  * more recent (Collobert and Weston, 2008; Collobert+ 2011; Sutskever+ 2014)
* problems with vector-space representations of cognitive phenomena
  * variable binding
    * how a simple vector could encode features of more things at a time
    * If we see a red square together with a blue triangle, how do we represent
    * vector elements for red, blue, square and triangle would all be active
    * in symbolic reprs: red(x) ∧ triangle(x) ∧ blue(y) ∧ square(y)
    * Temporal Synchrony Variable Binding
      (von der Malsburg, 1981; Shastri and Ajjanagadde, 1993)
      * the precise timing of neuron activation spikes could be used
      * Neural spike trains have both a phase and a period, so the
        * phase could be used to encode variable binding
        * period to be used for sequential computation
  * regularities found in natural language
    * Fodor and Pylyshyn (1988) argued that
    * systematicity (see also (Smolensky, 1990; Fodor and McLaughlin, 1990))
      * requires that learned rules generalise in a way that respects
        structured representations
      * representing the structural relationships between these entities
  * significance of variable binding for solving the issues with systematicity
    (Henderson, 1994, 1996, 2000)
    * relations were not stored explicitly, it was claimed that for NLU
      it is adequate to recover them from the features
    * arguments were largely theoretical, [not] incorporated in learning

## 2.3 Statistical Models 3

* first successes from learning rules with statistical methods, such as
  part-of-speech tagging with hidden Markov models
* the Penn Treebank [and] many statistical models which learned the rules
  (Collins, 1997, 1999; Charniak, 1997; Ratnaparkhi, 1999)
* required linguistically-motivated designs to work well
  * feature engineering is necessary
  * [the appropriate] space of rules

# 3 Inducing Features of Entities

* neural network was used to model one component within a symbolic NLP model
* first empirical success was on language modelling, Bengio+ (2001, 2003)
  * improvements when interpolated with a statistical n-gram language model
* [distribution vector] in non-neural statistical models earlier
  (Deerwester+ 90; Schütze, 93; Burgess, 98; Padó and Lapata, 2007; Erk, 2010)
* For syntactic parsing,
  * early connectionist approaches (Jain, 1991; Miikkulainen, 1993;
    Ho and Chan, 1999; Costa+ 2001) had limited success
  * first success: RNN to model the derivation struct (Henderson, 2003, 2004)
    * model the sequence of parser actions, estimating the probability
  * also been applied to syntactic dependency parsing
    (Titov and Henderson, 2007b; Yazdani and Henderson, 2015)
  * joint syntactic-semantic dependency parsing (Henderson+ 2013)
  * not model the sequence of parser decisions as a flat sequence, but instead
    model the derivation structure it specifies
    * interconnections between hidden layers of the recurrent neural network is
      designed to follow locality in this derivation structure
    * i.e. linguistically appropriate inductive bias
    * Dyer+ (2015) provide a more direct relationship with their StackLSTM
  * arbitrarily large parse structures [without] any hard independence assump
    * in contrast to non-neural statistical models
  * Feed-forward neural networks have also been applied (Chen & Manning, 2014),
    but the accuracy is worse than using recurrent models (see Table 1),
* Representing the parse tree as a derivation sequence,
  rather than a derivation structure, makes it possible to define
  syntactic parsing as a sequence-to-sequence problem,
  mapping the sentence to its parse sequence
  * If seq2seq models) can perform well at this task, then maybe the
    structured linguistic representations are not necessary
    (contrary to Fodor and Pylyshyn (1988))
* Vinyals+ (2015) report
  * very poor results for seq2seq models when trained on the standard dataset
  * good results when trained on very large automatically-parsed corpora
  * good results with the limited standard dataset by adding attention, which
    we will argue below makes the model no longer a seq2seq model
  * structured representations really do capture important generalisations
  * See Collobert and Weston (2008); Collobert+ (2011) for an earlier related
* NN models of parsing which directly represent linguistic structure
  * induced vector representations which map one-to-one with the entities
  * recursive neural network is used to compute embeddings of syntactic consts
    * Dyer+ (2015) showed improvements by adding these representations to a mod
    * Socher+ (2013a) difficult to do decoding efficiently
    * constituent embed make it easier to use them in sentiment (Socher+ 2013b)
  * Graph Convolutional Networks have induced embeddings with clear ling interp
    (Marcheggiani and Titov, 2017; Marcheggiani+ 2018)
* By designing a hand-coded model structure which reflects the ling struct,
  locality in the model structure can reflect locality in the linguistic struct

# 4 Inducing Relations between Entities

* attention-based models, the model structure can now be learned
* By choosing the nodes to be linguistically-motivated entities

## 4.1 Attention-Based Models and Variable Binding

* first proposal of an attention-based neural model (Bahdanau+ 2015)
  * between the target and source words in neural machine translation (NMT)
  * encoder and decoder are both flat sequences
  * attention weights [are] a soft version of the alignment structure
* mapping a sentence to its syntactic parse (Vinyals+ 2015)
  * attention between the sentence and its syntactic derivation sequence, but
    no representation of the structure of the syntactic derivation itself
  * Empirical results are much better than their seq2seq model (Vinyals+ 2015),
    but not as good as models which explicitly model both structures
* similar to the above models with predefined model structure, where an
  unboundedly large stack is needed to specify the parser state
* In other words, attention-based models have variable binding
  * multiple entities can be kept in memory at the same time
  * induced-structure models. We will expand on this perspective in this sec

## 4.2 Transformer and Systematicity

* culminated in the development of the Transformer architecture (Vaswani+ 2017)
  * multiple stacked layers of self-attention
  * Each attention layer has multiple attention heads
    * each head to learn a different type of relation
* sequential structure is
  * not hard-coded into the model structure, unlike
    LSTMs (Hochreiter and Schmidhuber, 1997) and CNNs (LeCun and Bengio, 1995)
  * input in the form of position embeddings
    * just properties of individual entities (typically words)
    * facilitate learning about absolute positions [and]
      allow calculating relative position
  * explicitly inputting relative position relations as embeddings into the
    attention functions works even better (Shaw+ 2018)
  * Whether input as properties or as relations, not hard-coded
* attention functions are learning to extract linguistic relations
  (Voita+ 2019; Tenney+ 2019; Coenen+ 2019)
* relations are extracted from pairs of vectors by the attention functions, as
  with the use of position embeddings to compute relative position relations
  * lower levels must learn to embed its relations in pairs of token
    embeddings, which higher levels of attention then extract
  * apparent from dependency parsing
    (Kondratyuk and Straka, 2019; Mohammadshahi and Henderson, 2019, 2020)
  * Earlier models of dependency parsing successfully use BiLSTMs to
    embed syntactic dependencies in pairs of token embeddings
    (e.g. (Kiperwasser and Goldberg, 2016; Dozat and Manning, 2016)), which are
    then extracted to predict the dependency tree
* Graph-to-Graph Transformer (Mohammadshahi and Henderson 2019, 2020)
  * encode dependencies in pairs of token embeddings,
    for transition-based and graph-based dependency parsing respectively
  * inputs previously predicted dependency relations into its attention
    * like relative position encoding (Shaw+ 2018)). These parsers achieve SOTA

## 4.3 Nonparametric Representations

* we analy[ze] Transformer in terms of Bayesian nonparametric learning
  (Jordan, 2010)
  * Transformer are the minimal nonparametric extension of a vector space
* an example is a mixture model, where
  * each vector specifies the parameters of a multi-dimensional distribution,
  * total distribution is the weighted sum across the vectors of these
    distributions
* These bag of vector representations have two very interesting properties
  * number of vectors in the bag can grow arbitrarily large
  * vectors in the bag are exchangeable, in the sense of Jordan (2010)

# 5 Looking Forward: Inducing Levels and their Entities

* there is at least one more hand-coded aspect of these models
* the set of entities is a predefined function of the text
* learn how many vectors it should use to represent [a sentence]
* inducing sparsity in attention weights (Correia+ 2019)
  * effectively learns to reduce the number of entities used by individual
    attention heads, but not by the model as a whole
* currently different token definitions for different tasks
  (e.g. character / word / sentence embeddings)
* whether a specification of the set of entities at a given level can be learned
* models which induce the set of entities in an input text,
  (but these not learned jointly with a downstream deep learning model)
  * BPE (Sennrich+ 2016) and unigram language model (Kudo, 2018)
  * statistical models for morphology induction (Elsner+ 2013)
  * Semi-Markov CRF models (Sarawagi and Cohen, 2005) can learn segmentations
    * have been used in the output layers of neural models (Kong+ 2015)
* levels of representation
  * typically only represent a few levels, e.g
    character + word , word + syntax tree, or word + syntax tree + pred-arg
    (Henderson+ 2013; Swayamdipta+ 2016)
  * levels and their entities are defined before training starts, either in
    pre-processing or in annotated data
  * If we had methods for inducing the set of entities at a given level, then
    we could begin to ask whether we can induce the levels themselves
  * One common approach is to deny it is a problem: Seq2seq and end2end models
    * only include representations at a lower level, both for input and output
    * they learned about different levels implicitly (Peters+ 18; Tenney+ 19)
* no linguistic theory postulates different levels for different languages.
  * levels minimally include phon, morph, syntax, pred-arg, discourse
  * suggests that in humans the levels of linguistic representation are innate

# 6 Conclusion

* Vector space representations (as in MLPs) are not adequate
  * nor are vector spaces which evolve over time (as in LSTMs)
  * Attention-based models are fundamentally different: bag-of-vector repr
    * the number of vectors in the bag can grow arbitrarily large
* deep learning archits for NLP currently still have many handcoded aspects
  * levels of representation are hand-coded, based on theory or resources
  * Often deep learning models only address one level at a time
  * the set of entities is a pre-defined function of the text
* next step will be the induction of entities
* presumably-innate nature of linguistic levels
