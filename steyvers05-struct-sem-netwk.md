The Large-Scale Structure of Semantic Networks:
  Statistical Analyses and a Model of Semantic Growth
2005
M Steyvers, JB Tenenbaum Cognitive science, 2005 Wiley Online Library


# Abstract

* 3 types of semantic networks
  * word associations, WordNet, and Roget's Thesaurus
* small-world structure, characterized by
  * sparse connectivity, short average path lengths, and
  * strong local clustering;
  * distributions of the number of connections follow power laws (scale-free)
* These regularities
  * also been found in e.g. the World Wide Web, but they are
  * not consistent with many conventional models of semantic organization,
    * inheritance hierarchies ...
    * high-dimensional vector spaces
* We propose that these structures reflect the mechanisms [of growth]
  * each new word or concept is connected to [the] network by differentiating
    the connectivity pattern of an existing node
  * mechanistic basis for the effects of learning history variables
    * age of acquisition, usage frequency
    * on behavioral performance in semantic processing tasks.

# 1 Intro

* Network structures ... for modeling semantic knowledge and inference. Within
  * [explicanda]
    1. structure and knowledge
    2. process and performance
    3. interactions of structure and process
* inheritance hierarchies (Collins and Quillian 1969)
  * concepts are represented as nodes in a tree-structured hierarchy, with
  * characteristic attributes or predicates are linked to the most general
    level of the hierarchy to which they apply
  * strong constraints ... on the kinds of knowledge that are possible
    (Keil, 1979; Sommers, 1971)
* Subsequent ... semantic networks put aside ... general structural principles
  * often equipped with some kind of spreading-activation process
  * Collins and Loftus (1975),
* We look at the distributions of several statistics
  * number of connections per word, the
  * length of the shortest path between two words, and the
  * percentage of a node’s neighbors that are themselves neighbors. We show
* many other natural networks , possess a
    * small-world structure (Watts & Strogatz, 1998) characterized by the
      * highly clustered neighborhoods and a
      * short average path length. Moreover, this small-world structure seems
    * scale-free organization (Barabási & Albert, 1999; Strogatz, 2001),
      * distribution of node connectivities follows a power function
* These statistical principles of semantic network structure are quite general
  * hold for semantic network representations constructed ... from
    * word associations of naive subjects (Nelson, McEvoy, & Schreiber, 1999)
    * the considered analyses of linguists (Miller, 1995; Roget, 1911). At
  * not hold for many popular models of semantic structure, including both
    * hierarchical or arbitrarily (unstructured) connected networks
    * high-dimensional vector space models such as Latent Semantic Analysis
* we show how simple models of network growth can produce close quantitative
  fits to the statistics of semantic networks
  * based only on plausible abstract principles with
  * no free numerical parameters.
* model of growth process
  * connects each new concept to a subset of the concepts within an existing
    neighborhood, with the probability of choosing a particular neighborhood
    proportional to its size.
  * new concepts correspond to more specific variations on existing concepts,
    and highly complex concepts (those with many connections) are more likely
    to be differentiated than simpler ones
* predictions about the time course of semantic acquisition, because
  * the order in which meanings are acquired is crucial in determining their
    connectivit
  * We verify this relation experimentally with age-of-acquisition norms
    (Gilhooly & Logie, 1980; Morrison, Chappell, & Ellis, 1997)

# 2. Basic concepts from graph theory 4

* nodes that are connected by either [a directed or an indirected edge] are
  said to be neighbors; a neighborhood is a subset of nodes consisting of
  some node and all of its neighbors.
* distances and the metric axioms of
  * minimality, symmetry, and the triangle inequality (see Tversky, 1977)
  * an undirected graph always satisfy the three metric axioms , but
  * an undirected graph do not in general satisfy the latter two.
* four statistical features
  * average distance L, the
  * diameter D, the
    * maximum of ... distances over all pairs of nodes 6
    * sample for computing L and D
      * For the word associative networks, [on the basis of] the large
        (strongly) connected component.
      * For the much larger ... WordNet and Roget’s thesaurus, [based on] a
        sample of 10,000 words from the large connected component
  * clustering coefficient C, and the
    * the probability that two neighbors of a randomly chosen node will
      themselves be neighbors, or
    * alternatively, the extent to which the neighborhoods of neighboring nodes
      overlap
    * undirected
  * degree distribution P(k)
    * For directed networks, we will concentrate on ...  in-degrees,
    * plotting the full distribution P(k) as a function of k, using either a
      * bar histogram (for small networks, as in Fig. 2), a
      * binned scatter plot (for large networks, as in Fig. 5), or a
      * smooth curve (for theoretical models, as later illustrated in Fig. 3).
    * the shapes of these plots provide characteristic signatures for different
      kinds of network structure and different processes of network growth.
