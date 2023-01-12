Predicting Word Embeddings Variability
Bénédicte Pierrejean and Ludovic Tanguy
naacl 2018

# Abstract

* when retraining a model with the exact same hyperparameters
* features that are intrinsic to a word, corpus or embedding model

# 1 Intro

* stability problems (Hellrich and Hahn, 2016)
* intrinsic tests
  Neha Nayak, Gabor Angeli, and Christopher D. Manning. 2016
  Evaluating word embeddings using a representative suite of practical tasks
  2016 1st Workshop on Evaluating Vector Space Representations for NLP, Berlin,
* predicting the stability of a word can also help refine a model
  (eg by removing selected semantic classes)
* We
  * features that are intrinsic to a word, a corpus or a model:
    POS, degree of polysemy, frequency, distribution of the contexts,
    position and environment of a vector in the semantic space
  * multilinear regression model predict up to 48% of the variance
    * with pairwise interactions
  * conducted on 3 different corpora with similar results

# 2 Experiment Setup

* To measure the variation for a word between two embedding models, we used an
  approach similar to Sahlgren (2006) by measuring the
  nearest neighbors overlap for words common to the two models. More precisely
* N = 25
* This measure may also be sensible to hubness
  * they were limited to surnames for the BNC and did not interfere
    with our measure of stability for all other areas of the lexicon
* 3 different corpora: ACL, BNC and PLOS (biology scientific articles)
  * same size (about 100 million words) but they are from different types (the
  * BNC is a generic corpus while PLOS and ACL are specialized corpora) and
  * lemmatized and POS-tagged using the Talismane toolkit (Urieli, 2013)

# 3 Models Variation

* Standard deviation
  * is low (average of 0.04) across the 10 pairs of models, meaning that the
  * across words is much higher (average of 0.08), which indicates that there
* semantic clusters that remained stable across models
  * temporal expressions (am, pm, noon) in the BNC that
  * co-hyponyms
    * family members in the BNC (wife, grandmother, sister...),
    * linguistic preprocessing in ACL (parsing, lemmatizing, tokenizing...) and
    * antibiotics in PLOS (puromycin, blasticidin, cefotaxime...)
    * For ACL and PLOS the transdisciplinary scientific words
      * (conjunctive adverbs such as nevertheless, moreover, furthermore and
      scientific processes such as hypothethize, reason, describe)
* high variation we found a large number of
  * tagging errors and proper nouns
  * highly polysemic words (sign in ACL, make in the BNC) and
  * generic adjectives, i.e. adjectives than can modifiy almost any noun
    (special in ACL, current in PLOS and whole in the BNC)

# 4 Predicting the Variation

## Selected Features

* features that are intrinsic to the word, corpus or model:
  * pos: part of speech (nouns, adjectives, adverbs, verbs, proper nouns);
  * polysemy: degree
    * number of definitions in ENGLAWI (Sajous and Hathout, 2015)
  * frequency (Sahlgren and Lenci, 2016)
  * entropy: dispersion of the contexts of a word;
    * normalized entropy of a word’s collocates computed on a
      symmetrical rectangular window of 5 for open classes words only
  * norm: L2-norm of the vector of the word in the semantic space;
    * since Trost and Klakow (2017) found that the L2-norm of common words
      do not follow the general distribution of the model
  * NN-sim: cosine similarity of the word nearest neighbor

## Models and Results

* feature ablation approach similar to Lapesa and Evert (2017)
* similar global pattern for models trained on the 3 corpora with two features
* cosine similarity of the NN explains
  * around 20% of the variance. This was expected given the way we measure
  * less than half of the predictive model’s power, meaning that there are
* POS also has a high impact on the model trained
* Other features have less impact on the regression models trained
  * entropy and the polysemy for all 3 corpora
  * norm and frequency have a slightly different impact depending on the corpus
* POS, we confirm that proper nouns have a higher variation
* norm of the vector is negatively correlated to variation
  * geometry of word embeddings vector space. E.g., Mimno and Thompson (2017)
    David Mimno and Laure Thompson
    emnlp 2017
    The strange geometry of skip-gram with negative sampling
* The effect of the frequency is not monotonic. Words having very
  * low or very high frequency are more affected by variation
  * frequent words displaying instability words in each corpus
    (eg  gene and protein in PLOS, language in ACL and make in BNC etc.)
* (polysemy and entropy) experiments confirm that
  distributional semantics has more difficulty in representing the meaning of
  words that appear in a variety of contexts
