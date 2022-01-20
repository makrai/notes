Enhanced English Universal Dependencies:
  An Improved Representation for Natural Language Understanding Tasks
Sebastian Schuster and Christopher D. Manning
LREC 2016

# Abstract

* Many shallow natural language understanding tasks use dependency trees to
  extract relations between content words
* the original Stanford Dependencies representation also defines two dependency
  graph representations which contain additional and augmented relations
* In this paper, we
  * revisit and extend these dependency graph representations
    in light of the recent Universal Dependencies (UD) initiative and
    provide a detailed account of an enhanced and an enhanced++ English UD
  * converter
    * from constituency to basic, i.e., strict surface structure, UD trees, and
    * from basic UD trees to enhanced and enhanced++ English UD graphs
  * release both converters as part of Stanford CoreNLP and the Stanford Parser

# 1 Intro

* Stanford Dependencies (SD) representation (de Marneffe+ 2006) has
  both a syntactic and a shallow semantic representation
* usage of SD fall into two categories
  * tasks that require a syntactic tree
    * such as
      * source-side reordering for machine translation (e.g., Genzel (2010))
      * sentence compression (Galanis and Androutsopoulos, 2010)
    * a sound syntactic representation is more important
      than the relations between individual words
  * shallow natural language understanding (NLU) tasks
    * such as
      * biomedical text mining (e.g., Airola+ (2008)),
      * open domain relation extraction (e.g., Mausam+ (2012)), and
      * unsupervised semantic parsing (Poon and Domingos, 2009)
    * the relations between content words are more important
      than the overall tree structure
* which one of the three SD representations is being used for the tasks?
  * basic SD trees which are guaranteed to be a strict surface syntax tree
  * collapsed or CCprocessed SD representations
    * may be graphs instead of trees, and
    * may contain additional and augmented relations
* e.g. “Fred started to laugh”
  * relation between the controlled verb _laugh_ and its controller, _Fred_
  * in the CCprocessed SD representation, this relation is made explicit
* the majority of UD efforts so far have focused on the development of the
  basic UD representation and the annotation of treebanks
  * Both de Marneffe+ (2014) and Nivre+ (2016) also
    mention an enhanced UD representation and acknowledge its usefulness but
    neither gives a detailed account of such a representation
* In this paper, we
  * revisit and extend the collapsed and CCprocessed SD representations
  * provide a detailed account of an enhanced English UD representation and
    introduce the enhanced++ representation
  * implementation of a converter
    * from phrase-structure trees to basic UD trees
    * from basic to enhanced and enhanced++ English UD graphs
    * released both tools as part of Stanford CoreNLP and the Stanford Parser

# 2 The enhanced UD representation 2

* adding relations and augmenting relation names
  * contain all the relations of the basic UD tree
* Augmented modifiers
  * there already exists a relation between the content word in the
    prepositional phrase and the word that is being modified by the PP in the
    basic UD representation, and there is no need for an additional relation
  * the collapsed SD graphs also include the preposition in the relation
    name. This helps to disambiguate the type of modifier
  * all nominal modifiers (nmod) also include the preposition in the name
  * The same is true for more complex PPs which are either analyzed as
    adverbial clause modifiers (advcl) or as adjectival clause modifiers (acl)
  * conjunct relations augmented e.g. conj:and
* Propagated governors and dependents to clauses with conjoined phrases
* Subjects of controlled verbs

# 3 The enhanced++ UD representation

* for many NLU systems that try to extract relationships between entities, e.g,
  * open domain relation extraction (e.g., Mausam+ (2012)), or
  * relationships between objects in image descriptions (Schuster+ 2015)
* partitive noun phrases such as _both of the girls_ in which
  _both of the_ acts semantically as a quantificational determiner
  * In the basic UD representation, however, _both_ is the head while
    _both girls_ is headed by girls:
  * in order to obtain a similar analysis for both phrases, we would have to
    change the structure of the basic dependency trees, which is not allowed
    according to the guidelines for enhanced dependency graphs
* multiword prepositions such as _in front of_
  e.g. _a house in front of the hill_
  `house -- front -- hill`
  contains a relation between house and front, and front and hill
  * the relation between house and hill is going to be more relevant
* another representation which allows for the deletion of relations

## 1/4 Partitives and light noun constructions

