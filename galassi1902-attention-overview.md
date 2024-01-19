Attention in Natural Language Processing
Andrea Galassi, Marco Lippi, Paolo Torroni
IEEE Transactions on Neural Networks and Learning Sys (2020) arXiv:1902.02181

* we define a unified model for attention architectures in NLP
  * focus on those designed for vector representations of the textual data
* taxonomy of attention models according to four dimensions:
  * representation of the input
  * compatibility function
  * distribution function
  * multiplicity of the input and/or output
* ongoing research efforts and open challenges
* categorization of the vast body of literature in this exciting domain

# Intro

* first introduced in NLP for machine translation tasks by Bahdanau+ Bahdanau, Cho, and Bengio (2015)
  * glimpses already proposed in computer vision by Larochelle and Hinton [3],
    following the observation that biological retinas fixate on relevant parts
    of the optic array, while resolution falls off rapidly with eccentricity
  * The term visual attention became especially popular after Mnih+ [4]
    * image classification tasks as well as in
      dynamic visual control problems such as object tracking
    * adaptively process a sequence of regions or locations at high resolution
      and use a progressively lower resolution for further pixels
* interpretation, Besides offering a performance gain [5]–[9]
  * cannot be considered a reliable means of explanation [10], [11]
* visualization tools have been devised [12], [13]. Fig. 1
* increasingly common ingredient of neural architectures for NLP [14], [15]
  * Table I presents a nonexhaustive list of neural architectures where the
    introduction of an attention mechanism has brought about a significant gain
* adopted in many other fields besides NLP and
  * computer vision [16]–[18], speech recognition [18]–[21],
    recommendation [22], [23], time-series analysis [24], [25], games [26], and
    mathematical problems [27], [28]
* In NLP, exploration by a number of seminal papers
  (Bahdanau, Cho, and Bengio 2015, Sukhbaatar+ 2015)
  * new attention models and attentive architectures ensued, resulting in a
    highly diversified architectural landscape
  * different authors developing almost identical attention models
    * eg inner attention [68] and word attention [41] are arguably the same
  * the same terms have been introduced by different authors to define
    different concepts, thus further adding to the ambiguity in the literature
    * eg context vector is used with different meanings by
    Bahdanau+ Bahdanau, Cho, and Bengio (2015), Yang+ [52], and Wang+ [129]
* not a comprehensive account of all the neural architectures for NLP that
  uses an attention mechanism. This would be impossible and would rapidly outdat
  * a synthesis and a critical outlook rather than a flat listing
  * no quantitative evaluation of different types of attention mechanisms
    since such mechanisms are generally embedded in larger architectures
    devised to address specific tasks, and it would be pointless in many cases
* experimental studies focused on particular NLP tasks, including
  * machine translation [37], [42], [48], [132]
  * argumentation mining [125]
  * text summarization [58]
  * sentiment analysis [7]
* attention-based approaches enabled the development of entire research lines
  * transformer [36] for sequence-to-sequence annotation, as well as with
    BERT [60], currently among the most popular architectures for the creation
    of embeddings
  * In other cases, attention-based models paving the way to radically new
    approaches for some tasks
    * Bahdanau+’s work Bahdanau, Cho, and Bengio (2015) to the field of machine translation
    * the expressive power of memory networks Sukhbaatar+ (2015) significantly contributed to
      the idea of using deep networks for reasoning tasks

# II A general model of attention and its components 3

* We use a well-known MT architecture introduced by Bahdanau+ Bahdanau, Cho, and Bengio (2015) as an
  illustration and an instance of the general model
* To illustrate, we briefly describe a classic attention architecture, called
  RNNsearch Bahdanau, Cho, and Bengio (2015)
  * historical significance and for its simplicity

## A. Example for Machine Translation and Alignment

* “relieves the encoder from the burden of having to encode all information
  in the source sentence into a fixed-length vector.”

## B. Unified Attention Model

* depend on the
  * structure of the data whereupon they operate and on the
  * desired output structure
* Our unified model is based on and extends Vaswani+ [36] and Daniluk+ [61]
  * core part shared by almost the totality of the models
  * additional components that, although not universally present, are still
    found in most literature models
* The distinction between keys and values was introduced by Daniluk+ [61]
* Other architectural choices will be explored in Section IV-D

## C. Deterministic Versus Probabilistic Attention

