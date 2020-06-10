A Call for More Rigor in Unsupervised Cross-lingual Learning
Mikel Artetxe, Sebastian Ruder, Dani Yogatama, Gorka Labaka, Eneko Agirre
ACL 2020 arXiv:2004.14958 [cs.CL]

# Abstract

* motivations, definition, approaches, and methodology for unsupervised cross-l
* we call for a more rigorous position in each of them
* the scenario that is most often used to motivate methods is unrealistic
  * no parallel data and abundant monolingual data
* We also discuss different training signals that have been used in previous
  * depart from the pure unsupervised setting. We then describe common
* issues in tuning and evaluation of unsupervised cross-lingual models and
* best practices.  Finally, we provide
* a unified outlook for different types of research in this area (i.e.,
  cross-lingual word embeddings, deep multilingual pretraining, and
  unsupervised machine translation) and we argue for comparable evaluation of

# Introduction

* connection among human languages has contributed to major discoveries in-
  * evolution of languages, the
  * reconstruction of proto-languages, and an
  * language universals (Eco and Fentress, 1995)
* In NLP: bridge the digital language divide, to
  * enable access to information and tech for the 6,900 langs (Ruder+ 2019)
* For the purpose of this paper, we define “multilingual learning” as learning
  a common model for two or more languages from raw text,
  without any downstream task labels
  * e.g. translation as well as pretraining multilingual representations. We
  * will use the term interchangeably with “cross-lingual learning”
* purely unsupervised cross-lingual learning (UCL): no parallel signal
  * overview in §2. Such work has been motivated by the apparent dearth of
* We [ argue with] the scenario (§3.1)
* Nevertheless, UCL is an important research direction and we advocate for its
  * inherent scientific interest (understand and make progress on general NLU)
  * usefulness as a lab setting, and simplicity (§3.2)

# 4 existing training signals and other signals that may be of interest for

# 5 methodological issues and best practices in UCL

* issues e.g., validation, hyperparameter tuning) and propose (§5).  Finally,

# 6 unified outlook of established research areas and recommendations

* i.e. (cross-lingual word embeddings, deep multilingual models and
  unsupervised machine translation)
