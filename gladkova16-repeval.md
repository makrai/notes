Intrinsic Evaluations of Word Embeddings: What Can We Do Better?
Anna Gladkova and Aleksandr Drozd
2016

kicsit esszészerűen van megírva a cikk

#2 Existing Intrinsic Evaluations

##2.1

* morphological relations and simpl[e] collocations
  * it is not clear whether a model should generally score higher for
    preferring either of them.  Specializing on one of these relations (Kiela
   + 2015)

##2.2 Comparative Intrinsic Evaluation

The comparative intrinsic evaluation for word embeddings was introduced by
Schnabel+ (2015). Several models are trained on the same corpus, and
polled for the nearest neighbors of words from a test set. For each word,
human raters choose the most “similar” answer, and the model that gets the
most votes is deemed the best.

##2.4 Alignment with Linguistic Features

Tsvetkov+ (2015) proposed the QVec system that evaluates how well the
dimensions of a word embedding can be aligned with dimensions of “linguistic”
vectors (constructed from a semantically annotated corpus)

#3 General Methodological Concerns

connectionist cognitive models (Lenci, 2008).

##3.2 Polysemy: the Elephant in the Room

#4

##4.2 What Can We Do Right Now?

* freq encoded in embed + being biased by it 
  (Schnabel+ 2015; Wilson and Schakel, 2015)
* specialization for a particular type of relation
  * explored in ...  test sets as BLESS (Baroni and Lenci, 2011) and 
    EVALution (Santus+ 2015). They include pairs of words with different kinds
    of relations, such as synonymy and meronymy
