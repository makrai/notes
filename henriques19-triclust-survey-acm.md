Triclustering Algorithms for Three-Dimensional Data Analysis:
  A Comprehensive Survey
Rui Henriques, Sara C. Madeira
ACM Comput. Surv. 51, 5, Article 95 (September 2018)

# Abstract

* increasingly prevalent across biomedical and social domains. Notable examples
  * gene-sample-time, individual-feature-time, or node-node-time data,
    generally referred to as observation-attribute-context data
  * to discover putative biological modules, disease progression profiles, and
    communities of individuals with coherent behavior
* there still lacks a structured view on the major requirements of triclust
  * desirable forms of homogeneity (including coherency, structure, quality,
    locality, and orthonormality criteria), and algorithmic approaches
* This work
  * formalizes the triclustering task and its scope
  * taxonomy to categorize the contributions in the field
  * comparison of state-of-the-art triclustering algorithms
  * applications
  * challenges and opportunities to advance the field of triclustering

# 1 Introduction

* biomedical domains
  * periodic profiling of biological entities and clinical monitoring of indivs
  * multivariate time series (Amar+ 2015). Here, the analysis of
    gene-sample-time expression data, compound-sample-time concentration data,
    and patient-record-time data (as well as ... residues-position-time protein
    data, entity-entity-time interaction data, and drug-gene-dose expression)
  * underlying disease progression, development, and responses to stimuli,
    drugs, or therapy (Tchagang+ 2012; Bhar+ 2015; Heylen+ 2016)
  * Two-dimensional biomedical data also have been augmented into 3D data
    e.g. specie-metabolite-condition concentration (Hu and Bhatnagar 2010)) or
    by decomposing the observed values against knowledge-driven annotations
    (such as gene-sample-term or gene-sample-regulator expression data)
* social domains, understanding consumerism, web usage, work performance, and
  social activity can be reliably done
  using individual-feature-time behavioral data or node-node-time interaction d
* financial: stock-ratio-time data or society-society-trade data
  (Sim+ 2010a; Mankad and Michailidis 2014; Guigourès+ 2015)
* terminology:  In this work, the
  * 3D data are generally referred to as observation-attribute-context data,
  * _object_ is used to indistinctly denote an observation, attribute, or contx
* Subspace clustering (Zhao and Zaki 2005)
  * groups of biological entities or individuals are often only meaningfully
    correlated on a specific subset of conditions/records and time points
* biclustering (Madeira and Oliveira 2004)
* triclustering (Zhao and Zaki 2005), real-valued or symbolic
  * aims to discover ... triclusters
    * satisfying certain homogeneity and statistical significance criteria
  * applied to unravel putative regulatory modules, disease patterns,
    communities with shared behavior, or profitable financial profiles
    (Amar+ 2015; Mankad and Michailidis 2014)
  * can be applied with additional discriminative criteria to differentiate
    classes and support real-world decisions (Li and Ngom 2010)
* challenges:
  1. Efficiency: triclustering, similar to biclustering, is an NP-hard problem
     (Zhao and Zaki 2005)
  2. Homogeneity: coherence criteria
    * in accordance with the target problem and desirable outputs
      (Gutiérrez-Avilés and Rubio-Escudero 2014b)
    * agreement ... has not yet been reached (Amar+ 2015)
  3. Avoidance of biases: triclustering should
    * prevent ... dimension dominance (biases toward one or more dimensions)
    * guarantee coherence between objects from each pair of dimensions
      (Mahanta+ 2011)
  4. Robustness [to] varying types (and degrees) of
    noise and missing values (Jiang+ 2006)
  5. Flexibility: the ability to discover a
    * non-fixed number of triclusters with
      arbitrary size, shape, and positioning should be pursued
    * cumulative effects of overlapping triclusters (Mankad and Michailidis 14)
  6. Statistical significance
    * by definition, triclusters should be statistically significant; i.e.,
      their probability to occur should be unexpectedly low
    * optimizing or testing homogeneity and/or size is insuff (Sim+ 2010a)
  7. Temporality (when applicable)`:` triclustering observation-attribute-time
    * homogeneity criteria to capture coherent progression patterns and
    * accommodate meaningful time lags on observations (Xu+ 2009)
  8. Data specificities: the inherent aspects of 3D data
    * heterogeneous 3D data (data combined from multiple sources)
      * source-specific forms of coherence and noise (Supper+ 2007),
    * spatial 3D data: meaningful contiguity and distance criteria
      (Guigourès+ 2015)
    * attributes might be symbolic, real-valued, or a (non-i.i.d.) combination
  9. Others: additional challenges include the need to guarantee that
    * not overly dependent on parameterizations (Guigourès+ 2015) and
    * actionable (Sim+ 2010b)
