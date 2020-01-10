Dana Lahat, Tülay Adali, and Christian Jutten
Multimodal Data Fusion: An Overview of Methods, Challenges, and Prospects
IEEE 2015

#INTRODUCTION

* [history of] data fusion have been laid in the
  * first half of the 20th century [1], [2]. Joint analysis of multiple data
  * late 1960s/early 1970s with the formulation of
    * multiset canonical correlation analysis (CCA) [3],
    * parallel factor analysis (PARAFAC) [4], [5], and
    * other tensor decompositions [6], [7].  However,
  * until rather recently [confined within] psychometrics and chemometrics,
  * recent technological advances, in a growing number of domains
    * [applications:] commercial, social, biomedical, environmental, military
* data-driven approaches
  * [i.e.] minimal and weak priors and constraints,
  * such as sparsity, non-negativity, low-rank, and independence
* A key property of multimodality is complementarity
  * In mathematical terms, this added value is known as diversity
* constraints ... enhance uniqueness, interpretability, robustness,
* this paper ... is organized in
  * two types of cross sections
    * why we need data fusion (Sections II and III)
    * how we perform data fusion (Sections IV and V)
    * Each question : data (Sections II and IV) & theory (Sections III and V)
  2. multimodality and data fusion and ... applications
  3. diversity
  4. complicating factors [in the] processing of heterogeneous data
  5. model design

#III Multimodality as a form of diversity

* Uniqueness is necessary in order to achieve interpretability
* multimodality ... can achieve uniqueness even in cases that are not unique
  otherwise

##III-A mathematical preliminaries that will serve us

* latent variable space
* can be regarded as a form of compression

##III-B data-driven approach

##III-C diversity and data fusion in [mxs or tensors] 8

* singular value decomposition (SVD) and eigenvalue decomposition (EVD) are
  * made unique by imposing orthogonality on the underlying matrices and
    inequality on the singular or eigenvalues [66, Sec. 3], [68]
  * yield non-interpretable results [69]
* factor analysis (FA) [70] & the blind source separation (BSS) problem [63,71]
  * represent X as a sum of low-rank terms with interpretable factors [65],
    where the difference lies in the type of assumptions being used
  * constraining FA
    * a specific arrangement of a receive antenna array or other properties of
      a communication system may be imposed via a Vandermonde [72]–[75] or
      Toeplitz [76] structure. Alternatively,
    * a factor may [have e.g.] constant modulus or finite alphabet [57], [61]
    * Another approach is to use sparsity [77]–[79]
* independent component analysis (ICA)
  * Probably the most well-known BSS approach to fix the indeterminacy in (5)
  * separation can be achieved if the statistically independent sources are
    non-stationary, non-white, or non-Gaussian [71], [80]–[82]
    * The first two [=] diversity across time or diversity in the spectral dom
    * Non-Gaussianity is associated with diversity in higher order statistics
  * methods has been devised to exploit this diversity [63], [80], [83]–[86]
* Both FA and ICA have been used for decades and with much success
  * simplicity of their basic idea
  * very robust algorithms
  * they are at the focus of our discussion
* non-negativity, sparsity, and smoothness [63]
  * many observations can be better explained by [them]
  * not limited to decomposition into a sum of rank-1 terms, statistical
    independence, linear relationships, or even matrix factorizations
  * Proving uniqueness ... is a matter of ongoing research
  * see the end of Section III-D for examples
###2 Higher Order Arrays 9
* canonical polyadic decomposition (CPD)
* CPD is inherently ‘‘essentially unique’’ up to a scaled permutation matrix,
* as [array dim] N increases, indeed the bound on the number of rank-1 terms
  that can be uniquely identified becomes more relaxed
  i.e. more observational modes allow to identify more sources
* tensor decomposition (8) is also known as parallel factor analysis (PARAFAC)
  [5]
* [CPD] can be linked ... also to BSS, as follows
  * symmetric joint diagonalization (JD) of several matrices [81], [83]
* Until now, we focused on decompositions in sum of rank-1 factors and
  statistical independence
  * [for] more flexible [factorizations]; see the end of Section III-D

##III-D data fusion 12

ezt a szakaszt csak felületesen olvastam el

* heterogeneous data-sets
  * [the use of a single array] may be challenged
  * when data sets are given in different types of physical units
  * when data sets are stacked in arrays of different orders [arrays dim],
  * data sets with different latent models, different types of uncertainty, or
    when not all factors or latent variables are shared by all data sets
