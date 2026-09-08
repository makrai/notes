A Note on Representational Understanding
Antal Jakovác 1 and András Telcs 1,2,3, *
Received 2207 Entropy 2022, 24, 1313. https://doi.org/10.3390/ e24091313

# Abstract: In this paper, 

* understanding/representation: finding the appropriate coordination of data
* we explore a new approach in which 
  understanding is interpreted as a set representation. We prove that
  * equivalent to finding the minimum of the representational entropy. 
  * For the control of the search for the correct representation, we propose 
    a loss function as 
    a combination of the representational entropy, type one and type two errors.
* Computational complexity estimates are presented for the process of
  understanding and using the representation found.

# 1. Introduction

* Intelligence in general is the ability to 
  respond quickly and adequately to challenges of the external world. 
  * Animals need to be able to recognise enemies and predators quickly.
    * a one-sided classification, one class versus all the others. In [1] the
    * Jakovác+ (arXiv:2010.13482) argue that 
      responding extremely quickly requires a 
      different solution than classical classification or learning.
      * they propose a new paradigm, fundamentally different from classif, to
        cover the cognitive process of understanding. The present paper 
  * we show the theoretical feasibility of the comprehension process and
    propose practical development of the process of understanding.
* Jakovác+ argue, following the strategy of representation learning [2,3], that
  understanding a topic is equivalent to 
  finding the right representation of the data. According to this approach,
  * not involve data compression, but merely the rearrangement of known
    facts/characteristics that fit best to the observed phenomena.
* understanding vs learning
  * There is a subtle philosophical difference between understanding and
  * may seem technically similar and are part of our cognitive work.
* Classic AI/ML tasks such as classification, clustering, encoding, etc. go 
  hand in hand with understanding, "model building". 
  * Before we are able build a proper model, we try to classify objects based on
    their characteristics, features, or try to cluster them. 
  * If we find a strikingly good arrangement, it can lead to a model idea. 
  * After some trials we find a model that fits the data well (after adjusting a
    few parameters) and meets our expectations of the model.
* model building always involves some preliminary assumptions (which can be)
  * Once you have a suitable model in hand, the task of classification or
    clustering is easy. As an example, let us consider a classification problem.
    * eg to classify a new item, we have to compare its features with those of
    * If we have a model, a few relations between some features should be
      checked to identify the right class. This is the bird tweet phenomenon.
    * eg we have sample points from several polynomials of order one, two and
    * If we are given a new set of sample points from an unknown polynomial,
* supervised or unsupervised learning algorithms have relatively low complexity,
  * finding a model that well characterizes the classes, the relationship
    between the features, is a very difficult task with much higher complexity.
  * The difference is typically exponential, or even hyper-exponential,
    depending on the task.
* learning and model building processes. We talk about 
  * training: we have a feature set of data and 
    we want to fine-tune a combination of these features (pick out a few key
    ones) to optimise some behaviour (usually classification or clustering, in
    some cases forecasting or filling in missing data). The task of
  * understanding: to find the best data model that 
    reveals the relationships (functions, laws) between features and 
    best describes a problem that is set prior the whole investigation.
* the context of model building. 
  * Training always requires an explicit loss function that decides whether the
  * the loss fn may be rather implicit, as in the case of auto-encoders or
    reinforcement learning. In the process of 
  * understanding: we consider only the input data set and try to figure out the
    feature functions that separate our data set from the rest of the world.
* More formally, in the task of 
  understanding: the representative elements of the system (sub-universe) we
  want to understand, are presented one by one to the model-building apparatus.
  * separating and descriptive coordinates (paper [1] called them relevant and
    irrelevant coordinates, respectively, based on observed features). 
  * These are either kept as they are or modified to better fit the new observed
    element.
  * The separation coordinates are expected to be constant $1$ for the elements
    of the investigated sub-universe. Meanwhile, 
  * the descriptive coordinates distinguish the elements of our subset
    piece-by-piece.
  * After observing a large enough number of samples, we expect to have a good
    understanding, and later our understanding can also be the basis for a quick
    classification.
* there is no understanding/model building without context, prior assumptions,
  questions and prior elimination of almost all the aspects of the universe,
  except some that are the particular subject of the investigation, the problem
  to be solved. In problem setting, we must specify 
  * the set of objects Ω and the function space that maps the "measurements" of
    the elements of the space to the new “coordinates”. In our abstract model,
  * eg? the sub-space of binary functions which has log 2 ( Ω ) variables should
    be specified. Overall, the context is given by Ω and the chosen function
    space.
* scale, eg sand in a desert. 
  * If we have bird’s eye view photographs of the desert (10 6 mm scale), we can
    try to shift and overlap the dunes in the images and find that there is an
    almost periodic pattern that describes well the sand surface.
    * can be formalised using trigonometric series.
    * Time lapsed video recordings of the same scale can reveal wave-like behav
      * explain the periodicity (or falsify the static view). At a 
  * 10 1 − 10 2 mm scale: surface tension, friction, avalanche effects may
    contribute to the description of the observation. The 
    * formalism should be based on polynomials of a few order, chaotic systems,
      or stochastic dynamical systems. On a scale of 
  * 10 {− 3 − 10 {− 0} mm: fragmentation, particle collision processes can be
    captured and the 
    * formalism can be based on branching processes or dynamical systems with
      external potentials (forces) from statistical physics.
In general, it is not easy to decide whether a coordination is appropriate in the above
sense or not. Are we satisfied with the coordination (representation) or do we need further
investigation, sample elements? To facilitate this, it was suggested in [4] to associate an
entropy with each representation, which is minimal if the coordinates are chosen properly.
In [4], some properties of the proposed entropy function were investigated and it was
demonstrated in simple examples that it indeed performs the desired task.
In the present paper, we take a closer look at the practical understanding process. First,
we recall the formal model of understanding. We then show that representation entropy isEntropy 2022, 24, 1313
3 of 8
minimal if and only if the representation is canonical, i.e., a representation that separates
the subset and describes the elements in terms of “independent” coordinates. We propose
a loss function for representations and provide theoretical and practical calculation of the
type one and type two errors of representations. Finally, an estimate of the cost/complexity
of the understanding procedure is given.
