Decoding Methods in Neural Language Generation: A Survey
Sina Zarrieß, Henrik Voigt, and Simeon Schüz
Information 2021, 12(9), 355; https://doi.org/10.3390/info12090355 spec issu nlg

# Abstract

* Neural encoder-decoder models for language generation
  * linguistic or non-linguistic inputs
* We group the reviewed methods with respect to the broad type of objective that
  they optimize in the generation of the sequence—likelihood, diversity, and
  task-specific linguistic constraints or goals

# 1 Intro

* development of a neural architecture for generation involves many steps
  * definition of the task, the collection and preparation of data, the design
    of the model and its training, and the evaluation
  * Recent surveys in NLG cover these aspects very well (Gatt and Krahmer [2])
    * not address the topic of decoding in particular
* in many recent papers on NLG systems or tasks, the decoding method does not
  play a central role. Often, it is reported as a technical detail of the
  experimental set-up
* research into decoding has become a real trend in the area of NLG. Numerous
  papers have been published in recent years showing that the choice of decoding
  method has a considerable impact on the quality and various linguistic proptys

## 1.1. Motivation and Overview

## 1.2. Scope and Methodology

* NLG overlaps more and more with questions addressed in areas, such as
  * text-to-text generation (eg, summarization) [10,11]
  * machine translation [10]
  * dialog modeling [12]
  * language modeling [11]
* input is not necessarily language-external data but linguistic input
  * “core” NLG where the input to the system is non-linguistic
    * Gatt and Krahmer [2]’s survey focuses mostly on
  * distinction is very difficult to maintain as
    methods for neural data-to-text generation are often directly inspired by
    and compared to methods from other areas subsumed under or related to NLG,
* This survey includes a diverse set of papers published at major international
  NLP, ML, and AI venues
  * since the development neural NLG in 2015, ie, papers that introduce
    particular decoding methods, that present analyses of decoding, or that
    report relevant experiments on decoding as part of a particular NLG system
  * also includes papers published before the advent of neural NLG,
    * introducing foundational work on decoding methods that are
      still widely used in neural NLG
* We have compiled a list of papers on well-known NLG systems spanning the
  different NLG tasks just discussed and report their decoding method, even if
  it is not central in that paper
  * systems that either implement a decoding method relevant for this survey or
    constitute a popular approach in their sub-area according to their number of
    citations and publication venue
  * Table 2 summarizes the text-to-text generation systems which process
    linguistic inputs, whereas
  * Table 3 lists data-to-text systems that take non-linguistic data as input

# 2 Decoding Across NLG Frameworks and Tasks

* some basic NLG frameworks and why and where they require a decoding procedure

## 2.1 pre-neural statistical NLG systems

## 2.2 autoregressive neural generation

* neural network architectures that can be used to implement sequence generation
  * recurrent neural networks (RNNs) that are
    * able to consume or encode input sequences of arbitrary length and
      transform them into output sequences of arbitrary length [38,39]
    * represent the hidden states of the sequence, ie, h, a sort of memory
    * limitation of RNNs is that they process both the input and the output in a
      strict left-to-right fashion and make it difficult to pass information
      between the encoder and the decoder in a flexible way
  * transformer architecture by Vaswani+ [40] has now replaced RNNs in many
    * self-attention heads, the layers of the transformer are built out of many
    * The decoder can attend to all positions up to the current one via
      self-attention, and includes encoder-decoder attention layers that
      allow the decoder to attend to all positions in the input sequence
    * most, but not all, neural generation systems are autoregressive, see the
      next Section 2.3 for a brief summary of non-autoregressive approaches
* different ways in which these models can be optimized
  * in a supervised manner, maximize the likelihood of a word by minimizing the
    cross-entropy loss between predicted tokens and tokens given in the training
  * reinforcement learning (RL): sequence-level rewards to the model [41–45]
    * Ranzato+ [41]’s self-critical sequence training used to optimize RNNs, as
      a variant of the REINFORCE policy gradient optimization algorithm [46]
    * the prediction of the next word corresponds to an action which updates the
      state of the RL environment (here, the hidden state of an RNN)
    * the model receives the reward at the end of the sequence
    * A common reward function is the BLEU metric [47], which is also frequently
      used for automatic evaluation of generated sequences
    * training a neural sequence generation from scratch using only RL-based
      sequence-level rewards is not deemed feasible in practice
    * In Ranzato+ [41] and other RL-based training regimes, the generation model
      is pre-trained using cross-entropy loss and used as the initial policy
      which is then fine-tuned with sequence-level training
    * Section 5.3 discusses further connections between decoding and RL-based
