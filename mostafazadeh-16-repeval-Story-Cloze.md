Story Cloze Evaluator: Vector Space Representation Evaluation by
  Predicting What Happens Next
Nasrin Mostafazadeh, Lucy Vanderwende, Wen-tau Yih, Pushmeet Kohli, James Allen
2016 repeval

cs.rochester.edu/nlp/rocstories/RepEvalPredictingTheNext/

# 1 Indtoduction

* given a four-sentence story (called the context) and two alternative endings
  to the story, the system is tasked with choosing the right ending
* We propose the following Story Cloze Evaluator modules:
  1. Given an embedding of a four-sentence story (the context) and
    two alternative ending sentences, this module rewards the system if the
    embedding of the context is closer to the right ending than the wrong
  2. Given the embedding for each of the four sentences and the two alter, this
     module uses the trajectory of the four vectors to predict the embedding of
     the fifth sentence. Then the system is rewarded if the predicted vector is
     closer to the right ending than the wrong ending

# 2 Story Cloze Test: Predicting What Happens Next

* story and script 2 understanding (Schank and Abelson, 1977)
* predicting an ending to a story is less subjective and more deterministic
  than only predicting the next sentence
* ROCStories corpus. This corpus is a collection of
  * ~50,000 crowdsourced short commonsense everyday stories each of which
    * is realistic and non-fictional,
    * has a clear beginning and ending where something happens in between,
    * does not include anything irrelevant to the core story full of
      stereotypical causal and temporal relations between events
* worker was asked to write a ‘right ending’ and a ‘wrong ending’
  * ‘wrong ending’ which satisfies two conditions:
    * sharing at least one of the characters of the story, and
    * entirely realistic and sensible when read in isolation

# 3 Story Cloze Evaluator

There are various ... alternatives

## Joint Paragraph and Sentence Level Evaluator

* alternative (a sentence) [and] context (a paragraph)
* multivariable curve fitting among the distance vectors of adjacent sentences,
  e.g., using linear least squares error

## Sentence-level Evaluator

## Baselines

6. Skip-thoughts Model: A Sentence2Vec embedding (Kiros+ 2015)
  R Kiros, Y Zhu, R Salakhutdinov, R S Zemel, A Torralba, R Urtasun, S Fidler
    NIPS.  2015
    Skip-thought vectors
9. Deep Structured Semantic Model (DSSM): This model (Huang+ 2013)

# 4 Major Characteristics

* other language understanding and commonsense reasoning tasks, e.g., reading
  comprehension tests
  (Hermann+ 2015; Weston+ 2015; Richardson+ 2013)

# 5 Conclusion
