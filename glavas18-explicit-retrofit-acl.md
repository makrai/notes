Goran Glavaš and Ivan Vulić
Explicit Retrofitting of Distributional Word Vectors
acl 2018

https://github.com/codogogo/explirefit

# Abstract

* Semantic specialization of distributional word vectors,
  referred to as retrofitting
* Existing retrofitting models specialize only the vectors of words from
  the constraints
* In this work
  * we transform external lexico-semantic relations into training examples
  * explicit retrofitting model (ExRf)
  * learn a global specialization function and
    specialize the vectors of words unobserved in the training data as well
* eval
  * intrinsic word similarity evaluation and
  * two downstream tasks – lexical simplification and dialog state tracking
  * specialize vector spaces of new languages (i.e., unseen in the training)
    by coupling ExRf with shared multilingual distributional vector spaces

# 1 Intro

* the usefulness of algebraic word vector spaces has been shown in tasks
  * Collobert+ 2011;
  * Chen and Manning, 2014; dependency
  * Melamud+ NAACL 2016, The role of context types and dimensionality
* purely distributional knowledge,
  fusing semantic similarity with other types of semantic relatedness
  * Felix Hill, Roi Reichart, and Anna Korhonen
    SimLex-999: Evaluating semantic models with (genuine) similarity estimation
    Computational Linguistics 2015
  * Roy Schwartz, Roi Reichart, and Ari Rappoport. 2015
    Symmetric pattern based word embeddings for improved word similarity pred
    CoNLL 2015
  * Wen-tau Yih, Geoffrey Zweig, and John C. Platt.  2012
    Polarity inducing latent semantic analysis
    EMNLP-CoNLL 2012
  * Saif M. Mohammad, Bonnie J. Dorr, Graeme Hirst, and Peter D. Turney. 2013
    Computing lexical contrast
    Computational Linguistics 2013
  * For example, it is difficult to discern synonyms from antonyms
  * negative effect on NLP applications like
    text simplification and statistical dialog modeling
    * Glavaš and Štajner, ACL 2015 lexical simplification corpora?
    * Faruqui+ NAACL 2015 retrofitting
    * Sujay Kumar Jauhar, Chris Dyer, and Eduard H. Hovy
      Ontologically grounded multi-sense representation learning for semantic v
      NAACL 2015
    * Mrkšić+ 2016 NAACL counter-fitting
    * Kim+ SLT 2016b Intent detection using semantically enriched embeddings
* resources, such as
  * WordNet (Fellbaum, 1998)
  * Paraphrase Database (PPDB, Ganitkevitch+ 2013; Pavlick+ 2015)
  * BabelNet (Navigli and Ponzetto, 2012)
  * FrameNet (Baker+ 1998)
  * morphological lexicons (Cotterell+ 2016)
  * simple handcrafted linguistic rules (Vulić+ 2017b)
* for a particular lexical relation, e.g.,
  * synonymy (Faruqui+ 2015; Mrkšić+ 2017) or
  * hypernymy (Glavaš and Ponzetto, 2017)
* two prominent ways for external constraints
  * joint specialization models
    integrating the constraints into the distributional learning objective
    (Yu and Dredze, 2014; Kiela+ 2015; Nguyen+ 2016)
  * post-processing models fine-tune distributional vectors retroactively
    * e.g
      * Faruqui+ 2015
      * Sujay Kumar Jauhar, Chris Dyer, and Eduard H. Hovy
        Ontologically grounded multi-sense representation learning for semic
        NAACL 2015
      * Rothe and Schütze, 2015
      * Wieting+ 2015
      * Nguyen+ 2016 antonym
      * Mrkšić+ 2016 counter
      * Mrkšić+ 2017 cross-lingual
    * in general, outperform the former (Mrkšić+ 2016)
    * can be applied to arbitrary distributional spaces but
    * vectors of all other (unseen) words remain intact
* In this paper, we propose a new approach that unifies the strengths
  * termed explicit retrofitting (ExRf)
  * applicable to arbitrary embeddings
  * learns an explicit global specialization function
  * directly learn a specialization function in a supervised setting
  * implemented as a deep feedforward neural architecture
* We show that the proposed ExRf approach yields considerable gains
  * word similarity evaluation on standard benchmarks
    * SimLex-999 (Hill+ 2015); SimVerb-3500 (Gerz+ 2016),
  * two downstream tasks – lexical simplification and dialog state tracking
* coupling the ExRf model with shared multilingual embedding spaces
  * Mikolov+ 2013a;
  * Samuel L. Smith, David H.P. Turban, Steven Hamblin, and Nils Y. Hammerla
    Offline bilingual word vectors, orthogonal transformations and the
    inverted softmax
    ICLR 2017
  * we can also specialize distributional spaces for unseen languages

# 2 Related Work

* vector space specialization for downstream tasks
  * dialog state tracking (Mrkšić+ 2017; Vulić+ 2017b)
  * spoken language understanding (Kim+ 2016b,a)
  * lexical entailment
    (Nguyen+ 2017; Glavaš and Ponzetto, 2017; Vulić and Mrkšić, 2017)
  * lexical contrast modeling (Nguyen+ 2016)
  * cross-lingual transfer of lexical resources (Vulić+ 2017a)
