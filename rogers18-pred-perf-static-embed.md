What’s in Your Embedding, And How It Predicts Task Performance
Anna Rogers, Shashwath Hosur Ananthakrishna, Anna Rumshisky
COLING 2018

http://ldtoolkit.space

# Abstract

* ?a single technique for general-purpose intrinsic evaluation of word embeds
  * Attempts so far not successful
* We present a new approach
  based on scaled-up qualitative analysis of word vector neighborhoods that
  quantifies interpretable characteristics of a given model
  (eg its preference for synonyms or shared morphological forms as neighbors)
* We analyze 21 such factors
  * morphological, semantic and distributional
  * correlate with performance on 14 extrinsic and intrinsic task datasets
    (and also explain the lack of correlation between some of them)
  * Our approach enables multi-faceted evaluation, parameter search, and a
    more principled, hypothesis-driven approach to devel distri sem reprs

# 1 Intro

* Dense lexical embeddings are the most common distributional semantic reprs
  (Bengio+ 2003; Collobert and Weston, 2008; Mikolov+ 2013a; Pennington+ 2014;
  Ruppert+ 2015)
  * Eugen Ruppert, Manuel Kaufmann, Martin Riedl, and Chris Biemann. 2015
    JOBIMVIZ: A web-based visualization for graph-based distributional semantic
    ACL-IJCNLP 2015 System Demonstrations, pages 103–108, Beijing, China, July
  * used in task-specific neural network models, solving such tasks as
    named entity recognition (Guo+ 2014), semantic role labeling (Chen+ 2014),
    syntactic parsing (Chen and Manning, 2014)
* Each year dozens of new models are proposed, each of them with multiple
  hyper-parameters that may dramatically influence performance
  * Lapesa & Evert 2014 A large scale evaluation of distributional semantic mod
  * Kiela & Clark 2014 A systematic study of semantic vector space model params
  * Levy+ 2015 Improving distributional similarity with lessons from word embed
  * Lai+ 2016 How to generate a good word embedding
  * Melis+ 2017 On the SOTA of Evaluation in Neural Language Models
* Equally important are the source corpus, its domain, and the type of context
  (Padó & Lapata 2007; Levy & Goldberg 2014a; Li+ 2017; Lapesa & Evert 2017)
* exponential explosion of options in the quest for the best model for a task
* Ideally: a single intrinsic metric for identifying “good” embeddings
  * many proposals for such a metric
  * eg word relatedness and analogies
  * hE none of them predict performance on a wide range of tasks (Chiu+ 2016)
* different extrinsic tasks may rely on different aspects of word reprs
  * what aspects of language
    * an embedding captures
    * are relevant for different tasks
* we propose Linguistic Diagnostics (LD)
  * a new approach to automated qualitative analysis of vector neighborhoods
  * the first large-scale attempt to identify and quantify the factors that
    make word embeddings successful with different tasks
  * We evaluate GloVe and Word2Vec with varying vector sizes and
    4 types of context
  * identifying 21 factors that, to varying extent, correlate with performance
  * 14 extrinsic and intrinsic task datasets
  * can be used for model development and optimization besides evaluation
* implemented in LDT (Linguistic Diagnostics Toolkit),
  an open-source Python library that offers a wide range of analysis options
  * corpus-based statistics, psychological association norms, and dictionaries
  * broad lexical coverage thanks to a combination of the English WordNet,
    Wiktionary, and BabelNet, and potentially extensible to many languages

# 2 Related Work

* semantic relatedness tests
  (Finkelstein+ 2002; Bruni+ 2014; Luong+ 2013; Radinsky+ 2011)
  * Perhaps the most popular kind of intrinsic evaluation of word embeddings
  * idea: the distance between word vectors should correlate with
    human judgements of how related the two words are
    (eg, cat should be closer to tiger than to hammer)
  * semantic similarity (Agirre+ 2009; Hill+ 2015)
    * restricts relatedness to synonymy and co-hyponymy
* has come under fire for methodological reasons
  (Faruqui+ 2016; Batchkarov+ 2016)
  * Miroslav Batchkarov, Thomas Kober, Jeremy Reffin, Julie Weeds,  David Weir
    A critique of word similarity as a method for evaluating distri sem models
    2016 The 1st Workshop on Evaluating Vector Space Representations for NLP,
  * unreliability of the “middle” judgments
    * not clear whether cat should be closer to lion or to tiger
      (Gladkova and Drozd, 2016)
  * only 1 out of 10 datasets was a good predictor of performance on sequence
    labeling tasks (Chiu+ 2016)
  * evaluation via coherence of semantic space (Schnabel+ 2015)
    * inherits all the problems with relatedness (Gladkova and Drozd, 2016)
