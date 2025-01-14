Mikel Artetxe, Gorka Labaka, Eneko Agirre
Bilingual Lexicon Induction through Unsupervised Machine Translation
ACL 2019 arXiv:1907.10761 [cs.CL]

# Abstract

* A recent research line ... by aligning independently trained word embeddings
  + nearest neighbor or related retrieval methods
* In this paper, we propose an alternative approach to this problem that
  * builds on the recent work on unsupervised machine translation. This way,
  * we use [cross-lingual embeddings] to build a phrase-table, combine it with
    a language model, and use the resulting machine translation system to
    generate a synthetic parallel corpus, from which we extract the bilingual
    lexicon using statistical word alignment techniques
  * not require any additional resource besides the monolingual corpus used to
    train the embeddings. When evaluated on the exact same cross-lingual
    embeddings, our proposed method obtains an average improvement of
    * 6 accuracy points over nearest neighbor and
    * 4 points over Cross-domain Similarity Local Scaling (CSLS) (Conneau+ 18)
    * new state-of-the-art in the standard MUSE dataset
