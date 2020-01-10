(Introduction to) Probabilistic Topic Models
David M. Blei
2012 Communications of the ACM, 55(4):77–84

#Abstract

* We first describe latent Dirichlet allocation (LDA) [8], which is the
  simplest kind of topic model. We discuss its connections to _probabilistic
  modeling_, and describe two kinds of algorithms for topic discovery. We then
  survey the growing body of research that extends and applies topic models in
  interesting ways
* extensions have been developed by 
  * relaxing some of the statistical assumptions of LDA, 
  * incorporating meta-data into the analysis of the documents, and using
  * diversity of data types such as social networks, images and genetics

#1 Introduction

* Imagine searching and exploring documents based on the themes that run
  through them. We might “zoom in” and “zoom out” to find specific or broader
  themes; we might look at how those themes changed through time

#2 Latent Dirichlet allocation

* e.g. This article, entitled “Seeking Life’s Bare (Genetic) Necessities,” is
  about using data analysis to determine the number of genes that an organism
  needs to survive (in an evolutionary sense).  By hand, we have highlighted
  different words that are used in the article.  Words about data analysis,
  such as “computer” and “prediction,” are highlighted in blue; words about
  evolutionary biology,
* formally 
  * define a topic to be a distribution over a fixed vocabulary
  * for each document in the collection, we generate the words in a two-stage
    process
    1. Randomly choose a distribution over topics
    2. For each word in the document 
      *  Randomly choose a topic from the distribution over topics in step #1.  
      *  Randomly choose a word from the corresponding distribution over the
         vocabulary

##2.1 LDA and probabilistic models

* dependencies define LDA. They are encoded in 
  * the statistical assumptions behind the generative process, in 
  * the particular mathematical form of the joint distribution, and
  * the probabilistic graphical model for LDA
  * These three representations are equivalent ways of describing the
    probabilistic assumptions behind LDA
* history of these ideas. LDA was developed to fix an issue with 
  _probabilistic latent semantic analysis_ (pLSI, Hofmann 1999)
  * [pLSI] was a probabilistic version of the seminal work on LSA [14]

##2.2 Posterior computation for LDA p7

* Topic modeling algorithms generally fall into two categories
  * sampling-based algorithms 
    * The most commonly used sampling algorithm for topic modeling is Gibbs
      sampling, where we construct a Markov chain—a sequence of random
      variables, each dependent on the previous—whose limiting distribution is
      the posterior. The Markov chain is defined on the hidden topic variables
      for a particular corpus,
    * See [33] for a good description of Gibbs sampling for LDA, and see
      http://CRAN.R-project.org/package=lda for a fast open-source
      implementation
  * variational algorithms
    * parameterized family of distributions over the hidden structure and
      then find the member of that family that is closest to the posterior. 
      * Closeness is measured with Kullback-Leibler divergence ... between two
        probability distributions
    * Thus, the inference problem is transformed to an optimization problem
  * For ... the merits and drawbacks of both, see (Asuncion et al 2009)

#3 Research in topic modeling p9

##3.1 Relaxing the assumptions of LDA

##3.2 Incorporating meta-data

##3.3 Other kinds of data

#4 Future directions

##Evaluation and model checking

##Visualization and user interfaces

##Topic models for data discovery

#5 Summary p13
