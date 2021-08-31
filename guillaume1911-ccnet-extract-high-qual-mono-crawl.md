CCNet: Extracting High Quality Monolingual Datasets from Web Crawl Data
Guillaume Wenzek, Marie-Anne Lachaux, Alexis Conneau, Vishrav Chaudhary, Francisco Guzmán, Armand Joulin, Edouard Grave
arXiv:1911.00359 [cs.CL]

* Our pipeline follows the data processing introduced in fastText 
  (Mikolov+ 2017; Grave+ 2018), that deduplicates documents and lang id
* We augment this pipeline with a filtering step to select documents that are
  close to high quality corpora like Wikipedia. 

# 1 Intro

* we preserve the document-level structure to allow for the training of
  paragraph-level representations like BERT (Devlin+ 2018) ; second, we add an
  optional monolingual filtering step that selects documents that are close to
  high quality sources, like Wikipedia.

This is achieved by training a language model on the targeted sources and use
* perplexity as a scoring function for documents. Our pipeline can be applied to
  any number of Common Crawl snapshots and takes 8.5 hours to process per
  snapshot on 5000 CPU cores. For example, the dataset obtained by
  pre-processing the February 2019 snapshot is composed of 1.5 billions
  documents in 174 languages. There are 700 millions filtered documents in
  English alone, corresponding to 532 billions tokens. That is 120 times bigger
  than the data used in Devlin+ (2018).

# Related work.  Preprocessing of massive datasets for training LMs

* Baevski+ (2019) pre-trained a BERTlike model on Common Crawl as preprocessed
* concurrently to our work, Raffel+ (2019) used a large scale dataset based on
* Closer to this work, Ortiz Suárez+ (2019) has improved the pipeline of Grave+
