Two theories about adjectives
JAW Kamp

* two theories
  1. adj is a function from properties to properties 
  2. adj is an ambiguous predicate which is disambiguated by accompanying
     expressions for properties

# 1 Predicative, privative, affirmative, and extensional adjectives

* the first theo (2nd in sec 6)
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
     certain sentences which are false are not branded as logically true. Eg (1)
     Every alleged thief is a thief (2) Every small elephant is small (3) If
     every flea is an animal, then every big flea is a big animal
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
  * predicative in a given interpretation if (4) there is a property QO such
    that for each property P and each w e W, F(P)(w) = P(w) \cap Q(w)
    * given a class K of admissible interpretations, an adjective is predicative
      (with respect to K) := it is predicative in each interpretation (belonging
      to K)
    * Predicative adjectives behave essentially as independent predicates
      * eg four-legged is treated as predicative
      * _If every N1 is an N: then every four-legged N11 a four-legged N_
    * Predicative adjectives <=> extensions are not affected by the nouns
    * Typical examples: scientific adjectives eg endocrine, diferentiable,
  * privative in a given interpretation if its meaning F satisfies (5) for each
    property P and each w \in W F(P)(w) \cap P(w) = \emptyset
    * adjective will be called privative if (5) holds on all admissible interprs
    * when combined with a noun phrase N, produces a complex noun phrase AN that
      is satisfied only by things which do not satisfy N
    * No A N is an N will be a logical truth
    * eg
      * in most contexts are e.g. _false_ and _fake_
      * doubt that there is any English adjective which is privative in all uses
  * affirmative in a given interpretation if: (6) for each P and w, F(P)(w)
    \subseteq P(w)
    * affirmative if (6) holds in all admissible interpretations
    * all predicative adjectives are affirmative
    * the vast majority of adjectives are affirmative
    * not predicative examples are _big, round, pink, bright, sharp, sweet_
  * extensional in a given interpretation if (7) there is a function F' from
    sets of individuals to sets of individuals such that for every P and w
    (F(P))(w) = F'(P(w)) and extensional if (7) holds in all admissible
    interpretations
    * ie a predicative adjective is in essence an operation on extensions of
      properties: if two properties have the same extension in w then the
      properties obtained by applying the adjective to them also have the same
      extension in w
    * all predicative adjectives are extensional
    * Non-extensional adjectives are for example _affectionate_ and _skilful_
      * all and only cobblers are darts players !=> all and only the skilful
        cobblers are skilful darts players
      * all men were fathers !=> all affectionate men are affectionate fathers
  * are there adjectives which are extensional but not predicative
    * suggested: _small, tall, heavy_, and _hot_ belong to this category
      * not predicative
      * extensionality follows from a certain proposal according to which they
        derive from their comparatives
        * Let A be an adjective of this kind, and let R be the binary relation
          represented by the phrase _is more A than_
        * The function `\cal A` from properties to properties assoced with A is
          then characterized by (8) for any property P and world w \cal A(P)(w)
          = {u \in P(w): for most u' \in P(w) (u, u') \in R(w)}
    * against analyses of positives in terms of comparatives
      * (8) excludes the possibility that, for any property P, most Ps are small
        * eg what we usually call a small car in England would according to (8)
          not be a small car; for we call most English cars small
          * (One might perhaps reply that by small car we mean small model. No.)
          * cars are naturally divided into categories
      * We might have a clear concept of the normal size of objects satisfying a
        certain property, even if objects of that size do not or only rarely
        occur
        * eg we would call almost all members of a species S small if there was
          strong biological evidence that only circumstances C’ prevent the
          majority from growing into a height which most members of the species
          would reach under normal conditions
        * If, moreover, S and S-under-C had precisely the same extensions the
          case would tend to show that small is not purely extensional
    * hE it is difficult to come up with a concrete and convincing example
      * perhaps an indication that small, and similar adjectives, are extensionl

# 2 the comparative and many-valued logic

* perhaps new in the doctrine as I have stated it here
  * what has for a long time been observed to be a feature of __certain__ adjs
    is a commion feature of them all
  * All of them are functions from noun phrases to noun phrases
  * predicative ones can behave as predicates, which when combined with a noun
    phrase give a complex equivalent in meaning to the conjunction
* dissatisfied with it for a variety of reasons. Here I will mention only one
  * no adequate treatment for the comparative and superlative
  * I will concentrate on the comparative and leave the superlative aside;
    * but the theory will handle the superlative
* naive point of view: the comparative is an operation which forms out of an
  adjective a binary predicate
  * when we learn a language such as English we learn the meanings of individual
    adjectives and, morcover, the semantic function which this
    comparative-forming operation performs
  * the meaning of an adjective must be such that the comparative can be
    understood as a semantic transformation of that meaning into the right
    binary relation
