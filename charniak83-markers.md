1983 Cognitive Science
Eugene Charniak
Passing Markers: A Theory of Contextual Influence in Language Comprehension

#Abstract

Most Artificial Intelligence theories of language either
  * assume syntactic component
  * reject attempts at distinguishing modules
* In this paper 
  * keeping modularity
  * account for several puzzles for typical "syntax first" theories
  * marker passing (or spreading activation)

#Intro

* puzzles which arise given the above model. They will deal with: l l l
  * determination of “context” in story comprehension, e.g., 
    _Jack picked up a menu_ has a “restaurant” context
  * role of context in WSD
  * relation between syntax and semantics.  
    * One routine, coroutines, separate but parallel?
* refurbishing of an old [theory]: the spreading activation [SA] model
  * SA history
    * long and distinguished run in psychology (Anderson, 1976; Collins & Lof-
      tus, 1975; Collins & Quillian, 1969)
    * to a lesser degree in Artificial Intelligence (AI) (Quillian, 1966),
    * since the early 70’s SA has mostly disappeared from the AI literature.
  * or marker passing, as it is commonly referred to in AI circles
  * relate SA to common AI problems
    * context determination, WSD, and the semantic guidance of syntax
  * psychological evidence ... by Swinney (1979) ... so obviously contradict
    most standard AI theories of WSD

#2. THREE PUZZLES

##2.1. Syntax and Semantics

* comprehension of ungrammatical sentences
* parallel arrangement of syntax and semantics (called a “blackboard” model)
  as in HEARSAY (Erman, et al., 1980)

##2.2. Contextual Determination of Word Senses

* and reaction time in word recognition 

##2.3. Finding Explanatory Actions 7

* _Jack picked up a menu._ -> Jack intended to read the menu
  * postulated as a “explanation”
* the program 
  * has bidirectional pointers 
    * from an action to higher level actions in which it may play a role
    * from objects to actions in which they typically play a role, and 
    * from objects to their superclasses (... the ubiquitous “isa” pointer)
  * depends crucially on a reasonably complete functional structure

#3 THE THEORY 8

##3.1 Finding Explanatory Actions

* The problem is that we appear to have two kinds of phenomena. One requires
  the use of functional relations in finding explanatory actions, the other
  does not. Solution: postulate two separate capabilities.

###Searching for connections

###Marker passing

##Back to our original problem

##3.2 WSD 11

##3.3. The Relation Between Syntax and Semantics 12

#4. CONSTRAINTS ON MARKER PASSING

#5 CONCLUSION
