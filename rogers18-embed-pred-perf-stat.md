What’s in Your Embedding, And How It Predicts Task Performance
Anna Rogers, Shashwath Hosur Ananthakrishna, Anna Rumshisky
COLING 2018

# Abstract

* ?a single technique for general-purpose intrinsic evaluation of word embeds
  * Attempts so far not successful
* We present a new approach
  based on scaled-up qualitative analysis of word vector neighborhoods that
  quantifies interpretable characteristics of a given model
  (e.g. its preference for synonyms or shared morphological forms as neighbors)
* We analyze 21 such factors
  * morphological, semantic and distributional
  * correlate with performance on 14 extrinsic and intrinsic task datasets
  (and also explain the lack of correlation between some of them). Our approach
  enables multi-faceted evaluation, parameter search, and
  a more principled, hypothesis-driven approach to development of
  distributional semantic representations

# 1 Intro

* Dense lexical embeddings are the most common distributional semantic reprs in
  (Bengio+ 2003; Collobert and Weston, 2008; Mikolov+ 2013a; Pennington+ 2014;
  Ruppert+ 2015)
  * Eugen Ruppert, Manuel Kaufmann, Martin Riedl, and Chris Biemann. 2015
    JOBIMVIZ: A web-based visualization for graph-based distributional semantic
    ACL-IJCNLP 2015 System Demonstrations, pages 103–108, Beijing, China, July
  * used in task-specific neural network models, solving such tasks as
    named entity recognition (Guo+ 2014), semantic role labeling (Chen+ 2014),
    syntactic parsing (Chen and Manning, 2014), and more
* Each year dozens of new models are proposed, each of them with multiple
  hyper-parameters that may dramatically influence performance
  * Lapesa & Evert 2014 A large scale evaluation of distributional semantic mod
  * Kiela & Clark 2014 A systematic study of semantic vector space model params
  * Levy+ 2015 Improving distributional similarity with lessons from word embed
  * Lai+ 2016 How to generate a good word embedding
  * Melis+ 2017 On the SOTA of Evaluation in Neural Language Models
* Equally important are the source corpus, its domain, and the type of context
  (Padó & Lapata, 2007; Levy & Goldberg, 2014a; Li+ 2017; Lapesa & Evert, 2017
* exponential explosion of options in the quest for the best model for a task
* Ideally: a single intrinsic metric for identifying “good” embeddings – and
  * many proposals for such a metric
  * eg word relatedness and analogies
  * hE none of them predict performance on a wide range of tasks (Chiu+ 2016)
* different extrinsic tasks may rely on different aspects of word reprs. In
  * what aspects of language
    * [an embedding] captures
    * are relevant for different tasks
* we propose Linguistic Diagnostics (LD)
  * a new approach to automated qualitative analysis of vector neighborhoods
  * the first large-scale attempt to identify and quantify the factors that
    make word embeddings successful with different tasks
  * We evaluate GloVe and Word2Vec with varying vector sizes and 4 types of
    context)
  * identifying 21 factors that, to varying extent, correlate with performance
  * 14 extrinsic and intrinsic task datasets
  * can be used  for model development and optimization besides evaluation
* implemented in LDT (Linguistic Diagnostics Toolkit),
  an open-source Python library 1 that offers
  a wide range of analysis options with
  corpus-based statistics, psychological association norms, and dictionaries
  * broad lexical coverage thanks to a combination of the English WordNet,
    Wiktionary, and BabelNet, and is potentially extensible to many languages

# 2 Related Work

* semantic relatedness tests
  (Finkelstein+ 2002; Bruni+ 2014; Luong+ 2013; Radinsky+ 2011)
  * Perhaps the most popular kind of intrinsic evaluation of word embeddings
  * idea: the distance between word vectors should correlate with
    human judgements of how related the two words are
    (e.g., cat should be closer to tiger than to hammer). A more sophisticated
  * semantic similarity (Agirre+ 2009; Hill+ 2015)
    * restricts relatedness to synonymy and co-hyponymy
