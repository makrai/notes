Somers
Valency and Case in Computational Linguistics

parts:
  1. ling theory of valency and case
  1. problems for case
  1. valency and case in comp ling

# part one: theories

## 1 Valency

2. General review
  * Tesnière 1959
    * dependency
    * governor-subordinate
    * actants and circumstantials
      * actants
        1. subjects         Nominative  performs
        2. object           Accusative  undergoes
        3. indirect object  Dative      benefit or detriment (kárát vallja) 
        _mir ist warm_ 
    * valency
  * Helbig and Schenkel 1968
    * the verb as the structural center
    * actant (obligatory and optional) vs. adjunct
    * two treatments of polysemy, p10
  * Heringer 1967
    * complement vs. adjunct
    * numerical annotation of valency
      1. Nom
      2. Acc
      3. Dat
      4. Gen
      5. prepositional complement
3. Distinction of complements and adjuncts
  * semanteme constitutive
  * Zurückführungstest: reformulating as a relative clause
  * substituting the verb (case government): 
    * I have been waiting for my friend for two hours.
    * `*`I have been expecting for my friend for two hours.
    * I have been expecting my friend for two hours.
  * oblique and form
  * `*`He was waiting for his friend and (for) hours
  * substituting the preposition
  * semantically empty preposition => complement ($\not\Leftarrow$?)
  * do so: proform for $ge$ VP
4. Syntactic vs semantic valency
  * deep vs surface args
5. Extensions to classes other than verbs
6. ... complement-adjunct
7. dependency grammar
  * Gaifman

## 2 Fillmore

### 2.1 intro

* the most important problems for Case grammar [are treated in Part II]
  * including the definition of some of the cases themselves

### 2.2 phase I. Up to and including 'The Case for Case'

* A proposal concerning English prepositions (1966)
* Toward a modern theory of Case (1966)
* The case for Case (1968)
* Cases
  * Agentive
  * Instrumental
  * Dative
  * Factitive
  * Locative
  * Objective -- wastebasket
  * ...
* definitions ch 7
* constraints to distinguish and determining the cases:
  * one-case-per-clause (one representative of a given case in a clause), ch 9
  * only NPs representing the same case can be conjoined
  * one-case-per-argument
  * innateness, cognitive reality, experiments
* reception: uses of prepositions
  * decidedly syntactic
  * inherent argument
  * independent lexical use
* transformational background
  * deep cases are relations, p36
    * P: proposition

### 2.3 phase II. Semantics and the lexicon

* the cases as labels for roles of participants in events
* Lexical entries for verbs (1968)
  * predicate calculus adapted
  * capture systematic similarities and differences between arguments of
    different predicates
    * enable the argument places in related predicates to be equated or differentiated
  * optional agent of _hit_
  * difference between _break(OBJ[, INS[, AGT]])_ and _hit_
* Types of lexical information (1971)
  * relationship between conceptual roles and syntactic arguments
* Some problems for Case grammar (1971)
  * ergative
  * Panini's _karaka_
  * the set of cases
    * DAT disappears. experiencer, object, goal
    * new: source
    * full set: AGT, EXP, INS (including force), OBJ, SRC, GOL, LOC, TIME, GOAL
    * benefactive discussed and rejected
    * p10 alja: nem értem, hogy mi a baja
    * locative and time
    * lexical decomposition and benefactive

### 2.4 phase III. Recent extensions

* discourse analysis, speech-act theo, and artificial intelligence
* Subjects, speakers and roles (1972)
  * case labels and more specific semantic labels
    * by, sell, cost, pay, dual case roles
* Topics in lexical semantics (1977)
  * relativization of meanings of both words and sentences to scenes
  * nuclear and peripheral
  * ways that valency-bound elements co-occure
  * the likelihood of various case relationships to be included in the nucleus
  * saliency hierarchy in terms of case features, p47
* The case for Case reopened (1977)
  * semantic valence of verbs and adjectives
  * subject selection
  * universal, language-specific, word-specific
  * means by which different cases can be distinguished
    * ambiguity attributed to roles
    * a single verb with two seemingly disparate classes of nominals 
      * in a given grammatical relation but 
      * different semantic roles
    * sets of verbs that 
      * express a similar predication, but 
      * assign different grammatical relations (_buy_, _sell_) !
  * optionality of constituents
    * conceptually present
  * defining the cases, see Part II