* proposals for “subconscious intrinsic evaluation” (Bakarov, 2018)
  * correlations with psycholinguistic data such as
    * N400 effect (Van Petten, 2014; Ettinger+ 2016)
    * fMRI scans (Devereux+ 2010; Søgaard, 2016)
    * eye-tracking (Klerke+ 2015; Søgaard, 2016)
    * semantic priming data (Lund+ 1995; Lund and Burgess, 1996; Jones+ 2006;
      Lapesa and Evert, 2013; Ettinger and Linzen, 2016; Auguste+ 2017)
  * hE no large-scale studies that would show the utility of these methods
    in predicting downstream task performance
    * possible that psychological measures share the subjectivity problem
      of relatedness judgments
* word analogy task (Mikolov+ 2013b)
  * idea: the “best” word embedding is the one that
    encodes linguistic relations in the most regular way
    * simple vector offset should be sufficient to capture semantic shifts eg
      France : Paris to Japan : Tokyo
  * hE, this view of linguistic relations (and analogical reasoning) is
    oversimplified
    * performance depend on cosine similarity between source word vectors
      (Rogers+ 2017; Linzen, 2016; Levy and Goldberg, 2014b)
  * underestimating the amount of semantic info captured by the embedding
    (Drozd+ 2016)
  * results inconsistent with downstream task performance (Ghannay+ 2016)
* linguistically motivated evaluation
  * idea: a “good” embedding would be somehow similar to a representation
    constructed from a goldstandard linguistic resource
    (Tsvetkov+ 2015; Tsvetkov+ 2016; Acs and Kornai, 2016)
* Crucially, all these approaches assume a single feature of a representation
  that would make it the “best”
  (the highest correlation with human judgements, the most regular vector
  offsets, the closest approximation of a linguistic resource, etc.)
  * we: different NLP tasks may rely on different aspects

# 3 LDT: the methodology

* eg two published modifications of the word2vec model, both trained on Wikiped
  * dependency-based embeddings (DEPS, Levy and Goldberg, 2014a) and
  * FastText (Bojanowski+ 2017)
  * Table 1: the first 7 nearest neighbors of color (measured by cosine sim)
    * Both models output the British spelling of the target word (colour)
    * DEPS also includes derivatives and synonyms, while
    * FastText favors misspellings and compounds
      * as could be expected of a subword-level model
* Which of these models is “better”? Without the context of some application?
  * more meaningful question: what are the properties of embedding X that
    could predict its performance on tasks Y?
  * eg question answering would likely benefit from synonymy more than
    morphology induction
  * sequence labeling tasks:
    * relatedness tests were found to poorly correlate with performance
    * SimLex (Hill+ 2015) performed better (Chiu+ 2016)
      * could be due to its focus on a particular type of semantic relations
        (synonymy, co-hyponymy), which turned out to be relevant
* Our solution is based on “linguistic diagnostic” tests,
  * obtained by large-scale automatic annotation of linguistic, psychological
    and distributional relations between words vectors and their neighbors
  * can be used to find what features are useful for what extrinsic tasks
  * inspired by
    * the BLESS categorization dataset (Baroni and Lenci, 2011) and
    * evaluation via a set of representative extrinsic tasks (Nayak+ 2016)
* LD analysis starts with sampling the corpus vocabulary, see Section 4.2
  * For each word, top n neighbor vectors are extracted from each embedding
  * Each neighbor undergoes spelling normalization and is paired with the targ
    * analysis of possible morphological, semantic, distributional and
      psychological relations between target and neighbor, as shown in Figure 1
  * The annotated data is analyzed to produce direct or statistically derived
    measures of the degree to which a given embedding is characterized by a
    given factor (eg how many synonyms or morphologically related words are
    neighbors of a given word vector)
  * The exact set of LD factors considered in this study: Section 5.1
* linguistic relations (especially semantic rels such as hypernymy and antonym)
  cannot yet be classified accurately by purely distributional means
  * the best system in the recent CogALex-V shared task (Santus+ 2016) achieved
    only 45% accuracy in classifying only 5 semantic relations
  => LDT relies on the largest freely available lexicographic resources:
  WordNet (Fellbaum, 1998) and Wiktionary,
  with the option of BabelNet (Navigli and Ponzetto, 2012)
  * only English is supported, but
    (thanks to Wiktionary and BabelNet) LDT can be extended to other languages

