N Mrkšić, I Vulić, DÓ Séaghdha, I Leviant, Reichart, Gašić, A Korhonen, S Young
Semantic Specialisation of Distributional Word Vector Spaces
  using Monolingual and Cross-Lingual Constraints
emnlp 2017

All resources relating to this paper are available at
www.github.com/nmrksic/attract-repel
  * the Attract-Repel source code;
  * bilingual word vector collections combining English with 51 other languages
  * Hebrew and Croatian intrinsic evaluation datasets; and
  * Italian and German Dialogue State Tracking datasets collected for this work

# Abstract

* We present Attract-Repel
* jointly injecting mono~ and cross-lingual synonymy and antonymy 
* yielding semantically specialised cross-lingual vector spaces
* semantic transfer from high to lower-resource [languages]
* eval
  * SOTA on SimLex semantic similarity datasets in six languages
  * downstream task of dialogue state tracking (DST) across multiple languages
  * multilingual DST models, which brings further performance improvements

# Intro

* common techniques for inducing distributed word representations
  * Ó Séaghdha and Korhonen, 2014;
* [retrofitting]
  * vectors are refined to satisfy constraints extracted from a lexic[ons]
    such as WordNet (Faruqui+ 2015; Wieting+ 2015; Mrkšić+ 2016)
  * We term this approach semantic specialisation
* We deploy the Attract-Repel algorithm in a multilingual setting,
  * semantic relations from BabelNet (Navigli & Ponzetto, 2012; Ehrmann+ 2014)
  * exploiting information from high-resource languages to improve the lower-rs
* we are the first to apply semantic specialisation to ...  joint learning of
  cross-lingual vector spaces
* We demonstrate its efficacy with
  * SOTA results on the four languages in the Multilingual SimLex-999 dataset
    (Leviant and Reichart, 2015)
  * for lower-resource languages, we collect intrinsic evaluation datasets for
    Hebrew and Croatian
    * cross-lingual specialisation significantly improves word vector quality
* downstream application
  * motivation: improve the lexical coverage of supervised models
    for e.g.~QA (Iyyer+ 2014) or textual entailment (Rocktäschel+ 2016)
  * this work, we use the task of dialogue state tracking (DST) for extrinsic
    * statistical dialogue systems (Young+ 2013)
    * [task is] updating the system’s distribution over [user] goals
      as the conversation progresses and new information becomes available
    * incorporating our specialised vectors into a SOTA NN model for DST
      improves performance on English dialogues
    * multilingual spirit: we produce new Italian and German DST datasets and
      show that using Attract-Repel-specialised vectors leads to even stronger
      gains in these two languages
    * single model that performs DST in all three languages,
      in each case outperforming the monolingual model. To the best of our
      * this is the first work on multilingual training of any component of a
        statistical dialogue system

# Related Work

## Semantic Specialisation

* [applications] of distributional word representations
  * Part-of-Speech (POS) tagging (Collobert+ 2011),
  * machine translation (Zou+ 2013; Devlin+ 2014),
  * dependency and semantic parsing (Socher+ 2013a; Bansal+ 2014; Chen and
    Manning, 2014; Johannsen+ 2015; Ammar+ 2016)
  * sentiment analysis (Socher+ 2013b),
  * named entity recognition (Turian+ 2010; Guo+ 2014),
  * semantic specialisation for downstream tasks is relatively unexplored, but
    * dialogue state tracking (Mrkšić+ 2016; Mrkšić+ 2017),
    * spoken language understanding (Kim+ 2016b; Kim+ 2016a)
    * lexical entailment (Vulić+ 2016)
* two categories:
  * train distributed representations ‘from scratch’ by combining
    distributional knowledge and lexical information; and
  * inject lexical information into pre-trained collections
  * both categories make use of similar lexical resources
    * WordNet (Miller, 1995), FrameNet (Baker+ 1998) or the Paraphrase
      Databases (PPDB, Ganitkevitch+ 2013; Ganitkevitch and Callison-Burch,
      2014; Pavlick+ 2015)
  * none of [the SOTA models] learn representations jointly
    * see the [SimLex-999 web page](www.cl.cam.ac.uk/~fh295/simlex.html)

