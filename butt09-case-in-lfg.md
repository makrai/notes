Butt, Miriam
Case in Lexical-Functional Grammar 
2009 in The Oxford Handbook of Case, 59-71

# Introduction

* The treatment of case has been one of the central concerns within LFG
  since its inception in the late 1970s. Several of the papers collected in the
  * seminal book marking the emergence of LFG (Bresnan 1982) deal with case
    * Neidle on Russian, KP Mohanan with respect to Malayalam)
  * he a sophisticated analysis of crosslinguistic case patterns only 
    as LFG’s Linking Theory (known as Lexical Mapping Theory) evolved.
* argument structure needed to be posited as an indep level of representation
  * recognized on the basis of argumentation by Rappaport (1983) that
  * very much unlike the assumptions of GB/MP, see Chapter 3), the way was paved
  * analyses of case to be stated in terms of generalizations over argument-stru
  * ie take both semantic and syntactic factors into account.
organizatoin
  * some LFG basics in section 2, then briefly charts
  3. the development of Linking Theory in section 3 and presents
  4. current theories of case in section 4. The
  5. LFG-based analyses that are couched within Optimality-Theory (see Ch 6)

# 2 LFG Basics

* LFG separates facts about
  * linear word order and constituency from the
    * represented at c(onstituent)-structure via tree representations, in (1)
    * a version of X′ -theory that goes back to Bresnan (1977)
    * For current assumptions about c-structur, see Bresnan (2001).
  * functional dependency structure analysis of a clause. Word order and
    * in terms of an attribute-value matrix (AVM) and
    * encodes functional syntactic information about grammatical relations,
      tense/aspect, case, number, person, etc. eg fstruct for (1) shown in (2)
* F-structures are a projection from the c-structure because they are
  * F related to the c-structure via a formal system of annotations. The effect
  * the levels of representation constrain each other mutually
  * That is, an analysis can only be successful if the
    f-structure information is complete and consistent, and if the
    phrase structure rules license the structure
  * Information at f-structure may flow together from different sources
    * The pieces of information are combined with one another via unification.
  * no derivations from one structure to another.
    * In contrast to the fundamental derivational assumptions of GB/MP (Ch 3)
    * makes LFG computationally tractable.
* eg what struct encode what
  * Crosslinguistic generalizations about passivization, for example, are
    formulated with respect to f-structure
  * c-structures: language specific requirements on word order and constituency
  * an SVO language like English and an SOV language like Urdu may differ wildly
    * similar at the basic predicational level, as shown in (4) and (5). The
    * Urdu is a free word order language in which the
      NPs of a sentence are sisters (there is no evidence for a VP).1
(3) yassin dudh pi-t-a hE
    Yassin.M.Sg.Nom milk.F.Sg.Nom drink-Impf-M.Sg be.Pres.3.Sg
    ‘Yassin drinks milk.’
* Within LFG, only minimal constituents are assumed
  for which there is actual distributional evidence in the language.
  * The difference between a language like English and a language like Urdu is
    a difference between
    * endocentricity (all heads project maximally) and
    * exocentricity (heads do not necessarily maximally project)
    * See Bresnan (2001, Ch. 7) and Dalrymple (2001, Ch. 3) for further discuss 

## 2.1 Grammatical Functions

* The above f-structures include
  two basic grammatical relations: subj(ect) and obj(ect). Grammatical relations
  * assumed as part of the syntactic inventory of every language and are
  * referred to as grammatical functions (GF) to indicate their functional statu
  * the relation of arguments and predicational elements to one another
  * LFG assumes the GFs in (6).  Like many other elements in linguistics, GFs
    * can be arranged in a hierarchy, whereby the SUBJ is the “highest” on the
    subj > obj > objθ > obl(ique)θ > comp(lement) > xcomp(lement) > adjunct
  * Dalrymple (2001:11–27) provides a useful discussion of the GFs as well as
  * syntactic tests by which they can be identified
  * GFs are not inherently identified with any particular case in LFG. That is,
    * eg no assumption that SUBJ/OBJ will always be nominative/accusative and
    * non-nom suggests in Icelandic
      * their early recognition due to Zaenen, Maling and Thráinsson’s (1985)
    * individual languages may prove to have strict ideas about the association
    * eg German that subjects <=> nominatives

## 2.2 Argument Structure and Thematic Roles

