Cross-lingual Models of Word Embeddings: An Empirical Comparison
Shyam Upadhyay, Manaal Faruqui, Chris Dyer, Dan Roth
ACL 2016

Instructions and code to reproduce the experiments available at
http://cogcomp.cs.illinois.edu/page/publication_view/794

# Abstract

* a systematic comparison of
  * four popular approaches of inducing cross-lingual embeddings,
    each requiring a different form of supervision, on
  * four typologically different language pairs
* tasks, including
  * intrinsic evaluation on mono-lingual and cross-lingual similarity, and
  * extrinsic evaluation on downstream semantic and syntactic applications. We
* show that
  * models which require expensive cross-lingual knowledge
    almost always perform better, but
  * cheaply supervised models often prove competitive on certain tasks

# 1 Intro

* quality of ... word vectors can be significantly improved by incorporating
  cross-lingual distributional information
  * Klementiev+ 2012; Zou+ 2013; Vulić and Moens, 2013b;
    Mikolov+ 2013b; Faruqui and Dyer, 2014; Hermann and Blunsom, 2014;
    Chandar+ 2014, inter alia
  * monolingual (Faruqui and Dyer, 2014; Rastogi+ 2015) and
  * cross-lingual tasks
    Guo+ 2015; Søgaard+ 2015; Guo+ 2016
* different form of cross-lingual supervision – some can use
  * document-level alignments (Vulić and Moens, 2015)
  * sentence (Hermann and Blunsom, 2014; Gouws+ 2015) or
  * word level (Faruqui and Dyer, 2014; Gouws and Søgaard, 2015)
  * both sentence and word alignments (Luong+ 2015)
* organization
  * intrinsic evaluation assesses the quality of the vectors on
    * monolingual (§4.2) and cross-lingual (§4.3) word similarity tasks, while
  * extrinsic evaluation spans
    * semantic (cross-lingual document classification §4.4) and
    * syntactic tasks (cross-lingual dependency parsing §4.5)
* show that
  * word vectors trained using expensive cross-lingual supervision (word
    alignments or sentence alignments) perform the best on semantic tasks
  * for syntactic tasks like cross-lingual dependency parsing, models
    requiring weaker form of cross-lingual supervision (such as context
    agnostic translation dictionary) are competitive

# 2 Bilingual Embeddings

## 2.1 Bilingual Skip-Gram Model (BiSkip)

* Luong+ (2015) proposed Bilingual SkipGram, a simple extension of the
  monolingual skipgram model, which learns bilingual embeddings by
  * using a parallel corpus along with word alignments (both sentence and word
    level alignments).  The
  * learning objective is a simple extension of the skip-gram model, where the
    context of a word is expanded to include bilingual links obtained from
    word alignments, so that the model is trained to predict words
    cross-lingually

## 2.2 Bilingual Compositional Model (BiCVM)

* Hermann and Blunsom (2014) present a method that learns bilingual word
  vectors from a sentence aligned corpus
* Let functions f : ~v → R n and g : w ~ → R n, map sentences to their sem
  representations in R n
  * BiCVM generates word vectors by
    minimizing the squared l2 norm between the sentence representations of
    aligned sentences
  * In order to prevent the degeneracy arising from directly minimizing the l2
    norm, they use a noise-contrastive large-margin update,
    with randomly drawn sentence pairs

## 2.3 Bilingual Correlation Based Embeddings (BiCCA)

The BiCCA model, proposed by Faruqui and Dyer (2014), showed that when
(independently trained) monolingual vector matrices W, V are projected using
CCA (Hotelling, 1936) to respect a translation lexicon, their performance
improves on word similarity and word analogy tasks. They first construct W 0
⊆ W, V 0 ⊆ V such that |W 0 |= |V 0 | and the corresponding words (w i, v i )
in the matrices are translations of each other

## 2.4 Bilingual Vectors from Comparable Data (BiVCD)

* proposed by Vulić and Moens (2015). Their approach is designed to
* use comparable corpus between the source and target language pair to induce
  crosslingual vectors
* BiVCD first merges these two comparable documents into a single pseudo-
  bilingual document
* Although BiVCD is designed to use comparable corpus, we provide it with
  parallel data in our experiments (to ensure comparability), and treat two
  aligned sentences as comparable

# 3 Data

* 4 language pairs: English-German (en-de), English-French (en-fr),
  English-Swedish (en-sv) and English-Chinese (en-zh)
  * For en-de and en-sv we use the Europarl v7 parallel corpus (Koehn, 2005)
  * For en-fr, we use Europarl combined with the newscommentary and UN-corpus
    dataset from WMT 2015
  * For en-zh, we use the FBIS parallel corpus from the news domain
    (LDC2003E14)

# 4 Evaluation

* These tasks have been used in previous works
  (Klementiev+ 2012; Luong+ 2015; Vulić and Moens, 2013a; Guo+ 2015)
  for evaluating cross-lingual embeddings, but
  no comparison exists which uses them in conjunction