* if adjectives were ordinary predicates, no such transformation could exist
  * How could we possibly define the relation x is bigger than y in terms of
    nothing more than the extension of the alleged predicate big?
    * I propose for all adjectives what is proposed for _good_ in Geach (1956)
      * good is not even extensional (cf, skilful above)
* Could functions from properties to properties serve as the basis for such
* characterize the transformation as follows: For any adjective A with meaning
  \cal A in a given interpretation we have for any u_1, u_2 \in U and w \in W
  (9) u_1 is more A than u_2 in w iff
  * for every property P such that u_1 and u_2 both belong to P(w) if u_2
    belongs to \cal A(P)(w) then so does u_1
  * there is a property P such that u_1, u_2 \in P(w), u_1 \in \cal A(P)(w), and
    u_2 \notin \cal A(P)(w)
* I doubt whether (b) is a necessary condition
  * eg _tall_
  * adjectives can apply to things in various degrees
  * when we learn the meaning of an adjective we learn to distinguish to what
    degree, or extent, the adjective applies to the various entities
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
    * A model for L, according to such a model theory based upon TV is a
      function which assigns to each variable g; an element of TV
    * to uniquely determine the (truth) valucs of the complex formulae of Z,
      another component F specifies for each t_1, t_2 in TV the value is of neg,
      \wedge and similarly for the other connectives
  * The definition of logical truth requires a third component of the theory
    * singles out a proper non-empty subset `TV_t` of TV, the set of
      ‘designated’ truth values
    * A formula will be regarded as logically true if in each model it has a
      value belonging to TV_t
    * Logical consequence can be defined in an analogous manner
* natural to require of a many-valued model theory for L (10) there are two
  particular elements of TV —let us call them o and 1 — (i) 1 \in TV_t, absolute
  truth (ii) 0 \notin TV_t, absolute falsehood (iii) for each connective C, the
  restriction of F(C) to {0,1} is the usual
* those model theories for `L_0`, which have been seriously proposed in the
  literature do indeed satisfy (10)
* The vast majority of these theories assume, morcover, a linear ordering of the
  members of TV with respect to which o is smallest
* which F ‘correctly captures’ the function of the connectives `not, and, or`,.
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
  * but also certain aspects of these formulae which contribute to their truth
    values but cannot be unambiguously recaptured from them
