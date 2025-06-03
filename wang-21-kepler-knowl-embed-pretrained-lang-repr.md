KEPLER: A Unified Model for Knowledge Embedding and Pre-trained Language Repr
Xiaozhi Wang, Tianyu Gao, Zhaocheng Zhu, Zhengyan Zhang, Zhiyuan Liu,
  Juanzi Li, Jian Tang
TACL (2021) 9: 176–194.

The source code can be obtained from https://github.com/THU-KEG/KEPLER

# Abstract

* factual knowledge in Pre-trained language representation models (PLMs) cannot
  * knowledge embedding (KE) methods can effectively represent the relational
    facts in knowledge graphs (KGs) with informative entity embeddings, but
    conventional KE models cannot take full advantage of the abundant textual
    information
* we propose a unified model for Knowledge Embedding and Pre-trained Lang Repr
  * not only better integrate factual knowledge into PLMs but also
    produce effective text-enhanced KE with the strong PLMs. In KEPLER, we
  * encode textual entity descriptions with a PLM as their embeddings, and then
    jointly optimize the KE and language modeling objectives
* Experimental results show that KEPLER achieves
  * SOTA performances on various NLP tasks, and also
  * remarkably good as an inductive KE model on KG link prediction.
* Wikidata5M1 , a large-scale KG dataset with aligned entity descriptions, and
  * we benchmark SOTA KE methods on it. It shall serve as a new KE benchmark
  * future: large KG, inductive KE, and KG with text
