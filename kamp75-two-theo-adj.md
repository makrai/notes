Two theories about adjectives
JAW Kamp

# 1 Predicative, privative, affirmative, and extensional adjectives

* the first theo
  * dates from the late 1960s
  * stated in Montague (1970) and Parsons (1968).
  * the meaning of an adjective is
    a function which maps the meanings of noun phrases onto other such meanings;
  * Predicative uses are explained as elliptic attributive uses
    eg This dog is clever -> This dog 1s a clever dog/animal/being
    *  Which noun phrase ought to be supplied in this reduction of predicative
       to attributive use is in general not completely determined by the sent
    * the sentence must be regarded as ambiguous.
* The main virtue of this doctrine is that it
  1. enables us to treat adjs, within a precise semantical theory eg Montague —
    certain sentences which are false are not branded as logically true. Examples of
    (1) Every alleged thief is a thief
    (2) Every small elephant is small
    (3) If every flea is an animal, then every big flea is a big animal
    * Each of these sentences would come out logically true in Montague’s model
      if it were to treat adjectives as ordinary predicates, so that the logical
  2. express ~ in very simple mathematical terms some
    * predicative, privative, affirmative, and extensional adjectives
    * assumptions about the comprehensive semantical theory: Montague (1970)
      * possible world semantics that
      * the distinctions drawn by the definitions below do not depend on these
      * Each possible interpretation (for the language in question) is based upon
        * a certain non-empty set W of possible worlds/situations/contexts
        * a set U of individuals.
      * A property is a function which assigns to each weW a subset of U
      * The meaning of a noun phrase is always a property.
    * Thus the meanings of adjectives will be functions from properties to props
* We may call an adjective
  * predicative in a given interpretation if
    (4) there is a property QO such that for each property P and each w e W,
    F(P)(w) = P(w) \cap Q(w)
    * given a class K of admissible interpretations,
      an adjective is predicative (with respect to K) if only if
      it is predicative in each interpretation (belonging to K).
    * Predicative adjectives behave essentially as independent predicates. If
      * eg four-legged is treated as predicative then any sentence
      * _If every N1 is an N: then every four-legged N11 a four-legged N_, where
    * Predicative adjectives <=> extensions are not affected by the nouns
    * Typical examples scientific adjectives eg endocrine, diferentiable,
  * privative in a given interpretation if its meaning F satisfies
    (5) for each property P and each w \in W F(P)(w) \cap P(w) = \emptyset
    * adjective will be called privative if (5) holds on all admissible interprs
    * when combined with a noun phrase N produces a complex noun phrase AN that
      is satisfied only by things which do not satisfy N. If A is a privative
    * No A N is an N will be a logical truth. Adjectives that behave in this way
    * eg
      * in most contexts are e.g. false and fake
      * doubt that there is any English adjective which is privative in all of
        its possible uses.
  * affirmative in a given interpretation if its meaning satisfies
    (6) for each P and w, F(P)(w) \subseteq P(w)
    * affirmative if (6) holds in all admissible interpretations.
    * all predicative adjectives are affirmative. But there are many more. In
    * the vast majority of adjectives are affirmative. Typical examples of
    * not predicative examples are big, round, pink, bright, sharp, sweet,
  * extensional in a given interpretation if
    (7) there is a function F' from sets of individuals to sets of individuals
      such that for every P and w
      (F(P))(w) = F'(P(w)) and
    extensional if (7) holds in all admissible interpretations.
  * ie a predicative adjective is in essence
    an operation on extensions of properties:
    if two properties have the same extension in w then the properties obtained
    by applying the adjective to them also have the same extension in w
  * all predicative adjectives are extensional
  * Non-extensional adjectives are for example _affectionate_ and _skilful_
    * all and only cobblers are darts players !=>
      all and only the skilful cobblers are skilful darts players;! and even if
    * all men were fathers !=> all affectionate men are affectionate fathers
  * are there adjectives which are extensional but not predicative. It has
    * suggested: small, tall, heavy, and hot belong to this category.
      * not predicative, whereas their
      * extensionality follows from a certain proposal according to which
        they derive from their comparatives
        Let A be an adjective of this kind, and let
        R be the binary relation represented by the phrase _is more A than_
        The function `\cal A` from properties to properties which is associated
        with A is then characterized by (8) for any property P and world w
        \cal A(P)(w) = {u \in P(w): for most u' \in P(w) (u, u') \in R(w)}
    * against analyses of positives in terms of comparatives
      * (8) excludes the possibility that, for any property P, most Ps are small
        * eg what we usually call a small car in England would according to (8)
          not be a small car; for we call most English cars small.
          (One might perhaps reply that by small car we mean small model. No.)
          * cars are naturally divided into categories; and it is to these, if
      * We might have a clear concept of
        the normal size of objects satisfying a certain property,
        even if objects of that size do not or only rarely occur. It is
        * eg we would then call almost all members of a species S small
          if there was strong biological evidence that
          only circumstances C’ prevent the majority from growing into a height
          which most members of the species would reach under normal conditions
        * If, moreover, S and Sunder-C had precisely the same extensions the
          case would tend to show that small is not purely extensional. But that
        * it is difficult to come up with a concrete and convincing example of
          * perhaps an indication that for all practical purposes
            small, and similar adjectives, are indeed extensional

# 2 the comparative and many-valued logic

* perhaps new in the doctrine as I have stated it here is the emphasis on that
  * what has for a long time been observed to be a feature of certain adjectives
    is a commion feature of them all
  * All of them are functions from noun phrases to noun phrases. Some adjectives
  * predicative ones
    can behave as predicates, which when combined with a noun phrase give a
    complex equivalent in meaning to the conjunction
