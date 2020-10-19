Yonatan Belinkov and James Glass
Analysis Methods in Neural Language Processing: A Survey
TACL Volume 7, 2019 p.49-72

* detailed references for studies corresponding to Sections 2, 4, and 5
  (Tables SM1, SM2, and SM3, respectively), available at
  http://boknilev.github.io/nlp-analysis-methods

# Tables

* [Table SM1](https://boknilev.github.io/nlp-analysis-methods/table1.html)
  * A categorization of work trying to find linguistic information in NNs
  * See Section 2 in the paper
* Table SM2: A categorization of challenge sets for evaluating NNs
  according to the NLP task, the linguistic phenomena, the represented
  languages, the dataset size, and the construction method.  See Section 4 in
  the paper
* Table SM3: A categorization of methods for adversarial examples in NLP
  according to adversary’s knowledge (white-box vs. black-box), attack
  specificity (targeted vs. non-targeted), the modified linguistic unit (words,
  characters, etc.), and the attacked task.  See Section 5 in the paper

# Abstract

# Intro

* [deep learning in NLP ...  improved] various tasks, including
  * language modeling (Mikolov+ 2010; Jozefowicz+ 2016),
  * syntactic parsing (Kiperwasser and Goldberg, 2016),
  * machine translation (MT) (Bahdanau+ 2014; Sutskever+ 2014), and
  * many other tasks; see Goldberg (2017) for example success stories
* two trends
  * incorporating [linguistic knowledge] inside the networks
  * understand how NLP models work
* interpretability in machine learning, along with [NLP-spec characteristics]
  * accountability, trust, fairness, safety, and reliability
    (Doshi-Velez and Kim, 2017; Lipton, 2016)
* earlier NLP work, often referred to as feature-rich or feature-engineered
  * morphological properties, lexical classes, syntactic categories, sem rels
  * In theory, one could observe the importance assigned by statistical NLP
    models to such features in order to gain a better understanding

## A Historical Note: analysis of NNs for language

* a NN that learns distributed representations of words was
  developed already in Miikkulainen and Dyer (1991)
* See Goodfellow+ (2016, chapter 12.4) for references to other milestones
* we mention here a few representative studies that focused on analyzing
* English past tense (Rumelhart and McClelland 1986) built a feedforward NN for
  * analyzed its performance on a variety of examples and conditions. They were
  * performance over the course of training,
    as their goal was to model ...  acquisition in children
    They also analyzed a scaled-down version
    having eight input units and eight output units, which
    allowed them to describe it exhaustively and examine
    how certain rules manifest in network weights
  * seminal work on RNNs, (Elman, 1989, 1990, 1991).Elman trained networks on
    synthetic sentences in a [char-level] language prediction task
    extensive analyses, he showed how networks discover the notion of a word
    * syntactic structures like number agree-ment; and acquire
    * word representations that reflect lexical and syntactic categories
* (Harris, 1990; Niklasson and Linåker, 2000; Pollack, 1990; Frank+ 2013)
* Elman introduced methods
  * from visualizing network activations in time, through
    clustering words by hidden state activations, to
    projecting representations to dimensions that emerge as capturing
    properties like sentence number or verb valency

# 2 What Linguistic Information Is Captured in Neural Networks?

* [analysis] work i.e. Identifying linguistic information
* Table SM1 (in the supplementary materials) categorizes analysis work

## methods used for conducting the analysis, what kind of

* predict [linguistic] properties from activations of the NN
  * various names: ‘‘auxiliary prediction tasks’’ (Adi+ 2017b), ‘‘diagnostic
    classifiers’’ (Veldhoen+ 2016), and ‘‘probing tasks’’ (Conneau+ 2018)
  * e.g. syntax in neural machine translation (NMT) by Shi+ (2016b). In this
  * two NMT models were trained: English→ French and English→German. The
    trained models (specifically, the encoders) were run on an annotated corpus
  * logistic regression classifier that predicts different syntactic properties
  * The authors concluded that the NMT encoders learn significant syntactic
    * both word level and sentence level. They also
    * compared ...  different encoding layers and found that
      "local features are somehow preserved in the lower layer whereas
      more global, abstract information tends to be stored in the upper layer"
* Other methods for finding correspondences between parts of the NN and props
  * counting how often attention weights agree with a linguistic property like
    anaphora resolution (Voita+ 2018) or directly computing
  * correlations between NN activations and some property; for
    * e.g. RNN state activations with depth in a syntactic tree (Qian+ 2016a)
      or with Melfrequency cepstral coefficient (Wu and King, 2016). Such
  * indirectly.  For instance, Alishahi+ (2017) defined an
    * ABX discrimination task to evaluate
      how a neural model of speech (grounded in vision) encoded phonology
      Given phoneme representations from different layers in their model, and
      three phonemes, A, B, and X, they compared whether the model
      representation for X is closer to A or B
    * lower layers generally encode more phonological information

## linguistic information sought

* ranging from basic properties like sentence length, word position,
  word presence, or simple word order, to
  morphological, syntactic, and semantic information
  speech and audio-visual: Phonetic/phonemic information, speaker information,
  and style and accent
* it is difficult to synthesize a holistic picture
  * NNs learn a substantial amount of information on various linguistic phenoms
  * especially successful at capturing frequent properties, while
    * some rare properties are more difficult to learn.  5
    * e.g.  LSTM language models are able to capture subject–verb agreement in
      many common cases, while
      direct supervision is required for solving harder cases.  (Linzen+ 2016)
* hierarchical nature of the learned representations. We have already mentioned
  * NMT (Shi+ 2016b) and a visually grounded speech model (Alishahi+ 2017)
  * syntax were also reported to emerge in other RNN models (Blevins+ 2018)
* models trained with latent trees perform better on natural language inference
  (NLI) (Williams+ 2018; Maillard and Clark, 2018) than ones trained with
  linguistically annotated trees
  * trees in these models do not resemble syntactic trees
    * casts doubts on the importance of syntax-learning in the underlying NN

## components in the NN being investigated

* word embeddings, RNN hidden states or gate activations, sentence embeddings,
  and attention weights in sequence-to-sequence (seq2seq) models. Generally
* less work has analyzed convolutional NNs in NLP, but see Jacovi+
  (2018) for a recent exception
* speech processing, researchers have analyzed layers in deep NNs
  for speech recognition and different speaker embeddings. Some analysis has
* joint language–vision or audio–vision models, or to similarities between word
  embeddings and convolutional image representations

## limitations of current approaches

* that a certain amount of linguistic information is captured in the NN, does
  not necessarily mean that the information is used by the network. For
  * e.g. NTM
    * Vanmassenhove+ (2017) investigated [verb] aspect in NMT
      * [latent vectors] can accurately predict tense about 90% of the time
      * output translations ... have the correct tense only 79% of the time
      * ‘‘part of the aspectual information is lost during decoding.’’
    * Cı́fka and Bojar (2018) compared the performance of various NMT models in
      * translation quality (BLEU) and representation quality (classification)
      * negative correlation between the two, suggesting that
      * high-quality systems may not be learning certain sentence meanings
    * Artetxe+ (2018) showed that word embeddings contain divergent linguistic
      * can be uncovered by applying a linear transformation on the embeddings
      * embeddings "have limits on how [linguistic] information is surfaced"
* concern[s] with correlation: a measure of causation is lacking
  * How does the encoding of linguistic properties affect the system output?
* Giulianelli+ (2018)
  * predicted number agreement from RNN hidden states and gates at different
    time steps
  * intervened in how the model processes the sentence by changing a hidden
    activation based on the difference between the prediction and the correct
    label. This improved agreement prediction accuracy, and the effect
    persisted over the course of the sentence, indicating that this information
    has an effect on the model. However, they did not report the effect on
    overall model quality, for example by measuring perplexity. Methods from
* causal inference may shed new light on some of these questions
* different classifiers
  * usually a simple classifier, such as logistic regression. A few studies
  * and found that deeper classifiers lead to overall better results, but do
  * not alter the respective trends when comparing different models or
    components (Qian+ 2016b; Belinkov, 2018)
  * tasks requiring more nuanced linguistic knowledge gain the most from using
    a deeper classifier (Conneau+ 2018).  However, the approach is
    * usually taken for granted; given its prevalence, ... better theoretical
      or empirical foundations are in place

# 3 Visualization methods 5

* Early work visualized hidden unit activations in RNNs trained on an
  artificial language modeling task, and observed how they correspond to
  certain grammatical relations such as agreement (Elman, 1991)
* recent work: activations on specific examples in modern NNs for
  * language (Karpathy+ 2015; Kádár+ 2017; Qian+ 2016a; Liu+ 2018) and
  * speech (Wu and King, 2016; Nagamine+ 2015; Wang+ 2017b)
* attention mechanism that originated in NMT (Bahdanau+ 2014) also lends itself
  * alignments
  * tasks ranging
    * NLI (Rocktäschel+ 2016; Yin+ 2016)
    * summarization (Rush+ 2015)
    * MT post-editing (Jauregi Unanue+ 2018)
    * morphological inflection (Aharoni and Goldberg, 2017) to
    * matching users on social media (Tay+ 2018). Figure 2 reproduces
* various saliency measures to attribute predictions to input features.  The
  important or salient features can then be visualized in selected examples
  (Li+ 2016a; Aubakirova and Bansal, 2016; Sundararajan+ 2017; Arras+ 2017a,b;
  Ding+ 2017; Murdoch+ 2018; Mudrakarta+ 2018; Montavon+ 2018; Godin+ 2018)
  Saliency [of] intermediate values (Ghaeini+ 2018). 7
* many of the visualization methods are adapted from the vision domain, where
  they have been extremely popular; see Zhang and Zhu (2018) for a survey
* cluster NN activations and compare them to some linguistic property
  * Early work clustered RNN activations, showing that they organize in lexical
    categories (Elman, 1989, 1990).  Similar techniques have been followed by
  * sentence embeddings in an RNN encoder trained in a multitask learning
    scenario (Brunner+ 2017), and
  * phoneme clusters in a joint audio-visual RNN model (Alishahi+ 2017)
* online tools for visualizing NNs have recently become available
  * LSTMVis (Strobelt+ 2018b) visualizes RNN activations, focusing on tracing
  * Seq2Seq-Vis (Strobelt+ 2018a) visualizes different modules in
    attention-based seq2seq models, with the goal of examining model decisions
  * comparing attention alignments (Rikters 2018)
    * translation confidence scores based on the distribution of attention
      weights
  * finding and analyzing individual neurons, NeuroX (Dalvi+ 2019b)
    * focusing on machine translation

## Evaluation

* human evaluations of visualization quality
  * Singh+ (2018) showed human raters-DAT hierarchical clusterings of input
    words generated by two interpretation methods, and asked them to evaluate
    which method is more accurate, or in which method they trust more.  Others
  * attention visualization in conversation modeling (Freeman+ 2018) and
    medical code prediction tasks (Mullenbach+ 2018)

# 4 Challenge sets, aka. test suites, for fine-grained eval 6

* challenge sets ... have been used in NLP for a long time (Lehmann+ 1996),
  especially for evaluating MT systems (King and Falkedal, 1990; Isahara, 1995;
  Koh+ 2001)
* [desirable] properties of test suites (Lehmann+ 1996):
  systematicity, control over data, inclusion of negative data, and
  exhaustivity
  * echoed in more recent work (Wang+ 2018a). For instance,
  * e.g. semantic test suite (Cooper+ 1996) that targets phenomena as diverse
    as quantifiers, plurals, anaphora, ellipsis, adjectival properties
* [then] a hiatus of a couple of decades, 9 challenge sets have
  * can be attributed to the rise of large-scale quantitative evaluation
* recently gained renewed popularity in the NLP community
* In this section, we include datasets ... that diverge from the common
  average-case evaluation. Many of them share some of the properties noted by
* categorized along the following criteria
  * Another typology of evaluation protocols (Burlot and Yvon 2017)
    * partially overlapping with ours, [not as comprehensive] like ours
* Table SM2 categorizes many recent challenge sets along these criteria. Below

## task they seek to evaluate

## linguistic phenomena they aim to study

## language(s) they target

## size

## how performance is evaluated

# 5 Adversarial examples 8

* dealing with text as a discrete input and how different studies handle them

# 6 Explaining model predictions 10

* relatively underexplored area, and we call for more work in this direction
* Other work considered learning textual-visual explanations from multimodal
  annotations (Park+ 2018)

# 7 A few other methods

* erasing or masking certain neural network components, 
  such as word embedding dimensions, hidden units, or even full words 
  (Li+ 2016b; Feng+ 2018; Khandelwal+ 2018; Bau+ 2018)
* intrusion tasks, where humans need to identify an intruder word, 
  chosen based on difference in word embedding dimensions 
  (Murphy+ 2012; Fyshe+ 2015; Faruqui+ 2015)
  * [originally for] probabilistic topic models (Chang+ 2009)
  * a word embedding model [is] more interpretable if humans are better able to
    identify the intruding words
* alternative automatic metrics were considered (Park+ 2017; Senel+ 2018)
* ability to learn different formal languages 
  * earlier (Das+ 1992; Casey, 1996; Gers and Schmidhuber, 2001; 
    Bodén and Wiles, 2002; Chalup and Blair, 2003)
  * today, with research into modern architectures and
    * gen capacity (Weiss+ 2018; Bernardy, 2018; Suzgun+ 2019), or the
    * formal properties they possess (Chen+ 2018b)

# 8 Conclusion ... and potential research directions 11
