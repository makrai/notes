Yonatan Belinkov, L Màrquez, H Sajjad, Nadir Durrani, Fahim Dalvi, James Glass
Evaluating Layers of Representation in NMT on POS and Semantic Tagging Tasks
IJCNLP 2017

Our code is available at https://github.com/ boknilev/nmt-repr-analysis

#Abstract

* Our quantitative analysis yields interesting insights regarding
  * higher layers are better at learning semantics while
  * lower layers tend to be better for part-of-speech tagging. We also observe
  * little effect of the target language on source-side representations,
    especially with higher quality NMT models
    * keeping the English source-side fixed

#1 Introduction

* exploring what kind of linguistic information such models learn on
  * morphological (Vylomova+ 2016; Belinkov+ 2017) and
  * syntactic levels (Shi+ 2016; Sennrich, 2017)
* [different] layers in the neural MT network learn different kinds of info
  * Shi+ (2016) and Belinkov+ (2017) found that representations from
    * lower layers of the NMT encoder [pred] POS and morphological tags,
    * higher layer representations are more predictive of more global syntax
* we take a first step towards ...  semantics. We evaluate NMT representations
  * understanding semantics learned in NMT can facilitate using semantic
    info for improving NMT systems, as previously shown for non-neural MT
    (Chan+ 2007; Liu and Gildea, 2010; Gao and Vogel, 2011; Wu+ 2011;
    Jones+ 2012; Bazrafshan and Gildea, 2013, 2014)
* dataset recently introduced by Bjerva+ (2016) [for] lexical semantics
  * assign each word with a tag representing a semantic class. The
  * classes capture nuanced meanings that are ignored in most POS tag schemes
  * e.g. proximal and distal demonstratives (e.g. this and that) are typ-
  * proper nouns type (geopolitical entity, organization, person, and location)
  * reflexive or emphasizing functions of ... _myself, yourself, and herself_
* can be important for producing an accurate translation.  For instance,
  * e.g. Spanish with the reflexive pronoun _se_, whereas intensifier _misma_
* repr assess methodology from Shi+ (2016) and Belinkov+ (2017). We first train
  [same as Belinkov (2017 morph)]
* interesting insights regarding representation learning in NMT:
  * Consistent with previous work, we find that
    * lower layer representations are usually better for POS tagging.  However,
    * higher layers of the NMT encoder are better at capturing [word lev sem]
      * especially true with tags that are more semantic in nature such as
        discourse functions and noun concepts
* effect of target language diminishes as the size of data increases
  * In contrast to previous work

# 2 Methodology

# 3 The data and experimental setup. In

##3.1 Data

###MT

* fully-aligned United Nations corpus for training NMT models (Ziemski+ 2016),
* six languages: Ar Zh En Fr Es Ru

# 4 Results

##4.1

* Comparing layers 1 through 4, we see that
  * in 3/5 target languages (Ar, Ru, Zh), POS tagging accuracy peaks at layer 1
    and does not improve at higher layers, with some drops at layers 2 and 3
  * In 2/5 cases (Es, Fr) the performance is higher at layer 4. This result is
    * typologically closer to English compared to the other languages. It is
    * similar POS characteristics, leading to
      more benefit in using upper layers for POS tagging
  * partially consistent with previous findings  (Shi+ 2016; Belinkov+ 2017)
    One possible explanation for the discrepancy when using different target
    languages, is that French and Spanish 3
* Turning to SEM tagging ... layers 1 through 4 boost the performance to 87-88%
  * 2nd and 3rd layers do not consistently improve semantic tagging
  * 4th layer lead to significant improvement with all target languages exc zh
* English autoencoders produce
  * poor representations for POS and SEM tagging
    * especially true with higher layer representations (around 5% below lay 4)
  * excellent sentence recreation capabilities (96.6 BLEU).  This indicates

##4.2 Effect of target language

* Belinkov+ (2017)reported a fairly consistent effect of the target language on
  the quality of NMT encoder representations for POS and morphological tagging
* We would like to examine if such an effect exists for both POS and SEM tag
* very small but significant] differences with different target languages
  * [large] for Chinese which leads to slightly worse representations. While
  * much smaller than that reported by Belinkov+ (2017) for POS and morph
  * can be attributed to ... that our NMT systems are trained on 10x larger
  * some of the differences [may] disappear when the NMT model is better
  * To verify this, we trained systems using a smaller data size (200K sents)