* models that allow heterogeneous data sets to remain in their most explanatory
  form and still perform true data fusion
* stronger properties that cannot be achieved using single-set single-modal
  * more relaxed uniqueness conditions that
    admit more challenging scenarios: for example, more relaxed assumptions on
    the underlying factors, and the ability to
    resolve more latent variables (low-rank terms) in each data set;
  * terms that are shared across data sets enjoy the same permutation at all
    data sets
* independent vector analysis (IVA) [82], [108], [109]
  can be solved using second-order statistics (SOS) alone [110], [111]
  * IVA extends CCA [1] and its multiset extension (MCCA) [3][:]
    [higher]-order statistics are taken into account [82]
  * a generalization of IVA that allows decomposition into
    terms of rank larger than one has been proposed [119]– [121]

##III-E Conclusion: A Link Between Data Sets Is Indeed a New Form of Diversity

* The strength of IVA and coupled CPD over a set of unlinked factorizations
  lies in their ability to exploit commonalities among data sets
  * In IVA, it is the statistical dependence of sources across mixtures;
  * in coupled CPD, it is the shared factors
* links among the data sets allow desired properties within one data set to
  propagate to the ensemble ... [16]

#4 Challenges at the data level

##at the acquisition and observation level

1. Non-commensurability [különmércéjűség]
2. Different Resolutions
  * may be associated with various types of uncertainty,
    as explained in Section IV-B
    * prevalent ... in multimodal image fusion [13], [and] other imaging techs
  * For example,
    * EEG has an excellent temporal but low spatial resolution [vs] fMRI
      (Example II-B.1)
    * In remote sensing (Example II-C.1), a common task is ‘‘pan-sharpening’’
      * merging a high-spatial, low-spectral (single band) resolution
        panchromatic image with a
        lower spatial, higher spectral ... resolution multispectral image
    * audiovisual applications (Example II-A.1)
      * temporal resolution of the signals differs by orders of magnitude
    * meteorological monitoring (Example II-C.2)
3. Incompatible Size
  * [different] number of data samples. As explained in Section IV-B, this
  * may be associated with various types of uncertainty
  * arrays of different orders
    [e.g.] in chemometrics, metabolomics [e.g., Fig.  2(a)], and psychometrics
4. Alignment and Registration
  * aligning several data sets, usually images, on the same coordinate system
  * 3-D biomedical imaging
    * the patient is never precisely in the same position
    * One approach ... maximizes mutual information [148], [149]
  * remote sensing (Example II-C.1),
    * images of the same area are taken [e.g.] before and after
      landscape-changing events such as natural disasters
  * Calibration ... as a special case of alignment and registration

##due to various types of uncertainty

1. Noise:
  * heterogeneous types of errors [8]
  * links (correlations) between noise across data sets
    * ignoring [them] may lead to bias [9]
2. Balancing Information From Different Origins
  * [different] level of confidence, reliability or information quality
  * data sets of different size (recall Challenge IV-A.3)
  * missing values, where the weights should be proportional to the number of
    non-missing entries in each data set [16]
3. Conflicting, Contradicting, or Inconsistent Data
   * identifying these inconsistencies
4. Missing Values
  * cases [that] arise due to interaction among data sets
    1. certain data entries may be unreliable, discarded, or unavailable
    2. a modality can report only on part of the system [e.g.] EEG versus MEG
    3. [when some] third-order tensors ... can be regarded as elements in a
       larger third-order tensor in which they are all contained
    4. if samples at different modalities are not taken at comparable sampling
       points [8] (recall Challenge IV-A.2)
    5. link prediction ... in recommender systems and social network analysis

#5 Challenges at the model design level 17

* topics [we leave] outside the scope of this overview:
  computation, algorithms and fusion of large-scale data,

##A. Level of Data Fusion

* at which level of abstraction, reduction and simplification
  1. data integration
    * parallel processing pipelines for each modality + a decision-making step
    * common approach ... When modalities are completely non-commensurable
    * often related to classification tasks.  Integration can be done via
      * soft decision, using optimal weights
    * when modality-specific information carries more weight compared with the
      shared information,
      as argued for the joint analysis of EEG–fMRI in [32] (Example II-B.1)
    * simpl[e], and relative[ly] stab[le] since it
      allows to rely on well-established methods from single-modal data anal
  2. processing modalities sequentially, where
    one (or more) modality(ies) is used to constrain another
    * when one modality has better quality
      [e.g.] in the fMRI-constrained solution for the otherwise
      under-determined, ill-posed EEG inverse problem [12], [26] (Exa II-B.1)
  3. In this paper, we focus on ... true fusion, that lets
    modalities fully interact and inform each other
    * symmetric role to all modalities
