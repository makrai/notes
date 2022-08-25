A Simple ... Method To Eliminate the Self Language Bias in Multiling Reprs
Ziyi Yang, Yinfei Yang, Daniel Cer, Eric Darve
EMLNLP 2021 arXiv:2109.04727 [cs.CL]

Implementation for LIR is available at https://github.com/ziyi-yang/LIR

# Abstract

* our "Language Information Removal (LIR)" factors out language identity info
  from semantics related components in pre-trained multilingual representations 
  * only uses simple linear operations,
    eg matrix factorization and orthogonal projection
* for weak-alignment multilingual systems, the
  principal components of semantic spaces primarily encodes language id
* We evaluate the LIR on a cross-lingual
  * question answer retrieval task (LAReQA)
    * almost 100% relative improvement in MAP for weak-alignment models
  * Amazon Reviews and XEVAL dataset

# 1 Introduction

* large-scale language modeling has expanded to the multilingual setting
  (Devlin+ 2019; Conneau and Lample 2019; Conneau+ 2020)
  * Alexis Conneau, K Khandelwal, N Goyal, V Chaudhary, G Wenzek, F Guzmán,
      Édouard Grave, Myle Ott, Luke Zettlemoyer, Veselin Stoyanov
    Unsupervised cross-lingual representation learning at scale
    ACL 2020
* impressive zero-shot cross-lingual ability (Hu+ 2020b)
  * Junjie Hu, S Ruder, A Siddhant, Graham Neubig, Orhan Firat, Melvin Johnson
    Xtreme: A massively multilingual multitask benchmark for eval cross-lingual
    arXiv preprint arXiv:2003.11080
* questions
  * how is the language identity info and the semantic info expressed
    * underlying geometric structure is crucial for insights into design
  * factor out the language identity information from the semantic components
    * many applications, eg cross-lingual semantic retrieval
  * geometric relation between different languages?
    * Artetxe+ (2020); Chung+ (2020); Lauscher+ (2020)
    * Mikel Artetxe, Sebastian Ruder, and Dani Yogatama
      On the cross-lingual transferability of monolingual representations
      ACL 2020
    * Hyung Won Chung, Thibault Févry, Henry Tsai, Melvin Johnson, S Ruder
      Rethinking embedding coupling in pre-trained language models
      arXiv preprint arXiv:2010.12821
    * Anne Lauscher, Vinit Ravishankar, Ivan Vulić, and Goran Glavaš
      EMLNLP 2020
      From zero to hero: On the limitations of zero-shot language transfer
        with multilingual transformers
* prior work has addressed the problem at training time
  * we systematically explore a post-training method
* Roy+ (2020) proposed weak vs strong alignment for language agnostic models:
  * weak alignment, for any item in language L 1, the nearest neighbor in
    language L 2 is the most semantically “relevant” item
  * strong alignment, for any representation, all semantically relevant items
    are closer than all irrelevant items, regardless of their language
  * weak
    * sentence representations from the same language
    * mBERT, XLM-R (Conneau+ 2020) and CMLM (Yang+ 2020)
  * provides carefully-designed training strategies for retrieval-like model to
    mitigate this issue in order to obtain language agnostic multilingual sys
* We systematically explore a simple post-training method we refer to as
  Language Information Removal (LIR), to effectively facilitate the lang agnost
* our method
  * First introduced in Yang+ (2020) to reduce same language bias for retrieval
  * only linear algebra factorization and post-training operation
  * can be conveniently applied to any multilingual model
  * surprisingly large improvements in several downstream tasks, including
    * LAReQA, a crosslingual QA retrieval dataset (Roy+ 2020)
    * Amazon Reviews, a zero-shot cross lingual evaluation dataset
    * XEVAL, a collection of multilingual sentence embedding tasks
  * results suggest that the principal components of a multilingual system with
    self-language bias primarily encodes language identification information
