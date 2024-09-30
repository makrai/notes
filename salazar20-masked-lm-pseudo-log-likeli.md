Masked Language Model Scoring
Julian Salazar, Davis Liang, Toan Q. Nguyen, Katrin Kirchhoff
ACL 2020

  https://github.com/awslabs/mlm-scoring

# Abstract

* Pretrained masked language models (MLMs) require finetuning for most tasks
* we evaluate MLMs out of the box via pseudo-log-likelihood (PLL)
  * computed by masking tokens one by one
* experiments
  * PLLs outperform scores from autoregressive language models like GPT-2
    in a variety of tasks
  * By rescoring ASR and NMT hypotheses, RoBERTa
    * reduces an end-to-end LibriSpeech model’s WER by 30% relative and
    * adds up to +1.7 BLEU on SOTA baselines for low-resource translation pairs
    * further gains from domain adaptation
* We attribute this success to PLL’s
  unsupervised expression of linguistic acceptability
  without a left-to-right bias
* greatly improving on scores from GPT-2
  * +10 points on island effects, negative polarity item (NPI) licensing
    in BLiMP
* One can finetune MLMs to give scores without masking,
  enabling computation in a single inference pass
* eg we use a single cross-lingual model to rescore translations in more langs
* In all, PLLs and their associated pseudo-perplexities (PPPLs) enable
  plug-and-play use of the growing number of pretrained MLMs

# 1 Intro

* BERT (Devlin+ 2019) and its improvements use bidirectional context,
  often via their masked language model (MLM) objectives
* In contrast, conventional language models (LMs) predict `w_t` using only past
  tokens `W<t := (w1 , ... , wt−1 )`
  * this allows LMs to estimate log probabilities for a sentence W
    via the chain rule (log PLM (W) = \sum_{t=1}^|W| log PLM (wt | W<t ))
  * can be used out of the box to
    * rescore hypotheses in end-to-end speech recognition and MT
      (Chan+, 2016; Gulcehre+, 2015), and to
    * evaluate sentences for linguistic acceptability (Lau+, 2017)
* we study the corresponding
  pseudo-loglikelihood scores (PLLs) from MLMs (Wang and Cho, 2019),
  given by summing the conditional log probabilities log PMLM (wt | W\t ) of
  each sentence token (Shin+, 2019)
  * induced in BERT by replacing `w_t` with `[MASK]` (Figure 1)

# 2 Background

* from the Intro
  * PLLs and their corresponding pseudo-perplexities (PPPLs) (Section 2.3) are
    intrinsic values one can assign to sentences and corpora,
    * allowing us to use MLMs in applications previously restricted to
      conventional LM scores
  * one can finetune BERT to
    compute PLLs in a single, non-recurrent inference pass (Section 2.2)
  * Existing uses of pretrained MLMs in sequence-to-sequence models for
    automatic speech recognition (ASR) or neural machine translation (NMT)
    involve integrating their weights (Clinchant+, 2019) or representations
    (Zhu+, 2020) into the encoder and/or decoder during training
    * In contrast, we train a sequence model independently, then rescore its
      n-best outputs with an existing MLM
  * acceptability judgments, one finetunes MLMs for classification using a
    training set (Warstadt +, 2019; Devlin+, 2019)
    * instead, PLLs give unsupervised, relative judgements directly

## 2.1 Pseudolikelihood estimation

* Bidirectional contextual representations like BERT come at the expense of
  being “true” language models PLM (W ), as
  * there may appear no way to generate text (sampling) or produce sentence
    probabilities (density estimation) from these models. This handicapped
  * in generative tasks they at best served to bootstrap encoder-decoder models
    (Clinchant+, 2019; Zhu+, 2020) or unidirectional LMs (Wang+, 2019).
    * Stephane Clinchant, Kweon Woo Jung, and Vassilina Nikoulina
      On the use of BERT for neural machine translation
      WNGT 2019
    * Jinhua Zhu, Yingce Xia, Lijun Wu, Di He, Tao Qin, Wengang Zhou,
        Houqiang Li, and Tie-Yan Liu.
      Incorporating BERT into neural machine translation
      ICLR 2020.
