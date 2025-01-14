Alexis Conneau, German Kruszewski, Guillaume Lample, Loïc Barrault, M Baroni
What you can cram into a single vector:
  Probing sentence embeddings for linguistic properties
ACL 2018

probing data sets and tools, hoping they will become a standard
https://github.com/facebookresearch/SentEval/tree/master/data/probing

# Abstract

* "Downstream" tasks, often based on sentence classification, are commonly used
* difficult to infer what kind of information is present in the representations
* We
  * introduce here 10 probing tasks designed to capture simple linguistic feats
  * study embeddings generated by three different encoders
    trained in eight distinct ways, uncovering
  * intriguing properties of both encoders and training methods

# 1 Intro

* sentence embedding methods have achieved impressive results in tasks ranging
  * machine translation (Sutskever+ 2014; Cho+ 2014) to
  * entailment detection (Williams + 2018), spurring the
* quest for “universal embeddings” (Kiros+ 15; Conneau+ 17; Subramanian+ 18)
* can also carry hidden biases that models might lock onto (Jabri+ 2016)
* simple heuristic of checking for explicit negation words leads to good
  accuracy in the SICK sentence entailment task (Lai and Hockenmaier 2014)
* Model introspection techniques (see Section 5)
  * often depend on the specifics of an encoder architecture
* what we will call probing tasks
  * Shi+ (2016) and Adi+ (2017) introduced the approach
  * a classification problem that focuses on simple linguistic properties
  * eg categorize sentences by the tense of their main verb
    * (without further embedding tuning)
    * If the classifier succeeds, it means that the pre-trained encoder is
      storing readable tense information into the embeddings it creates
  * asks a simple question, minimizing interpretability problems
  * easier to control for biases than in downstream tasks
  * control for lexical cues or sentence length
  * agnostic with respect to the encoder architecture
* We greatly extend earlier work on probing tasks as follows
  * a larger set of probing tasks (10 in total), organized by ling property
  * systematize the probing task methodology,
    * controlling for eg lexical cues or sentence length
  * explore a wide range of SOTA encoding architectures and training methods,
  * relate probing and downstream task performance

# 2 Probing tasks 2

* probing benchmark criteria
  * should only require single sentence embeddings as input (as opposed to,
    eg, sentence and word embeddings, or multiple sentence representations)
  * large training sets
    * in order to train parameter-rich multi-layer classifiers,
      in case the relevant properties are non-linearly encoded in the sent vs
  * control for lexical cues and sentence length
  * address an interesting set of linguistic properties
* from superficial properties of sentences such as which words they contain
  to their hierarchical structure to subtle facets of semantic acceptability
* The sentences for all our tasks are extracted from the
  * Toronto Book Corpus (Zhu+ 2015), more specifically
  * from the random pre-processed portion made available by Paperno+ (2016)
  * only sentences in the 5-to-28 word range

## Surface information

* SentLen as a 6-way classification task (Adi+ 2017)
* word content (WC): which of the 1k words a sentence contains (1k-way classif)

## Syntactic information The next batch of tasks test whether sentence

* bigram shift (BShift) task tests
  whether an encoder is sensitive to legal word orders. In this binary
  * distinguish intact sentences sampled from the corpus
    from sentences where we inverted two random adjacent words
* The tree depth (TreeDepth) task checks whether an encoder infers the
  * Since correlated with sentence length, we de-correlate these variables
  * long but shallow sentence: “[ 1 [ 2 But right now, for the time being, my
    past, my fears, and my thoughts [ 3 were [ 4 my [ 5 business]]].]]”
  * the brain tracks something akin to tree depth (Nelson+ 2017)
* the seq of top constituents (TopConst), sentences must be classified
  * introduced by Shi+ (2016).  Following them, we frame it
  * as a 20-way classification problem:
    19 classes for the most frequent top constructions, and
    one for all other constructions. As an example,
    eg “Then very dark gray letters on a black screen appeared [.]” has
    “ADVP NP VP .”

### Semantic information

