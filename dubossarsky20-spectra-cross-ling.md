The Secret is in the Spectra: Predicting Cross-lingual Task Performance
  with Spectral Similarity Measures
Haim Dubossarsky, Ivan Vulić, Roi Reichart, Anna Korhonen
EMNLP 2020

# Abstract

* Performance in cross-lingual NLP tasks is impacted by the (dis)similarity of
  languages at hand: e.g., previous work has suggested there is a connection
  between the expected success of bilingual lexicon induction (BLI) and the
  assumption of (approximate) isomorphism between monolingual embedding spaces
* we present a large-scale study focused on the
  corr between monolingual embedding space similarity and task performance,
  * thousands of language pairs
  * four tasks: BLI, parsing, POS tagging and MT
* We hypothesize that statistics of the spectrum of each monolingual embedding
  indicate how well they can be aligned
* We then introduce several isomorphism measures between two embedding spaces,
  based on the relevant statistics of their individual spectra
* We empirically show that
  * language similarity scores derived from such spectral isomorphism measures
    are strongly associated with performance in different cross-lingual tasks,
  * our spectral-based measures consistently outperform
    previous standard isomorphism measures, while being
    computationally more tractable and easier to interpret
* our measures capture
  complementary information to typologically driven language distance measures,
  * combination yields even higher task performance correlations

# 1 Intro

* multilingual modeling and cross-lingual transfer in cross-lingual NLP is
  critically impacted by the actual languages in consideration
  (Bender, 2011; Ponti+ 2019)
* Characterizing, measuring, and understanding this cross-language variation is
  often the first step towards the development of more robust multilingual NLP
  (O’Horan+ 2016; Bjerva+ 2019; Ponti+ 2019)
  * eg selecting suitable source languages for cross-lingual transfer of
    dependency parsers or POS taggers
    (Naseem+ 2012; Ponti+ 2018; de Lhoneux+ 2018)
  * eg2: MT:
    with all other factors kept similar (e.g., training data size, domain sim),
    the quality of machine translation also depends heavily on the
    properties and proximity of the actual language pair (Kudugunta+ 2019)
* we propos a suite of spectral-based measures that capture the degree of
  isomorphism (Søgaard+ 2018) between the two monolingual embedding spaces
  * hypothesis is that the potential to align two embedding spaces and learn
    transfer functions can be estimated through
    the differences between the monolingual embeddings’ spectra
  * representative statistics of the spectrum of an embedding space (i.e., the
    set of the singular values of the embedding matrix)
    * eg condition number or its sorted list of singular values
  * derive measures for the isomorphism between two embedding spaces based on
    these statistics
* empirical evaluation with a range of cross-lingual NLP tasks
  * our proposed spectrum-based isomorphism measures
    better correlate and explain greater variance
    than previous isomorphism measures (Søgaard+ 2018; Patra+ 2019)
  * also outperform standard approaches based on ling info (Littell+ 2017)
* first part of our empirical analysis targets
  bilingual lexicon induction (BLI), a cross-lingual task that received
  * a case study to investigate the impact of cross-language variation on
    task performance (Søgaard+ 2018; Artetxe+ 2018). Its popularity stems
  * simple task formulation and reduced resource requirements, which makes it
    widely applicable across a large number of language pairs (Ruder+ 2019b)
  * for some/other language pairs BLI performs remarkably well/rather poor
    (Søgaard+ 2018; Vulić+ 2019)
  * attempted to explain this variance in performance by grounding it in
    the differences between the monolingual embedding spaces themselves
  * the notion of approximate isomorphism, and argued that
  * it is easier to learn a mapping function (Mikolov+ 2013; Ruder+ 2019b)
    between language pairs whose embeddings are approximately isomorphic,
    (Barone, 2016; Søgaard+ 2018) Subsequently, novel
  * methods to quantify the degree of isomorphism were proposed, and were
    * significantly correlate with BLI scores
      (Zhang+ 2017; Søgaard+ 2018; Patra+ 2019)
  * we report much higher correlations with BLI scores than existing
    isomorphism measures, across a variety of SOTA BLI approaches
  * previous work was limited only to coarse-grained analysis with a small
    number of language pairs (i.e., < 10), our study is the first large-scale
  * hundreds of diverse language pairs, focusing on
    typologically, geographically and phylogenetically distant pairs
    as well as on similar languages
* our findings generalize to cross-lingual transfer
  in dependency parsing and POS tagging, and we also demonstrate
  strong correlations with machine translation (MT) performance
* our spectral-based measures can be combined
  with typologically driven language distance measures to achieve further impro
  * complementary nature of the implicit knowledge coded in
    * continuous semantic spaces (and captured by our spectral measures) and the
    * discrete linguistic information from typological databases

# 2 Quantifying Isomorphism with Spectral Statistics 2

1. spectral statistics of an embedding space
2. comparing two spaces using these statistics

## 2.1 Spectrum Statistics

* X is mean-centered, column means have been subtracted and are equal to zero.

### Condition Number. In numerical analysis,

