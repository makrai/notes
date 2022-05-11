UnNatural Language Inference
Koustuv Sinha, Prasanna Parthasarathi, Joelle Pineau, Adina Williams
ACL 2021 arXiv:2101.00010 [cs.CL]

* code and data are available at https://github.com/facebookresearch/unlu

# Abstract

* SOTA Natural Language Inference (NLI) models assign the same labels to
  permuted examples as they do to the original
* we propose a suite of metrics and investigate which properties of particular
  permutations lead models to be word-order invariant
  * eg In the MNLI dataset we find 98.7% examples have at least one permutation
    which elicits the gold label
  * Models are sometimes even able to assign gold labels to permutations that
    they originally failed to predict correctly
  * We provide a comprehensive empirical evaluation of this phenomenon, and
* issue exists for both
  * Transformers and pre-Transformer RNN / ConvNet based encoders, as well as
  * English and Mandarin Chinese

# 1 Intro

* it is easier for us to identify or recall words presented in canonical orders
  * “sentence superiority effect” (Cattell 1886; Scheerer 1981; Toyota 2001;
* textual entailment, one of the hallmark tasks (Condoravdi+ 2003; Dagan+ 2005)
  * also called Natural Language Inference (NLI; Bowman+  2015, i.a.), typically
  * predict whether the premise entails the hypothesis, contradicts it, or neut
* For nearly all premise-hypothesis pairs, there are many permuted examples that
  fool the models into providing the correct prediction.
  * In case of MNLI, for example, the current SOTA of 90.5% can be increased to
    98.7% merely by permuting the word order of test set examples. We even find
  * drastically increased cross-dataset generalization when we reorder words.
* We verify our findings with
  * three popular English NLI datasets
    * SNLI (Bowman+ 2015), MultiNLI (Williams+ 2018b) and ANLI (Nie+ 2020))—and
  * one Chinese one, OCNLI (Hu+ 2020a). It is thus less likely that our findings
* We also observe the effect for various architectures
  * transformer pre-trained on language modeling (BERT, RoBERTa, DistilBERT),
  * non-transformers, including a ConvNet, an InferSent model, and a BiLSTM.
* contributions are as follows:

# 3 a suite of metrics (Permutation Acceptance)
for measuring model insensitivity to word order (§3),

# 5 permuted test datasets for measuring NLI model performance at a large scale

# 6 NLI models focus on words more than word order

* models can partially reconstruct syntactic information from words alone
* the problem persists on out-ofdomain data,

# 7 humans struggle with UnNatural Language Inference

# 8 a simple maximum entropy-based method
to encourage models not to accept permuted examples.
