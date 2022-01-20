Two theories about adjectives
JAW Kamp

# 1 Predicative, privative, affirmative, and extensional adjectives

* the first theo
  * dates from the late 1960s
  * stated in Montague (1970) and Parsons (1968)
  * the meaning of an adjective is
    a function which maps the meanings of noun phrases onto other such meanings;
  * Predicative uses are explained as elliptic attributive uses
    eg This dog is clever -> This dog 1s a clever dog/animal/being
    *  Which noun phrase ought to be supplied: not comple determined by the sent
    * the sentence must be regarded as ambiguous
* The main virtue of this doctrine
  1. enables us to treat adjs, within a precise semantical theory eg Montague —
    certain sentences which are false are not branded as logically true. Eg
    (1) Every alleged thief is a thief
    (2) Every small elephant is small
    (3) If every flea is an animal, then every big flea is a big animal
    * Each of these sentences would come out logically true in Montague’s model
      if it were to treat adjectives as ordinary predicates
  2. express ~ adjectives in very simple mathematical terms
    * predicative, privative, affirmative, and extensional
    * assumptions about the comprehensive semantical theory: Montague (1970)
      * possible world semantics
      * the distinctions drawn by the definitions below do not depend on these
      * Each possible interpretation (for the language in question) is based on
        * a non-empty set W of possible worlds/situations/contexts
        * a set U of individuals
      * A property is a function which assigns to each w \in W a subset of U
      * The meaning of a noun phrase is always a property
    * Thus the meanings of adjectives will be functions from properties to props
* We may call an adjective
  * predicative in a given interpretation if
    (4) there is a property QO such that for each property P and each w e W,
    F(P)(w) = P(w) \cap Q(w)
    * given a class K of admissible interpretations,
      an adjective is predicative (with respect to K) :=
      it is predicative in each interpretation (belonging to K)
    * Predicative adjectives behave essentially as independent predicates
      * eg four-legged is treated as predicative
      * _If every N1 is an N: then every four-legged N11 a four-legged N_
    * Predicative adjectives <=> extensions are not affected by the nouns
    * Typical examples: scientific adjectives eg endocrine, diferentiable,
  * privative in a given interpretation if its meaning F satisfies
    (5) for each property P and each w \in W
      F(P)(w) \cap P(w) = \emptyset
    * adjective will be called privative if (5) holds on all admissible interprs
    * when combined with a noun phrase N, produces a complex noun phrase AN that
      is satisfied only by things which do not satisfy N
    * No A N is an N will be a logical truth
    * eg
      * in most contexts are e.g. _false_ and _fake_
      * doubt that there is any English adjective which is privative in all uses
  * affirmative in a given interpretation if:
    (6) for each P and w, F(P)(w) \subseteq P(w)
    * affirmative if (6) holds in all admissible interpretations
    * all predicative adjectives are affirmative
    * the vast majority of adjectives are affirmative
    * not predicative examples are _big, round, pink, bright, sharp, sweet_
  * extensional in a given interpretation if
    (7) there is a function F' from sets of individuals to sets of individuals
      such that for every P and w
      (F(P))(w) = F'(P(w)) and
    extensional if (7) holds in all admissible interpretations
    * ie a predicative adjective is in essence
      an operation on extensions of properties:
      if two properties have the same extension in w then the properties obtained
      by applying the adjective to them also have the same extension in w
    * all predicative adjectives are extensional
    * Non-extensional adjectives are for example _affectionate_ and _skilful_
      * all and only cobblers are darts players !=>
        all and only the skilful cobblers are skilful darts players
      * all men were fathers !=> all affectionate men are affectionate fathers
  * are there adjectives which are extensional but not predicative
    * suggested: _small, tall, heavy_, and _hot_ belong to this category
      * not predicative
      * extensionality follows from a certain proposal according to which
        they derive from their comparatives
        * Let A be an adjective of this kind, and let
        R be the binary relation represented by the phrase _is more A than_
        * The function `\cal A` from properties to properties associated with A
          is then characterized by (8) for any property P and world w
        \cal A(P)(w) = {u \in P(w): for most u' \in P(w) (u, u') \in R(w)}
    * against analyses of positives in terms of comparatives
      * (8) excludes the possibility that, for any property P, most Ps are small
        * eg what we usually call a small car in England would according to (8)
          not be a small car; for we call most English cars small
          * (One might perhaps reply that by small car we mean small model. No.)
          * cars are naturally divided into categories
      * We might have a clear concept of
        the normal size of objects satisfying a certain property,
        even if objects of that size do not or only rarely occur
        * eg we would call almost all members of a species S small
          if there was strong biological evidence that
          only circumstances C’ prevent the majority from growing into a height
          which most members of the species would reach under normal conditions
        * If, moreover, S and S-under-C had precisely the same extensions the
          case would tend to show that small is not purely extensional
    * hE it is difficult to come up with a concrete and convincing example
      * perhaps an indication that small, and similar adjectives, are extensionl