* no built-in mechanism that defines the reconstruction of the sequence
  from the given word probabilities
  * Regardless of the choice of
    * architecture (eg, recurrent or transformer models) and
    * training regime (word-level or sequence-level), existing neural generation

## 2.3 non-autoregressive models

* parallelizing not only the encoder, but also the decoder of the neural
  generation architecture, leading to so-called non-autoregressive models
  * parallel decoding (here understood as the decoder part of the model)
* the WaveNex?t architecture for text-to-speech synthesis by Oord+ [48]
* Gu+ [49] proposed a model for non-autoregressive machine translation
  * aim: fully leveraging the performance advantage of the Transformer
  during decoding and
  * avoid slow, potentially error-prone decoding mechanisms, such as beam search
* The main idea of non-autoregressive modeling: at inference time, the model
  does not have to take into account dependencies
* naive baseline in (3)
  * predicts the target length of the sentence from its input and
  * conditions the word probabilities only on the input, not on preceding output
    * unsurprisingly, has not been found to work in practice as this model
      exhibits full conditional independence
* Most studies show that non-autoregressive models typically generate output of
  lower quality then outputs of autoregressive models
  * nL they are much faster and 
  * in some domains, such as speech synthesis or machine translation, 
    good quality can be reached by using techniques of knowledge distillation
    [49], probability density distillation [48], or iterative refinement [50]
* some work on non-autoregressive or partially autoregressive models' aim:
  output does not need to be produced in a fixed left-to-right generation order
  * Gu+ [51] present a transformer that treats
    generation order as a latent variable in sequence generation
    * predict the next word and, based on the next word,
      the next position in a given partial sequence
    * Since likelihood marginalized over generation orders is intractable,
      they approximate the latent generation orders using beam search to explore
      the space of all permutations of the target sequence. In a similar vein,
  * Stern+ [52] develop the Insertion Transfomer which is
    trained to predict insertions of words into a partial sequence
    * By adopting different loss functions, their model can accommodate
      different generation orders, including orders that can be parallelized
      (eg, balanced binary trees)
  * Gu+ [51]’s and Stern+ [52]’s experiments show that insertion-based decoding
    reaches SOTA performance in tasks eg MT, code generation, or image caption
* non-autoregressive models typically involves a built-in mechanism that defines
  the assembly of the sequence, in contrast to the autoregressive generation

* Section 1.2 gives an overview of different NLG tasks considered in this survey

# 3 beam search

* The most well-known and de-facto standard decoding procedure
* dates back to Lowerre (1976)’s work on speech recognition
* shortcomings of beam search and its many variants that are used more or less
* The second goal of this survey is to provide an in-depth overview of
  definitions and analyses of beam search in neural NLG
* Table 1 summarizes these various aspects and papers related to beam search

## 3.1 decoding as a search problem

## 3.2 a basic example of beam search

## 3.3 variants and parameters of beam search used in recent NLG and MT

* Algorithms 1 and 2 both run for a fixed number of time steps, whereas
  Algorithm 3 terminates once the top-most candidate on the beam ends with the
  special end-of-sequence symbol
* Algorithms 2 and 3 do not expand hypotheses that end in an end-of-sequence
  symbol, whereas Algorithm 1 does not account for this case
* Algorithm 1 includes a length normalization in the final selection step (last
  line), Algorithm 2 uses a generic scoring function which might include
  normalization or not, Algorithm 3 does not consider length normalization, etc

## 3.4 debate about strengths and weaknesses of beam search

* both Yang+ [64] and Koehn and Knowles [65] showed that
  increasing the width of the beam does not increase translation quality
* discussed in relation to the length bias of seq-to-seq models [58,61,69]
  * neural sequence transduction models are biased towards shorter sequences
    [39] and that this bias
    results from the fact that neural MT and other generation models build
    probability distributions over candidates of different lengths
  * Murray and Chiang [61] show that correcting the length bias with a simple
    word reward helps eliminating the drop in quality for wider beams, though
    they do not obtain better BLEU scores from wider beams with their method
  * Stern+ [52] also note that their non-autoregressive insertion transformer
    obtains better performance (up to 4 points in BLEU) when using an EOS
    penalty, ie, a scalar that is substracted from the log probability of the
    end token
