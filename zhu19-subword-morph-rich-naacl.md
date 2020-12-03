Yi Zhu, Ivan Vulić, Anna Korhonen
A Systematic Study of Leveraging Subword Information for Learning Word Reprs
NAACL 2019

https://github.com/cambridgeltl/sw_study

# Abstract

* subword-level information (e.g., characters, character n-grams, morphemes)
* especially for morphologically rich languages
* [we deliver a] systematic comparative analysis across 
  typologically diverse languages and different tasks
  * focusing on the variation of two crucial components
    * segmentation of words into subword units, and
    * subword composition functions
  * a general framework for learning subword-informed word representations
  * also including position embeddings and self-attention
  * [60] subword-informed word representation configurations
  * 3 tasks
    * general and rare word similarity and relatedness
    * dependency parsing
    * fine-grained entity typing
    * selected as they require different degrees of syntactic and semantic
  * 5 languages representing fusional, introflexive (Hebrew), and agglutinative
* results
  * performance is both language~ and task-dependent 
  * unsupervised segmentation (e.g., BPE, Morfessor) are sometimes comparable
    to or even outperform the ones based on supervised word segmentation
    in parsing or fine-grained entity typing
  * We also show that more sophisticated configurations are particularly useful
    for representing rare words

# 1 Introduction

* Word representations are central to a wide variety of NLP tasks
  * Collobert+ 2011
  * Chen and Manning, 2014 dependency
  * Jia and Liang, ACL 2016 Data recombination for neural semantic parsing
  * Ammar+ ACL 2016 Many languages, one parser
  * Goldberg, 2017 [book chapter?]
  * Peters+ 2018
  * Kudo, 2018 Subword regularization: Improving neural network translation
    models with multiple subword candidates
* recent work
  * Bojanowski+ 2017
  * Vania and Lopez, 2017
    From characters to words to in between: Do we capture morphology?
  * Pinter+ 2017 Mimicking word embeddings using subword RNNs
  * Chaudhary+ 2018 Adapting word embeddings to new languages
    with morphological and phonological subword representations
  * Zhao+ 2018 Generalizing word embeddings using bag of subwords
* internal structure of words, that is, the syntactic or semantic composition
  * parameter sharing at the level of subword units
  * data sparsity problem, especially in resource-poor settings
  * morphologically rich languages (Gerz+ 2018)
    * Daniela Gerz, Ivan Vulić, Edoardo Maria Ponti, R Reichart, and A Korhonen
      On the relation between linguistic typology and (limitations of)
      multilingual language modeling
      EMNLP 2018
  * subword-agnostic word representation models are effectively unable to
    represent rare words accurately, or unseen words at all
* subword-informed word representation architectures aiming to address these
  * large number of architectures has been proposed in related research, and
    * Lazaridou+ 2013
    * Luong+ 2013
    * Qiu+ 2014 Co-learning of word representations and morpheme representations
    * Cotterell and Schütze, 2015
    * Wieting+ 2016
    * Avraham and Goldberg, 2017
    * Vania and Lopez, 2017
    * Pinter+ 2017
    * Cotterell and Schütze, 2018)
  * they can be clustered over the two main axes
    * method for segmenting words into subwords. The methods range
      * from fully supervised approaches (Cotterell and Schütze, 2015)
      * to e.g. unsupervised based on BPE (Heinzerling and Strube 2018)
    * the subword composition function used to obtain word embeddings
      (e.g., addition, self-attention)
* Following a similar work on subword-agnostic word embedding learning
  (Levy+ 2015), our system design choices resulting in different configurations
  can be seen as a set of hyper-parameters that also have to be carefully tuned
  for each language and each application task
* Our study aims at providing answers to
  * How generalizable are subword-informed models across typologically diverse
    languages and across different downstream tasks?
  * How important is it to choose an appropriate segmentation and composition
    method? How effective are more generally applicable unsupervised
    segmentation methods? Is it always better to resort to a supervised method,
  * Is there a difference in performance with and without the full word
    representation? Can more advanced techniques based on position embeddings
    and self-attention yield better task performance?

# 2 Methodology

## 2.1 The general framework

`w = f Θ (δ(w), W s , W p)`
* δ(w) is a deterministic function that segments w into an ordered sequence
  `S_w` of its constituent subword units from the subword vocabulary
* Optionally, [ methods can also generate a sequence of the ] morphotactic tags
* Alone or together with T w , S w is embedded into a sequence of subword reprs
* optional sequence of position embeddings P w
  taken from the position embedding matrix W p ∈ R p×d ,
  where p is the maximum number of the unique positions
* P w can interact with S w to compute the final representations for subwords
  (Vaswani+ 2017)
* similar to prior work (Bojanowski+ 2017), we adopt the standard skip-gram
  with negative sampling (SGNS) (Mikolov+ 2013) with bag-of-words contexts
  * other distributional models can also be used under the same framework
* Again, following Bojanowski+ (2017), we calculate the word embedding w t
   and parametrize context words with another word embedding matrix W c

## 2.2 segmentation of words into subword units

We consider three well-known segmentation methods for the function δ

### Supervised Morphological Segmentation

* We use CHIPMUNK (Cotterell+ 2015) as a representative supervised segmentation
  system, proven to provide a good trade-off between accuracy and speed
  * based on semi-Markov conditional random fields (Sarawagi and Cohen, 2005)