* two-element sets are the only linearly ordered truth-value sets which can be
  regarded as Boolean algebras in the following sense:
  * If we define the Boolean operations \cap, U, — in the usual manner in terms
    of the ordering relation < of a linearly ordered set TV (i.c. if we put C
    \cap C’ := the largest C” under < such that C"<C and C"<C"; C U C’ := the
    smallest C” such that C<C” and C’ <C"; and \bar C as the largest C’ such
    that C cap \bar C = \emptyset
    * if TV consists of two elements, 0 and 1, we obtain the 2-elem Boolean
    * otherwise the resulting algebra is not a Boolean algebra
      * the equation C U \bar C = 1 will no longer be satisfied by all Cs

# 3 Truth value sets consisting of sets and reduced to prob, partial interpret

* choose as truth-value sets not linear orderings, but rather sets which, like
  * sets display the structure of the propositional calculus, viz. Boolean algeb
  * We may then further ‘reduce’ these Boolean algebras to linearly ordered syss
    * different Boolean values may be assigned the same element of the linear
      ordering. But this will
    * no longer affect our semantic characterization of the connectives, as
    * sem char defed in the Boolean truth-value space
    * even if \phi and \psi have the same ultimate value, \phi \cap \khi has a
      different ultimate value from that of \psi \cap \khi
* idea is by now quite familiar to logicians
  * its use for our problems  occurred late
  * in probability theory it has been accepted as the standard solution
  * the theory of probability in the definitive form that Kolmogorov (1970) gave
    * one associates with a proposition in first instance a certain set
    * With this sct is assoced in turn a real number in [0:1]. This number
      * the probability of the proposition
    * while the set assoced with the conjunction of two propositions is a just
      the intersection of the sets assoced with the conjuncts, viz
    * there is no way of telling in general the probability of the conjunction
      on the basis of just the probabilities of the conjuncts; and this is
* the main philosophical problem which this approach raises is the
  * plausible interpretation of the sets with which propositions are assoced
  * I will consider here only one doctrine, according to which
  * the elements of the sets are regarded as possible worlds, or possible situs
  * the probability of a proposition is measured in terms of the set of those ws
  * ie probability theory is closely connected with the possible-world semantics
    for modal and other types of non-extensional logic
  * Both theories associate with a given sentence in any particular interpret a
    set (of possible worlds, points of reference, contexts, etc.)
  * hE probability theory and intensional logic are about different problems
    * In intensional logic we are primarily concerned with the analysis, in
      terms of the set of all possible ‘worlds’ (as well as, perhaps, various
      structural properties of this set), of the semantical function of certain
      non-truth functional operators, such as _it is necessarily the case that_
    * In probability theory one does not consider such intensional operators,
      * concentrates on the probability function which associates real numbers
      * how the probabilities of certain complex expressions depend on the
        probabilities of their components often under assumptions eg
        independence or disjointness
* partial interpretations and supervaluations
  * another theory of formal semantics which fits within this general frame 
  * in its simplest form, a gencralization of ordinary two-valucd model theory,
    which
  * some sentences of the language are neither true nor false
    * in a given interpretation for a certain formal language (say, of ordinary
      first order logic with description operator)
  * in order to avoid that whenever p is without truth value, so are p \wedge
    \neg p and p V \neg p, one considers the collection of all interpretations
    which extend the given interpretation by filling out its truth gaps in a
    consistent manner
    * If a formula comes out true/f in each of these completions it will be
      regarded as true/f in the interpretation even if it is not assigned a
      truth value directly by the (incomplete) recursive definition of truth
* this process again assigning sets to sentence interprets
  * to each sentence is assigned the set of all completions in which it is true
  * Sentences already true in the given interpretation, and also such sentences
    as `p v \neg p` where p itself is not assigned a truth value will be
    assigned the set of all completions,
  * those already false as well as sentences such as `p \wedge \neg p` will be
    assigned the empty set
  * only sentences which neither have a truth value in virtue of the recursive
    truth definition nor have the form of a logical identity or contradiction
    may be assigned intermediate sets
  * first introduced by Van Fraassen (1969)
  * for an analysis of vagueness
    * Vagueness is one of the reasons why sentences may lack truth value
    * the world, or any specific speech situation in it, provides at best a
      partial interpretation
    * consider the various completions in which all vagueness is resolved
    * The quantity of such completions in which a certain sentence is true = a
      measure for the degree to which the sentence is true in the original
      interpretation
    * apply not only to adjectives but other POSs as well, in particular to
      * common nouns and intransitive verbs
      * like adjectives, are usually treated as 1-place predicates in
        simple-minded predicate-logic-symbolizations
      * later: systematic differences between the sem of adjectives and these 2
* These considerations naturally lead to a modification of the model theory for
  formal or natural languages 
  * I will exemplify for a rather simple case, viz. first order predicate logic
  * The example will make it clear enough how one could adapt similarly eg those
    for intensional logics or for fragments of natural languages
* A partial model for L is a pair (U,F) where (i) U is a non-empty set and (ii)
  F assigns to each letter `Q_i^n`; an ordered pair (F^+(Q_i^n),F^-(Q_i^n)) of
  disjoint n-place-relations on U,
* The partial model M = (U,F) is said to be at least as vague as the partial
  model M’ = (U,F’) (in symbols: M \subseteq M’)
* To each classical model (U,F) for L corresponds a unique partial model, viz
  the model (U,F’) where for each Q7,,

# 4 supervaluation, degree of satisfaction, degree of truth

* supervaluation: one considers partial models in conjunction with __all__ their
  completions
  * What I want to do here is formally almost the same — but
  * consider only a subset of completions
  * In addition we consider a probability function over a field of subsets of
    this set of completions,! which contains, in particular,
  * for each formula and assignment of elements to its free variables the set of
    all completions in which the former satisfies that assignment (This
    condition warrants that each sentence has a measure.)
  * a vague model: The complex consisting of the partial model, the set of
    completions, the field over that set and the probability function over that
    field.
    * Formally A vague model for L is a quadruple
      * M is a partial model for L;
      * C is a set of classical models for L which are completions of M;
      * F is a field of subsets over C
      * for each \phi \in L and assignment `a` in the universe of M, {M' \in C:
        [\phi]_{M',a} = 1} \in F
      * p is a probability measure on F
* Let M  = ((U,F),C,F,p) be a vague model for L. For any formula \phi of L and
  assignment `a` of elements of U to the variables the degree of satisfaction of
  \phi by a in M, `[\phi]_{M,a}`, is defined as `p({M’ \in C: [\phi]_{M',a} =
  1})`
* The idea behind the notion of a vague model is this: language is vague
  * eg the adjective itelligent
  * Our present criteria tell us of certain people that they are intelligent, of
    certain others that they definitely are not, but there will be a large third
    category of people about whom they do not tell
  * Now suppose that we make our standard more specific, e.g., by stipulating
    that to have an I.Q. over a certain minimum is necessary and sufficient
  * Further, suppose that of two persons u_1, and u_2, of the third category u_1
    has a higher I.Q. than u_2
  * Then, whatever we decide this minimum to be, our decision will put u_1 into
    the extension if it puts u_2 into it
* My original motivation in setting up this framework was to give a uniform
  characterization of the operation which transforms adjectives into their
  comparatives
  * The relation x is more A than y (where A is any adjective) can be defined in
    terms of the relation _x is at least as A as y_ 
  * there are minor but undeniable advantages in discussing the relation _at
    least as,..as_. I will concentrate on that concept
* Let us assume that some of the one-place predicates of L represent adjectives,
  in particular Q_l^l. We add to L the operator symbol \ge. 
  * \ge forms out of one one-place predicate Q a two-place relation \ge(Q)(x,y)
  * x is at least as Q as y. (What relation
  * Let M = <M,C,F p> be a vague model for L
  * In order to expand M to a model for L' we must determine
    * the positive and negative extensions of the relation \ge(Q) in M as well
    * \ge's extensions in all the members of C
* positive extension in M. Two possible definitions come to mind (neg ext in sec
  5, page 145)
  12. an element u_1 of U stands (definitely) in the relation to u_2, if for
  every member M’ of C in which u_2 belongs to the extension of Q u_1 belongs to
  that extension as well
  13. u_1 stands in the relation to u_2 if the measure of the set of completions
  in which u_1 belongs to the extension of Q is at least as large as that of the
  set of completions in which u_2 belongs to the extension
  * a flaw which the 2 defs share
    * Neither (12) nor (13) allows for the possibility that the comparative
      relation holds between two objects for each of which it is beyond doubt
    * For if both u, and 2, belong to F^+(Q!) then [Q(v_1)]_{M,a1} =
      [Q(v_1)]_{M,a2} = = 1 
* we need to consider models M in which the set C comprises besides completions
  of M also complete models which in certain ways conflict with M
  * Such models will represent (hypothetical) situations in which the standards
    for a predicate are set so high that certain objects which already have that
    predicate in M now fail to have it— or else in which the standards are set
    so low that objects belonging to the negative extension of the predicate in
    M now fall in its positive
* define the degree of truth of a sentence of L just as before except that we
  now consider the conditional probability of a certain set of completions of M
  on the set of all completions of Min ¥
* eg
  * Q! represents the adjective heavy;
  * all other predicates represent properties of, and relations between,
    material objects, and (for simplicity) that Q} is the only vague predicate.
  * U be the set of material objects and let M = (M,¥,F,p) be a graded
    representation (restricted to material objects) of the actual world
  * What should in this case C and p be? 
    * C: For cach real number r there will be a member M of C in which the
      extension of Q} consists of those objects whose weight (in grams) exceeds
      r.
    * It is not possible to say precisely what the function p should be. But
    * there should be a strictly monotonic function f from the set of all
      positive real numbers into the interval [0,1] so that for any object «
      with weight 7, p(Q((v)]_{M,a} = f(r) 
    * p =  intermediate truth value

# 5 Compar the 2 defs of posit, context, maximal chains, rather, very 10

* compare (12) and (13) (12) u, 1s at least heavy as w, just in case the set of
  models in which wu, is heavy is true cludes the class of those which render u,
  is heavy true; and this will be
    * precisely the proposal that found in Lewis (1970), where it is attributed
      to David Kaplan.  (13) u, will be at least as heavy as 2, provided u, is
      heavy is true jn a set of models with measure greater than or equal to
      that of the set of models in which u, is heavy is true
* the two defs are not always equivalent.
* eg Suppose for example that Smith, though less quick-witted than Jones, is
  much better at solving mathematical problems. Is Smith cleverer than Jones?
  * quick-wittedness and problem-solving facility no canon for weighing these
    criteria agzinst each other 
  13. not clear how the probability function of a graded model # representing
  this situation should be defined. Yet, if we assume that the third
  * according to 12, Jones and Smith are incomparable in respect of cleverness.
    * captures the comparative correctly — at least to the extent that it gives
      a necessary and sufficient condition for definite membership in the positi
  * (13) cannot be right <= it implies that for any objects wu, and uw, and A,
    either w, is at least as A as u, or u, is at least as A as u,; and this
    * should fail to be true in general whenever we have two, largely
      independent, criteria for applicability of the adjective, but no clear
      procedure for weighing them.
* other ajd for wich 12 eqiv 13
  * We saw that for heavy (12) and (13) are equivalent
  * The same is true for ‘one-dimensional’ adjs
    * ajd assoced with a unique measurable aspect
    * The (numerical) value of that aspect for a given object determines whether
      or not the adjective applies
    * For heavy the aspect is weight, tall (assoced with height) and hot (tempr)
  * hE such adjectives are rare
  * Even large is not one of them: height? or its volume? or its surface?  or a
  * the same phenomenon as with clever. There is
  * no fixed procedure for integrating the various criteria.
* the context of use which indicates how the criteria should be integrated or,
  which of them should be taken as uniqucly relevant.  
  * how contexts disambiguate
  * Formally, contextual disambiguation can be represented as a function from
    contexts to models less vague than the ground model
  * I will eliminate a feature of vague and graded models which is unrealistic
    particularly in the context-dependent models defined below: Thus far
  * I have assumed that all the members of C are complete models. But this is
  * unnatural if we want to think of these models as the results of semantical
    decisions that could actually be made.  
  * most decisions will fail to render the relevant predicates completely sharp.
    They will only make them sharper. (Indeed, we may with
  * Wittgenstein, doubt that we could ever make any concept completely sharp.)
  * posit that the members of ¥ are partial models
  * It is possible that one of these contextually determined models is less
    vague than another
    * viz. when the semantic decision reflected by the second goes in the same
      direction, but not as far as, that reflected by the first => Thus C will
      be partially ordered by the relation _as vague as_.
* I just suggested that a context picks from this set a particular model —
  * picked model functions as the ground model of the graded model 
  * ground model represents the speech situation determined by that context
  * The various sharpenings acceptable from the viewpoint of that context would
    then be represented by those members of / which are at most as vague as the
    new ground model
  * hE it could conceivably be the case that two different contexts specify for
    a given predicate two different criteria from the set of those which are
    prima facie plausible and which, though they happen to determine the same
    new ground model, will not permit exactly the same further sharpenings =>
    the context should select
    * a certain subset of ¥ of contextually admissible further sharpenings +
    * a subset of admissible modifications
      * cannot be reconstructed from the new ground model alone.
* Thus far the prob function p was defined over a class of complete models. This
  now impossible as we no longer require that ¥ contains complete models
  * Yet the intuition behind the function p makes it appear unnatural to define
    p as a function concerning heavy over sets of partial models, especially as
    these sets may now be expected to contain models one of which is vaguer than
    the other
  * p should measure the number of possible ultimate results of repeated sharpen
    * not, the number of intermediate steps that one may take on the way
* A solution to this dilemma can be found if we assume that all individual cases
  of vagueness can be resolved, though not all at once; and this assumption does
  appear to be unexceptionable. Thus we will impose on the set # the following
  condition: (14) if <u1,un> \in U F1^+ \cup F1^then there is a member `<U, F2>`
  in which Q is less vague than `<U,F1>` and `<u1,un> \in F2^+ \cup F2^-`
* construct complete models as the unions of maximal chains in #: Let ¥ bea set
* def
  * a chain under the relation ‘vaguer than’ if for any two of its members
  * maximal chain in F if (i) Y’ is a chain (under the relation vaguer than) and
  * union of a chain C of models with universe U
* If U is countable then (14) entails that (15) The union of each maximal chain
  of ¥ is complete
  * (15) does not follow automatically from (14) when U is uncountable. Since
  * I will make (15), rather than (14), one of the defining conditions of graded
    context-dependent models.
* A graded context-dependent model (cgm) for L is a quintuple (M, S,6,F P) where
  * M is a partial model;
  * # is a set of partial models with the same universe as M;
  * The union of each maximal chain of ¥ is complete;
  * @ is a function the range of which consists of pairs (M’, ¥’) where (a)
    M'eF; (b) #’S F and (c) the union of each maximal chain of fF’ is complete;
  * F isa field over the set Y of unions of maximal chains of ¥;
  * (a) for cach formula ¢ and assignment a the set of members AZ’ of FY such
    that [bd]... = 1 belongs to F; (b) {MeF: MoM eF; (c) for each (M’, ’) in the
    range of @ if &’ is the set of unions of maximal chains of £’ then {M’eH'’:
    MSM
  * p is a probability function over F.  eF;
* notation
  * .# will always be a cgm and will always be equal to (M,/,¢,F,p);
  * M will be called the ground model of ./; similarly
  * if G(c) = «M’,, F’.) then M’, is called the ground model (in .) with respect
  * denote the set of members of ¥ in which ¢ is true under @ as [?]u.a
  * `[\phi]_{M,C,a}`
* The domain of ¢ should be thought of as the set of contexts
  * Contexts may be more or less specific; correspondingly Dom @ may contain
    elements c and c’ such that M.<M,. and ¥.S f,.; in this case ¢ will be at
    least as specific as c’
  * Thus the members of Dom @ are partially ordered by and <, defined by
  * One may wonder if for every member M‘ of # there should be ac such that M’
    is the ground model with respect to c
    * This would mean that for any possible sharpening of a predicate there is a
      context which indicates that the predicate should be understood in
      precisely that sharper way
    * I have no argument to show that this assumption is false; yet I see no
      gain from it; thus I prefer not to make it.
* In a cgm it is possible that while the relation >(Q") does not hold in the
  ground model it does hold in the ground models of certain contexts
  * Thus assume
    * Q/ represents the adjective clever; further assume that
    * c_1/c_2 represents a context in which clever must be understood as ‘good
      at solving problems’/ ‘quickwitted’; and that
    * c, represents a context on which both quick-wittedness and the ability to
      solve problems are to be regarded as constitutive of cleverness
  * Then we may expect that if a,(v,) = Smith and a,(v,) = Jones, (a) [OWN
    []_{M,c1,a2} \subseteq []_{M,c1,a1} []_{M,c2,a1} \subseteq []_{M,c2,a2}
    nothing definite can be said about the relation between []_{M,c3,a1} and
    []_{M,c3,a2}
* Until more is known about whether, and in what way, ¢, determines how the two
  criteria for clever are to be weighed. In order that (a) and (b) formally
  guarantee that in ¢, Smith is cleverer than Jones, while in c, Jones is
  cleverer than Smith, we must specify, parallel to (13)
* negative extension
  * this condition makes w, is more QO} than u, definitely true also when the
    difference between wu, and 1, is only marginal.
  * nL However marginal the difference, if it is a difference in an aspect which
    is irrevocably bound to the predicate, so that no context can break this
    tie, then the relation definitely obtains irrespective of whether it is
    difficult, or even physically impossible, to observe this.
* purpos of the prob func
  * it has proved useless for the characterization of the comparative because it
    is necessary to define the operation on the sets themselves rather than on
    the numerical values to which p reduces them.
  * there are expressions the analysis of which does require the function p.
  * _rather_ forms adjectives out of adjectives, e.g. rather tall out of tall,
    * When is a person rather clever? Before 1 can discuss the really important
    * first settle a minor point. x is rather clever
      * sometimes secms to deny that x is clever, while on
      * other occasions it appears to be entailed by the fact that x is clever —
        * just as e.g. most x are F
          * sometimes seems to entail not all x are F, while on
          * other occasions it seems to be entailed by al] x are F, I think that
      * explanation involving Grice’s theory of implicature: most x are F is a
        * speaker assumed to know whether all x are F, it will convey that
        * rather clever: use the longer phrase only if one had doubts that the
          shorter applies.
        * certain lowering of the standards for cleverness would make x clever,
          i.e.  if the proportion of members of F in which x belongs to the
          extensi on of clever is large enough
        * Indeed the closer x is to being truly clever, the smaller is the
          modification of the standards that is required, and thus the larger
          will be the class of those models where x is in the extensi on.
    * being clever in a variety of ways. Thus it is possible that x, y and z
      are all rather
      * x, because he is remarkably quick-witted, while hopeless at
      * y, because he is good at  mathematical problems; , though slow in conversation; and 2, because he
      * z has both capacities to a moderate degree
      * For any two of x, y, z
        one modifications of standards will warrant membership in the extensi
        for one but not for the other.
        Thus it will be true of the set of members of ¥ in which, say, x/y is in
        the extension of clever 
        neither will include the other. Yet they both guarantee membership in
        the extension of rather clever, essentially because they are both
        large enough.
    * u, is rather clever if and only if [] \ge p0
    * The vagueness of rather could be represented in the following way. We
      associate with each ¢ \in Dom C a pair of real numbers r;, 7; between o
      * The positive and negative extensions of rather Q! in the ground mode
    * finally the intermediate value of u is rather Q! in the ground model is
    * words which, like rather, form adjectives out of adjectives
    and which can be analysed along similar lines. Another prominent example
    * _very_. The extension of very Q} is again a function of [Ol(o ge ‘Lhe

# 6 The second theory: comparative of nouns, hedges, the mech of context crea 13

* other POS
  * For traditional logic adjectives, nouns and intransitive verbs are all
    one-place predicates
* My second theory of adjectives tries to vindicate [defend] this view against
  the one expressed earlier which puts adjectives into a different category than
  verbs and nouns
* while the comparative is in general a natural operation on adjectives,
  similar operations
  on nouns are of relatively little importance, and
  on verbs they are virtually non-existent. This suggests a
* leave verbs out of consideration in the following discussion, as they
  * problems quite different from those with which this paper is concerned. But
* say something about the difference between adjectives and nouns.
* eg _This is more a table than that_
  sounds awkward and is perhaps
  never unequivocally true,
    except in the cases in which it 1s evident that this is a table and that !is
* nouns too are vague, some of
* Why does not their vagueness allow for equally meaningful comparatives? To
* reconsider ‘one-dimensional’ adjectives.
  * For any such adjective Q; it will be the case that, for arbitrary @,,a.,
    (18) either []_{M,a1} \subseteq []_{M,a2} or vice versa
  => wu, is more Qj than uz always has a definite truth value.
  * most adjectives do not satisfy (18) unambiguously. «,
  * 7s cleverer than u, could remain without truth value in the ground model.
    Yet there should still be a fair proportion of pairs (u,,u,) where u, and u,
    both lie in the extension gap of clever, but for which (18) holds (with
    a,(v,) = u, and a,(v,) = u,). And, for the same reason, there
...
* In order for an object to satisfy a noun it must in general satisfy all, or a
  large portion, of a cluster of criteria. None of these we can promote to the
  * we need a method for integrating these various ratings
  * such a method is in general not part of the meaning of the noun.
  * another aspect to the difference between nouns and adjectives which is
    related to the one discussed above, but perhaps even more important in
    N’s resistance to comparatives. Nouns, though potentially just as vague as
    adjectives, tend in actual practice to
  * cat, table, rock or word often have very small, or no, extension gaps in the
    actual world ~ even if it is easy to think of possible worlds in which these
    gaps would be enormous
  * gives an additional explanation of why comparatives involving nouns should
    be of relatively little use
  * comparatives are particularly important in those cases where neither of the
    two objects compared belongs unambiguously to the positive or to the neg
  * scldom arise when the predicate is a noun, It is an interesting question
  * how nouns ‘manage’ to be as sharp as they are, The
  * Even if each of the several criteria for the noun may apply to actual
    objects in varying degrees;
    these criteria are, with respect to the actual world, parallel [ie orthogon]
    an object which fails to satisfy a few of them to a reasonable degree will
    generally fail to score well with regard to almost all of them.
* the simple comparative of a predicate is non-sensical,
  addition of a hedge (Lakoff 1972) can restore its meaningfulness.
  eg _in a sense, as far as function is concerned, with regard to shape_
(19) with regard to shape w, is more a table than u,?
  * determine the logical type of the expression with regard to shape. This is
  * this problem which does not belong in this paper. I will therefore give
    * an answer which is convenient in connection with the issues which concern
  * I will treat _is more...  than...with regard to shape_ as an atomic, i.e.
  * a new comparative operation — one which again
    forms binary relations out of predicates.  This new comparative
  * differs from the one considered thus far in the following way: The phrase with
  * places us so to speak in a context where shape is singled out
  * those predicates to which shape is at all relevant are evaluated with
    respect to shape alone
  * Then (19) should be true in the ground model if and only if «, 7s more a
    table than u, is true in cach of these contexts.
* comment at this point on the nature of contexts and their role in sem anal
* alter but eqviv account of 19: _with regard to shape_ shape transforms the context into one where shape is the only relevant
* solution to certain other semantical problems can be found only if we
  investigate 
  * not only the effect of the various aspects of context on the meanings of exp
  * but also the mechanisms which create, or modify, contextual aspects. A
    proper understanding of these mechanisms seems essential to the
    analysis of more extended pieces of discourse, eg stories
  <~ an account of (19) along the lines of the second proposal is more desirable
  * It seems, however, too early to pass judgement on this matter.
* contexts are made up of verbal and nonverbal elements alike
  * The same contextual aspect may“on one/other occasion be manifest through
    * the setting in which the utterance is made
      * preoccupation with shape will last throughout the session; and a special
    * a particular verbal expression.
      * modification will be in force only during the evaluation of the phrase
    * differ as regards the degree of permanence with which the feature in
      question is part of the context
* _in a sense_ What is it to be clever in a sense? That
  * depends on what are the various possible senses of the word clever. It will
  * related: Smith is clever in the sense that he is good at solving problems or
                                          of being quick-witted
  * The expressions following clever have, again, the effect of transforming the
    context, viz. into one where clever is given a more specific sense
  * The truth value of the sentence should therefore be the same as it is in any
    of these contexts
    * the same contexts as those created by explic specifications like Let us
  * x is clever in a sense is then true if there is such a set of contexts such
    that » is clever is true in each of its members.
* which are the acceptable specifications of a given noun or adjective?  This is
  * no definite answer can be given; for the notion
  * not every logically possible definition is acceptable; for if this were so,
    then all statements of the form (20) x is a...in a sense would be true.
  * can if necessary be stretched very far indeed That is why it is so hard to
    establish that a particular sentence of the form (20) is false.
* _to the extent that_ Let us consider Lakoff's example:
  (21) To the extent that Austin is a linguist he is a good one
  * regard _to the extent that_ as a two-place sentential operator which
    forms out of two formulas ¢ and y the compound formula
  (22) to the extent that ¢, w.
  * to what extent does the sharpening of one predicate affect other predicates?
  * the decisions concerning two different words cannot in all cases be indep.
  * Sharpening of the noun _leg_ will yield sharpening of _four-legged_ as well.
  * Yet there are many pairs of indep adjectives eg linguist and good. This is
* The truth conditions of (22) are essentially these:
  (22) is true (in its actual context of use c)
  if \psi is true in all contexts in which \phi is true and which are as similar
  to c as is possible, given that they make c true
  * in 21, we have modified the semantics for linguist
  * In particular good would, it seems to me, not be affected seriously 
  * The truth of the main clause of (21) in such a context is to be understood
    in the usual manner.
* compare (21) with the slightly more complicated
  (23) To the extent that Austin and Russell are linguists, Austin is at
  least as good a linguist as Russell
* a formal elaboration of such analyses within the framework provided by cgm’s
  requires a great deal more structure on the set of contexts than I have given.

# 7 how the meaning of the noun determines that of the adjective 16

* vagueness is often reduced by context
* needed: a concrete analysis of those contextual factors which contribute to
  such reduction of vagueness and of how they succeed in doing so. To provide
* such an analysis is an endless task
* I mention at least one contextual aspect which
  plays a central role in almost all cases where adjectives occur in attributive
* That aspect is the noun to which the adjective is attached. In a great many
  * the noun alone determines how the adjective should be understood. 
  * if we assume that the noun is the only factor, we are back with the first
    theory according to which
    adjective meanings functions from NP meanings to NP meanings
* noun is not always the only determining factor.
  * _Smith is a remarkable violinist_ may be true/f when said in comment on his
    * after-dinner performance with the hostess at the piano, and false when ex-
    * at the end of Smith’s recital in the Festival Hall — even if on the second
* how the meaning of the noun determines that of the adjective that combines
  * just one aspect of this problem
  * One of the main purposes of the use of an adjective in attributive position:
    * contribute to the delineation of the class of objects that the NP is picks 
    * help determine the particular individual which is the intended referent of
      the description in which the adjective occurs
      => adj should, in the presence of the noun in question, have an extension
      which, so to speak, cuts the extension of the noun in half — i.e. if we
  * assume for the sake of this argument that both noun and adjective (in the
    presence of the noun) are sharp, and that
  * both N-A and NoJA should be substantial proportions of N
    * where A is the extension of the adjective, and NV that of the noun, then
  * Thus in order to be able to use the adjective profitably in combination
    with an unlimited number of nouns, we should let
    the noun determine the criteria and/or standards for its adjective 
    in such a way that the above condition is in general fulfilled.  (The
    * (8), p. 126, obviously meets this requirement
* not that Adj vague, N sharp
  * eg Four-legged has virtually no extension gap—which is hardly surprising
    <= it is derived from the noun ‘leg’. And indeed it yields
    * comparatives as infelicitous as those derived from most nouns
  * Blue, though apparently not derived from a noun, also gives rise to
    rather strained comparatives
    * Tis is bluer than that is sometimes a meaningful statement, but would fail
      to be more often than not, So it seems that
    * heavy and four-legged are really very far apart and that they will
      * require analyses that are fundamentally diferent.
* a likely objection against the theory I have outlined
  * Does it not blur fundamental ‘distinctions between different kinds of adjs?
  * Yes, undoubtedly it does
  * deal in detail with small provinces of the wide realm of all those concepts
    to which the objection claims to apply. It should be pointed out in
  * the second theory itself can hardly be regarded as comprehending all adjs
  * Is _alleged_ a predicate, even in the most diluted sense? It seems not. Of
    * in each particular context of use it behaves as a predicate, in so far as
      the accompanying (or tacitly understood) noun phrase determines to which
      objects in that context the adjective applies. But
    * this is just a restatement of the first theory 
    * The intuition which led to the second theory is inapplicable to alleged.
  * The same is true, to _fake, skilful, or good_
    * Where precisely we should draw the boundaries, I do not know. For
  * ? skilful belong to this class?
    * Surely we must always ask ‘skilful what?’ before we can answer _is x sf?_
    * nL there appears to be some plausibility in the view that having a good
      deal of skill does function as a predicate —be it a
      highly ambiguous one as there are so many different skills. Here the
  * whether we face an expression that stands for
    a function from properties to properties or rather 
    an ambiguous predicate which is disambiguated by accompanying expressions
    for properties
    * perhaps no definite answer.
  * needed a complementary theory which deals w alleged, fake, skilful and good
    * left with a semantic phenomenon that is explained by no theory; but it
* we have two distinct theories 
  * give equally adequate accounts of those phenomena in the intersection

# 8 open questions 17

* which I believe can be treated within the framework I have set up.
* intransitive verbs. I have avoided them throughout, even though
  * they too one-place predicates with a good deal of vagueness. In
  * what semantically differentiates verbs from adjectives, or, from nouns. My
  * the proper understanding of these differences involves __tense__
    * the time spans during which a predicate is true of an object, and
    * similar issues which require a good deal of tense logic.
* hedges, I have given only the scantest attention to
  * my framework is basically suitable for their analysis, although
    more structure on the set of contexts will be needed than I have provided.
* only the simplest kind of comparatives were considered 
  Fones is more more intelligent than he is kind
  This building is higher than that is long
  Smith is much cleverer than Jones and
  Smith is more cleverer than Jones than [Jones is than Bill]
  * The last two sentences in particular, present rather different problems of a
  * analysis requires more mathematical structure than in the models here consid
  * the formal framework needed there : the one I have presented
                                      ::
                               metric : arbitrary topological spaces