* Newman+ [59] compare two settings: models that are trained on sequences ending
  in EOS (+EOS) and models trained on sequences without EOS (-EOS)
  * -EOS models achieve better length generalization on synthetic datasets,
    ie, these models are able to generate longer sequences than observed in
    the training set
  * not attribute sub-optimal decisions in stopping to the decoding procedure,
    but to model design and model failure
* other than MT
  * visual storytelling found that a larger beam size deteriorates quality of
    the generated stories [75]
  * Vinyals+ [67] in their well-known image captioning model observe a positive
    effect of a large beam size (k = 20) as opposed to a beam size of 1
  * later replication of their study, Vinyals+ [76] carry out further
    experiments with varying beam width and show that a reduction of the beam
    size to k = 3 greatly improves performances compared to k = 20
  * Karpathy and Fei-Fei [68] find that a larger beam size (k = 7)
    * improves the quality of generated image descriptions but also
      leads to less novel descriptions being generated
* The most comprehensive study of performance degradation caused by larger beam
  * Cohen and Beck [66], who investigated this effect
    in MT, summarization and captioning
  * They find a negative effect of width on generation quality in all these
    tasks and explain it with so-called “discrepancies”, ie, low-probability
    tokens that are added too early to the beam and compensated later by
    high-probability tokens
* the beam tends to contain many candidates that share the same (most likely)
  prefix [63,72,73]
  * a relatively high value for beam size would be needed to ensure that more
    diverse hypotheses that could potentially lead to more probable output are
    not excluded too early
  * contradicts other studies that report a rather detrimental effect of a large
    beam size
* neural text degeneration, Holtzman+ [71]
  * even more dramatic weaknesses of likelihood-based decoding
  * the likelihood objective used for decoding open text generation with large
    language models (such as GPT-2) systematically leads to
  * degenerate text that is “generic, akward and repetitive". They find that
    repeated phrases incur a positive feedback loop during decoding the LM
  * leads to text that contains sequences of the same, likely sentence
  * Holtzman+ [71] argue that generation models should not aim at maximizing the
    likelihood of the output sequence, but produce text that is not the most
    probable text. They introduce nucleus sampling, see Section 4
* others suggest that beam search is a blessing rather than a curse, as it
  * implicitly corrects certain built-in biases and defects of neural models
  * Stahlberg and Byrne [56] compare beam search to exact inference in neural MT
    * the underlying MT model assigns the global best score to the empty
      translation in more than half of the cases, which is usually not noticed
  * Meister+ [74] follow up on Stahlberg and Byrne [56] and hypothesize that
    beam search incorporates a hidden inductive bias that is actually desirable
    * They propose a more generalized way of modifying the objive of beam search
    * regularized decoding, which adds a strategically chosen regularization
      term to the likelihood objective in Equation (4)
    * beam search is implicitly biased towards uniform information density (UID)
      * a more general principle from cognitive science by Levy and Jaeger [77]
      * speakers prefer utterances that distribute information uniformly across
        the signal.  Meister+ [74] demonstrate the connection between the UID
    * test a range of regularized decoding objectives that make this relship
      explicit
    * not directly relate their observations to Holtzman+ [71]’s observations
* Holtzman+ [71] state that “natural language rarely remains in a high
  probability zone for multiple consecutive time steps, instead veering into
  lower-probability but more informative tokens”, which
  * seems to contradict the UID hypothesis
  * Section 6 comes back to this general issue

## 3.5 how beam search is used in practice

* the fact that beam search comes with a set of variants and heuristics beyond
  the beam widths is not generally acknowledged and potentially less well known,
  especially in work that does not deal with MT
  * many papers do not report on the stopping criterion or length normalization
  * even in MT, the exact search parameters are not always mentioned
* The central parameter, beam width k sometimes differs widely for systems that
  model the same task, eg, the
  * dialog generation system by Ghazvininejad+ [78] uses a width of 200, whereas
    the system by Shuster+ [79] uses a width of 2 (+ trigram blocking)
* by area
  * Some sub-areas seem to have developed common decoding conventions, eg,
    * in MT, advanced beam search with length and coverage penalty is common
    * image captioning where simple beam search versions with moderate
      variations of the beam width are pre-dominant
  * In other areas, the decoding strategies vary widely, eg, in dialog or
    open-ended text generation where
    * special tricks, such as trigram blocking, are sometimes used/not
    * beam search is often combined with other decoding strategies, such as
      sampling, which will be discussed below

# 4 decoding methods that increase the so-called “diversity” of generation

* different notions of diversity & the corresponding methods
* Table 4 shows an overview of the paper reviewed in this section

