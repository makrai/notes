Attention in Natural Language Processing
Andrea Galassi, Marco Lippi, Paolo Torroni
IEEE Transactions on Neural Networks and Learning Sys (2020) arXiv:1902.02181

* we define a unified model for attention architectures in natural NLP with a
  focus on those designed [for] vector representations of the textual data. We
* taxonomy of attention models according to four dimensions:
  * representation of the input
  * compatibility function
  * distribution function
  * multiplicity of the input and/or output
* ongoing research efforts and open challenges in
* categorization of the vast body of literature in this exciting domain

# Intro

* first introduced in NLP for machine translation tasks by Bahdanau+ [2]
  * glimpses already proposed in computer vision by Larochelle and Hinton [3],
    following the observation that biological retinas fixate on relevant parts
    of the optic array, while resolution falls off rapidly with eccentricity
  * The term visual attention became especially popular after Mnih+ [4]
    * image classification tasks as well as in
      dynamic visual control problems such as object tracking
    * adaptively process a sequence of regions or locations at high resolution
      and use a progressively lower resolution for further pixels
* Besides offering a performance gain, the attention mechanism can also be used
  * for interpreting the behavior of neural architectures [5]–[9], even if it
    * cannot be considered a reliable means of explanation [10], [11]. For
* tools have been devised for such a visualization [12], [13]. Fig. 1 shows an
* increasingly common ingredient of neural architectures for NLP [14], [15]
* Table I presents a nonexhaustive list of neural architectures where the
  introduction of an attention mechanism has brought about a significant gain
* adopted in many other fields besides NLP and
  * computer vision [16]–[18], speech recognition [18]–[21],
    recommendation [22], [23], time-series analysis [24], [25], games [26], and
    mathematical problems [27], [28]
* In NLP, exploration by a number of seminal papers [2], [59], a fast-paced
  * new attention models and attentive architectures ensued, resulting in a
    highly diversified architectural landscape. Because of, and adding to, the
  * different authors [developing] almost identical attention models
    * e.g. inner attention [68] and word attention [41] are arguably the same
  * the same terms have been introduced by different authors to define
    different concepts, thus further adding to the ambiguity in the literature
    * e.g. context vector is used with different meanings by
    Bahdanau+ [2], Yang+ [52], and Wang+ [129]
* not a comprehensive account of ... all the neural architectures for NLP that
  uses an attention mechanism. This would be impossible and would rapidly
  * [rather] a synthesis and a critical outlook rather than a flat listing of
  * [no] quantitative evaluation of different types of attention mechanisms
    since such mechanisms are generally embedded in larger architectures
    devised to address specific tasks, and it would be pointless in many cases
* experimental studies focused on particular NLP tasks, including
  * machine translation [37], [42], [48], [132]
  * argumentation mining [125]
  * text summarization [58]
  * sentiment analysis [7]. It is worthwhile remarking that, on several
* attention-based approaches enabled the development of entire research lines
  * transformer [36] for sequence-to-sequence annotation, as well as with BERT
    [60], currently among the most popular architectures for the creation of
    embeddings
  * In other cases, attention-based models paving the way to radically new
    approaches for some tasks.  This was the influence of
    * Bahdanau+’s work [2] to the field of machine translation. Likewise,
    * the expressive power of memory networks [59] significantly contributed to
      the idea of using deep networks for reasoning tasks
* This survey is structured as follows. In

#II A general model of attention and its components 3

* We use a well-known machine-translation architecture introduced by Bahdanau+
  [2] as an illustration and an instance of the general model
* To illustrate, we briefly describe a classic attention architecture, called
  RNNsearch [2]. We chose RNNsearch because of its 
  * historical significance and for its simplicity

## A. Example for Machine Translation and Alignment

* “relieve[s] the encoder from the burden of having to encode all information
  in the source sentence into a fixed-length vector.” 

## B. Unified Attention Model

* depend on the 
  * structure of the data whereupon they operate and on the 
  * desired output structure. 
* Our unified model is based on and extends Vaswani+ [36] and Daniluk+ [61]. It
  * core part shared by almost the totality of the models 
  * additional components that, although not universally present, are still
    found in most literature models.
* The distinction between keys and values was introduced by Daniluk+ [61], who
* Other [architectural choices] will be explored in Section IV-D.

## C. Deterministic Versus Probabilistic Attention

* a brief remark about some relevant naming conventions is in order. 
* sometimes described in the literature
  * The attention model described so far is a mapping with a probabilistic
    interpretation since the use of a softmax normalization [91]
  * some recent literature defines as deterministic attention models [134], [135]
    * context words are deterministically selected, for example, 
      e.g. by using the constituency parse tree of the input sentence. However,
* other authors described the 
  * first model as deterministic (soft) attention, to contrast it with
  * stochastic (hard) attention, where the probability distribution over
    weights is used to hardly sample a single input as context vector c, in
    particular following a reinforcement learning strategy [16]

#III Uses of attention in various NLP tasks 5

* Attention enables us to 
  * estimate the relevance of the input elements as well as to 
  * combine [input] elements into a com- pact representation: context vector
    condensed, smaller than the original input, 
    it requires fewer computational resources to be processed at later stages,
* Table III.
* For tasks such as document classification, where usually there is 
  * only K in input and no query, the 
  * attention mechanism can be seen as an [encoding] into a compact form. The
    * a form of feature selection, and as such, it can be applied to any set of
    * This applies to cases where features come from different 
      * domains as in multimodal tasks [78] or from different 
      * levels of a neural architecture [38] or where they simply 
      * represent different aspects of the input document [136]
* as an auxiliary task during training 
  so that specific features can be modeled via a multitask setting.  
  * This holds for several scenarios, such as visual question answering [137],
    domain classification for natural language understanding [138], and
    semantic role labeling [97]
* When the generation of a text sequence is required, as in MT, attention
  * dynamic representation of the input sequence, whereby the whole input does
  * q represents an embedding of the previous state of the decoder.  More
    e.g. sentiment analysis and information extraction.  
* sequence-to-sequence annotators, 
  without resorting to RNNs or convolutional neural networks (CNNs), as
  suggested by Vaswani+ [36], who rely on an attention mechanism to obtain a
  whole encoder/decoder architecture.
* a tool for selecting specific words. This could be the case, for example, in
  e.g. dependence parsing [97] and in cloze question-answering tasks [66], [70] 
* when multiple inter- acting input sequences have to be considered in combo 
  * question answering, where the input consists of two textual sequences—for
    * the question and the document or the question and the possible answers—an

#IV Taxonomy of attention models 6

#V Combined with knowledge about the task or the data 11

#VI Open challenges, current trends, and future directions 13

#VII Concludes 15