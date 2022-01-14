M. J. Cresswell
The semantics of degree

* This paper 
  * possible-worlds semantics for comparative constructions in English. In
  * unified treatment of comparatives involving adjectives, mass nouns, and
    numerical comparisons.
  * not expounding or developing Montague's own work, but it shares
  * two Montagovian features : 
    * based on possible-worlds semantics, and 
    * aim: underlying formal language as close as possible to the surface. 1 It
  * procedure and terminology I adopted in Cresswell (1973), thou self-contained
  * at certain points I reject analyses I once favored and present alternative

# 1 \lambda-categorial languages: my formal languages and the semantic framework

* propositions simply as sets of possible worlds
  * rather than as sets of "heavens," and I avoid any explicit
  * no reference to contexts of use. 2
  * this is inadequate because of
    * context dependence (discussed later), and 
    * functors that represent propositional attitudes to logically equivalent
      propositions.  This area is very obscure to me and, to Partee (1973) also
* two *syntactic categories*: 0 of *sentence* and 1 of *name*.
* Given categories τ, σ_1,...,σ_n, then <τ, σ_1 ..., σ_n> is the category of
  a *functor* that makes an expression of category τ out of expressions of
  category σ_1 ..., σ_n, respectively.
* We can now define a *\lambda-categorial language* \cal L as follows:
  * Where σ is a syntactic category
    * `F_σ` a is the (finite) set of *symbols* of category σ.  
    * there is a denumerably infinite set `X_σ` a of variables (in the
      logician's sense) 3 of category σ and
  * a "logical" symbol λ (called the *abstraction operator*) not in any category
  * `E_σ` a denotes the set of simple or complex expressions of category σ and
    is made up as follows, where σ, τ, σ_1 ..., σ_n are any categories: (1.1) F
    σ \subseteq Ε σ (1.2) If σ = <τ, σ_1 ..., σ_n> and δ \in E_\sigma, \alpha_i
    \in E_{\sigma_i} then <\delta, σ_1 ..., σ_n> \in E_\tau (1.3) If α \in Ε τ ,
    and x \in X_\sigma, then <λ, χ, α> \in E_< τ , σ >.  (An expression of the
    latter kind is called an *abstract*.)
* In an expression of the form `<\delta, \alpha_i,..,\alpha_n>`, the order of
  `\alpha_i` is important but the position of δ is not.
  * In a well-formed functorial expression, there is only one expression that
    can be the functor, and we could write, eg, `<a 1 ..., α_n, δ>` or
    `<\alpha_1, \delta,..,\alpha_n>`.
  * From time to time it is convenient (Cresswell, 1973) 
* For semantics we have a function D that associates with each syntactic
  category the things that can be the values of expressions in that category.
  * D 0 is the domain of *propositions*, and in this paper a proposition is *a
    set of possible worlds*. 
    * motivation for treating propositions as sets of possible worlds Cresswell
      (1973), see also Montague (1969) and Stalnaker (1972). We are,
  * D 1 is the domain of "things" and should be as inclusive as possible
  * Where σ = <τ, σ_1 ..., σ_n>, D σ is a set of partial functions from
    D_{\sigma_1} x ... x D ση into D_\tau. That is, if ω \in D σ , then for
    appropriate a_i \in D σ_i, ω(α_1 ..., a n ) \in D t .  (1.4) *a value
    assignment* V to the symbols of \cal L is a function such that where a \in
    F_sigma , V(a) \in D σ .
* value assignment to the variables
  * Let N be the set of functions v such that where x \in Χ σ , v(x) \in D σ .
    Where a \in D_sigma , (v, a/x) is the function like v for all arguments
    except that (v, a/x)(x) = a.
  * V induces an assignment to all expressions of \cal L Let V v (a) mean "the
    value induced by V to the expression a, with respect to the assignment v to
    the variables"
    * If a \in F_sigma, then V v (a) V(a).
    * If x \in Χ σ , then V v (x) = v(x).
    * If a = <\delta, a_1 ..., a_n>, then where ω = V v (\delta), V_v (α) = ω δ
      (V_V (α_1,...,V_V (α_n )).
    * If `a = <\lambda, x, \beta>` and β \in Ε τ , then V v (a) is the function
      ω \in D< T , σ > such that for any a \in D_sigma , ω(α) = V (v ,
      a/x)(\beta)
* the usual distinction between *free* and *bound* variables.
  * In the expression <A, x, a> any x that occurs in `a` will be bound.
  * A variable that is not bound will be *free*.
  * (The occurrence of x after the λ counts as neither bound nor free.)
  * An expression without free variables is called *closed*
  * The value assigned to closed expressions does not depend on the assignment
    to the variables
  * If a is closed and v and μ are any assignments to the variables, then V v
    (\alpha) = V μ (α).
  * We frequently write simply V^+ (x) in such a case. (The + is to show that it
    is an induced assignment to the complex expression a, uniquely determined by
    the assignment V to the finite number of symbols of \cal L)
* propositions are sets of possible worlds
* If a \in D 0 (ie a \subseteq W) and w \in W , then to say that a is *true in
  W* is to say that w \in a. Where `a` is a sentence of \cal L (ie a \in E 0 and
  contains no free variables), a is true in w under V iff w \in V + (a).
* Because our domains include partial functions, there are many expressions that
  will not be defined, semantic anomaly
  * must of course be clearly distinguished from grammatical ill-formedness.
  * Only well-formed expressions are candidates for semantic oddness in
* In Section 5 I say something about the relation between \lambda-categorial and
  natural languages, and I have said a good bit about it in (Cresswell, 1973)
* we represent the symbols of \cal L by English words printed in boldface type
  and then try to get expressions, sometimes called \lambda-*deep structures*,
  that look as though they could become English sentences with a bit of
  tinkering
  * I am concerned more with the underlying semantic structure than with the
    tinkering. There have been a number of
  * recent syntactic studies of the comparative in English, and I have made use
    (Doherty and Schwartz, 1967; Hale, 1970; Lees, 1961; Smith, 1961). 5 One in
    * Seuren (1973); if the basic primitive for an adjective like tall is taken
      as `x is tall to degree at least y` then my `er than` can be expressed in
      terms of the concepts of ordinary quantification theory
      * we can then say things like 'there is a degree u such that Bill is tall
        to degree at least u but it is not the case that Ophidia is long to
        degree at least u'
      * Seuren makes the object language look like quantification theory
        * rather than as close to the surface as possible
      * there is an underlying negative in comparisons 
      * (I find myself agreeing with about half of Seuren's data.)
    * Bresnan (1973) has guided much of my analysis, and that is 
    * In Section 5 of this study, I discuss the relation between my \lambda-deep
      structures and her underlying structures.
* Beginning with names (category 1) and sentences (category 0), we can produce
  symbols in certain other categories that look a bit like various parts of
  speech. For instance,
  * intransitive verb expressions (whether simple or complex) look as though
    they should be treated as one-place predicates.
    * ie make sentences out of names = in category <0, 1>. 
  * Transitive verb expressions are in category <0, 1, 1>, and so on). Another
  * also in category <0, 1> is the class of common count [megszámlálható] nouns,
    whether simple or complex Because they must be distinguished from
    intransitive verb expressions, Montague (1973) has assigned them a different
    category <<0, 1>> 
    * However, in this study we shall not make such a distinction.
* In Cresswell (1973) the category 2 was introduced, with D 2 = D <0, 1 >; but I
  * now I think that this was a mistake. I now believe that
  * Ns and Vs have to be distinguished by the principles that relate the
    \lambda-deep structures and the sentences of ordinary language
* The meaning of common count nouns can be illustrated by man: (1.9) F(man) is
  the function \omega \in D_<0,1> such that for any a \in D_1, `a` is in the
  domain of ω iff a is a physical object in some w \in W; and for any w \in W, w
  \in ω(ά) iff a is a man in w
* simplifications in the analysis of the sem of common count nouns & intr Vs
  * the meaning of nouns frequently depends on the temporal context. In the case
    * even in the case of man
    * in the case of a word like widow, we have to know not only what world is
      * Logicians; moments of time are "contextual indices."
      * there is Another index, the utterer [beszélő] index
    * the semantics we go on to present ought to refe to contextual indices, but
      it is in every case clear how it should be done, and we shall forget
    * in the analysis of tenses and pronouns, context dependence becomes vital ; 
  * Another simplification is to treat names as expressions of category 1.  
    * Cresswell (1973); an important syntactic category is that of *nominal*.
    * Nominals are in category <0, <0, 1 >> and
    * contain, as well as names, expressions that underlie phrases like: at
      least one person present no philosopher the saggy baggy elephant

# 2 comparative adjectives 5

* Montague (1970), Cresswell (1973); attributive use of adjectives to be prior
  to their predicative use.
* In this we differ both from almost all linguists and most philosophers.
* a great many philosophical puzzles have been generated by the taking of
  expressions like (5) _is red_ as paradigmatic instances of predicates. 
* adjectives are here treated as noun modifiers. In Cresswell (1973) they are
* of category <<0, 1>, <0, 1 >> . One of the main tasks of this study is to
* now refine the analysis to give a semantically coherent account of compars In
  * also discover some important semantic features of mass nouns and the
    collectivizing function of plurals.
* comparisons => points on a scale
  * The scale can be represented by a relation, and the points on the scale by
  * the FIELD of a relation is the set of all things that are related in one
  * Where > is a relation we denote its field by \cal F(>): (2.1) A DEGREE (of
    comparison) is a pair `<u, > >`, where > is a relation and U \in \cal F(>).
* tempting to think of > as at least a partial ordering (ie, a transitive and
  antisymmetric relation); whether it should be
  * strict or not or total or not seems unimportant, and perhaps we should even
  * not to insist on transitivity and antisymmetry (Wheeler, 1972) a tall man a
    very tall man a much too tall man a taller man
* the underlying semantic concept is : ( 10) x-much tall man where x is a degree
  * _much_ as a surface marker that signals the underlying degree variable
    (Bresnan, 1973)
  * <tall, man> becomes in effect a two-place predicate with (roughly) the
    meaning of: (11) x is a man who is tall to degree y
* We want to give a semantics for tall that applies to any count noun to which
  * _tall_ is of category <<0, 1, 1>, <0, 1>> and has the following semantics :
    (2.2) V(tall) is a function ζ \in D <<0, 1, 1>, <0, 1>> such that where ω
    \in D <0 1>, ω is in the domain of ζ iff ω is a property whose domain
    contains only physical objects.  For any a, b \in D _1 in the domain of
    \zeta(ω), and any w \in W, w \in ζ(ω)(α, b) iff w \in ω(α) and b = <w, > >,
    where `>` is the relation whose field is the set of all v such that v is a
    spatial distance, and `<v_1, v 2> \in >` iff v 1 is a greater distance than
    v 2 , and u is the distance between a's extremities in w, and in the case of
    most c's such that w \in \omega(c) this distance will typically be vertical.
  * semantic "rules" like (2.2) are for purposes of illustration only. This
    study
    * to show the kind of thing that should represent it in a λ-categorial base
    * Wheeler (1972) describes the study of the meanings of actual words as
      "physics" rather than "semantics," but I would agree with him that
      * an investigation into the logical structure underlying a natural
        language is not concerned primarily with getting the details of the
        meanings of particular words absolutely correct.
  * The early part of the clause says what kinds of things could be in the
    domain of the function
    * Where an expression is made up out of a functor whose arguments have as
      their meanings something that is not in the domain of the meaning of the
      functor, then the whole expression lacks a value.
    * `*`_a tall idea_ would not have a value
      * Householder (1973) on asterisks (also Bar Hillel, 1971 and Weydt, 1973)
        * An asterisk means that there is something odd about the sentence
        * In each case I shall try to explain what sort of oddness it is, and
        * An asterisk does NOT mean that the sentence is ungrammatical.
    * semantic anomalies do not require any "feature theory" in the syntax.
    * (12) will be perfectly well-formed but semantically anomalous
    * in the rest of this work, the domains of the functors have to be restrictd
* The difference between tall and long is that tall usually applies to
  distances measured vertically and from the ground up,
  * of course one can find out how tall a man is by measuring him lying down
  * (2.2) has not captured all these nuances
  * (eg, that the distance between the extremities, in the case of a man, will
    have to be measured when he is stretched out and not curled up, and so on)
  * Long can also be used to measure temporal distances, see (4.3).
* the symbol for the comparative. We shall write it as `er than`
  * For the present, as a single symbol in category <0, <0, 1>, <0, 1 >> , but
  * a transformation can regard it as two symbols and separate the two parts on
    the way to the surface.
* problem: the comparison scales used vary from adjective to adjective
  * the terms of the `er than` supply the comparison scale : <a, `er than`, ß>
    means that the degree of `a` is higher than the degree of ß on the scale
    that is common to the meaning of a and ß.
(2.3) V(`er than`) is the function ζ \in D <0, <0, 1>,  <0, 1>> such that
  where ω and ω' \in D <0, 1>,
  ω and ω' are in the domain of ζ
  only if they are functions whose domains consist entirely of degrees.
  For any w \in W, w \in ζ(ω, ω')
  iff there is an `a` and a b such that ω \in ω(a) and w \in \omega'(b), and for
  any such a and b there is some relation `>` and some u_1 and u 2 in F(>) , and a = <u_1, > > and
  `b = <u 2, > >` and u l > u 2 .
* The generality of the analysis proposed here may be seen from 
* (15) Bill is a taller man than Ophidia is a long snake.
  * tall and long both involve the same scale.
  * A plausible \lambda-deep structure for (15) would seem to be:
  << \lambda , x, <Bill, <tall, man>, x >>,
  er than
  <\lambda, x, <Ophidia, <long, snake>, x > >> 9
  * << \lambda , x, <Bill, <tall, man>, x >>
    can be read as is an x such that Bill is an x-tall man
    * Cresswell (1973); wh questions presented as predicates
    * <...> is what underlies How tall is Βill (Lees 1961)
  * <tall, man> and <long, snake> are
    * in category <0, 1, 1> and are placed between their arguments;
    * the first arguments are Bill and Ophidia, respectively, and
    * the second argument is the variable x.)
* how (18) should be evaluated semantically. We first obtain,
* the > involved in both tall and long is the same relation.
* Our underlying semantic concept for tall was in fact "x-much tall." But of
  course we have sentences like :
  (24) Bill is a tall man.  
  meaning:
  (25) BUI is taller than the average man.
* I propose to treat the 'tall' in (24) as composed of two symbols, pos and tall
  * tall satisfies (2.2), while
  * pos [alapfok] conveys the "`er than` the average~~
* pos (for positive, as opposed to comparative) is
  in category <<<0, 1>, <0, 1 >> , << 0 , 1, 1>, <0, 1>>>. This looks very complicated, but all it means
  * output: ordinary noun modifier, say, <pos, tall>, out of
  * input: a modifier like tall
* See Vennemann (1973)
  * Perhaps the meaning of << p o s , tall>, a> is better captured by
  "tall enough to make it sensible to distinguish it from other a's." A meaning
  * very context dependent, but perhaps it
    gives some clue to why pos has a null surface realization.  
* Wheeler (1972) takes as the semantic primitive
  a relation between an individual and a set
  * tall means "x is tall by comparison with the set a." He is then able to
  * x is taller than y as "x is tall by comparison with {y}." Wheeler's
  * not able to deal with x is taller than y is high
* Let us see how (2.2), (2.3), and (2.5) combine to give us a value for: p12
  (26) <<pos, tall>, man>
* (16) does not entail that Bill is a tall man (Vennemann, 1973, p. 8f).
* The superlative seems best treated by
  a symbol est in category <<0, 1>, <0, 1, 1 >> :
* est modifies whole phrases. In obtaining the surface sentence it would have to
  be attached to the adjective. It is semantically plausible to have est
  modifying complex expressions, since in a sentence like : (28)
  * The tallest spy in Australasia is not in New Zealand.
* Bresnan (1973) notes certain other locutions that seem to correspond to `er
  than`. We can have :
(30) as tall as
(33) so tall (that)
     too tall (to)
     that tall
* We shall give a semantics for (30) by taking `as as` as a single symbol of
* Bill is as tall as Tom iff he is either taller than Tom or the same height as
* Another distinction we must capture is that between :
  (34) Bill is taller than Arabella.
  (35) Bill is taller than six feet.
  * We shall for the present treat six feet as a single symbol in category 1 and

# 3 discusses mass nouns and plurals 14

# 4 looks at the metaphysics that underlie comparisons; 

# 5 the relation between the formal language of comparatives and their surface

# 6 a few problem cases, with tentative suggestions for the solution of some