# 4 Experiment set-up 4

## 4.1 Word embeddings

* This work explores 3 popular word embedding algorithms
  * GloVe (Pennington+ 2014), CBOW, and Skip-Gram (SG, Mikolov+ 2013a)
  * The pre-trained vectors we used were published by Li+ (2017)
    * 4 different types of contexts
    * sequence labeling tasks
    * different vector sizes (25, 50, 100, 250, 500)
    * In total, there were 60 models
  * two types of context (linear and dependency-based), and
    * two context representations: bound and unbound
    * linear
      * unbound context is the classic bag-of-words context (window size 2)
      * bound context is the same, except that words to the left and to the
        right are counted separately (Levy and Goldberg, 2014b; Ling+ 2015)
    * DEPS
      * In the “bound” DEPS context (Levy and Goldberg, 2014a), the corpus is
        syntactically parsed, and only the words that are connected with the
        target word by some dependency relation are taken into account
      * Li+ (2017) extended this idea into the “unbound” DEPS context, where
        the labels of syntactic roles are ignored
* All embeddings were trained on English Wikipedia (August 2013 dump), with a
  minimum frequency of 100
  * dependency parsing by Stanford CoreNLP (Manning+ 2014), corpus lowercased.
  * Negative sampling was set to 5 for SG and 2 for CBOW,
  * no “dirty” sub-sampling.  Distribution smoothing was set to 0.75
  * SG was trained for 2 epochs, CBOW for 5, and GloVe for 30

## 4.2 Vocabulary Filtering and Sampling

* LDT yields the most information when the source corpus is available
  * when it is possible to estimate raw frequencies and cooccurence counts
* we filtered the vocabulary down to 269,860 that were present in all models
  * Preliminary experiments showed that the filtering was
    beneficial to the performance on some tasks, and detrimental to others
    * consistent across embeddings
    * The scope of this paper does not permit full investigation of the matter,
* we focus on the general vocabulary and exclude proper nouns
  * draw a balanced sample of WordNet lemmas for four POSs N, V, Adj, Adv
    in 4 logarithmic frequency bins in the source corpus: 100, 1 K, 10 K, 100 K
* Following Baroni and Lenci (2011), we control for the polysemy of the words
  * For each part of speech at most 30 monosemous and polysemous words
  * Polysemy was defined as a word having over 2 meanings in WordNet
* Table 3
* we also exclude the words belonging to several parts of speech (eg dog N, V)
  to preserve the morphological class variable
  * discards a lot of high-frequency vocabulary =>
    the higher frequency bins for verbs and adjectives were not populated fully

## 4.3 Running LDT 5

* 1,000 nearest neighbors for each word in the above sample
* most words will not have 1,000 meaningful relations,
  nL high-frequency words might have more than that
  * eg a SG model with bound DEPS context has _rather_ as the neighbor of
    _quite_ at rank 920
* 908,000 word pairs were processed per POS (monosemous/polysemous)
* resources: Wiktionary and WordNet, because of BabelNet’s maximum usage quota
* The dictionaries covered 76,946 (28.51%) of all the neighbor words; another
  124,511 (46.14%) were detected as proper nouns (as expected of Wikipedia)
* Thus, only 25.35% of the total vocabulary was not covered by LDT

## 4.4 Extrinsic tasks

* 8 extrinsic tasks
  * selection is similar to what Nayak+ (2016) proposed as representative
  * we select simpler models for evaluation
    * following the recommendation of Nayak+ (2016)
    * more complex models often yield better accuracy, but they
      * could smooth out the performance of different word embeddings and also
        raise the question whether the gains are due to the model or the embed
* morphological and syntactic info is targeted by two sequence labeling tasks:
  POS-tagging and chunking
  * CoNLL 2003 shared task dataset (Tjong Kim Sang and De Meulder, 2003),
  * method by Li+ (2017)
  * softmax classifier on the window-based concatenation of word embeddings
    of every training example (window size 3, 20 training epochs)
* Semantic information at the word level is targeted by
  * one more CoNLL 2003 shared task: named entity recognition (NER),
    * evaluated in the same way as POS-tagging and chunking
  * multi-way classification of semantic relations (Relation class.) between
    pairs of nominals in the SemEval 2010 task 8 dataset (Hendrickx+ 2010)
    * The model we use is similar to the model by Zeng+ (2014)
      * a CNN equipped with word and distance embeddings
