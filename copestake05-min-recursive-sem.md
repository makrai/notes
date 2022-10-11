Minimal Recursion Semantics: An Introduction
Ann Copestake, Dan Flickinger, Carl Pollard & Ivan A. Sag
Research on Language and Computation volume 3, pages 281–332 (2005)

# Abstract

* suitable for parsing and generation and that
* can be implemented in typed feature structure formalisms
* We discuss
  * why a semantic representation with minimal structure is desirable and
  * how a descriptively adequate representation with a nonrecursive structure
    may be achieved
* MRS enables
  a simple formulation of the gramm constraints on lexical and phrasal sem,
  including the principles of semantic composition
* We have integrated MRS with a broad-coverage HPSG grammar

# 1. Introduction

* criteria for computational semantics are:
  * Expressive Adequacy. The framework must allow linguistic meanings to be
    expressed correctly
  * Grammatical Compatibility. Semantic representations must be linked cleanly
    to other kinds of grammatical information (most notably syntax)
  * Computational Tractability. It must be possible to process meanings and to
    check semantic equivalence efficiently and to express relationships between
    semantic representations straightforwardly.282
  * Underspecifiability. Semantic representations should allow underspecifica-
    tion (leaving semantic distinctions unresolved), in such a way as to allow
    flexible, monotonic resolution of such partial semantic representations
* balance
  * The first and second criteria are the object of much ongoing work in sem,
  * computational linguists have to balance these requirements with those
  * Expressive accuracy in particular has often been sacrificed in order to
    achieve computational tractability. This has been especially noticeable in
    natural language generation and machine translation, both of which require
* one/other major difficulty is in
  * ensuring that a grammar can generate from logical forms
    while keeping the module that constructs these forms indep of the grammar
  * relate semantic representations
    as is required, for instance, in a semantic transfer approach to MT
* formalisms which achieve tractability at the cost of expressive adequacy,
  in particular by omitting the scope of quantifiers and
  disallowing higher-order predicates in general
  (eg Phillips, 1993; Trujillo, 1995)
* Conventional semantic representations are also problematic for parsing, since
  they require information that cannot be obtained by compositional processing
  of sentences in isolation
  * eg, they require that quantifier scope be specified
  * not only is it very difficult to resolve quantifier scope ambiguities, it
    is also often unnecessary in applications such as MT, since the resolution
    of quantifier scope usually has no effect on the translation. Thus there
  * representations which allow scope to be underspecified
    Alshawi and Crouch (1992), Reyle (1993), Bos (1995), Pinkal (1996) and the
    papers collected in van Deemter and Peters (1996)
* a framework for semantic representation which makes it easy to decompose,
  relate and compare semantic structures also naturally lends itself to scope
  underspecification. In both cases, the key point is that it should be
  possible to
  ignore scope when it is unimportant for the task, at the same time as
  be (re)constructed when it is required. In this paper, we describe a
* Minimal Recursion Semantics (MRS)
  * not, in itself, a semantic theory, but can be most simply thought of as a
    meta-level language for describing semantic structures in some underlying
    object language. For the purposes of this paper, we will take the object
    language to be predicate calculus with generalized quantifiers
* the primary units of interest for computational semantics are
  elementary predications or eps, where by ep we mean
  * a single relation with its associated arguments (eg, beyond(x, y))
  * In general, an ep will correspond to a single lexeme. MRS is
  * a syntactically ‘flat’ representation, since
    the eps are never embedded within one another
  * includes a treatment of scope which is straightforwardly related to
    conventional logical representations
    * unlike earlier approaches to flat semantics,
  * the syntax of MRS could be naturally expressed in terms of feature structs
    and, as we shall illustrate, smoothly integrated with a feature-based
    grammar, eg one written within the framework of HPSG
  * MRS integrates a range of techniques in a way that has proved to be very
    suitable for large, general-purpose grammars for use in parsing, generation
    and semantic transfer (eg Copestake+ 1995; Copestake 1995; Carroll+ 1999)
  * utility from a non-computational perspective
    (see Riehemann, 2001; Bouma+ 1998; and Warner, 2000, among others)
* for ease of exposition of the fundamentals of MRS, we adopt a very simple
  account of the semantics of many constructions in the first parts of this
  paper, but §6 describes a fuller approach.  §7 discusses

# 2 motivate flat semantics in more detail. In §3 we introduce

* examples which arise in semantic transfer approaches to MT. The term semantic
  * ie source utterance is parsed to give a semantic representation and a
    transfer component converts this into a target semantic representation
    This is then used as input to a generator to produce a string in the target

To begin with, consider the following trivial example. An English grammar
  * en: fierce black cat,
  * es: gato negro y feroz shown in (1b) would produce the LF in (1c), which