* a brief remark about some relevant naming conventions is in order
* sometimes described in the literature
  * The attention model described so far is a mapping with a probabilistic
    interpretation since the use of a softmax normalization [91]
  * some recent literature defines as deterministic attention models [134], [135]
    * context words are deterministically selected, for example,
      eg by using the constituency parse tree of the input sentence
* other authors described the
  * first model as deterministic (soft) attention, to contrast it with
  * stochastic (hard) attention, where the probability distribution over
    weights is used to hardly sample a single input as context vector c, in
    particular following a reinforcement learning strategy [16]

# III Uses of attention in various NLP tasks 5

* Attention enables us to
  * estimate the relevance of the input elements as well as to
  * combine input elements into a compact representation:
    context vector condensed, smaller than the original input,
    it requires fewer computational resources to be processed at later stages,
* Table III
* For tasks such as document classification, where usually there is
  * only K in input and no query, the
  * attention mechanism can be seen as an encoding into a compact form
    * a form of feature selection
    * This applies to cases where features come from different
      * domains as in multimodal tasks [78] or from different
      * levels of a neural architecture [38] or where they simply
      * represent different aspects of the input document [136]
* as an auxiliary task during training
  so that specific features can be modeled via a multitask setting
  * This holds for several scenarios, such as visual question answering [137],
    domain classification for natural language understanding [138], and
    semantic role labeling [97]
* When the generation of a text sequence is required, as in MT,
  * dynamic representation of the input sequence
  * q represents an embedding of the previous state of the decoder
    * eg sentiment analysis and information extraction
* sequence-to-sequence annotators,
  * without resorting to RNNs or convolutional neural networks (CNNs),
  * as suggested by Vaswani+ [36], who rely on an attention mechanism to obtain
    a whole encoder/decoder architecture
* a tool for selecting specific words
  eg dependence parsing [97] and cloze question-answering tasks [66], [70]
* when multiple interacting input sequences have to be considered in combination
  * question answering, where the input consists of two textual sequences,
    the question and the document or the question and the possible answers

# IV Taxonomy of attention models 6

## A. Input Representation

## B. Compatibility Functions

## C. Distribution Functions

## D. Multiplicity

# V Combined with knowledge about the task or the data 11

* According to LeCun+ [146], a major open challenge in AI is
* combining connectionist (or subsymbolic) models, such as deep networks,
  with approaches based on symbolic knowledge representation, in order to
  perform complex reasoning tasks. Throughout the last decade, filling the gap
  between these two families of AI methodologies has represented a major
* approaches include
  * statistical relational learning [147],
  * neural-symbolic learning [148], and the
  * application of various deep learning architectures [149], such as
    * memory networks Sukhbaatar+ (2015),
    * neural Turing machines [142], and several others.  From this perspective,

## A. Supervised Attention

* Whether supervision is
present in the data as a label or it is obtained as additional
information through external tools, it can be exploited to
perform a supervised training of the attention model

### 1 Preliminary Training:

* use an external classifier.  The weights learned by such a classifier are
  subsequently plugged into the attention model of a different architecture
* Zhang+ [53] first trained an attention model to represent the probability that
  a sentence contains relevant information. The relevance of a sentence is given
  by rationales [150], which are snippets of text that supports the
  corresponding document categorizations
* Long+ [118], a model is preliminarily trained on eye-tracking data sets to
  estimate the reading time of words.  Then, the reading time predicted by the
  model is used as an energy score in a neural model for sentiment analysis

### 2 Auxiliary Training

* attention learning as an auxiliary task, jointly with the main task
* good results in many scenarios, including machine translation [30], [35],
  visual question answering [137], and domain classification for NLU [138]
* attention can be trained in a multitask setting
  * For example, since the linguistic information is useful for semantic role
    labeling, represent the syntactic structure of a sentence
  * in LISA [97], a multilayer multiheaded architecture for SRL, one of the
    attention heads is trained to perform dependence parsing as an auxiliary

### 3 Transfer Learning across different domains [1] or tasks [115]

## B. Attention Tracking

* When attention is applied multiple times on the same data,
  as in sequence-to-sequence models, a useful piece of information could be
  how much relevance has been given to the input along different iterations
