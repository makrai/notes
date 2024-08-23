Unifying Cross-Lingual Semantic Role Labeling with Heterogeneous Ling Resources
Simone Conia, Andrea Bacciu, Roberto Navigli
NAACL 2021

https://github.com/SapienzaNLP/unify-srl

* cross-lingual techniques
  * increasing success in a wide range of Natural Language Processing tasks,
  * application to Semantic Role Labeling (SRL) has been strongly limited by
    * each language adopts its own linguistic formalism
    * PropBank for English, AnCora for Spanish, and PDT-Vallex for Czech,
* we present a unified model to perform cross-lingual SRL
  over heterogeneous linguistic resources
  * implicitly learns a high-quality mapping for different formalisms across
    diverse languages without resorting to word alignment and/or translation
  * competitive with the current SOTA and robust to low-data scenarios
  * annotate a sentence in a single forward pass with all the inventories
    * providing a tool for the analysis and comparison of linguistic theories
      across different languages

# 1 Intro

* recurrent networks to better capture relations over sequences
  (He+ 2016; Marcheggiani+ 2017)
* wide availability of multi-lingual word embeddings
  (Grave+ 2018) and
* models that work on multiple languages (Cai & Lapata 19b; He+ 19; Lyu+ 19)
* training and evaluating a model on each language separately
  (Cai and Lapata, 2019b; Chen+ 2019; Kasai+ 2019; He+ 2019; Lyu+ 2019)
* using a single formalism across multiple languages through
  annotation projection or other transfer techniques (Akbik+ 2015, 2016; Daza
  and Frank, 2019; Cai and Lapata, 2020; Daza and Frank, 2020)
* often rely on word aligners and/or automatic translation tools
  * may introduce a considerable amount of noise, especially in low-resrc langs
* a linguistic formalism of choice, which may have been developed with a
  specific language in mind, [may not be] suitable for other languages
* contributions:
  * We probe our model and demonstrate that
    it implicitly learns to align heterogeneous linguistic resources;
    * We leave an in-depth qualitative and quantitative analysis for future work
  * We automatically build and release a crosslingual mapping
    * aligns linguistic formalisms from diverse languages

# 2 Related Work

## End-to-end SRL

* SRL pipeline is usually divided into four steps:
  * predicate identification
  * predicate sense disambiguation
  * argument identification
  * argument classification
* early research focused its efforts on addressing each step individually
  (Xue and Palmer, 2004; Björkelund+ 2009; Zhao+ 2009), recent work has
* tackling some of these subtasks jointly with multitask learning (Caruana 1997)
  * He+ (2018), Cai+ (2018), Li+ (2019) and Conia+ (2020), indicate that
    predicate sense signals aid the identification of predicate-argument rels

## Multilingual SRL

* novel neural architectures, which fall into two broad categories,
  * syntax-aware.  On one hand, the quality and diversity of the information
    encoded by syntax is an enticing prospect that has resulted in a wide range
    * Graph Convolutional Networks (GCNs) to better capture relations between
      neighboring nodes in syntactic dependency trees
      (Marcheggiani and Titov 2017)
    * linguistically informed self-attention layers in SRL (Strubell+ 2018)
    * syntactic dependencies often mirror semantic relations
      (Cai and Lapata 2019b)
      * a model that jointly learns to perform syntactic dependency and SRL
    * He+ (2019): syntax-based pruning rules that work for multiple languages
  * syntax-agnostic ones
    * an attentive biaffine layer (Dozat and Manning, 2017) to better model
      predicate-argument relations (Cai+ 2018)
    * Chen+ (2019) via capsule networks
    * Lyu+ (2019) iteratively refining the sequence of output labels,
    * Cai and Lapata (2019a) proposed a semi-supervised approach that scales
      across different languages
* we follow the latter trend and develop a syntax-agnostic model, we
* both training one model instance for each language of interest. Their two main
  * the number of trainable parameters increases linearly with the number of languages, and
  * the information available in one language cannot be exploited to make SRL
    more robust in other languages. In contrast, one of the main objectives of

## Cross-lingual SRL

