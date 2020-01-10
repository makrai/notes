Damien Sileo, Tim Van De Cruys, Camille Pradel, Philippe Muller
Composition of Sentence Embeddings: 
  Lessons from Statistical Relational Learning
`*`SEMEVAL 2019

#Abstract

* modeling of semantic relations 
  * e.g. sentence similarity, entailment, and discourse relations 
* model: embed sentences into fixed size vectors, and use composition functions
* composition ... has been a main focus [in] Statistical Relational Learning
  whose goal is to predict relations between entities
* previous work on relation prediction between texts implicitly uses
  compositions from baseline SRL models
* We build on recent SRL models to address textual relational problems, showing
* significantly improve the state of the art 
  in both transferable sentence representation learning and relation prediction

#1 Intro

* all tasks involve predicting whether a relation R holds between two sentences 
  * noticed in the literature before (Baudiš+ 2016) and it has been
    leveraged for the evaluation of sentence embeddings (Conneau+ 2017)
* Our contributions are as follows:

#2 composition functions used in textual relational learning 
and that they lack expressiveness

#3 analogies with existing SRL models

#4 new compositions inspired from SRL 3

                                     `***`

experiments to test composition functions and show that some of them can
improve the learning of representations and their downstream uses 

#5 On the evaluation of relational models 

* SentEval (Conneau+ 2017) 
  a general evaluation for transferable sentence representations, open source
  * One only needs to specify a sentence encoder function, 
    * framework performs classification tasks or relation prediction tasks
      using cross-validated logistic regression on [word or sent] embeddings 
  * Tasks include sentiment analysis, entailment, textual similarity, textual
    relatedness, and paraphrase detection
* we believe composition function favors ... contextual/lexical similarity
  rather than high-level reasoning
* Training/evaluation datasets are ... flawed with respect to relational
  * InferSent, despite being  
    * state of the art on SentEval evaluation tasks, has 
    * poor performance [on] asymmetrical tasks and non-additive composition of
      words (Dasgupta+ 2018; Poliak+ 2018; Gururangan+ 2018; Glockner+ 2018)
* we will also extend the SentEval evaluation framework with a more expressive
  composition function when dealing with relational transfer tasks, which
  improves results even when the sentence encoder was not trained with it.

#6 Experiments

##6.1 Training tasks

##6.2 Evaluation tasks

#7 Related work

* interactions between SRL and NLP. We believe that our framework merges 
  * two specific lines of work: relation prediction and 
    modeling textual relational tasks.  Some previous 
* NLP work ... on composition functions for relation prediction 
  * word analogies in the latent space (Mikolov+ 2013).  
  * Levy & Goldberg (2014) explored different scoring functions ... for analgs.  
  * Hypernymy relations were also studied, by Chang+ (2018) and Fu+ (2014).
  * Levy+ (2015) proposed tailored scoring functions.  Even the skipgram model
  * word level ... would fit in our framework, and could be tested in future
    studies. Numerous approaches  were proposed to 
* inference relations between sentences
  (Chen+ 2017b; Seok+ 2016; Gong+ 2018; Joshi+ 2019)
  * but don’t explicitely use sentence embeddings. Instead, they encode
    sentences jointly, possibly with the help of previously cited word
    compositions, therefore it would also be interesting to try applying our
    techniques within their framework.

#8 Conclusion 8

* these more expressive compositions
  * Larger scale data might leverage [them], as well as more compositional,
    asymmetric, and arguably more realistic datasets (Dasgupta+ 2018;
    Gururangan+ 2018). Finally, our compositions 
  * can also be helpful to improve interpretability of embeddings, since they
    can help measure relation prediction asymmetry. 
    Analogies through translations helped interpreting word embeddings, and
    perhaps anlyzing our learned `t` translation could help interpreting
    sentence embeddings.
