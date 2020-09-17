Ivan Vulić, Nikola Mrkšić and Anna Korhonen
Cross-Lingual Induction and Transfer of Verb Classes
  Based on Word Vector Space Specialisation
acl 2017

# Abstract

* Existing approaches to automatic VerbNet-style verb classification are 
  ... limited to languages with mature NLP pipelines
* we propose a novel cross-lingual transfer method for 
  inducing VerbNets for multiple languages
  * the first study [on how] embeddings can be applied to this ... task
* Our method uses
  * cross-lingual translation pairs to tie each of the six target languages
    into a bilingual vector space with English,
  * jointly specialising the representations to encode the relational
    information from English VerbNet
  * A standard clustering algorithm is then run
* new state-of-the-art verb classification performance
  across all six target languages explored in this work

# Intro

* expressing ... relational information among [the participants of an event] 
  (Jackendoff, 1972; Gruber, 1976; Levin, 1993)
* VerbNet has been used to support
  * SRL (Swier and Stevenson, 2004; Giuglea and Moschitti, 2006)
  * semantic parsing (Shi and Mihalcea, 2005)
  * word sense disambiguation (Brown+ 2011)
  * discourse parsing (Subba and Di Eugenio, 2009)
  * information extraction (Mausam+ 2012)
  * text mining applications (Lippincott+ 2013; Rimell+ 2013)
  * research into human language acquisition (Korhonen, 2010)
* languages such as
  * Spanish and Catalan (Aparicio+ 2008),
  * Czech (Pala and Horák, 2008), and
  * Mandarin (Liu and Chiang, 2008)
* development [is] time consuming (Sun+ 2010; Scarton+ 2014)
* [automatic] methods rely on ... sophisticated language-specific resources
  (Joanis+ 2008; Sun+ 2010; Falk+ 2012)
  * ranging from accurate parsers to pre-compiled subcategorisation frames
    (Schulte im Walde, 2006; Li and Brew, 2008; Messiant, 2008)
* VerbNet-style classification has a strong cross-lingual element
* English VerbNet has high [manual translatability across typologically]
  diverse languages (Majewska+ 2017)
* [embedding] coalesces [egyesít] fine-grained syntactic-semantic relations 
  into a broad relation of semantic relatedness (e.g., coffee:cup)
  (Hill+ 2015; Kiela+ 2015)
  * adverse effect when word embeddings are used in downstream tasks such as
    * spoken language understanding (Kim+ 2016a,b) or
    * dialogue state tracking (Mrkšić+ 2016, 2017a)
* resources
  * general-purpose cross-lingual resources such as
    BabelNet (Navigli and Ponzetto, 2012; Ehrmann+ 2014)
  * bilingual dictionaries such as PanLex (Kamholz+ 2014)
* we explore three important questions in this paper:
  `q1` induction of VerbNet-style verb classes
    [from embeddings] across different languages
    * vector space specialisation [i.e. retrofitting] using
    BabelNet or PanLex, and (English) VerbNet
    * specialisation (Faruqui+ 2015; Mrkšić+ 2016),
    * our procedure: two sets of linguistic constraints:
      1. (translation) links between languages extracted from BabelNet `q2`
        * cross-lingual vector space
      2. the available VerbNet annotations for a resource-rich language `q3`
* results indicate that
  1. cross-lingual connections yield improved verb classes
    across all six target languages (thus answering Q2)
  * by propagating the VerbNet-style information from [English
    to] ... Italian, Croatian, Polish, Finnish
    * new state-of-the-art verb classification performance for all six languages
     * F-1 score from prior work from 0.55 to 0.79 for French, and
     * from 0.43 to 0.74 for Brazilian Portuguese

# Methodology: Specialising for VerbNet

## Motivation: Verb Classes and VerbNet

* VerbNet is a hierarchical, domain-independent, broad-coverage verb lexicon
  based on Levin’s classification and taxonomy of English (EN) verbs
  (Levin, 1993; Kipper, 2005). Verbs are grouped into classes
* The basic meaning components underlying verb classes are said to be
  cross-linguistically valid (Jackendoff, 1992; Merlo+ 2002)
  * Paola Merlo, Suzanne Stevenson, Vivian Tsang, and Gianluca Allaria
    ACL 2002
    A multilingual paradigm for automatic verb classification
