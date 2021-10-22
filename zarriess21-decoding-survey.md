 Decoding Methods in Neural Language Generation: A Survey
Sina Zarrieß, Henrik Voigt, and Simeon Schüz
Information 2021, 12(9), 355; https://doi.org/10.3390/info12090355 spec issu nlg

# Abstract

* Neural encoder-decoder models for language generation can be trained
  * linguistic or non-linguistic inputs. When generating with these so-called
* We group the reviewed methods with respect to the broad type of objective that
  they optimize in the generation of the sequence—likelihood, diversity, and
  task-specific linguistic constraints or goals—and discuss their respective

# 1 Intro

* development of a neural architecture for generation involves many steps and
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
  * text-to-text generation (e.g., summarization) [10,11]
  * machine translation [10]
  * dialog modeling [12]
  * language modeling [11]. Here, the
* input is not necessarily language-external data but linguistic input, e.g.,
  * “core” NLG where the input to the system is non-linguistic
    * Gatt and Krahmer [2]’s survey focuses mostly on
  * distinction is very difficult to maintain as
    methods for neural data-to-text generation are often directly inspired by
    and compared to methods from other areas subsumed under or related to NLG,
* This survey includes a diverse set of papers published at major international
  NLP, ML, and AI venues
  * since the development neural NLG in 2015, i.e., papers that introduce
    particular decoding methods, that present analyses of decoding, or that
    report relevant experiments on decoding as part of a particular NLG system
  * also includes papers published before the advent of neural NLG, introducing
    foundational work on decoding methods that are still widely used in neural
    NLG
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
      transform them into output sequences of arbitrary length [38,39]. The main
    * represent the hidden states of the sequence, i.e., h, which represents
      a sort of memory
* limitation of RNNs is that they process both the input and the output in a
  strict left-to-right fashion and make it difficult to pass information between
  the encoder and the decoder in a flexible way. Therefore, the
* transformer architecture by Vaswani+ [40] has now replaced RNNs in many neural
  * self-attention heads. The layers of the transformer are built out of many
  * The decoder can attend to all positions up to the current one via
    self-attention, and includes encoder-decoder attention layers that allow the
    decoder to attend to all positions in the input sequence. Thus,
  * most, but not all, neural generation systems are autoregressive, see the
    next Section 2.3 for a brief summary of non-autoregressive approaches in
* there are different ways in which these models can be optimized during
  * in a supervised manner, maximize the likelihood of a word by minimizing the
    cross-entropy loss between predicted tokens and tokens given in the training
  * reinforcement learning (RL): sequence-level rewards to the model [41–45]. A
    * Ranzato+ [41]’s self-critical sequence training used to optimize RNNs, as
      a variant of the REINFORCE policy gradient optimization algorithm [46]. In
    * the prediction of the next word corresponds to an action which updates the
      state of the RL environment (here, the hidden state of an RNN)
    * the model receives the reward at the end of the sequence, such that the
    * A common reward function is the BLEU metric [47], which is also frequently
      used for automatic evaluation of generated sequences. It is important to
    * training a neural sequence generation from scratch using only RL-based
      sequence-level rewards is not deemed feasible in practice
    * In Ranzato+ [41] and other RL-based training regimes, the generation model
      is pre-trained using cross-entropy loss and used as the initial policy
      which is then fine-tuned with sequence-level training
    * Section 5.3 discusses further connections between decoding and RL-based
* no built-in mechanism that defines the reconstruction of the sequence from the
  given word probabilities
  * Regardless of the choice of
    * architecture (e.g., recurrent or transformer models) and
    * training regime (word-level or sequence-level), existing neural generation

## 2.3 non-autoregressive models

* parallelizing not only the encoder, but also the decoder of the neural
  generation architecture, leading to so-called non-autoregressive models. One
  * parallel decoding (here understood as the decoder part of the model) was
* the WaveNext architecture for text-to-speech synthesis by Oord+ [48]
* Gu+ [49] proposed a model for non-autoregressive machine translation, with the
  aim of fully leveraging the performance advantage of the Transformer
  architecture during decoding and avoid slow, potentially error-prone decoding
  mechanisms,
  such as beam search. The main idea of non-autoregressive modeling is that, at
  inference time, the model does not have to take into account dependencies
