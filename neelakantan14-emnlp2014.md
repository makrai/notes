Arvind Neelakantan, Jeevan Shankar, Alexandre Passos, Andrew McCallum
2014 EMNLP
Efficient Non-parametric Estimation of Multiple Embeddings per Word ..

https://people.cs.umass.edu/~arvind/emnlp2014wordvectors
* The global vectors, sense vectors and cluster centers of our model and 
* code for learning them are available

#Abstract

* an extension to the Skip-gram model that 
  * efficiently learns multiple embeddings per word type
* jointly performing word sense discrimination and embedding learning,
* non-parametrically estimating the number of senses per word type
* efficiency and scalability

#1 Introduction

* Skipgram ... applied to machine translation 
  * (Zou et al, 2013; Mikolov et al, 2013c)
    * Zouék valójában a Collobert-Huang vonalat képviselik
* polysemy and hononymy in vector space
  * In moderately high-dimensional spaces 
    * a vector can be relatively “close” to multiple regions at a time, but 
  * triangle inequality => words that are not synonyms but are synonymous with
    different senses of the same word will be pulled together
* embeddings for multiple senses per word type 
  * Reisinger and Mooney (2010a) and Huang et al (2012)
    * Huang improves upon Reisinger 
      * by an earlier pass of non-discriminated learning 
    * Huang et al (2012) method took one week
    * corpus containing close to billion tokens
* This paper
  * vectors are learned jointly with the assignment of token contexts to senses
  * varying number of senses per word
  * During online training with a particular token, we use the average of its
    context words’ vectors to select the token’s sense that is closest 
  * non-parametric version: 
    * facility location (Meyerson, 2001): 
      * Adam Meyerson. 2001 Online Facility Location
    * a new cluster is created with probability proportional to the distance
      from the context to the nearest sense
      * később véletlen nélkül írja: ha a távolság meghalad egy küszöböt
  * training on nearly a billion tokens in less than 6 hours

#2 Related Work

* Dhillon and Ungar (2011) estimate word vector representations using 
  * Canonical Correlation Analysis (CCA)
* multiple vector representations for the same word type
  * While methods such as those described in Dhillon and Ungar (2011) and Reddy
    et al (2011) use token-specific representations of words as part of the
    learning algorithm, the final outputs are still one-to-one mappings

#3 Background: Skip-gram model

* a Skip-gramban valójában kétféle vektor van

#4 Multi-Sense Skip-gram (MSSG) model

* Az első bekezdés midkét modelljükre igaz, utána nem. 
* cluster valójában cluster centroid?
* In the MSSG model, each word w ∈ W is associated with
  * a global vector `v_ g(w)` and 
  * sense vector v_s(w, k) (k = 1, 2,... , K) and 
  * a context cluster center μ(w, k) (k = 1, 2, ... , K)

#5 Non-Parametric MSSG model (NP-MSSG)

* online non-parametric clustering procedure described in Meyerson (2001)
* mikor készül új jelentés? A távolságban determinisztikus vagy véletlen?
  * We create a new cluster (sense) for a word type with probability propor-
    tional to the distance of its context to the nearest cluster (sense).
  * new context cluster and a sense vector are created [when] the similarity
    between ... the context with every existing cluster center of the word is
    less than λ, where λ is a hyperparameter of the model.

```
if (createClusterlambda < minDist) {
  prob(ncluster(word)) = createClusterlambda
  sense = ncluster(word) 
```

#6 Experiments

* Wikipedia 990 million tokens 
  * m20 w5 K3 \lambda=-.5 n1, initial learning rate 0.025
* multithread?

##6.1 Nearest Neighbors

* The nearest neighbors [by] cosine similarity between the 
  * embedding for each sense of the word and 
  * the context embeddings of all other words in the vocabulary
* In NP-MSSG we set λ to -0.5

##6.2 Word Similarity

* datasets: 
  * WordSim-353 (Finkelstein et al, 2001) dataset and the 
  * Stanford’s Contextual Word Similarities (SCWS) (Huang et al 2012)
* our metrics
  * avgSim
  * ! avgSimC weighs the similarity between each pair of senses by how well
    does each sense fit the context
  * globalSim
  * localSim selects a single sense
* The probability of being in a cluster is calculated as the inverse of the
  cosine distance to the cluster center
* word analogy task
  * plain sgram is better

#7 Conclusion