* In addition to the basic c~ and f-structural representations, LFG’s projection
  * potentially allows for several other projections
  * One standard additional projection is the s(emantic)-projection
    (Halvorsen and Kaplan 1988, Dalrymple 1999), which encodes the
    * semantic analysis of the clause
  * a-structure can also be conceived of as a projection, it
    * can also been seen as an elaboration of of the PRED value in f-structures
      (Alsina 1996)
    * represented
      * in theoretical papers generally as in `pinch<agent theme>`
      * though it can also be formally represented as an AVM (Butt 1998),
        in line with f-structure representations.
    * encodes predicate-argument relationships in terms of thematic roles
      * thematic roles are generally arranged in a thematic hierarchy, shown in
        (8) Thematic Role Hierarchy
agt > beneficiary > recip/experiencer > instrumental > theme/patient > location
        * (based on Bresnan and Kanerva 1989)
      * hE, in practice very little reference is ever made to the hierarchy,
        except to the agent as being highest

# 3 Linking Theory

* associate case marking patterns with a-structure information was also the
  * linking principles
  * Icelandic (Zaenen, Maling and Thráinsson 1985)
    * tests that established the existence of non-nominative subjects, Zaenen,
    * principles of the relationship between thematic roles, case and GFs
    1. agents are linked to subj (Universal)
    2. Casemarked themes are assigned to the lowest available gf (Lang Specific)
    3. If there is only one thematic role, it is assigned to subj;
      * 2: subj and obj
      * 3: subj, obj, 2obj [NB: the modern OBJθ ].
      * This principle applies after
        principle 2 and after the assignment of restricted gfs. (Universal)
    4. Default Case-Marking: the highest available gf is assigned nom case,
      the next highest acc. (Universal)
* eg Icelandic verb óska ‘to wish’ can be used
  either transitively or as a ditransitive
  ie the goal ‘her’ in (10) is optional
  * When goal is present, it is realized as the direct object (obj)
  * When it is not present, the theme argument is instead linked to the DO, as
(10) þú hefur óskaD (henni) þess
     you have wished her.Dat this.Gen
     ‘You have wished this on/for her.’ (Zaenen+ 1985:470)
(11) óska: a.  < agent  theme   (goal) >
                        [+gen]  [+dat]
  a.             subj   2obj    obj
  b.             subj   obj
* Zaenen+ ; __inherent__ lexical case as being
  an idiosyncratic property of a lexical item,
  assigned by a verb, preposition or adjective
  * In (11), the theme ‘this’ is assigned inherent genitive case by the verb
    * If the theme were not marked with the genitive feature, then
      it would be linked to an obj in both the transitive and the ditransitive
      by the association principles in (9)
    * given the special marking + the language specific principle in (9.2),
      it is assigned to a secondary object rather than the direct object in (11a).
    * In (11b), the theme is linked to the direct object because that is the
      lowest available GF, given that there are no further arguments to be
      accommodated.
  * came to be known as quirky case
    * The term ‘quirky’ suggests a random lawlessness, but a
      close inspection of Zaenen+’s original paper shows: very regulated
      and follows from lexical semantic factors.
    * The ‘quirky’ genitive or dative cases are
      always regularly associated with a given thematic role
      * Genitives regularly occur on themes (11) and
      * datives mark goals as well as themes. There seem to be
      * no instances of truly idiosyncratic case, rather case assignment seems
* Today’s standard Linking Theory
  relates GFs to thematic roles via two abstract linking features,
  [±objective] and [±restrictive], by which
  * both thematic roles and GFs can be classified by these
  * Additionally, a number of principles govern the association 
  * Furthermore, argument changing operations such as
    passives (argument deletion) or
    applicatives (argument addition) are taken into account (see Butt 2006)
  * The role of case
    * in most accounts has stayed much as it was in Zaenen+
      an extra piece of information that helps determine the mapping between GFs
      and thematic roles
    * there are also some approaches that take the theory of case within LFG a
      bit further. Two of these are sketched briefly in the next section.

# 4 Some Theories of Case 7

## 4.1 Constructive Case

