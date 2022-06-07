Analysing the semantic content of static Hungarian embedding spaces
Tamás Ficsor 1 , Gábor Berend 1,2
XVII. Magyar Számítógépes Nyelvészeti Konferencia Szeged, 2021. január 28–29

We published our work on GitHub for
  * interpretable word vector generation:
    https://github.com/ficstamas/word_embedding_interpretability, and shared the
  * code for semantic category generation + used semantic categories:
    https://github.com/ficstamas/multilingual_semantic_categories

# Abstract

* extract lexical information from static word embeddings
* We propose a transformation that amplifies desired semantic features in the
  basis of the embedding space. We generate these semantic features by a distant
  supervised approach, to make them applicable for Hungarian embedding spaces
  * We propose the Hellinger distance in order to perform a transformation to an
  interpretable embedding space. Furthermore, we
  * extend our research to sparse word representations as well, since sparse
    representations are considered to be highly interpretable

# 1 Intro

* word embedding algorithms are able to encode semantic relations between words
  (Pennington+ 2014a; Nugaliyadde+ 2019)
  * Nugaliyadde, A Wong, KW Sohel, F Xie, H
    Enhancing semantic word representations by embedding deeper word relations
    CoRR abs/1901.07176 (2019), dblp.uni-trier.de/db/journals/corr/corr1901.html
  * This can be present on word-level – such as similarity, analogy, antonymic
  * sentence-level embeddings, which shows that
    word vectors still carry intra-sentence information
    (Kenter and de Rijke, 2015)
    * Kenter, T de Rijke, M
      Short text similarity with word embeddings
      CIKM 2015 ACM International on Conf on Information and Knowledge Managem
* we propose a transformation where we map existing word representations into a
  more interpretable space, where each dimension is supposed to be responsible
  for encoding semantic information from a predefined set of semantic inventory
* we shall rely on ConceptNet (Speer+ 2016) to do so
* measure the information contents of each dimension in the original embedding
  space towards a predefined set of human interpretable concepts. Our approach
  * inspired by Şenel+ (2018) which
    * Şenel, L.K Utlu, I Yücesoy, V Koç, A Çukur, T
      Semantic structure and interpretability of word embeddings
      IEEE/ACM Transactions on Audio, Speech, and Language Proce 26(10), 2018
    * utilized the Bhattacharyya distance for the aforementioned purpose. In
  * we also evaluate a close variant of the Bhattacharyya distance, the
    Hellinger distance for transforming word representations in a way that the
    individual dimensions have a more transparent interpretation
* Feature norming studies have revealed that
  * humans usually tend to describe the properties of objects and concepts with
    a limited number of sparse features (McRae+ 2005). This kind of sparse
    representation became a major part of natural language processing since we
    can see the resemblance between sparse features and human feature
    descriptions. Hence, we additionally explore the effects of applying sparse
    word representations as an input to our algorithm which makes the semantic
    information stored along the individual dimensions more explicit

# 2 Related work

* sparse vectors is related to the way humans interpret features, which was
  * feature norming studies (Garrard+ 2001; McRae+ 2005).  Additionally,
  * sparse features (Kazama and Tsujii, 2003; Friedman+ 2008; Mairal+ 2009) has
  * useful in several areas of NLP, including POS tagging (Ganchev+ 2010), text
    classification (Yogatama and Smith, 2014) and dependency parsing (Martins+
    2011)
    * Berend (2017) also showed that sparse representations can outperform their
  * Murphy+ (2012) proposed Non-Negative Sparse Embedding to learn interpretable
  * Park+ (2017) showed a rotation based method and
  * Subramanian+ (2017) suggested an approach using a denoising k-sparse
    auto-encoder to generate interpretable sparse word representations
  * Balogh+ (2019) made prior research about the semantic overlap of the
    generated vectors with a human commonsense knowledge-base and found that
    substantial semantic content is captured by the sparse bases
* Şenel+ (2018): a method to measure the interpretability of the dense GloVe
  * manipulate and improve the interpretability of a static w repr (Şenel+ 2020)
* Hellinger distance: constructing word embeddings Lebret and Collobert (2014)

# 3 Data

## 3.1 Semantic Categories

* "red", "green", and "yellow" can be grouped under the "color" semantic
  category which represents a hypernym-hyponym relation, but they can be found
  among "traffic" related terms as well. Another example is "car" semantic
  category which is in meronymy relation with words such as "engine", "wheels"
  and "crankcase"
* to extend it to Hungarian, we used the semantic category names from SemCat
  and defined relations on a category-by-category base manually. We relied on a
  subset of relations from ConceptNet (Speer+ 2016)
  * triangulation: To obtain higher quality semantic categories, we introduced
    an intermediate language that works as a validation to reduce undesired
    translations
  1. generate the semantic categories from the source language by the allowed
    relations and restricted the inclusion of words by the weight of the
    relation.  Semantic category names from SemCat were used as the input
    (Query) and the weight of each relation is originated from ConceptNet. Then
  2. translate the semantic categories to the target language directly and
    through the intermediate language to the target language, where we kept the
    intersection of the two results.  It is recommended to rely on one of the
    core languages defined in ConceptNet as Source and Intermediate language
  * i.e. distant supervised generation (Mintz+ 2009) can produce large number of

## 3.2 Word Embeddings

* 3 embedding spaces trained using the Fasttext algorithm (Bojanowski+ 2017)
  * Hungarian Fasttext (Fasttext HU) embeddings pre-trained on Wikipedia 3 ,
  * its aligned variant 4 (Fasttext Aligned) that was created using the RCSLS
    criteria (Joulin+ 2018) with the objective to bring Hungarian embeddings
    closer to semantically similar English embeddings and the
  * Szeged Word Vectors (Szeged WV; Szántó+ 2017) which is
    based on the concatenation of multiple Hungarian corpora

# 4 Our Approach

## 4.1 Semantic Decomposition

## 4.2 Measuring dissimilarity

## 4.3 Interpretable Word Vector Generation

# 5 Evaluation methods

## 5.1 Word Retrieval Test

## 5.2 Interpretability

# 6 Results

## 6.1 Dense Representations

## 6.2 Sparse Representations

## 6.3 Semantic Decomposition

# 7 Conclusion

* hyperparameter selection, we can conclude that we want to increase the number
  of the basis, and decrease the sparsity level `\lambda` in order to improve
  the performance.  However, if we consider sparse representations the
  generalisability of the embedding may decrease, but it might be a joint factor
  of the distant supervised generation of Hungarian semantic categories and
  random selection of validation test sets. If our semantic categories contain
  too much noise then it could accumulate that noise during the transformation
  which is indicated by the high interpretability score, and a lower score on
  the word retrieval test (which can represent a distinct distribution from the
  original distribution of the semantic category)