## 3 Anderson: Localist case

* Case grammar by John Anderson, (1968 and) 1971
  
### 3.2 Localism 
### 3.3 Formalism 
### 3.4 Essential features of the theory

* dependency rather than constituency
* prepositions are surface realizations of the cases
* cases
  * nom (later abs) 
    * ~ Obj or Pat
    * in a process with a single non-agentive participant
  * erg
    * initiator
    * with transitive verbs
    * ~ Agt
  * loc
  * abl
* ergative and non-ergative
  * syntactic tests to distinguish erg and non-erg
    * imperative
    * What did Egbert do?/What happened to Egbert? He killed the duckling. He died.
  * nom is compulsory for all verbs
  * ergative--non-ergative verb pairs _open_(nom[, erg]), _kill_-_die_
  * reflexive ergative clauses
    * work: nom is also erg
* one-case-per-clause is also abandoned
* loc: abstraction based on similarities in surface cases
* abl
  * spatial source
  * abstract e.g. buy
  * combination of erg and abl
  ```
  directional \ locative  +   -
  +                       abl erg
  -                       loc nom
  ```

### 3.5 Discussion

* context-sensitive grammar
* importance of morpho-syntactic evidence
  * identical or parallel case forms
  * historical syncretisms
  * comparable paraphrase relations
* lack in any intuitive cognitive appeal
* Fillmorean cases: bridge between
  * the abstractions of the lexicon and 
  * the actualizations of the sentence containing the verb
* Anderson
  * it is the features that are stored in the lexicon
    * +/- locative, +/- directional, +/- stative
* both complements and adjuncts or just the former?
  * _The gamekeeper shot the squire (a földesúrnak) a rabbit._
* disregard of one-to-one relationship between cases and arguments
* doubling: _They caused Egbert _[nom, nom]_ fall through the window_

## 4 Chafe /tSeif/ (1970), Cook (1979), Longacre (1976): Verb features

### 4.1 Introduction

* meaning-oriented

### 4.2 Chafe's verb features

* state and non-state
  * state: single argument
  * tests: what happened?, progressive
  * non-states
    * one-argument
      * processes
      * actions
      * test: What happened to Harriet?/What did Harriet do?
    * action-process: performer + undergoer
* relational roles: Patient and Agent
* no argument: ambient verbs

### 4.3 Derivational features

* relation between verbs of different types
* diagram p66

### 4.4 Further relations and features

* Experiencer + Patient
  * state: want, know, like
  * process: see, hear, feel, learn, remember
  * show, teach, remind generated via the causative derivation from see, know, remember
  * with ambient
* Beneficiary (and mal-)
  * state: have, own
  * process: find, win, acquire, lose
  * action-process: buy, sell, send, give
  * with any action
* Instrument
  * with any action-process
  * no selection for it
* Complement
  * action -> action-process
  * eredménytárgy
  * weigh, cost
  * with any non-process
* Locative
  * state: copula
  * process: fall, sit, crawl
  * action-process throw, put
  * always optional

### 4.5 Cook's case frame matrix (1971...)

* five cases are 'propositional' because they are introduced by verb features
* omits Instrument
* conflates Patient and Complement to Object

### 4.4 verb types combined with either no or one relation, Figure 6

* a locative-ról szólót nem értem
* criticism: what is derivation?  
* covert roles
  * coreferential
  * lexicalised
  * deletable: say Exp ~ optional

### 4.6 Longacre's case frame scheme

