On Modeling Sense Relatedness in Multi-prototype Word Embedding
Yixin Cao and Juanzi Li ∗ and Jiaxin Shi and Zhiyuan Liu and Chengjiang Li
ijcnlp 2017
cao-yx13@mail.tsinghua.edu.cn
ljz@mail.tsinghua.edu.cn
shi-jx@mail.tsinghua.edu.cn
liuzy@mail.tsinghua.edu.cn
licj17@mail.tsinghua.edu.cn

# Abstract

* we differentiate the original sense and extended senses of a word by
  introducing their global occurrence information and model their re-
  latedness through the local textual context information.  
* Based on the idea of fuzzy clustering, we introduce a random process to
  integrate these two types of senses and design 
* two non-parametric methods for word sense induction. To make our model more
  scalable and efficient, we use an online joint learning framework extended
  from the Skip-gram model. 
* The experimental results demonstrate that our model outperforms both
  conventional single-prototype embedding models and other multi-prototype
  embedding models, and achieves more stable performance when trained on
  smaller data.

# Introduction

* Pervious work mostly focus on using clustering to induce word senses 
  (Reisinger and Mooney, 2010; Huang et al., 2012; Tian et al., 2014;
  Neelakantan et al., 2014; Li and Jurafsky, 2015)
  * limitations arise in the usage of hard clustering
  * data sparsity
* we learn the embedding vectors of the word senses 
  with some common features if the senses are related
  * Graded Word Sense Assignment [soft clustering to senses]
    (Erk and McCarthy, 2009; Jurgens and Klapaftis, 2013)
* senses of a polysemous word are related [by]
  * contiguity of meaning within a semantic field 1 , but also by the
  * relationship between the original meaning and the extended meaning 
    (Von Engelhardt and Zimmermann, 1988). 
* We investigate the relatedness of the synsets (word senses) in WordNet
  (Miller, 1995) through the Wu & Palmer measure 2 (Wu and Palmer, 1994)
  * word `book” in Figure 1.
    * right side is the similarity matrix of its 11 nominal synsets
    * left side is their frequencies in WordNet
  * correlations among these senses in different levels
    * (s 1 , s 2 , s 11 ) ... (s 6 , s 7 ) and (s 8 , s 9 , s 10)
  * which is which
    * s 1 refers to the sense of `the written work printed on pages bound...`
    * s 2 refers to `physical objects consisting of a number of pages bound...`
    * s 3 refers to `a number of sheets (or stamps, etc.) bound together`
  * s 1 is the original meaning, s 2 and s 11 are the extended meanings.
    * frequency of the original meaning s 1 is much higher 
    * word sense distribution in corpus should be taken into account
* we 
  * propose ... Fuzzy Clustering-based multi-Sense Embedding model [FCSE] that
    * models the relatedness among word senses by using ... fuzzy clustering
    * then learns sense embeddings via a variant of Skip-gram model
  * design two non-parametric methods, FCSE-1 and FCSE-2, to model the
    * local textual context information of senses as well as 
    * their global occurrence distribution 
    * by incorporating the Generalized Polya Urn (GPU) model. 
    * For efficiency and scalability, our proposed model also adopts an 
      online joint learning procedure

## 3.3 Relationship with State-of-the-art Methods

* FCSE-1 will degrade to hard assignment if we set upper = 0, which is 
  similar with the NPMSSG model in (Neelakantan et al., 2014).
* if we set e = 0, the second sample for the extended meanings has been turned
  off, and then FCSE-2 degrades to the SG+ model in (Li and Jurafsky, 2015),

# 5 Related Work

* Multi-prototype word embedding 
  * Chen et al., 2014
    * Xinxiong Chen, Zhiyuan Liu, and Maosong Sun. 2014.  
      A unified model for word sense representation and disambiguation
      2014 EMNLP
  * Cao et al., 2017 ACL
  * Liu et al., 2015 AAAI Topical word embeddings 
  * Reisinger and Mooney, 2010
  * Huang et al., 2012
  * Tian et al., 2014
  * Neelakantan et al., 2014
  * Li and Jurafsky, 2015
* They can be roughly divided into three groups
  * clustering based methods. As described in Section 1 
  * topics to represent different word senses, such as (Liu et al., 2015)
    * it is difficult to determine the number of topics
  * external knowledge (i.e. knowledge bases) to induce word/phrase senses.
    * Chen et al., (2014) jointly represents and disambiguates the word sense
      on the basis of the synsets in WordNet.  
    * Cao et al., (2017) regards entities in KBs as word/phrase senses, and
      first learn word/phrase and sense embeddings separately, then align them
      via Wikipedia anchors
      * fails to deal with the words that are not included in knowledge bases

# 6 Conclusion

* future, we are interested in 
  * incorporating external knowledge, such as WordNet
  * sentence and document embeddings
