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
  distributional semantic representations.

# 1 Intro

* Dense lexical embeddings are the most common distributional semantic reprs in
  (Bengio+ 2003; Collobert and Weston, 2008; Mikolov+ 2013a; Pennington+ 2014;
  Ruppert+ 2015)
  * Eugen Ruppert, Manuel Kaufmann, Martin Riedl, and Chris Biemann. 2015.
    JOBIMVIZ: A web-based visualization for graph-based distributional semantic
    ACL-IJCNLP 2015 System Demonstrations, pages 103–108, Beijing, China, July
  * used in task-specific neural network models, solving such tasks as
    named entity recognition (Guo+ 2014), semantic role labeling (Chen+ 2014),
    syntactic parsing (Chen and Manning, 2014), and more.
* Each year dozens of new models are proposed, each of them with multiple
  hyper-parameters that may dramatically influence performance
  * Lapesa & Evert 2014 A large scale evaluation of distributional semantic mod
  * Kiela & Clark 2014 A systematic study of semantic vector space model params
  * Levy+ 2015 Improving distributional similarity with lessons from word embed
  * Lai+ 2016 How to generate a good word embedding
  * Melis+ 2017 On the SOTA of Evaluation in Neural Language Models
* Equally important are the source corpus, its domain, and the type of context
  (Padó & Lapata, 2007; Levy & Goldberg, 2014a; Li+ 2017; Lapesa & Evert, 2017.
* exponential explosion of options in the quest for the best model for a task.
* Ideally: a single intrinsic metric for identifying “good” embeddings – and
  * many proposals for such a metric
  * eg word relatedness and analogies
  * hE none of them predict performance on a wide range of tasks (Chiu+ 2016)
* different extrinsic tasks may rely on different aspects of word reprs. In
  * what aspects of language
    * [an embedding] captures
    * are relevant for different tasks.
* we propose Linguistic Diagnostics (LD)
  * a new approach to automated qualitative analysis of vector neighborhoods.
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
  corpus-based statistics, psychological association norms, and dictionaries.
  * broad lexical coverage thanks to a combination of the English WordNet,
    Wiktionary, and BabelNet, and is potentially extensible to many languages.

# 2 Related Work

Perhaps the most popular kind of intrinsic evaluation of word embeddings are
* semantic relatedness tests
  (Finkelstein+ 2002; Bruni+ 2014; Luong+ 2013; Radinsky+ 2011). They rely on
the idea that the distance between word vectors should correlate with human judgements of how related
the two words are (e.g., cat should be closer to tiger than to hammer). A more sophisticated version
of this task is the semantic similarity (Agirre+ 2009; Hill+ 2015), which basically restricts
relatedness to synonymy and co-hyponymy.

This evaluation paradigm has come under fire for methodological reasons (Faruqui+ 2016;

Batchkarov+ 2016), in particular, due to the unreliability of the “middle” judgments: while cat
should be closer to tiger than to hammer, it is not clear whether it should be closer to lion or to tiger
(Gladkova and Drozd, 2016). Furthermore, only 1 out of 10 datasets was a good predictor of performance
on sequence labeling tasks (Chiu+ 2016). The proposal for evaluation via coherence of semantic
space (Schnabel+ 2015) inherits all the problems with relatedness (Gladkova and Drozd, 2016).

There are multiple proposals for “subconscious intrinsic evaluation” (Bakarov, 2018) based on corre-
lations with psycholinguistic data such as N400 effect (Van Petten, 2014; Ettinger+ 2016), fMRI
scans (Devereux+ 2010; Søgaard, 2016), eye-tracking (Klerke+ 2015; Søgaard, 2016), and
semantic priming data (Lund+ 1995; Lund and Burgess, 1996; Jones+ 2006; Lapesa and Evert,
2013; Ettinger and Linzen, 2016; Auguste+ 2017). However, there are no large-scale studies that
would show the utility of these methods in predicting downstream task performance. It is also possible
that any psychological measure would share the subjectivity problem of relatedness judgments.

The idea behind the word analogy task (Mikolov+ 2013b) is that the “best” word embedding is
the one that encodes linguistic relations in the most regular way: simple vector offset should be sufficient
to capture semantic shifts such as F rance : P aris to Japan : T okyo. However, this view of linguis-
tic relations (and analogical reasoning) is oversimplified, and performance on word analogies has also
been shown to depend on cosine similarity between source word vectors (Rogers+ 2017; Linzen,
2016; Levy and Goldberg, 2014b). Furthermore, the original vector offset method is underestimating the
amount of semantic information captured by the embedding (Drozd+ 2016). Last but not the least,
analogies also fail to yield results consistent with downstream task performance (Ghannay+ 2016).

One more line of research could be called linguistically motivated evaluation. The idea is that a
“good” embedding would be somehow similar to a representation that could be constructed from a gold-
standard linguistic resource (Tsvetkov+ 2015; Tsvetkov+ 2016; Acs and Kornai, 2016).

Crucially, all these approaches make the same core assumption: that there is one feature of a repre-
sentation that would make it the “best” (the highest correlation with human judgements, the most regular
vector offsets, the closest approximation of a linguistic resource, etc.) However, language is a multi-
faceted phenomenon, and different NLP tasks may rely on its different aspects – which would doom any
one-metric-to-rule-them-all approach. This is the starting point for our solution.