* across languages has been limited by the fact that few languages boast
  * completely manually from scratch, aiming to
    capture properties specific to the language in question, e.g
    * Spanish and Catalan (Aparicio+ 2008),
    * Czech (Pala and Horák, 2008), and
    * Mandarin (Liu and Chiang, 2008). Other VerbNets were created
  * semi-automatically, with the help of other lexical resources, e.g., for
    * French (Pradet+ 2014) and
    * Brazilian Portuguese (Scarton and Aluısio, 2012).  These approaches
  * automatic methods have been developed, e.g., for
    * French (Sun+ 2010; Falk+ 2012) and
    * Brazilian Portuguese (Scarton+ 2014), with insufficient accuracy
* our method does not require any parsed data or manual annotations
  * encodes the cross-linguistic validity of Levin-style verb classifications
    into the vector-space specialisation framework (Sect. 2.1) driven by
    linguistic constraints. A standard
  * clustering algorithm is then run
    on top of the VerbNet-specialised representations ... (Sect. 2.2)

## 2.1 Vector Space Specialisation

### Specialisation Model

* state-of-the-art specialisation model ... termed PARAGRAM (Wieting+ 2015)
  * ATTRACT constraints ... word pairs standing in desirable lexical relations;
    1. same VerbNet class, e.g. (`en_transport`, `en_transfer`)
    2. cross-lingual synonymy
* Cross-lingual constraints such as (`pl_wojna`, `it_guerra`) are
  extracted from BabelNet (Navigli and Ponzetto, 2012), a
    * large-scale resource which groups words into cross-lingual BABEL synsets
    * currently available for 271 languages). The
    * wide and steadily growing coverage of languages
* transfer [is] independent of the ... information source,
  * we also experiment with ... PanLex (Kamholz+ 2014), which was
  * used in ... cross-lingual word vector spaces (Duong+, 2016; Adams+, 2017)
  * around 1,300 language varieties with over 12 million expressions
* VerbNet classes [contain verbs] in a variety of lexical relations,
  including synonyms, antonyms, troponyms, hypernyms

## 2.2 Clustering

* we employ the MNCut spectral clustering algorithm (Meila and Shi, 2001),
  * Following Brew and Schulte im Walde, (2002); Sun+ (2009+)
  * applicability in similar NLP tasks
    * (Chen+ 2006; von Luxburg, 2007; Scarton+ 2014, i.a.)
* estimate the number of clusters K Clust
  using the self-tuning method of Zelnik-Manor and Perona (2004)
  * Again, following prior work (Sun+ 2010, 2013)
  * based on the eigenvector structure of the word similarity matrix

# 3 Experimental Setup 5

* FR, PT, IT, PL, HR, and, FI

## gold standard (Sun+ 2010): these have been developed for

* FR (Sun+ 2010),
* PT (Scarton+ 2014),
* IT, PL, HR, and FI (Majewska+ 2017)
* based on the EN gold standard of Sun+ (2008)

# 4 Results 7

### Starting Source Vector Space Fig. 2a

* small but consistent gains with SGNS-DEPS, which utilises ... dependency
  * (Padó and Lapata, 2007; Levy and Goldberg, 2014)

### Bilingual vs. Multilingual

* The transfer model can operate with more than two languages, effectively
* model relies on more constraints
  * [on] FR _and_ IT, results with XLing improve with more languages
  * combining PL
    * with the Romance languages degrades the performance, while
    * FI surprisingly boosts it slightly
  * additional languages do not lead to clear improvements
    * procedure becomes dominated by cross-lingual constraints

### Clustering Algorithm

* K-means clustering [results are] lower
* hierarchical agglomerative clustering with Ward’s linkage (Ward, 1963),
  * on par with spectral clustering

### Verb Classification vs. Semantic Similarity

* correlation between verb classification and semantic similarity
  (Baker+ 2014)
* recent similarity evaluation set (SimVerb-3500, Gerz+ 2016)
* cross-lingual synonymy constraints are useful for both relationship types
* inclusion of VerbNet information ... deteriorates EN similarity scores
* VerbNet-style class membership is definitely
  not equivalent to pure semantic similarity captured by SimVerb

## 4.1 Further Discussion and Future Work

* verb polysemy
  * [recent] polysemy-aware verb classification models for English
    (Kawahara+ 2014; Peterson+ 2016)
  * lack of polysemy-aware evaluation sets in other languages
  * multisense/prototype word representations (...Pilehvar and Collier, 2016)
* other structured lexical resources available in English
  such as FrameNet (Baker+ 1998), PropBank (Palmer+ 2005), and
  VerbKB (Wijaya and Mitchell, 2016)
* porting the approach to other typologically diverse languages and 
  truly low-resource settings
* other distributional spaces, e.g. (Melamud+ 2016)
  * Oren Melamud, Jacob Goldberger, and Ido Dagan
    Context2vec: Learning generic context embedding with bidirectional LSTM
    CoNLL 2016