* Nordlinger (1998, 2000) takes on the phenomenon of
  case stacking in Australian languages and develops a theory of Constructive
  * eg (12) in Martuthunira, where
  * ‘joey’ (a baby euro — a type of kangaroo)
  * the word ‘pouch’ is marked with three cases: one to show that it is
    * signalling a location,
    * part of a possessive or accompanying relation to another word (the
      proprietive case), and one to show that it is
    * part of (modifying) an accusative case marked noun
      (see Chapter 52 for more discussion of this type of case marking)
  * joey has two cases
    * The proprietive shows that it stands in an accompanying relationship with
      another (with the euro), and
    * the accusative to show that it is part of (modifying) an accusative cased N
  * Finally, the ‘euro’ is accusative as the direct object, while the
  * ‘I’ is nominative (unmarked).
(12) Ngayu nhawu-lha ngurnu tharnta-a mirtily-marta-a thara-ngka-marta-a.
     I saw-Past that.Acc euro-Acc joey-Prop-Acc pouch-Loc-Prop-Acc
     ‘I saw the euro with a joey in (its) pouch.’ (Dench 1995:60)
  ```
  [ pred ′ see<subj,obj> ′
    subj [  pred
            num
            pers
            case nom ]
    obj [ pred euro
          pers
          num
          case acc
          adj  [ pred joey
                pers
                num
                cas prop
                adj [ pred pouch
                      pers
                      num
                      case loc  ] ] ] ]
  ```
* The f-structure analysis in (13) shows that
  * the case markers indicate which functional layers of analysis the case
    marked word is embedded in.
  * Nordlinger (1998) sees the
    case morphology itself as playing a large role in constructing the syntax of
  * An ergative case eg carries the following pieces of synt information:
    i) that there be a subject;
    ii) that it be ergative
      (ergatives are always subjects, but subjects are not always ergative).
  * These pieces of information are encoded in the abstract lexical entry of the
    ergative in Martuthunira as shown in (14a)
14 a erg (↑case) = erg
         (subj ↑)
  b.  acc: (↑case) = acc
           (obj ↑)
  c.  loc: (↑case) = loc
           (adjunct ↑)
  b.  proprietive: (↑case) = prop
                   (adjunct ↑)
* the abstract entries for the accusative, proprietive and locative specify the
  grammatical function they indicate, as well as the case feature, as shown in
* the special use of the ↑ in the lexical entries of the case markers.
  * The specification of the case feature is standard:
  each case marker specifies that the attribute case is assigned a certain value
  * The second line in each entry involves inside-out functional designation
    (Dalrymple 1993, 2001)
    * The ↑ following the specification of a grammatical function formulates a
      requirement that, come what may, the constituent should be analysed as a
      subject/obj/ajdun
* Now consider the example in (15) from Wambaya. Here
  * the NP ‘big dog’ is a discontinuous constituent. This poses
  * no problem for Nordlinger’s view of case as the effect of the analysis is
  * the combination of information from the lexical entries of ‘big’,
    ‘dog’ and the ergative case in (14a) results in the two partial
    f-structures shown in (16) and (17)
  * Both the ergative ‘dog’ and the ‘big’ specify that they are parts of subject
(15) galalarrinyi-ni gini-ng-a           dawu bugayini-ni
     dog.i-erg       3sg.masc.a-1.o-nfut bite big.i-erg
     ‘The big dog bit me.’
(16) [ subj [ pred dog
              case erg ]]
(17) [ subj [ case erg
              adjunct [ pred big ]]]
* These two sets of information are unified into the structure shown in (18) as
* hE Nordlinger’s system makes no mention of a-structure and,
  * no connection between a-structural information and case marking
    * in contrast to Zaenen+ on Icelandic
* The next section introduces a model of case within LFG that
  assumes a complex interaction between a-structure, GFs and case marking.

## 4.2 Differential Case Theory 10

