THE FOURTEEN PRIMITIVE ACTIONS AND THEIR INFERENCES
Roger C. Schänk
March 1973 National Technica! Information Service, US Department of Commerce

# rt?STRACT:

* In order to represent the conceptual information underlying a nat lang sent,
  a conceptual structure has been established that /
  * uses the basic actor-action-object framework, il '..'as the intent that
  * only one representation for one meaning, regardless of the semantic form
    of the sentence being represented
    <= Actions were reduced to their basic parts
  * only fourteen basic actions were needed as building blocks
    by which all verbs can be represented
  * Each of these actions has a set of actions or states
    which can be inferred when they are present.

# 1.  Introduction

* For the past four years there has been an effort undertaken at Stanford to
  enable computers to understand natural language sufficieutly well for
  dialogue 
* analyze natural language into meaning structures that are
  unambiguous representations of the meaning of an input utterance
* requirement: representations be unique
  * ie the meaning representations of any two utterances which convey the same
    meaning should be identic
* conceptual structures, and the predictions and inferences that are possible
  given a formally defined conceptual structure.
* [initially] intended to be a language-free unambiguous representation
* hE a great deal more similarity to the surface properties of English
  than we now believ should exist in such structures.
* Subsequently, we began looking for
  common concepts that could be used for representing the meaning of English
  * facilitate paraphrase by the conceptual structures without losing info
* The concept 'trans' was introduced (Schänk, Tesler and Weber 197O) as
  * a generic concept into which words eg 'give' and 'take' could be mapped,
    such that by specifying attributes of the cases of 'trans' no info would be
    lost.
* eg where the actor and recipient are the same is realized as 'take', whereas,
  where tht actor and donor part of the recipeint case are the same -> 'give'
* Such generic concepts simplified the conceptual networks => more useful
* the representation of concepts eg 'buy' and 'sell' became solvable
* Katz (I967): while these concepts seem close enought
  it would be arbitrary to choose one as the basic form of the other, so 
  the correct thing to do must be to write formal rules translating structures
  using 'buy' into structures using 'sell' when this is deemed necessary.
* Instead of doing this, we made the suggestion (Schän, in press) that
  using 'trans' one could map 'buy' into 'trans money causes trans object' and
  'sell' into 'trans object causes trans money'.
* eliminates the 'which is more primitive than the other' problem
* whether there might be more of these generic concepts around.
* we: primitive concepts that can be used as the basis of conceptual structures

# 2 Conceptual Dependency 7

## 2.1 Conceptualizations

* We are using what is basically an actor-action-object framework that 
  * includes cases of the actions.
* actors that are allowed in this schema are animate.
* ie an action is something that is done by an actor to an object.
* natural forces shall not be discussed here.
* Actors, actions and objects in our CSs: real world actors, actions and objects
* eg 'John hurt Mary'.
* ? treat this sentence as (actor: John; action: hurt; object: Mary)
  * no: hurt is not a real world action, but a resultant state of Mary.
* It does not refer to any action that actually occurred, 
    but rather to the result of the action that occurred.
* the action that can be said to have caused this 'hurt' is unknown.
* conceptual relationships must be accounted for:
 * John did something: Mary was hurt; the action caused the resultant state.
* actor-action complexes are 
  * a mutual dependency between actor and action
* object-state complexes are
  * a predication of an attribute of an object, or
  * a change of state in the object:
* Causal relationships are temporal dependencies
* Causal arrows may only exist btcween two-way dependencies
* ie only events or states can cause events or states.
* Thus our representation for this sentence is:

                                 John <=> do
                                       |
                                 Marv <-> hurt