## 4.1 various definitions and evaluation methods for assessing diversity

* the need for diverse output in NLG can arise for very different reasons
  * controlling register and style in documents [133]
  * generating entertaining responses in chit-chat dialogs [96]
  * generating responses with certain personality traits [27]
  * accounting for variation in referring expressions [118,134,135] or image
    captioning [122,136–139]
* closely linked to evaluation of NLG, one of the big challenges [140–144]
* local, global 1, global 2
  * evaluating systems beyond the quality of the top, single-best generation
    * evaluation should also take into account the quality and the diversity of
      the n-best list, ie, a set of generation candidates for a single input,
      local diversity
  * global diversity: a generation system should be able to produce different
    words and sentences for the same input
  * outputs should be diverse when looking globally at the outputs produced by
    the system for a dataset or set of inputs
* An early investigation into local diversity is carried out by Gimpel+ [146],
  who argues that MT systems should aim at producing a diverse set of candidates
  * in order to help users inspect and interact with the system in the case of
    * post-editing study where human participants are asked to correct the
      output of an MT system and find that
      editors benefit from diverse n-best list when the quality of the top
      translation is low
  * taken up in Vijayakumar+ [147] and Li+ [54] (see Section 4.2)
  * assessed straightforwardly by means of automatic evaluation metrics
  * Ippolito+ [116]: a systematic comparison of different decoding methods
    in open-ended dialog generation and image captioning and
    * perplexity over the top 10 generation candidates for an input and the
    * Dist-k measure by Li+ [54], which is the total number of distinct k-grams
      divided by the total number of tokens produced in all the candidates for
      an input
    * Ent-k measure introduced by Zhang+ [148] that takes into account the
      entropy of the distribution of n-grams in the top candidates
* van Miltenburg+ [132] analyze the global diversity of image captioning systems
  which they define as the ability of the generation system to use many
  different words from the vocabulary it is trained on
  * vocabulary will usually have a Zipfian distribution
  * need to generate rare words from the long tail of the distribution
  * test a range of metrics for quantitatively measuring global diversity:
    average sentence length, number of types in the output vocabulary,
    type-token ratio, and the percentage of novel descriptions
  * most image captioning systems from the year 2018 or earlier achieved a low
    global diversity
* BLEU can also be used to score the overlap between a set of model outputs,
  either for a single input or an entire test set [130,149–151], where a
  lower self-BLEU or mBLEU would signal higher diversity
* in open-ended or creative text generation task (see Section 4.4)
  * Zhang+ [148] aim at building a system that generates informative and diverse
    responses in chit-chat dialog, where the goal is to avoid “safe and bland”
    responses that “average out” the sentences observed in the training set
  * Reference [152] view diversity as related to the model’s ability to generali
    * human evaluation is not a good way of capturing diversity
      as humans are not able to assess what the model has been exposed during
      training and whether it simply repeats sentences from the training data
  * Hashimoto+ [152] propose HUSE, a score that combines automatic and human evl
    * can be decomposed into HUSE-D for diversity and HUSE-Q for quality

## 4.2 methods that diversify beam search

* candidates are often similar to each other, ie,
  expansions of the same candidate from the previous step of beam search
* diverse beam search
  scores similarities of candidates or groups beam histories
  to make sure that future steps expand different, diverse histories
* A simple but well-known method for diverse beam search is by Li+ [54]
  * aim at generating diverse n-best lists using beam search
  * penalty that downranks candidates which have a sibling on the beam with a
    higher score, where a sibling is a candidate that is obtained by expanding
    the same hypothesis from the previous step of the search:
* A similar heuristic is proposed for MT by Freitag and Al-Onaizan [63]
  * threshold for the maximum number of sibling candidates that can enter
  * independently proposed and dubbed top-g capping in Ippolito+ [116]
    * g: the threshold for candidates that can enter the beam with the same hist
* Vijayakumar+ [147] for image captioning (hugginf `generate.diversity_penalty`)
  * Vijayakumar AK, Cogswell M, Selvaraju RR, Sun Q, Lee S, Crandall D, Batra D
    Diverse beam search: Decoding diverse solutions from neural sequence models
    arXiv 2016, arXiv:1610.02424
  * partition the candidates on the beam into groups
    * When expanding a candidate in a certain group,
      the scores (ie, log probabilities) of each word are augmented with a
      dissimilarity term
    * The best dissimilarity measure is hamming diversity which
      penalizes the selection of a token
      proportionally to the number of times it was selected in previous groups
