Ryan Cotterell and  Hinrich Schütze
Joint Semantic Synthesis and Morphological Analysis of the Derived Word
TACL 2018

# Abstract

* we propose a novel probabilistic model of word formation that [jointly] captr
  * the analysis of a word w into its _constituent segments_ and
  * the synthesis of the _meaning_ of w from the meanings of those segments
    * distributional semantic vectors of those morphemes. We
* experiment ... on English CELEX data and German DErivBase (Zeller+ 2013)
* increases both segmentation accuracy and morpheme F1 by between 3% and 5%
* different models of vector composition
  * RrentNN yield an improvement over simple additive models
* generate[s] compositional word embeddings
  * [do] the representations correspond to a linguist’s notion of morph prod?

# 1 Introduction

* Morphological segmentation ... to aid a diverse set of applications, such as
  * automatic speech recognition (Afify+ 2006)
  * keyword spotting (Narasimhan+ 2014)
  * machine translation (Clifton and Sarkar, 2011) and
  * parsing (Seeker and Çetinoğlu, 2015). In contrast to much of this prior
* we focus on supervised segmentation, ie gold segmentations during training
  * Instead of surface segmentation, our model performs canonical segmentation
    (Cotterell+ 2016a; Cotterell+ 2016b; Kann+ 2016), ie, it allows
    the induction of orthographic changes together with the segmentation, which
    is not typical
* In this work, our primary contribution lies in the
  * integration of continuous sem vectors into supervised morph segmentation
  * experimentally investigate three novel aspects of our model
    * jointly modeling ... to improve morphological analysis
      * On the English portion of CELEX (Baayen+ 1993), we achieve a 5 point
      * German DErivBase dataset we achieve a 3 point improvement in seg 3 m
    * models of vector composition for synthesizing word meaning
      * RNN improves over previously proposed additive models
      * [dependency] vectors (Levy and Goldberg, 2014a) are better suited
    * productivity of English derivational affixes in the context of distri sem

# 5 Related Work

* vector sem ... for morph segment (Salton, 1971; Turney and Pantel, 2010)
	* unsupervised induction of morphology
		(Schone and Jurafsky, 2000; Schone and Jurafsky, 2001)
	* Embeddings were shown to act similarly (Soricut and Och, 2015)
	* Our method can be interpreted as differs from this line of research in two
		1. probabilistic model of the process of [compositional] word meaning
		2. supervised and focuses on derivation
	* Schone and Jurafsky (2000) and Soricut and Och (2015), 	
		* being fully unsupervised, do not distinguish between inflection and deriv
	* Schone and Jurafsky (2001) focus on inflection.  More recently,
	* Narasimhan+ (2015) ... unsupervised induction of “morphological chains”
		with semantic vectors as a crucial feature. Their goal is to
		jointly figure out an ordering of word formation and a morphological
		segmentation, e.g., play7→ playful7→ playfulness. While it is a rich model like
* morphological generation. Two recent papers that address this problem
	* using deep learning are Faruqui+ (2016a) and Faruqui+ (2016b).  In an
  * older line of work, Yarowsky and Wicentowski (2000) and Wicentowski (2002)
    exploit log frequency ratios of inflectionally related forms
  * Dreyer and Eisner (2011) uses a
    * Dirichlet process to model a corpus as a “mixture of a paradigm”,
    * semi-supervised incorporation of distri sem into a ... paradigm complet
* integrate morphological knowledge into general embedding models. For example,
  * Botha and Blunsom (2014) train a log-bilinear language model that models
  * Luong+ (2013) train a recursive neural network (Goller and Küchler, 1996)
    over a heuristically derived tree structure to learn morphological
  * supervised morphological analysis can drastically outperform unsupervised
    analysis (Ruokolainen+ 2013)
* Early [finite-state canonical segmentation]  (Kay 1977) can be interpreted as
* canonicalization as an orthographic analogue to phonology.  On this
  * the finite-state systems of Kaplan and Kay (1994),
    which [implement] SPE-style phonological rules (Chomsky and Halle, 1968),
    may be run backwards to get canonical underlying forms

# 6 Experiments and Results

* We conduct experiments on English and German derivational morphology. We
  * segment words into their canonical morphemes as well as its ability to
  * compositionally derive vectors for new words
* Finally, we explore the relationship between distributional semantics and
  morphological productivity
* dataset
  * English dataset, the subset
    * of the English portion of the CELEX lexical database (Baayen+ 1993)
    * selected by Lazaridou+ (2013); the dataset contains 10,000 forms. This
    * We make two modifications
      * Lazaridou+ (2013) make the two-morpheme assumption: every word is
      * Lazaridou+ (2013) only provide a single train/test split. As we require a
  * German dataset
    * taken from Zeller+ (2013) and is described in Cotterell+ (2016b).  It,
    * 10,000 derivational forms. We report results on 10-fold cross validation

# 7 Conclusion

* SOTA on the derivational vector approximation task (Lazaridou+ 2013)
* Future work will focus on the
  * extension to
    * more complex ... derivational morphology, e.g., compounding and reduplic
    * additional languages. We also plan to
  * explore the relation between derivation and distributional semantics