* also rely on syntactic structure, but they further require some denot
* grouped with the semantic tasks, since, at least for models without
  access to morphology), they must rely on what a sentence denotes (eg,
  * tense of the main-clause verb (VBP/VBZ forms are labeled as present, VBD as
    * No target form occurs across the train/dev/test split, so that classifiers
      (Shi+)
  * subject number
  * object number
* semantic odd man out (SOMO) task,
  * we modified sentences by replacing a random noun or verb o with another
  * bigrams formed by the replacement have frequencies that are comparable
  * No sentence is included in both original and modified format, and
  * no replacement is repeated across train/dev/test sets
  * classification: whether a sentence has been modified or not
  * semantic factors, ranging from selectional preference to topical coherence
* coordination inversion (CoordInv) benchmark contains
  * sentences made of two coordinate clauses. In half of the sentences, we
  * The task is to tell whether a sentence is intact or modified.
  * balanced in terms of clause length, and
    original “They might be only memories, but I can still feel each one”
    becomes: “I can still feel each one, but they might be only memories.”
  * Often requires an understanding of broad discourse and pragmatics
* Row Hum. Eval. of Table 2 reports human-validated “reasonable” upper bounds
  * BShift, SOMO and CoordInv can accidentally generate acceptable sents
    * For these tasks, we ran Amazon Mechanical Turk experiments
    * majority voting.  See Appendix for details

# 3 Sentence embedding models 4

# 4 Probing task experiments 5

## Probing task comparison

* extremes,
  * performance is not particularly high on the surface tasks, which might be
    * encoder extracting “deeper” linguistic properties.  At the other end,
  * performance is still far from the human bounds on TreeDepth, BShift, SOMO
    and CoordInv
  * last 3 tasks ask if a sentence is syntactically or semantically anomalous
    * encoder has not been explicitly trained on acceptability, and it is
    * the best models are, at least to a certain extent, able to judge
    * asymmetry between the difficult TreeDepth and easier TopConst is also
* Figure 1 reports how NMT probing task accuracy changes in function of encoder
  training epochs
  * largely independent of target language across French, German and fi
  * WC performance keeps increasing with epochs
  * For the other tasks, we observe instead an
    * early flattening of the NMT probing curves, while
    * BLEU performance keeps increasing. Most strikingly,
    * SentLen performance is actually decreasing
    * SOMO task, the curves are mostly flat, suggesting that
      * what BiLSTM-max is able to capture about this task is already encoded
        in its architecture, and further training doesn’t help much

## Probing vs downstream tasks

* downstream tasks available in the SentEval 5 suite (Conneau and Kiela, 2018),
  * classification (MR, CR, SUBJ, MPQA, SST2, SST5, TREC
  * natural language inference (SICK-E
  * semantic relatedness (SICK-R, STSB
  * paraphrase detection (MRPC)
  * semantic textual similarity (STS 2012 to 2017) tasks. Strikingly,
* WC is significantly positively correlated with all downstream tasks. This
  * the latter do not require extracting particularly abstract knowledge
* significant negative correlation between SentLen and most downstream tasks
  * The more models abstract away from such information, the more likely it is
    they will use their capacity to capture more interesting features, as the
    decrease of the SentLen curve along training (see Figure 1) also suggests
  * CoordInv and, especially, SOMO,
    the tasks requiring the most sophisticated semantic knowledge,
    are those that positively correlate with the most downstream ts after WC
* intriguing asymmetries:
  * SOMO correlates with the SICK-E sentence _entailment_ test, but not with
    SICK-R, which is about modeling sentence relatedness intuitions.  Indeed,
    * entailment requires deeper semantic analysis than modeling similarity
  * TopConst and the number tasks negatively correlate with various similarity
    and sentiment data sets (SST, STS, SICK-R)
    * There might be biases in these tasks: SICK-R, for example, contains
      sentence pairs with opposite voice: different constituent structure but
      equal meaning (Marelli+ 2014)
    * two sentences differing only in object number are very similar)
  * TREC question type classification correlating with most tasks
  * Question classification is certainly an outlier among our downstream tasks,
    but we must leave a full understanding of this behaviour to future work
* see Conclusion

# 5 Related work 8

* Adi+ (2017) introduced SentLen, WC and a word order test, focusing on a
  bag-of-vectors baseline, an autoencoder and skip-thought
* Shi+ (2016) also use 3 probing tasks, including Tense and TopConst. It is not
  * logistic regression, focusing on machine translation
* word-level morphosyntax and lexical semantics, and specifically on NMT
  encoders and decoders (Belinkov+ 2017a, Belinkov+ 2017b and Dalvi+ 2017)
* Sennrich (2017)
  * focuses on NMT systems, and proposes a
  * contrastive test to assess how they handle various linguistic phenomena
* recurrent networks and related models
  * by using visualization, input/hidden representation deletion techniques or
    by looking at the word-by-word behaviour of the network
  * Nagamine+ 2015; Hupkes+ 2017; Li+ 2016; Linzen+ 2016; Kàdàr+ 2017; Li+ 2017
  * complementary to ours, are not agnostic to encoder architecture, and cannot
* Finally, Conneau+ (2017)
  * large-scale, multi-task evaluation, entirely on downstream tasks

# 6 Conclusion 9

> The purpose of our tasks is not to encourage the development of ad-hoc models
> that attain top performance on them

* interesting correlation between the tasks and more complex “downstream”
* a set of intriguing findings about the linguistic properties
  * Bag-of-Vectors is surprisingly good at capturing sentence-level properties,
  * different encoder architectures trained with the same objective with
    similar performance can result in different embeddings
* eg BiLSTM-max embeddings are
  * already capturing interesting linguistic knowledge before training, and
  * after training, they detect semantic acceptability without negative data
* In future work, we would like to
  * extend the probing tasks to other languages (they are automatically gented)
  * multi-task training affects probing task performance
  * find more linguistically-aware universal encoders