Masked Language Model Scoring
Julian Salazar, Davis Liang, Toan Q. Nguyen, Katrin Kirchhoff
ACL 2020

  https://github.com/awslabs/mlm-scoring

# Abstract

* Pretrained masked language models (MLMs) require finetuning for most tasks
* nL we evaluate MLMs out of the box via pseudo-log-likelihood (PLL)
  * computed by masking tokens one by one
* exper
  * PLLs outperform scores from autoregressive language models like GPT-2 in a
    variety of tasks
  * By rescoring ASR and NMT hypotheses, RoBERTa reduces an end-to-end
    LibriSpeech model’s WER by 30% relative and adds up to +1.7 BLEU on SOTA
    baselines for low-resource translation pairs
    * further gains from domain adaptation
* We attribute this success to PLL’s
  unsupervised expression of linguistic acceptability
  without a left-to-right bias
* greatly improving on scores from GPT-2 (+10 points on island effects, NPI
  licensing in BLiMP)
* One can finetune MLMs to give scores without masking, enabling computation in
  a single inference pass
* eg we use a single cross-lingual model to rescore translations in multiple
* In all, PLLs and their associated pseudo-perplexities (PPPLs) enable
  plug-and-play use of the growing number of pretrained MLMs; 

# 1 Intro

* BERT (Devlin+ 2019) and its improvements use bidirectional context, often via
  their masked language model (MLM) objectives
* In contrast, conventional language models (LMs) predict wt using only past
  tokens `W<t := (w1 , ... , wt−1 )`
  * this allows LMs to estimate log probabilities for a sentence W via the
    chain rule (log PLM (W ) = t=1 log PLM (wt | W<t )), which
  * can be used out of the box to 
    * rescore hypotheses in end-to-end speech recognition and MT (Chan+, 2016;
      Gulcehre+, 2015), and to 
    * evaluate sentences for linguistic acceptability (Lau+, 2017).  Our work
* we studie the corresponding
  pseudo-loglikelihood scores (PLLs) from MLMs (Wang and Cho, 2019), 
  given by summing the conditional log probabilities log PMLM (wt | W\t ) of
  each sentence token (Shin+, 2019)
  * induced in BERT by replacing wt with [MASK] (Figure 1)

# 2 Background

* from the Intro
  * PLLs and their corresponding pseudo-perplexities (PPPLs) (Section 2.3) are
    intrinsic values one can assign to sentences and corpora, 
    * allowing us to use MLMs in applications previously restricted to
      conventional LM scores
  * one can finetune BERT to compute PLLs in a single, non-recurrent inference
    pass (Section 2.2)
  * Existing uses of pretrained MLMs in sequence-to-sequence models for
    automatic speech recognition (ASR) or neural machine translation (NMT)
    involve integrating their weights (Clinchant+, 2019) or representations
    (Zhu+, 2020) into the encoder and/or decoder during training
    * In contrast, we train a sequence model independently, then rescore its
      n-best outputs with an existing MLM
  * acceptability judgments, one finetunes MLMs for classification using a
    training set (Warstadt +, 2019; Devlin+, 2019); 
    * instead, PLLs give unsupervised, relative judgements directly

# 3 Sequence-to-sequence rescoring

* from the Intro
  * scores from BERT compete with or even outperform GPT-2 (Radford +, 2019), a
    conventional language model of similar size but trained on more data. Gains
    scale with dataset and model size: RoBERTa large (Liu +, 2019) improves an
    end-to-end ASR model with relative WER reductions of 30%, 18% on Lib-
    riSpeech test-clean, test-other respectively (with further gains from
    domain adaptation), and improves SOTA NMT baselines by up to
    +1.7 BLEU on low-resource pairs from standard TED Talks corpora. In the
    multilingual case, we find that the pretrained 15-language XLM (Conneau and
    Lample, 2019) can concurrently improve NMT systems in different target
    languages
* from the Conclusion

# 4 Analysis

* from the Intro
  * we analyze PLLs and propose them as a basis for other ranking/scoring
    schemes
  * Unlike log probabilities, PLL’s summands are
    more uniform across an utterance’s length (no left-toright bias), helping
    differentiate fluency from likeliness
  * unsupervised acceptability judgments on the BLiMP minimal pairs set
    (Warstadt+, 2020)
    * BERT and RoBERTa models improve the SOTA (GPT-2 probabilities) by up to
      3.9% absolute, with +10% on island effects and NPI licensing phenomena
    * ie PLLs can be used to assess the linguistic competence of MLMs in a
      supervision-free manner

# 4.3 Numerical properties of PLLs

# 5 Related work

# 6 Conclusion

* N-best rescoring with PLLs from pretrained MLMs in modern seq-to-seq models,
  for both ASR and low~ to medium-resource NMT. We found rescoring with PLLs
  *  match or outperform comparable scores from large unidir LMs (GPT-2)
* We attributed this to PLL’s promotion of fluency via self-consistency, as
  demonstrated by 
  * improvement on unsupervised acceptability judgements and by 
  * qualitative analysis. 
* we proposed 
  * maskless scoring for speed, and proposed 
  * pseudo-perplexities for intrinsic evaluation of MLMs, releasing a codebase
* Future work could find
  * additional modular uses of MLMs, 
  * simplify maskless PLL computations, and use PLLs to 
  * devise better sentence~ or document-level scoring metrics
