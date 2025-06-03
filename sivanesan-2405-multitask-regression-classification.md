MTLComb: multi-task learning combining regression and classification tasks
  for joint feature selection
Han Cao, S Rajan, B Hahn, E Kocak, D Durstewitz, E Schwarz, V Schneider-Lindner
arXiv:2405.09886 [cs.LG] no citation after 9 months

The [repo](https://github.com/transbioZI/MTLComb) is written in R.

* Multi-task learning (MTL) has been successfully applied to ether regression or
  classification tasks alone, 
* regress + classif is challenging, primarily due to variations in the
  magnitudes of losses associated with different tasks. This challenge,
  * particularly evident in MTL applications with joint feature selection, often
    results in biased selections.
* we propose a provable loss weighting scheme that analytically determines the
  optimal weights for balancing regression and classification tasks. This scheme
  significantly mitigates the otherwise biased feature selection. Building upon
* we introduce MTLComb, an MTL algorithm and software package encompassing
  optimization procedures, training protocols, and hyperparameter estimation
  procedures. MTLComb is 
* tests on both
  simulated data and biomedical studies pertaining to sepsis and schizophrenia

# Intro

* Schizophrenia, a severe mental illness, impacts approximately 24 million
  people worldwide, contributing to a massive societal and economic burden 27 .
  * Neuroimaging studies have shown that schizophrenia is associated with an
    accelerated aging of the brain. These studies are based on the concept of
  * brain age is inferred from brain-structural or other data in contrast to
    chronological age — to quantify a potential acceleration of aging. This
  * age-dependent changes in brain structure 28 , epigenetic data 29 , and gene
    expression 30 . To further explore age dependent effects in schizophrenia,
* we explore the joint prediction of age (regression task) and diagnosis
  (classification task) as an MTLComb case study. 
* We assembled two cohorts comprising brain expressions 
  * designated: from individuals diagnosed with schizophrenia and 
  * validation: healthy
* On the discovery cohort, MTLComb model was employed to identify age-dependent
  genes that simultaneously serve as predictive markers for schizophrenia
  diagnosis. Subsequently, 
* we assessed the reproducibility of these markers using a validation cohort and
  explored the associated pathways for biological interpretation.
