Thomas K Landauer and Susan T. Dumais
A Solution to Plato's Problem:
  The Latent Semantic Analysis Theory of
  Acquisition, Induction, and Representation of Knowledge
Psychological Review 1997

* azt gondolom, hogy LSA kapcsán a következőket érdemes hivatkozni
  * seminal: Dumais+ 88, Furnas+ 88
  * easy entry: Landauer+ 98 (ez); Deerwester+ 1990

címek hierarchiája:
középen álló > középen dőlt > balra zárt (dőlt)

# Abstract

right number of dimensions (e.g., 300)

# Intro

a very simple mechanism of induction, the choice of the correct dimensionality
in which to represent similarity between objects and events, can sometimes, in
particular in learning about the similarity of the meanings of words, produce
sufficient enhancement of knowledge to bridge the gap between the information
available in local contiguity and what people know after large amounts of
experience

# Overview

* tested with a standard multiple-choice synonym test,
* much theory in philosophy, linguistics, artificial intelligence research, and
  psychology has supposed that acquiring [language, requires] special
  foundational knowledge rather than just a general purpose analytic device
* Similar induction processes [to those in e.g.] some
  associative, semantic, and neural network models
* phenomena that we discuss later in detail
  * some auxiliary data and simulation results
  * contextual disambiguation

# The Problem of Induction p2

# The Latent Semantic Analysis Model p4

## An Informal Explanation of the Inductive Value of Dim Optimization

* researchers have considered dimensionality reduction as
  a method to reduce computational complexity or for smoothing, that is
  for simplifying the description of data or interpolating intermediate points
  (e.g., Church & Hanks, 1990; Grefenstette, 1994; Schutze, 1992a, 1992b)
* words could also fail to co-occur for a variety of reasons
  * truly unrelated (e.g., semantic and carburetor)
  * near-perfect synonyms (e.g., overweight or corpulent)
  * different but systematically related meanings (e.g., purple and lavender),
  * relevant to different aspects of the same object (e.g., gears and brakes)
* idea is closely related to familiar uses of factor analysis and
  multi-dimensional scaling, and to unfolding, (J. D. Carroll & Arabie, in
  press; Coombs, 1964), but using a particular kind of data and writ very
  large. Charles Osgood (1971) seems to have anticipated such a theoretical
  development when computational power eventually rose to the task, as it now
  has
* Suppose that a communicator possesses a representation of a large number of
  words as points in a high dimensional space. In generating strings of words,
  the sender tends to choose words located near each other. Over short time
  spans, contiguities among output words would reflect closeness in the
  sender's semantic space. A receiver could make first-order estimates of the
  distance between pairs by their relative frequency of occurrence in the
  same temporal contexts (e.g., a paragraph) ... the receiver then sets out to
  represent the results of its statistical knowledge as points in a space of
  the same or nearly the same dimensionality as that from which it was
  generated,

## A Psych Descr of LSA as a Theory of Learning, Memory, and Knowledge p6

* transformation to log frequency divided by entropy + dimensionality reduction
* information retrieval methods (including LSA when used for the purpose) are
  greatly improved by transformations of this general form, the present one
  usually appearing to be the best
  * Does information retrieval in automatic systems work best when it mimics
    the circumstances that make people think two things are related, or is
    there a general logic that tends to make them have similar forms?
* pling real of the dim redu step [is] often implicit and sometimes explicit
  in many neural net and spreading-activation architectures

## A Neural Net Analog of LSA p7

* three-layered neural net, symmetrical, least-squares, linear

## The Singular Value Decomposition (SVD) Realization of LSA p8 TODO

* Singular Value Decomposition (SVD) [is]
  * kind of inductive mechanisms that we want to explore
  * a convenient way to vary dimensionality, and that it
  * can fairly easily be applied to data of the amount and kind
    that a human learner encounters over many years of experience
  * complicating the model appropriately might allow it to simulate ... aspects
    of grammar and syntax that involve ordered and hierarchical relations

### Singular Value Decomposition (SVD)

* SVD is the general method for linear decomposition of a matrix into
  independent principal components of which factor analysis is the special case
  for square matrices
* Factor analysis finds a parsimonious representation of all the
  intercorrelations between a set of variables
  in terms of a new set of abstract variables,
    * each of which is unrelated to any other but
    * which can be combined to regenerate the original data
* SVD does the same thing for an arbitrarily shaped rectangular matrix
  * columns stands for words, and rows for contexts in which the words appear
* process
  * cells in the matrix contained the frequency
  * The raw cell entries were first transformed to
  `(ln 1 + frequency) / entropy of the word over all contexts`
  * This matrix was then submitted to SVD and
  * the—for example—300 most important dimensions were retained
  * (those with the highest singular values, i.e.,
    the ones that captured the greatest variance in the original matrix)
  * solution then generates a vector of 300 real values
    to represent each word and each context. See Figure 2
* Similarity was usually measured by the cosine between vectors

### Brief Note on Neurocognitive and Psychological Plausibility

* semantic network-represented theories, such as Kintsch (1988),
  could easily be recast in vector algebra

# Evaluating the Model p9

## LSA's Acquisition of Word Knowledge From Text

* The Effect of Dimensionality
* The Learning Rate of LSA Versus Humans and Its Reliance on Induction p11
* Conclusions From the Vocabulary Simulations

# Generalizing the Domain of LSA

## Other Aspects of Lexical Knowledge
## Real-World Reference
## Conditioning, Perceptual Learning, and Chunking p18
## A New Light on Classical Association Theory
## Analogy to Episodic and Semantic Memories !
## Analogy to Explicit and Implicit Memories p19
## Expertise
## Contextual Disambiguation
### Text Comprehension: An LSA Interpret of Construction-Integration Theory p20

# Summary p24