* all models are trained with embeddings of size 200. We provide all models
  with parallel corpora, irrespective of their requirements

## 4.1 Parameter Selection

* We follow the BestAvg parameter selection strategy from Lu+ (2015): we
  * by tuning on a set of values (described below) and picking the parameter
    setting which did best on an average across all tasks
* az epochok száma korrekt?
* BiSkip. All models were trained using a
  * window size of 10 (tuned over {5, 10, 20}), and
  * 30 negative samples (tuned over {10, 20, 30}).  The
  * cross-lingual weight was set to 4 (tuned over {1, 2, 4, 8}).  The
  * word alignments for training the model (available at github
    com/lmthang/bivec) were generated using fast_align (Dyer+ 2013)
  * The number of training iterations was set to 5 (no tuning) and we set
  * α = 1 and β = 1 (no tuning)
* BiCVM. We use the
  * tool (available at github.com/karlmoritz/bicvm)
  * additive model (that is, f (~x ) = g(~x ) = i x i ) with
  * hinge loss margin set to 200 (no tuning),
  * batch size of 50 (tuned over 50, 100, 1000) and
  * noise parameter of 10 (tuned over {10, 20, 30})
  * 100 iterations (no tuning)
* BiCCA. First,
  * monolingual word vectors are trained using the skip-gram model with
    negative sampling (Mikolov+ 2013a) with
  * window of size 5 (tuned over {5, 10, 20}). To generate a
  * cross-lingual dictionary, word alignments are generated using cdec from
    the parallel corpus. Then, word pairs (a, b), a ∈ l 1, b ∈ l 2 are
    selected such that a is aligned to b the most number of times and vice
    versa. This way, we obtained dictionaries of approximately 36k, 35k, 30k
    and 28k word pairs for en-de, en-fr, en-sv and en-zh respectively.  The
  * tool available at github.com/mfaruqui/eacl14-cca
  * k = 0.5 as the number of canonical components
    (tuned over {0.2, 0.3, 0.5, 1.0}). Note that
  * this results in a embedding of size 100 after performing CCA
* word2vec’s skip gram model for training our embeddings, with a
  * window size of 5 (tuned on {5, 10, 20, 30}) and
  * negative sampling parameter set to 5 (tuned on {5, 10, 25})
  * Every pair of parallel sentences is treated as a pair of comparable
    documents, and merging is performed using the sentence length ratio
    strategy

## 4.2 Monolingual Evaluation

* SimLex dataset for English (Hill+ 2014) which contains 999 pairs
  * across all language pairs, BiCVM is the best performing model in terms of
    Spearman’s correlation, but its improvement over BiSkip and BiVCD is often
    insignificant. It is notable that 2 of the 3 top performing models, BiCVM
    and BiVCD, need sentence aligned and document-aligned corpus only, which
    are easier to obtain than parallel data with word alignments required by
    BiSkip
* QVEC . Tsvetkov+ (2015)
  * metric
    * linguistic properties
    * shown to have strong correlation with performance on downstream semantic
    applications
    * it can be currently only used for English
  * BiSkip achieves the best score, followed by Mono (mono-lingually trained
    English vectors), BiVCD and BiCCA
    * A possible explanation for why Mono scores are better than those
      obtained by some of the cross-lingual models is that Q VEC measures
      monolingual semantic content based on a linguistic oracle made for
      English
* BiCVM which was the best model according to SimLex, ranks last according to
  Q VEC . The fact that the best models according to Q VEC and word
  similarities are different reinforces observations made in previous work
  that performance on word similarity tasks alone does not reflect
  quantification of linguistic properties of words (Tsvetkov+ 2015;
  Schnabel+ 2015)

## 4.3 Cross-lingual Dictionary Induction

* (Vulić and Moens, 2013a; Gouws+ 2015; Mikolov+ 2013b)
* We follow the setup of Vulić and Moens (2013a)
* we derived our gold dictionaries using the Open Multilingual WordNet data
  * released by Bond and Foster (2013). The data includes synset alignments
    across 26 languages with over 90% accuracy.  First,
  * we prune out words from each synset whose frequency count is less than
    1000 in the vocabulary of the training data from §3.  Then, for each
    pair of aligned synsets s 1 = {k 1, k 2, · · ·} s 2 = {g 1, g 2, · ·
    ·}, we include all elements from the set {(k, g) | k ∈ s 1, g ∈ s 2 }
    into the gold dictionary, where k and g are the lemmas. Using this
    approach
  * we generated dictionaries of sizes 1.5k, 1.4k, 1.0k and 1.6k pairs for
    en-fr, en-de, en-sv and en-zh respectively
  * We report top-10 accuracy, which is the fraction of the entries (e, f )
    in the gold dictionary, for which f belongs to the list of top-10
    neighbors of the word vector of e, according to the induced
    cross-lingual embeddings.  From the
  * results (Table 4), it can be seen that for dictionary induction, the
    performance improves with the quality of supervision

