Word Embeddings, Sense Embeddings and their Application to Word Sense Induction
Linfeng Song
Area Paper April 2016

#Abstract

* show that sense embedding is applicable to the task of WSI
* we are the first to show that sense embedding methods are competitive on WSI
  by building sense-embedding-based systems that demonstrate
  highly competitive performances on the SemEval 2010 WSI shared task
* propose several possible future research directions on sense embeddings

#3 Sense Embedding

* Ontology-based method, on the other hand, initialize sene embeddings by
  linguistic definitions (definition, gloss, synonyms) from a sense inventory
* Multi-Sense Skip-gram (MSSG) model of Neelakantan et al. (2014)

##3.4 Evaluating on SCWS testset

##3.5 Evaluating on SemCor corpus

#4 Sense Embedding for WSI

##4.1 Introduction and Overview

* WSI has been successfully applied to many NLP tasks such as
  * machine translation (Xiong and Zhang, 2014),
  * information retrieval (Navigli and Crisafulli, 2010) and
  * novel sense detection (Lau et al., 2012)
* sense embedding (Reisinger and Mooney, 2010; Huang et al., 2012a;
  * Jauhar et al., 2015;
    * Jauhar, S. K., Dyer, C., and Hovy, E. (2015)
      Ontologically grounded multi-sense represen- tation learning for semantic
      vector space models
      2015 NAACL
  * Rothe and Schütze, 2015;
    * Rothe, S. and Schütze, H. ()
    Autoextend: Extending word embeddings to embeddings for synsets and lexemes
    2015 ACL IJCNLP
  * Chen et al., 2014;
    * Chen, X., Liu, Z., and Sun, M. (2014)
      A unified model for word sense representation and disambiguation
      2014 EMNLP
  * Tian et al., 2014)
* Evaluated on SemEval-2010 WSI dataset, our method outperforms all
  participants and most of the recent state-of-the-art methods

###4.3.1 Experimental Setup and baselines p29

* we build two systems:
  * SE-WSI-fix which adopts Multi-Sense Skip-gram model (Neelakantan et al.,
    2014) and assigns 3 senses for each word type, and
  * SE-WSI-CRP (Li and Jurafsky, 2015) which dynamically decides the number of
    senses using a Chinese restaurant process
