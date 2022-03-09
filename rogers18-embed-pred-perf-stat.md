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

# 4 Experiment set-up

# 5 Results 6

## 5.1 Correlation analysis

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