* Kulikov+ [73] implement iterative beam search for neural conversation
  * run beam search multiple times (with a fixed beam width k) and,
    for each iteration, score each hypothesis
    for its dissimilarity to hypotheses found in previous iterations
* Tam [155] goes one step further and introduces clustered beam search
  * similarity between candidates is determined by K-means clustering of
    hypothesis embeddings. These clusters are then used as groups in [54,63],
    * only the top candidates from each cluster are selected for the next step
      of the search. This method is designed for generation in chatbots, where
      standard neural generators often produce very short and generic responses
  * a further language model threshold during decoding, filtering responses
    which have a language model score above a certain threshold
    * introduced independently for sentence simplification by Kriz+ [154], but
      they cluster candidates post decoding and
      select the candidates nearest to the cluster centroids
* Ippolito+ [116] also experiment with post-decoding clustering (PDC) but
  select candidates with the highest language model score from each cluster
* generating longer texts, such as, eg, image paragraphs faces the problem
  * output texts tend to contain repetitions [120]
  * Melas-Kyriazi+ [122] present a model that uses
    self-critical sequence training to generate more diverse image paragraphs,
    * combined with a simple repetition penalty during decoding
* Hotate+ [156]: diverse local beam search for grammatical error correction

## 4.3 sampling-based methods

* additional heuristics to shape or truncate the model distributions
* temperature sampling [157] that shapes the probability distribution with a
  temperature t and can be seen as a parameter of the softmax calculation [71]
  * often used with low temperatures ie α < 1, as this
    skews the distribution to the high probability events
  * detailed evaluation of the effect of temperature on quality and diversity is
    reported by Caccia+ [103]: they find the
    neural language models trained with a standard MLE objective outperform GANs
    in terms of the quality-diversity trade-off, and
    temperature can be used to systematically balance this trade-off
* nucleus [71] and top-k sampling [99] are well-known decoding diversity methods
  * both sample from truncated language model distributions
    * In each decoding step, a set of most probable next tokens is determined,
      from which one item is then randomly selected
  * Top-k sampling always samples from a fixed number of k items
    * The sum of the probabilities of the top k items, p 0 is then used as a
      rescaling factor to calculate the probability of a word in the top-k
    * at a given time step, p 0 can vary widely, as noticed by Holtzman+ [71]
    * difficult to select a value for k that performs consistently for different
      distribution shapes throughout a generation process
  * [71]’s nucleus sampling method: here, the decoding samples from the top-p
    portion of the accumulative probability mass, where p is a parameter that
* In practice, top-k and nucleus in combination with temperature sampling
  * eg Holtzman width 10, top-k sampling (temp. 1.8)
* sampling can be integrated with beam search and replace the typical likelihood
  scoring
  * Caccia+ [103] call this procedure stochastic beam search: the width of the
    beam defines the number of words that are sampled for each hypothesis at
    each time step
  * Massarelli+ [158] propose a similar method, called delayed beam search,
    where the first L tokens of a sentence are generated via sampling, and the
    rest of the sentence is continued via beam search

## 4.4 trade-off between quality (search) and diversity

* Despite important conceptual and technical differences between these methods,
  they generally adopt a view on decoding that is directly complementary to the
  view of decoding as search: rather than deriving a single, highly probable
  generation output, the goal is to produce varied sets of outputs
* Tables 2 and 3 include neural NLG systems that implement decoding for diversit
  * suggests that diversity-oriented decoding is used in practice, but is most
    widespread in “open” generation task, such as story generation or dialog,
    and in tasks where output longer than a single sentences needs to be
    generated. Even the first neural papers mentioned the need
  * In the case of story generation or paragraph generation, sampling is further
    combined with additional constraints aimed at avoiding repetitions in long
    texts, such as, eg, trigram blocking in Melas-Kyriazi+ [122]
* in MT systems in Table 2, there is not a single paper that uses
  diversity-oriented decoding, and the same holds for data-to-text generation
* In summarization, Radford+ [11]’s system uses top-k sampling, but their work
  does not primarily aim at improving the SOTA in summarization. In
* image captioning and referring expression generation, two studies explicitly
  aim at understanding the impact of diversity-oriented decoding in these tasks
  [116,118], whereas other systems do not seem to generally adopt them. For
* AMR-to-text generation, Mager+ [128] compare search-based decoding & sampling,
  and find that the latter clearly decreases the performance of the system