### Learning from Scratch

* modify the prior or the regularization of the original training procedure
  using the set of linguistic constraints (Yu and Dredze, 2014; Xu+ 2014;
  Bian+ 2014; Kiela+ 2015; Aletras and Stevenson, 2015)
* modify the skip-gram (Mikolov+ 2013b) objective function by introducing
  semantic constraints (Yih+ 2012; Liu+ 2015) to train word vectors which
  emphasise word similarity over relatedness
* Osborne+ (2016) propose a method for incorporating prior knowledge
  * into the Canonical Correlation Analysis (CCA) method
    used by Dhillon+ (2015) to learn spectral word embeddings
* Schwartz+ (2015) use symmetric patterns (Davidov and Rappoport, 2006) to push
  away antonymous words in their pattern-based vector space
* Ono+ (2015) combine both approaches, using thesauri and distributional data
  to train embeddings specialised for capturing antonymy
* Faruqui and Dyer (2015) use many different lexicons to create
  interpretable sparse binary vectors which achieve
  competitive performance across a range of intrinsic evaluation tasks

### Fine-Tuning Pre-trained Vectors

* Rothe and Schütze (2015) fine-tune word vector spaces
  to improve the representations of synsets/lexemes found in WordNet
* Faruqui+ (2015) and Jauhar+ (2015) use synonymy constraints in a procedure
  termed retrofitting to bring the vectors of semantically similar words close
* Wieting+ (2015) modify the skip-gram objective function to fine-tune vectors
  by injecting paraphrasing constraints from PPDB
* Mrkšić+ (NAACL 2016) build on the retrofitting approach
  by jointly injecting synonymy and antonymy constraints; the
* same idea is reassessed by Nguyen+ (ACL 2016)
* Kim+ (2016a) ... incorporating semantic intensity information
* Recski+ (2016) use ensembles of rich concept dictionaries to further improve
  a combined collection of semantically specialised word vectors
* we show the [Attract-Repel sets the new SOTA performance on] SimLex-999 w sim
  * different languages into a unified vector space which
    benefits from positive semantic transfer

### Cross-Lingual Word Representations

* rely on cross-lingual distributional information (Klementiev+ 2012; Zou+
  2013; Soyer+ 2015; Huang+ 2015, inter alia)
* These models differ in the cross-lingual signal/supervision they use
  * word-aligned data (Luong+ 2015; Coulmance+ 2015) or
  * sentence-aligned data (Hermann and Blunsom, 2014a; Hermann and Blunsom,
    2014b; Chandar+ 2014; Gouws+ 2015). Other ones require
  * document-aligned data (Søgaard+ 2015; Vulić and Moens, 2016), while some
  * bilingual dictionaries (Mikolov+ 2013a; Faruqui and Dyer, 2014; 
    Lazaridou+ 2015; Vulić and Korhonen, 2016b; Duong+ 2016)
* for an overview, see Upadhyay+ (2016) and Vulić and Korhonen (2016b)
* shared cross-lingual vector spaces which can:
  * boost performance on monolingual tasks such as word similarity (Faruqui and
    Dyer, 2014; Rastogi+ 2015; Upadhyay+ 2016); and
  * support cross-lingual tasks such as
    * bilingual lexicon induction (Mikolov+ 2013a; Gouws+ 2015; Duong+ 2016),
    * cross-lingual information retrieval (Vulić and Moens, 2015; Mitra+ 2016),
    * transfer learning for resource-lean languages (Søgaard+ 2015; Guo+ 2015)
