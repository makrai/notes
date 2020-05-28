BERT is Not an Interlingua and the Bias of Tokenization 
Jasdeep Singh, Bryan McCann, Richard Socher, Caiming Xiong
2nd Workshop on Deep Learning Approaches for Low-Resource NLP (DeepLo 2019)

https://www.github.com/salesforce/xnli_extension

# Abstract

* Multilingual transfer learning can benefit both high~ and low-resource langs,
* hE, source of these improvements is not well understood.  
* Cananical Correlation Analysis (CCA) of the internal representations of a
* model partitions representations for each language 
  rather than using a common, shared, interlingual space. This effect is
  * magnified at deeper layers, suggesting that the model does 
    not progressively abstract semantic content while disregarding languages.
* Hierarchical clustering based on the CCA similarity scores between languages
  reveals a tree structure that mirrors the phylogenetic trees by linguists.
* The subword tokenization employed by BERT provides a 
  stronger bias towards such structure 
  than character~ and word-level tokenizations. 
* We release a subset of the XNLI dataset translated into an additional 14 lang

# 1 Introduction

* multilingual version of BERT trained on over 100 languages achieved
  SOTA performance across a wide range of languages as well.  
* Performance for low-resource languages has been further improved by
  * parallel data (Lample and Conneau, 2019) and leveraging 
  * machine translation systems for cross-lingual regularization (Singh+ 2019).  
* zero-shot machine translation has investigated the multilingual NMT 
  * shared subword vocabulary Johnson+ (2017);
* Kudugunta+ (2019) learn a form of interlingua, a common representational
* We aim to extend this study to multilingual language models 
  * investigate the extent to which the embeddings represent an interlingua.
* Canonical correlation analysis (CCA, Hotelling, 1992) 
  * a classical tool from multivariate statistics
  * investigates the relationships between two sets of random variables.
* Singular value and projection weighted variants of CCA allow for 
  analysis of representations of the same data points from different models
  * invariant to affine transformations (Raghu+ 2017; Morcos+ 2018),
  * [were] used to explore learning dynamics and representational similarity
    * computer vision (Morcos+ 2018) and 
    * natural language processing (Saphra and Lopez, 2018; Kudugunta+ 2019).
* We analyze multilingual BERT 
  using projection weighted canonical correlation analysis (PWCCA) 
  between representations from semantically similar text sequences 
  in mulitple languages.
* representations from multilingual BERT can be partitioned using PWCCA
  * reflect the linguistic and evolutionary relationships between languages.
  * i.e. not represent semantically similar data points nearer to each other in
  * resentations [ organized around features that respect the ] diffs and sims
* the choice of tokenization can heavily influence this space. 
  * Subword tokenization, in contrast to word and character level tokenization,
    provides a strong bias towards discovering these linguistic and
    evolutionary relationships between languages. As part of our experiments,
* we translated a subset of the XNLI data set into an additional 14 languages,

## 3.1 Reprs across languages are less similar in the deeper layers of BERT

## 3.2 Representations diverge with depth after fine-tuning 

## 3.3 Deeper layers change more dramatically during fine-tuning

## 3.4 Phylogentic Tree of Language Evolution

## 3.5 Tokenization Provides a Strong Bias Towards Linguistic Relationships

* token overlap between different languages, generating similarity matrices
  similar to the one shown in Figure 6. From these matrices we perform
* agglomerative clustering of languages to generate phylogenetic trees (Fig 7).
  These trees show how different tokenization schemes can embed different
  linguistic biases into our models. 
* We investigate subword, word, and character level tokenization.  The 
  * subword tokenization is done using BERT’s learned BPE vocabulary. The 
  * word level tokenization is achieved by simply tokenizing at spaces, and the
  * character level tokenization is done using Python’s native character level
* from using subwords, [ although is not as accurate as ] from BERT’s
  representation at layer 6 (Figure 1), it is 
  still non-trivially close to a linguistically accurate depiction of human
* by using a shared subword vocabulary, multilingual BERT has a very strong
  bias to discover the linguistic relationships between languages.  However,
  * Perhaps th[is ability] has contributed to the wide success in MT and LM
* bias is not [so] strong if other forms of tokenization are used.  Figures
  * word level tokenization splits the Romantic and Germanic languages into
    completely different trees, and that 
  * character level tokenization ends up combining all languages that share the
    Latin script regardless of their true families.  
