Daniela Gerz, Ivan Vulić, Felix Hill, Roi Reichart, and Anna Korhonen
SimVerb-3500: A Large-Scale Evaluation Set of Verb Similarity
EMNLP 2016

http://people.ds.cam.ac.uk/dsg40/simverb.html

#Abstract

* covers
  * all normed verb types from the USF free-association database, pro-
  * at least three examples for every Verb-Net class. This broad coverage
* facilitates detailed analyses of how syntactic and semantic phenomena
  together influence human understanding of verb meaning

#Introduction

* Verbs [express] an event as well the relational information
* syntactic and semantic (Jackendoff, 1972; Gruber, 1976; Levin, 1993)
* research on human language acquisition and processing (Korhonen, 2010)
* embeddings [apply a single learning algorithm] for all words
  * applying different learning algorithms to [POSs is useful] (Schwartz+ 2015)
* evaluat[ion] Resources
  * such as MEN (Bruni+ 14), Rare Words (Luong+ 13) and SimLex-999 (Hill+ 15)
  * focus either on ... a single class or small samples of different w types,
  * automatic approaches already reaching or surpassing the inter-annotator agr
  * for ... verbs, it is practically impossible to achieve statistically robust
* SimVerb-3500
  * includes
    * 827 verb types from the University of South Florida Free Association
      Norms (USF) (Nelson+ 2004), and
    * at least 3 member verbs from [almost p4] each of the 101 top-level
      VerbNet classes (Kipper+ 2008)
  * enables ... direct links to other established semantic resources such as
    WordNet (Miller, 1995) and PropBank (Palmer+ 2005). Moreover, the large
  * standardised development and test sets in SimVerb-3500 allow for principled

#2 Related Work

* SimVerb-3500 focuses on similarity [as opposed to relatedness]
  * as this ... seems to yield a higher agreement between human annotators
* datasets that do focus on verb pairs to some extent
  * the data set of Baker+ (2014) and Simlex-999 (Hill+ 2015)
  * 134 and 222 verb pairs, respectively), making them unrepresentative of the

#3 The new SimVerb-3500 data

##Design Motivation

Hill+ (2015) argue that comprehensive ... evaluation resources have to satisfy
  1. Representative (the resource covers the full range of concepts in language);
  1. Clearly define the annotated relation, e.g., similarity;
  1. untrained native speakers must be able to [annotate] consistently
* C1: even SimLex ... spanning only 222 verb pairs and 170 distinct verb lemmas
  * 39 out of the 101 top-level VerbNet classes are not represented at all
  * 20 classes have only one member verb, one may conclude that the criterion
* inter-annotator agreement ceiling
  * SimVerb-3500 does not inherit this anomaly (see Tab. 2)
    * there exists an evident gap between the human and system
* We employed the SimLex-999 annotation guidelines. In particular,
  * give low ratings to antonyms, and to
  * distinguish between similarity and relatedness

##3.2 Choice of Verb Pairs and Coverage 3

###The USF norms data set (further USF)

* the largest database of free association collected for English
* the proportion of participants who produced associate `a` when presented with
  cue `c` can be used as a proxy for the strength of association

###VerbNet (VN)

* the largest online verb lexicon currently available for English
* hierarchical, domain-independent, and broad-coverage
* organised into verb classes extending the classes from Levin (1993) through
  * Classes are numbered according to shared semantics and syntax, and classes
* Among others, three basic types of information are covered in VN:
  * verb subcategorization frames (SCFs), which describe the syntactic
  * selectional preferences (SPs), which capture the semantic preferences verbs
  * lexical-semantic verb classes (VCs)
    * a shared level of abstraction for verbs similar in their
      (morpho-)syntactic and semantic properties
  * the VerbNet structure already suggests that measuring verb similarity is
    far from trivial as it revolves around a complex interplay between syn sem
* VerbNet enables [connections to]
  FrameNet (Baker+ 1998), WordNet (Miller, 1995), and PropBank (Palmer+ 2005)

###Sampling Procedure 4

#4 Word Pair Scoring 5

* We employ the Prolific Academic (PA) crowdsourcing platform, 11 an online
  marketplace very similar to Amazon Mechanical Turk and to CrowdFlower

##4.1 Survey Structure

Following the SimLex-999 annotation guidelines

###Checkpoint Questions

###Participants. 843 raters participated in the study, ... over 65,000 ratings

* native English speakers with a 90% approval rate (maximum rate on PA), of age

##4.2 Post-Processing

The score was finally scaled linearly from the 0-6 to the 0-10 interval as in
(Hill+ 2015)

#5 Analysis

performance of a diverse range of popular representation learning
architectures, together with benchmark performance on existing evaluation sets

##Inter-Annotator Agreement

* two measures
  * IAA-1 (pairwise) computes the average pairwise Spearman’s ρ correlation
    between any two raters – a common choice in previous data collection in
    distributional semantics (Padó+ 2007; Reisinger and Mooney, 2010a; Silberer
    and Lapata, 2014; Hill+ 2015)
  * A complementary measure would smooth individual annotator effects. For this
    aim, our IAA-2 (mean) measure compares the average correlation of a human
    rater with the average of all the other raters