* partitive noun phrases such as _both of the girls_,
* we
  * follow Barwise and Cooper (1981) and Keenan and Stavi (1986) and
  * treat the first part of the phrase as a quantificational determiner
  * promote the semantically salient NP to be the head of the partitive and
  * analyze the quantificational determiner as a flat multi-word expression
    that is headed by its first word
  * we attach them using the special relation _quantificational modifier_
    (det:qmod)
* Light noun constructions (Simone and Masini, 2014) such as
  _a panel of experts_ or _a bunch of people_ pose similar challenges
  * the light nouns are the head of these phrases in the basic UD trees
  * We analyze light noun constructions as a quantificational determiner

## 2/4 Multi-word prepositions

* UD representation analyzes some multi-word expressions with function words,
  e.g., _due to_, using a special mwe relation,
  the set of these expressions is very limited and
  does not include many multi-word prepositions

## 3/4 Conjoined prepositions and prepositional phrases

* such as “I bike to and from work” also pose some challenges
  * Ideally
    * there is an nmod:to as well as an nmod:from relation
  * _bike to work_ and _bike from work_ are conjoined by _and_
  * CCprocessed SD representation introduced copy nodes which we adapt _I bike
    and bike 0 to and from work_
* conjoined prepositional phrase such as “She flew to Bali or to Turkey”
  * should encode that the two nmod:to relations are conjoined by _or_. For
    these reasons, we also analyze such clauses with copy nodes

## 4/4 Relative pronouns

* we attach
  * the referent of the pronoun directly to the governor of the pronoun
  * the relative pronoun to its referent with a referent (ref) relation
  e.g. _The boy who lived_
  ```
  ++boy ref who
  ++boy nsubj lived
  ```

# 4 Generating dependency trees and graphs 4

## 4.1 Converting to basic dependencies

* based on the Stanford Dependencies converter (de Marneffe+ 2006)
  which we updated according to the English Universal Dependencies guidelines
* semantic head finder which operates similarly to the Collins head finder
  (Collins, 1999)
  * For each constituent type, we define a set of rules that determine
    from which of its children the constituent inherits its head
    * mostly conditions on the constituent type of the child like Collins
    * some of them also take surface tokens into account: main verbs and
      auxiliaries.  We traverse the constituency tree in depth-first order and
      use these rules to obtain and store the head of each constituent,
  * The head of each token is then simply
    the head of its lowest ancestor whose head is not the token itself
* To determine the relation types, we define for each grammatical relation a
  set of tree patterns in the form of tregexes (Levy and Galen, 2006)
  * we try to find a pattern that matches the subtree rooted at the lowest
    common ancestor of the head and the dependent
* Two problems that need preprocessing
  * many MWEs with function words are not a constituent
    according to the Penn Treebank annotation guidelines (Marcus+ 1993)
  * wh-words in questions e.g. _What does Peter seem to have?_
    * for manually annotated treebanks, Choi and Palmer (2012) proposed to
      resolve these ambiguities with the indexed empty nodes
    * the output of most constituency parsers does not contain these nodes
    * we try to solve this issue by considering the selectional restrictions

## 4.2 Converting to enhanced and enhanced++ dependencies

* Currently, we don’t propagate object or nominal modifier relations in clauses
  with conjoined verb phrases such as “the store buys and sells cameras”
  because of many cases such as “she was reading or watching a movie”
  * Nyblom+ (2013) successfully used a machine learning approach to solve
    this problem for Finnish but as there currently exists no corpus annotated

# 5 Comparison to AMR

* Representing the meaning of sentences as directed graphs Shieber (1984)
* Abstract Meaning Representation (AMR; Banarescu+ 2013)
  * received significant attention in recent years
* compared to UD graphs, AMR aims to abstract further away from the surface
* AMR encodes sentences using PropBank framesets (Palmer+ 2005) and
  approximately 100 fixed relations. This makes AMR deeper
* The expressivity of AMR is constrained by the set of PropBank framesets
  * particularly problematic for neologisms such as _to venmo_
* our representation does not distinguish between comitative and instrumental
  * AMR requires SRL which is very hard

# 6 Limitations

* generalized quantifiers and controlled verbs, such as the following sentence
  e.g. _Everybody wants to buy a house_
  `Everybody nsubj:xsubj buy`
* this UD graph encodes approximately
  `Everybody wants that everybody buys a house`
* the graph for “Everybody sleeps or is awake” approximately encodes
  `Everybody sleeps or everybody is awake`
* _Sue and Mary are carrying a piano_
  * whether a conjoined subject should be interpreted distributively or
    collectively also depends on world knowledge and the context
