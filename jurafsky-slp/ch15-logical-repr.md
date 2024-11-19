in Speech and Language Processing. Daniel Jurafsky & James H. Martin.
Draft of December 29, 2021.

# 15 Logical Representations

* meaning representations: In this chapter we introduce the idea that
  the meaning of linguistic expressions can be captured in formal structures
  * human tasks that require some form of semantic processing,
    eg learning to use a new piece of software by reading the manual,
    deciding what to order at a restaurant by reading a menu, or
    following a recipe.
  * link the linguistic elements to the necessary non-linguistic knowledge of
    * eg knowledge about food and its preparation, what people like to eat
* meaning representations that are made up of the same kind of stuff
  that is used to represent this kind of everyday common-sense knowledge of the
  * semantic parsing/anal: assignen such representations to linguistic inputs
  * computational semantic: the entire enterprise of
    designing meaning representations and associated semantic parsers is
```
∃e, y Having(e) ∧ Haver(e, Speaker) ∧ HadT hing(e, y) ∧Car(y)

h / have-01
arg0
i / i
arg1
(h / have-01
arg0: (i / i)
arg1: (c / car))

Having:
Haver: Speaker
HadThing: Car
```

* Fig. 15.1, meaning representations using four commonly used meaning repr langs
  * First-Order Logic, covered in detail in Section 15.3; the
  * directed graph and its corresponding textual form is an example of an
    Abstract Meaning Representation (AMR) form (Banarescu+ 2013),
  * frame-based or slot-filler representation, discussed in Section 15.5 and
    again in Chapter 17.2.
* they all share the notion that a meaning representation consists of
  structures composed from a set of symbols, or representational vocabulary.
  * all four representations make use of
    symbols corresponding to the speaker, a car, and a relation denoting possess
* representations can be viewed from at least two distinct perspectives in all
  * as representations of the meaning of the particular linguistic input I have
  * as representations of the state of affairs in some world. It is
  * this dual perspective allows the reprs to be used to link
    linguistic inputs to the world and to our knowledge of it.
* Chapter 16 then introduces techniques for semantic parsing: generating these

## 15.2; background: our desiderata for a meaning representation language

* guarantees that these representations will actually do what we need
  provide a correspondence to the state of affairs being represented.

## 15.3 First-Order Logic

* historically the primary technique for investigating natural language sem

## 15.4 how FOL can be used to capture the semantics of events and states

