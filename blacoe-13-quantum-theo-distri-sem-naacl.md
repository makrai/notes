A Quantum-Theoretic Approach to Distributional Semantics
William Blacoe, Elham Kashefi, Mirella Lapata
NAACL 2013

# Abstract

* we explore the potential of quantum theory for capturing lexical meaning
* a novel semantic space model
  * syntactically aware, takes word order into account, and
  * features key quantum aspects such as superposition and entanglement
* a dependency-based Hilbert space
* represent the meaning of words by density matrices that encode dependency
* Experiments on word similarity and association
* results competitive with a variety of classical models

# 1 Introduction

* cognitive science and natural language processing recently
  replicating human behavior and enabling real-world applications. Examples:
  * simulations of word association (Denhière and Lemaire, 2004; Griffiths+ 07)
  * semantic priming
    (Lund and Burgess, 1996; Landauer and Dumais, 1997; Griffiths+ 2007),
  * categorization (Laham, PhD 2000)
  * lexicon acquisition (Grefenstette, 1994; Lin, 1998),
  * word sense discrimination (Schütze, 1998), and
  * paraphrase recognition (Socher+ 2011)
* models process a corpus of text as input and
  represent words (or concepts) in a (reduced) high-dimensional space
* term _quantum theory_ to refer to
  the abstract mathematical foundation of quantum mechanics which is not
  specifically tied to physics (Hughes, 1989; Isham, 1989)
  * formalize uncertainty
  * applications in areas as diverse as
    * economics (Baaquie, 2004)
    * information theory (Nielsen and Chuang, 2010)
    * psychology (Khrennikov, 2010; Pothos and Busemeyer, 2012)
    * cognitive science (Busemeyer and Bruza, 2012; Aerts, 2009; Bruza+ 2008)
* features of quantum theory which make it a promising framework for semantics
  * Superposition is a way of modeling uncertainty,
    more so than in classical probability theory
    * An electron's location as a superposition of locations
    * words in natural language can have multiple meanings
  * Entanglement concerns the relationship between systems for which it is
    impossible to specify a joint probability distribution from the probability
    distributions of their constituent parts
    * word meanings: (hidden) relationships between concepts
  * incompatibility is fundamental to quantum systems
    * In classical systems, measurements are compatible ie independent
      * the order does not matter
    * in quantum theory, measurements may share (hidden) order-sensitive
      inter-dependencies
  * Interference can cause the law of total probability to be violated
    * non-classical behavior, e.g., with regard to conjunction and disjunction
      (Aerts, 2009)
    * e.g. guppy is an example of a pet-fish it is neither a very typical pet
      nor fish (Osherson and Smith, 1981)
* we show how word meanings can be expressed as quantum states
  * word's subspace is spanned by vectors representing its potential usages

# 2 introducing some of the mathematical background

# 3 semantic space model

# 4, 5 evaluation experiments

# 6 related work and conclusion

* Within cognitive science the formal apparatus of quantum theory has been used
  * conjunction fallacies (Tversky and Kahneman, 1983)
    * ie specific conditions are more probable than a single general one
    * have been explained by making reference to quantum theory’s context
      dependence of the probability assessment
  * Violations of the sure-thing principle (Tversky and Shafir, 1992)
    * human behavior ought to conform to the law of total probability
    * modeled in terms of a quantum interference effect
  * asymmetry of similarity relations
    * explained by postulating that different concepts correspond to subspaces
      of different dimensionality (Pothos and Busemeyer, 2012)
  * concept combination (Bruza and Cole, 2005)
  * emergence of new concepts (Aerts and Gabora, 2005)
  * human mental lexicon (Bruza+ 2009)
  * syllogisms in a quantum theoretic framework (Chen 2002)
* connect the mathematical basis of semantic space models with quantum theory
  * Aerts and Czachor (2004) and Bruza and Cole (2005) respectively demonstrate
    that Latent Semantic Analysis (Landauer and Dumais, 1997) and the
    Hyperspace Analog to Language model (Lund and Burgess, 1996) are
    essentially Hilbert space formalisms
    * hE they no fully-fledged semantic space
    * rather a proof-of-concept at each inner node of the (dependency) parse of
      the structure in question
  * Grefenstette+ (2011) present a model for capturing semantic composition in
    a quantum theoretical context, although it
    * appears to be reducible to the classical probabilistic paradigm
* Conclusion
  * We obtain quantum states (ie, lexical representations) for each word by
    taking its syntactic context into account
  * Quantum states are expressed as density operators rather than kets
  * a density operator contains an ensemble of pure states
  * we compute the meaning of phrases or sentences
  * Compositional meaning reduces to quantum measurement at each inner node of
    the (dependency) parse of the structure in question
