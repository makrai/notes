Mission: Impossible Language Models
Julie Kallini, Isabel Papadimitriou, Richard Futrell, Kyle Mahowald, Christopher Potts
ACL 2024 best paper arXiv:2401.06416 [cs.CL]

# Abstract

* Chomsky+: LLMs are equally capable of learning languages that are possible
  and impossible for humans to learn. However, 
  * hE there is very little published experimental evidence to support such a
* we develop a set of synthetic impossible languages of differing complexity,
  each designed by systematically altering English data with unnatural word
  orders and grammar rules
  * These languages lie on an impossibility continuum: at one end are languages
    * from inherently impossible, such as random and irreversible shuffles of
      English words, and on the other, 
    * to languages that may not be intuitively impossible but are often
      considered so in linguistics, particularly those with rules based on
      counting word positions. We report on a wide range of evaluations to
* we eval the capacity of GPT-2 small models to learn these uncontroversially
  impossible languages, and crucially, we perform these 
  * assessments at various stages throughout training to compare the learning
  * GPT-2 struggles to learn impossible languages when compared to English as a
* future: different LLM architectures be tested on impossible langs in an
  * how LLMs can be used as tools for these cognitive and typological investigs
  * from the Limitations sec: other natural languages as a starting point, 
    * our experimental choices (ie the synthetic languages we design) are
      informed by linguistic diversity and typology, distinguishing our
      impossible languages from those that are rare but attested. However,
  * more morphological manipulations.

# 5 Discu and Conclu

* neural language models for understanding the generalization of syntactic
  principles from data 
  (Wilcox+ 2018; Marvin and Linzen, 2018; Futrell+ 2019; Prasad+ 2019; Hu+
  2020). 
  * Ethan Wilcox, Roger Levy, Takashi Morita, and Richard Futrell. 2018. 
    What do RNN language models learn about filler–gap dependencies? In
    2018 BlackboxNLP: Analyzing and Interpreting NNs for NLP, Brussels
  * Rebecca Marvin and Tal Linzen. 2018.
    Targeted syntactic evaluation of language models. In Proceedings of the
    EMNLP 2018 Conference on Empirical Methods pages 1192–1202, Brussels
  * Richard Futrell, Ethan Wilcox, Takashi Morita, Peng Qian, Miguel
    Ballesteros, and Roger Levy. 2019.
    Neural language models as psycholinguistic subjects: Reprs of synt state
    NAACL 2019 Volume 1 pages 32–42, Minneapolis, Minnesota
  * Grusha Prasad, Marten van Schijndel, and Tal Linzen.  2019. 
    Using priming to uncover the organization of syntactic reprs in neural LMs.
    CoNLL 2019 pages 66–76, Hong Kong, China.
  * Jennifer Hu, Jon Gauthier, Peng Qian, Ethan Wilcox, and Roger Levy. 2020. 
    A systematic assessment of syntactic generalization in neural LMs
    ACL 2020 pages 1725–1744, Online
Our paper complements this line of work. We have shown that GPT-2 models do not
master our set of synthetic impossible languages as well as natural ones,
challenging the unfounded assertions stated previously.
Even in the absence of a clear definition of what constitutes a possible or
impossible language, we believe that our investigations advance this debate
regarding LLMs. The lack of a definition does not hinder inquiry into this
topic; in fact, it beckons further explorations of the boundary between the
possible and impossible languages, as shown in our hypothesized continuum in
Figure 1. We believe that the *H OP languages we propose closely approach
this boundary.
At the same time, conclusions about LLMs’ linguistic competence and
preferences for natural languages should be informed by an understanding of
the ways that models fundamentally differ from humans. For instance, we saw
that models can perform operations that involve counting tokens because LLMs
rely on tokens as basic units. While humans are sensitive to morpheme
boundaries and word boundaries, it is unlikely humans rely on atomic tokens in
the way that LLMs do. This does not mean that LLMs can fundamentally tell us
nothing about human language. Rather, as we did here, it is valuable to
consider and control for this difference before making generalizations.
Since at least the 1950s, a major line of linguistic inquiry has focused on
what aspects of syntactic structure can be learned just from data, without
domain-specific innate priors (e.g. a Universal Grammar). LLMs lack strong
in-built linguistic priors, yet they can learn complex syntactic structures.
While many LLMs are trained with vastly more data than children see, there is
increasing evidence that even systems trained on smaller amounts of data can
learn interesting linguistic information (Warstadt+ 2023). The current paper
raises further questions along similar lines. Since we do find that real
languages are more learnable by GPT-2, this leads us to wonder what inductive
bias of GPT language models matches natural language. We believe that this
inductive bias is related to information locality, the tendency for
statistical correlations in text to be short range. Information locality
arises in GPTs due to their autoregressive training objective and has been
argued to arise in humans due to the incremental nature of real-time language
processing (Futrell, 2019; Hahn+ 2021).
Since LLMs have been shown to learn the complex structures of human language
and have a preference for learning such structures over unnatural
counterfactuals, it follows that they are clearly relevant to investigations
and claims about the necessary innate priors for language learning. Argu-
ments that they are “by design, unlimited in what they can ‘learn”’ and
“incapable of distinguishing the possible from the impossible” (Chomsky+ 2023)
do not offer convincing evidence otherwise.

# C Results for Models without Positional Encodings Here, we present results

* All other aspects of the experiments are the same, including the impossible
  language datasets and training hyperparameters. We again train 5 sets of

# D Constituency Probing Evaluation

* how perturbations might influence latent linguistic properties in sentences
  that are seemingly unaffected by the perturbations. For this, we develop 
* a constituency probing experiment to examine
  whether the contextual representations generated by different models are
  effective in classifying a sequence of tokens with an appropriate const label
  * similar to the edge probing experiments of Tenney+  2019. For example, 
  * eg if the input sentence is “I enjoy strawberry ice cream” and
    the span of tokens in question represents the constituent “strawberry ice
    cream,” the span should be labeled as a noun phrase (NP).

## Setup. We conduct these experiments for `*R E VERSE` and ``*Hop`` languages,
since these languages have constituents in contiguous token sequences.
* For NoReverse` and Partial Reverse, we take a sample of unaltered BabyLM test
  sentences and omit the reversal token R . 
* For FullReverse`, we use the same sample sentences, but reverse the tokens.
* For the `*Hop` languages, we use a sample of BabyLM test sentences that are
  unaffected by the perturbation, which are sentences that do not contain
  3rd-person present tense verbs
* Our probes are L2-regularized logistic regression classifiers trained on the

## Hypothesis. Constituency probes will achieve higher accuracy for possible
languages than impossible ones, in virtue of the fact that the impossible

## Results. The results of the probing experiment 

* using the average of the last four GPT-2 layers are presented in Fig 9.
  Across `*Reverse` and `*Hop` models
* clear trends indicating that certain models have better representations of
  constituents than others, as differences among probe accuracies are minimal
  and unstable across training steps. However, looking closely at the
* `*Reverse` models without positional encodings, we can see that 
  * Partial Reverse has significantly lower probe accuracy than the other
    models up until 2K training steps. We found 
* fig 10: similar results when using different layers for span representations,
  as shown in Figure 10. These results might indicate that the `*Hop`
  perturbations were too weak to fundamentally affect the models’
  representations of latent linguistic structure, but quite unnatural reversal
  rule of the Partial Reverse language disturbed consituency boundaries in a
  way that could not be recovered by GPT-2 models without positional encodings.