* naive baseline in (3)
  * predicts the target length of the sentence from its input and
  * conditions the word probabilities only on the input, not on preceding output
    words. This, unsurprisingly, has not been found to work in practice as this
    model exhibits full conditional independence. Generally, attempts at
    implementing non-autoregressive models, to date, have been more or less
* Most studies show that non-autoregressive models typically generate output of
  lower quality then outputs of autoregressive models
  * However, they are much faster and in some domains, such as speech synthesis
    or machine translation, good quality can be reached by using techniques of
    knowledge distillation [49], probability density distillation [48], or
    iterative refinement [50]
* some work on non-autoregressive or partially autoregressive models aims at
  going beyond the assumption that output needs to be produced in a fixed
  left-to-right generation order
  * Gu+ [51] present a transformer that treats generation order as a latent
    variable in sequence generation. They train their transformer to
    * predict the next word and, based on the next word, the next position in a
      given partial sequence. Since the learning of a model that optimizes the
    * likelihood marginalized over generation orders is intractable, they
      approximate the latent generation orders using beam search to explore the
      space of all permutations of the target sequence. In a similar vein,
  * Stern+ [52] develop the Insertion Transfomer which is trained to predict
    insertions of words into a partial sequence
    * By adopting different loss functions, their model can accommodate
      different generation orders, including orders that can be parallelized
      (e.g., balanced binary trees)
  * Both Gu+ [51]’s and Stern+ [52]’s experiments show that insertion-based
    decoding models reach SOTA performance in tasks, such as MT, code
    generation, or image captioning
* non-autoregressive models typically involves a built-in mechanism that defines
  the assembly of the sequence, in contrast to the autoregressive generation

* Section 1.2 gives an overview of different NLG tasks considered in this survey

# 3 beam search

* The most well-known and de-facto standard decoding procedure in
* dates back to Lowerre (1976)’s work on speech recognition. Since the advent
* shortcomings of beam search and its many variants that are used more or less
* The second goal of this survey is to provide an in-depth overview of
  definitions and analyses of beam search in neural NLG (Section 3)
* Table 1 summarizes these various aspects and papers related to beam search

## 3.1 decoding as a search problem

## 3.2 a basic example of beam search

## 3.3 variants and parameters of beam search used in recent NLG and MT

## 3.4 debate about strengths and weaknesses of beam search

* both Yang+ [64] and Koehn and Knowles [65] showed that
  increasing the width of the beam does not increase translation quality: the
* discussed in relation to the length bias of seq-to-seq models [58,61,69]. It
  * neural sequence transduction models are biased towards shorter sequences
    [39] and that this bias
    results from the fact that neural MT and other generation models build
    probability distributions over candidates of different lengths
  * Murray and Chiang [61] show that correcting the length bias with a simple
    word reward helps eliminating the drop in quality for wider beams, though
    they do not obtain better BLEU scores from wider beams with their method
  * Stern+ [52] also note that their non-autoregressive insertion transformer
    obtains better performance (up to 4 points in BLEU) when using an EOS
    penalty, i.e., a scalar that is substracted from the log probability of the
    end token
* Newman+ [59] compare two settings: models that are trained on sequences ending
  in EOS (+EOS) and models trained on sequences without EOS (-EOS). They find
  * -EOS models achieve better length generalization on synthetic datasets,
    i.e., these models are able to generate longer sequences than observed in
    the training set. They observe that the +EOS models unnecessarily stratify
  * not attribute sub-optimal decisions in stopping to the decoding procedure,
    but to model design and model failure