* nL BERT’s MLM objective can be viewed as stochastic maximum pseudolikelihood
  estimation (MPLE, Wang and Cho, 2019; Besag, 1975) on a training set W, where
  `{w_t}_{t=1}^{|W|}` are random variables in a fully-connected graph
  * This approximates conventional MLE, with MLM training asymptotically
    maximizing the objective: J_{PL} (Θ; W) = mean_W PLL(W ; Θ).
* In this way, MLMs learn an underlying joint distribution whose conditional
  distributions wt | W\t are modeled by masking at position t. We include a
  further discussion in Appendix B.
* This enabled text generation with BERT via Gibbs sampling, leading to the
   of a related quantity, the
  * sum of logits proposed  for sentence ranking by Wang and Cho, (2019)
  * not evaluated by Wang and Cho
* Shin+ (2019) extended past research on future-conditional LMs in ASR (Sec 5)
  with deeply-bidirectional self-attentive language models (bi-SANLMs)
  * They trained shallow models from scratch with the [MASK] scoring method,
    but did not relate their work to pseudolikelihood and fluency, which
    provide a framework to explain their success and observed behaviors.
* Experimentally, we extend both works by evaluating pretrained models,
  domain adaptation, and usage in NMT and multilingual settings (Section 3),
  along with acceptability judgements and
  PLL’s intrinsic numerical properties (Section 4)

## 2.2 [MASK]less scoring

* computing PLLs from an MLM requires a sentence copy for each position, making
  => the number of inference passes dependent on length
  (though these can be parallelized)
  * The cost of a softmax is also incurred, which is dependent on vocab size
* We propose reducing this to O(1) by training a network q with parameters ΘS
  to match BERT’s PLLs without [MASK] tokens: |PLL(W ) − q(W ; ΘS )|2 .
* We propose finetuning q from the pretrained MLM directly (ie initializing ΘS
  with Θ), via regression over the [CLS] token (Figure 2):
* More generally, one could use any student model q, as in knowledge
  distillation (Hinton+, 2014)
  * Here
    * teacher gives individual token probabilities (|W | inference passes) while
    * student approximates their sum (one inference pass).  This is
  * reminiscent of distilling an autoregressive teacher to a parallel student,
    as in the case of WaveNet (Oord +, 2018)
* Other [MASK]less bidirectional models like XLNet (Yang+, 2019) can also give
  PLLs; we leave this to future work

## 2.3 Pseudo-perplexity

* we propose the pseudo-perplexity (PPPL) of an MLM as an intrinsic measure
  of how well it models a corpus of sentences W
  * N denote the number of tokens in the corpus. Then a model’s PPPL on W is !
* Past work (Chen+, 2017) also computed this quantity with bi-RNNLMs for ASR,
  although such models are not deeply bidirectional like selfattentive MLMs
  (see Section 5).
* can be used in lieu of perplexities. For example,
  * eg during domain adaptation, one can perform early stopping with respect to
    development PPPL. This is
    * in contrast to MLM accuracy, which is not a continuous loss and is often
      stochastic (eg when performing dynamic masking as in RoBERTa)
  * In Section 4.1, we see that PPPLs naturally separate out sets of acceptable
    and unacceptable sentences.
* before BERT (Chen+, 2017; Shin +, 2019)
* we use pretrained BERTs, which are open-vocabulary (subword) bidirectional
* PPPLs are only comparable under the same subword vocabulary, which
  * differs between eg BERT and RoBERTa
  * Normalizing with N as the number of words mitigates this
* word-normalized PPPLs correlate with (In Appendix C, we show)
  * domain adaptation, and with
  * downstream metrics like ASR and BLEU after rescoring