* Urdu
  * alternations in which
    the only difference between two clauses is the case morphology on 1 NP
  * difference in semantic interpretation
  * subject alternation aka differential subject marking
    * as it is called in the Optimality Theoretic literature (ch 6)
    * eg in (19) and (20)
    * want: In (19a), the ergative subject indicates that
      Nadya has some control over the action, whereas the
    * has to: dative case in (19b) implies more of an obligation
    * (see Bashir 1999 for a more differentiated analysis)
    (19) a. nadya=ne       zu           ja-na       hE
            Nadya.F.Sg=Erg zoo.M.Sg.Obl go-Inf.M.Sg be.Pres.3.Sg
            ‘Nadya wants to go to the zoo.’
    b. nadya=ko       zu           ja-na       hE
       Nadya.F.Sg=Dat zoo.M.Sg.Obl go-Inf.M.Sg be.Pres.3.Sg
       ‘Nadya has to go to the zoo.’
  * (20) involves an __object__ alternation, or differential object marking in
    * the only difference between the two sentences is the case marker on obj
    * _ko_
      * In addition to marking dative case, as in (19b), the ko
      * also functions as a marker of specificity/definiteness on direct objects
        * it appears only on direct objects in this semantic context, and
        * not retained under passivization, this case marker
        => can be analysed as an accusative
    * The effect of ko in (20b) is that
      Nadya must have a particular giraffe in mind that she wants to go to see
    * In (20a), in contrast, it could be some generic giraffe or giraffes
      * glossed as nominative
        * This case has no overt morphophonological realization in Urdu,
          something which is crosslinguistically quite common.  
(20) a. nadya=ne        jiraf            dekh -na     hE
        Nadya.F.Sg=Erg  giraffe.M.Sg.Nom see-Inf.M.Sg be.Pres.3.Sg
        ‘Nadya wants to see a giraffe/giraffes.’
b.  nadya=ne       jiraf=ko         dekh -na     hE
    Nadya.F.Sg=Erg giraffe.M.Sg=Acc see-Inf.M.Sg be.Pres.3.Sg
    ‘Nadya wants to see the giraffe.’
* alternation between nominative and accusative in __Turkish__ (Enç 1991)
  and other South Asian languages. In this example, as in (19),
  * the only difference between the a and b versions is the case marking. This,
  * semantic difference prompted [késztette] Butt and King (1991) to begin
    formulating an approach to case that included a notion of __semantic case__
  * term has generally been used to refer to the case marking of adjuncts such
    as locatives or temporal expressions
    * Butt and King used this term to apply to
      those case markers of core arguments which also contribute information
      that is relevant for the final semantic interpretation of the clause
  * semantic information contributed by the case markers to flow directly into
    the analysis of the clause, Butt and King (1991), exactly like Nordlinger
  * explicit lexical entries for case markers
  * An example taken from Butt and King (2003), is shown in (21) for the use of
(21) ko (↑ case) = acc
                   (obj ↑)
                   (↑_{sem−str} specificity) = +
* Butt and King’s (1991) proposals for semantic case foreshadowed Nordlinger’s
  ideas about constructive case in that the\
  * case markers themselves are active components which contribute to the anal
* (21 iii) the NP should be interpreted as specific in semantic-structure.
* part of a more complex system that accounts for
  differential case marking patterns
  * the version of linking theory proposed in Butt (1998). In this version of
    * no explicit thematic hierarchy is assumed and the
      thematic roles are restricted to a very basic set: agt, goal, theme, loc
      * Beneficiaries, recipients, experiencers, etc. are all assumed to be an
        instance of a goal, more or less abstract.  
    * case is not integrated directly into the linking between GFs and a-stru
      * As in standard linking theory
    * case marking becomes relevant for linking
      when different linking possibilities exist,
      just as was the case for Zaenen+
      * The information provided by the case morphology can be used to select
        just one of the possibilities.

    * the function of case marking must go beyond just the determination of GFs
      * as the examples in (19) and (20) show,
      In fact,
    * Differential Case Theory (DCT)
    * most instances of case work out to be instances of semantic case, which is
      := being simultaneously: 
        * semantically predictable; 
        * subject to syntactic restrictions, 
          eg being confined to certain grammatical functions. Indeed,
    * the bulk of the crosslinguistic case marking phenomena involve an
      interaction between syntactic and semantic constraints.
* eg ergative case in Urdu, for example
  * can only appear on subjects and ie syntactic restriction
  * it is an agentive case, it also gives rise to some semantic effects
  * As is well known from a host of studies on Hindi/Urdu, the ergative
  * alternates with the unmarked nominative on unergative intransitives (the
    * most comprehensive study of the distri of the ergative is Davison 1999) As
    * alternation correlates with an expression of control/volitionality.  
(22) a. yassin          kh ãs-a 
        Yassin.M.Sg.Nom cough-Perf.M.Sg
        ‘Yassin coughed.’
  b.  yassin=ne       kh ãs-a 
      Yassin.M.Sg=Erg cough-Perf.M.Sg
      ‘Yassin coughed (purposefully).’
