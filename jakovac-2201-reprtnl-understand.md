A Note on Representational Understanding
Antal Jakovác 1 and András Telcs 1,2,3, *
Received 2207 Entropy 2022, 24, 1313. https://doi.org/10.3390/ e24091313

# Abstract: In this paper,

* understanding/repr: finding the appropriate coordination of data
* our approach: understanding is a set repr
  * equivalent to finding the minimum of the repral entropy
  * For the control of the search for the correct repr, we propose
    a loss function as
    a combination of the repral entropy, type one and type two errors
* Computational complexity estimates are presented for the process of
  understanding and using the repr found

# 1. Introduction

* Intellig: respond quickly and adequately to challenges of the external world
  * Animals need to be able to recognise enemies and predators quickly
    * a one-sided classification, one class versus all the others
    * Jakovác+ (arXiv:2010.13482) argue that
      responding extremely quickly requires a
      different solution than classical classification or learning
      * they propose a new paradigm, fundamentally different from classif, to
        cover the cognitive process of understanding
  * we show the theoretical feasibility of the comprehension process and
    propose practical development of the process of understanding
* Jakovác+: understanding a topic is equiv to finding the right repr of the data
  * following the strategy of repr learning [2,3]
  * not involve data compression, but merely the rearrangement of known
    facts/characteristics that fit best to the observed phenomena
* understanding vs learning
  * may seem technically similar and are part of our cognitive work
  * hE There is a subtle philosophical difference
* Classic AI/ML tasks such as classification, clustering, encoding etc
  ⇌ understanding, "model building"
  * Before we are able build a proper model, we try to classify objects based on
    their characteristics, features, or try to cluster them
  * If we find a strikingly good arrangement, it can lead to a model idea
  * adjusting a few parameters
  * After some trials we find a model that fits the data well and
    meets our expectations of the model
* model building always involves some preliminary assumptions
  * Once you have a suitable model in hand, the task of classif/clust is easy
    * eg to classify a new item, we have to compare its features with those of
    * If we have a model, a few relations between some features should be
      checked to identify the right class
    * = the bird tweet phenomenon
    * eg we have sample points from several polynomials of order one, two and
    * If we are given a new set of sample points from an unknown polynomial,
* supervised or unsupervised learning algorithms have relatively low complexity,
  * finding a model (that well characterizes the classes, the relationship
    between the features) is a very difficult task with much higher complexity
  * The difference is typically exponential, or even hyper-exponential,
    depending on the task
* learning and model building processes
  * training: we have a feature set of data and
    we want to fine-tune a combination of these features (feature selection)
    to optimise some behaviour (usually classification or clustering, in some
    cases forecasting or filling in missing data)
  * understanding: to find the best data model that
    reveals the relationships (functions, laws) between features and
    best describes a problem that is set prior the whole investigation
* the context of model building
  * Training always requires an explicit loss function
  * the loss fn may be rather implicit, as in the case of auto-encoders or
    reinforcement learning
  * understanding: we consider only the input data set and try to figure out the
    feature functions that separate our data set from the rest of the world
* More formally, in the task of
  understanding: the representative elements of the system (sub-universe) we
  want to understand, are presented one by one to the model-building apparatus
  * separating and descriptive coordinates (paper Jakovác+ called them relevant
    and irrelevant coordinates, respectively, based on observed features)
    * either kept as they are or modified to better fit the new observed element
  * The separation coordinates are expected to be
    constant $1$ for the elements of the investigated sub-universe
  * the descriptive coordinates distinguish the elements of our subset
    piece-by-piece
  * After observing a large enough number of samples,
    we expect to have a good understanding, and
    later our understanding can also be the basis for a quick classification
* there is no understanding/model building without context, prior assumptions,
  questions and prior elimination of almost all the aspects of the universe,
  except some that are the particular subject of the investigation, the problem
  to be solved. In problem setting, we must specify
  * the set of objects Ω and the function space that maps the "measurements" of
    the elements of the space to the new “coordinates”
  * eg? the sub-space of binary functions which has log 2 ( Ω ) variables should
    be specified. Overall, the context is given by Ω and the chosen function
    space
* scale, eg sand in a desert
  * If we have bird’s eye view photographs of the desert (10 6 mm scale),
    we can try to shift and overlap the dunes in the images and find an
    almost periodic pattern that describes well the sand surface
    * can be formalised using trigonometric series
  * Time lapsed video recordings of the same scale can reveal wave-like behav
    * explain the periodicity (or falsify the static view). At a
  * 10 1 − 10 2 mm scale: surface tension, friction, avalanche effects may
    contribute to the description of the observation. The
    * formalism should be based on polynomials of a few order, chaotic systems,
      or stochastic dynamical systems
  * 10 {− 3 − 10 {− 0} mm: fragmentation, particle collision processes
    * formalism can be based on branching processes or dynamical systems with
      external potentials (forces) from statistical physics
* not easy to decide whether a coordination is appropriate in the above sense or
  * Are we satisfied with the coordination (repr) or
    do we need further investigation, sample elements? To facilitate this, it
    * Biró and Jakovác (2022) associate an entropy with each repr, which is
      minimal if the coordinates are chosen properly
    * some properties of the proposed entropy function were investigated and it
    * demonstrated in simple examples that it indeed performs the desired task
* we take a closer look at the practical understanding process. First,
  * we recall the formal model of understanding. We then show that
  * repr entropy is minimal if and only if the repr is canonical,
    ie a repr that separates the subset and describes the elements in terms of
    “independent” coordinates. We propose
  * a loss function for reprs and provide
  * theoretical and practical calculation of the type one and type two errors of
    reprs. Finally,
  * an estimate of the cost/complexity of the understanding procedure is given
