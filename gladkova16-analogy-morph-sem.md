Analogy-based Detection of Morphological and Semantic Relations
  With Word Embeddings: What Works and What Doesn’t
Anna Gladkova, Satoshi Matsuoka, Aleksandr Drozd
2016

# Newer papers

* Inducing relational knowledge from BERT
  Z Bouraoui, J Camacho-Collados… - 
  AAAI 2020

## Analogy datasets in other languages :

* https://aclanthology.org/L18-1320.pdf
  MGAD: Multilingual Generation of Analogy Datasets 
  Mostafa Abdou, Artur Kulmizev, Vinit Ravishankar
* https://aclanthology.org/2020.lrec-1.501.pdf
  Multilingual Culture-Independent Word Analogy Datasets 
  Matej Ulčar, Kristiina Vaik, J Lindström, M Dailidėnaitė, M Robnik-Šikonja

# Abstract

* 4 types of linguistic relations:
  * inflectional and derivational morphology, and
  * semantics
    * lexicographic and
      * Hypernym
        * L01: animals (cat:feline)
        * L02: miscellaneous (plum:fruit, shirt:clothes)
      * Hyponym
        * L03: miscellaneous (bag:pouch, color:white)
      * Meronym
        * L04: substance (sea:water)
        * L05: member (player:team)
        * L06: part-whole (car:engine)
      * Synonym
        * L07: intensity (cry:scream)
        * L08: exact (sofa:couch)
      * Antonym
        * L09: gradable (clean:dirty)
        * L10: binary (up:down)
    * encyclopedic semantics
* We present a balanced test set
  * with 99,200 questions in 40 categories, and
  * systematically examine how accuracy ... is affected by
    window size and dimensionality of the SVD-based word embeddings
  * show that GloVe and SVD yield similar patterns of results

# 1 Intro

* Analogical reasoning ... can be used for
  * morphological analysis (Lavallée and Langlais, 2010),
  * word sense disambiguation (Federici+ 1997), and even for
  * detection of ... morphological and semantic features (Lepage and Goh, 2009)
    * Yves Lepage and Chooi-ling Goh. 2009
      Towards automatic acquisition of linguistic features
  * Köper+ (2015) showed that lexicographic relations such as _synonymy_
    are _not_ reliably discovered in the same way

# 2 Related work

* synonymy and antonymy (Turney, 2008),
* ConceptNet relations and selectional preferences
  (Herdadelen and Baroni, 2009)
* inducing morphological categories from unparsed data
  (Soricut and Och, 2015)
* current sets tend to only include a certain type of relations
  * semantics-only: SAT (Turney+ 2003), SemEval2012-Task2 (Jurgens+ 2012),
  * morphology-only: MSR (Mikolov+ 2013b)).  The
  * Google analogy test (Mikolov+ 2013a) contains 9 morphological and 5 sem
    20-70 unique word pairs per category
  * For semantic relations there are also
    * generic resources such as EVALution (Santus+ 2015), and
    * semantic similarity sets such as BLESS and WordSim353 (Baroni & Lenci 11)
      * sometimes used as sources for compiling analogy tests
      * Vylomova+ (2015) presents a compilation with
        * 18 relations in total (58 to 3163 word pairs per relation):
        * 10 semantic, 4 morphological, 2 affix-derived word relations, animal
          collective nouns, and verb-object pairs
* the only study ... that provides data for individual categories is Levy+ (14)
* Model parameters can also have a major impact (Levy+ 2015; Lai+ 2015)
  * studied in the context of
    * semantic priming (Lapesa and Evert, 2014),
    * semantic similarity tasks (Kiela and Clark, 2014), and
    * across groups of tasks (Bullinaria and Levy, 2012)
  * dependency-based word embeddings perform
    better on similarity task, but worse on analogies (Levy & Goldberg, 2014a)
  * effects of changing model parameters on general accuracy on Google analogy
    test (Levy+ 2015; Lai+ 2015)
  * this is the first study to address the effect of model parameters on
    _individual_ linguistic relations

# 3 The Bigger Analogy Test Set (BATS)

* 40 linguistic relations that are listed in table 1
  * Each represented with 50 unique word pairs
  * 2480 questions (99,200 in all set)
  * balanced across 4 types of relations
