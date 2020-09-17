Fernando Pereira 
(2000)
Formal grammar and information theory: together again?}

# Abstract

* In the last 40 years, two seemingly irreconcilable traditions: formal
  linguistics in the Chomsky tradition, and information theory in the Shannon
  tradition
* Zellig Harris had advocated a close alliance
* Today, information-theoretic approaches succeed in speech recognition,
  information retrieval, and, increasingly, in language analysis and machine
  translation.
* exponential increase in the speed and storage capacity of computers
  $\Rightarrow$  automatic estimation of the parameters of probabilistic models
  of language ($\Leftarrow$ by counting occurrences of linguistic events in
  very large bodies of text and speech.)

### A _distribuition_ szó

 a cikk során két értelemben szerepel: egy szó disztribúciója (kontextusainak
 halmaza), és egy valószínűségi változó eloszlása (vagyis hogy milyen
 valószínűséggel veszi fel az egyes értékeket). Közös eredet?

# The Great Divide

* Chomsky (1957) signals the beginning of the split.
  1. Colourless green ideas sleep furiously.
  1. Furiously sleep ideas green colourless.
* _Before and after the split_, Zellig Harris had advocated a close alliance
  between grammatical and information-theoretic principles in the analysis of
  natural lan- guage (Harris 1951, 1991).
* an urge to take sides that was as much _personal and ideological_ as
  scientic.
* I will argue below that statistical models promise a fundamentally deeper
  understanding of information-theoretic and computational-complexity
  constraints on _language acquisition_.

# Harris’s Program

* Chomskian generative linguistics in the early 1960s swept the focus of
  attention away from _distributional_ views of language, especially those
  based on the earlier structuralist tradition.
* In the structuralist tradition, Zellig Harris developed what is probably the
  best-articulated proposal for a _marriage of linguistics and information
  theory_
* four main so-called constraints (Harris 1988)

### Partial order


> for each word ... there are zero or more classes of words, called its
> arguments, such that the given word will not occur in a sentence unless one
> word ... of each of its argument classes is present.

* similarities to type in categorial grammar, or subcategorization frames in
  other linguistic formalisms.
* However, traditional categorial grammar (Lambek 1958) conflates
  function--argument relationships and _linear order_, whereas Harris factors
  out linear order explicitly. It is only more recently that categorial grammar
  has acquired the technical means to investigate such factorizations % TODO
  weighted piecewise testable (Morrill 1994; Moortgat 1995).

### Likelihood


> each word has a particular and roughly stable likelihood of occurring as
> argument, or operator, with a given other word, though there are many cases
> of uncertainty, disagreement among speakers, and change through time.

* Using current terminology, a _probabilistic version of selectional
  restrictions_\footnote{However, Harris makes a sharp distinction between
  general language, in which likelihoods for fillers of argument positions
  represent tendencies, and technical sublanguages, in which there are hard
  constraints on argument fillers, and which, thus, correspond more closely to
  the usual notion of selectional restriction.}

### Reduction


> It consists, for each language, of a few speci­fiable types of reduction...
> what is reduced is the high-likelihood... material... ; an example is zeroing
> the repeated corresponding words under _and_.’

* for morphological processes like contraction, and for processes that combine
  elementary clauses into complex clauses, such as relativization,
  subordination and coordination.
* connections between reduction-based and transformational analyses (Harris
  1965; Chomsky 1965) suggest the possibility of modelling _string
  distributions as the overt projection of a hidden generative process_
  involving operator-argument structures subject to the likelihood constraint
  and transformations.

### Linearization

> Since the relation that makes sentences out of words is a partial order,
> while speech is linear, a linear projection is involved from the start.

### Összefoglalás


% Thus, linguistic events involve the generation of basic con­
gurations|unordered % simple clauses|whose structure is determined by the
partial order constraint and % whose distribution follows the probabilities
associated with the likelihood constraint.  % Those probabilities also govern
the application of reduction|compression|to indi- % vidual con­ gurations or
sets of linked con­ gurations.
* As I will discuss in Chapter 7, though, the likelihood constraint as stated
  by Harris, or its current versions, leaves out _dependences on the broader
  discourse_
* Harris’s constraints explicitly _link linguistic structure with
  distributional regularities_ involving the relative frequencies of different
  structural confi gurations.
* how the structural and distributional regularities could work together to
  support _language acquisition and use_

> when only a small percentage of all possible sound-sequences actually occurs
> in utterances, one can identify the boundaries of words, and their relative
> likelihoods, from their sentential environment

* Harris proposed no speci­c mechanisms by which language users could take
  advantage of distributional regularities in language acquisition and use.

# Generalization

* Chomsky argued that any statistical model based on the frequencies of word
  sequences would have to assign equal, zero, probabilities to both (1) and (2)
* overfitting $\leftrightarrow$ generalize
* example: polynomial
* smoothing: assign some probability mass to unseen events
* such methods, due to Turing and Good (1953), had been published before
  Chomsky’s attack on empiricism, and has since been used to good e¬ect in
  statistical models of language
* regularization
* sample complexity relationship between training sample size, model complexity
  and generalization
* Typical theoretical results in this area give probabilistic bounds on the
  generalization error of a model as a function of model error on training
  data, sample size, model complexity, and margin of error (Vapnik 1995). %
  TODO
* we need a rigorous measure of model complexity. Vapnik--Chervonenkis (VC)
  dimension (Vapnik \& Chervonenkis 1971), roughly speaking, gives the order of
  a polynomial upper bound on the number of distinctions that can be made
  between samples by models in the class, as a function of sample size.
* argument from poverty of the stimulus, innate language faculty
* model classes have to be restricted to ensure effective generalization
* APS claims that only a learning mechanism developed speci­fically for
  language could generalize well from limited linguistic experience.
