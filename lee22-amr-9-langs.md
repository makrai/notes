Maximum Bayes Smatch Ensemble Distillation for AMR Parsing
Young-Suk Lee, Ramón Astudillo, Hoang Thanh Lam, Tahira Naseem, Radu Florian, Salim Roukos
NAACL 2022

# Abstract

* AMR parsing has experienced an unprecendented increase in performance in the
  last three years, due to a mixture of effects including
  architecture improvements and transfer learning
  * Self-learning techniques have also played a role in pushing performance
  * hE the effect of self-learning and silver data augmentation fading. In this
* we propose to overcome this diminishing returns of silver data by combining
    Smatch-based ensembling techniques with ensemble distillation. In an
  * extensive experimental setup,
  we push single model English parser performance to a new SOTA, 85.9 (AMR2.0)
  and 84.3 (AMR3.0), and return to
  substantial gains from silver data augmentation. We also attain a
  * new SOTA for cross-lingual AMR parsing for
    Chinese, German, Italian and Spanish
  * we explore the impact of the proposed technique on domain adaptation, and
    * our technique  can produce gains rivaling those of human annotated data
      for QALD-9 and achieve a new SOTA for BioAMR