* 3 tasks relying on how the word embeddings
  * encode semantic information, and
  * can be combined into an accurate sentence representation
  * sentence-level sentiment polarity classification (Sentiment (sent.)) task
    * tested with the MR dataset of short movie reviews (Pang and Lee, 2005)
    * Binary classif with a simplified version of the model by Kim (2014)
* document-level polarity classification (Sentiment (text))
  with the Stanford IMDB movie review dataset (Maas+ 2011)
  * Polarity is harder to estimate at the document than at the sentence level,
    because sentiment is more likely to be mixed
  * single layer LSTM with 100 hidden units
* classification of subjectivity and objectivity (Subjectivity class.)
  * tested on Rotten Tomato user review snippets vs official movie plot summs
    (Pang and Lee, 2004)
  * method by Li+ (2017), binary classif with a simple logistic regression
  * input sentences are represented as a sum of their constituent word vectors
* natural language inference task: the SNLI dataset (Bowman+ 2015)
  * Similarly to the original proposal
  * two separate LSTMs to get a repr of the premise and the hypothesis
    using the last hidden state
  * The two hidden representations are merged and fed into a
    50-unit dense layer, over which 3-class classification with softmax

## 4.5 Intrinsic tasks

* lack of correlation between the performance of word embedding models on tasks
  * relatedness and sequence labeling tasks (Chiu+ 2016)
  * Ghannay+ (2016) on sequence labeling and mention detection tasks
  * hE, these studies have a limited selection of word embeddings
    * 9 and 5 data points, correspondingly
  * focus on the same sequence labeling CoNLL tasks
* We explore the problem with a wider selection of extrinsic tasks
  * WordSim353 (Finkelstein+ 2002), together with
  * its split into similarity and relatedness sections (Agirre+ 2009),
  * RareWords (Luong+ 2013)
  * MTurk (Radinsky+ 2011)
  * MEN (Bruni+ 2014)
  * SimLex999 (Hill+ 2015) similarity dataset
* analogy task: we use BATS dataset (Gladkova+ 2016)
  * currently the largest analogy dataset for English
  * We report separate scores for inflectional and derivational morphology,
    lexicographic and encyclopedic semantics, and the average of all categories
  * The evaluation is performed with the SOTA LRCos method (Drozd+ 2016)
* Spearman’s correlation with the human judgement scores

# 5 Results 6

## 5.1 Correlation analysis

* 21 morphological, lexicographic, psychological, and distributional factors
  of word vector neighborhoods
* performance on 14 extrinsic and intrinsic task datasets
  (based on the data from 60 GloVe and Word2Vec embeddings described above)
* Figure 2: their correlations with each other
  * Distributional factors
    * LowFreqNeighbors, HighFreqNeighbors: the frequency of the nb `>/< 10K`
    * NeighborsInGDeps: whether the two words co-occur in the Google dep ngrams
    * NonCooccurring: # word pairs that do not co-occur in the corpus, BOW w=2
    * CloseNeighbors: # top 100 nbs with cos dist to the target word > 0.8
    * FarNeighbors: # top n nbs with cosine distance to the target word < 0.7
  * Semantic factors
    * Synonyms, Antonyms, Hypernyms, Hyponyms, Meronyms by the dicts
    * OtherRelations
      * holonymy, troponymy, coordinate terms, and “otherwise related” in Wikt
      * holonymy: inverse of meronymy
      * troponymy: verb that indicates more precisely the manner of doing sg
    * ShortestPath: the minimum path between synsets of two words in WordNet
  * Miscellaneous factors
    * ProperNouns: the nb is a proper noun
    * Numbers: the nb is a numeral, or contains a number
    * ForeignWords: the nb is not found in English, but found in de, fr, sp
    * Misspellings: the nb is not found in dictionaries and
        contains an unusual combination of letters and punctuation or numbers
    * Associations: the two words constitute an associative pair (in either
      direction), according to EAT (Wilson+) and USF-FAN (Nelson+ 2004)
  * Morphological factors
    * SharedMorphForm: the two words share their morphological form
      (in our experiments, both are lemmas)
    * SharedDerivation: the two words share affix(es) or stem(s), or
      both are compounds (based on Wiktionary and custom LDT tools)
    * SharedPOS: the two words have the same POS (any overlap counts)