* contributions:
  * Formalization of the triclustering task and its major properties
  * Comparison of triclustering against peer tasks for multidimensional data
  * Taxonomy (for a structured and critical assessment of ... contributions)
  * Principles to support the design and unbiased evaluation of ... algorithms
  * Comparison of the state-of-the-art triclustering algorithms
  * Overview of real-world applications, [with insights to their] potential

# 2 The formal ground on triclustering and peer tasks for 3D data analysis 3

* temporal 3D dataset (also referred as three-way time series)
* each bicluster B i satisfies specific criteria of
  * homogeneity (Henriques+ 2015b) and
    * constant, multiplicative, additive, and order-preserving homogeneities
  * statistical significance (Henriques and Madeira 2018).
  * In the presence of temporal two-dimensional data, contiguity can be assumed
    on attributes (time points) (Madeira+ 2010) and lags accommodated
    (Gonçalves and Madeira 2014)
* The homogeneity criterion determines the structure, coherence, and quality
  * the structure is described by the number, size, shape, and position of
    triclusters;
  * the coherence of a tricluster is defined by the observed
    * correlation of values (coherence assumption) and the
    * allowed deviation from expectations (coherence strength); and
  * the quality of a tricluster is defined by the
    type and amount of tolerated noise.
* Flexible structures of triclusters are characterized by an arbitrary number
  of (possibly overlapping) triclusters
* priority of a tricluster be defined by specific criteria of interest, such as
  size, statistical significance, and/or homogeneity
* dissimilarity criteria can be placed to guarantee that any tricluster similar
  to another tricluster with higher priority is removed from B and (possibly)
  used to refine similar triclusters in B.
* most triclustering algorithms are based on greedy or stochastic searches
  (producing suboptimal solutions) (Mahanta+ 2011) and place restrictions on
  the allowed structure, coherence, and quality of triclusters (Sim+ 2010a).

## 2.1 Merit Functions

* [The homogeneity, statistical significance and] dissimilarity criteria ...
  are essentially defined by the selected merit functions and how they are
  applied
* e.g. variance of values in a tricluster is an illustrative merit function,
* Merit functions vary according to
  * the way they are applied: to guide greedy iterative searches (Bhar+ 2012),
    optimize multiple objectives (Liu+ 2008), or learn parametric models
    describing the target solution (Amar+ 2015)), for example;
  * their scope: whether they are used to assess a single tricluster or the
    overall triclustering solution (Mankad and Michailidis 2014); and
  * the correlation extent: whether they
    1. jointly assess the three dimensions (Sim+ 2010a),
    1. concern two dimensions at a time followed by consensus (Greco+ 2010), or
    1. target maximal triclusters with (symbolic) patterns (Liu+ 2010).
    * pattern-based merit functions assess the maximality of triclusters with
      well-defined patterns.

### 3D Merit Functions

* e.g. algebraic distances, correlation coefficients, and residue-based funcs
  (Gutiérrez-Avilés and Rubio-Escudero 2014b; Sim+ 2010a)
* Residue-based functions can be used to guarantee more flexible forms of
  * e.g. accommodate shifts and scales on one, two, or three dimensions.  In
  * mean squared residue (MSR)
                    `a i j k = c + α i + β j + γ k + η i j k`
* relationships between triclusters
  * values a i j k can be seen as a sum of the contributions of triclusters
  * Mankad and Michailidis (2014)
  * real-valued 3D data can be described as a sum of q layers