* other than MT
  * visual storytelling found that a larger beam size deteriorates quality of
    the generated stories [75]
  * Vinyals+ [67] in their well-known image captioning model observe a positive
    effect of a large beam size (k = 20) as opposed to a beam size of 1 (i.e.,
  * later replication of their study, Vinyals+ [76] carry out further
    experiments with varying beam width and show that a reduction of the beam
    size to k = 3 greatly improves performances compared to k = 20
  * Karpathy and Fei-Fei [68] find that a larger beam size (k = 7)
    * improves the quality of generated image descriptions but also leads to
      less novel descriptions being generated, a smaller beam size deteriorates
* The most comprehensive study of performance degradation caused by larger beam
  * Cohen and Beck [66], who investigated this effect
    in MT, summarization and captioning
  * They find a negative effect of width on generation quality in all these
    tasks and explain it with so-called “discrepancies”, i.e., low-probability
    tokens that are added to early to the beam and compensated later by
    high-probability tokens
* the beam tends to contain many candidates that share the same (most likely)
  prefix [63,72,73]. The bias towards hypotheses with the same prefix is also
  * a relatively high value for beam size would be needed to ensure that more
    diverse hypotheses that could potentially lead to more probable output are
    not excluded too early. This, unfortunately,
  * contradicts other studies that report a rather detrimental effect of a large
    beam size. A range of works have, therefore, have looked at modifying the
* neural text degeneration, Holtzman+ [71]
  * even more dramatic weaknesses of likelihood-based decoding which they
  * the likelihood objective used for decoding open text generation with large
    language models (such as GPT-2) systematically leads to
  * degenerate text that is “generic, akward and repetitive". They find that
    repeated phrases incur a positive feedback loop during decoding the LM: the
  * leads to text that contains sequences of the same, likely sentence, as they
  * Holtzman+ [71] argue that generation models should not aim at maximizing the
    likelihood of the output sequence, but produce text that is not the most
    probable text. They introduce nucleus sampling which will be discussed in
    Section 4
* others suggest that beam search is a blessing rather than a curse, as it
  * implicitly corrects certain built-in biases and defects of neural models
  * Stahlberg and Byrne [56] compare beam search to exact inference in neural MT
    * the underlying MT model assigns the global best score to the empty
      translation in more than half of the cases, which is usually not noticed
  * Meister+ [74] follow up on Stahlberg and Byrne [56] and hypothesize that
    beam search incorporates a hidden inductive bias that is actually desirable
    * They propose a more generalized way of modifying the objive of beam search
    * regularized decoding, which adds a strategically chosen regularization
      term to the likelihood objective in Equation (4).  They argue that
    * beam search is implicitly biased towards uniform information density (UID)
      * a more general principle from cognitive science by Levy and Jaeger [77]
      * speakers prefer utterances that distribute information uniformly across
        the signal.  Meister+ [74] demonstrate the connection between the UID
    * test a range of regularized decoding objectives that make this relship
      explicit
    * not directly relate their observations to Holtzman+ [71]’s observations
* Holtzman+ [71] state that “natural language rarely remains in a high
  probability zone for multiple consecutive time steps, instead veering into
  lower-probability but more informative tokens”, which seems to contradict the
  UID hypothesis. Thus, the debate about the merits and limitations of beam
  * Section 6 comes back to this general issue

## 3.5 how beam search is used in practice

* the fact that beam search comes with a set of variants and heuristics beyond
  the beam widths is not generally acknowledged and potentially less well known,
  especially in work that does not deal with MT. Here,
  * many papers do not report on the stopping criterion or length normalization
  * even in MT, the exact search parameters are not always mentioned
* The central parameter, beam width k sometimes differs widely for systems that
  model the same task, e.g., the
  * dialog generation system by Ghazvininejad+ [78] uses a width of 200, whereas
    the system by Shuster+ [79] uses a width of 2 (+ trigram blocking)
* Some sub-areas seem to have developed common decoding conventions, e.g.,
  * in MT where advanced beam search with length and coverage penalty is common
  * image captioning where simple beam search versions with moderate variations
    of the beam width are pre-dominant
  * In other areas, the decoding strategies vary widely, e.g., in dialog or
    open-ended text generation where
    * special tricks, such as trigram blocking, are sometimes used and sometimes
      not.  Moreover, in these areas,
    * beam search is often combined with other decoding strategies, such as
      sampling, which will be discussed below

# 4 decoding methods that increase the so-called “diversity” of generation

* different notions of diversity & the corresponding methods
* Table 4 shows an overview of the paper reviewed in this section

## 4.1 various definitions and evaluation methods for assessing diversity of

* the need for diverse output in NLG can arise for very different reasons and in
  * controlling register and style in documents [133]
  * generating entertaining responses in chit-chat dialogs [96]
  * generating responses with certain personality traits [27]
  * accounting for variation in referring expressions [118,134,135] or image
    captioning [122,136–139].  Given the widespread interest in diversity, it is
* closely linked to evaluation of NLG, one of the big challenges [140–144]
* local diversity: go evaluating systems only in terms of beyond the quality of
  the top, single-best generation output. Instead,
  * evaluation should also take into account the quality and the diversity of
    the n-best list, i.e., a set of generation candidates for a single input
* global diversity: a generation system should be able to produce different
  words and sentences for the same input. Another common thread is that
  * outputs should be diverse when looking globally at the outputs produced by
    the system for a dataset or set of inputs. Thus, global diversity means that
* An early investigation into local diversity is carried out by Gimpel+ [146],
  who argues that MT systems should aim at producing a diverse set of candidates
  * in order to help users inspect and interact with the system in the case of
    imperfect translations. They conduct a post-editing study where human
    participants are asked to correct the output of an MT system and find that
    editors benefit from diverse n-best list when the quality of the top
    translation is low (they do not benefit, however, when the top translation
  * taken up in Vijayakumar+ [147] and Li+ [54] (see Section 4.2)
  * assessed straightforwardly by means of automatic evaluation metrics
  * Ippolito+ [116] present a systematic comparison of different decoding
    methods in open-ended dialog generation and image captioning and assess them
    * perplexity over the top 10 generation candidates for an input and the
      Dist-k measure by Li+ [54], which is the total number of distinct k-grams
      divided by the total number of tokens produced in all the candidates for
      an input. Additionally, they include the
    * Ent-k measure introduced by Zhang+ [148] that takes into account the
      entropy of the distribution of n-grams in the top candidates
* van Miltenburg+ [132] analyze the global diversity of image captioning systems
  which they define as the ability of the generation system to use many
  different words from the vocabulary it is trained on
  * vocabulary will usually have a Zipfian distribution. A system that generates
  * need to generate rare words from the long tail of the distribution. van
  * test a range of metrics for quantitatively measuring global diversity:
    average sentence length, number of types in the output vocabulary,
    type-token ratio, and the percentage of novel descriptions. Their general
  * most image captioning systems from the year 2018 or earlier achieved a low
    global diversity
* BLEU can also be used to score the overlap between a set of model outputs,
  either for a single input or an entire test set [130,149–151], where a lower
  self-BLEU or mBLEU would signal higher diversity
* in open-ended or creative text generation task (see Section 4.4). Here,
  * Zhang+ [148] aim at building a system that generates informative and diverse
    responses in chit-chat dialog, where the goal is to avoid “safe and bland”
    responses that “average out” the sentences observed in the training set. A
  * Reference [152] view diversity as related to the model’s ability to generali
    * human evaluation is not a good way of capturing diversity
      as humans are not able to assess what the model has been exposed during
      training and whether it simply repeats sentences from the training data
  * Hashimoto+ [152] propose HUSE, a score that combines automatic and human evl
    * can be decomposed into HUSE-D for diversity and HUSE-Q for quality

## 4.2 methods that diversify beam search

## 4.3 sampling-based methods

## 4.4 trade-off between quality (search) and diversity

* Despite important conceptual and technical differences between these methods,
  they generally adopt a view on decoding that is directly complementary to the
  view of decoding as search: rather than deriving a single, highly probable
  generation output, the goal is to produce varied sets of outputs

# 5 task-specific objectives and linguistic constraints in generation

* Modeling constraints that control the behavior of an NLG system for
  particular tasks or situations is a notorious problem in neural NLG, given
  the complex black-box design of neural network architectures
* Decoding offers an attractive solution (or work-around) to this problem as
  it operates on the symbolic search space representing generation candidates
* controlling and constraining the linguistic properties of neural NLG output

# 6 general themes and questions around neural NLG closely connected to decoding

* decoding methods show important differences
  with respect to their objectives and underlying assumptions of the generation
* challenges and open questions that are brought up by decoding, but concern
  neural NLG in general