* SimVerb-3500 obtains ρ = 0.84 (IAA-1) and ρ = 0.86 (IAA-2), a very good
  agreement compared to other benchmarks (see Tab. 2)

##Vector Space Models

* We compare the performance of prominent representation models
  * unsupervised models that learn from distributional information in text,
    * skip-gram negative-sampling model (SGNS) with various contexts (
      * BOW = bag of words;
      * DEPS = dependency contexts) as in Levy and Goldberg (2014), the
    * symmetric-pattern based vectors by Schwartz+ (2015), and
    * count-based PMI-weighted vectors (Baroni+ 2014);
  * Models that rely on linguistic hand-crafted resources or curated knowledge
    * sparse binary vectors built from linguistic resources
      (Non-Distributional, Faruqui and Dyer, 2015), and
    * vectors fine-tuned to a paraphrase database (Paragram, Wieting+ 2015)
      further refined using linguistic constraints (Paragram+CF, Mrkšić+ 2016)
  * Descriptions of these models are in the supplementary material

##Comparison to SimLex-999 (SL-222)

* 170 pairs from SL-222 also appear in SimVerb-3500
* correlation ... is ρ = 0.91. This proves ... that the ratings are consistent
* Tab. 3 shows ... models’ performance on SimVerb-3500 against SL-222
  * number of evaluation pairs may influence the results
  * Picking one random subset of 222 pairs would bias the results
  * even using 10-fold cross-validation we found variations up to 0.05
  * we employ a 2-level 10-fold crossvalidation
* Most models perform much better on SL-222,
  * especially those employing additional databases or linguistic resources
  * Paragram+CF model is even on par with the IAA-1 of 0.72
  * The same model obtains the highest score on SV-3500 (ρ = 0.628), with a
    clear gap to IAA-1 of 0.84
  * We attribute th[is] to SimVerb-3500 being a more extensive and diverse

##Development Set

* Previous works often optimise models
  * on the entire dataset, which leads to overfitting (Faruqui+ 2016) or use
  * custom splits, e.g., 10-fold cross-validation (Schwartz+ 2015), which make
* Our development set contains 500 pairs, selected to ensure a broad coverage
  in terms of similarity ranges ... and top-level VN classes
  * The ranking of models is identical on the test and the full SV-3500 set,
    with slight differences in ranking on the development set

#6 Evaluating Subsets

SimVerb-3500 enables a variety of new linguistic analyses, [ due to ] coverage
and scale

##Frequency

* performance of all models improves [with] the frequency of the verbs
* with much steeper curves for the purely distributional models (SGNS, SymPat)
* The non-distributional non data-driven model of Faruqui and Dyer (2015) is
  only slightly affected by frequency

##WordNet Synsets

* Intuitively, representations for verbs with more diverse usage patterns are
  more difficult to learn with statistical models
* we resort to WordNet (Miller, 1995), where different semantic usages of words
  are listed as so-called synsets
* Fig. 2 ... confirming that polysemous verbs are more difficult for current
  verb representation models
* approaches which use additional information beyond corpus co-occurrence are
  again more robust

##VerbNet Classes

* the connection between VerbNet classes and human similarity judgments
* verbs in the same top-level VerbNet class are often not assigned high sim
* clear differences between classes (e.g., Class 31 vs Class 51)
* further developments [ should ] focus on constructing specialised
  representations at the finer-grained level of VN classes

##Lexical Relations

* SimVerb-3500 contains relation annotations for all pairs ... from WordNet
  (e.g., antonyms, synonyms, hyper/hyponyms, no relation)
* some models draw their strength from good performance _across_ different
  relations.  Others have low performance on these pairs, but do very well on
  synonyms and hyper-/hyponyms
* Evaluation based on Spearman’s ρ may be problematic with
  * antonyms
    * the ranking is arbitrary: every antonym pair should have a very low
  * highly ranked synonyms, but to a much lesser degree than with antonyms

##Human Agreement

* varying performance of computational models regarding frequency and ambigu[y]
* we analyse what disagreement effects may be captured in human ratings
* We therefore compute the average standard deviation of ratings per subset
* While the standard deviation of ratings is diverse for individual pairs,
* humans are much less influenced by frequency or polysemy

#7 Conclusions 8

* how humans or machines represent the meaning of verbs,
  and, by extension, scenes, events and full sentences
* SimVerb-3500 makes [ possible ] statistically robust analyses on specific
  word classes
* distributional models trained on raw text (e.g. SGNS) perform very poorly on
  low frequency and highly polysemous verbs. This degradation in performance
  * can be partially mitigated by focusing models on more principled
    distributional contexts, such as those defined by symmetric patterns
* finding suggests that ... we may require algorithms [for]
  * fast learning from few examples (Lake+ 2011)
  * sense-level distinctions
    * Reisinger and Mooney, 2010b;
    * Vilnis and McCallum, 2015
      * Luke Vilnis and Andrew McCallum
        ICLR 2015
        Word representations via Gaussian embedding
* future work
  * verb acquisition
  * relationship between architectures, algorithms and representation quality
    for a wide range of verb classes
  * encoding and interpreting the facts, propositions, relations and events