* This evaluation paradigm has come under fire for methodological reasons
  (Faruqui+ 2016; Batchkarov+ 2016
  * Miroslav Batchkarov, Thomas Kober, Jeremy Reffin, Julie Weeds,  David Weir
    A critique of word similarity as a method for evaluating distri sem models
    2016 The 1st Workshop on Evaluating Vector Space Representations for NLP,
  * unreliability of the “middle” judgments: while cat should be closer to
    * not clear whether cat should be closer to lion or to tiger
      (Gladkova and Drozd, 2016)
  * only 1 out of 10 datasets was a good predictor of performance on sequence
    labeling tasks (Chiu+ 2016)
  * evaluation via coherence of semantic space (Schnabel+ 2015)
    * inherits all the problems with relatedness (Gladkova and Drozd, 2016)

* proposals for “subconscious intrinsic evaluation” (Bakarov, 2018) based on
  * correlations with psycholinguistic data such as
    * N400 effect (Van Petten, 2014; Ettinger+ 2016)
    * fMRI scans (Devereux+ 2010; Søgaard, 2016)
    * eye-tracking (Klerke+ 2015; Søgaard, 2016)
    * semantic priming data (Lund+ 1995; Lund and Burgess, 1996; Jones+ 2006;
      Lapesa and Evert, 2013; Ettinger and Linzen, 2016; Auguste+ 2017)
  * hE no large-scale studies that would show the utility of these methods in
    predicting downstream task performance
    * possible that any psychological measure would share the subjectivity
      problem of relatedness judgments

* word analogy task (Mikolov+ 2013b)
  * idea: the “best” word embedding is the one that encodes linguistic
    relations in the most regular way: simple vector offset should be
    sufficient to capture semantic shifts eg France : Paris to Japan : Tokyo
  * hE, this view of linguistic relations (and analogical reasoning) is
    oversimplified
    * performance on word analogies depend on cosine similarity between source
      word vectors (Rogers+ 2017; Linzen, 2016; Levy and Goldberg, 2014b)
  * the vector offset method is underestimating the amount of semantic info
    captured by the embedding (Drozd+ 2016).  Last but not the least, analogies
  * results inconsistent with downstream task performance (Ghannay+ 2016)

* linguistically motivated evaluation
  * idea: a “good” embedding would be somehow similar to a representation that
    could be constructed from a goldstandard linguistic resource
    (Tsvetkov+ 2015; Tsvetkov+ 2016; Acs and Kornai, 2016)

* Crucially, all these approaches assume a single feature of a representation
  that would make it the “best”
  (the highest correlation with human judgements, the most regular vector
  offsets, the closest approximation of a linguistic resource, etc.) However,
  * we: different NLP tasks may rely on its different aspects – which would

# 3 LDT: the methodology

* eg two published modifications of the word2vec model, both trained on Wikiped
  * dependencybased embeddings (DEPS) (Levy and Goldberg, 2014a) and
  * FastText (Bojanowski+ 2017).
  * Table 1 lists the first 7 nearest neighbors of color (measured by cosine sim)
    * Both models output the British spelling of the target word (colour). How-
    * hE, DEPS also includes derivatives and synonyms, while
      * FastText favors misspellings and compounds
        * as could be expected of a subword-level model.
* Which of these models is “better”? Without the context of some application,
  * more meaningful question: what are the properties of embedding X that
    could predict its performance on tasks Y and Z? 
  * eg question answering would likely benefit from synonymy more than
    morphology induction. Consider that
  * sequence labeling tasks:
    * relatedness tests were found to poorly correlate with performance on ,
    * SimLex (Hill+ 2015) performed better (Chiu+ 2016).  
      * could be due to its focus on a particular type of semantic relations
        (synonymy, co-hyponymy), which turned out to be relevant
* Our solution is based on “linguistic diagnostic” tests, 
  * [obtained] by large-scale automatic annotation of linguistic, psychological
    and distributional relations between words vectors and their neighbors. The
  * can then be used to find what features are useful for what extrinsic tasks.
  * inspired by
    * the BLESS categorization dataset (Baroni and Lenci, 2011) and
    * evaluation via a set of representative extrinsic tasks (Nayak+ 2016).

* LD analysis starts with sampling the corpus vocabulary, see Section 4.2
  * For each word, top n neighbor vectors are extracted from each embedding.
  * Each neighbor undergoes spelling normalization and is paired with the
    * analysis of possible morphological, semantic, distributional and
      psychological relations between them, as shown in Figure 1
  * The annotated data is analyzed to produce direct or statistically derived
    measures of the degree to which a given embedding is characterized by a
    given factor (e.g. how many synonyms or morphologically related words are
    neighbors of a given word vector)
  * The exact set of LD factors considered in this study: Section 5.1

* linguistic relations (especially semantic rels such as hypernymy and antonym)
  cannot yet be classified accurately by purely distributional means 2 , 
  * the best performing system in the recent CogALex-V shared task (Santus+
    2016) achieved only 45% accuracy in classifying only 5 semantic relations.
  => LDT relies on the largest freely available lexicographic resources:
  WordNet (Fellbaum, 1998) and Wiktionary, with the option of BabelNet (Navigli
  and Ponzetto, 2012)
  * only English is supported, but (thanks to Wiktionary and BabelNet) LDT can
    be extended to other languages.

# 4 Experiment set-up 4

## 4.1 Word embeddings

* This work explores 3 popular word embedding algorithms
  * GloVe (Pennington+ 2014), CBOW, and Skip-Gram (SG) (Mikolov+ 2013a).
  * The pre-trained vectors we used were published 4 by Li+ (2017) who
    * 4 different types of contexts on sequence labeling tasks.
    * different vector sizes (25, 50, 100, 250, 500). In total, there were 60 models.
    * two types of context (linear and dependency-based), and
    * two context representations: bound and unbound.
    * linear
      * unbound context is the classic bagof-words context (window size 2).
      * bound context is the same, except that words to the left and to the
        right are counted separately (Levy and Goldberg, 2014b; Ling+ 2015).
    * DEPS
      * In the “bound” DEPS context (Levy and Goldberg, 2014a), the corpus is
        syntactically parsed, and only the words that are connected with the
        target word by some dependency relation are taken into account
      * Li+ (2017) extended this idea into the “unbound” DEPS context, where
        the labels of syntactic roles are ignored.
* All embeddings were trained on English Wikipedia (August 2013 dump), with a
  minimum frequency of 100
  * dependency parsing by Stanford CoreNLP (Manning+ 2014), the corpus was
    lowercased. Negative sampling was set to 5 for SG and 2 for CBOW,
    no “dirty” sub-sampling.  Distribution smoothing was set to 0.75.
    SG was trained for 2 epochs, CBOW for 5, and GloVe for 30.
    
## 4.2 Vocabulary Filtering and Sampling

* LDT yields the most information when the source corpus is available, and it
  is possible to estimate raw frequencies and cooccurence counts.
* we filtered 5 the vocabulary down to 269,860 that were present in all models.
  * Preliminary experiments showed that the filtering was
    * beneficial to the performance on some tasks, and detrimental to others.
    * consistent across embeddings.
    * The scope of this paper does not permit full investigation of the matter,
* we focus on the general vocabulary and exclude proper nouns. We use LDT to
  * draw a balanced sample of WordNet lemmas for four POSs N, V, Adj, Adv
    in 4 logarithmic frequency bins in the source corpus: 100, 1 K, 10 K, 100 K
* Following Baroni and Lenci (2011), we control for the polysemy of the words
  * For each part of speech at most 30 monosemous and polysemous words were
  * Polysemy was defined as a word having over 2 meanings in WordNet 6 .  The
* Table 3.
* we also exclude the words belonging to several parts of speech (e.g.  a dog
  (noun), to dog (verb)) to preserve the morphological class variable. This
  * discards a lot of high-frequency vocabulary => the higher frequency bins
    for verbs and adjectives were not populated fully. The total number of

## 4.3 Running LDT 5

* 1,000 nearest neighbors for each word in the above sample
* most words will not have 1,000 meaningful relations,
  nL high-frequency words might have more than that
  * For example, a SG model with bound DEPS context has _rather_ as the neighbor
  of _quite_ at rank 920
* 908,000 word pairs were processed per POS (monosemous / polysemous).  for
* resources: Wiktionary and WordNet, since BabelNet’s maximum usage quota for
* The dictionaries covered 76,946 (28.51%) of all the neighbor words; another
  124,511 (46.14%) were detected as proper nouns (as expected of Wikipedia)
* Thus, only 25.35% of the total vocabulary was not covered by LDT.

## 4.4 Extrinsic tasks

* 8 extrinsic tasks 
  * selection is similar to what Nayak+ (2016) proposed as representative
 * we select simpler models for evaluation
   * following the recommendation of Nayak+ (2016) 
   * more complex models often yield better accuracy, but they
     could smooth out the performance of different word embeddings and also
     raise the question of whether the gains are due to the model or the embed

* morphological and syntactic info is targeted by two sequence labeling tasks:
  POS-tagging and chunking. We use the
  * CoNLL 2003 shared task dataset (Tjong Kim Sang and De Meulder, 2003),
  * method by Li+ (2017).  The model is a
  * softmax classifier on the window-based concatenation of word embeddings
    of every training example (window size 3, 20 training epochs).

* Semantic information at the word level is targeted by
  * one more CoNLL 2003 shared task: named entity recognition (NER),
    * evaluated in the same way as POS-tagging and chunking. We also consider
  * multi-way classification of semantic relations (Relation class.) between
    pairs of nominals in the SemEval 2010 task 8 dataset (Hendrickx+ 2010).
    * The model we use is similar to the model by Zeng+ (2014)
      * a CNN equipped with word and distance embeddings.

* 3 tasks relying on how the word embeddings
  * encode semantic information, and
  * can be combined into an accurate sentence representation. The
  * sentence-level sentiment polarity classification (Sentiment (sent.)) task
    is tested with the MR dataset of short movie reviews (Pang and Lee, 2005).
    Binary classification is performed by a simplified version of the model
    proposed by Kim (2014).

* document-level polarity classification (Sentiment (text))
  with the Stanford IMDB movie review dataset (Maas+ 2011)
  * Polarity is harder to estimate at the document than at the sentence level,
    because sentiment is more likely to be mixed. The task is performed with a
  * single layer LSTM with 100 hidden units.

* classification of subjectivity and objectivity (Subjectivity class.) is
  tested on Rotten Tomato user review snippets vs official movie plot summaries
  (Pang and Lee, 2004)
  * method by Li+ (2017), employing a simple logistic regression model for the
    binary classification task
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
  * hE, these studies have a limited selection of word embeddings (amounting to
    9 and 5 data points, correspondingly)
  * focus on the same sequence labeling CoNLL tasks.
* We explore the problem with a wider selection of extrinsic tasks The
  * WordSim353 (Finkelstein+ 2002), together with
  * its split into similarity and relatedness sections (Agirre+ 2009),
  * RareWords (Luong+ 2013)
  * MTurk (Radinsky+ 2011)
  * MEN (Bruni+ 2014)
  * SimLex999 (Hill+ 2015) similarity dataset. For the
* analogy taskwe use BATS dataset (Gladkova+ 2016), which is currently
  the largest analogy dataset for English
  * We report separate scores for inflectional and derivational morphology,
    lexicographic and encyclopedic semantics, and the average of all
    categories
  * The evaluation is performed with the SOTA LRCos method (Drozd+ 2016) 
* Spearman’s correlation with the human judgement scores

# 5 Results 6

## 5.1 Correlation analysis

## 5.2 Profiling embeddings with LD

## 5.3 LD for parameter search

# 6 Discussion and Future Work 10

* we contribute to the NLP community efforts in the following directions:
  * comparison of word embedding algorithms
    (e.g. different modifications of the Word2Vec)
  * hyperparameter effects on encoding of different linguistic relations;
  * a more informed, hypothesis-driven design of new distributional reprs;
  * informed choice of word embeddings for various downstream tasks;
  * the degree to which different relations
    * are useful for different tasks and to which they
    * can be combined in a generalized representation
      without sacrificing too much accuracy on specialist tasks
  * interaction between preference for different linguistic relations and
    performance on different tasks
* can be expanded by expanding LDT to
  * other languages and by formulating the
  * proper nouns: criteria for comparing their representations
    * eg the co-hyponymy relation between names of composers would be covered
      with the current implementation, but giving a
      higher score to a model that places violin closer to Bach than to Beatles
      would require evaluating frame-semantic, or at least topical relations,
      going beyond the traditional dictionaries
* instability of word embeddings
  * different runs of the same model may yield word vector neighborhoods with
    significantly different lexical content
  * Some models are more stable than others (in particular,
    * GloVe was found to be more stable than word2vec) Wendlandt+ (2018),
  * hE most models published in the recent years do not explore their stability
* future research also include going
  * beyond simple word-level word embeddings. Some of the questions to
    * balance between semantic and morphological information in
      subword-level models (Bojanowski+ 2017) and
      their ensembles with word-level models (Yang+ 2017). It would also be
  * expand LD to sense-aware embeddings (Melamud+ 2016)
    * Oren Melamud, Jacob Goldberger, and Ido Dagan
      Context2vec: Learning Generic Context Embedding with Bidirectional LSTM
      CoNLL 2016
    * contextualized representations (Peters+ 2018)