* One of the most exhaustive studies on diverse decoding is Ippolito+ [116]:
  they compare 10 decoding methods, both search~ and sampling-based,
  for the tasks of image captioning and dialog response generation
  * automatic measures for computing local diversity (in terms of entropy and
    distinct n-grams, see Section 4.1) and
    correlating them with human judgements of adequacy, fluency & interestingnss
  * trade-off between quality and diversity
  * Using a sum-of-ranks score over different evaluation metrics
    * dialog: clustered beam search and standard beam search with a relatively
      large beam width (k = 100) perform best for dialog generation. In
    * image captioning, the sum-of-rank score favors random sampling with top-k
      sampling and PDC
    * referring expression generation: The same trade-off is observed and
      analyzed by Panagiaris+ [118]
* Another trade-off of sampling-based diversity-oriented decoding is discussed
  by Massarelli+ [158]: they investigate open text generation, where a large
  language models is tasked to continue a given textual prompt. They evaluate
  the verifiability of these freely generated texts against Wikipedia, with the
  help of an automatic fact-checking system. They show that
  * sampling-based decoding decreases the repetitiveness of texts at the expense
    of verifiability, whereas beam search leads to more repetitive text that
    does, however, contain more facts that can be supported in automatic fact
    checking
* most of the decoding methods discussed in this section are designed to
  increase the local diversity of generation output
  * van Miltenburg+ [132] present a study that evaluates the global diversity of
    image captioning systems using available generated image descriptions. They
  * not take into account possible effects of the systems’ decoding methods
  * Schüz+ [159] compare the global diversity of beam and greedy search, nucleus
    decoding, and further task-specific, pragmatically-motivated decoding
    methods in discriminative image captioning; see Section 5.3

## 4.5 Summary

# 5 task-specific objectives and linguistic constraints in generation

* hard constraints on the system output, or simply linguistic knowledge on the
* Modeling constraints that control the behavior of an NLG system for
  particular tasks or situations is a notorious problem in neural NLG, given
  the complex black-box design of neural network architectures
* Decoding offers an attractive solution (or work-around) to this problem as
  it operates on the symbolic search space representing generation candidates
* controlling and constraining the linguistic properties of neural NLG output
* An overview of the different methods is shown in Table 5

## 5.1 lexical constraints

* lexical constraints at the end of search
  * Kiddon+ [104] present a neural checklist model for long text generation,
    where a list of agenda items is given in the input
    * beam search and select the most probable candidate which mentions most
      items from a given agenda. A similar “trick” is used
  * in the data-to-text generation system by Puzikov and Gurevych [106], where
    * the candidate that mentions most attributes from the input representation
      is selected from the beam
  * hE, not a convincing solution when
    lexical constraints are complex and span several words or when
    the corresponding words are assigned low probabilities by the LM
* constrained beam search
  * Anderson+ [161] make such a case for image captioning and use lexical
    * extend the models coverage to a wider set of object classes. They argue that
    * image captioning systems are difficult to extend and adapt to novel types of
      concepts and scenes that are not covered in the training data, whereas
    * constrained beam search, illustrated in Figure 2a, which
      * guides the search to include members from given sets of words (external
        image labels, in their case) during decoding. The main idea of the
      * the set of constraints is represented as a finite-state machine, where
        each state maintains its own beam of generation candidates
    * outperforms a competing system that uses similar knowledge to extend the
      training data of the system
    * MT is addressed in Hokamp and Liu [163], where
      * lexical constraints are provided by users that post-edit the output of a
* Hokamp and Liu [163]’s grid beam search is illustrated in Figure 2b and, in
  * also targets phrasal lexical constraints that span multiple words and
    multi-token constraints where spans might be disconnected
  * 3 operations for expanding a candidate on the beam:
    * open in a new hypothesis (add a word from the model’s distribution),
    * start a new constraint, and
    * continue a constraint
  * For each constraint, the algorithm allocates a separate beam B 0 B 1 ...B C
    that groups hypotheses that meet i constraints from the set. At the end, the
    algorithm returns the highest scoring candidate from B C , ie, the
    sub-beam with hypotheses that meet all constraints. Their experiments show
  * useful for interactive post-editing and for modeling terminology in domain
    adaptation
* Post and Vilar [164] note that
  * both constrained beam search and grid beam search have a high complexity
    * grows linearly resp exponentially with the number of constraints.  They
  * a faster variant of grid beam search that has a global, fixed beam width and
    dynamically re-allocates portions of the beam to groups of candidates
    meeting a different number of constraints and being available at a given
  * prevents the model from generating the EOS symbol unless all constraints
    have been met in a given candidate.  In their analysis, Post and Vilar [164]
  * “aversion to references”. They show that,
    by increasing the beam width and including partial references (ie,
    constraints) during decoding, the model scores decrease, but the BLEU scores
    increase, which is
