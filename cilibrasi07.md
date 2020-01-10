Rudi L. Cilibrasi and Paul M.B. Vitányi
2004
The Google Similarity Distance

#Abstract

* We present a new theory of similarity between words and phrases
  * based on information distance and Kolmogorov complexity
  * using Google page counts
* applications
  * hierarchical clustering, classification, and language translation
  * example domains
    * distinguish between colors and numbers,
    * cluster names of paintings by 17th century Dutch masters and
    * names of books by English novelists, the ability to
    * understand emergencies, and prime[ number]s
    * simple automatic English-Spanish translation. Finally, we use the
    * WordNet database as an objective baseline against which to judge the
      * massive randomized trial in binary classification using SVM
      * mean agreement of 87%

#1 Introduction

* Previously, we and others developed a compression-based method to establish a
  universal similarity metric among objects given as finite binary strings
  * e.g. genomes, music pieces in MIDI format, computer programs in Ruby or C,
    pictures in simple bitmap formats, or time sequences such as heart rhythm
  * feature-free in the sense that it
    * [not] looking for particular features; rather it
      analyzes all features simultaneously and
      determines the similarity between every pair of objects
      according to the most dominant shared feature
* the Google semantics of a word or phrase consists of
  the set of web pages returned by the query concerned

##A. An example 2

* Normalized Google Distance NGD(horse, rider) ≈ 0.443
  * usually  in between 0 (identical) and 1 (unrelated)
    * (but not always, see below)
* We did the same calculation when Google indexed only one-half of the number
  of pages ... The NGD(horse, rider) we computed in that situation was ≈ 0.460
* probabilities of search terms and the computed NGD’s should stabilize

##B. Related Work:

* cognitive psychology (Landauer and Dumais 2003)
* linguistics, and computer science, about using word (phrases) frequencies in
  text corpora to develop measures for word similarity or word association,
  * partially surveyed in (Terra and Clarke 2003; Tan+ 2002),
  * going back to at least (Lesk, 1969)
* Cimiano (2004); Bagrow (2005) ...  use the web and Google counts to identify
  lexicosyntactic patterns or other data
  * theory, aim, feature analysis, and execution 
    cannot meaningfully be compared [to ours]

##C. Outline

* terms with different meaning have the same semantics, and that
* opposites like ”true” and ”false” often have a similar semantics
* theoretical underpinning is based on the theory of Kolmogorov complexity
  [27], and is in terms of coding and compression
* NGD formula [is] not equivalent to any earlier ...  formula in this area
* a decade of cumulative research in this area, of which the main thread is
  [27], [2], [28], [26], [7], [8]
  with [25], [3] using the related approach of [29]
2. Kolmogorov complexity, information distance, and compression-based sim
3. the Google distribution, the Normalized Google Distance, and [their univ]ity
4. clustering and classification experiments to
  validate the universality, robustness, and accuracy of our proposal
5.  classification trial [against] WordNet database

##D. Materials and Methods 3

* the returned google counts are inaccurate (Bagrow 2005)
* especially if one uses the boolean OR operator between search terms
* AND operator we use is less problematic, and we do not use the OR operator
* Google apparently estimates the number of hits based on samples, and 
  the number of indexed pages changes rapidly
* To compensate for the latter effect, we have inserted a 
  normalizing mechanism in the CompLearn software
* web searches for rare two-word phrases correlated well (Keller, 2003) with
  the frequency found in traditional corpora, as well as with human judgments

#II. Technical preliminaries

* Kolmogorov complexity K(x) 
  * the length, in bits, of the ultimate compressed version 
    from which x can be recovered by a general decompression program

##A. Normalized Information Distance:

* In Bennett+ (1998), we considered the following [information distance E(x,y)]
* given two strings x and y, what is the length of the shortest binary
  program in the reference universal computing system such that the program
  computes output y from input x, and also output x from input y
* up to a negligible logarithmic additive term,
  `E(x, y) = K(x, y) − min{K(x), K(y)}`,
  where K(x, y) is the binary length of the shortest program that produces
  the pair x, y and a way to tell them apart
* This distance E(x, y) is actually a metric
* admissible distances: ... nonnegative, symmetric, and computable
* [`E` is] universal for the family of computable distances
  i.e. `E` minorizes every admissable distance up to an additive constant
* the information distance determines the distance between two strings
  minorizing the dominant feature in which they are similar
* normalization
  * If small strings differ by an information distance which is large compared
    to their sizes, then the strings are very different
* The normalized information distance (NID)
  * has values between 0 and 1
  * is universal
    * minorizes, up to a vanishing additive term,
      every other possible normalized computable distance

##B. Normalized Compression Distance

* The NID is uncomputable since the Kolmogorov complexity is uncomputable
* But we can use real data compression programs to approximate the Kolmogorov
  complexities K(x), K(y), K(x, y)
* problems, for example
  * how the NCD approximates the NID if C approximates K, see [8], which
  * do not need to concern us here

#III. Theory of Googling for similarity 4

* In the sequel, we show ... that the Google distribution is
  universal for all the individual web users distributions

##C. The Google Code:

* we cannot use the probability of the events directly to determine a prefix
  code, or, rather the underlying information content implied by the
  probability [because]
* events overlap and hence the summed probability exceeds 1
* `g`: a találati oldalak relatív gyakorisága
* absolute probabilities ... allow us to define the associated prefix code-word
  lengths (information contents) for both the singletons and the doubletons:
  * Google code of length `G` a `g`-ből számolt kódhossz
  * the shortest expected prefix-code word length 
    of the associated Google event x

##D. The Google Similarity Distance:

* properties of the NGD (as long as we choose parameter N ≥ M )
  * range of the NGD is in between 0 and ∞
    * sometimes slightly negative if the Google counts are untrustworthy and
      state f (x, y) > max {f (x), f (y)}
  * if f (x) = f (y) = f (x, y) > 0, then NGD(x, y) = 0
    * not a metric
  * If frequency f (x) = 0, then for every search term y we have
    NGD(x, y) = ∞/∞, which we take to be 1 by definition
  * always nonnegative and NGD(x, x) = 0 for every x
  * NGD(x, y) = NGD(y, x): it is symmetric
  * the NGD [does not] satisfy the triangle inequality

##E. Universality of Google Distribution 6

A central notion in the application of compression to learning is the notion
of “universal distribution,” see [27]

##F. Universality of Normalized Google Distance

az NGD nagyjából olyan kicsi, mint a legkisebb egyedi normalizált G-távolság

#IV. Applications and experiments 8

#unsorted

* LSA: [37]
* are google hits representative for language? [38], [23]
* NGD Translation
