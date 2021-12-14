An example for natural language understanding and the ai problems it raises
John McCarthy
1976

# 1 The story

* real event
  * a question as what does the “J” in “John J. Hug” stand for has an answer
  * In a made-up story, such questions do not necessarily have an answer,
    and an intelligent person or program would know that

# 2 Artificial natural language

components:
1. formalism capable of expressing the assertions of the sentences
  * free from dependence on the grammar of the English language
  * A good test would be to produce a program for translating into any
    of several natural languages
  * artificial natural language—ANL for short.  The
  * grammar of ANL should be trivial and mathematical in character.  There
  * identifiers
    * given in English, German, Japanese and so on
    * a glossary that gives the precise meaning of the identifiers
    * some resemblance to the idea of “deep structure
      * nidea is well enough defined
2. A data structure for expressing the facts
  * In such a data structure, it would be definite which robber pushed Mr. Hug
    first, and what the robbers said even though it is not stated in the story
    Clearly some compromise is necessary here
    , since the data structure need
  * no disjunctions (Moore 1976)
  * closed-world
  * Alternatively, the basis of this data structure might be various networks
    * described by sentences in the predicate calculus
3. I see each of the following problems as a difficult AI problem:
  1. A “parser” that takes English into ANL
  1. An “understander” that constructs the “facts” from a text in the ANL
  1. Expression of the “general information” about the world
  1. A “problem solver” that could answer the above questions
    on the basis of the “facts”
    * questions and answers expressed in the “fact” language
      to avoid grammar problems

# 3 The use of logical formulas

* individual constants 5representing people, groups of people, the main event
  and its sub-events, places, organizations, etc
* representing groups of agents by one individual constant each or
  by using a single symbol G1 to represent the group of robbers
  * A good system will probably use both
  * If the number of robbers were not specified
  * Suppose it had further been stated that as the robbers left one of them
    threatened to return and kill Mr. Hug later but that it was not stated
    whether this robber was the same one who operated the elevator R4
  * we may want to give the group some properties
    * the group robbed the store, not each member robbed the store
  * We don’t want to assert how many there were

# 4 The need for nonmonotonic reasoning

* After reading the story, one is prepared to answer negatively the question of
  whether there was someone else besides Mr. Hug and the robbers present.
* However, sentences describing such another person could be added to the story
  without contradiction.
* Our basis for the negative answer is Occam’s razor
* the notion of the minimal completion of a story
  * a process formalizing Occam’s razor
  * works from a set of sentences and is not logical deduction although it
  * might be accomplished by deduction in a meta-language that contained
    sentences about sets of sentences
  * not deduction, because it generates sentences that contradict
* It has been suggested that probabilistic reasoning should be used
* it might make more sense to assign a probability to the correctness of the
  minimal completion
* Another problem is the isolation from the rest of the world.
  * The members of the Police Emergency Squad all have mothers

# 5 CONCLUSION

* each predicate calculus sentence is generated approximately from a
  sentence of the story
* The completion, however, will depend on the whole of the story.
* what can be determined from stopping in the middle of a sentence
