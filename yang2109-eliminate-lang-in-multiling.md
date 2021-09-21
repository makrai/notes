* whether principal components contain language information
  * yes for weak-alignment models (Section 3.1). However, 
  * for strong-alignment systems, not quite (Table 4).

# 2 Language Information Removal for Self Language Bias Elimination

* We use SVD instead of PCA since SVD is more stable numerically (e.g. for
  Läuchli matrix). Specifically, the SVD of a language matrix is M L = U L Σ L V

# 3 Experiments

* our sentences for extracting principle components are sampled from Wiki-40B
  (Guo+ 2020). We use 10,000 sentences per language. We notice performance
  initially increases as more sentences are used but then is almost unchanged
  after n > 10, 000. We tried different samplings of {t iL } and text resources
  other than Wiki-40B, e.g., Tatoeba (Artetxe and Schwenk, 2019). The minimal
  differences in performance suggest language components are stable over
  different domains.

## 3.2 Amazon Reviews

* removing the language components from multilingual representation is
  beneficial for cross-lingual zero-shot is expected to leave only
  semantic-related information in the representation so that the logistic
  classifier trained on English should be conveniently transferred to other
  languages. Another interesting observation is that unlike semantic retrieval,
  the peak performance usually occurs at rank > 1.

## 3.3 XEVAL

* XEVAL, a collection of multilingual sentence representation benchmark 
  (Yang+ 2020)
  * The training set and test set of XEVAL are in the same language (not cross).
  * include Movie Reviews (Pang and Lee, 2005)
    * binary SST (sentiment analysis, Socher+ (2013))
    * MPQA (opinion-polarity, Wiebe+ (2005))
    * TREC (question-type, Voorhees and Tice (2000))
    * CR (product reviews, Hu and Liu (2004))
    * SUBJ (subjectivity/objectivity, Pang and Lee (2004)) 
    * SICK (both entailment and relatedness (Marelli+ 2014)). For this
* we use mBERT as the base multilingual encoder, weights fixed during training
  and only down-stream neural structures are trained
* training, cross-validation and evaluation uses SentEval toolkit 
  (Conneau and Kiela, 2018) 
* Results are presented in Table 3. The metric is the 
  * averaging performance across 9 datasets mentioned above. Introducing LIR is
  * beneficial on German, Spanish, French and Chinese. We also notice that 
  * for English dataset, removing principal components actually hurts  
    * echoes with findings in English sentence embedding works (Yang+ 2019b). We
    * this may be because English data are dominant in mBERT training data.

# 4 Related Work & Our Novelty

* language agnostic representations
  * LASER (Artetxe and Schwenk, 2019) leverages translation pairs and BiLSTM
    encoder for multilingual sentence representation learning
  * Multilingual USE (Yang+ 2019a) uses training data such as translated SNLI,
    mined multilingual QA and translation pairs to learn multiling sentence enco 
  * AM-BER (Hu+ 2020a) aligns contextualized representations of multilingual
    encoders at different granularities
  * LaBSE (Feng+ 2020) finetunes a pretrained language model with the bitext
    retrieval task and mined cross-lingual parallel data to obtain language
    agnostic sentence representations.
* Faruqui and Dyer (2014) propose a canonical correlation analysis (CCA) based
  method to add multilingual context to monolingual embeddings.  
  * post-processing and requires bilingual word translation pairs to determine
    the projection vectors
* Mrkšić+ (2017) build semantically specialized cross-lingual vector spaces.
  * requires the additional training to adjust the original embeddings using
    supervised data: cross-lingual synonyms and antonyms
* Libovickỳ+ (2019) propose that the language-specific information of mBERT is
  the centroid of each language space (the mean of embeddings)
* Zhao+ (2021) propose several training techniques to obtain language-agnostic
  representations, including segmenting orthographic tokens in training data and
  aligning monolingual spaces by training
* principal components of the semantic space for sentence embeddings include
  * Arora+ (2017) and Yang+ (2019b)
    * principal component removal is investigated for monolingual models and the
      evaluation is only conducted on semantic similarity benchmarks. In
  * Mu and Viswanath (2018) explore removing top components from English
    * unclear prior to our work what purpose is served by removing principal
      components within multilingual and cross-lingual settings. We demonstrate
      these principal components represent language information for
      weak-alignment multilingual models.