* dissimilarity of predicate sense and semantic role inventories
* the multilingual CoNLL-2009 shared task (Hajic+ 2009) adopts the
  * English Proposition Bank (Palmer+ 2005) and NomBank (Meyers+ 2004) to en,
  * Chinese Proposition Bank (Xue and Palmer, 2009) for Chinese, the
  * AnCora (Taulé+ 2008) predicate-argument structure inventory for Catalan, sp
  * German Proposition Bank
    * differently from the other PropBanks, is derived from FrameNet (Hajic+ 09)
  * PDT-Vallex (Hajic+ 2003) for Czech
* Padó and Lapata (2009), and Akbik+ (2015, 2016) worked around these issues by
  making the English PropBank act as a universal predicate sense and semantic
  role inventory and
  projecting PropBank-style annotations from English onto non-English sentences
  by means of word alignment techniques applied to parallel corpora eg Europarl
  (Koehn, 2005)
  * resulted in the creation of the Universal PropBank,
  * a multilingual collection of semi-automatically annotated corpora for SRL,
  * actively in use today to train and evaluate novel cross-lingual methods such
    as word alignment techniques (Aminian+ 2019)
  * In the absence of parallel corpora, annotation projection techniques can
    still be applied by automatically translating an annotated corpus and then
    projecting the original labels onto the newly created silver corpus (Daza
    and Frank, 2020; Fei+ 2020), whereas
* Daza and Frank (2019) training an encoder-decoder architecture to jointly
  tackle SRL and translation
* strong assumption that the English PropBank provides a suitable formalism
  for non-English languages, and this may not always be the case
  * Among the numerous studies that adopt the English PropBank as a universal,
  * Mulcaire+ (2018) proposing a bilingual model that is able to perform SRL
    according to two different inventories at the same time, although with
    * significantly lower results compared to the SOTA at the time
* our model embraces the diversity of the various reprs in different languages
  * does not rely on word alignment or machine translation tools;
  * SRL with multiple linguistic inventories;
  * link resources that would otherwise be disconnected from each other

# 3 Model Description

* end-to-end systems: jointly tackle predicate identification, predicate sense
  disambiguation, argument identification and argument classification. The
* architecture can be roughly divided into the following components:
  * A universal sentence encoder whose parameters are shared across languages
    and which produces word encodings that capture predicate-related information
    (Section 3.2);
  * A universal predicate-argument encoder whose parameters are also shared
    across languages and which models predicate-argument relations
    (Section 3.3)
  * language-specific decoders which indicate whether words are predicates,
    select the most appropriate sense for each predicate, and
    assign a semantic role to every predicate-argument couple,
    according to several different SRL inventories (Section 3.4)

## 3.1 Input representation

## 3.2 Universal sentence encoder

## 3.3 Universal predicate-argument encoder

## 3.4 Language-specific decoders

## 3.5 Training objective

# 4 Experiments 5

* We evaluate our model in dependency-based multilingual SRL

## 4.1 Experimental Setup

## 4.2 Dataset

* CoNLL-2009 shared task (Hajic+ 2009) is the largest and most diverse
  collection of human-annotated sentences for multilingual SRL
  * 6 languages: Catalan, Chinese, Czech, English, German and Spanish,
  * significantly varying amounts of training samples, from 400K predicate
    instances in Czech to only 17K in German; we provide an overview of the
    statistics of each language in Appendix B. CoNLL-2009 is 
  * the ideal testbed for evaluating the ability of our unified model to
    generalize across heterogeneous resources since 
    each language adopts its own linguistic formalism,
    from English PropBank to PDT-Vallex, from Chinese PropBank to AnCora
* VerbAtlas (Di Fabio+ 2019), a recently released resource for SRL 5 , with the
  aim of understanding whether our model can learn to align inventories that are
  based on “distant” linguistic theories; indeed, VerbAtlas is
  * based on clustering WordNet synsets into frames that share similar semantic
    behavior, whereas PropBank-based resources enumerate and define the possible
    senses of a lexeme.  As a final note,
