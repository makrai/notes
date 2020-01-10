LexRank: Graph-based Lexical Centrality as Salience in Text Summarization
Güneş Erkan and Dragomir R. Radev
2004 iaij

#1 Intro

* robust graph-based methods for NLP have also been gaining a lot of interest,
  * word clustering (Brew & im Walde, 2002) and 
  * prepositional phrase attachment (Toutanova, Manning, & Ng, 2004).
* We will discuss how random walks on sentence-based graphs can help in 
  * text summarization. We will also briefly discuss how similar techniques can
  * named entity classification, prepositional phrase attachment, and text
    classification (e.g., spam recognition).
* approach in this paper is to assess the centrality of each sentence in a
  cluster and extract the most important ones to include in the summary
* In Section 2, we present centroid-based summarization
* we introduce 
  * three new measures for centrality, Degree, LexRank with threshold, and
    continuous LexRank, inspired from the “prestige” concept in social
    networks. We propose a 
  * graph representation of a document cluster, where 
    * vertices represent the sentences and 
    * edges are defined in terms of the similarity 
    * make use of several centrality heuristics defined on graphs

#2 Sentence centrality and summarization

* The centroid of a cluster is a pseudo-document which consists of words that
  have tf×idf scores above a predefined threshold
* centroid-based summarization (Radev, Jing, & Budzikowska, 2000), the
  sentences that contain more words from the centroid
* A cluster of documents may be represented by a cosine similarity matrix 