* Fig. 2 ... illustrate how networks equal in size and density of connections
  may differ significantly in their other structural features.
* random graphs—graphs that are
  * generated by placing an edge between any two nodes with some probability p
    independent[ly] (Erdős and Rényi, 1960). First,
  * for fixed `n` and `<k>`,
    high values of `C` tend to imply high values of `L` and `D`.  Second, the
  * degree distribution P(k) is approximately bell shaped, with an
    exponential tail
    * binomial distribution (Bollobás, 1985)
* Small-world structures are essentially defined by the combination of
  * high values of C together with low values of L and D, whereas
* scale-free structures are characterized by ... degree distributions, with
  power-law (rather than exponential) tails.

# 3. Small-world and scale-free network structures 7

* Karinthy (1929)
* small-world phenomenon [may seem surprising, it] occurs even in random graphs
  * When p is sufficiently high, the whole network becomes connected, and the
    average distance L grows logarithmically with n (Erdős & Réyni, 1960)
* Watts and Strogatz (1998)
  * several naturally occurring networks: the power grid of the western United
    States, the collaboration network of international film actors, and the
    neural network of the worm Caenorhabditis elegans
  * clustering coefficients C, that are orders of magnitude [higher]
    * lower value of C ... implies that, on average, more distinct nodes can be
      reached in two steps from any given node
* For the remainder of this article, we use the term small-world structure to
  refer to this combination of
  * short average path lengths L, and
  * relatively high clustering coefficients C (by comparison with equally dense
    random graphs)
* Small-world structures have since been found in many other networks
  * the World Wide Web (WWW; Adamic, 1999; Albert, Jeong, & Barabási, 1999),
  * networks of scientific collaborators (Newman, 2001), and
  * metabolic networks in biology (Jeong et al 2000)
* model for the formation of small-world structures (Watts and Strogatz 1998)
  * a small number of the connections in a low-dimensional regular lattice are
    replaced with connections between random pairs of nodes. The local
    neighborhood structure of the lattice leads to high clustering, whereas the
    long-range random connections lead to very short average path lengths.
* genesis of power-law degree distributions (Barabási and Albert 1999)
  * principles: incremental growth and preferential attachment.  This model
  * yields power-law degree distributions, but it does
  * not produce the strong neighborhood clustering characteristic
* In short, although the
  * model of Watts and Strogatz naturally produces small-world structures, and
  * the model of Barabási and Albert naturally produces scale-free structures,
  * neither of these approaches explains the emergence of both
  * currently a great deal of interest within the theoretical physics community
  (see Albert & Barabási, 2002, for an overview) in developing models of
  network formation that can capture both of these kinds of structures.
* section 4
  * semantic networks, such as the WWW, exhibit both small-world and scale-free
* section 5
  * model for network growth that is
    * related to the Barabási and Albert (1999) model but which grows through
    * a process of differentiation analogous to mechanisms of semantic
      development
    * produce both small-world and scale-free structures naturally, with
    * essentially no free parameters. The
* final section explores some of the
  * psychological implications of this model and
  * compares it to other frameworks for modeling semantic structure.


# 4. Graph-theoretic analyses of semantic networks 9

* edges unlabeled and weighted equally
* More subtle analyses ... would be an important subject of future work

# 4.1. Methods

## 4.1.2 Roget’s thesaurus

* viewed as a bipartite graph, a graph in which there are two different kinds
  * word nodes and semantic category nodes
  * neighborhood clustering [in bipartite graph]
    * simple graph on the word nodes by connecting words if they shared at
      least one class in common.

* we treat WordNet as an undirected graph.

## 4.2. Results and analyses

* Our analysis of these semantic networks focuses on five properties:
  * sparsity
  * connectedness
    * a single large connected component that includes the vast majority
    * In the directed associative network, the largest strongly connected
      component consists of 96% of all words
    * In the undirected
      * _associative_ network, the whole network is connected
      * WordNet and Roget’s thesaurus,
      the largest connected component consists of more than 99% of all words.
      We restricted all further analyses to these components.
  * short path lengths 13
    * in the undirected associative network, the
      * average path length (L) is only 3, whereas the
      * maximum path length (D) is only 5.
  * high neighborhood clustering (clustering coefficient)
    * associative network is well above zero (approximately 1/6) of time. The
    * absolute value of C appears much lower for WordNet , but that is
      primarily because the graph is much sparser
    * both the associative network and WordNet, C is several orders of
      magnitude larger than would be expected in a random graph of equivalent
      size and density (C random ). For
    * Roget’s (Roget, 1911) thesaurus (bipartite)
      * clustering coefficient C was ...  compared with the mean clustering
        coefficient C random computed in an analogous manner for an ensemble of
        random bipartite graphs with the same size and density
      * C was substantially higher for the thesaurus than for the ... random
  * power-law degree distribution
