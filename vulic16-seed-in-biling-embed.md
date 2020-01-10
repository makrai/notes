Ivan Vulić and Anna Korhonen
On the Role of Seed Lexicons in Learning Bilingual Word Embeddings
2016 acl

# Abstract

* bilingual word embedding space (SBWES) is an indispensable resource in a
  variety of cross-language NLP and _IR tasks_
* [an] approach to the SBWES induction is to learn a _mapping function between
  monolingual semantic spaces_, where the mapping critically relies on a seed
  word lexicon used in the learning process. 
* In this work, we 
  * analyze the importance and properties of seed lexicons for the SBWES
    induction across different dimensions (i.e., 
    * lexicon source
    * lexicon size
    * translation method
    * translation pair reliability
  * propose a simple but effective hybrid bilingual word embedding (BWE) 
    * using only highly reliable symmetric translation pairs 
    * from a seed _document-level_ embedding space
  * outperforms benchmarking BWE learning models, all of which use more
    expensive bilingual signals

# Introduction

* embeddings (WEs) ... serving as invaluable features in 
  * Danqi Chen and Christopher D. Manning. 2014 EMNLP
    * A fast and accurate _dependency parser_ using neural networks
  * skip-gram model with negative sampling (SGNS) (Mikolov+ 2013b) is
    * solid and robust performance across a wide variety of semantic tasks
      (Baroni+ 2014; Levy and Goldberg, 2014b; Levy+ 2015).
* bilingual word embeddings (BWEs)
  * differing in the essential requirement of a bilingual signal necessary
    to construct such a SBWES (discussed later in Sect. 2). SBWES may be used
    to support many 
* tasks, e.g., computing 
  * cross-lingual/multilingual semantic word similarity 
    (Faruqui and Dyer, 2014)
  * learning bilingual word lexicons (BLL)
    (Mikolov+ 2013a; Gouws+ 2015; Vulić+ 2016)
  * cross-lingual entity linking 
    (Tsai and Roth, 2016)
  * parsing (Guo+ 2015; Johannsen+ 2015), 
  * machine translation (Zou+ 2013), or 
  * cross-lingual information retrieval 
    (Vulić and Moens, 2015; Mitra+ 2016).
* two desirable properties: 
  * (P1) leverage (large) monolingual training sets 
  * (P2) use as inexpensive bilingual signal
* different BWE models according to these properties 
  * we provide a classification of related work in Sect. 2.1, 
  * the focus of this work is on a popular class of models labeled Post-Hoc
    Mapping with Seed Lexicons (másik felsorolás: 2.1.4)
    * Mikolov+ 2013a
    * Dinu+ 2015
    * Lazaridou+ 2015
      * Angeliki Lazaridou, Georgiana Dinu, and Marco Baroni. 
        2015 ACL
        Hubness and pollution: 
          Delving into cross-space mapping for zero-shot learning
    * Ammar+ 2016 
      * Waleed Ammar, George Mulcaire, Yulia Tsvetkov, Guillaume Lample, Chris
        Dyer, and Noah A. Smith.
      * Massively multilingual word embeddings.  
      * CoRR 2016, abs/1602.01925.
* existing work on this class of models assumes that high-quality training
  _seed lexicons_ are readily available. In reality, little is understood
  regarding what constitutes a high quality seed lexicon, even with
  “traditional” distributional models (Gaussier+ 2004; Holmlund+ 
  2005; Vulić and Moens, 2013).
* [this paper] 
  * relies on an inexpensive seed lexicon of highly reliable word translation
    pairs obtained by a document-level BWE model (Vulić and Moens, 2016) from
    document-aligned comparable data.
  * outperforms state-of-the-art models of (Hermann and Blunsom, 2014b; Gouws
   + 2015) which require sentence-aligned parallel data.

# 2 Learning SBWES using Seed Lexicons

## Related Work: BWE Models and Bilingual Signals

* Upadhyay+ (2016) provide a similar overview of recent bilingual
embedding learning architectures regarding different bilingual signals
required
  * Shyam Upadhyay, Manaal Faruqui, Chris Dyer, and Dan Roth
    Cross-lingual models of word embeddings: An empirical comparison
    ACL 2016
### (Type 1) Parallel-Only: 
* relies on sentence-aligned and/or word-aligned parallel data
*  (Zou+ 2013; Hermann and Blunsom, 2014a; Kočiský+ 2014;
   Hermann and Blunsom, 2014b; Chandar+ 2014)
* expensive bilingual signal (colliding with P2), these models do not leverage
  larger monolingual datasets for training
### (Type 2) Joint Bilingual Training
* jointly optimize two monolingual objectives, with the cross-lingual
  objective acting as a cross-lingual regularizer during training 
* (Klementiev+ 2012; Gouws+ 2015; Soyer+ 2015; Shi et
  al., 2015; Coulmance+ 2015)
* formulation (Luong+ 2015): γ(Mono S +Mono T )+δBi
  * special case of Type 2 models: Setting 
    * γ = 0 reduces Type 2 models to Type 1 models trained solely on parallel
      data, e.g., (Hermann and Blunsom, 2014b; Chandar+ 2014). 
    * γ = 1 results in the models from (Klementiev+ 2012; Gouws+ 
      2015; Soyer+ 2015; Coulmance+ 2015).
* costly parallel data needed
### (Type 3) Pseudo-Bilingual Training
                                                                             !1
* requires document alignments as bilingual signal to induce a SBWES. 
* Vulić and Moens (2016) create a collection of pseudo-bilingual documents by
  merging every pair of aligned documents in training data, in a way that
  preserves important local information: words that appeared next to other
  words within the same language and those that appeared in the same region of
  the document across different languages. This collection is then used to
  train word embeddings with monolingual SGNS from word2vec.  With
  pseudo-bilingual documents, the “context” of a word is redefined as a
  mixture of neighbouring words (in the original language) and words that
  appeared in the same region of the document (in the ”foreign” language)
* exploiting weaker document-level bilingual signals (satisfying P2), but
  unable to exploit monolingual corpora during training (unlike Type 2 or 4)
### (Type 4) Post-Hoc Mapping with Seed Lexicons:
* Mikolov+ 2013a
* Faruqui and Dyer, 2014
  * Manaal Faruqui and Chris Dyer. 
  * 2014 EACL
  * Improving vector space word representations using multilingual correlation
* Dinu+ 2015
* Lazaridou+ 2015
  másik felsorolás az intróban 

## Post-Hoc Mapping with Seed Lexicons: Methodology and Lexicons

* Learning Objectives
  * A standard approach (Mikolov+ 2013a; Dinu+ 2015) is to
    assume a linear map W ∈ R d S ×d T , where a L 2 -regularized
    least-squares error objective (i.e., ridge regression)
  * Another possible objective (found in the zero-shot learning literature)
    is a margin-based ranking loss (Weston+ 2011; Lazaridou+ 
    2015). We omit the results with this objective for brevity, and due to the
    fact that similar trends are observed as with (more standard) linear maps.
* Seed Lexicon Source and Translation Method
  * In this paper, we propose another option: first, we learn the ”first”
    SBWES (i.e., SBWES-1) using another BWE model (see Sect. 2.1), and then
    translate the BNC list [the most frequent words] through SBWES-1 by
    retaining the nearest cross-lingual neighbor y i ∈ V_T for each x i in the
    BNC list which is represented in SBWES-1. The pairs (x i , y i )
    constitute the seed lexicon needed for learning the mapping between
    monolingual spaces, that is, to induce the final SBWES-2.  
  * Although in theory any BWE induction model may be used _to induce
    SBWES-1_, we rely on a document-level Type 3 BWE induction model from
    (Vulić and Moens, 2016), since it requires only document alignments as
    (weak) bilingual signal. The resulting hybrid BWE induction model
    (HYBWE) combines the output of a Type 3 model (SBWES-1) and a Type 4 model
    (SBWES-2).  This seed lexicon and BWE learning variant is called BNC+HYB.
  * Our new hybrid model allows us to also use source language words occurring
    in SBWES-1 sorted by frequency as seed lexicon source, again leaning on
    the intuition that higher frequency phenomena are more reliably translated
    using statistical models. Their translations can also be found through
    SBWES-1 to obtain seed lexicon pairs (x i , y i ). This variant is called
    HFQ+HYB.
  * Another possibility, recently introduced by Kiros+ (2015) for
    vocabulary expansion in monolingual settings, relies on all words shared
    between two vocabularies to learn the mapping. In this work, we test the
    ability and limits of such orthographic evidence in cross-lingual
    settings: seed lexicon pairs are (x i , x i ), where x i ∈ V_S and x i ∈ V
    T .  This seed lexicon variant is called ORTHO.
* Seed Lexicon Size
  * a limited setting with only a few hundred lexicon pairs available (e.g.,
    100--500)
  * inclusion of more seed lexicon pairs [...] even up to 40K-50K
* Translation Pair Reliability
  * symmetry constraint 
    * (Peirsman and Padó, 2010; Vulić and Moens, 2013) : 
    * two words x i ∈ V_S and y i ∈ V S are used as seed lexicon pairs only if
      they are mutual nearest neighbours given their representations in
      SBWES-1. 
    * The two variants of seed lexicons 
      * with only symmetric pairs are BNC+HYB+SYM and HFREQ+HYB+SYM
      * without the symmetry constraint (i.e., BNC+HYB+ASYM and HFQ+HYB+ASYM)
  * 
    sim(x i , y i ) − sim(x i , z i ) > threshold
    sim(y i , x i ) − sim(y i , w i ) > threshold
      where z and w are the second best translation candidates
  * Other (more elaborate) reliability measures exist in the literature 
    * Smith and Eisner, 2007; Tu and Honavar, 2012; Vulić and Moens, 2013
    * but we do not observe any significant gains when resorting to the more
      complex reliability estimates.

# 3 Experimental Setup

* Test Sets 
  * standard 1,000 ground truth one-to-one translation pairs built for 
    * three language pairs: Spanish (ES)-, Dutch (NL)-, Italian (IT)-English (EN) 
    * by Vulić and Moens (2013).  The dataset is 
    * generally considered a benchmarking test set for BLL models that learn
      from non-parallel data, and is available online. 
  * also experimented with two other benchmarking BLL test sets 
    * (Bergsma and Durme, 2011; Leviant and Reichart, 2015) observing a 
    * very similar relative performance of all the models in our comparison.  
* Evaluation Metrics 
  * standard Top 1 accuracy (Acc 1 ) metric 
    (_Gaussier+ 2004_; Mikolov+ 2013a; Gouws+ 2015). 
* Baseline Models
  * compare with a representative 
    * Type 2 model, we opt for the BilBOWA model of Gouws+ (2015) 
      * due to its 
        * solid performance and robustness in the BLL task when trained on
          general-domain corpora such as Wikipedia (Luong+ 2015), its
        * reduced complexity reflected in fast computations on massive datasets,
        * as well as its public availability. 6 In short, BilBOWA 
      * combines the adapted SGNS for monolingual objectives together with a
        cross-lingual objective that minimizes the L 2 -loss between the
        bag-of-word vectors of parallel sentences.
    * Type 1 model from sentence-aligned parallel data called BiCVM
      * Hermann and Blunsom, 2014b
    * SGNS-based BWE model with the BNC+GT seed lexicon is taken as a baseline
      Type 4 model (Mikolov+ 2013a). 7
* Training Data and Setup
  * 100K most frequent words in each language for all models
  * monolingual WE spaces, 
    * two monolingual SGNS models were trained on the cleaned and tokenized
      Wikipedias from the Polyglot website (Al-Rfou+ 2013) using SGD
      with a global learning rate of 0.025. For 
    * BilBOWA, as in the original work (Gouws+ 2015), the bilingual
      signal for the cross-lingual regularization is provided by the first
      500K sentences from Europarl.v7 (Tiedemann, 2012). We use SGD with a
      global rate of 0.15. 8 The 
  * window size is varied from 2 to 16 in steps of 2, and the best scoring
    model is always reported in all comparisons.
  * biling
    * BWESG was trained on the cleaned and tokenized document-aligned
      Wikipedias available online 9
    * SGD on pseudo-bilingual documents with a global rate 0.025
    * BiCVM, we use the tool released by its authors 10 and train on the whole
      Europarl.v7 for each language pair: we train an additive model, with
      hinge loss margin set to d (i.e., dimensionality) as in the original
      paper, batch size of 50, and noise parameter of 10. All BiCVM models are
      trained with 200 iterations.  
  * For all models, we obtain BWEs with 
    * d = 40, 64, 300, 500, but we report only results with 300-dimensional
      BWEs as similar trends were observed with other d-s.  
    * Other parameters are: 15 epochs, 15 negatives, subsampling rate 1e − 4.  
    
# 4 Results and Discussion

## Exp. I: Standard BLL Setting
* the best reported scores using the more constrained symmetric
  BNC/HFQ+HYB+SYM lexicon variants are higher
## Exp. II: Lexicon Size
* HFQ+HYB+SYM is the strongest BWE model overall
* The two models with the symmetry constraint display a particularly strong
  performance with settings relying on scarce resources
## Exp. III: Translation Pair Reliability
* we vary the threshold value THR (see sect. 2.2) in the HFQ+HYB+SYM variant
  with the following values in comparison: 0.0 (None), 0.01, 0.025, 0.05,
  0.075, 0.1.
* improvements, however, are not statistically significant.
## Exp. IV: Another Task: Suggesting Word Translations in Context (SWTC) 
                                                                             !3
* recently proposed by Vulić and Moens (2014).
* Given an occurrence of a polysemous word `w ∈ V_S` , the SWTC task is to
  choose the correct translation in the target language of that particular
  occurrence of w from the given set `T C(w) = {t 1 , . . . , t tq } ⊆ V_T`
  of its tq possible translations/meanings.
* it is related to
  * [SWTC,] an extended cross-lingual variant of the task proposed by Huang
   + (2012) which evaluates monolingual context-sensitive semantic
    similarity of words in sentential context
  * cross-lingual lexical substitution (Mihalcea+ 2010).
* framework 
  * proven to yield excellent results with BWEs in the SWTC task 
    (Vulić and Moens, 2016)
  * context bag Con(w) = {cw 1 , . . . , cw r } is obtained by harvesting all
    r words that occur with w in the sentence.
  * vector representation of Con(w) is the d-dimensional embedding computed by
    aggregating over all word embeddings for each cw j ∈ Con(w) using 
    * standard addition as the compositional (Mitchell and Lapata, 2008) 
    * proven a robust choice (Milajevs+ 2014):
  * cos(Con(w), t j ) 
* evaluation set consists of 
  * 360 sentences for 15 polysemous nouns (24 sentences for each noun) 
  * in each of the three languages: Spanish, Dutch, Italian, along with the
  * single gold standard single word English translation

# 5 Conclusions and Future Work

other context types inspired by recent work in the monolingual settings 
  * Omer Levy and Yoav Goldberg
    * Dependency-based word embeddings
    * In ACL, 2014a
  * Oren Melamud, David McClosky, Siddharth Patwardhan, and Mohit Bansal
    * The role of context types and dimensionality in learning word embeddings
    * In NAACL-HLT 2016