# 3 Sequence-to-sequence rescoring

* from the Intro
  * scores from BERT compete with or even outperform GPT-2 (Radford +, 2019),
    * GPT-2 is a conventional language model of similar size but trained on
      more data
    * Gains scale with dataset and model size:
  * RoBERTa large (Liu +, 2019) improves
    * an end-to-end ASR model with relative WER reductions of 30%, 18% on Lib-
      riSpeech test-clean, test-other respectively (with further gains from
      domain adaptation), and improves
    * SOTA NMT baselines by up to +1.7 BLEU on low-resource pairs from standard
      TED Talks corpora
    * multilingual: the pretrained 15-language XLM (Conneau and Lample, 2019)
      can concurrently improve NMT systems in different target languages
* from the Conclusion

# 4 Analysis

* from the Intro
  * we analyze PLLs and propose them as
    a basis for other ranking/scoring schemes
  * Unlike log probabilities, PLL’s summands are
    more uniform across an utterance’s length (no left-toright bias), helping
    differentiate fluency from likeliness
  * unsupervised acceptability judgments on the BLiMP minimal pairs set
    (Warstadt+, 2020)
    * BERT and RoBERTa models improve the SOTA (GPT-2 probabilities) by up to
      3.9% absolute, with +10% on island effects and NPI licensing phenomena
    * ie PLLs can be used to assess the linguistic competence of MLMs in a
      supervision-free manner

## 4.1 Relative linguistic acceptability

* we interpret fluency as linguistic acceptability (Chomsky, 1957); informally,
  * the syntactic and semantic validity of a sentence according to human
    judgments (Schütze, 1996)
  * Its graded form is well-proxied by neural language model scores (log PLM )
    once length and lexical frequency are accounted for (Lau+, 2017)
  * controlled setting using minimal pairs and GPT-2 (345M) scores:
* the Benchmark of Linguistic Minimal Pairs (BLiMP) (Warstadt+, 2020), a
  _Raymond is selling this sketch._ −40.0,
  _Raymond is selling this sketches._ −45.2
  * 67k pairs which isolate contrasts in syntax, morphology, and semantics
* its predecessor, the Corpus of Linguistic Acceptability (CoLA),
  * has a training set and
  * to label sentences as “acceptable” or not in isolation (Warstadt+ 2019)
* BLiMP provides an unsupervised setting: sentences are evaluated relatively
  * This is equivalent to 2-best rescoring without sequence model scores (log
    f = 0)
* most minimal pairs only differ by a single word
  => the effect of length on log probabilities and PLLs (Sec 4.3) is mitigated
* We compute PLLs on the sentences of each pair using cased BERT and RoBERTa,
* Our results are in Table 7
* BERT (base) already outperforms the previous state of the art (GPT-2) by 1.6%
  * Despite using less than half the data and a third of the capacity,
  * increasing to 3.9% with RoBERTa (large)
* There are 4 of 12 categories where all four PLLs outperform log probabilities
  by ≥1% absolute (values marked by `*`), and
  * 7 where three or more PLLs outperform by this margin. Interestingly,
* PLLs do consistently worse on quantifiers, though
  * all are relatively bad against the human baseline
* The ratio of token-level PPPLs between unacceptable and acceptable sentences
  overall increases with performance, separating the two sentence sets
* RoBERTa improves by around 10% on filler-gap dependencies, island effects,
  and negative polarity items (NPIs), largely closing the human gap. This
  * ie the difficulty of these BLiMP categories was due to PLM decomposing
    autoregressively, and not intrinsic to unsupervised language model
    training, as the original results may suggest (Warstadt+, 2020). For
* examples in Table 8
  * subject-verb agreement example,
    BERT sees _The pamphlets_ and _resembled those photographs_ when scoring
    _have_ v. _has_, whereas
    GPT-2 only sees _The pamphlets_, which may not be enough to counter the
    misleading adjacent entity _Winston Churchill_ at scoring time

