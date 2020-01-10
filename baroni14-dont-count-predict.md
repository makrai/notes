Marco Baroni and Georgiana Dinu and Germán Kruszewski
Don’t count, predict! A systematic comparison of 
    context-counting vs.  context-predicting semantic vectors
2014

Abstract

Context-predicting models (more commonly known as embeddings or neural
language models) are the new kids on the distributional semantics block.
Despite the buzz surrounding these models, the literature is still lacking a
systematic comparison of the predictive models with classic,
count-vector-based distributional semantic approaches. In this paper, we
perform such an extensive evaluation, on a wide range of lexical semantics
tasks and across many parameter settings. The results, to our own surprise,
show that the buzz is fully justified, as the context-predicting models obtain
a thorough and resounding victory against their count-based counterparts.

1 Intro

measure the similarity in meaning of the corresponding words 
    (Clark, 2013; Erk, 2012; Turney and Pantel, 2010).
transformations are applied to the raw vectors, for example by 
    reweighting the counts for context informativeness and 
    smoothing them with dimensionality reduction techniques.
the fully probabilistic LDA models 
    have problems scaling up to large data sets.
we overcome the comparison scarcity problem

3 Evaluation materials

Semantic relatedness
Synonym detectiono
Concept categorization
Selectional preferences
Analogy
    two data sets that contain verb-noun pairs that were rated by subjects for
    the typicality of the noun as a subject or object of the verb (e.g., peo-
    ple received a high average score as subject of to eat, and a low score as
    object of the same verb).

5 Conclustion

It remains to be seen whether 
    the two types of models are complementary in the errors they make,
beyond the standard lexical semantics challenges
    representing phrases (Mikolov et al., 2013c; Socher et al., 2012) or 
    fusing language and vision in a common semantic space 
        (Frome et al., 2013; Socher et al., 2013).
explore, in the near future
    the dimensions of these models 
        ?can be interpreted as general “latent” semantic domains
    topical vs. functional information (Turney, 2012).
    whether the vectors of hypernyms “distributionally include” 
        the vectors of hyponyms in some mathematical precise sense.
