A similarity measure for indefinite rankings
William Webber, Alistair Moffat, Justin Zobel
ACM Transactions on Information Systems Vol. 28, Issue 4, Article No.: 20

# Abstract

* compare Ranked lists
  even when they are incomplete or have only some members in common. An example
  * eg document rankings returned for the same query by diff search engines
  * A measure of the similarity between incomplete rankings should
    handle nonconjointness, weight high ranks more heavily than low, and be
    monotonic with increasing depth of evaluation (ie indefinite); but
  * no measure satisfying all these criteria currently exists. In this article,
* we propose rank-biased overlap (RBO). The RBO measure is
  * based on a simple probabilistic user model. It provides
  * monotonicity by calculating, at a given depth of evaluation,
    a base score that is non-decreasing with additional evaluation, and
    a maximum score that is nonincreasing. An extrapolated score can be
  * has a parameter: the strength of the weighting to top ranks
  * We extend RBO to handle tied ranks and rankings of different lengths
  * examples of the use of the measure in comparing the results produced by
    public search engines and in assessing retrieval systems in the laboratory

# 1 Intro

* These three characteristics of an indefinite ranking are related:
  because the ranking is top-weighted, value decays with depth;
  decaying value motivates a truncation of the list at some arbitrary rank; and
  truncation leaves the ranking incomplete
* There are many similarity measures on conjoint rankings
  (that is, where both lists consist of the same items)
  * Tarsitano [2002] reviews thirty, and more have been proposed since then
  * Some are top-weighted, and more can be made so
  * A few unweighted measures on non-conjoint rankings have been analysed, and
  * a couple of top-weighted, non-conjoint measures have been described.  But
    * assigning arbitrary cutoff depths and
    * not maintaining monotonicity as these are varied
* we propose rank-biased overlap (RBO). This measure is
  * based on (but is not tied to) a simple user model in which
    the user compares the overlap of the two rankings at incrementally
    increasing depths
  * The user has a certain level of patience, parameterized in the model, and
    after examining each depth has a fixed probability of stopping, modelled as
    a Bernoulli random variable
  * RBO is then calculated as the expected average overlap
    that the user observes in comparing the two lists
* the weight of the overlap to that rank
  * the probability that the user will reach a certain rank, defining
  * The weights are naturally convergent, so no normalization is required
  * The (convergent) sum of the weights of the (potentially infinite) tail
    determines the gap or residual between the minimum and maximum similarity
    * The minimum, maximum, and residual scores are all monotonic in depth
    * A point score can also be extrapolated
  * Set similarity is a more natural basis for comparing indef and trunced
    lists than the more widely used one of correlation
    * from the conclusion: in the presence of high and variable degrees of non-
      conjointness, correlation-based metrics tend in practice to degenerate
      into unweighted measures of set overlap
  * Other weighting functions are possible within the same framework,
    including ones derived directly from observed user or system behaviour
* experiments: we concentrate on information retrieval. A common instance of
  * results lists returned, in decreasing order of estimated likelihood of
    relevance or utility, by retrieval systems
  * eg lists of web pages returned by web search engines in response to queries
  * We demonstrate the problems that are encountered with other measures
  * One reason for comparing the rankings of different retrieval systems is to
    explore how similar the two systems are, in
    the documents they index and the algorithms they use to determine relevance
    * The comparison is symmetric; one system is not being measured against the
  * assessment against an objective ranking (called the “gold standard”)
    * The objective ranking could eg be returned by a precise-but-expensive
      retrieval algorithm, and the observed ranking by an algorithm that takes

# 2. COMPARING RANKED LISTS

* rank correlation coefficients such as Kendall’s τ [Kendall 1948]
* characteristics of indef rankings that need to be carefully considered
  * the top of each ranking is more important than the bottom. The web pages
    * the gap between the estimated similarity of different documents to the
      query becomes narrower the deeper the ranking is examined; see Figure 2
  * incomplete, not providing a full ranking of their domains. As a result,
    * Even amongst similarity metrics on incomplete rankings, the majority
      assume that the underlying full rankings exhaustively order a common
      domain, and hence are conjoint
    * eg a common assumption is that items returned in one ranking by cut-off
      depth k, but not in a second ranking by that depth, are ranked at depth k
      + 1 in the latter ranking. But the assumption that the full rankings
      * hE a search engine may not have in its index at all a web page returned
  * indefiniteness: only a prefix of the list is being considered;
    * a small fraction of the list; and the length of the prefix is arbitrary
    * prefix length could even depend upon the degree of similarity observed:
      greater fidelity of measurement might be required where rankings are
      similar, whereas less is needed where they are markedly different. And
    * scores should be comparable independent of depth
      * because multiple comparisons might be made in parallel, as when two
        search engines are compared on a number of different queries, and each
        comparison might have a different depth,
* our terminology
  * A ranking that has the qualities of top-weightedness, incompleteness, and
    indefiniteness described above, is referred to here as an indefinite
    ranking, and
  * a measure of similarity between such rankings that meets all of the
    requirements outlined in the preceding paragraphs is referred to as a
    similarity measure on indefinite rankings or an indefinite rank similarity
    measure

# 4. RANK-BIASED OVERLAP

* similarity assessment using RBO consists of using prefix evaluation to set
  upper and lower bounds (Section 4.2) on the score which full evaluation
  (that is, comparison to infinite depth) could achieve (Section 4.1). In

## 4.3 we derive the weight of each rank under RBO, and therefore the weight of
the prefix

## 4.4 Point estim

* The precise full RBO score is not knowable without evaluation to inf depth;
* nL, in situations where a single value is needed, a reasonable point estimate
  can be extrapolated (Section 4.4). Because RBO is a similarity, not a
* Definitions of RBOMIN and RBORES have been formulated in Section 4.2. The RBO
  * can then be quoted either as base+residual or as a min–max range. For many
* The simplest method is to use the base RBO value as the single score for the
  * gives the known similarity between the two lists,
    the most that can be said with certainty given the information available
  * hE, the base score is dependent on the evaluation depth, k
  * The highest base score that can be achieved for depth k evaluation using
    persistence p is, for large p and small k, is well short of 1. There are
    practical situations in which a list is conceptually indefinite but where
  * eg, if two search engines each only supply 7 results to a query, and the p
    parameter employed is 0.9, then even if both results lists are identical
  * In such situ, base RBO can easily become a measure of result list length,
* An alternative formulation for a single RBO score is to extrapolate from the
  * assuming that the degree of agreement seen up to depth k is continued
    indefinitely. Denote as RBOEXT the result of such an extrapolation
  * this is not equivalent to simply extrapolating a score between the numeric
    values of RBOMIN and RBOMAX. Since those are weighted to higher ranks
    an extrapolation would also be weighted to the agreement observed in
  * Extrapolated RBO is not monotonic; it could either increase or decrease as
    * nL always in/decrease with in/decreasing agreement
  * And of course, RBOEXT is bounded, by RBOMIN and RBOMAX
* the choice of RBOBASE or RBOEXT
  * if evaluation will be performed deeply enough, and p will be small enough
    (say, p ≤ 0.9 and depth of 50), that the residual disappears at normal
    reporting fidelity, leaving RBOEXT and RBOBASE as indistinguishable and
  * Where the residual is noticeable, RBOEXT should in general be the preferred
    * less sensitive than RBOBASE to the actual evaluation depth, which may
      vary between different ranking pairs in the one experiment. For
    * the full reporting format is RBOEXT [RBOMIN – RBOMAX ]

## 4.5 RBO is a metric

## 4.6 the handling of ties and of rankings of different lengths