* For each word, it also outputs the corresponding morphotactic tags T w 
  In §2.3 we discuss how to incorporate information from T w

### Morfessor

* Morfessor (Smit+ 2014) denotes a family of generative probabilistic models
* used e.g. to learn morphologically aware word embeddings (Luong+ 2013)

### BPE Byte Pair Encoding (BPE; Gage (1993))

* a simple data compression algorithm. It has become
* a de facto standard for providing subword information in NMT (Sennrich+ 2016)
* iteratively replaces the most common pair of consecutive bytes
  with a new byte that does not occur within the data, and the
  number of iterations can be set in advance to control the granularity of the
  byte combinations 

### [summarized]

* An example output for all three methods is shown in Table 1
* Note that a standard practice in subword-informed models is to
  also insert the entire word token into S w (Bojanowski+ 2017)
  * This is [ again an optional step and we evaluate ] with and without
  * we use only basic information on affixes such as prefixes and suffixes, and
    leave the integration of fine-grained information such as inflectional and
    derivational affixes as future work

## 2.3 subword and position embeddings

* For CHIPMUNK,
  * we define each row in W s as the concatenation of the subword s and tag
  * For instance, the subword _post_ in _postwar_ and noun _post_ are diff
  * We also test without the use of T w
* optional position embedding sequence P w further operate on S w
  * for Morfessor and BPE, we use the absolute positions of subwords in S w ,
  * for CHIPMUNK morphotactic tags are encoded directly as positions
  * addition [or] element-wise multiplication between each subword and position
    * following prior work 
      * Gehring+ ICML 2017 Convolutional sequence to sequence learning
      * Mikolov+ 2018

## 2.4 composition functions

* A composition function f Θ is then applied to the sequence of subword embeds
  * 1) addition, 2) single-head and 3) multi-head self-attention
    (Vaswani+ 2017; Lin+ 2017)
    * more complex compositions based on CNNs and RNNs is also possible,
      but we have not observed improvement
      also in line with findings from recent work (Li+ 2018)
    * Addition is used in the original fastText model of Bojanowski+ (2017),
      and remains a strong baseline for many tasks
    * self-attention mechanism, that is, a learnable weighted addition
      * we are the first to apply [it] to the problem of subword composition

### Composition Based on Self-Attention

inspired by Lin+ (2017)

# 3 Experimental Setup

* English (EN), German (DE), Finnish (FI), Turkish (TR) and Hebrew (HE)

### Subword-Informed Configurations

* We use pretrained CHIPMUNK models for all test languages except for Hebrew,
  as Hebrew lacks gold segmentation data
* subword-agnostic SGNS (Mikolov+ 2013) and fastText (FT) (Bojanowski+ 17) 
  * can also be described by the general framework
  * used as insightful baselines
  * FT [generates all character n-grams of length 3 to 6] along with the full w

### Training Setup

* grid search of learning rate and batch size for each δ on the German
  WordSim-353 data set (WS; Leviant and Reichart (2015)).   
* hyperparameters are then fixed for all other languages and evaluation runs

## 3.1 Evaluation Tasks

### Word Similarity and Relatedness

* Multilingual SimLex-999  for English, German and Hebrew, each containing 999
  (SIMLEX; Hill+ (2015); Leviant and Reichart (2015); Mrkšić+ (2017)) 
* FinnSim-300 (FS 300) produced by Venekoski and Vankka (2017) for Finnish and
* AnlamVer (AN; Ercan and Yıldız (2018)) for Turkish
* We also run experiments on the WordSim-353 test set (WS; Finkelstein+ (2002))
  and its portions oriented towards true similarity and broader relatedness
  for English and German
* rare words, we evaluate on the recently released CARD-660 dataset (CARD;
  Pilehvar+ (2018)) for English, annotated for true semantic similarity

### Dependency Parsing

* Universal Dependencies treebanks (UD v2.2; Nivre+ (2016))
* subword-informed word embeddings from different configurations 
  to initialize the deep biaffine parser of Dozat and Manning (2017) 
  which has shown competitive performance in shared tasks (Dozat+ 2017) and
  among other parsing models (Ma and Hovy, 2017; Shi+ 2017; Ma+ 2018)

### Fine-Grained Entity Typing (Yaghoobzadeh and Schütze, 2015)

* a suitable semi-semantic task to test our subword models, as
  * the subwords usually carry some information [on] entity types
    e.g. _Lincolnshire_ will belong to /location/county as _-shire_ is a suffix
* dataset of Heinzerling and Strube (2018) built for over 250 languages
* we extend the RNNbased model of Heinzerling and Strube (2018),
  where they stacked all the subwords of entity tokens into a flattened seq
  we use the hierarchical embedding composition instead

# Results and Analysis

### Q1. Tasks and Languages

### Q2 and Q3. Configurations

### Further Discussion

* our best configuration surpasses all the SOTA models on the rare word
* accurate representations for rare and unseen words
  * Bhatia+ 2016 Morphological priors for probabilistic neural word embeddings
  * Herbelot and Baroni, 2017
    High-risk learning: acquiring new word vectors from tiny data
  * Schick and Schütze, 2018
    Learning semantic representations for novel words:
      Leveraging both form and context

# Conclusion

* segmentation and composition methods, or the use of position embeddings, have
  to be carefully tuned

# Acknowledgments

Roi Reichart for many fruitful discussions

# Supplemental Material 13