* a function’s condition number measures the extent of change of the function’s
  output value conditioned on a small change in the input (Blum, 2014)
* Following Higham+ (2015), we compute the condition number of an input matrix
* the ratio between its first (largest) and last (smallest) singular values: 
* A smaller condition number denotes a more “stable” matrix
* A function learnt on an embedding space that is sensitive to small
  perturbations may not generalize well.

#### Are small singular values reliable?

* Small singular values are associated with noise, or with the least important
  * many noise reduction techniques remove them (Ford, 2015). If the smallest
  * this might affect the condition number (Eq. (1))
  * crucial to distinguish between “small but significant” and “small and
    insignificant” singular values. This is what we do below.

### Effective Rank. Given sorted singular values, determine the last effective

* singular values below a certain threshold are removed. However, this
  hE, introduces a dependency on the hyper-parameter .  To avoid this,
* Roy and Vetterli (2007) proposed an alternative method that
  considers the full spectrum of singular values before computing the so-called
  effective rank of the input matrix X
  * erank(X) = floor exp H(Σ)   (2)
  where H(Σ) is the entropy of the matrix X’s normalized singular value
  distribution σi/\sum σi
  * erank(X) yields the index of the last singular value that is considered
  * 1 ≤ erank(X) ≤ rank(X) ≤ d (3)
  * mxs of the same ‘initial’ rank can have very different eff rank
    (Yin and Shen, 2018)
* used for various problems outside NLP, such as
  * source localization for acoustic (Tourbabin and Rafaely, 2015) and seismic
    (Leeuwenburgh and Arts, 2014) waves,
  * video compression (Bhaskaranand and Gibson, 2010), and for the
  * evaluation of implicit regularization in neural matrix factorization
    (Arora+ 2019)
  * We use it to inform and improve the estimation of the condition number.

### Effective Condition Number

* We replace σ d in Eq. (1) with the singular value at the position of X’s
  effective rank (see Eq. (2)), and compute the effective condition number κ
  ecn as follows: κ ecn (X) = σ 1 σ erank(X) (4)
* In §5 we empirically validate the quality of the effective condition number
  in comparison to the standard condition number.

## 2.2 Spectral-Based Isomorphism Measures

* We combine the two condition numbers using the harmonic mean function ( HM )
  to derive an isomorphism measure COND-HM between two embedding spaces, 
* similarly define the [effective] ECOND-HM measure over κ ecn (X 1 ) and κ ecn (X 2 ).
* we have empirically validated (§5) that HM is a robust choice that
  outperforms some other possibilities (e.g., the arithmetic mean). We
* hypothesize this is because HM treats large discrepancies between two numbers
  in a manner that leans towards the smaller one (unlike e.g. arithmetic mean).
  * a noisy embedding space and a stable one would have an HM that leans
    towards the stable one. 2 Our results suggest that
  * embedding spaces with small condition numbers can often tolerate noisy
    mappings from embedding spaces with high condition numbers

### Singular Value Gap

* In addition to COND HM and ECOND HM , we introduce another measure that
* empirically quantifies the divergence between the full spectral information
  of two embedding spaces.
