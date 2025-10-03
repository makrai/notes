Bayesian Structure Learning with Generative Flow Networks
Tristan Deleu, António Góis, Chris Emezue, Mansi Rankawat,
  Simon Lacoste-Julien, Stefan Bauer, Yoshua Bengio
arXiv:2202.13903 [cs.LG]

# Abstract

* Bayesian structure learning: inferring a distribution over the directed
  acyclic graph (DAG) structure of Bayesian networks, from data
  * Defining such a distribution is very challenging
  <= combinatorially large sample space
  * approximations based on MCMC are often required
* Generative Flow Networks (GFlowNets)
  * a novel class of probabilistic models
  * a general framework for generative modeling of discrete and composite
    objects, such as graphs
* we propose to use a GFlowNet as an alternative to MCMC for approximating
  the posterior distribution over the structure of Bayesian networks,
  given a dataset of observations
  * Generating a sample DAG from this approximate distribution is viewed as a
    sequential decision problem, where the graph is constructed one edge at a
    time, based on learned transition probabilities
  * our approach is called DAG-GFlowNet
* evaluation on both simulated and real data
  * accurate approximation of the posterior over DAGs
  * compares favorably against
    other methods based on MCMC or variational inference