* Within ‘‘true fusion,’’ there are varying degrees
  * using high-level features[,] dimensionality is significantly reduced
  * using multivariate features
    * In neuroimaging, common features are task-related spatial maps from fMRI,
      gray matter images from sMRI, and event-related potential (ERP) from EEG,
    * In audiovisual applications, features often correspond to
      speech spectral coefficients and
      visual cues such as lip contours or speaker’s presence in the scene [23]
  * using the data as is, or with minimal reduction
* Features, at different levels, may accommodate heterogeneities across
  modalities, such as different types of uncertainty and non-commensurability
###Order selection and dimension reduction
* As in non-multimodal analysis, a dimension reduction step may be required
  to avoid overfitting [or] as a form of compression [9]

##B links between data sets 19

###1) ‘‘Soft’’ and ‘‘Hard’’ Links Between Data Sets

* whether each data set will have its own set of individual parameters,
  * soft
    * none of the parameters ... are shared by [more] data set
    * additional information is required to define the link
    * link ... can be interpreted as similarity, smoothness, or continuity
  * hard
    * data sets explicitly share certain factor matrices or latent variables
####‘‘Hard’’ links between data sets
* methods that are based on stacking data in a single tensor fall within this
  category
  * [e.g.] PARAFAC (Section III-C-2),
  * generalized singular value decomposition (GSVD) and
  * higher order SVD (HOSVD aka Tucker)
  * joint ICA and group ICA
    share a mixing matrix or source subspace, respectively,
    by concatenating the observation matrices in rows or columns
  * Simultaneous factor analysis (FA) and
    simultaneous component analysis (SCA)-based methods
    * multiway data that have at least one shared mode
    * not stack[ed] it in a single tensor (Section III-C2)
  * Linked tensor ICA has one factor matrix shared by all decompositions
  * Bayesian group FA and its tensor generalization as well as in
    collective matrix factorization (CMF)
    several matrices or tensors share all but one factor matrix
  * fusion of hyperspectral and multispectral images
  * non-negative matrix factorization (NMF),
    shared columns of the feature matrix reflect task-related variations
  * generalized linked-mode framework for multiway data allows
    flexible links across data sets by shared (sub)factors, as do
    coupled matrix and tensor factorization (CMTF) and
    its probabilistic extension generalized coupled tensor factorization (GCTF)
    linked multiway component analysis (LMWCA) and
    structured data fusion (SDF)
  * In the fusion of astrophysical observations ... (Example II-C.3),
####‘‘Soft’’ links between data sets
* Prevalent types of ‘‘soft’’ links are
  * statistical dependence, as in IVA (Example III-D.1);
  * covariations, as in CCA  and its extension to more than two matrices,
    multiset CCA (MCCA), and parallel ICA
  * ‘‘similarity,’’ in the sense of minimizing some distance measure
    ... as in soft non-negative matrix cofactorization [189] and
    joint matrix and tensor decompositions with flexible coupling [145]
  * [For audiovisual data fusion,] a dictionary learning model where
    each atom consists of an audio and video component [144]
* Generalized linked-mode for multiway data [8] and LMWCA [65]
* models with ‘‘soft’’ links are often reformulated using shared variables

###2) Shared Versus Unshared Elements

##C Analytical Framework 21

* theoretical approaches to the analysis of the ensemble of linked data sets
* A survey of techniques for multiview machine learning can be found in [206]
  A multimodal deep-learning method for information retrieval from
  images and text is described in [207]

##D Structured Data Fusion: A General Mathematical Framework

##E validation issues 23

* there is still very little theoretical [and quantitative] validation
* [for] IVA (Example III-D.1) and coupled tensor decompositions (Example
  III-D.2) ... there now exists a comprehensive theoretical analysis
* computational front. As an example,
  * Tensorlab [208], a Matlab toolbox that
    follows the modular principles of SDF [16] (Section V-D)
* questions regarding the choice of modalities and the[ir] added value
  * How much (information, diversity, redundancy) does each modality bring in
  * see Section IV
  * Information theory ... to evaluate the contribution[s] ... [12]
  * representation of the output of multimodal data analysis [11, Sec.  8]