# 4.3 Numerical properties of PLLs

# 5 Related work

* the closest previous works (Wang and Cho, 2019; Shin+, 2019)
* we extend these
  * with regards to experiments and tasks, as outlined in Sec 2.1
  * the inference cost of masked rescoring: which we address it with our
    maskless scoring approach
  * we analyze PLL’s numerical properties

## Future context

* Log probabilities conditioned on past and future context have been used in
  * MT (Finch and Sumita, 2009; Xiong+, 2011) and
  * perennially in ASR (Shi+, 2013; Arisoy+, 2015; Chen+, 2017) to positive
* hE these are not “deep bidirectional” as
  they model interactions between `W<t` and `W>t` via the forward and backward
  context vectors, while
  MLMs model all pairwise interactions `w_s` and `w_{s'}` via
  dotproduct attention (compare ELMo versus BERT)
* Their PLLs would have different properties from ours
  * (eg their cross-entropies in Figure 4 may be convex instead of flat)

## Discriminative language modeling. Previous works  have explored
* training language models that directly optimize for a downstream metric
  (Roark+, 2004; Huang+, 2018, WER, BLEU). While
* we also eschew using log probabilities from conventional LMs,
  hE our approach remains generative
* Log probabilities model the joint distribution; PLL does so as well, albeit
  implicitly (Appendix B)
* PLL’s summands (conditional probabilities) remain
  accessible for Gibbs sampling and are not tailored to any metric
* The two approaches are complementary; for example,
  * eg one could use PLL as a “prior” or regularizer for scores given by
    discriminatively-finetuned BERT models in tasks like passage re-ranking
    (Nogueira and Cho, 2019)

## Language model integration

* Beyond finetuning pretrained LMs and MLMs,
  monolingual pretraining has also improved NMT performance
  (Ramachandran+, 2017; Conneau and Lample, 2019)
* hE, modular integration of language representation models remains prevalent
  for various pragmatic reasons, similar to fusion in ASR
* eg
  * the use of finetuned BERT scores in a question-answering pipeline
    (Nogueira and Cho, 2019), or
  * “as-is” cosine similarity scores from BERT to evaluate generated text
    (Zhang+, 2020). For example,
  * one might have no pretrained multilingual LMs for decoder initialization
    or fusion, as such models are difficult to train (Ragni+, 2016). However,
    * nL one may have an M-BERT or XLM for the target language/domain. Finally,
  * N-best rescoring and pretraining are not mutually exclusive, though
    pretraining may already go partway to improve fluency

# 6 Conclusion

* N-best rescoring with PLLs from pretrained MLMs in modern seq-to-seq models,
  for both ASR and low~ to medium-resource NMT
  *  match or outperform comparable scores from large unidir LMs (GPT-2)
* We attributed this to PLL’s promotion of fluency via self-consistency, as
  demonstrated by
  * improvement on unsupervised acceptability judgements and by
  * qualitative analysis
* we proposed
  * maskless scoring for speed, and proposed
  * pseudo-perplexities for intrinsic evaluation of MLMs, releasing a codebase
* Future work could
  * additional modular uses of MLMs,
  * simplify maskless PLL computations
  * better sentence~ or document-level scoring metrics based on PMLM

# B BERT as a generative model

* In their published version (Wang and Cho, 2019), the authors claimed that
  BERT is a Markov random field language model (MRF-LM) where
  `{w_t}_{t=1}^{|W|}` are categorical random variables (over the vocabulary)
  in a fully-connected graph G
* They define a _potential_ over cliques of G such that
  all partial-graph potentials are exp(0) = 1 and
  the full-graph potential is exp sum log φt (G),
  where log φt (G) is the logit corresponding to log PMLM (wt | W\t ) (although
  in their formulation, one could include the softmax into the feature function
  fθ and take log φt (G) = PLL(G) exactly)