* Another example is the accusative/dative ko in Urdu
  * As was seen in connection with example (20),
    when it appears on direct objects, it signals specificity
    * Again, there is a combination of syntactic (direct objects only) and
      semantic factors (specificity)
    * can also appear on subjects (19b) and on indirect objects, as in (23).
      (23) nadya=ne bılli=ko dud di-ya hE
           Nadya.F=Erg cat.F.Sg=Dat milk.M.Nom give-Perf.M.Sg be.Pres.3.Sg
           ‘Nadya has given milk to the cat.’
      * dative is associated with a more or less abstract goal.  
      * In experiencer constructions as in (19b) or (24a–c),
        the experiencer can be thought of as an abstract goal (Landau 2002).
(24) a. nadya=ko skul ja-na pAr.-a 
     Nadya.F.Sg=Dat school.F.Sg.Obl go-Inf.M.Sg fall-Perf.M.Sg
     ‘Nadya had to go to school.’
  b. nadya=ko d.Ar lAg-a
     Nadya.F.Sg=Dat fear.M.Sg.Nom be attached-Perf.M.Sg
     ‘Nadya was afraid.’
  c. nadya=ko kAhani yad a-yi 
     Nadya.F.Sg=Dat story.F.Sg.Nom memory come-Perf.F.Sg
     ‘Nadya remembered the story.’ 
  d. nadya=ne kAhani yad k-i
     Nadya.F.Sg=Erg story.F.Sg.Nom memory do-Perf.F.Sg
     ‘Nadya remembered the story (actively).’
* psych predicates as in (24c) there is again an alternation with the ergative,
  * correlates with the use of the
    agentive ‘do’ in (24d) vs. the non-agentive ‘come’ in (24c)
  * The dative use of ko is also governed by a combination of synt and sem factr
    It is restricted to indirect objects and subjects, but is subject to a
    coherent goal semantics in Urdu.

In DCT, there is thus explicit reference to a-structure concepts such as
goal (datives) or agent (ergative) in addition to further semantic concepts
such as specificity as part of the analysis of case. DCT recognizes case as an
extremely complicated and complex part of the morphosyntactic and semantic interface, particularly as there are also some instances of case marking
which appear to be tied to purely positional/structural or idiosyncractic factors. In DCT, therefore, examples such as the English adnominal genitive
(e.g., John’s hat) are analyzed as purely positional/structural case.

DCT also assumes a notion of default case. Indeed, it can be observed
that structural/positional case is often an instance of default case (the Elsewhere Case, Kiparsky 1973). There are some languages which require that
all NPs have case. For these languages default case satisfies something that
has become known as the Case Filter (Rouveret and Vergnaud 1980). That 
is, if a given NP is not already associated with case due to some specification in some other part of the grammar, then default case assignment
principles can apply. Typical crosslinguistic default cases are nominative or
genitive. Default case only applies to the core grammatical relations subject
and object. The other grammatical relations tend to involve some kind of
specialized semantics and therefore do not involve defaults. Note that this is
essentially the insight behind GB/Minimalism’s postulation of exactly two
structurally Case marked arguments, which are associated with nominative
and accusative case.

Finally, DCT also acknowledges that some instances of case marking are
due to truly coincidental historical developments: no generalization can be
made and the case marking has to be stated as an exception to the system.  
These instances of case marking are labeled quirky.

An example of truly idiosyncratic marking is shown in (25). Urdu requires that subjects of agentive transitive perfect verbs be marked with the
ergative case. However, the verb ‘bring’ in (25) is a transitive verb with
perfect morphology and the bringer can be unproblematically classified as
an agent. But the subject ‘Nadya’ in (25) is nominative and not ergative.
(25) nadya
kıtab
la-yi

Nadya.F.Sg.Nom book.F.Sg.Nom bring-Perf.F.Sg
‘Nadya brought a book.’

The reasons for this aberrant case marking are not clear. Also, there
are no other agentive transitive verbs which behave like this. Therefore this
bizarre nominative case marking must be stipulated as part of the lexical
entry of ‘bring’ (the nominative on objects is regular in Urdu).

On the whole, however, DCT assumes that such instances of quirky case
are relatively rare. Rather, most case marking phenomena should fall under
the rubrik of semantic case, i.e., as being constrained simultaneously by both
syntactic and semantic conditions. This stands in marked contrast to many
theories of case, but does seem to reflect the rather unique crosslinguistic
positioning of case at the interface between lexical and clausal semantics,
syntax and morphophonology.

