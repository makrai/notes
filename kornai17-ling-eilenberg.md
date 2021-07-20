Linguistic computation by Eilenberg machines
András Kornai
2017 mol

# Intro

* Section 2 we consider assigning Abstract Meaning Representations (AMRs) to
  strings by graph grammars as a typical example of linguistics computation
  with a semantic goal (Koller, 2015).

# 2 Hypergraph rewriting

* ACR, with the early work such as Quillian, (1962) actually preceding
  Montague Grammar by nearly a decade, has strong conceptual affiliation to
  dependency grammar (Tesniére, 1959) and valency theories (Somers, 1987),
  while LF theories are generally coupled to the analysis of constituency, be
  it by phrase-structure or by transformational means.  For a summary of the
  early work see Findler, 1979, for later developments see Brachman and
  Levesque, 1985
* Copestake+ (2005) lists among their desiderata underspecifiability,
  that “Semantic representations should allow underspecification (leaving
  semantic distinctions unresolved), in such a way as to allow flexible,
  monotonic resolution of such partial semantic representations”. Whether
  monotonic resolution is always feasible is a complex issue we cannot delve
  into here,
* major ACR systems such as those of Schank, (1972), Sowa, (2000), Abstract
  Meaning Representations (AMR, see Banarescu+ 2013)
* (hyper)graphs
  * Hyperedge Replacement Grammars (Drewes, Kreowski, and Habel, 1997) or
  * s-graph grammars (Koller, 2015)
    * key examples furnished
    * operations rename, forget, and merge
* we assume with Kiparsky, 1997 that in languages like English the nominative
  is also present,
* subject control, the verb want can bring an OBJ or an XCOMP from the lexicon,
  the former activated in the boy wants cake and the latter in the boy wants to
  sleep. The same mechanism is applicable in object control mommy wants the boy
  to sleep, and again, just as in CG, the graph corresponding to the desired
  reading will be the only one surviving from all nondeterministic linking
  attempts.

# Conclusion

* this is the first ever theory that spells out in detail the9 form that
  meaning postulates must take (for a survey in MG, see Zimmermann, 1999)
* difference between what we called the LF and ACR views of semantics
  * [sperficially] is about the choice of formal tools
  * [really] negation.
    * In theories of LF, we have full quantification, with Boolean duality
    * In ACR theories, there is only one kind of quantification, generic, and
      this has no obvious dual.
* What makes horses and cows similar is that
  * they are both large four-legged farm animals
  * the set of essential properties H for horses and C for cows
    * Jaccard similarity |H∩C|/|H∪C|
    * experimentally obtained similarity judgments of the kind presented in
      Hill, Reichart, and Korhonen, (2014)
  * generalized quantifier view, as long as we treat positive and negative
    properties on a par, gives us an infinity of properties they share: neither
    have exactly 13 atoms,