* Baheti+ [97] propose a distributional approach to extend the decoding
  * conversational responses in open chit-chat dialog.  They use an
  * external topic model and an external embedding to extend the objective of
    standard beam search with two additional terms, scoring the topical and the
    semantic similarity of the source and response sentence.  Furthermore, they
    combine this objective with the diverse-decoding method by Li+ [54] and find
    that this combinations produces rich-in-content responses, according to
    human evaluation

## 5.2 constraints on the level of structure and form

* poetry generation, where systems need to produce creative text that adheres to
  * rhythmic patterns, rhyme patterns, or tonal patterns [165,167].  Compared to
    the rather local, lexical constraints discussed in Section 5.1, these
  * need to be consistent on multiple levels (eg, rhyme and rhythm), and need
    span the entire text. Nevertheless, the decoding
  * techniques used in poetry generation systems are surprisingly similar to the
    one already discussed in this survey
* Zhang and Lapata [165] present a RNN approach for generating Chinese poetry
  * Their work focuses mostly on the neural model but mentions that
    the tonal constraints are incorporated at the decoding stage. In their
    decoder, the first line generated by the RNN determines the subsequent tonal
    pattern, and the following lines that do not adhere to it are discarded
* Ghazvininejad+  [166] propose a similar framework for generating sonnets but
  focus more on the decoding stage: they construct a sophisticated finite-state
  automaton that represents the various formal constraints of sonnets and use
  the state of this FSA as additional information during beam search. Their beam
  search algorithm has a fixed width of 50, and they encounter the problem that
  this width is sometimes too narrow and does not contain words that adhere to
  the required rhyme patterns
  * generate the sonnet in reverse, starting from the last rhymed word
* Hopkins and Kiela [167] generalize this method and compare a neural model for
  poetry generation, that is trained on content and formed jointly, with a model
  that uses a generative neural language model for generating the content of a
  poem with a discriminative weighted finite-state automaton that models the
  form of the poem. They find that the model which incorporates formal
  constraints in a separate discriminative model generates more formulaic poetry
  (eg, makes less formal errors) and also generates poems that are rated as
  very human-like in a distinguishability experiment with users
* Balakrishnan+ [162] presenting an approach for constrained decoding for
  generation in task-oriented dialog
  (not to be confused with the constrained beam search by [161])
  * They tackle the often discussed issue of semantic errors or hallucinating
    such as the E2E challenge [7], that require the accurate linguistic
  * a neural sequence-to-sequence model to not only generate sequences of
    words but output trees that conform to the structure of a given input
    meaning representation
  * check, during incremental decoding of the tree structure, whether the
    opening bracket tokens in the output conform to the phrases in the input
    representation and whether the phrase has already been included in the
    subtree in preceding timesteps
  * outputs are more grammatical and semantically correct as compared to
    systems that do not incorporate these structural constraints

## 5.3 pragmatic reasoning, Conversational Goals

* eg, neural image captioning systems
  * While standard image captioning targets (more or less) neutral descriptions
  * pragmatically informative captioning in
    * Andreas and Klein [168], Vedantam+ [170], and Cohn-Gordon+ [169]. These
  * train a neural NLG on standard image description datasets and
    decode this system, at testing time, to produce captions that discriminate
    target images from a given set of distractor images
  * evaluated primarily in terms of their pragmatic informativeness, ie, using
    a “listener” model that resolves a generated caption to an image in the
    context of distractor images
  * setting is very similar to the well-known Referring Expression Generation
    (REG) task [117,175,176],
    but the neural generation model is trained on context-agnostic data
* RSA framework [177] models informativity at the semantics-pragmatics
  * how pragmatically informative utterances can be derived from from literal
    semantics using Bayesian inference
  * Andreas and Klein [168] and Cohn-Gordon+ [169] have implemented RSA as a
    decoding strategy which integrates pragmatic factors into the iterative
    unrolling of recurrent generation models
  * rational speaker reasons about how an utterance would be understood by a
    listener, in order to assess whether the utterance allows the identification
  * The speaker and listener are given a set of images W, out of which
    one image w∗ ∈ W is known to the speaker as the target image
  * rational speaker in RSA is based on a literal speaker, who produces initial
    utterance candidates
  * In the simplest case, the literal speaker assigns equal probability to all
    true utterances u ∈ U and zero probability to false utterances
  * The pragmatic listener L 0 then assesses the discriminative information of
    these candidates, according to Cohn-Gordon+ [169]
