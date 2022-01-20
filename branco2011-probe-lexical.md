Comparative Probing of Lexical Semantics Theories for Cognitive Plausibility and Technological Usefulness
António Branco, João Rodrigues, Małgorzata Salawa, Ruben Branco, Chakaveh Saedi
arXiv:2011.07997 [cs.CL]

* Lexical semantics theories differ in advocating that the meaning of words is
  * inference graph, a feature mapping or a vector space , thus raising the
  * ? unified account where these approaches seamlessly emerge as (partial)
    renderings of (different) aspects of a core semantic knowledge base?  In
* we: experiments that systematically probe different lexical semantics theories
  for their levels of cognitive plausibility and of technological usefulness.
* the feature-based approach emerges as superior to the other ones, and arguably

# 1 Intro

* three broad families advocate that lexical semantics is represented as a
  * semantic network (Quillan, 1966)
  * feature-based mapping (Minsky, 1975; Bobrow and Norman, 1975)
    * key is the lexical unit of interest and the respective
    * value is a set of other units denoting characteristics prototypically
      associated with the denotation of the unit in the key (e.g. color, usage)
  * semantic space (Harris, 1954; Osgood+ 1957; Miller and Charles, 1991).
* different suitability and success in explaining a range of empirical phenomena
  * how these are manifest in ordinary language usage and also
  * how they are elicited in laboratory experimentation. These phenomena are
* related to the
  * acquisition, storage and retrieval of lexical knowledge (e.g.
    * spread activation effect (Meyer and Schvaneveldt, 1971), the
    * fan effect (Anderson, 1974) among many others) and to the
  * interaction with other cognitive faculties or tasks, as
    * categorization (Estes, 1994)
    * reasoning (Rips, 1975)
    * problem solving (Holyoak and Koh, 1987)
    * learning (Ross, 1984)
* repositories of lexical knowledge. Popular representatives are, for
  * semantic networks, WordNet (Fellbaum, 1998), for
  * feature-based models, SWOW (De Deyne+ 2019), and for
  * semantic spaces, word2vec (Mikolov+ 2013b) a.o.
* Different knowledge bases (KBs) are rooted in different empirical sources:
  * WordNet is based on lexical intuitions of human experts; the information in
  * SWOW is evoked from laypersons cued with lexical units; and
  * word2vec reflects the co-occurrence frequency of words in texts.Figure 1:
* unified account of lexical semantics
  such that the above approaches seamlessly emerge as (partial) renderings of
  (different) aspects of the same core semantic knowledge base?
  * Or is one of the above approaches superior in representing lexical semantics
* we: experiments consisting of two phases
  1. different lexical semantic KBs converted to a common representation.
    * The map-based dataset (SWOW) is converted to a graph-based representation
      and the two graph-represented datasets (SWOW and WordNet) are then
      converted to a vector-based representation.
  2. respective word embeddings are evaluated by means of the performance in
     language processing tasks where lexical knowledge plays a crucial role.
    * predicting brain activation patterns from semantic representations of
    * determining the semantic similarity between words
      * hE, empirical frailty of the similarity scores (Faruqui+ 2016), this has
    * extrinsic evaluation, we resort to downstream NLP tasks.
* feature-based approach emerges as superior to the other approaches to the