# 2 the comparative and many-valued logic

* perhaps new in the doctrine as I have stated it here
  * what has for a long time been observed to be a feature of __certain__ adjs
    is a commion feature of them all
  * All of them are functions from noun phrases to noun phrases
  * predicative ones
    can behave as predicates, which when combined with a noun phrase give a
    complex equivalent in meaning to the conjunction
* dissatisfied with it for a variety of reasons. Here I will mention only one
  * no adequate treatment for the comparative and superlative
  * I will concentrate on the comparative and leave the superlative aside;
    * but the theory will handle the superlative
* naive point of view: the comparative is
  an operation which forms out of an adjective a binary predicate
  * when we learn a language such as English we learn
    the meanings of individual adjectives and, morcover,
    the semantic function which this comparative-forming operation performs
  * the meaning of an adjective must be such that
    the comparative can be understood as
    a semantic transformation of that meaning into the right binary relation
* if adjectives were ordinary predicates, no such transformation could exist
  * How could we possibly define the relation x is bigger than y in terms of
    nothing more than the extension of the alleged predicate big?
    * I propose for all adjectives what is proposed for _good_ in Geach (1956)
      * good is not even extensional (cf, skilful above)
* Could functions from properties to properties serve as the basis for such
* characterize the transformation as follows:
  For any adjective A with meaning \cal A in a given interpretation we have for
  any u_1, u_2 \in U and w \in W
  (9) u_1 is more A than u_2 in w iff
  * for every property P such that u_1 and u_2 both belong to P(w)
    if u_2 belongs to \cal A(P)(w) then so does u_1
  * there is a property P such that u_1, u_2 \in P(w),
    u_1 \in \cal A(P)(w), and u_2 \notin \cal A(P)(w)
* I doubt whether (b) is a necessary condition
  * eg _tall_
  * adjectives can apply to things in various degrees
  * when we learn the meaning of an adjective we learn to distinguish
    to what degree, or extent, the adjective applies to the various entities
  * Once we have learned this we are able to understand the comparative of the
    adjective without additional explanation, provided we understand the
    function of the comparative in general,
* In order to give my view on the primacy of positive [alapfok] over comparative
  * I will develop a semantical framework in which the idea of ~ is precise
    * a predicate being true of an entity to a certain degree 
  * closely related to vagueness and contextual disambiguation
    * I hope that my theory will provide a framework for these as well
* multi-valued, or many-valued logic
  * a theory of formal logic
  * often proposed just for the solution of these problems
  * propositional/predicate logic
    * Most systems of multi-valued logic are systems of propositional calculus
    * for our purpose: multi-valued predicate logic
    * But for reasons of exposition: the simpler propositional logics
  * differ in their model theories
  * syntactically indistinguishable from standard ordinary propositional calcul
    * I will consider only such multi-valued systems
  * an infinite set `q_i` of propositional variables
  * neg, \wedge, v, ->, <->
  * A multi-valued semantics for Z, will provide a model theory based upon
    * set TV (of ‘truth values’) the cardinality of which is >2
    * A model for L, according to such a model theory based upon TV is
      a function which assigns to each variable g; an element of TV
    * to uniquely determine the (truth) valucs of the complex formulae of Z,
      another component F specifies for each t_1, t_2 in TV
      the value is of neg, \wedge and similarly for the other connectives
  * The definition of logical truth requires a third component of the theory
    * singles out a proper non-empty subset `TV_t` of TV,
      the set of ‘designated’ truth values
    * A formula will be regarded as logically true if in each model it has a
      value belonging to TV_t
    * Logical consequence can be defined in an analogous manner
* natural to require of a many-valued model theory for L
  (10) there are two particular elements of TV —let us call them o and 1 —
    (i) 1 \in TV_t, absolute truth
    (ii) 0 \notin TV_t, absolute falsehood
    (iii) for each connective C, the restriction of F(C) to {0,1} is the usual
