Word Sense Induction & Disambiguation Using Hierarchical Random Graphs
Suresh Manandhar and Ioannis P. Klapaftis
2010 EMNLP

#Abstract

Graph-based methods have gained attention in many areas of NLP
  * Word Sense Disambiguation (WSD), text summarization, keyword extraction,
  * unsupervised graph clustering to obtain a set of clusters. Recent studies
  * hierarchical structure that goes beyond simple flat clustering
  * This paper presents an unsupervised method for inferring the hierarchical
    grouping of the senses of a polysemous word
  * improvements over state-of-the-art WSD systems based on sense induction

#1 Intro

* graphbased framework ... in
  * unsupervised WSD, a number of methods
    (Widdows and Dorow, 2002; Véronis, 2004; Agirre+ 2006)
    * co-occurrence graphs for a target polysemous word and applied
      graph-clustering to obtain the clusters (senses) of that word
  * text summarization, Mihalcea (2004) developed a method, in which sentences
    are represented as vertices in a graph and edges between them are drawn
    according to their common tokens or words of a given POS category, e.g
    * Graph-based ranking algorithms, such as PageRank (Brin and Page, 1998),
      were then applied in order to determine the significance of sentences. In
  * semantic similarity of text (Ramage et al., 2009)
* hierarchical structure (Clauset et al., 2006; Clauset et al., 2008) suggest
* In this paper, we present an unsupervised method for inferring the hierarchi-
  cal structure (binary tree) of a graph, in which vertices are the contexts of
  a polysemous word and edges represent the similarity between contexts. The
  method that we use to infer that hierarchical structure is the
  Hierarchical Random Graphs (HRGs) algorithm due to Clauset et al. (2008)