* multiple (possibly conflicting) merit funcs
* [handle] (Gutiérrez-Avilés and Rubio-Escudero 2014b)
  * imbalance on the number of objects per dimension
    (e.g., thousands of genes for dozens of samples and time points
  * arbitrarily high overlapping areas (Xu+ 2009)
* symbolic 3D data analysis, most 3D merit functions [for binary] (Ignatov+ 15)
  * function : product of the fraction and number of ones in the tricluster
    to maximize both its density and size.
* temporal 3D data analysis, a tricluster may show temporal lags on observs
* similarity metrics to compare time series (Ding+ 08; Gonçalves & Madeira 14)
  * multivariate: Planar mean residue similarity (PMRS) was proposed in Ahmed+
    (2011) to compare two observations (each given by a multivariate time
  * A tricluster [is a subspace with pairs of observations] strongly correlated
    on a subset of attributes, J, and time points, K:
* mutual information score to correlate real-valued matrices [with] time lags
  (Sim+ 2010a). Unlike PRMS, this score
  * correlates time points (contexts) instead of observations.
* coherent variation of values within a tricluster

### 2D Merit Functions with Consensus

* find subspaces on each slice, then search for consensus across the third dim
* biclustering merit functions (Madeira and Oliveira 2004; Henriques+ 2015b)
  * e.g. Euclidean distances, pattern support, correlation coefficients,
    permutation consistency, and residue-based functions.
* 2D merit functions can enforce contiguity of time points and accommodate
  temporal misalignments. Xu+ (2009) placed an order-preserving assumption on

### Pattern-based merit functions

* typically applied on symbolic or integer 3D data (Liu+ 2010)
* frequent closed cube (Ji+ 2006)
  * a pattern is a set of symbols on a subset of objects from one dimension and
    repeated across the subsets of objects from the remaining dimensions. In

## 2.2 Related Tasks

Variants of the triclustering task can be found in the literature, including
  1. handle deviant observations, specify alternative criteria of interest, or
  1. peer tasks, such as coclustering or motif discovery, or alternative tasks
  1. generalized formulations to identify subspaces within N -dimensional data
* triclustering should not be confused with the peer clustering tasks for the
  unsupervised analysis of 3D data, such as coclustering or motif discovery.
  * coclustering 3D data aims to partition each dimension
    * the partitions on each dimension optimize some criteria of (dis)sim or
    * the I × J × K subspaces from the intersecting partitions optimize some
      homogeneity criteria
    * requires all data elements to belong to a subspace (exhaustive condition)
      and to a single subspace only (exclusive condition), thus
      limiting the inherent flexibility of the triclustering task
      (Schepers+ 2006; Sim+ 2010b)
  * motif discovery aims to find subspaces (where |J| ≈ |Y|) that are frequent
    either within an observation or across observations.
    * motifs generally span all the attributes and most contributions are only
      able to handle multivariate time series with low m order .
* Subspace clustering also can be applied on alternative data structures:
  1. relational data (Long+ 2006; Banerjee+ 2007; Bekkerman+ 2005;
    Gao+ 2006; Chiaravalloti+ 2006; Balasubramanian+ 2016),
  1. vertical partitioned data (Alqadah and Bhatnagar 2008), and
  1. time-annotated graphs (Guigourès+ 2015).

# 3 A taxonomy for comprehensive understanding and guided development of algos 3

# 4 Formalizes the properties of triclustering solutions 11

## 4.1 Locality degree

## 4.2 Homogeneity criteria

## 4.3 Statistical significance guarantees 16

## 4.4 Data-specific challenges to address 17

# 5 Algorithms 19

triclustering algorithms ... can be divided according to
  * iterative searches (greedy; Section 5.1) or on
    distribution parameter identification (stochastic; Section 5.2) and
  * whether they are able to offer guarantees of optimality (exhaustive;
    Section 5.3) or not. Each approach can be
* further categorized according to whether the behavior relies on
  * biclustering algorithms (Section 5.4),
  * pattern mining procedures (Section 5.5), or
  * evolutionary multiobjective optimization (Section 5.6), among other

* [one] tricluster at a time (Ahmed+ 2011; Waltman+ 2010), a
  subset of all triclusters at a time (Amar+ 2015), or
  all triclusters at a time (common case).
* Finding one or a subset of triclusters at a time: the algorithm [can] either
  * shift the focus into new subspaces or
  * mask previous discoveries.

* The way homogeneity criteria are pursued further determines the
  susceptibility [hajlam] of triclustering searches to different biases

# 6 Evaluation

# 7 Applications

# 8 Contributions in the literature [in our] taxonomy

# 9 Implications and future work

## 5.2 Stochastic Approaches

a plaid assumption. MultiFacTV uses a tensor factorization objective function
