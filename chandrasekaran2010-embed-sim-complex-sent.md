Comparative analysis of word embeddings in assessing semantic similarity of
  complex sentences
Dhivya Chandrasekaran, Vijay Mago
arXiv:2010.12637 [cs.CL

* near-perfect results are achieved by recent transformer-based models in
  existing benchmark datasets like the STS dataset and the SICK dataset
* We build a complex sentences dataset comprising of
  * 50 sentence pairs with semantic similarity values provided by 15 human
  * Readability analysis is performed to highlight the increase in complexity
    of the sentences in the existing benchmark datasets and those in the
    proposed dataset
* analysis of the performance of various word embeddings and language models on
  the existing benchmark datasets and the proposed dataset
* results: complexity of the sentences has a significant impact on the
  performance of the embedding models resulting in a
  * 10-20% decrease in Pearson's and Spearman's correlation

# I Intro

* on the STS benchmark dataset [14] and the SICK dataset [15], the BERT models
  have achieved near-perfect results [11]
* readability of the sentences 
  * in these datasets, low readability index
  * a measure of complexity of sentences [16]
  * hE, various real world applications of semantic similarity involves more
    complex sentences to be analysed [17]. In this paper, a new dataset

# II existing research works carried out in the field of semantic similarity

# III two of the existing benchmark datasets and five word-embeddings

# IV  methodology

* methodology adopted to construct the new benchmark dataset
  * three steps in the construction of the dataset namely, 
    * Selection of terms, 
    * Selection of sentences 
    * Annotation of similarity values
  * The dataset comprises 52 unique sentences, which are definitions of widely
    known topics in the field of computer science
* the readability analysis that compares the complexity of sentences 

# V performance of various word embeddings

* insight into the inferences made that would guide future research