* The dummy 'do' represents an unknown action.
  * ('Hurt1 is ambiguous between mental hurt and physical hurt)
* Conceptual dependency repreentstation depict the actual conceptual relships
  that are Implicit within a natural lauguage utterance.
* Actions, in conceptual depencency, are things that are done to objects.
  * the conceptual cases of an action.
    * sometimes have directions (either through space or between humans), and
    * always have means (instruments)
* conceptual cases are part of a given action and 
  => always present whenever that action is present.
  * Unlike syntactic cases, (as posited by eg Fillmore (1968))
* eg if an action takes an object, whether or not that object was mentioned
* If the instance of that object was not stated and is not inferable 
  => an empty object slot is retained.
* The conceptual cases are: OBJECTIVE; RECIPIENT; DIRECTIVE; and INSTRUMENTAL.
* it should be impossible to ever actually finish conceptually diagramming a
  given sentence.
  * eg every ACT has an instrument which has an ACT which has an instrument etc
  => we only dia- gram the main conceptualization and such instrumental
  conceptualizations as might be necessary to illustrate whatever point we are
  making.

> It is, however, quite possible that we might need many of these instru- u
> mental conceptualizations in a program that was intended to simulate certain
> body motions (such as Win^grad's (1971) block moving program).  Thus, the ACi
> in a conceptualization is really ehe name of a set of tj actions that it
> subsumes (and are considered to be a part of it).  These instrumental
> conceptualizations are not caurally related since they are not actually
> separable from each other.  In actuality, they express one event anü thus are
> considered to be part of one conceptualization.  The rule is ner, that one
> conceptualization (which may have many conceptuali- zations P- a part of it)
> is considered to be representative of one event.  

> In ordinary English usage, the syntactic instrument of a given sen- tence
> corresponds conceptually to either one of two potential places in a
> conceptualizatijn.  Either It represents the object of an instrumental i |-
> conceptualization (usually the first instrumental conceptualization) or it is
> the object of a conceptualization that causes the conceptualization most
> directly related to the verb of which it is an instrument syntacti- cally.
> Conceptually an instrument can never be only a physical object.  Thus as an
> illustration of the first instance we have: John hit Mary with a stick.

* We represent the conceptual action underlying 'hit' by PROPEL which means to
  apply a force to an object plus the resultant state PHYSCONT.  ha^c

> The 'do' in the instrumental conceptualization indicates that the action by
> which the PROPEL-'ing was done is unknown.  This corresponds to the fact that
> this sentence is actually ambiguous.  The two most common interpretations
> being that 'he swung the stick1 or that 'he threw the stick'.  Representing
> such a sentence in this manner allows for the discovery of this ambiguity,
> (in an actual computer analysis schema the blank 'do's' can be realized as
> predictions about missing infor- mation which must be discovered either by
> inquiry or memory search.) 

> Predictions about what ACT's fit into this instrumental slot are made from
> the ACT in the main conceptualization.  PROPEL requires either 'move' or
> 'move' + 'ungrasp' as actions for its first instrument.  'Swing' and 'throw'
> are mapped conceptually into 'move' and 'move' + 'ungrasp' respectively (with
> additional information as to manner).  

> The other type of conceptual realization for a syntactic instru- ment can be
> illustrated by: Jjhn grew the plants with fertilizer.  

> Traditionally, linguists would consider 'fertilizer' to be an in- strument of
> the verb 'grow'.  Conceptually however, 'grow' is simply a state change and
> is not an action that can be performed by someone on something else.  Rather,
> a person can do something that effects this State change.  Thus we have as
> the basis of the underlying conceptuali- zation: The 'do' in this
> concepLualization represents the extremely important fact that something was
> done by John.  Thus the plants were not 'growed', they grew (state change).
> What John did was not 'causing'; rather what he did caused something else to
> happen.  

> Since the 'do' represents an unknown action, it might be of interest to find
> out what that action might have been.  But since that information was
> unstated, finding it is the job of any processor that uses the re- sults of a
> conceptual analysis.  

> The syntactic instrument of 'grow' is treated conceptually then as the object
> of the causing action.  Thus we have: We can, in fact, make an educated guess
> as to what John could have done with fertilizer that would have caused the
> growing.  Probably he moved it to the ground where the seeds were.  Since
> this is an inference we shall only mention it here without going into how to
> figure out such a thing.

## 2.2 Paraphrase Recognition 14

## 2.3 Simmary 16

# 3 The Primitive Actions 18

## 3.2 ACT Types

* These are four categories of ACTs that the 14 ACTs are broken down into

## 3.3 Physical ACTs (5)

* PROPEL: means 'apply a force to'; its object must be under a certain size and
  weight, but for our purposes we will say that any object is acceptable
* MOVE: means 'move a bodypart'; the only objects that are MOVE-d (in our
  sense of MOVE) are bodyparts.  
* INGEST means 'take something inside you1; INCEST'S object must be smaller
  than the mouth of the actor or must be divided into pieces smaller than the
  mouth opening; object should be food.
* EXPEL: means 'take something from inside you and force it out'; its object
  must have previously been INGEST-ed.
* GRASP: means 'to grasp'; object must be within a size limit.

## 3.4 Global ACTs (2)

* As can be seen by the nature of the physical ACTs, very often an ACT is
  somehow more than the sum of its parts.
  * ie the result of an ACT is focused on more directly than the ACT itself.
  * Since the representations presents, here are intended to represent human
    thought it is necessary to do the same focussing that humans do.
  * Global ACTs which express the change of state consequences and intentions
    of a variable physical ACT.

### PTRANS 16

* The most important Global ACT is PTRANS, 
  change in physical location ol an object.
  * In order to change the physical location of an object it is necessary to
    perform one of the physical ACTs upon that object first.
* the use of PTRANS
  * for change of location verbs such as move ind pick up 
  * to represent the ACT underlying the verb 'go'.
* whenever PTRANS is present, it can be inferred that the object of PTRANS is
  now located at the location present as i-ho directive case for PTRANS.

### ATRANS. 19

* The most abstract of the global ACTs is ATRANS
* The objects that ATRANS operates upon are abstract relationships and the
  physical instruments of ATRANS are rarely specified
  * The 'trsns' that was referred to In the beginning of this paper is what we
    call ATRANS
  * ATRANS takes as object the abstract relationship that holds between two
    real world objects eg ownership, possession, control

## 3.5 Instrumental ACTs (4) 26

* they are used almost totally as the instruments of some other ACT.
* SPEAK is the ACT which actually produces sounds and its objects therefore are
  always 'sounds'.
* LOOK-AT takes physical objects as objects and is nearly always the instrument
  of seeing (the verbs 'see' will be treated in the next section)
* LISTEN-TO takes only 'sounds' as objects and is nearly always the instrument
  of hearing (the verb 'hear' will be treated in the next section).
* SMELL is the act of directing ones nose towards and sniffing (sort of).
* It takes only smells as objects (not the physical objects that produce the
  smell).
* SMELL is nearly always-the instrument of the verb 'smell' (which will be
  treated in the next section).

## 3.6 Mental ACTs (3) 27

### MTRANS 30

# 4 Inferences 40

# 5 Mini-dictionary 58