##4.3 Analysis at the semantic tag level

* The SEM tags are grouped in coarse-grained categories such as
  e.g. events, names, time, and logical expressions (Bjerva+ 2016). In Figure 2
* classifiers on coarse tags
* Similar trends to the fine-grained case arise, with slightly higher absolute
* significant improvement using the 1st encoding layer and
  some additional improvement using the 4th layer, both statistically
* small effect of the target language
* additional observations can be made. It appears that
  * higher layers of the NMT model are better at capturing semantic information
    * discourse relations (DIS tag: subordinate vs. coordinate vs.  apposition)
    * semantic properties of nouns (roles vs. concepts, within the ENT tag)
    * events and predicate tense (EVE and TNS tags)
    * logic relations and quantifiers
      (LOG tag: disjunction, conjunction, implication, existential, univ...)
    * and comparative constructions (COM tag: equatives, compar, and superlat)
* negative example [ is  the MOD tag, ] modality (necessity, possib, and negat)
  * should be better represented in higher layers following our ...  hypothesis
  * Still layer 1 is better than layer 4 in this case. One possible explanation
  * words tagged as MOD form a closed class, with ... mostly unambiguous words
    (“no”, “not”, “should”, “must”, “may”, “can”, “might”, etc.). It is enough
* NAM category, ... types of named entities (person, location, org, artifact..)
  * seems a clear case of semantic abstractions suited for higher layers,
    but the results from layer 4 are not significantly better than layer 1
  * might be signaling
    * a limitation of the NMT system at learning this type of semantic classes
    * many named entities are out of vocabulary words for the NMT system

##4.4 Analyzing discourse relations

* cases of disagreement between ... layer 1 and layer 4
* We focus on discourse relations, as they show the largest improvement 1 --> 4
* three discourse relations: subordinate (SUB), coordinate (COO), and appos
* AND ... is used for conjunctions connecting shorter expressions like words
* NIL, a tag for punctuation marks without semantic content (e.g.  end-of-sent)
* identifying the discourse function requires a fairly large context

##4.5 -Other architectural variants

* bidirectional encoder and residual connections. We also experiment with NMT
* different depths. Our motivation in this section is to see if the patterns we
  observed thus far hold in different NMT architectures

###Bidirectional LSTMs encoder

* ubiquitous in NLP and also ... some improvement as NMT encoders (Britz+ 2017)
* We ... note improvements in both translation (+1-2 BLEU) and SEM tagging
* close to the state-of-the-art on this task (Bjerva+ 2016). We observed
* similar improvements on POS tagging. Comparing POS and SEM tagging (Table 5),
  * higher layer representations improve SEM tagging, while
  * POS tagging peaks at layer 1, in line with our previous observations

###Residual connections

* useful for SEM tagging (Bjerva+ 2016)
* small but consistent improvements in both translation and POS and SEM tagging
* layers as before: POS tagging does not benefit from features from the upper
  * SEM tagging improves with layer 4 representations

###Shallower MT models In comparing network depth in NMT,

* Britz+ (2017) found that encoders with 2 to 4 layers performed the best
* we report here results using ... models trained originally with 2 and 3 lays
* layers consistent trends with our previous observations:
  POS tagging does not benefit from upper layers, while
  * SEM tagging does, although the improvement is rather small in the shallower

#5 Related Work

* visualization of hidden units (Elman, 1991; Karpathy+ 2015; Kádár+ 2016;
  Qian+ 2016a), which provide illuminating, but often anecdotal information on
* quantitative correlations between parts of the neural network and linguistic
  * speech (Wang+ 2017; Wu and King, 2016; Alishahi et al., 2017) and
  * language (Köhn, 2015; Qian+ 2016a,b; Adi+ 2016; Linzen+ 2016)
* Methodologically, our work is most similar to Shi+ (2016) and Belinkov+
  (2017), who also used hidden vectors from neural MT models to pred ling prop
  * they focused on ryntax and morphology, respectively

#6 Conclusion

* future, we would like to extend this work to
  * other syntactic and semantic tasks that requirebuilding relations such as
    dependency relations or predicate-argument structure. We believe that
  *  a key step for creating better MT systems
