Marco Baroni and Georgiana Dinu and Germán Kruszewski
Don’t count, predict! A systematic comparison of
    context-counting vs.  context-predicting semantic vectors
2014

# Abstract

* Context-predicting models
  * (more commonly known as embeddings or neural language models) are
  * the new kids on the distributional semantics block
* literature is still lacking a systematic comparison with classic,
  count-vector-based distributional semantic approaches
* In this paper, we perform such an extensive evaluation,
  on a wide range of lexical semantics tasks and across many parameter settings
* the buzz is fully justified, as the context-predicting models obtain a
  thorough and resounding victory against their count-based counterparts

# 1 Intro

* measure the similarity in meaning of the corresponding words
  * (Clark, 2013; Erk, 2012; Turney and Pantel, 2010)
* transformations are applied to the raw vectors, for example by
  * reweighting the counts for context informativeness and
  * smoothing them with dimensionality reduction techniques
* the fully probabilistic LDA models
  * have problems scaling up to large data sets
* we overcome the comparison scarcity problem

# 3 Evaluation materials

* Semantic relatedness
* Synonym detection
* Concept categorization
* Selectional preferences
* Analogy
  * two data sets that contain verb-noun pairs that were 
    rated by subjects for the typicality of the noun as a subject or object of
    (e.g., _people_ received a high average score as subject of to _eat_, and a
    low score as object of the same verb)

# 5 Conclustion

* It remains to be seen whether
  * the two types of models are complementary in the errors they make,
* beyond the standard lexical semantics challenges
  * representing phrases (Mikolov+ 2013c; Socher+ 2012) or
  * fusing language and vision in a common semantic space
    (Frome+ 2013; Socher+ 2013)
* explore, in the near future
  * the dimensions of these models
    * ?can be interpreted as general “latent” semantic domains
  * topical vs. functional information (Turney, 2012)
  * whether the vectors of hypernyms “distributionally include” the vectors of
    hyponyms in some mathematical precise sense