* whether principal components contain language information
  * yes for weak-alignment models (Section 3.1)
  * for strong-alignment systems, not quite (Table 4)

# 2 Language Information Removal for Self Language Bias Elimination

* We use SVD instead of PCA since SVD is more stable numerically (eg for
  Läuchli matrix). The SVD of a language matrix is M L = U L Σ L V

# 3 Experiments

* our sentences for extracting principle components are sampled from Wiki-40B
  (Guo+ 2020)
* 10,000 sentences per language
* performance initially increases as more sentences are used but
  then is almost unchanged after n > 10, 000
* different samplings of {t iL } and text resources other than Wiki-40B,
  eg Tatoeba (Artetxe and Schwenk, 2019); minimal differences in performance

## 3.2 Amazon Reviews

* removing the language components from multilingual representation is
  * beneficial for cross-lingual zero-shot
  * expected to leave only semantic-related information in the representation
    so that the logistic classifier trained on English should be conveniently
    transferred to other languages
  * unlike semantic retrieval, the peak performance usually occurs at rank > 1

## 3.3 XEVAL

* XEVAL, a collection of multilingual sentence repr benchmarks (Yang+ 2020)
  * The training set and test set of XEVAL are in the same language (not cross)
  * include
    * Movie Reviews (Pang and Lee, 2005)
    * binary SST (sentiment analysis, Socher+ (2013))
    * MPQA (opinion-polarity, Wiebe+ (2005))
    * TREC (question-type, Voorhees and Tice (2000))
    * CR (product reviews, Hu and Liu (2004))
    * SUBJ (subjectivity/objectivity, Pang and Lee (2004))
    * SICK (both entailment and relatedness (Marelli+ 2014))
* we use mBERT as the base multilingual encoder, weights fixed during training
  and only down-stream neural structures are trained
* training, cross-validation and evaluation uses SentEval toolkit
  (Conneau and Kiela, 2018)
* Results are presented in Table 3. The metric is the
  * averaging performance across 9 datasets mentioned above
  * LIR is beneficial on German, Spanish, French and Chinese
  * for English dataset, removing principal components actually hurts
    * echoes with findings in English sentence embedding works (Yang+ 2019b)
    * this may be because English data are dominant in mBERT training data

# 4 Related Work & Our Novelty

* language agnostic representations
  * LASER (Artetxe and Schwenk, 2019) leverages translation pairs and BiLSTM
    encoder for multilingual sentence representation learning
  * Multilingual USE (Yang+ 2019a) uses training data such as translated SNLI,
    mined multiling QA and translation pairs to learn multiling sentence encod
  * AM-BER (Hu+ 2020a) aligns contextualized representations of multilingual
    encoders at different granularities
  * LaBSE (Feng+ 2020) finetunes a pretrained language model
    with the bitext retrieval task and mined cross-lingual parallel data
    to obtain language agnostic sentence representations
* Faruqui and Dyer (2014): a canonical correlation analysis (CCA) based method
  to add multilingual context to monolingual embeddings
  * post-processing 
  * requires bilingual word translation pairs to determine the projection vects
* Mrkšić+ (2017) build semantically specialized cross-lingual vector spaces
  * requires the additional training to adjust the original embeddings using
    supervised data: cross-lingual synonyms and antonyms
* Libovickỳ+ (2019): language-specific information of mBERT is the centroid of
  each language space (the mean of embeddings)
* Zhao+ (2021) propose several training techs to obtain lang-agnostic reprs
  * segmenting orthographic tokens in training data and
    aligning monolingual spaces by training
* principal components of the semantic space for sentence embeddings include
  * Arora+ (2017) and Yang+ (2019b)
    * principal component removal is investigated for monolingual models
    * evaluation is only conducted on semantic similarity benchmarks
  * Mu and Viswanath (2018) explore removing top components from English
    * unclear prior to our work what purpose is served by removing principal
      components within multilingual and cross-lingual settings
