The Secret is in the Spectra: Predicting Cross-lingual Task Performance
  with Spectral Similarity Measures 
Haim Dubossarsky, Ivan Vulić, Roi Reichart, Anna Korhonen
EMNLP 2020

# Abstract

* Performance in cross-lingual NLP tasks is impacted by the (dis)similarity of
  languages at hand: e.g., previous work has suggested there is a connection
  between the expected success of bilingual lexicon induction (BLI) and the
  assumption of (approximate) isomorphism between monolingual embedding spaces.
* we present a large-scale study focused on the correlations
  corr between monolingual embedding space similarity and task performance,
  * thousands of language pairs 
  * four different tasks: BLI, parsing, POS tagging and MT
* We hypothesize that statistics of the spectrum of each monolingual embedding
  space indicate how well they can be aligned
* We then introduce several isomorphism measures between two embedding spaces,
  based on the relevant statistics of their individual spectra
* We empirically show that 
  * language similarity scores derived from such spectral isomorphism measures
    are strongly associated with performance in different cross-lingual tasks, 
  * our spectral-based measures consistently outperform
    previous standard isomorphism measures, while being
    computationally more tractable and easier to interpret. 
* our measures capture
  complementary information to typologically driven language distance measures,
  * combination yields even higher task performance correlations

# 1 Intro

* multilingual modeling and cross-lingual transfer in cross-lingual NLP is
  critically impacted by the actual languages in consideration
  (Bender, 2011; Ponti+ 2019)
* Characterizing, measuring, and understanding this cross-language variation is
  often the first step towards the development of more robust multilingual NLP
  (O’Horan+ 2016; Bjerva+ 2019; Ponti+ 2019). For
  * eg selecting suitable source languages for cross-lingual transfer of
    dependency parsers or POS taggers
    (Naseem+ 2012; Ponti+ 2018; de Lhoneux+ 2018)
  * eg2: MT
    with all other factors kept similar (e.g., training data size, domain sim),
    the quality of machine translation also depends heavily on the properties
    and language proximity of the actual language pair (Kudugunta+ 2019).
* we proposing a suite of spectral-based measures that capture the degree of
  isomorphism (Søgaard+ 2018) between the monolingual embedding spaces of two
  * hypothesis is that the potential to align two embedding spaces and learn
    transfer functions can be estimated through the differences between the
    monolingual embeddings’ spectra. We therefore discuss
  * representative statistics of the spectrum of an embedding space (i.e., the
    set of the singular values of the embedding matrix), such as its
    condition number or its sorted list of singular values. We then
  * derive measures for the isomorphism between two embedding spaces based on
    these statistics.

* empirical evaluation with a range of cross-lingual NLP tasks. This analysis
  * our proposed spectrum-based isomorphism measures better correlate and
    explain greater variance
    than previous isomorphism measures (Søgaard+ 2018; Patra+ 2019). In
  * also outperform standard approaches based on ling info (Littell+ 2017)

The first part of our empirical analysis targets
bilingual lexicon induction (BLI), a cross-lingual
task that received plenty of attention, in particular
as a case study to investigate the impact of cross-
language variation on task performance (Søgaard
et al., 2018; Artetxe+ 2018). Its popularity
stems from its simple task formulation and reduced 
resource requirements, which makes it widely ap-
plicable across a large number of language pairs
(Ruder+ 2019b).

Prior work has empirically verified that for some
language pairs BLI performs remarkably well, and
for others rather poorly (Søgaard+ 2018; Vulić
et al., 2019). It attempted to explain this variance
in performance by grounding it in the differences
between the monolingual embedding spaces them-
selves. These studies introduced the notion of ap-
proximate isomorphism, and argued that it is eas-
ier to learn a mapping function (Mikolov+ 
2013; Ruder+ 2019b) between language pairs
whose embeddings are approximately isomorphic,
than between languages pairs without this prop-
erty (Barone, 2016; Søgaard+ 2018). Sub-
sequently, novel methods to quantify the degree
of isomorphism were proposed, and were shown
to significantly correlate with BLI scores (Zhang
et al., 2017; Søgaard+ 2018; Patra+ 2019).

In this work, we report much higher correlations
with BLI scores than existing isomorphism mea-
sures, across a variety of state-of-the-art BLI ap-
proaches. While previous work was limited only
to coarse-grained analysis with a small number of
language pairs (i.e., < 10), our study is the first
large-scale analysis that is focused on the relation-
ship between quantifiable isomorphism and BLI
performance. Our analysis covers hundreds of di-
verse language pairs, focusing on typologically,
geographically and phylogenetically distant pairs
as well as on similar languages.

We further show that our findings generalize be-
yond BLI, to cross-lingual transfer in dependency
parsing and POS tagging, and we also demonstrate
strong correlations with machine translation (MT)
performance. Finally, our spectral-based measures
can be combined with typologically driven lan-
guage distance measures to achieve further cor-
relation improvements. This indicates the comple-
mentary nature of the implicit knowledge coded
in continuous semantic spaces (and captured by
our spectral measures) and the discrete linguistic
information from typological databases (captured
by the typologically driven measures).
