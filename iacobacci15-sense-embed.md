Ignacio Iacobacci, Mohammad Taher Pilehvar and Roberto Navigli
SensEmbed: Learning Sense Embeddings for Word and Relational Similarity

#Abstract

* we: polysemy + structured knowledge
* approach
  * transforms word embeddings to the sense level and
  * leverages knowledge from a large semantic network
* We evaluate our approach on
  * word similarity and
  * relational similarity frameworks

#1 Introduction

* applied to a variety of NLP tasks, such as
  * Word Sense Disambiguation (Chen+ 2014),
  * Machine Translation (Mikolov+ 2013b),
  * Relational Similarity (Mikolov+ 2013c),
  * Semantic Relatedness (Baroni+ 2014) and
  * Knowledge Representation (Bordes+ 2013)
* line of research ... taking advantage of existing semantic resources
  * Relation Constrained Model (Yu and Dredze, 2014)
    * replaces the original co-occurrence clues from text corpora with the
      relationship information derived from the Paraphrase Database 1
      (Ganitkevitch+ 2013, PPDB),
      * an automatically extracted dataset of paraphrase pairs

#2 Sense Embeddings

* we leveraged a state-of-the-art Word Sense Disambiguation (WSD) algorithm to
  automatically generate large amounts of sense-annotated corpora