* eg in MT, it is desirable to ensure that all the words of the original
  phrase are considered
  * One possibility to maintain this information is to use a suitable structure
    and provide it as an additional input to the attention model
  * Tu+ [33] exploited a piece of symbolic information called coverage
    * Every time attention is computed, such information is fed to the attention
      model as a query element
  * In [31], the representation is enhanced by making use of a subsymbolic
    representation for the coverage
    * [31] H. Mi, B. Sankaran, Z. Wang, and A. Ittycheriah,
    “Coverage embedding models for neural machine translation,”
    in Proc.  EMNLP, 2016, pp. 955–960

## C. Modeling the Distribution Function by Exploiting Prior Knowledge

* define or to infer a distance between the elements in the domain. Such
* eg by the syntactical information. Chen+ [40] and He+ [109] used

# VI Open challenges, current trends, and future directions 13

* open challenges and possible applications
  in the analysis of neural networks, as a support of the training process and
  as an enabling tool for the integration of symbolic representations

## A. Attention for Deep Networks Investigation

* Whether attention may be considered as a mean to explain neural networks
  * currently an open debate.  Some recent studies
  * [10], [11] suggest that attention cannot be considered a reliable mean to
    explain or even interpret neural networks. Nonetheless, other works
    * [10] S Jain and BC Wallace, “Attention is not explanation,”
      NAACL-HLT, 2019, pp. 3543–3556
    * [11] S Serrano and NA Smith, “Is attention interpretable?”
      CoRR, vol. abs/1906.03731, 2019
  * [6]–[9] advocate the use of attention weights as an analytic tool
    * [6] K Clark, U Khandelwal, O Levy, and CD Manning,
      “What does BERT look at? An analysis of BERT’s attention,”
      BlackboxNLP@ACL. Florence, Italy: ACL, Aug. 2019, pp. 276–286
    * [7] G Letarte, F Paradis, P Giguère, and F Laviolette
      “Importance of self-attention for sentiment analysis”
      BlackboxNLP@EMNLP, 2018, pp. 267–275
    * [8] S Vashishth, S Upadhyay, GS Tomar, and M Faruqui
      “Attention interpretability across NLP tasks”
      2019, arXiv:1909.11218.  [Online]
    * [9] S Wiegreffe and Y Pinter, “Attention is not not explanation,” in
      EMNLP/IJCNLP, 2019, pp.  11–20
  * Jain and Wallace [10] proved that 
    * attention is not consistent with other explainability metrics
    * local adversarial distributions (distributions that are
      similar to the trained model but produce a different outcome)
  * Wiegreffe and Pinter [9] pushed the discussion further
    * creating an effective global adversarial attention model is much more
      difficult than creating a local one
    * if by explanation, we mean a plausible, but not necessarily faithful,
      reconstruction of the decision-making process,
      as suggested by Rudin [151] and Riedl [152]
  * Jain and Wiegreffe discussed this at the Big Picture Workshop at EMNLP 2023
    see [Ruder's newsletter]
    (https://newsletter.ruder.io/i/139785296/is-attention-explanation)
* deepest levels will compute the most abstract features [146], [153]
  * Therefore, the application of attention to deep networks could enable the
    selection of higher level features, thus providing hints to understand which
    complex features are relevant for a given task. Following this line of
    * in the computer vision domain, Zhang+ [18] showed that
      the application of attention to middle-to-high level feature sets
      leads to better performance in image generation
  * higher weights are not attributed to proximate image regions, but rather
    to those regions whose color or texture is most similar to that of the
    query image point
  * the spatial distribution does not follow a specific pattern, but instead,
    it changes, modeling a region that corresponds to the object depicted in
    the image
  * text: Identifying abstract features in an input text
    might be less immediate than in an image, where 
    the analysis process is greatly aided by visual intuition
  * nL it may be interesting to test the effects of the application of
    attention at different levels and to
    assess whether its weights correspond to specific high-level features
* Vaswani+ [36] analyzed the relation between attention and syntactic preds,
* Voita+ [49] did the same with anaphora resolutions, and
* Clark+ [6] investigated the correlation with many linguistic features
* Voita+ [50] analyzed the behavior of the heads of a multihead model,
  * different heads develop different behaviors, which
    * can be related to specific position or specific syntactical element
* Yang+ [39] seemed to confirm that the
  deeper levels of neural architectures capture non-local aspects of the text
  * They studied the application of locality at different depths of an
    attentive deep architecture and showed that
    its introduction is especially beneficial when it is applied to the layers
    that are closer to the inputs
  * when the application of locality is based on a variable-size window,
    higher layers tend to have a broader window
* investigation with task transfer
  * A popular way of investigating whether an architecture has learned
    high-level features: using the same architecture to perform other tasks
  * Shi+ [154]: syntactic predictions
    by using the hidden representations learned with machine translation
* attention weights could be used as input features in a different model, so as
  to assess whether they can select relevant information for a different
  learning task
* attention distillation, where a student network is trained to penalize the
  most confusing features according to a teacher network, producing an
  efficient and robust model in the task of machine reading comprehension [155]
* attentional heterogeneous transfer [156] has been exploited
  in heterolingual text classification to
  selectively filter input features from heterogeneous sources

## B. Attention for Outlier Detection and Sample Weighing

## C. Attention Analysis for Model Evaluation

* uniform distribution of the attention weights could be interpreted as a sign
  that the attention model has been unable to identify the more useful elements
* distribution of the attention weights may, therefore, be a tool for measuring
  an architecture’s confidence in performing a task on a given input
* Heo+ [157] proposed to exploit the uncertainty of their stochastic predictive
  model to avoid making risky predictions in healthcare tasks
* In a hybrid model that relies on both symbolic and subsymbolic information,
  * uncertainty of the neural model can be used as a parameter in the merging
  * Other example: multitask learning and reinforcement learning
  * exploitation of the uncertainty of the model, other than attention and NLP,
    * Poggi and Mattoccia [158], Kendall+ [159], and Blundell+ [160]

## D. Unsupervised Learning With Attention

* exploit attention within purely unsupervised models
* He+ [161], attention is exploited in a model for aspect extraction in
  sentiment analysis, with the aim to remove words that are irrelevant for the
  sentiment and to ensure more coherence of the predicted aspects
* Zhang and Wu [162]
  * attention is used within autoencoders in a question-retrieval task
  * main idea is to generate semantic representations of questions, and
    self-attention is exploited during the encoding and decoding phases, with
    the objective to reconstruct the input sequences, as in traditional autoenc
* similar idea, Zhang+ [163] exploited bidimensional attention-based recursive
  autoencoders for bilingual phrase embeddings, whereas
* Tian and Fang [164] exploited attentive autoencoders to build sentence
  representations and performed topic modeling on short texts
* Yang+ [165] instead adopted an attention-driven approach to unsupervised
  sentiment modification in order to explicitly separate sentiment words from
  content words
* In computer vision, attention alignment has been proposed [166]
  * align the attention patterns of networks trained on the source and target
  * could be an interesting scenario also for NLP

## E. Neural-Symbolic Learning and Reasoning

* neural logic programming [167]: reasoning over knowledge graphs, in order to
  combine parameter and structure learning of first-order logic rules. They have
* logic attention networks [168] to aggregate information coming from graph
  neighbors with both rule~ and network-based attention weights. Moreover,
* prior knowledge has also been exploited by Shen+ [169] to
  * enable the attention mechanism to learn the knowledge representation of
    entities for ranking question–answer pairs
* in reasoning tasks that are also addressed with symbolic approaches,
  such as textual entailment [99]
  * Hudson and Manning [170] recently proposed a new architecture for complex
    reasoning problems, with NLP usually being one of the target sub-tasks, as
    in the case of visual question answering. In such an architecture,
    * attention is used within several parts of the model, for example, over
      question words or to capture long-range dependences with self-attention
* introduce constraints in the form of logical statements within neural networks
  has been proposed in [171] where rules governing attention are used to enforce
  word alignment in tasks, such as machine comprehension and NLI

# VII Concludes 15

* Attention can be applied to different input parts, different representations
  of the same data, or different features,
  to obtain a compact representation of the data as well as to highlight info
* selection is performed through a distribution function, which
  * may consider locality in different dimensions, such as
    space, time, or even semantics.  Attention
* can be used to compare the input data with a query element
  based on measures of similarity or significance.  It can also autonomously
* attention creats a representation encoding of what the important data should
  be similar to
* possible role of attention in addressing fundamental AI challenges. In
  * injecting knowledge into the neural model, so as to represent specific
    features, or to exploit previously acquired knowledge, as in transfer
    learning settings. We speculate that this could pave the way to new
    challenging research avenues, where attention could be exploited to enforce
    the combination of subsymbolic models with symbolic knowledge
    representations to perform reasoning tasks or to address natural language
    understanding
  * unsupervised learning architectures, by guiding and focusing the training
    process where no supervision is given in advance
