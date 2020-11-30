The Limitations of Cross-language Word Embeddings Evaluation
Amir Bakarov, Roman Suvorov, Ilya Sochenkov
naacl 2018

# Abstract

* lack of correlation between intrinsic and extrinsic cross-language
* we
  * construct English-Russian datasets for extrinsic and intrinsic evaluation
  * compare performances of 5 different cross-language models on them
  * scores even on different intrinsic benchmarks do not correlate to each other
* one [have to] understand how do native speakers process semantics

# 1 Intro

* bib
  * (cross-language word embeddings) rapidly gained popularity in the NLP
    community (Vulić and Moens, 2013)
  * effectiveness in certain cross-language NLP tasks (Upadhyay+ 2016)
* In this study as an extrinsic task: cross-language paraphrase detection task
  * because [both] word similarity and paraphrase detection evaluate
    semantic modeling (i.e. not ... POS tags, or the ability to cluster words)

# 2 Related Work

* cross-language word embeddings evaluation (Camacho-Collados+ 2015)
* effect of assessments’ language (Leviant and Reichart, 2015)
* intrinsic and extrinsic evaluation techniques (Upadhyay+ 2016)
* lack of correlation of intrinsic and extrinsic tasks for mono-language
  evaluation (Schnabel+ 2015)
* more extensive overview of cross-language word embeddings evaluation methods
  (Ruder, 2017)
  * [no] empirical analysis
* works [from] cross-language information retrieval (Braschler+ 2000),
  * no ... from the position of word embeddings

# 3 Problems of Cross-language Evaluation

* ... against human references on any intrinsic task
1. Translation Disagreement
  * two different words with the same translation or with different POS
  * (Camacho-Collados+ 2015)
  * some words could have no translations while some words could have multiple
  * could be partially avoided if ... the problematic words would be dropped
    * how the agreement for word dropping of human assessors could be concluded
2. Scores Re-assessment
  * Some researchers obtain [scores for cross-lingual embeds by] automatically
    averaging the scores from the mono-language datasets
  * Another option [is] manual scoring of a new dataset by bilingual assessors
3. Semantic Fields
  * lexical typology, the meaning of a properly translated word could denote a
    bit different things in a new languages (Ryzhova+ 2016)
  * dataset ... should consist only of zero valency nouns
    * more properly linked with real world objects
    * exclude relational nouns (Koptjevskaja-Tamm+ 2015)
    * distinction of words on relational and non-relational ones is fuzzy
4. New Factors for Bias
  * connotative associations [could influence the mono-ling] human assessments
    (Liza and Grzes, 2016)

# 4 Experimental Setup

## 4.1 Distributional Models ... cross-language

1. MSE (Multilingual Supervised Embeddings)
  * Trains using a bilingual dictionary and
  * learns a mapping ... using Procrustes alignment (Conneau+ 2017)
2. MUE (Multilingual Unsupervised Embeddings)
   * adversarial training and Procrustes refinement (Conneau+ 2017)
3. VecMap (Artetxe+ 2018)
  * using a bilingual dictionary or shared numerals
    minimizing the squared Euclidean distance between embedding matrices
4. BiCCA (Bilingual Canonical Correlation Analysis, Faruqui and Dyer, 2014)
5. MFT (Multilingual FastText)
  * Uses SVD to learn a linear transformation (Smith+ 2017)
* We mapped vector spaces of Russian and English FastText models
  * English-Russian bilingual dictionary (Conneau+ 2017)

## 4.2 Intrinsic Tasks

### Word Semantic Similarity

* three publicly available datasets for cross-language word similarity
  (Camacho-Collados+ 2015, 2017)
* for Russian, ... we created the crosslanguage datasets ourselves
  * We used
    * 5 English datasets assessed by semantic **S**imilarity of Ns and As (S),
    * 3 datasets assessed by semantic similarity of **V**erbs, and
    * 3 datasets assessed by semantic **R**elatedness of nouns and adjectives

      (R); we labeled each with a letter reporting the type of relations. We
      translated these datasets, merged into cross-language sets (the first
      word of each word pair was English, and the second was Russian), dropped
      certain words pairs according to limitations addressed by us (in the
      Section 2), and
  * re-assessed ... with the help of 3 English-Russian volunteers, having
    Krippendorff’s alpha 0.5

### Dictionary Induction (also called word translation)

## Extrinsic Task and Our Dataset

### Cross-language Paraphrase Detection

* a sub-task of bigger tasks like cross-language plagiarism detection

# 5 Results and Discussion

* mutual similarities between datasets
  * measured as Spearman’s rank correlation between evaluation scores
  * One can see ... at least 4 clusters:
    extrinsic+SemEval; word relations; word translation+some word similarities;
    others

# 6 Conclusions and Future Work

* Our research does not address some
  * evaluation methods (like MultiQVEC (Ammar+ 2016)) and
  * word embeddings models (for instance, Bivec (Luong+ 2015)) 
    since Russian do not have enough ... parallel corpora
* In future we plan
  * other languages
  * cross-language extensions of the analogical reasoning task