* those model theories for `L_0`, which have been seriously proposed in the
  literature do indeed satisfy (10)
* The vast majority of these theories assume, morcover, a
  linear ordering of the members of TV with respect to which o is smallest
* which F ‘correctly captures’ the function of the connectives `not, and, or`,..
  given a particular interpretation of what the truth values in TV represent
* Let us consider TV = i / n-1 for i in 1..n-1, degrees of truth
* What F would adequately reflect our intuitions
  * I think there are no such functions
  * because the connectives not, and, or.. are not functions of degrees of truth
  * eg F(neg). The natural suggestion here is that F(k) = 1-k
    * \phi \wedge \neg \phi = 0
    * \phi \wedge \phi = \phi
    * \phi = 1/2
    * 0 = 1/2 \wedge 1/2 = 1/2
* the truth value of a complex formula say \phi \wedge \psi should depend on
  * not just the truth values of the components
  * but also certain aspects of these formulae which
    contribute to their truth values but
    cannot be unambiguously recaptured from them
* two-element sets are the only linearly ordered truth-value sets which can be
  regarded as Boolean algebras in the following sense:
  * If we define the Boolean operations \cap, U, — in the usual manner in terms
    of the ordering relation < of a linearly ordered set TV (i.c. if we put
        C \cap C’ := the largest C” under < such that C"<C and C"<C";
        C U C’ := the smallest C” such that C<C” and C’ <C"; and
        \bar C as the largest C’ such that C cap \bar C = \emptyset
    * if TV consists of two elements, 0 and 1, we obtain the 2-elem Boolean
    * otherwise the resulting algebra is not a Boolean algebra
      * the equation C U \bar C = 1 will no longer be satisfied by all Cs

# 3 Truth value sets consisting of sets and reduced to prob, partial interpret

* choose as truth-value sets not linear orderings, but rather sets which, like
  * sets display the structure of the propositional calculus, viz. Boolean algeb
  * We may then further ‘reduce’ these Boolean algebras to linearly ordered syss
    * different Boolean values may be assigned the
    same element of the linear ordering. But this will
    * no longer affect our semantic characterization of the connectives, as
    * sem char defed in the Boolean truth-value space
    * even if \phi and \psi have the same ultimate value,
      \phi \cap \khi has a different ultimate value from that of \psi \cap \khi
* idea is by now quite familiar to logicians
  * its use for our problems  occurred late
  * in probability theory it has been accepted as the standard solution
  * the theory of probability in the definitive form that Kolmogorov (1970) gave
    * one associates with a proposition in first instance a certain set
    * With this sct is associated in turn a real number in [0:1]. This number
      * the probability of the proposition
    * while the set associated with the conjunction of two propositions is a
      just the intersection of the sets associated with the conjuncts, viz
    * there is no way of telling in general the probability of the conjunction
      on the basis of just the probabilities of the conjuncts; and this is
* the main philosophical problem which this approach raises is the
  * plausible interpretation of the sets with which propositions are associated
  * I will consider here only one doctrine, according to which
  * the elements of the sets are regarded as possible worlds, or possible situs
  * the probability of a proposition is measured in terms of the set of those ws
  * ie probability theory is closely connected with the possible-world semantics
    for modal and other types of non-extensional logic.
  * Both theories associate with a given sentence in any particular interpret
    a set (of possible worlds, points of reference, contexts, etc.).
  * hE probability theory and intensional logic are about different problems
    * In intensional logic we are primarily concerned with the analysis, in
      terms of the set of all possible ‘worlds’ (as well as, perhaps, various
      structural properties of this set), of
      the semantical function of certain non-truth functional operators, such as
      _it is necessarily the case that_
    * In probability theory one does not consider such intensional operators,
      * concentrates on the probability function which associates real numbers
      * how the probabilities of certain complex expressions depend on the
        probabilities of their components 
        often under assumptions eg independence or disjointness.
* partial interpretations and supervaluations
  * another theory of formal semantics which fits within this general frame 
  * in its simplest form,
    a gencralization of ordinary two-valucd model theory, which
    * some sentences of the language are neither true nor false
      * in a given interpretation for a certain formal language (say, of
        ordinary first order logic with description operator)
  * in order to avoid that
    whenever p is without truth value, so are, among others, p \wedge \neg p and
    p V \neg p,
    one considers the collection of all interpretations which extend the given
    interpretation by filling out its truth gaps in a consistent manner.
    * If a formula comes out true/f in cach of these completions
      it will be regarded as true/f in the interpretation
      even if it is not assigned a truth value directly by the (incomplete)
      recursive definition of truth.
* One may view this process again as one of assigning sets to sentence interpres
  * to each sentence is assigned
    the set of all completions in which it is true
  * Sentences already true in the given interpretation, and also
    such sentences as p v \neg p where p itself is not assigned a truth value
    * will be assigned the set of all completions,
  * those already false as well as sentences such as p \wedge \neg p
    will be assigned the empty set
  * only sentences which neither have a truth value in virtue of the recursive
    truth definition nor have the form of a logical identity or contradiction
    may be assigned intermediate sets.
  * first introduced by Van Fraassen (1969)
  * for an analysis of vagueness
    * Vagueness is one of the various reasons why sentences may lack truth value
    * the world, or any specific speech situation in it,
      provides at best a partial interpretation
    * consider the various completions in which all vagueness is resolved
    * The quantity of such completions in which a certain sentence is true 
      = a measure for the degree to which the sentence is true in the original
      interpretation
    * apply not only to adjectives but other POSs as well, in particular to
      * common nouns and intransitive verbs
      * like adjectives, are usually treated as 1-place predicates
        in simple-minded predicate-logic-symbolizations
      * later: systematic differences between the sem of adjectives and these 2
* These considerations naturally lead to a
  modification of the model theory for formal or natural languages 
  * I will exemplify for a rather simple case, viz. first order predicate logic.
  * The example will make it clear enough how one could adapt similarly
    eg those for intensional logics or for fragments of natural languages.
* A partial model for L is a pair (U,F) where
  (i) U is a non-empty set and
  (ii) F assigns to each letter `Q_i^n`; an ordered pair (F^+(Q_i^n),F^-(Q_i^n))
    of disjoint n-place-relations on U,
* The partial model M = (U,F) is said to be at least as vague
  as the partial model M’ = (U,F’) (in symbols: M \subseteq M’)
* To each classical model (U,F) for L corresponds a unique partial model, viz.
  the model (U,F’) where for each Q7,,

# 4

* supervaluation: one considers partial models in conjunction with __all__ their
  completions
  * What I want to do here is formally almost the same — but with one crucial
  * consider only a subset of completions
  * In addition we consider a probability function over a field of subsets of
    this set of completions,! which contains, in particular,
  * for each formula and assignment of elements to its free variables
    the set of all completions in which the former satisfies that assignment.
    (This condition warrants that each sentence has a measure.)
  * a vague model: The complex consisting of
    the partial model, the set of completions, the field over that set and
    the probability function over that field. Formally
A vague model for L is a quadruple
  * M is a partial model for L;
  * C is a set of classical models for L which are completions of M;
  * F is a field of subsets over #
  * for each \phi \in L and assignment a in the universe of M, {M'e?: [#lure =}
  * p is a probability measure on F?
* Let .  = ((U,F),£,F,p) be a vague model for L. For any formula \phi of L and
  assignment a of elements of U to the variables the
  degree of satisfaction of \phi by a in M, `[\phi]_{M,a}`, is defined as
  `p({M’ \in C: [\phi]_{M',a} = 1})`. Thus,
* The idea behind the notion of a vague model is this: language is vague. The
  * eg the adjective mtelligent
  * Our present criteria tell us of certain people that they are intelligent, of
    certain others that they definitely are not, but
    there will be a large third category of people about whom they do not tell
  * Now suppose that we make our standard more specific, e.g., by stipulating
    that to have an I.Q. over a certain minimum is necessary and sufficient
  * Further, suppose that of two persons u_1, and u_2, of the third category u_1
    has a higher I.Q. than u_2
  * Then, whatever we decide this minimum to be, our decision will put u_1 into
    the extension if it puts u_2 into it
* My original motivation in setting up this framework was to give a
  uniform characterization of the operation
  which transforms adjectives into their comparatives
  * The relation x ts more A than y (where A is any adjective) can be defined in
    terms of the relation _x is at least as A as y_ 
  * there are minor but undeniable advantages in discussing the relation _at
    least as,..as_. I will concentrate on that concept.

# 5

# 6

# 7