* 'more detailed and more irregular' than Cook
* ten nuclear cases
  * set
    * Exp
    * Pat
    * Agt
    * Range (Chafe's Complement)
    * Measure includes the price in a transfer
    * Ins
    * Loc
    * Src
    * Gol
    * Pth
  * diagnostic of some case frames as opposed to others
* peripheral
  * Time
  * Manner
  * Accompaniment
*  not part of clause but sentence level:
  * Cause
  * Purpose
*  twelve verb features x state/process/a-p/action
  * ezt a részt átugrottam
*  implemented in the PTOSYS system, Somers and Johnson 1979

### 4.7 Vendler (1967)/Dowty (1979) event classification

* independent of Chafe and Case grammar, linguistic philosophers
* dates back to Aristotle and...
* categories
  * state: endure...
  * activity: ...homogeneous
  * achievement: instantaneous
  * accomplishment: period + end
* a verb may appear in more than one category
  * we are discussing descriptions of the world
* tests
  * different entailments according to time adverbials and tenses
* Vendler/Dowty vs Chafe/Cook
  * lists are similar
  * differences
* egyik tanulság: a Chafe érzékeny az időre, mert olyan mint a Vendler

## 5 Starosta's Lexicase (1972...)

* summary of Lexicase
* case relations (CR)
* list (1977)
  * Agt
  * Correspondent; formerly Dative or Experiencer
  * Ins
  * Locus; formerly Inner Locative
  * Manner
  * Patient; formerly object
  * Place; formerly Outer Locative
  * Reference; formerly Benefactive
  * Tim
* reject names like Exp because their association with semantic features
  * primacy of syntactic criteria
  * but these criteria are not given
* list (1982): 
  * conflate Ins + Man -> Means
  * Loc include Plc
  * Cor include Ref
* inner and outer CRs
* Pat
  * obligatory in all frames
  * the case relation of the subject for all intrans verbs
  * in the critique: 
    * Fillmore's model allowed a unified treatment of 
      verbs with both transitive and intransitive forms
  * other CRs are defined relating to Pat
* reminiscent of Panini: 
  * there was an obligatory karaka, _karta_ which 
  * figured in the descriptions of the other karaka
  * but karta is Agt
* matching case assignments in logically equiv sentences? p91 (+ buy sell)
  * Fillmore +
  * Starosta -
  * gave Doris the book Dat, Obj
  * gave the book to Doris
* what is the function of CRs?
  * leapt (átugrotta) the chasm (szakadékot) Loc
  * leapt over the chasm
* BTW
  * Schank's (1975) Conceptual Dependency framework see ch 11 sec 6
* applied to Asian and Pacific languages

## 6 Dick's Functional Grammar (1978)

* levels:
  * synt functions: Subject, Object
  * semantic functions: Agent, Goal, Recipient,...
  * pragmatic level: Topic, Focus
* comparison with Transformational Grammar
* overview
  * predicate frames
  * the range of semantic functions
  * mapping semant functions onto synt functions: semant func hier

### 6.2 Predications

* nuclear arguments and satellites (complement and adjunct)
* the range of semantic functions for arguments and satellites overlaps
* terms incorporated to a complex predicate
* terms semantically incorporated into a lexical predicate
* lexical items
  * form
  * synt cat
  * number of args
  * selection
  * the semantic function of the arguments
* comparison with Fillmore: here semantic restrictions on arguments are predicate-specific
* constraint on the number of predicates
* no optionality, transitive-intransitive pairs are derived from distinct predicate-frames
* typology of nuclear predications (_states of affairs_, like Chafe_s verb typology)
  * +/- Control, +/- Dynamic !
  * Zero function: Roses (Zer) are red. The cup (Zer) is on the table.

### 6.3 The semantic functions

* the roles semantic functions play
  * fundamental semantic relations
  * co-define the typology of states of affairs
  * co-determine Subject and Object
  * ...
  * constituent ordering
  * cross-reference and agreement
  * ...
* list
  * Ag Goal Rec Ben Inst Loc Temp Dir Processed Force Positioner Source Zero Exp Poss
* discussion
  * Force, Positioner, Instrument vs Force
  * absence of Pat of Obj (Go and Proc)
  * Exp

### 6.4 Synt func assign and the Semant Function Hier (SFH)

* semantic function assignments: interactions between predicates and predicate-frames
* a semantic interpretation of Subject and Object
* the determine
  * marking by case or adposition
  * constituent order
  * agreement with the verb
  * voice
* hierarchy
  * lang independent
  * assignment to lower semantic functions is more 'difficult'
* Obj means not only the _direct_ object
* problem: is SFH universal?
* argument vs satellite
* 113 languages are mentioned

# part two: some classical problems for case

* how much the problems are artifacts of the theory
* multilingual lang processing

## 7: defining the cases / specificity and multiplicity (and hierarchies) 

### 7.1 Introduction

* is a given case-set intended?
  * different applications of Case theory should result in different case systems
* all case sets are a mixture of specificity vs multiplicity
  * general case notion
  * Object: 
    * affected (disappears)
    * effected (come into being)
    * neutral
  * Agent
    * +/- animate
  * Recipient/Possessor
  * +/- volitive Exp (hear, listen)
* arranging cases hierarchically
  * itt olyan különbségek vannak, amik nálunk már a jelentéshez tartoznak
  * Brodda (1973)
    * Cause
      * intentional
        * Agent
        * Instrument
      * unintentional
    * ...
    * features of subdivision
      * animacy
      * volition
  * Ruus (1979)
    * BTW complementary distribution of cases
  * Grimes (1975)
    * orientation roles
    * process roles
    * agentive complex (including Benefactive)
    * orientation and process roles come in pairs
  * Peterson (1983)
    * cases are feature bundles
    * a részletezést árugrottam
  * summary
    * BTW
      * Agt, Ins and Rec have common possibilities in passives: deep subject
        * ezt ő arra mondja, hogy semmi köze az esethez. Somers generatív?
    * inherent features of typical role-fillers

### 7.2 Agentivity and causation

* animacy
  * pling experiments
  * potency, entities that have power
  * Force vs Instrument
  * intention
  * Mandarin Chinese suffix
  * Tamil: verb pairs
    * hide/mislay, pour/spill...
  * Oosten: mediopassive (patient-subject construction): (15) on p123
    * -> responsibility
  * Cruse
  * Ins 
    * ~ like Agt but inanimate
    * chains of causality: 
      * only the original and the immediate cause can be expressed as a subject
      * -> Agt (precedence) and Ins
    * degrees of Agt

### 7.3 Dat/Exp/Benefactive/Rec

* Dat
  * Indo-Eu dative case or indirect object
  * Fillmore's definition
  * vs Objective: +/- animate
  * see, hear, know
  * give and Benefactive
  * Fillmore 1971b replaces it with
    * Exp - psychological
    * Object -
    * Goal - transfer, movement
* Exp
  * p129 
    * Sam EXP is happy
    * Sam EXP likes Jane.
    * `*`Graham EXP and his book PAT are sad.
      * only NPs representing the same case may be conjoined (Fillmore)
  * verb classes
    * mental: like, irritate, fear, hate
    * perception: see/watch, hear/listen, feel/feel
    * cognition: know, believe and want, hope
    * causatives
      * mental: frighten, please
      * perception: show, tell
      * cognition: teach, learn, remind
  * test: personally
  * characterizations
* Benefactive p133
  * _for_
  * possession and _on behalf of_
  * SUBJ-BEN win/find
  * sell/send/give IO-BEN
  * dual roles, buy/get
  * maleficient
    * _lose_
    * the giver in _give_
    * _accept_(SUB OBJ BEN?)
  * benefactive state verbs: have, own, _belong to_
  * +/- alienable, Ben/Exp
    * surface evidence in many languages (_van valakinek_)
  * on whose behalf, számára, helyett
    * Mary knitted Tom a sweater.
  * possession vs _on behalf of_
    * inner (complement), outer (adjunct), ch 9
    * benefit from the object or the whole action (27)
    * stacking of outer benefactives

### 7.4 Obj, Pat

* distinctions: affected, effected, complementiser, +/- stative
* contrast with Factitive
* absolutive in ergative languages
* negative description, the semantically most neutral
* more internal than the Agt
  * Harriet broke the dish. She did it accidentally.
* minimalist Case theo
  * the number of cases need not exceed the highest valency
  * found for any one verb, 4
  * vs revealing semantic basis
* Complement
  * Lehrer: degrees of cohesion with verbs whose Objs are deletable
    * tautologous accusatives, often cognate
      * I dreamed a dream.
    * limited range of objects: sew
    * Obj can be deleted without loss of meaning: play, continue
    * deletion of the Obj alters the overall meaning: drink
  * Cook: action-process <- action
  * evidence for COMP != PAT
    * This elephant PAT weighs ten tons COMP.
    * `*`This elephant and ten tons weigh.
  * Measure
    * quantifying object?
    * price in a transfer
* effected vs affected p142
  * Fillmore: Objective and Factitive (the later -> Goal)
  * ambiguous: _van Gogh painted the canvas/Starry Night/his bedroom_
  * What did Bev do to the dinner? 
  * What Bev did to the dinner was ruin (tönkretesz)/`*`make it.
  * multilingual:
    * Eng _paint_ = Ger _streichen/bemalen_ Obj vs _malen_ Fact, be- is productive
    * Finnish Accusative vs Partitive
  * further subdivisions
    * a third value: neither affected nor effected e.g. perception and cognition
  * characterization by Cook

### 7.5 Loc/Src/Pth/Gol 145

* adverbs of place and...
* one-case-per-clause?
  * but optional or obligatory
  * inner locative: omission => meaning changes
  * outer locative: attach to any predication (involving an Agent?)
    * stacking up
* promotion to Subj or Obj
  * Chicago is windy
  * only Locatives expressed with content pronouns can be transformed to subjects
  * partitive vs holistic reading
    * John smeared paint on the wall LOC
    * John smeared the wall LOC with paint
  * verbs requiring subj or obj LOC
    * LOC contain, LOC is empty
    * enter LOC
* Temporal?
  * same expression used for location and time in many languages
  * English verbs requiring temporal 
    * direct object: last, take
    * subject: none (Hungaian (el)telik valamivel)
  * inner, outer + stacking
  * where is the time or place distinction encoded in a sentence?
  * Locatives and Temporals can co-occure but 
    * without the possibility of coordination
    * `*`He walked from the top of the hill until sundown.
* state and direction p153
  * surface differences
    * case (German and Latin dative vs accusative)
    * preposition (at, to)
  * Fillmore
    * 1968a: no contrast
    * 1971b: Src, Gol
  * Loc proper: be, live, spend
  * languages where verbs coincide with Case markers
    * Awutu
      * Src leave
      * Gol go
    * Chinese
      * Ins?    use
      * Ben?    give
      * Loc     be_in
      * Comit   follow_together?
      * Src     from (not verb)
      * Gol     reach
  * Anderson: allative (=AT, =TO) and ablative (=FROM)
    * coincidences of =AT and =TO in Eng, French, Dutch
  * stative Src and Gol
    * The Mall extends from ... to
  * Chafe: verb + prep ~ non-derived:
    * sit in ~ occupy
    * crawl under ~ enter
  * static + directional co-occurrence: only inner + outer
  * applied to temporal
* Path p156
  * Sam threw the watermelon over the fence PATH to Jim GOAL
  * prepositions
  * complement or adjunct?
    * Caesar crossed the Rubicon
    * Alcock and Brown flew (átröpül) the Atlantic in 1919
  * via Bloomington, Springfield, St. Louis... -- the order is significant
  * co-occurrence with Src and Gol
  * temporal
* metaphorical p159
  * Anderson: abstract uses of (surface) cases in general, location, *state* or time
  * Fillmore 1971 
    * Factitive -> Goal
    * Dative -> Goal
    * blame, accuse, criticize
      * blamee Goal
      * stimulus Obj
      * subject Src
    * Goal vs Pat
      * I shot at Harry     I shot a bullet from the gun
      * I shot Harry        I shot the gun
  * Anderson 
    * know, like, want (surface structure in many languages), methink, mich dünkt
    * subj is LOC
  * transfer (and paraphrases): 
    * buy, sell, lend, borrow, teach, learn
    * (give) thank, help (hefen DAT)
    * obey
  * Grime:
    * Material and Result
  * Teng
    * like, resemble, hit, look for, know (obj is Goal)
  * Panini
    * karma: which is desired by the karta
  * the direction is problematic
  * no Source with states
  * Path and non-directional Locatives
    * travel by something
    * comparisons
      * similar =TO
      * London is larger =FROM Birmingham
      * David is long =IN the leg
    * tell over the phone, hear whit my own ears, witness with unbelieving eyes

### 7.6 Comitative p164

* not including Manner
* Comitative, accompaniment
* deep case or surface phenomenon related to coordination?
* combine with Ins: the same surface form in almost all languages
* arguments 
  * coordination does not imply joint participation
  * reciprocal verbs
    * ambiguity of fight with (against/alongside)
    * meet, quarrel
    * `(*)` sg subj/coordinated subj + sg verb/sg subj + with-phrase
  * Com is always associated with a second case
    * shared restrictions
    * the Com relation is between to NPs
  * derive structures in `(*)` from a common underlying structure
  * hierarchy among nouns in the same role
  * Walmsley: subsume under Ins
    * Com: accompany (with locative) vs assist/help
    * Ins: use
    * Coms and Inss cannot co-occur
    * the same case with +/- animate, +/- locative
  * critique by Buckigham
    * Ins and Com can co-occure
  * concomitant predication
  * degrees of participation
  * in negative sentences

### 7.7 Essive p171

* nominal predication ("x is a y")
* PP complements
  * This book is by Chomsky.
* be, become
* and the locative
* 'N is N' actions
* languages lacking copula
* and adjectives

## 8 One-Case-Per-Argument: Dual Roles p171

* with a number of verb classes
  * locational, Src and Goal --> case grid, ch 10
* 1. Dual roles involving Source and Goal
  * locative + Agent
  * transfer, communication, propulsion (meghajtás), judging
  * verb pairs 
    * buy/sell, teach/learn
* 2. Other instances of duality
  * Agt and Pat are sometimes coreferential
    * motion: rise, arise, ascend, list
    * wash, shave
      * Agt is not optional
      * ~Daniele waschte sich EXP die Hände PAT.
    * causative (műveltetés)
      * Hindi: the cause[r?] is marked dative or ins 
        * depending on whether it is affected by its own action
      * verbs of perception, motion, _drink_, _read_
      * French, Spanish: reflexive
  * verbs of perception where Exp can be +/- agentive
    * agentive perception
      * pair with non-agentive verbs
      * cognition: learn/know, invent/discover...
      * distinction made in some language, and not in some other
      * states and non-states
      * can taste: not ability but transfer to progressive
      * Chinese: non-agt morpheme
      * German: prefix for agency
  * ...
* 3. A valency solution?

## 9 One-case-per-clause: inner vs outer roles

* one occurrence of a case per clause
* + coordination constraint and subordination
* and Anderson
* equational and symmetric predicates
  * resemble
    * symmetric?
* ...on a bench under a tree...
  * 'PP PP' subordination
* lexicalised arguments
* inner and outer
  * Locative
  * Ben and Agt
  * Exp
    * ethic dative
      * Du bist mir ein fuler Kerl
    * adversity passive
      * ~Taroo was run away by his wife
  * Src Pth and Gol
    * spatial and temporal
    * inner and outer Src or Gol, both spatial or both temporal
  * Ins
  * Manner
  * Comit
  * Pat
    * no outer
  * hierarchy: more typically complement or adjunct

## 10 The case grid proposal 196

* Introduction
  * on testing the ideas here: section 3
  * similar to a recent proposal by Ostler (1980)
* Ostler
  * semantic relations: bundles of features
  * basic roles: Theme, Goal, Source, Path (+/- Source, +/- Goal)
  * predicates: static (-Source)/dynamic
  * further features: 
    * positional, identification, possession, cognition
    * map onto +/- sentient and +/- abstract
  * + volition and action types eventive/agentive
  * internal and external roles
* The case grid
  * smaller axis: Src, Pth, Gol, Local/Neu
  * larger axis: p202
    * standard Case: Agentive Objective Benefactive Locative & Temporal Ambient
    * verbal voice: Active Passive Dative
    * surface case: Nom Acc Dat
    * verb types: Actional Processive Experiental 
  * Temporal Path: duration
  * Active: 
    * Src Agent/Causer (volitive, animate)
    * Gol result/goal/purpose, active recipient (buyer, getter)
    * Pth instrument
    * Loc reflexive (Reciprocial), "talk with"
  * Objective
    * Src original state, material
    * Gol final state, physical result (Factitive)
      * not intended as opposed to Active Gol
    * Loc element undergoing state-change of whose state is described
    * Pth enabler non-controlled, non tool-like instrument
  * Dative: 
    * psych                       transfer
      * perception
      * cognition
    * Gol Experiencer             givee
    * Src stimulus, cause,        from whom sg is got
    * Path                        price
    * Loc content (of cognition)  gift
  * Ambient (környező)
    * abstract, peripheral
    * Src reason, abstract cause
    * Gol aim, result, consequence (-volitive)
    * Pth manner
    * Loc conditions
  * inner and outer p206
  * dual roles, correspondence of cases in related verbs 208p
    * see vs look: Dative vs Active Goal
  * syntactic properties 208p
    * small axis: semantics
    * large axis: syntax

# Part Three: Case and Valency in Language Processing

## Introduction

* ATN parsing
  * An augmented transition network (ATN) is a type of graph theoretic
    structure used in the operational definition of formal languages.
  * A grammatically correct sentence is parsed by reaching a final state in any
    state graph.

## 11 case in comp ling and AI

### 11.1 Introduction

* areas
* systems, points of view
* general discussion

### 11.2 Fundamental issues

* using Case
  * general hlu
  * question answering
  * inference, memory
  * summarizing
  * speech recognition
* investigate Case
  * generate Case-based representations
* relation to syntax
  * prior essentially syntactic parse
    * determine
      * main verbs and
      * arguments to with case is then assigned
    * with ATN
  * syntactic and Case-like semantic criteria in parallel
    * Nash-Webber 1975
  * Taylor et al 1977
    * case for verb meaning disambig
  * no syntax
* case set used
  * Fillmore
  * purpose-built
  * specialized, general or mixed
    * Bobrow and Winograd 1977 KRL
  * language oriented or deeper cognitive aspect
    * deep: Schank 1972--77,...

### 11.3 Case parsers

* systems in which case analysis is the central goal
* PARSIFAL Marcus 1980
  * the case-frame determiner is 
    * indeterministic
    * parallel to syntactic parsing
    * case frame representation in intended to 
      * word sense disambig but 
      * no semantic generalization
      * capture the different behaviours present in English
      * taken from Levin 1977
    * algorithm
    * case frames for noun heads
    * semantic tests, hypothesis confirmation
      * Katz and Fodor 1963 markers % TODO
* Celce-Murcia
  * case set
    * Theme
    * Casual Actant (Agt, Ins)
    * Locus
    * Src
    * Gol (inner, outer)
  * verb paradigms
    * transformations (alternations) p217
* PTOSYS Somers 1979--82 
  * inherent features
  * ...

### 11.4 Case supplants (kiszorítja) syntactic parse

* Case plays instrumental role
* SPEECHLIS Nash-Webber 1975
  * b) p220 concept or entity?
  * obligatory/optional/elliptic(!)
  * association of prepositions to cases
    * differ from verb to verb