* The Emitter-Suppressor method (henceforth ES) proposed by Vedantam+ [170]
* Schüz+ [159] directly compared RSA and ES decoding and showed that both
* Zarrieß and Schlangen [171] extend RSA-based reasoning to a zero-shot setting,
  where the speaker’s task is to refer to target object of an “unknown” category
  that the literal speaker has not encountered during training. This
  * resembles the set-up described in Anderson+ [161], where the decoding
  * not widen the model’s vocabulary but aims at leveraging the training
    vocabulary in efficient way for referring to unknown objects
* non-visual tasks have been explored:
  * Shen+ [172] implement a model for pragmatically informative text generation,
    comparing so-called reconstructor-based and distractor-based reasoning
    * reconstructor-based set-up, the listener predicts a distribution over all
      possible input contexts (eg, meaning representations) for a generation
      output
    * distractor-based reasoning scores distinguishes an input from a set of
      alternate, distractor inputs.  Shen+ [172]’s outperforms competitive
    * without pragmatic decoding on the E2E dataset [178]
  * Kim+ [173] implement pragmatic reasoning for decoding a neural dialog
    response generator that
    aims at achieving so-called public self-consciousness:
    the literal speaker is trained to generate responses on the PersonaChat data
    * the listener models the identification of the speaker’s underlying persona
    * improves the consistency of the generated responses, ie, the response
* Up to this point: decoding methods that are clearly separated from the
  internal layers of a neural NLG architecture and that use heuristics
  * Section 2.2 already mentioned RL-based methods for optimizing the model
    with sequence-level rewards in training
  * Gu+ [174] explore RL for decoding and introduce the notion of trainable
    decoding
    * As in other RL-based generation approaches [41,42], they use a neural
      (MT) system that is trained in supervised fashion as their base model
    * An important difference to Ranzato+ [41]’s approach:
    * an additional layer or “actor-network” to the trained model that will be
      optimized with RL, while freezing the other, pretrained layers 
      * this actor network as a trainable decoder that learns to manipulate the
        hidden state of the underlying pre-trained RNN and 
      * can be optimized with any given reward function
  * Chen+ [179] present a supervised method to train the decoder. Of course,
    this notion of trainable decoding is conceptually different from an actual
    inference procedure for sequence prediction. Thus, when applying their
    model, Gu+ [174] combine the trainable decoder with the beam search
  * Zarrieß and Schlangen [70] test Chen+ [179]’s supervised approach in an REG
    experiment and combine it with greedy search to avoid the already discussed
    deficiencies of beam search, while
  * Gu+ [174] and Zarrieß and Schlangen [70] rely on BLEU as a reward for the
    decoder, other metrics and rewards might constitute more interesting options
    to optimize decoding for, eg, conversational goals. For instance,
  * Panagiaris+ [118] present a transformer-based model for REG that incorpors
    RL and various decoding methods
    to balance the diversity and informativeness of referring expressions
    * different objectives during generation might be achieved through a
      combination of modeling and decoding techniques

# 6. Research Gaps and Future Directions

* general themes and questions around neural NLG closely connected to decoding
* decoding methods show important differences
  with respect to their objectives and underlying assumptions of the generation
* challenges and open questions that are brought up by decoding, but concern
  neural NLG in general

## 6.1. Exploring Decoding Parameters for Core NLG Tasks

* most research on decoding neural sequence-to-sequence models in MT
* eg the end of sentence penalty in Klein+ [55]’s beam search implementation
  assumes that the length of the output text can be estimated from the length of
  the input text. Missing exploration and analysis of these and further
* eg data-to-text generation, where there is much less structural similarity

## 6.2. The Status of Language Modeling in Neural Generation

## 6.3. Diversity, Effectiveness, and other Objectives in NLG

* principles of intentional and goal-oriented language use in human interaction,
  eg, Grice [184] or Clark [185]
* Gkatzia+ [186] formulate a multi-objective approach to generating summaries
  that aims at fulfilling the needs of different user groups of generated text

## 6.4. What to Model and How to Decode?

* future work is to arrive at a more systematic understanding of the conceptual
  division of labor between modeling and decoding in neural NLG, ie,
  * which aspects of language generation should be taken care of in the model
    and which aspects should be handled in the decoding algorithm
