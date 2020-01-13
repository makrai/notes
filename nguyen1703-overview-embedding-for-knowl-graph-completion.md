Dat Quoc Nguyen
An overview of embedding models of entities and relationships
  for knowledge base completion
arXiv:1703.08098 [cs.CL]

# Abstract

standard benchmark datasets FB15k, WN18, FB15k-237, WN18RR, FB13 and WN11

# 1 Intro

* KBs can thus be formalized as directed multi-relational graphs, where
  nodes correspond to entities and edges linking the nodes encode various rels
  (Garcı́a-Durán+ 2016; Nickel+ 2016a)
* KBs e.g. the domain-specific KB GeneOntology and popular generic KBs of
  WordNet (Fellbaum, 1998), YAGO (Suchanek+ 2007), Freebase (Bollacker+ 2008),
  NELL (Carlson+ 2010) and DBpedia (Lehmann+ 2015) as well as commercial KBs
  such as Google’s Knowledge Graph, Microsoft’s Satori and Facebook’s Open
  Graph.  Nowadays, KBs are used in a number of commercial
* applications including
  * search engines
  * NLP tasks such as question answering (Ferrucci, 2012; Fader+ 2014),
    word sense disambiguation (Navigli and Velardi, 2005; Agirre+ 2013),
    semantic parsing (Krishnamurthy and Mitchell, 2012; Berant+ 2013) and
    co-reference resolution (Ponzetto and Strube, 2006; Dutta and Weikum, 2015)
* knowledge base completion to perform link prediction in KBs, which attempts
  i.e., to add new triples by leveraging existing triples in the KB
  (Lao and Cohen, 2010; Bordes+ 2012; Gardner+ 2014; Garcı́a-Durán+ 2016). For
* relation types are represented by latent feature vectors and/or matrices
  and/or third-order tensors
  (Nickel+ 2011; Jenatton+ 2012; Bordes+ 2013; Wang+ 2014; Dong+ 2014;
  Lin+ 2015b; Guu+ 2015; Krompaß+ 2015; Toutanova and Chen, 2015;
  Garcı́a-Durán+ 2016; Trouillon+ 2016; Toutanova+ 2016; Nickel+ 2016b)
* This article briefly overviews the
  * embedding models for KB completion, and then summarizes
  * up-to-date experimental results on two standard evaluation tasks:
    1. the entity prediction task—which is also referred to as the link
    prediction task (Bordes+ 2013)—and
    2. the triple classification task (Socher+ 2013)
