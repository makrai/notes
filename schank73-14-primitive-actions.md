THE FOURTEEN PRIMITIVE ACTIONS AND THEIR INFERENCES
Roger C. Schänk
March 1973 National Technica! Information Service, US Department of Commerce

# rt?STRACT:

* In order to represent the conceptual information underlying a natural
  language sentence, a conceptual structure has been established that uses the
  basic actor-action-object framework, il '..'as the intent that these
  * only one representatioii for one meanl.ig, regardless of the semantic form
    of the sentence being represented. Actions were reduced to their basic
    parts so as co effect this
  * only fourteen basic actions were needed as building blocks by which all
    verbs can be represented
  * Each of these actions has a set of actions or states
    which can be inferred when they are present.

# 1.  Introduction

* For the past four years there has been an effort undertaken at Stanford to
  enable computers to understand natural language sufficieutly well so as to be
  able to perform in a dialogue situation.

  * analyze natural language into meaning structures that are unambiguous
    representations of the meaning of an input utterance.  have 
  * required of those representations that they be unique.
    * ie the meaning representations of any two utterances which can be said to
      convey the same meaning should be identic

  * conceptual structures, and the predictions and inferences that are possible
    given a formally defined conceptual structure.

* [initially] intended to be a language-free unambiguous representation of the

  * hE a great deal more similarity to the surface properties of English than
    we now believ should exist in such structures.

  * Subsequently, we began looking for
    common concepts that could be used for representing the meaning of English
    * facilitate paraphrase by the conceptual structures without losing info

* The concept 'trans' was introduced (Schänk, Tesler and Weber (I97O)) as a
  generic concept into which words srch as 'give' and 'take' could be mapped,
  such that by specifying attributes of the cases of 'trans' no information
  would be lost.
  * eg where the actor and recipient are the same is realized as 'take',
    whereas, where tht actor and donor part of Che rccipeint case arc the same,
    the verb is 'give'
* Such generic concepts simplified the conceptual networks, maKing them mere
  useful.

* the linguists' problem of the representation of such concepts as 'buy' and
  'sell' became solvable.

* Katz (I967): while these concepts seem close enought 
  it would be arbitrary to choose one as the basic form of the other, so 
  the correct thing to do must be to write formal rules translating structures
  using 'buy' into structures using 'sell' when this is deemed necessary.
  * Instead of doing this, we made the suggestion (Schänk (in press)) that
    using 'trans' one could map 'buy' into 'tr&ns money causes trans object'
    and 'sell' into 'trans object -causes trans ^oney'.

  * eliminates the 'which is more primitive than the other' problem and instead

* whether there might be more of these generic concepts around.

* we: primitive concepts that can be used as the basis of conceptual structures

# 2 Conceptual Dependency 7

## 2.1 Conceptualizations


* We are using what is basically an actor-action-object framework that 
  * includes cases of the actions.

  * actors that are allowed in this schema are animate.

  * ie an action is something that is done by an actor to an object.

  * natural forces which shall not be discussed here.)

* Actors, actions and objects in our CSs: real world actors, actions and objects

* eg 'John hurt Mary'.
* ? treat this sentence as (actor: John; action: hurt; object: Mary) violates
  * hurt is not a real world action, is a resultant state of Mary.

  * It does not refer to any action that actually occurred, 
    but rather to the result of the action that actually occurred.

  * the action that can be said to have caused this 'hurt' is unknown.

* conceptual relationships must be accounted for:
 * John did something: Mary was hurt; the action caused the resultant state.

* actor-action complexes are 
  * a mutual dependency between actor and action
* object-state complexes are
  * a predication of an attribute of an object, or by <^d^ denoting a
  * a change of state■ in the object:

* Causal relationships are temporal dependencies

* Causal arrows may only exist btcween two-way dependencies
* ie only events or states can cause events or states.

Thus our representation for this sentence is:
.

John <=> do
      |
Marv <-> hurt

* The dummy 'do' represents an unknown action.
('Hurt1 is ambiguous between mental hurt (hurt^) and physical hurt (hurt-™-) .)

* Conceptual dependency reprpstation depict the actual conceptual relationships
  that are Implicit within a natural lau- puage utterance.

* Actions, in conceptual depencency, are things that arc done to objects.
  * the conceptual cases of an action.
    * sometimes have directions (either through space or between humans), and
    * always have means (instruments)

* conceptual cases are part of a given action and 
  => always present whenever that action is present.
  * Unlike syntactic cases, (as posited by Fillmore (I968) for example)

  * eg if an action takes an object, whether or not that object was mentioned

  * If the instance of that object was not stated and is not inferable 
  => an empty object slot is retained.


## 2.2 Paraphrase Recognition 14

## 2.3 Simmary 16

# 3 The Primitive Actions 18

# 4 Inferences 40

# 5 Mini-dictionary 58
