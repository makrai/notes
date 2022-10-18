Lifting the Curse of Multilinguality by Pre-training Modular Transformers
Jonas Pfeiffer, Naman Goyal, Xi Victoria Lin, Xian Li, James Cross,
  Sebastian Riedel, Mikel Artetxe
NAACL 2022 arXiv:2205.06266 [cs.CL]

# Abstract

* curse of multiling: Multilingual pre-trained models are known to suffer from
  * per-language performance to drop as they cover more languages. We address
* we introduce language-specific modules, which
  allows us to grow the total capacity of the model, while keeping
  the total number of trainable parameters per language constant. In contrast
* prior work learns language-specific components post-hoc,
  we pre-train the modules of our Cross-lingual Modular (X-Mod) models from the
  start
* Our experiments on natural language inference, NER and question answering
  * improved monolingual and cross-lingual performance
* our approach enables adding languages post-hoc
  with no measurable drop in performance,
  no longer limiting the model usage to the set of pre-trained languages

# 1 Intro

* curse of multilinguality (Figure 2, Conneau+ 2020)
  * pre-training a model with a fixed capacity on an increasing amount of
    languages only improves its cross-lingual performance up to a certain
    point, after which performance drops can be measured
* we add modular components during pre-training,
  thereby preparing the model to be extended to new languages post-hoc