* Wilks 1973--6, Hendrix 1973
  * speech recognition
  * info retrieval
  * Stanford MT project
  * translation is a test of Case
    * French translation is either right or wrong
  * preference semantics
    * templates
      * agt-action-obj
      * formulas for individual word senses
    * paraplates 
    * inference rules
  * massage text to become as deep as is necessary
  * formula marker just specifies semantic preferences
    * if it could specify the preferred agent without
    * reference to agenthood, it would
  * John fired at the stags -> John used a thing
* Hendrix 1973 p226
  * question-answering system 
    * with natural language new information
    * ATN
    * no synt anal phase as such
* proposal for Case-driven ATN parser p229

### 11.5 Specialized case systems p232

* domain-specific relations
  * CHRONOS Kulikowski
    * medical expert system
    * causal network model
    * verbs in a broad sense
      * _Flows_ of aqueous humor in the anterior chamber increases
    * cases as
      * representation of input and 
      * in the diagnosis model
  * PROLID Harbusch
* slot names and their features differ from predicate to predicate
  * PLANES Waltz p234
    * natural language front-end for QA from database
    * military aircraft maintenance and flight
    * concept case frames
    * traditional and test-type specific cases and predicate classes
  * KRL Bobrow and Winograd 1977
    * conceptual entities with descriptions and procedures... p236
    * default assumption for case-slots p237
    * the same slot name has different meaning 
      * with different predicates
    * Charniak: case-slot identity theory
      * semantic slot: e.g. buyer
      * minimal hypothesis
        * mapping between cases and semantic slots is arbitrary
      * maximal hypothesis
        * cases and slots are the same
      * inheritance of slots via IS_A p239
      * applier differentiates instrument
    * frames Minsky 1975
      * computer vision
      * sripts Schank and Abelson 1977
      * slots and fillers
  * GUS Bobrow 1977
    * dialogue system
    * travel agent
    * mixed initiative conversation
    * analysis steps
      * synt pars
      * case frame anal (linguistic)
        * selectional restrictions
        * mapping between surface cases and semantic roles
      * frame reasoning (cognitive)
  * is this still Case? Section 7
    * Charniak