* dissatisfied with it for a variety of reasons. Here I will mention only one
  * no adequate treatment for the comparative and superlative. For reasons of
  * I will concentrate on the comparative and leave the superlative aside; but
    the theory which will emerge from our considerations will handle the superlt
* naive point of view the comparative is
  an operation which forms out of an adjective a binary predicate. I believe
  * when we learn a language such as English we learn
    the meanings of individual adjectives and, morcover,
    the semantic function which this comparative-forming operation performs i
  * the meaning of an adjective must be such that the comparative can be
    understood as a semantic transformation of that mceaning into the right
    binary relation.
* if adjectives were ordinary predicates no such transformation could exist
  * How could we possibly define the relation x is bigger than y in terms of
    nothing more than the extension of the alleged predicate big?  A clear
    * I propose for all adjectives what is proposed for good in Geach (1956)
      * good is not even extensional (cf, skilful above).128
* Could functions from properties to properties serve as the basis for such a
* characterize the transformation as follows:
  * for every property P such that w, and u, both belong to P(w) if belongs to
    s/(P)(w) then so does u,
  * there is a property P such that u,,u, € P(w), u, € (P)(w), and u, ¢ S(P)(w).
* I doubt whether (b) is a necessary condition. Take
  * eg tall, for
  * adjectives can apply to things in various degrees. It is my strong
  * when we learn the meaning of an adjective we learn, as part of it, to
    distinguish or lesser precision to what degree, or extent, the adjective
    applies to the various entities to_ which it applies at all
  * Once we have learned this we are able to understand the comparative of the
    adjective without additional explanation, provided we understand the
    function of the comparative in general,
* In order to give my view on the primacy of positive [alapfok] over comparative
  * I will develop a semantical framework in which the idea of
    a predicate being true of an entity to a certain degree can be made precise. This
  * closely related to vagueness and contextual disambiguation; indeed
    * I hope that the my theory will provide an framework for these as well.
* multi-valued, or many-valued logic.
  * a theory of formal logic which has been
  * often proposed just for the solution of these problems with which I want to
  * propositional/predicate
    * Most systems of multi-valued logic are systems of propositional calculus
    * for our purpose: multi-valued predicate logic.
    * But for reasons of exposition: the simpler propositional logics.
  * differ in their model theories. Indeed many such systems are
  * syntactically indistinguishable from standard ordinary propositional calcul
    and I will consider for the time being only such systems of multi-valued
  * an infinite set `q_i` of propositional variables. Starting with these we can
  * neg, \wedge, v, ->, <->
  * A multi-valued semantics for Z, will provide a model theory based upon some
    * set TV (of ‘truth values’) the cardinality of which is >2. Two-valued
    * A model for L, according to such a model theory based upon TV is
      a function which assigns to each variable g; an element of TV. Such a
    * to uniquely determine the (truth) valucs of the complex formulae of Z in
      * another component F specifies for each t_1, t_2 in TV what the value is
        of neg, \wedge and similarly for the other connectives.
  * The definition of logical truth requires a third component of the theory
    * singles out a proper non-empty subset `TV_t` of TV, the set of ‘desig-
      nated’ truth values.
    * A formula will be regarded as logically true if in each model it has a
      value belonging to TV_t
    * Logical consequence can be defined in an analogous manner.
* natural to require of a model theory for L, based upon a truth value set of
  (10) there are two particular elements of TV —let us call them o and 1 —
    (i) 1 \in TV_t, absolute truth
    (ii) 0 \notin TV_t, absolute falsehood
    (iii) for each connective C, the restriction of F(C) to {0,1} is the usual
* those model theories for L_0, which have been seriously proposed in the
  literature do indeed satisfy (10)
  * The vast majority of these theories assume, morcover,
    a linear ordering of the members of TV with respect to which o is smallest
* which F ‘correctly captures’ the function of the connectives not, and,
  or,...given a particular interpretation of what the truth values in TV
  really represent.
* Let us consider TV = i / n-1 for i in 1..n-1, degrees of truth
* What F would adequately reflect our intuitions
  * I think there are no such functions. The
  * because the connectives not, and, or,...are not functions of degrees of trut
  * eg F(neg). The natural suggestion here is that F(k) = 1-k i.e. that the
    * \phi \wedge \neg \phi = 0
    * \phi \wedge \phi = \phi
    * \phi = 1/2
    * 0 = 1/2 \wedge 1/2 = 1/2
* the truth value of a complex formula say \phi \wedge \psi should depend not
  just on the truth values of the components but also on
  certain aspects of these formulae which
  contribute to their truth values but
  cannot be unambiguously recaptured from them.
* two-clement sets are the only linearly ordered truth-value sets which can be
  regarded as Boolean algebras in the following sense:
  * If we define the Boolean operations \cap, U, — in the usual manner in terms
    of the ordering relation < of a linearly ordered set TV (i.c. if we put
        C \cap C’ = df the largest C” under <such that C"<C and C"<C";
        C U C’ = df the smallest C” such that C<C” and C’ <C"; and
        \bar C as the largest C’ such that C cap \bar C = \emptyset
    then, if TV consists of two elements, 0 and 1, we obtain the 2-elem Boolean
    otherwise the resulting algebra is not a Boolean algebra
    In particular the equation C U \bar C = 1 will no longer be satisfied by all

# 3

# 4

# 5

# 6

# 7
