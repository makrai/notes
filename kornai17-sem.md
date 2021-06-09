## 1.4

* First there is the Frege-Russell-Tarski-Montague-Kamp tradition, what we call
  the {\it standard} theory in this book. [\dots] Here meanings are modeled by
  logic formulas
* Second, there is the
  \href{https://en.wikipedia.org/wiki/John_Rupert_Firth}{Firth} -
  \href{https://en.wikipedia.org/wiki/Zellig_Harris}{Harris} -
  `\href{https://en.wikipedia.org/wiki/Charles_E._Osgood}{Osgood}` tradition of
  {\it distributional} theory [\dots].  Here meanings are modeled as  vectors
  in a continuous vector space ${\mathbb R}^n$
* Third, there is the
  \href{https://en.wikipedia.org/wiki/Semantic_network}{semantic network}
  theory, of which both {\tt 4lang} and \href{http://amr.isi.edu}{AMR} are
  modern instances

## 2.6 Proof theory

* There are several rules of deduction in common use, and the theory of logic
  * inputs, called its premisses, and one
  * output, called its conclusion. We say that
  * a rule is deductively valid or just valid ... iff for every model where
    * Weaker forms of validity (...  inductive validity) include rules of
      deduction based on probabilities, degrees of belief, etc. We will discuss
      some examples in Section 7.3
    * deductive validity _in some systems of logic_
      e.g. double negation, which leads to the conclusion φ from the premiss
      \neg \neg φ ... fails for example in many-valued systems of logic
      e.g.  intuitionistic logic, which disallows both double negation and the
      closely related tertium non datur (law of the excluded middle)

## 2.7 Multivariate statistics

* concept formation, the ability to acquire words based only on a few examples
  * We
    * begin with some terminology common to linguistics, cognitive science, and
      philosophy, where the issue of concepts and concept formation is
      generally approached through some theory of _natural kinds_, and
    * gradually recast the main observations in the language of machine
      learning
* we learn about _house_ first, and consider _tents, industrial buildings_ etc
  * [but there are] words like _mirror_ or _wiggle_ that are _sui generis_
    * these offer no significant contrasts

## 4.2

* our labels are called 
  * NOM and ACC in case grammar (Fillmore, 1977)
  * 1 and 2 in relational grammar (Perlmutter, 1983)
  * AGENT and PATIENT in linking theory (Ostler, 1979)
  * nsubj and dobj in Universal Dependencies (see Section 5.4). The label names

## 4.6 Inner syntax

* What does NOM mean? The key semantic contribution is the sense of agency, that
* three components of the system that implements inner syntax: the actual
  * mechanism used for implementing deep cases, the precise 
  * inventory of deep cases, and the 
  * linguistic patterns that link deep cases to surface cases 119
    * dative shows aspects of both having (possession) and getting to (directon)
    * patterns where the dative is an experiencer, as in Marinak tetszik/fáj
    * Mit csinálsz nekem?, what.ACC do.2SG I.DAT, ‘what the heck are you doing?’
      * the dative NP just concerns itself with the issue. These patterns again
      * known as dativus ethicus in Latin. Finally, there are cases that seem
    * Péternek el kell mennie, Peter.DAT away must go.INF3SG, ‘Peter must leave’
      * often called the indirect object
      * whether the explanation [of inter-language similarities] is to be sought
        in universal cognitive patterns or in etymological relatedness or
        cultural borrowing remains to be seen.  Be that as it may, we need a
* mechanism for expressing such patterns on a per-language basis, and 4lang keys
  * _appear_, which in Hungarian governs a double dative: 
  * Marinak Péter betegnek tűnik, Mary.DAT Peter.NOM sick.DAT appear.3SG
  * We analyze appear as give impression of or, more precisely, as agent cause
    recipient to have impression of condition
  * defend (from/against), equal, feed, prefer, protest, shoot (at), and full

## 5.5 Representing knowledge and meaning

* the autonomy of syntax thesis (Chomsky 1973), claiming that
  * the syntactic rules and principles of a language are formulated without
    reference to meaning, discourse, or language use (
  * see
    * Fred Newmayer’s class notes for this particular formulation and much
      relevant discussion, and see
    * Anderson (2005a) for a strongly opposed view).
  * In this book we assume syntax to be autonomous ... simply because it makes
    good engineering sense to maximally isolate our theory of semantics from
    the details of syntactic representation.

## 5.7

Here we will discuss three well known ranges of ‘pragmatic’ phenomena
  * cooccurrence restrictions,
  * implicature, and the
  * dependence of linguistic meaning on external (non-linguistic) factors
* synt jól formált de furcsa mondatok tagadása nem feltétlenül furcsa

## 7.1 Schematic inferences

* In Chapter 3 we used McCarthy’s 1976 analysis of a simple newspaper story
* Here we use a more systematic test set,
  * based conceptually on Winograd’s 1972 schemas and specifically
  * designed by Levesque, Davis, and Morgenstein (2012)