* prior work on cross-lingual word embedding [didn't exploit] linguistic rscs
* our experiments, we show that ... Attract-Repel consistently outperform a
  five strong cross-lingual word embedding models in
  both intrinsic and extrinsic evaluation across several languages

# 4 Experimental Setup 6

## 4.1 Distributional Vectors

* sixteen experimental languages: EN DE IT RU NL SV FR ES PT PL BG HR GA FA VI
* The first four languages are those of the Multilingual SimLex-999 dataset
  * For [these], we employ ... vector collections
    * The Common Crawl GloVe English vectors from Pennington+ (2014);
    * German vectors from Vulić and Korhonen (2016a);
    * Italian vectors from Dinu+ (2015); and
    * Russian vectors from Kutuzov and Andreev (2015)
* In addition, for each of the 16 languages we also train SGNS (Mikolov+ 2013b)
  on the latest Wikipedia dump

## 4.2 Linguistic Constraints

### Monolingual Similarity

* Multilingual Paraphrase Database (Ganitkevitch and CallisonBurch, 2014)
  * for ten of our sixteen languages
  * the remaining six languages (HE, HR, SV, GA, VI, FA) serve as lower-rsc

### Cross-Lingual Similarity

* BabelNet, a multilingual semantic network
  * constructed by linking Wikipedia to WordNet
* we
  * synonymous if they belong to (at least) one set of synonymous Babel synsets
  * all BabelNet word senses tagged as conceptual but [not] the Named Entities

### Antonymy

* BabelNet is also used to extract both monolingual and cross-lingual antonymy
* Following Faruqui+ (2015), who found PPDB constraints [better] than WordNet,
  we do not use BabelNet for monolingual synonymy

# 5 Intrinsic Evaluation 7

## 5.1 Datasets

* Leviant and Reichart (2015) translated SimLex999 to German, Italian and
  Russian, crowd-sourcing the similarity scores from native speakers
* we used the same experimental setup to collect SimLex999 datasets for Hebrew
  and Croatian
* SimVerb-3500 (Gerz+ 2016), a semantic similarity dataset that focuses on verb
  pair similarity.  
  
## 5.2 Experiments 

### Monolingual and Cross-Lingual Specialisation

* a) monolingual synonyms; b) monolingual antonyms; and c) the combination of
  both. We then add cross-lingual synonyms and antonyms --> four-lingual space

### Comparison to Baseline Methods 

* Both mono~ and cross-lingual specialisation was performed 
  using Attract-Repel and counter-fitting, in order to conclusively [compare]
* Retrofitting and PARAGRAM methods only inject synonymy, and 
  their cost functions can be expressed using sub-components of [the other two]
* the performance of [Attract-Repel and counter-fitting], 
  when they make use of similarity (but not antonymy) constraints, 
  illustrates the performance range of the two preceding models
  
### Importance of Initial Vectors

* three different sets of initial vectors:
  * well-known distributional word vector collections (Sect. 4.1);
  * distributional vectors trained on the latest Wikipedia dumps; and
  * word vectors randomly initialised using the XAVIER initialisation 
    (Glorot and Bengio, 2010).  
    
### Specialisation for Lower-Resource Languages 

* In this experiment, we first construct bilingual spaces which combine:
  * one of the four SimLex languages; with
  * each of the other twelve languages. 
* we can analyse the improvement over monolingual specialisation 

### Comparison to State-of-the-Art Bilingual Spaces 

* [our] English-Italian and English-German bilingual spaces 
  were compared to five SOTA methods for constructing bilingual vector spaces:
  1.  Mikolov+ (2013a), retrained using the constraints used by our model; and
  2.-5.  Hermann and Blunsom, (2014a); Gouws+ (2015); 
      Vulić and Korhonen, (2016a); Vulić and Moens, (2016)
    * use various sources of supervision (word-, sentence~ and document-
      aligned corpora), which means they cannot be trained using our sets of
      constraints.  For these models, we use competitive setups proposed in
      (Vulić and Korhonen, 2016a)

# 6 Downstream Task Evaluation 10

6.1 Dialogue State Tracking

6.2 DST Experiments

6.3 Results and Discussion

# 7 Conclusion

# 8 Further Work

* improving vector space models for morphologically rich languages
* discrepancies between our intrinsic and task-based experiments 