* we did not evaluate our model on Universal PropBank 6 since
  * it was semiautomatically generated through annotation projection techniques,
  * it uses the English PropBank for all languages, which goes against our
    interest in capturing cross-lingual knowledge over heterogeneous inventories

## 4.3 Results 6

### Cross-lingual SRL. Table 1 compares the results

### Low-resource cross-lingual SRL. We evaluate

* by artificially reducing the training set of each language to 10%
* model trained on the union of the reduced training sets (cross-lingual).  The
* compared to the more traditional monolingual baseline
  * absolute improvements in F 1 score of 25.5%, 9.7% and 26.9%

### One-shot cross-lingual SRL. An interesting

* synthetic scenario where each sense appears at most once in the training set,
  * our cross-lingual approach outperforms its monolingual counterpart trained
    on each synthetic dataset separately by a wide margin, once again providing
    strong absolute improvements – 18.7% in Catalan, 9.2% in German and 16.1% in
* different amounts of data for each language, depending on how difficult it is
  to get manual annotations for each language of interest
  * We simulate this setting in SRL by training our model on
    * 100% of the training data available for the English language, while
    * one-shot learning setting for all the other languages. As Table 3 (bottom)
  * non-English languages exhibit further improvements
    as the number of English training samples increases, lending further
    credibility to the idea that SRL can be learnt across languages even when
* suggest that
  * a cross-lingual/cross-resource approach might mitigate the need for a large
    training set in each language, but also that
  * reasonable cross-lingual results may be obtained by maintaining a single
    large dataset for a high-resource language, together with several small
    datasets for low-resource languages

# 5 Analysis and Discussion

## Cross-formalism SRL

* may potentially work on any of the 100 languages supported by the LM
  (m-BERT or XLMRoBERTa), eg in Italian, as shown in Figure 1 (right). This
* vital for those languages for which a predicate-argument structure inventory
  has not  yet been developed – an endeavor that may take years to come to
  fruition – and, therefore, manually annotated data are unavailable. Thus, as

## Aligning heterogeneous resources

* While producing the silver annotations, we keep track of the number of times
  each predicate sense in the source inventory is associated by the model with
  a predicate sense of the target inventory
* we produce a weighted directed graph in which the
  * nodes are predicate senses and an
  * edge (a, b) with weight w indicates that our model maps the source
    predicate sense a to the target predicate sense b at least w times
  * A portion of this graph is displayed in
* Figure 2: we show the most frequent alignments for each language, i.e., the
  top-3 edges with largest weight from the nodes of each inventory to the nodes
  of the English PropBank (Figure 2, left) and to the nodes of VerbAtlas
  (Figure 2, right)
* eg the Chinese PropBank sense 开始.01 can correspond to both start.01 and
  begin.01
* VerbAtlas is quite distant from the others as 
  * its frames are based on clustering WordNet synsets that share similar
    semantic behavior,
    rather than enumerating and defining all the possible senses of a lexeme
    as English and Chinese PropBanks
* nL map senses from different languages and formalisms to the coarse-grained
  senses of VerbAtlas
* our unified model is the first transfer-based tool to automatically align
  diverse linguistic resources across languages without relying on supervision

# 6 Conclusion and Future Work 9

* On one/other hand, recent research in
  * multilingual SRL has focused mainly on proposing novel model architectures
    that achieve SOTA results, but require a model instance to be trained for
    each language of interest
  * cross-lingual SRL have revolved around using the English PropBank inventory
    as a universal resource for other languages through annotation transfer
* our model architecture has “universal” encoders
  * share weights across 7 languages and varying formalisms
* evaluated on the gold multilingual benchmark of CoNLL-2009,
  * outperforms previous SOTA multilingual systems over 6 diverse languages,
    ranging from Catalan to Czech, from German to Chinese
  * considerably reduces the amount of trainable parameters required
* our model can be used on languages that were never seen at training time,
  opening the door to alignment-free cross-lingual SRL on languages where a
  predicate-argument structure inventory is not yet available

# Appendix 12

## E Other results

* Predicate identification. In Table 8 we report the results of our model on
* Predicate sense disambiguation. In Table 9 we report the results of our model