* constraint on representations vs combinatorial menas, search procedure
* the stimuli that APS supporters claimed to be missing are actually present
  with signi­cant frequency (Pullum 1996).
* principles-and-parameters: learnability requires that the set of possible
  natural languages be generated by the settings of a finite set of finitely
  valued parameters (Chomsky 1986)
* But this extreme constraint is neither necessary, since in­finite model
  classes of ­ finite VC dimension are learnable from an information-theoretic
  point of view, nor sufficient, because even finite classes may not be
  efficiently learnable

# Hidden Variables

* Early empiricist theories denied internal, unobservable, state of the
  language user.
* critique like Chomsky (1959)

### in a Markov model,

 all the state information would be represented by the _externally observable
 sequence_ of past linguistic behaviour (nem világos, hogy csak a diskutzuson
 belüli nyelvi viselkedésre gondol, vagy mindarra, amit a beszélő életében
 hallott)
* However, if the language user updates its expectations and probable
  responses, part of the user's hiedden state
* behaviour gives valuable information about experience-encoding mechanisms,
  entropy
* bigram or $n$-gram with $n>3$,

\[p(w_1... w_n ) = p(w_1 )\prod_{i=2}^np(w_i|w_{i-1})\]

### which model

 in a class of models is a best compromise between ­ tting the experience so
 far and generalizing to new experience.
* Bayesian model averaging (prior)
* the prior is an innate knowledge
* e.g. bias towards less complex
* ignored by advocates of APS
* {modelling ambiguity} e.g. assignment of (syntactic) types|positions in the
  partial order|to words
* factored models of joint distributions that have far fewer parameters (class
  based bigram)

\[p(x, y) = p(x)\sum_cp(y | c)p(c | x)\]

* vocabulary of size $V$ and $C$ classes, $O(CV )$ parameters instead of
  $O(N^2)$ ($C\ll V$)

\[\frac{p(\text{Colourless green ideas sleep furiously})}{p(\text{Furiously
sleep ideas green colourless})}\approx 2\cdot 10^5\]

# Lexicalized models

* Harris’s model of dependency and selection is lexicalized: all postulated
  _relationships are between the words_, rather than the relationships between
  structures in generative grammar.
* From the points of view of _machine learning_: lexicalized models anchor
  analyses in observable co-occurrences between words
* Even lexicalized models will involve hidden decisions if they allow
  _ambiguous interpretations_
* associating sentences with disambiguating information (supervised learning)
* lexicalized _probabilistic context-free grammars_ can be automatically
  learned
* analyzed training data is unrealistic _for human language acquisition_
* use instead additional observables correlated with the hidden variables, such
  as prosodic information or perceptual input associated with the content of
  the linguistic input (Siskind, 1996; Roy \& Pentland, 1999).

# The power of correlations

* How poor is the stimulus for language aquisiton?
* linguistic experience is _grounded_ in a rich perceptual and motor
  environment, much of the linguistic experience is about that non-linguistic
  environment.
* both in formal grammar and in most computational models of language, language
  is taken as a completely _autonomous_ process
* _mutual information_ measures of information relative to the correlations
  between a signal and events of interest
* grounding in a _linguistic context_
* e.g. sentences can be viewed as evidence for other sentences through
  inference, and the effectiveness of a language processor may be measured by
  its accuracy in deciding whether a sentence _entails_ another, or whether an
  answer is appropriate for a question.
* _bag-of-words models:_ ignore the order of words and just use the frequencies
  of words in documents (Salton 1989)
* Since similar situations are described in similar ways, simple statistical
  similarity measures between the word (frequency) distributions in documents
  and queries are effective in retrieving documents relevant to a given query
* _one-sense-per-discourse principle:_ _stocks, bonds, bank_

# Local structure and global distribution

* Current _stochastic lexicalized models capture much of Harris_’s
  partial-order and likelihood constraints but conflates linearization with
  argument structure
* independence assumptions:
  * Harris: `rough stability’ of the likelihood of a given argument of a given
    operator -- implicitly assumes:
  * dependents are conditionally independent of the rest of an analysis given
    the head they depend (Markovian assumptions)
  * Existing lexicalized models are similar, although they typically extend
    lexical items with additional _features_, for instance syntactic category
  * A cikk szerint However, Harris’s information-theoretic arguments,
    especially those on reduction, refer to the _overall likelihood of a
    string_, which involves the global correlations discussed in the last
    section.
  * left out by Markovian assumptions. Captured by global features in
    conditional from random ­fields?

# From deciding to understanding

* language-processing tasks as decision among a finite set of alternatives, or
  a ranking of alternatives.
  1. classi­fy news into topics speci­fied by training examples;
  1. a part-of-speech tagger assigns the most likely tags to the words in a
  document;
  1. a Web search engine ranks a set of Web pages according to their relevance
  to a natural language(?) query;
  1. a speech recognizer decides among the possible transcriptions of a spoken
  utterance.
  1. [(+1)] automatically trained machine translation (involve `understanding’
  but questions can be left unanswered)
* task
  1. narrow the class of mappings (to a learnable one)
  1. select a mapping from the class that minimizes some measure of the error
* task-oriented learners ignore regularities that are not relevant to the task.
  Yet, those regularities may be highly informative about other questions.
  _understanding_? (megjegyzés: vektor alapú $n$-gram)
* information-theoreticcally:
  * difficulty can be measured by the uncertainty (entropy) of the output in
    the absence of input
  * the learner acquires a function that can reduce that uncertainty by
    exploiting the mutual information between inputs and outputs
* (i) $\rightarrow$ (+1) increasing output entropy % # Summary
