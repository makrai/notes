A Simple and Effective Method To Eliminate the Self Language Bias in Multilingual Representations
Ziyi Yang, Yinfei Yang, Daniel Cer, Eric Darve
EMLNLP 2021 arXiv:2109.04727 [cs.CL]

Implementation for LIR is available at https://github.com/ziyi-yang/LIR

* our "Language Information Removal (LIR)" factors out language identity info
  from semantic related components in multilingual representations pre-trained
  * only uses simple linear operations, 
    e.g. matrix factorization and orthogonal projection
* reveals that for weak-alignment multilingual systems, 
  the principal components of semantic spaces primarily encodes language id
* We evaluate the LIR on 
  * a cross-lingual question answer retrieval task (LAReQA), which requires the
    * almost 100% relative improvement in MAP for weak-alignment models.  We
  * Amazon Reviews and XEVAL dataset, with the observation that removing
    language information is able to improve the cross-lingual transfer perform

# 1 Introduction

* large-scale language modeling has expanded to the multilingual setting
  (Devlin+ (2019); Conneau and Lample (2019); Conneau+ (2020)).  
  * Alexis Conneau, K Khandelwal, N Goyal, V Chaudhary, G Wenzek, F Guzmán, 
    Édouard Grave, Myle Ott, Luke Zettlemoyer, Veselin Stoyanov
    Unsupervised cross-lingual representation learning at scale. In Proceedings
    ACL 2020. 
* impressive zero-shot cross-lingual ability (Hu+ 2020b). 
  * Junjie Hu, S Ruder, A Siddhant, Graham Neubig, Orhan Firat, Melvin Johnson
    Xtreme: A massively multilingual multitask benchmark for eval cross-lingual
    arXiv preprint arXiv:2003.11080.  These observations raise many 
* questions and provide insight for multilingual representations learning. 
  * how is the language identity info and the semantic info expressed in the
    * underlying geometric structure is crucial for insights into designing
  * factor out the language identity information from the semantic components
    * many applications, e.g. cross-lingual semantic retrieval
  * geometric relation between different languages? Efforts have been made to
    * Artetxe+  (2020); Chung+ (2020); Lauscher+ (2020).
    * Mikel Artetxe, Sebastian Ruder, and Dani Yogatama.
      On the cross-lingual transferability of monolingual representations. In
      ACL 2020
    * Hyung Won Chung, Thibault Févry, Henry Tsai, Melvin Johnson, S Ruder. 
      Rethinking embedding coupling in pre-trained language models. 
      arXiv preprint arXiv:2010.12821.
    * Anne Lauscher, Vinit Ravishankar, Ivan Vulić, and Goran Glavaš. 
      EMLNLP 2020.
      From zero to hero: On the limitations of zero-shot language transfer with
      multilingual transformers. In Proceedings of the 2020 Conference on
* prior work has addressed the problem at training time. In this work, 
  * we systematically explore a post-training method that can be readily
* Roy+ (2020) proposed weak vs strong alignment for language agnostic models:
  * weak alignment, for any item in language L 1 , the nearest neighbor in
    language L 2 is the most semantically “relevant” item. In the case of
  * strong alignment, for any representation, all semantically relevant items
    are closer than all irrelevant items, regardless of their language. Roy+
  * weak
    * sentence representations from the same language 
    * mBERT, XLM-R (Conneau+ 2020) and CMLM (Yang+ 2020). Roy+ (2020) 
  * provides carefully-designed training strategies for retrieval-like model to
    mitigate this issue in order to obtain language agnostic multilingual sys 
* We systematically explore a simple post-training method we refer to as
  Language Information Removal (LIR), to effectively facilitate the language
  agnosticism in multilingual embedding systems.
* our method
  * First introduced in Yang+ (2020) to reduce same language bias for retrieval
  * only linear algebra factorization and posttraining operation. LIR 
  * can be conveniently applied to any multilingual model. We
  * surprisingly large improvements in several downstream tasks, including
    * LAReQA, a crosslingual QA retrieval dataset (Roy+ 2020)
    * Amazon Reviews, a zero-shot cross lingual evaluation dataset
    * XEVAL, a collection of multilingual sentence embedding tasks. Our results
  * suggest that the principal components of a multilingual system with
    self-language bias primarily encodes language identification information.
