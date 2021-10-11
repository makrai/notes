Structure-Level Knowledge Distillation For Multilingual Sequence Labeling
Xinyu Wang, Yong Jiang, Nguyen Bach, Tao Wang, Fei Huang, Kewei Tu
ACL 2020 arXiv:2004.03846 [cs.CL]

* Multilingual sequence labeling is a task of
  predicting label sequences using a single unified model for multiple languages
  * Compared with relying on multiple monolingual models, using a multilingual
    * smaller model size, easier in online serving, and generalizability to
      low-resource languages. However, current multilingual models still
    * hE, underperform individual monolingual models significantly due to model
      capacity limitations. In this paper, we propose to reduce the gap between
* we distilling the structural knowledge of several monolingual models
  (teachers) to the unified multilingual model (student). We propose
  * two novel KD methods based on structure-level information:
    * approximately minimizes the distance between the student's and the
      teachers' structure level probability distributions,
    * aggregates the structure-level knowledge to local distributions and
      minimizes the distance between two local probability distributions. Our
* experiments on 4 multilingual tasks with 25 datasets show that our approaches
  * outperform several strong baselines and have
  * stronger zero-shot generalizability than
    both the baseline model and teacher models
