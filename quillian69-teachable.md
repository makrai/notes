The Teachable Language Comprehender:
  A Simulation Program and Theory of Language
M. Ross QUILLIAN
1969

# Intro

* psych real
  * Reaction time data Supporting the notion that people's semantic memories
    have at least an overall organization like that of TLC's is reported in
    Collins and Quillian (1968)
* _Comprehending_ text is here defined as the relating of assertions made or
  implied in that text to Information previously stored as part of the
  comprehender's general _knowledge of the world._
  * encoding in TLC's memory format a representation of what the program
    decides the meaning of the text to be
* all of a comprehender's knowledge of the world is stored in the same kind of
  memory
* memory format is a further development of that used in a previous _semantic
  memory_ program (see Quillian, 1966, 1967, or in Mlnsky, 1968);
* client's lawyer
* richness of a given comprehension of a piece of text
  as the number of related memory items that the comprehender finds
* relation to other work
  * the TEMPO project (Thoraoson et al, 1965) or 
    the SDC project (Simmons, Burger and Schwartz, 1968.)
    * share with TLC the aim of reasoning applied to English input by using very
      large, very general stores of information
    * question answerers
  * Bobrow or Raphael
    * aim at dealing with English in one strictly limited subject matter
* reasoning mathematically, visually, or in some other specialized way
  * a program probably will have to incorporate techniques such as those used
    in the Bobrow and Raphael programs, as well as in others such as G.P.S
    (Newell et al. 1962). In this regard see also the programs in Felgenbaum
    and Feldman, 1963, Reitman, 1965, and Weizenbaum, 1967.)
* [relation with] syntactic _competence_ models of transformational linguistics
  (Chomsky, 1965) Is not clear. The efforts that have been made so far to
  attach _semantics_ to transformational models seem, to this writer at least,
  to have achieved little success (Woods, 1968, being the most significant
  attempt.) Correspondingly, TLC so far works with syntax on a relatively
  local, primitive basis,

## 1.5 Teaching TLC To Comprehend p15

* TLC's memory contains
  * factual assertions about the world, and
  * what will be called _form tests._ Form tests constitute the syntactic part
* any one particular phrase or clause will never relate to all the pieces of
  information in such a memory, but only to something on the order of five or
  ten such pieces
* interaction with a human monitor, its teacher, who provides each piece of
  factual knowledge and each form test as the program needs it. using an
  on-line teletype, the monitor can oversee the program's attempts to read
  text,
  * approve or disapprove of each step
  * provide it with additional factual information or form tests as these are
    required
  * We anticipate that although the program will require a great deal of input
    by the monitor as it reads the first book, it will tend to require less and
    less
    * over a long (but finite) period of general reading, the monitor (teacher)
      will become completely unnecessary

# 2 THE MEMORY p18

## A. The Format For Factual Information p18

* information is encoded as either a _unit_ or as a _property._ A
  * unit represents the memory's concept of some object, event idea, assertion,
    etc
    * any of the kinds of thing which can be represented in English by a
      single word, a noun phrase, a sentence, or some longer body of text
    * square brackets
  * property on the other hand encodes any sort of predication
    * verb phrase, a relative clause, or by any sort of adjectival or adverbial
      modifier
    * parentheses
  * pointers in the memory always go to other units
  * English words are stored outside the memory proper, in a _dictionary._
    Each word in this dictionary is associated with one or more pointers to
    units in the memory, each of which represents one of the word's meanings
  * unit
    * Any unit's first element (reading left to right) must always be a pointer
      to some other unit, referred to as that unit's _superset_. A unit's
      superset will in general represent some more generic concept than the
      unit itself represents. Thus the superset of a unit JOE-SMITH might be
      MAN, that of MAN might be PERSON, that of PERSON might be ANIMAL, etc
      (Any of these could also be the unit NIL, used throughout to represent a
      lack of further information.) After its first element, a unit can contain
      either nothing, or any number of pointers, but each of these must be to a
      property,
    * [genus and differentia specifica] All properties pointed to in a unit
      represent predicates which, when associated with that unit's superset,
      comprise the concept the unit represents. In other words, a concept is
      always represented in our format by pointing to some generic unit, its
      superset, of which it can be considered a special instance, and then
      pointing to properties stating how that superset must be modified in
      order to constitute the concept intended
  * property
    * property is always essentially an attribute-value pair, but in the memory
      format this notion has been broadened well beyond its usual usage. That
      is, not only traditional dimensions and values such as (color white) are
      encoded as attribute-value pairs, but also any preposition and its
      object, and any verb and its (direct) object. Thus, a property
      corresponding to (on hill) could be encoded, as can the property in Fig
      3, (employ professional ...)
    * first element of any property must always be a pointer to its attribute,
      and its second element must always be a pointer to its value. These two
      obligatory elements are followed optionally by any number of pointers to
      other properties
