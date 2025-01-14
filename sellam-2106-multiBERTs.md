The MultiBERTs: BERT Reproductions for Robustness Analysis
Thibault Sellam, S Yadlowsky, J Wei, N Saphra, A D'Amour, T Linzen, J Bastings,
  I Turc, J Eisenstein, D Das, I Tenney, E Pavlick
arXiv:2106.16163 [cs.CL]

https://github.com/google-research/language/tree/master/language/multiberts

* Experiments with BERT are often based on a single checkpoint
* not always clear whether the conclusions hold for the more general procedure
  * for the model archit, training data, initialization scheme, & loss func
* re-running pretraining can lead to substantially different conclusions
  * alternative evaluations are needed to make principled statements
* we introduce MultiBERTs
  * 25 BERT-base checkpoints, trained with
    similar hyper-parameters as the original BERT model but
    differing in random initialization and data shuffling
  * aim is to enable researchers to draw robust and statistically justified
    conclusions about pretraining procedures
  * 25 fully trained checkpoints
  * statistical guidelines and a code library
    implementing our recommended hypothesis testing methods
* for five of these models we release 28 intermediate checkpoints
  in order to support research on learning dynamics

# 1 Intro

## Additional Related Work

* methods to reduce Bert ’s variability during finetuning
  (Zhang+ 2021; Mosbach+ 2021; Dodge+ 2020; Lee+ 2020; Phang+ 2018). Other
* the time dimension, which motivates our release of intermediate checkpoints
  (Liu+ 2021; Hao+ 2020; Saphra & Lopez, 2019; Chiang+ 2020; Dodge+ 2020)
* best practices for statistical testing
  * Similarly to §3, authors in the NLP literature have recommended
  * (Koehn, 2004; Dror+ 2018; Berg-Kirkpatrick+ 2012; Card+ 2020;
    Søgaard+ 2014; Peyrard+ 2021)
  * many of which are based on existing tests to estimate the uncertainty of
    test sample
* In concurrent work,
  * Deutsch+ (2021) considered
    bootstrapping methods similar to the Multi-Bootstrap,
    in the context of summarization metrics evaluation.  Also in concurrent
  * the Mistral project (Karamcheti+ 2021) released a set of 10 GPT-2 models
    with intermediate checkpoints at different stages of pre-training.  Our

# 2 release the MultiBerts

* a set of 25 Bert-Base, Uncased checkpoints to facilitate studies of
  robustness to parameter initialization and order of training examples (§2)
  Releasing these models preserves the benefits to the community of a single
  checkpoint release (i.e., low cost of experiments, apples-to-apples
  comparisons between studies based on these checkpoints), while enabling
  researchers to draw more general conclusions about the BERT pre-training
  procedure

# 3 Hypothesis testing

* We present the Multi-Bootstrap
  * a non-parametric method to quantify the uncertainty of experimental results
    based on multiple pre-training seeds (§3), and provide
  * recommendations for how to use the Multi-Bootstrap and MultiBerts in
    typical experimental scenarios
  * We implement these recommendations in a software library
* how can we quantify the uncertainty of a set of experimental results
  when there are multiple sources of randomness?
* The main idea is to use the average behavior over seeds as a means of
  summarizing expected behavior in an ideal world with infinite samples

# 4 Application: Gender in coref

* We illustrate the approach with a practical use case:
  we investigate the impact of counterfactual data augmentation on gender bias,
  in a Bert-based coreference resolution systems (Webster+ 2020) (§4)
* Additional examples are provided in Appendix E, where we document challenges
  with reproducing the widely-used original Bert checkpoint