* the gap between the singular values obtained from the matrices X 1 and X 2
  sorted in descending order. We define the measure of Singular Value Gap (
* the squared Euclidean distance between the corresponding sorted singular
  values after log transform:
  SVG(X 1 , X 2 ) = \sum (log σ i 1 − log σ i 2 ) 2

# 3 Related Work and Baselines 4

## Measuring Approximate Isomorphism. We focus on

* two standard isomorphism measures from
prior work which are most similar to our work, and
use them as our main baselines. The first measure,
termed Isospectrality (IS) (Søgaard+ 2018),
is based on spectral analysis as well, but of the

Laplacian eigenvalues of the nearest neighborhood
graphs that originate from the initial embedding
spaces X 1 and X 2 (for further technical details
see Appendix A). Søgaard+ (2018) argue that
these eigenvalues are compact representations of
the graph Laplacian, and that their comparison re-
veals the degree of (approximate) isomorphism.

Although similar in spirit to our approach, con-
structing nearest neighborhood graphs (and then
analyzing their eigenvalues) removes useful infor-
mation on the interaction between all vectors from
the initial space, which our spectral method retains.

The second measure is the Gromov-Hausdorff
distance (GH) introduced by Patra+ (2019). It
measures the maximum distance of a set of points
to the nearest point in another set, or in other words
the worst case distance between two metric spaces

X and Y (for further technical details see again Ap-
pendix A). Patra+ (2019) propose this distance
to test how well two language embedding spaces
can be aligned under an isometric transformation.

While both IS and GH were reported to have
strong correlations with BLI performance in prior
work, they have not been evaluated in large-scale
experiments before. In fact, the correlations were
computed on a very small number of language pairs
(IS: 8 pairs, GH: 10 pairs). Further, both measures
do not scale well computationally. Therefore, for
computational tractability, the scores are computed
only on the sub-matrices spanning the sub-spaces
of the most frequent subsets from the full embed-
ding spaces (IS: 10k words, GH: 5k words). In this
work, we provide full-fledged empirical analyses
of the two measures on a much larger number of
pairs from diverse languages, and compare them
against the spectral-based measures introduced in
§2. The fact that the proposed spectral-based meth-
2380ods are grounded in linear algebra theory (cf. §2.1)
also arguably provides a more intuitive understand-
ing of their theoretical underpinning than what is
currently offered in the relevant prior work.

## Measuring Language Similarity. At the same time, distances between language
pairs can also

# 4 Experimental Setup 5

# 5 Analyses and Results

* Tables 1 and 2
  our proposed spectral-based isomorphism measures are strongly correlated with
  performance across all tasks and settings
  * they show the strongest individual correlations with task performance
    among all isomorphism measures and linguistic distances alike
  * The only exception is the MT task, where our measures fall short of TYP
    * still hold a strong advantage over the baseline GH and IS isomor measures
* ECOND HM outperforms COND-HM on 2 of 3 BLI datasets and 2 of 3 downstream
  * ie discarding the smallest singular values reduces noise. Additionally,
  * SVG shows greater stability across tasks and datasets than ECOND HM . A
  * across all tasks: our spectral measures are the most robust isomor measures
  * substantially outperform the widely used baselines GH and IS
* As stepwise regression discerns [megkülönbözteti] between overlapping and
  complementing variables (see §4.3), another finding indicates that
  * our spectral measures are complemented by linguistically driven lang dists
  * their combination achieves very high correlation scores. The
    * across all tasks and settings (see bottom rows of the tables). For
    * eg spectral measures + the linguistic distances, the regression model
      reaches outstanding corr scores up to r = .91 on PanLex BLI (Tab 1); with
    * PanLex: 420 lang pairs, the most comprehensive BLI dataset in our study
  * GH and IS are not chosen as significant regressors in the stepwise regressi
    * indicates that they capture less information than our spectral methods
  * ie conceptually different distances capture different properties of
    similarities between languages, which has a synergistic effect
* individual tasks, we note that
  * our spectral-based measures outperform the baselines regardless of the
    underlying BLI method
  * SVG is the most informative distance measure in parsing experiments, and
    all linguistic distances fall behind isomorphism measures
  * Combining linguistic distances with SVG increases the already high
    correlation from 0.79 to 0.87 (Table 2, second column)
  * POS tagging task, SVG and GH are on par, and the
    * combination with IS and TYP increase their correlation from 0.52 to 0.59
  * Additional results and analyses are provided in Appendix B. They further
  * our measures also indicate transfer quality of different target/src
    languages for a given source/tgt language, for the tasks discussed here

# 6 Further Discussion and Conclusion

* This work introduces two spectral-based measures, SVG and ECOND-HM , that
  * Both measures leverage information from singular values
  * ECOND-HM uses the ratio between two singular values, and is
    grounded in linear algebra and numerical analysis
    (Blum, 2014; Roy and Vetterli, 2007),
  * SVG directly utilizes the full range of singular values
    * more robust across different tasks and datasets, compared to
      ECOND-HM that shows greater variance, as observed in our results above
* input embedding
  * the spectral methods are computed solely on word vectors from Wikipedia,
    the results in the downstream tasks are computed with different sets of
    embeddings (e.g., multilingual embeddings for dependency parsing), or the
    embeddings are learnt during training (for POS tagging and MT). We be-
* use of effective rank improving the condition number (via effective condition
  number)
  * inspired by recent work that aimed to automatically detect true dim of embe
    * tuning embedding dimensionality to evaluation tasks at hand
      (Wang, 2019; Raunak+ 2019; Carrington+ 2019) Our intention, on the other
    * we extract the true embedding dimensionality directly from the embedding
    * Yin and Shen, (2018) employed perturbation analysis to study the
      robustness of embedding spaces to noise in monolingual settings, and
      established that it is also related to effective dimensionality of the
      embedding space
* we replace the standard matrix rank with effective rank
  when computing the condition number and our effective condition number (§2.1)
* we are the first to compare language distance measures that are based on
  discrete linguistic information (Littell+ 2017) with measures of isomorphism
* further research will advance our understanding of:
  * what knowledge is captured in monolingual and cross-lingual embedding
    spaces (Gerz+ 2018; Pires+ 2019; Artetxe+ 2020);
  * how that knowledge complements or overlaps with linguistic knowledge
    compiled into lexical-semantic and typological databases
    (Dryer and Haspelmath, 2013; Wichmann+ 2018; Ponti+ 2019); and
  * how to use the combined knowledge for more effective cross-lingual transfer
    (Ponti+ 2018; Eisenschlos+ 2019)
* The differences in embedding spaces of different languages depend also on
  training algorithm, underlying domain, or training data size and quality
  (Søgaard+ 2018; Arora+ 2019; Vulić+ 2020)
* future research
  * an in-depth study of these factors and their relation to our spectral anal
  * choosing source languages for transfer in low-data regimes, over
  * monolingual word vector induction guided by the spectral statistics, even
  * more effective hyperparameter search