* [after summary:] space is available in each unit (but not shown here) for
  storing quantifier-like modifications of it, and for allowing a unit to
  represent one set of other units, bound together by AND, by INCLUSIVE-OR,
  or by EXCLUSIVE-OR

## B The Overall Organization Of Factual Information p23

* inheritance
* breadth-first tracing, _activation tag_
  * more than one initial starting unit
  * Some restriction on the number of passes to make before quitting must
    always be given to such a routine, whether or not the process is also
    terminated after some given number of intersections have been located
  * used in a number of ways within TLC, with more elaborate
  * tags which allow the program to distinguish an intersection unit that is
    connected to an initial unit by a path going only through supersets

# HOW TLC WORKS

## A. Finding Memory Properties Related To The Text p26

* obstacles
  * Words usually have multiple meanings
  *
  * refer to things discussed earlier
  * and attempt to overcome [all three of these obstacles] as part of a single
    process. This process _is_ its detailed theory of language comprehension
* candidates for that word's meaning; there is
  * one pointer to each
    * of the word's possible dictionary definitions and
    * anaphoric referent
  * [In Fig 4A] three different lawyers have been discussed previously in the
    text, and since there is also one dictionary meaning of the word, four
    pointers appear in its candidate list
  * [search for properties]
  * [spreading activation + morpho-syntactic check]
  * At this point the program ... is ready to use the information [the input
    piece of text to one property] provides

## B. The Encoding Process p34

* [prolog jellegű keresés]

## C. Identifying Units by Information in Memory p36

* _superset intersection in memory_
  * The two units' superset chains merge at some point
* intersection between the candidate units JOHN and TEACHER, since their
  superset chains merge at the unit PERSON
  * not particularly useful for comprehension, however, since it does not
    involve any properties of either JOHN or of TEACHER
* TLC locate intersections is something close to a breadth-first order
  * [variant] ignoring all the irrelevant kinds of intersecting pairs,
* [if] TLC does locate two units which have a superset intersection, either the
  units are identical in meaning, one is a superset or the other or both are
  members of some common superset
  * In the first two cases TLC immediately reports the two units as
    semantically acceptable to identify. In the last case it checks to see if
    there is anything contradictory
* units in the memory which represent sets

## D. Automatic Generalization of Data and of Form Tests in TLC's Memory p43

* _young client_
  * Correct comprehension of this phrase must supply the fact that this
    client's `age` is being Judged young, which is not explicit in the text
* inference
  * (Psychological data in Collins and Quillan, 1968 and 1969, bears directly
  * Lonevear, 1968, discusses some [other types]
* [using new knowledge] p45
  * form tests [should be] associated
* TLC in effect automatically generalizes each form test it is given to all
  properties having the same attribute. This goes some way toward generalizing
  each capability given to TLC,

## E. TLC And Complex Sentence Structure p47

* _lawyer's young client_
* [in form tests, there is a] syntactic _head_
  * indicated in the English output of Fig. 1 when TLC says, _Under discussion
    is a client ..._
* the program terminates its processing then only a single head remains
* No running record is kept of the sentence's syntactic structure as this
  structure gets deciphered during comprehension
* name a particular syntactic relationship (step) in the grammar, and name
  particular words of the input string to be related in that way

## F. Unsolved Problems p58

* reason spatially

# 4 SUMMARY p63--67