# 4.4 Cross-lingual Document Classification

* setup of Klementiev+ (2012), but extend it to cover all of our
  language pairs. We use the
* RCV2 Reuters multilingual corpus 7 for our experiments. In this
* task: for a language pair (l 1, l 2 ), a document classifier is trained
  using the document representations derived from word embeddings in language
  l 1, and then the trained model is tested on documents from language l 2
  (and vice-versa). By using supervised training data in one language and
  evaluating without further supervision in another, CLDC assesses whether the
  learned cross-lingual representations are semantically coherent across
  multiple languages
* All embeddings are learned on the data described in §3, and we only
* use the RCV2 data to learn document classification models
* document representation by taking the tf-idf weighted average of vectors of
  the words present in it
* A multi-class classifier is trained using an averaged perceptron (Freund and
  Schapire, 1999) for 10 iterations, using the document vectors of language l
  1 as features
  * Majority baselines for en → l 2 and l 1 → en are 49.7% and 46.7%
    respectively, for all languages
* in almost all cases, BiSkip performs significantly better than the remaining
  models. For transferring semantic knowledge across languages via embeddings,
  sentence and word level alignment proves superior to sentence or word level
  alignment alone
  * consistent with the trend in cross-lingual dictionary induction, where too
    the most expensive form of supervision performed the best

## 4.5 Cross-lingual Dependency Parsing

* direct-transfer of dependency parsers was first shown in Täckström+
  (2012)
* we use the cross lingual transfer setup of Guo+ (2015). 10 Their
  framework trains a transition-based dependency parser using nonlinear
  activation function, with the source-side embeddings as lexical features
  These embeddings can be replaced by target-side embeddings at test time
* we turn off other features that can capture distributional information like
  brown clusters, which were originally used in Guo+ (2015). We use the
  universal dependency treebank (McDonald+ 2013)
* BiCCA does better than other models.
  * BiSkip is a close second, with an average performance gap of < 1 point.
    * outperforms BiCVM on German and French (over 2 point improvement), owing
      to word alignment information BiSkip’s model uses during training
  * It is not surprising that English-Chinese transfer scores are low,
    due to the significant difference in syntactic structure
  * models with expensive supervision requirements like BiSkip and BiCVM
    could not outperform a cheaply supervised BiCCA
* whether using cross-lingually trained vectors for learning dependency
  parsers is better than using mono-lingually trained vectors in Table 7
  * improvement over the monolingual embeddings was obtained with the BiSkip
    and BiCCA models, while BiCVM and BiVCD consistently performed worse
    * A possible reason for this is that BiCVM and BiVCD operate on sentence
      level contexts to learn the embeddings, which only captures the semantic
      meaning of the sentences and ignores the internal syntactic structure

# 5 Qualitative Analysis

BiCCA and BiVCD are better at separating antonyms. The words peace and war,
(and their French translations paix and guerre) are well separated in BiCCA
and BiVCD. However, in BiSkip and BiCVM these pairs are very close together
This can be attributed to the fact that BiSkip and BiCVM are trained on
parallel sentences, and if two antonyms are present in the same sentence in
English, they will also be present together in its French translation
However, BiCCA uses bilingual dictionary and BiVCD use comparable sentence
context, which helps in pulling apart the synonyms and antonyms

# 6 Discussion

* Ammar+ (2016) train multilingual word vectors using more than two
  languages;
* The paper does not cover all approaches that generate cross-lingual word
  embeddings.  Some methods
  * do not have publicly available code
    (Coulmance+ 2015; Zou+ 2013)
  * for others, like BilBOWA (Gouws+ 2015), we identified problems in
    the available code, which caused it to consistently produced results that
    are inferior even to mono-lingually trained vectors
    * We contacted the authors of the papers and were unable to resolve the
      issues in the toolkit
* the models that we included for comparison in our survey are representative
  of other cross-lingual models in terms of the form of crosslingual
  supervision required by them. For example,
  * BilBOWA (Gouws+ 2015) and crosslingual Auto-encoder (Chandar et
    al., 2014) are _similar to BiCVM_ in this respect
  * Multi-view CCA (Rastogi+ 2015) and deep CCA (Lu+ 2015) can
    be viewed as _extensions of BiCCA_

# 7 Conclusion

* When evaluating on intrinsic tasks such as monolingual word similarity,
  models relying on cheaper forms of supervision (such as BiVCD) perform al-
  most on par with models requiring expensive supervision
* cross-lingual semantic tasks, like cross-lingual document classification
  and dictionary induction,
  the model with the most informative supervision performs best overall
* syntactic task of dependency parsing,
  models that are supervised at a word alignment level perform slightly better