* two categories:
  * joint specialization methods, and
  * post-processing (i.e., retrofitting) methods

### Joint Specialization Models

* integrate external constraints into CBOW, Skip-Gram (Mikolov+ 2013b), or
  Canonical Correlation Analysis (Dhillon+ 2015)
* modify the prior or the regularization of the original objective
  (Yu and Dredze, 2014; Xu+ 2014; Bian+ 2014; Kiela+ 2015) or
  integrate the constraints directly into the objective
  (Liu+ 2015; Ono+ 2015; Bollegala+ 2016; Osborne+ 2016; Nguyen+ 2016, 2017)
* lower performance compared to retrofitting methods (Mrkšić+ 2016)
* tied to the distributional objective

### Post-Processing Models aka.~the retrofitting family

* inject lexical knowledge from external resources into arbitrary pretrained wv
* both similarity and dissimilarity (Mrkšić+ 2016; Mrkšić+ 2017; Vulić+ 2017b)
* Our explicit retrofitting framework brings together desirable properties
  * not require adaptation to the underlying model and re-training
  * both similarity and dissimilarity constraints
  * specializes the full vocabulary of the original distributional space

# 4 Experimental Setup 5

## Distributional Vectors

## Linguistic Constraints

* We experiment with the sets of linguistic constraints used in prior work
  (Zhang+ 2014; Ono+ 2015)
  * extracted from WordNet (Fellbaum, 1998) and Roget’s Thesaurus (Kipfer, 2009)
  * 1,023,082 synonymy word pairs and 380,873 antonymy word pairs
  * only 57,320 unique words in all synonymy and antonymy constraints combined,
  * only 15.3% or less of the words from constraints are found in the embeds

# 5 Results and Discussion 6

## 5.1 Word Similarity

### Evaluation Setup

* two settings
  * lexically disjoint, we remove all linguistic constraints that contain
    any of the words found in SimLex or SimVerb
  * lexical overlap, we retain the constraints containing SimLex or SimVerb
  * comparison: the SOTA local retrofitting model Attract-Repel (Mrkšić+ 2017)

### Results

* The ExRf model with the contrastive objective (ExRf-CNT) yields better
  performance on average
  than the one using the simpler square distance objective (ExRf-MSD)

### Analysis

* We examine in more detail the performance of the ExRf model with respect to
  * the type of constraints used for training the model:
    synonyms and antonyms, only synonyms, or only antonyms and
  * the extent to which we retain the topology of the original space
    (i.e., with respect to the topological regularization factor λ)
    * The best performance is obtained for λ = 0.3

## 5.2 Language Transfer 7

### Evaluation Setup

* We use the mapping model of Smith+ (2017) to induce a multilingual space
  * chosen for its ease of use, readily available implementation, and strong
    comparative results (Ruder+ 2017)
    * Sebastian Ruder, Ivan Vulić, and Anders Søgaard
      A survey of cross-lingual embedding models
      Journal of Artificial Intelligence Research 2018
  * three other languages – German, Italian, and Croatian – along with English
    * the Italian CBOW vectors (Dinu+ 2015)
    * German FastText vectors trained on German Wikipedia (Bojanowski+ 2017)
    * Croatian Skip-Gram vectors trained on HrWaC corpus
      (Ljubešić and Erjavec, 2011)
    * to the Glove-CC English space
* translation pairs needed to learn the projections
  * 4,000 most frequent English words translated with Google Translate
* evaluate on the respective SimLex-999 dataset for each language
  (Leviant and Reichart, 2015; Mrkšić+ 2017)

### Results, Table 3

* The more sophisticated contrastive ExRf-CNT model variant again outperforms the
  simpler ExRf-MSD variant, and it does so for all three languages

## 5.3 Downstream Tasks 8

### 5.3.1 Lexical Text Simplification

* Light-LS lexical simplification algorithm of Glavaš and Štajner (2015)
* candidate words are ranked according to several measures of simplicity

#### Evaluation Setup

* LS dataset crowdsourced by Horn+ (2014)
* two evaluation metrics from prior work (Horn+ 2014; Glavaš and Štajner, 2015)
  * accurracy is the ratio of correct simplifications among indicated complex
  * change (C): replaced word among indicated complex words

### 5.3.2 Dialog State Tracking

* dialog state tracking (DST, Henderson+ 2014; Williams+ 2016)
* typically the first component of a dialog system pipeline (Young, 2010),
* capturing user’s goals and updating the dialog state at each dialog turn
* discerning similarity from relatedness is crucial in DST
  (should not recommend an “expensive pub in the south”
  when asked for a “cheap bar in the east”)

#### Evaluation Setup

* we employ the Neural Belief Tracker (NBT), a DST model
  * makes inferences purely based on pre-trained word vectors (Mrkšić+ 2017)
* utterance and context representations
* the Wizard-of-Oz (WOZ) v2.0 dataset (Wen+ 2017; Mrkšić+ 2017)
* joint goal accuracy (JGA), a standard DST evaluation metric

#### Results

# Conclusion

* future work, we will investigate explicit retrofitting methods for
  * asymmetric relations like hypernymy and meronymy
  * other downstream tasks and
  * the zero-shot language transfer
  * more language pairs
