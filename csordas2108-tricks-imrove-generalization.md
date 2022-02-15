The Devil is in the Detail: Simple Tricks Improve Systematic Generalization of Transformers
Róbert Csordás, Kazuki Irie, Jürgen Schmidhuber
EMNLP 2021 arXiv:2108.12284 [cs.LG]

https://github.com/robertcsordas/ transformer_generalization

* Recently, many datasets have been proposed
  to test the systematic generalization ability of neural networks
  * The companion baseline Transformers,
    typically trained with default hyper-parameters from standard tasks, are
    shown to fail dramatically
* we demonstrate that by revisiting
  model configurations as basic as scaling of embeddings, early stopping,
  relative positional embedding, and Universal Transformer variants,
  we can drastically improve the performance of Transformers on systematic gene
  * improvements on five popular datasets:
    SCAN, CFQ, PCFG, COGS, and Mathematics dataset
  * improve accuracy from 50% to 85% on the PCFG productivity split, and from
    35% to 81% on COGS
    * On SCAN, relative positional embedding largely mitigates the EOS decision
      problem (Newman+ 2020), yielding 100% accuracy on the length split with a
      cutoff at 26
    * performance differences between these models are typically invisible on
      the IID data split
    * calls for proper generalization validation sets
      for developing neural networks that generalize systematically

# 1 Intro

* Systematic generalization (Fodor+ 1988) is a desired property for neural
  networks to extrapolate compositional rules seen during training beyond
  training distribution: for example, performing different combinations of
  known rules or applying them to longer problems. Despite the progress of ar-
  * still remains unsolved (Fodor and McLaughlin, 1990; Lake and Baroni, 2018;
    Liska+ 2018; Greff+ 2020; Hupkes+ 2020) While there has
  * much progress in the past years
    (Bahdanau+ 2019; Korrel+ 2019; Lake, 2019; Li+ 2019; Russin+ 2019),
    * in particular on the popular SCAN dataset (Lake and Baroni, 2018) where
      some methods even achieve 100% accuracy by introducing some non-trivial
      symbolic components into the system (Chen+ 2020; Liu+ 2020),
  * hE the flexibility of such solutions is questionable. In fact, the
  * SCAN-inspired solutions have limited performance gains on other datasets
    (Furrer+ 2020; Shaw+ 2020). It is thus not enough to solely focus on the
* Recently, many datasets have been proposed 
  * eg PCFG (Hupkes+ 2020) and COGS (Kim and Linzen, 2020)
  * The baseline Transformer models which are released together with the
    dataset are typically shown to dramatically fail at the task
  * However, the configurations of these baseline models are questionable.
  * In most cases,
    * some standard practices from machine translation are applied unmodified.
    * relevant techniques missing from baseline
      * eg such as relative positional embedding (Shaw+ 2018; Dai+ 2019)
* it is necessary to have not only good datasets but also strong baselines to
  correctly evaluate the limits of existing architectures and to
  avoid false sense of progress over bad baselines. In this work,
* we demonstrate that
  the capability of Transformers (Vaswani+ 2017) and in particular its
  universal variants (Dehghani+ 2019) on these tasks are largely underestimated
  * careful designs of model and training configurations are particularly
    important for these reasoning tasks testing systematic generalization. By
  * revisiting configurations such as basic scaling of word and positional
    embeddings, early stopping strategy, and relative positional em-bedding, we
    dramatically improve the performance of the baseline Transformers. We
* experiments on five datasets:
  SCAN (Lake and Baroni, 2018), CFQ (Keysers+ 2020), PCFG (Hupkes+ 2020),
  COGS (Kim and Linzen, 2020), and Mathematic dataset (Saxton+ 2019). In
  * our new models improve the accuracy on the PCFG productivity split from 50%
    to 85%, on the systematicity split from 72% to 96%, and on COGS from 35% to
    81% over the existing baselines. On the SCAN dataset, we show that our
    models with relative positional embedding largely mitigates the so-called
    end-of-sentence (EOS) decision problem (Newman+ 2020), achieving 100%
    accuracy on the length split with a cutoff at 26.
* we show that despite these dramatic performance gaps, all these models
  perform equally well on IID validation datasets. The consequence of this
  * need for proper generalization validation sets
    for developing neural networks for systematic generalization.
* We thoroughly discuss guidelines that empirically yield good performance
  across various datasets