* how we quantify these
  * Binary relations (eg synonymy is either detected or not) were quantified
    as {a simple count of all cases of that relation} in all target:neighbor
    pairs for each embedding
  * Directed lexicographic relations (hypernymy, hyponymy, meronymy) are
    counted when the target word is eg a hypernym of the neighbor
  * Continuous variables are broken down into bins, the
    size of which is chosen empirically:
    * eg instead of freq, number of low-frequency or high-frequency neighbors
* We experimented with the scores from 1,000, 5000, and 100 top neighbors
  * overall correlation patterns were similar, suggesting that
    it will be sufficient for future work to limit the selection to the top 100
  * We thus report the results for the top 100 neighbors in this section
* high correlation between almost all intrinsic tasks
* lower (but still over 0.5) for the lexicography and encyclopedic section of
  BATS; but the
  * performance on these categories is generally rather low (Drozd+ 2016) and
    could be unreliable
* high correlation between analogy and all relatedness and similarity datasets
  * confirms the conclusion of (Rogers+ 2017) that
  accuracy on analogy depends on the similarity between the source word pairs
  (even for LRCos method)
* extrinsic tasks
  * low correlation between all the intrinsic and 3 sequence labeling tasks
  * the same tasks that were reported by Chiu+ (2016) and Ghannay+ (2016)
    * for which higher performance does not correspond to higher intrinsic perf
  * nL, all the non-sequence-labeling tasks correlate with the intrinsic
    * the traditional intrinsic tasks are after all useful
  * hE they offer no explanation
    * what could be expected of other extrinsic tasks not in our sample
* This is where LD methodology comes in
  * 4 groups of factors that we analyzed, together with their correlations with
    both extrinsic and intrinsic tasks
  * a large amount of neighbors that are in some lexicographic sem rel with tgt
    is a good predictor of performance on both traditional intrinsic datasets
    and all the extrinsic tasks except for the sequence labeling
  * NER, chunking, and POS correlate highly with the three morphological
    factors we considered
    * the neighbors sharing morphological form, derivational pattern and/or
      part-of-speech of the target word
  * confirms our original hypothesis: different tasks rely on different
    information, making a single-number intrinsic evaluation unfeasible
* fuzzy border between morphology and semantics
  * derivational morphology factor has weak positive correlations with all the
    intrinsic and extrinsic tasks, since
    shared derivation does indicate at least partially shared semantics
  * performance on sequence labeling tasks also correlates with the scores on
    lexicographic semantic relations
    * We attribute this to the fact that
      dictionaries usually store relations between words of the same POS, so
      these scores implicitly contain the SharedPOS factor
* The semantic factors that appear to be the least useful across all tasks are
  the ShortestPath and hypernymy
  * The latter is surprising in the light of such tasks as SNLI that rely on it
* The psychological associations turn out to be only weakly useful in the
  semantic extrinsic tasks (presumably to the same degree to which they
  correlate with relatedness tests, and relatedness tests correlate with
  extrinsic tasks)
  * in line with Gladkova and Drozd (2016)’s suggestion that
    human relatedness scores depend on the psychological factors such as speed
    of association, rather than pure semantics
* It could be expected that, in the sample of general English vocabulary, the
  neighbors that are proper nouns or foreign words would be detrimental
  * hE positive correlation with the amount of neighbors that contain numbers
    (presumably due to the meaningful hyponymy that they could indicate, such
    as model numbers, addresses etc.)
  * A large number of misspelled neighbors is also apparently good for all task
    * since all the models in this study are word-level, this could indicate
      their ability to mitigate the lack of subword info
* distributional factors
  * the clearest positive effect is observed for the models that have the
    highest number of low-frequency vocabulary (under 10,000 occurrences in the
    corpus) in the word vector neighborhoods
  * most word types fall in this range, this indicates that
    a “good” model should be able to populate vector neighborhoods with related
    words, even if they are not particularly frequent
  * NonCooccurring factor is apparently useful for
    sequence labeling and some intrinsic tasks
    * find more latent relations between words that do not actually co-occur
    * i.e. deduce relations on the basis of the “second-hand” rather than
      direct similarity between distributional patterns of words
  * FarNeighbors factor suggest that
    high-level semantic tasks benefit from more neighbors that are less than
    0.7 similar to the target word
    * could be interpreted as follows:
      if a neighborhood is packed with words that are all quite similar,
      many of them will end up being within 0.00000001 from each other,
      making the margin of error very small for the models