* morphological categories are sampled to reduce homonymy. For example,
  for verb present tense the Google set includes pairs like walk:walks, which
  could be both verbs and nouns
* we select 50 pairs by top frequency in our corpus
* semantic part of BATS does include homonyms, since semantic categories are
  overall smaller
  * However, we did our best to avoid clearly ambiguous words;
    e.g. prophet Muhammad was not included in the E05 name:occupations section,
    because many people have the same name
* lexicographic part of BATS is based on SemEval2012-Task2,
  extended by the authors with words similar to those included in SemEval set
  About 15% of extra words came from BLESS and EVALution
  * encyclopedic section was com- piled on the basis of word lists in Wikipedia
    and other internet resources

# 4 Testing the test

## The vector offset method

* Mikolov+ (2013a)
  `argmax_{d \in V} sim(d, c − a + b)`
* Levy and Goldberg (2014b) propose an alternative optimization objective:
  `argmax_{d \in V} cos(d − c, b−a)`

## Corpus and models

* (de)merits of count-based models as compared to the neural-net-based models
* Our source corpus
  * combines the
    * English Wikipedia snapshot from July 2015 (1.8B tokens),
    * Araneum Anglicum Maius (1.2B) (Benko, 2014) and
    * ukWaC (2B) (Baroni+ 2009)
  * We discarded words occurring less than 100 times, resulting in vocabulary
    of 301,949 words (uncased).  To check the validity of our models we
    evaluate it with the Google test set for which there are numerous reported
    results. For GloVe we used the
    * parameters from the original study (Pennington+ 2014): 300 dimensions,
      window 10, 100 iterations, x max = 100, a = 3/4, sentence borders ignored
    * we also built an SVD model with 300 dimensions and window size 10
  * On our 5 B corpus GloVe achieved 80.4% average accuracy (versus 71.7% on 6
    B corpus in the original study)

# 5 Results and discussion

## 5.1 Word category effect

* neither of them achieves even 30% accuracy, suggesting that
  * BATS is much more _difficult_ than the Google test set. Many categories are
  * overall pattern of easier and more difficult categories is the
    same for GloVe and SVD
* high _variation_ we observe in this experiment
  consistent with evidence from systems competing at SemEval2012-Task2, where
  * [no] system was able to achieve superior performance on all subcategories
  * Fried and Duh (2015) also showed a similar pattern in 7 different embeds
* inflectional morphology is overall easier than semantics, as
  shown even by the Google test results
* derivational morphology is significantly more difficult
* lex: BATS make the task easier by accepting several correct answers
  * The easiest category is binary antonyms of the up:down kind
  * typical mistake that our SVD models make in semantic questions is
    suggesting a morphological form of one of the source words in the
    a:b::c:d analogy
    e.g. cherry:red :: potato:?potatoes instead of potato:brown
    * It would thus be beneficial to exclude from the set of possible answers
      not only the words a, b and c, but also their morphological forms

## Window size effect

* Lebret and Collobert (2015) shows
  * [sem] benefit from larger windows while [synt] do not
  * Evaluating two count-based models on sem and synt  parts of the Google test
* Our experiments with SVD models using different window sizes only partly
  concur with this finding
  * All categories are best detected between window sizes 2-4, although
    9 of them yield equally good performance in larger windows. This indicates
  * [no] one-on-one correspondence between “semantics” and “larger windows”
* Levy+ (2015) suggest that GloVe actually benefits from larger windows

## Vector dimensionality effect

* 19 BATS categories
  * either peaked at 1200 dimensions or did not start decreasing by that point
* the other 20 relations show all kinds of patterns
  * 14 categories peaked between 200 and 1100 dimensions

## Other parameters

* changing the power `a` for the Σ matrix of the SVD transformation can
  [change] the performance on individual categories by 40-50%
  * Smaller value of `a` gives
    more weight to the dimensions which capture less variance
    * can correspond to subtle linguistic nuances
  * no setting yields the best result for all categories
* word frequency,
  * Some categories could perform worse because they
    contain only low-frequency vocabulary;
  * SVD was shown to handle low frequencies well (Wartena, 2014)

# Conclusion

* phrases
  * BATS ... not focus on word _phrases_, but we included WordNet phrases as
    possible correct answers, which may be useful for phrase-aware models