### 11.6 Linguistic vs cognitive representations p244

* Simmons 1971--73
  * Napoleon elvesztette a waterlooi csatát Wellingtonnal szemben.
  * Wellington legyőzte Napóleont a waterlloi csatában.
* Conceptual Dependency, Schank 1972--81
* on the importance of the distinction p251
  * actual/virtual: filled frame/just positions

### 11.7 What constitutes using Case? p254

* Charniak 1975
* case use vs case notation: labels vs meaning
* one of the obvious case benefits:
  * comparing meanings of related predicates
  * additional information carried by case labels simplifies mapping
* cases should have some meaning
  * [the meaning of a case is] the set of inferences one can make ... knowing
    only [the case]
  * what you want ?= meaning(verb) + meaning(noun) + meaning(case)
  * ...
* common features of the systems in this chapter
  * cases have some interpretation independent of the predicate
    * Fillmore: allo-cases and caseme :-(
  * a relatively small set of intuitive relations
  * cases must add something to the representation
    * not map trivially to e.g. surface case

## 12 Case and valency in MT p262

* transfer-based vs interlingua-based
* former
  * the intermediate representation depends on the target language

### 12.1 Valency in MT

* lexicon entries
* complement vs adjunct p265
  * preposition in a valency-bound element 
    * is semantically void
    * map many-to-many between languages
  * prepositions in adjunct
    * meaningful
    * translation process

### 12.2 Case in MT p268

* problems that could be solved using Case
  * like/tetszik
  * ...
* systems p270
  * Nishida 1980 English-Japanese
    * Japanese 
      * simple mapping between deep cases and postpositions
      * non-living subject problem
  * METAL, Texas, German to English, Lehmann 1980
    * operational rather than experimental
      * the best one around at the moment
    * 5 features for restrictions on the argument
      1.role of argument
      2.(semantic) type
      3.(syntactic) marker
      4.form
      5.transitivity type 
    * list of RAs p274
      * central
        * Agt
        * Ins
        * Target (=Objective or Patent)
        * Ben
        * Rec
        * Reflexive
          * behave oneself
        * Topic
          * talk about, discuss sg, subject of the copula
        * Commutative
          * ~traditional Comitative: co-agent, co-object
          * each other 
          * The Johnsons are sitting with the Smiths
        * Body-part
      * peripheral p275
        * 30 major + additional
        * can be obligatory

### 12.3 Personal approaches p278

* we suppose that only in the bilingual transfer state can source- and
  target-language information used (simultaneously)
* traditional + more specific: last paragraph on p208
* word compounds p281
* complex noun groups whose head is derived from a verb
  * as a direct nominalization
  * as a cognate form e.g. loss
  * where there is a semantic link e.g. victory
* for a given verb, it may be more important criterion that its Agent be
  animate than that it be the deep subject, or that it be expressed as a NP...
  p283
* combinations of different clues
* for generation! p284--285
* interlingual MT p286
  * conditions for feasibility
    * restricted syntax
    * controlled vocabulary
      * universal lexical values
        * Wünster 1971 terminological equivalence:
    * fairly closely related languages