* all the extrinsic and intrinsic tasks have high correlations with >1 LD factr
  * tasks are complex ensembles of various linguistic features
  * hE we can explain and improve on them only by breaking them down into
    smaller, controllable factors
* all the factors we considered within a subclass correlate considerably with
  * morphological features have mostly negative correlations with the
    lexicographic ones, while the
  * sequence labeling tasks only weakly correlate with the high-level semantic
  * question: what it would take for a representation to do both equally well

## 5.2 Profiling embeddings with LD

* a brief demonstration of explanatory power of LD methodology
* CBOW, SG, and GloVe models and their performance on the 8 above tasks
* one condition: linear bag-of-words context, 500-dimensional vectors
  (the LD scores for top 1000 neighbors are reported)
* Table 4 lists some of the
  * LD factors identified in Section 5.1 together with
  * performance on our 8 extrinsic tasks
  * the 3 models are very close in most of factors; yet it is
  * SG is always slightly ahead in semantic, morphological and distri LD
    factors and actual performance
  * CBOW is consistently slightly behind SG on these accounts, and
    slightly ahead on the scores for misspellings, foreign words, numbers and
    proper nouns (apparently at the cost of the meaningful relations)
  * GloVe vs Word2Vec: amount of LowFreqNeighbors and NonCooccurring words
    * This suggests that the
    * success of SG is due to its ability to bring together related words
      even if they were rare, and/or did not co-occur in the corpus
    * outweighs even GloVe’s significant advantage in sparser neighborhoods
    * GloVe's comparable or even superior scores on “morphological” factors did
      not give GloVe an advantage in POS-tagging and chunking tasks
    * specialized information is necessary but not sufficient for top performnc
    * it is successful ensembles of features that matter

## 5.3 LD for parameter search

* As a brief demonstration, consider the behavior of the NonCooccurring
  factor discussed above when varying the size of SG, GloVe, and CBOW vectors
  (linear unbound context, top 1000 neighbors)
* larger representations are often assumed to be more informative, but
  * Figure 3a shows that this is not the case for GloVe
  * As in the case discussed in 5.2,
    Skip-Gram is consistently slightly ahead of CBOW, except for the lowest dim
* hypothesis: dependency-based contexts pack more synonyms than linear
  * This does not seem to be the case in Fig. 3b
  * positive effect is rather due to unbound vs bound representation than to
    dependency-based or linear context
  * if the goal is to maximize the number of synonyms,
    the effort of parsing is not justified.  This result is
  * consistent with the finding that
    dependency-based vector space models do not outperform the optimized
    window-based models on the TOEFL synonym task (Lapesa and Evert, 2017)

# 6 Discussion and Future Work 10

* we contribute to the NLP community efforts in the following directions:
  * comparison of word embedding algorithms
    (eg different modifications of the Word2Vec)
  * hyperparameter effects on encoding of different linguistic relations;
  * a more informed, hypothesis-driven design of new distributional reprs;
  * informed choice of word embeddings for various downstream tasks;
  * the degree to which different relations
    * are useful for different tasks
    * can be combined in a generalized representation
      without sacrificing too much accuracy on specialist tasks
  * interaction between preference for different linguistic relations and
    performance on different tasks
* LDT can be expanded to
  * other languages
  * proper nouns: criteria for comparing their representations
    * eg the co-hyponymy relation between names of composers would be covered
      with the current implementation, but giving a
      higher score to a model that places violin closer to Bach than to Beatles
      would require evaluating frame-semantic, or at least topical relations,
      going beyond the traditional dictionaries
* instability of word embeddings
  * different runs of the same model may yield word vector neighborhoods with
    significantly different lexical content
  * Some models are more stable than others
    * GloVe was found to be more stable than word2vec (Wendlandt+ 2018)
  * hE most models published in the recent years do not explore their stability
* future research
  * going beyond simple word-level word embeddings
    * subword-level models (Bojanowski+ 2017)
    * balance between semantic and morphological information
    * their ensembles with word-level models (Yang+ 2017)
  * expand LD to sense-aware embeddings (Melamud+ 2016)
    * Oren Melamud, Jacob Goldberger, and Ido Dagan
      Context2vec: Learning Generic Context Embedding with Bidirectional LSTM
      CoNLL 2016
    * contextualized representations (Peters+ 2018)
