Quan Wang; Zhendong Mao; Bin Wang; Li Guo
Knowledge Graph Embedding: A Survey of Approaches and Applications
IEEE Transactions on Knowledge and Data Engineering (Vol: 29, Issue: 12) 2017

# Abstract

* review based on the type of information used in the embedding task
* [organization]
  1. Techniques that conduct embedding using only facts observed in the KG are
    * overall framework, specific model design, typical training procedures
  2. techniques that further incorporate additional information besides facts
    * specifically ... entity types, relation paths, textual descriptions, and
      logical rules
  3. downstream tasks such as KG completion, relation extraction, question ans

# 1 Introduction

* KGs, such as Freebase [1], DBpedia [2], YAGO [3], and NELL [4]
* applications, from semantic parsing [5, 6] and
  named entity disambiguation [7, 8], to
  information extraction [9, 10] and
  question answering [11, 12]
* knowledge graph embedding [13, 14, 15, 16, 17, 18, 19]
  * benefit all kinds of tasks, such as KG completion [14, 15],
    relation extraction [20, 21],
    entity classification [13, 22], and
    entity resolution [13, 18]
* learned embeddings ... might not be predictive enough for downstream tasks
  [23, 24]
  * leverage other types of information
    entity types [25, 26], relation paths [27, 28, 29],
    textual descriptions [30, 31, 32, 33], and even logical rules [23, 34, 35]
* survey of statistical relational learning methods on KGs: Nickel+ [36]
  including embedding techniques, path ranking algorithms [37, 38, 39], and
  Markov logic networks [40, 41, 42]
  36. M. Nickel, K. Murphy, V. Tresp, and E. Gabrilovich
    A review of relational machine learning for knowledge graphs,”
    Proc. IEEE, vol. 104, no. 1, pp. 11–33, 2016.
  * In contrast to their work, we
    * focus specifically on KG embedding, and make a systematic review of
    * not only the state-of-the-arts but also those with latest trends

# 2 notations

# 3 techniques that conduct embedding using only facts observed in KGs

We describe the overall framework, specific model design, typical training
procedures, as well as pros and cons of such techniques

# 4 embedding techniques that further incorporate other information

use of entity types, relation paths, textual descriptions, and logical rules

# 5 application of KG embedding in downstream tasks

like KG completion, relation extraction and question answering