# 5 Incorporating Optimality Theory


The advent of Optimality Theory (OT, see Chapter 6) was observed with
a great deal of interest in LFG and adopted into the theory very quickly
(Bresnan 2000). The input to an evaluation by OT constraints is assumed
14

to be f-structure and c-structure pairings. The task of the OT constraints
is to pick the most optimal pairing.

Several OT-LFG analyses exist with respect to case and they tend to
fall in line with OT analyses of case in general. I.e., they adopt the insights with respect to differential case marking advanced by Aissen (1999,
2003). Some examples are Sharma’s (2001) analysis of Kashmiri case clitics,

Deo and Sharma’s (2005) analysis of typological and diachronic variation
in Indo-Aryan ergative patterns, Asudeh’s (2001) analysis of optional case
patterns in Marathi. These analyses have all the advantages and disadvantages of the general OT analyses that are discussed in Chapter 6 of this
volume. Asudeh’s analysis, however, proposed an interesting extension to

OT, namely, the availability of optionality in the evaluation of the most optimal candidate. In addition, Lee’s (2001a,b; 2003) work on bidirectional OT
and output-output correspondences provides a new perspective on Hindi
and Korean case as well as word order freezing effects, which are due to
identically case marke arguments in a clause.

6


Summary


In sum, LFG contains a range of differing approaches to case marking. No
account would claim to have developed a complete theory of case marking
crosslinguistically. Rather, new ideas are continually being developed and
tried out in light of new empirical evidence. This does not mean, however, that each account discards already established insights. Rather, each
new account builds on the strong points of previous insights within LFG,
but is simultaneously not willing to let itself be blinded by the previously
established ideas.


References

Aissen, Judith. 1999. Markedness and Subject Choice in Optimality Theory.

Natural Language and Linguistic Theory 17(4):673–711.

Aissen, Judith. 2003. Differential Object Marking: Iconicity vs. Economy.

Natural Language and Linguistic Theory 21:435–483.

Alsina, Alex. 1996. The Role of Argument Structure in Grammar: Evidence
from Romance. Stanford: CSLI Publications.

15

Andrews, Avery. 1996. Semantic Case-Stacking and Inside-Out Unification.

Australian Journal of Linguistics 16:1–54.

Asudeh, Ash. 2001. Linking, Optionality, and Ambiguity in Marathi: An

Optimality Theory Analysis. In Formal and Empirical Issues in Optimality Theoretic Syntax, ed. Peter Sells. 257–312. Stanford: CSLI

Publications.

Bashir, Elena. 1999. The Urdu and Hindi Ergative Postposition ne: Its
changing role in the Grammar. In The Yearbook of South Asian Languages and Linguistics, ed. Rajendra Singh. 11–36. New Delhi: Sage

Publications.

Bresnan, Joan. 1977. Transformations and Categories in Syntax. In Basic

Problems in Methodology and Linguistics. Part Three of the Proceedings
of the Fifth International Congress of Logic, Methodology and Philosophy of Science, London, Ontario, Canada, 1975, ed. R.E. Butts and

J. Hintikka. 261–282. Dordrecht: Reidel.

Bresnan, Joan (ed.). 1982. The Mental Representation of Grammatical Relations. Cambridge: MIT Press.

Bresnan, Joan. 2000. Optimal Syntax. In Optimality Theory: Phonology,

Syntax and Acquisition, ed. Joost Dekkers, Frank van der Leeuw, and

Jeroen van de Weijer. 334–385. Oxford: Oxford University Press.

Bresnan, Joan. 2001. Lexical-Functional Syntax. Oxford: Blackwell.

Bresnan, Joan, and Jonni Kanerva. 1989. Locative Inversion in Chicheŵa:

A Case Study of Factorization in Grammar. Linguistic Inquiry 20:1–50.

Butt, Miriam. 1998. Constraining Argument Merger through Aspect. In

Complex Predicates in Nonderivational Syntax, ed. Erhard Hinrichs, Andreas Kathol, and Tsuneko Nakazawa. 73–113. New York: Academic

Press. Syntax and Semantics Volume 30.

Butt, Miriam. 2006. Theories of Case. Cambridge: Cambridge University

Press.