* [base-line] ensembles of random networks with
  * sizes and connection densities equal to those [in] semantic networks

### 4.2.5. Power-law degree distribution

* Fig. 5 plots the degree distributions for the word nodes of each network in
* For the directed associative network, the in-degree distribution is shown. As
* bins of consecutive values and computing the mean value of k for each bin.
  * boundaries between bins were spaced logarithmically to ensure
    approximately equal numbers of observations per bin.
* exponents γ [quite similar] in all three cases, varying between 3.01 and 3.19
* high-connectivity words at the tail, “hubs” of the semantic network.
  * association: FOOD, MONEY, WATER, CAR, and GOOD. In
  * WordNet, they are BREAK, CUT, RUN, MAKE, CLEAR, and in
  * Roget’s  thesaurus they are LIGHT, CUT, HOLD, SET, and TURN. This analysis
  * [these] sets ... have no words in common
  * if expanded to 50 words ..., there are just a few overlapping words
  * important semantic categories or highly polysemous verbs and nouns or
    both
* directed associative network, the
  * in-degree distribution shows a slight deviation from the power-law form,
    * exponent γ somewhat lower than 2. The
  * out-degree
    * not power-law distributed but, instead, has a
    * single peak near its mean + exponential tails, similar to a normal or ξ^2
      * out-degree [is strongly dependent on] the number of
        * subjects that gave associative responses to that cue
        * different associates that each participant was asked to generate

## 4.3. Discussion

* Power laws in human language were
  * made famous by Zipf (1965)
  * discussed earlier by Skinner (1937)
  * Zipf ... also found a power-law distribution for the 
    number of word meanings (as given by the Thorndike-Century dictionary) 15
    * Zipf (1965) plotted the number of meanings of a word versus its rank of
      its word frequency in log–log coordinates and observed a slope b = .466.
      Adamic (2000) ...
* In our analysis of the in-degree distribution for the directed associative
  network, the best fitting power-law exponent was somewhat lower than 2
  * anticipated by Skinner (1937), who measured ... a much smaller set of cues
    than did Nelson et al. (1999)

# 5. Growing network model

* process known as preferential attachment
  (Barabási & Albert, 1999; see also, Simon, 1955):
  * Nodes are added to the network successively, by connecting them to a small
    sample of existing nodes selected with probabilities proportional to their
    degrees
  * produces power-law degree distributions with an exponent of 3, much like
  * not yield clustering coefficients that are nearly as high
    * when the network size and density are comparable
    the Barabási--Albert model yields values of C around .02 [instead] of .186.
    * Asymptotically ... C approaches 0 for this model, ...
      * inappropriate for modeling small-world structures
* we present an alternative model of preferential attachment that draws its
  * inspiration from mechanisms of semantic development
  * naturally produces both
    * scale-free structures—with appropriate power-law exponents—and
    * small-world structures—with appropriate clustering coefficients 16
* principles of attaching new nodes
  1.  semantic structures grow primarily through a process of differentiation
    suggestions of many researchers in language and conceptual development
    (Brown, 1958a,b; Carey, 1978, 1985; Clark, 1993, 2001; Macnamara, 1982;
    Slobin, 1973)
    * The meaning of a new word [is a] variation on [that] of an existing one
    * by acquiring a pattern of connections that corresponds to a subset of
      the existing node’s connections.
  2. probability of differentiating a particular node at each time step is
     proportional to its current complexity—how many connections it has.
  3. we allow nodes to vary in a “utility” variable, which modulates the
     probability that they will be the targets of new connections. Utility
     * not necessary to produce any of the statistical features described
     * allows us to explore interactions between those features and aspects of
       word utility, such as usage frequency.
* few free parameters
  * for undirected networks (Model A) has no free numerical parameters, whereas
  * for directed networks (Model B) has just one free parameter 17

model model results discussion

# 6. Psychological implications of semantic growth 22

6.2. Age of acquisition, word frequency, and centrality 26

# 7. General discussion 32

# 8. Conclusion 33

Notes 34
