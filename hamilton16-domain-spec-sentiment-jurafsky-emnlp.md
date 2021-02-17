William L. Hamilton, Kevin Clark, Jure Leskovec, and Dan Jurafsky
Inducing Domain-Specific Sentiment Lexicons from Unlabeled Corpora
EMNLP 2016

http://nlp.stanford.edu/projects/socialsent
inferred lexicons along with code for SentProp and all methods evaluated

summarized in Buechel+ 2018

# Abstract

* label propagation framework ... using small sets of seed words
* our approach achieves state-of-the-art performance
* our purely corpus-based approach outperforms methods that rely on WordNet
* we induce and release
  * historical sentiment lexicons for 150 years of English
    * more than 5% of sentiment-bearing [English words] switched polarity
      during the last 150 years, and the community-specific lexicons highlight
  * community-specific sentiment lexicons for 250 online communities, Reddit
    * sentiment varies drastically between different communities

# 1 Intro

* e.g
  * _soft_ varies drastically between [sports] and [toy animals] (Figure 1)
  * _Terrific_: once was highly negative ; now synonomous with good (Figure 2)
* SentProp is designed to
  * maintain accurate performance when using modestly-sized domain-specific
    corpora (~ 10^7 tokens), and it
  * provides confidence scores along with the learned lexicons
* contributions of this work are:
  1. A state-of-the-art sentiment induction algorithm, combining high-quality
     word vector embeddings with an intuitive label propagation approach
  2. A novel bootstrap-sampling framework for inferring confidence scores
  3. Two large-scale studies: how sentiment depends on ... social and historicl
    1. We induce community-specific sentiment lexicons for the largest 250
       “subreddit” communities on the social-media forum Reddit, revealing
    2. We induce historical sentiment lexicons for 150 years of English,
       revealing that > 5% of words switched polarity during this time.  To the
       years and hundreds of user-defined online communities.  All of the

# 2 Related work ... on inducing sentiment lexicons

* Corpus-based approaches use seed words and patterns in unlabeled corpora
  * patterns may rely on
    * syntactic structures
      (Hatzivassiloglou and McKeown, 1997; Thelen and Riloff, 2002; Widdows and
      Dorow, 2002; Jijkoun+ 2010; Rooth+ 1999)
      but e.g., in social media lacking usual grammatical structures). Other
    * general co-occurrence
      (Turney and Littman, 2003; Riloff and Shepherd, 1997;
      Igo and Riloff, 2009)
  * Often ... exploit distant-supervision signals (review scores, emoticons)
    specific to certain domains
    (Asghar+ 2015; Blair-Goldensohn+ 2008; Bravo-Marquez+ 2015; Choi and
    Cardie, 2009; Severyn and Moschitti, 2015; Speriosu+ 2011; Tang+ 2014)
  * [unsupervised] is to construct lexical graphs using word co-occurrences and
    then to perform some form of label propagation over these graphs
    (Huang+ 2014; Velikovich+ 2010)
  * transformations of word-vector representations in order to induce
    sentiment lexicons (Rothe+ 2016)
  * Fast+ (2016) combine word vectors with crowdsourcing to produce
    domain-general topic lexicons
* Dictionary-based approaches use hand-curated lexical resources—usually
  WordNet (Fellbaum, 1998)—in order to propagate sentiment from seed labels
  (Esuli and Sebastiani, 2006; Hu and Liu, 2004; Kamps+ 2004; Rao and
  Ravichandran, 2009; San Vicente+ 2014; Takamura+ 2005; Tai and Kao, 2013)
  There is an implicit consensus that dictionary-based approaches [are] clean,
  * not applicable in domains lacking such a resource (e.g., historical)
* Most previous work seeks to enrich or enlarge existing lexicons, emphasizing
  recall over precision (San Vicente+ 2014; Velikovich+ 2010; Qiu+ 2009)
  * motivated by [e.g.] web-advertising (Velikovich+ 2010)
* this work
  * goal [is to induce high-quality lexicons that are] specific social[ly]
  * Algorithmically, our approach is inspired by Velikovich+ (2010)
    * We extend this work by
      * incorporating high-quality word vector embeddings,
      * a new graph construction approach, an
      * alternative label propagation algorithm, and
      * a bootstrapping method to obtain confidences. Together these

# 3 Framework 3

* Our framework, SentProp, is designed to meet four key desiderata:
  1. Resource-light: without massive corpora or hand-curated resources.
  2. Interpretable: small seed sets [to] avoid ambiguity in sentiment values.
  3. Robust: Bootstrap-sampled standard dev provide a measure of confidence.
  4. Out-of-the-box: Does not rely on domains specific signals
* two steps
  * lexical graph from unlabeled corpora and
  * propagating sentiment labels over this graph.

## 3.1 Constructing a lexical graph

### Distributional word embeddings—The first step in our approach is building

### Defining the graph edges—Given a set of word embeddings

* nearest k neighbors within the semantic space (cosine-similarity)

## 3.2 Propagating polarities from a seed set

## 3.3 Bootstrap-sampling for robustness

# 7 Conclusion 10