Butt, Miriam, and Tracy Holloway King. 1991. Semantic Case in Urdu. In

Papers from the 27th Regional Meeting of the Chicago Linguistic Society,
31–45.

16

Butt, Miriam, and Tracy Holloway King. 2003. Case Systems: Beyond

Structural Distinctions. In New Perspectives on Case Theory, ed. Ellen

Brandner and Heike Zinsmeister. 53–87. Stanford: CSLI Publications.

Butt, Miriam, and Tracy Holloway King. 2005. The Status of Case. In Clause

Structure in South Asian Languages, ed. Veneeta Dayal and Anoop Mahajan. Berlin: Springer Verlag.

Dalrymple, Mary. 1993. The Syntax of Anaphoric Binding. Stanford: CSLI

Publications.

Dalrymple, Mary (ed.). 1999. Semantics and Syntax in Lexical Functional

Grammar. Cambridge: The MIT Press.

Dalrymple, Mary. 2001. Lexical Functional Grammar. New York: Academic

Press.

Davison, Alice. 1999. Ergativity: Functional and Formal Issues. In Functionalism and Formalism in Linguistics, Volume I: General Papers, ed.

Michael Darnell, Edith Moravcsik, Frederick Newmeyer, Michael Noonan, and Kathleen Wheatley. 177–208. Amsterdam: John Benjamins.

Deo, Ashwini, and Devyani Sharma. 2005. Typological Variation in the

Ergative Morphology of Indo-Aryan Languages. To appear in Linguistic

Typology.

Enç, Mürvet. 1991. The Semantics of Specificity. Linguistic Inquiry 22(1):1–
25.

Halvorsen, Per-Kristian, and Ronald M. Kaplan. 1988. Projections and

Semantic Description in Lexical-Functional Grammar. In Proceedings of
the International Conference on Fifth Generation Computer Technology,
1116–1122. Reprinted 1995 in Dalrymple et al. (eds) Formal Issues in

Lexical-Functional Grammar .

Kiparsky, Paul. 1973. ‘Elsewhere’ in phonology. In A Festschrift for Morris

Halle, ed. Stephen R. Anderson and Paul Kiparsky. 93–106. New York:

Holt, Rinehart and Winston.

Landau, Idan. 2002. The Locative Syntax of Experiencers. ms.

Lee, Hanjung. 2001a. Markedness and Word Order Freezing. In Formal
and Empirical Issues in Optimality Theoretic Syntax, ed. Peter Sells.

Stanford: CSLI Publications.
17

Lee, Hanjung. 2001b. Optimization in Argument Expression and Interpretation: A Unified Approach. Doctoral dissertation, Stanford University.

Lee, Hanjung. 2003. Parallel Optimization in Case Systems. In Nominals:

Inside and Out, ed. Miriam Butt and Tracy Holloway King. 15–58.

Stanford: CSLI Publications.

Nordlinger, Rachel. 1998. Constructive Case: Evidence from Australian

Languages. Stanford: CSLI Publications.

Nordlinger, Rachel. 2000. Australian Case Systems: Towards a Constructive

Solution. In Argument Realization, ed. Miriam Butt and Tracy Holloway

King. 41–72. Stanford: CSLI Publications.

Rappaport, Malka. 1983. On the Nature of Derived Nominals. In Papers in

Lexical-Functional Grammar, ed. L. Levin, M. Rappaport, and A. Zaenen. Indiana University Linguistics Club. Reprinted in M. Butt and

T.H. King (eds.) Lexical Semantics in LFG, CSLI Publications, 2006.

Rouveret, Alain, and Jean Roger Vergnaud. 1980. Specifying Reference
to the Subject: French causatives and conditions on representations.

Linguistic Inquiry 11:97–202.

Sharma, Devyani. 2001. Kashmiri Case Clitics and Person Hierarchy Effects.

In Formal and Empirical Issues in Optimality Theoretic Syntax, ed. Peter

Sells. 225–256. Stanford: CSLI Publications.

Zaenen, Annie, Joan Maling, and Höskuldur Thráinsson. 1985. Case and
grammatical functions: The Icelandic passive. Natural Language and

Linguistic Theory 3:441–483. Reprinted in Joan Maling and Annie Zaenen (Eds.) Syntax and Semantics 24: Modern Icelandic Syntax, 95–164.

New York: Academic Press. 1990.

18


