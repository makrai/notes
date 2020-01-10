Dependency-Based Word Embeddings
Omer Levy and Yoav Goldberg
acl 2014

`https://levyomer.wordpress.com/2014/04/25/dependency-based-word-embeddings/`
  * Our software, allowing for experimentation with arbitrary contexts
  * the embeddings described in this paper

#Abstract

* dependency-based embeddings are less topical and
  exhibit more functional similarity than the original skip-gram embeddings

#1 Intro

* [spectrum] of methods of deriving word representations
  * words ... clusters based on their contexts
    (Brown et al., 1992; Uszkoreit and Brants, 2008)
  * very high dimensional but sparse vectors in which
    each entry is a measure of the association between the word and a [context]
    * survey: Turney and Pantel, (2010); Baroni and Lenci, (2010)
    * In some works, the dimensionality of the sparse ... vectors is reduced,
      * SVD (Bullinaria and Levy, 2007) or
      * LDA (Ritter et al., 2010; Séaghdha, 2010; Cohen et al., 2012)
  * dense vectors that are derived by various training methods inspired from
    neural-network LM (Bengio et al., 2003; Collobert and Weston, 2008;
    Mnih and Hinton, 2008; Mikolov et al., 2011; Mikolov et al., 2013b)
    * have been shown to perform well across a variety of tasks (Turian et al.,
      2010; Collobert et al., 2011; Socher et al., 2011; Al-Rfou et al., 2013)
* In this work, we generalize the SKIP-GRAM model [to arbitrary] contexts
  * syntactic contexts that are derived from ... dependency parse-trees
  * following work in sparse vector-space models
    (Lin, 1998; Padó and Lapata, 2007; Baroni and Lenci, 2010)
  * produce noticeably different embeddings, and ...  similarities
    * the “original” SKIP-GRAM model yield broad topical similarities, while
    * the dependency-based contexts yield
      more functional similarities of a cohyponym nature
  * qualitative and quantitative analysis (Section 4)
* [iterpetability]
  * In Section 5 we show that the SKIP-GRAM model does allow for some
    introspection by querying it for contexts that are “activated by” a target
    word
  * this is the first work to suggest such an analysis of discriminatively-
    trained word-embedding models

#3. Embedding with Arbitrary Contexts

* the number of context-types can be substantially larger than the number of
  word-types
* parsing to syntactic dependencies
  (Goldberg and Nivre, 2012; Goldberg and Nivre, 2013)
* Relations that include a preposition are “collapsed” prior to context
  extraction, by directly connecting the head and the object of the
  preposition, and subsuming the preposition itself into the dependency label

#4. Exper

* For DEPS, the corpus was
  * [POS] tagged ... using the Stanford tagger (Toutanova et al., 2003) and
  * parsed into labeled Stanford dependencies (de Marneffe and Manning, 2008)
    using an implementation of the parser described in (Goldberg and Nivre,
    2012)
  * 900,000 distinct syntactic contexts

#4.1 Qual

* Turney (2012) described this distinction as domain similarity versus
  functional similarity

#4.2 Quant

* WordSim353 dataset (Finkelstein et al., 2002; Agirre et al., 2009)
  * pairs of similar words that reflect either relatedness (topical
    similarity) or similarity (functional similarity) relations
* task is to rank the similar pairs in the dataset above the _related_ ones
* DEPS perform dramatically worse than BOW contexts on analogy tasks as in
  (Mikolov et al., 2013c; Levy and Goldberg, 2014)

#5 Model Introspection

* the most discriminative syntactic contexts ... are not associated with
  subjects or objects of verbs (or their inverse), but rather with
  conjunctions, appositions, noun-compounds and adjectivial modifiers
* the collapsed preposition relation is very useful (e.g. for capturing the
  school aspect of hogwarts). The 
* conjunction contexts
  * e.g. superman/conj for batman and singing/conj for dancing, 
  * may explain the functional similarity observed in Section 4:
  * enforce their conjuncts to share the same semantic types and inflections
* In the future, we hope that insights from such model introspection will allow
  * develop better contexts, by focusing on conjunctions and prepositions
  * figure out why the subject and object relations are absent

#6 Conclu

further research into ... possibly task-specific, embedded representations
