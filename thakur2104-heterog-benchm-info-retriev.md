BEIR: A Heterogenous Benchmark for Zero-shot Evaluation of Information Retrieval
Nandan Thakur, Nils Reimers, Andreas Rücklé, Abhishek Srivastava, Iryna Gurevych
arXiv:2104.08663 [cs.IR]

https://github.com/UKPLab/beir datasets and code

* Neural IR models have often been studied in homogeneous and narrow settings,
* we introduce BEIR (Benchmarking IR), a heterogeneous benchmark for
  * 17 datasets for evaluation
  * tasks including open-domain datasets as well as narrow expert domains
* We study the effectiveness of nine SOTA retrieval models in a zero-shot
  * performing well consistently across all datasets is challenging
  * BM25 is a robust baseline and
  * Reranking-based models overall achieve the best zero-shot performances,
    however, at high computational costs
  * Dense-retrieval models are computationally more efficient but often
    underperform other approaches

# 1 Introduction

* Many real-world NLP problems rely on a retrieval component as a first step
  * open-domain question-answering (Chen+ 2017),
  * claim-verification (Thorne+ 2018), and
  * duplicate question detection (Zhang+ 2015)
* approaches, retrieval has been dominated by
  * Traditionally, lexical approaches like TF-IDF or BM25
    (Robertson and Zaragoza, 2009). However, these approaches
    * suffer from what is known as lexical gap (Berger+ 2000) and
    * only retrieve documents that contain the keywords in the query
    * queries and documents are treated in a bag-of-words manner
  * deep learning and in particular pretrained Transformer models like BERT
    * became popular in the information retrieval space (Lin+ 2020)
    * mapping queries and documents to a dense vector (Guo+ 2016; Lee+ 2019;
      Karpukhin+ 2020; Guu+ 2020; Gao+ 2020; Liang+ 2020; Ma+ 2021)
    * documents for a given query are then retrieved using
      (approximate) nearest neighbor search (Johnson+ 2017)
  * reranking documents from the output of a first-stage retrieval system
    (Nogueira+ 2019a, 2020; Nogueira and Cho, 2020; Khattab and Zaharia, 2020)
    * aim to create a better comparison of the retrieved documents
  * Different approaches can also be combined together
    (Ding+ 2020; Gao+ 2020; Luan+ 2021)
* trained on rather large datasets like
  * Natural Questions (NQ) dataset (Kwiatkowski+ 2019) containing around 133k
  * MS-MARCO dataset (Nguyen+ 2016) with more than 500k training examples
* evaluated in-domain or for similar tasks
  (Nogueira and Cho, 2020; Karpukhin+ 2020; Ding+ 2020)
* zero-shot
  * large training corpora are not available for most tasks and domains
  * pre-trained models are applied out-of-the-box across new tasks and domains
  * unclear how well these retrieval models transfer to new tasks or domains
* we establish BEIR, a new heterogeneous benchmark for Information Retrieval
  * a broad range of domains and tasks
  * we systematically study the zero-shot capabilities of many neural retrieval
  * Existing benchmarks (Guo+ 2020; Petroni+ 2020) have issues
    * either only on a single task or on a certain domain
  * BEIR overcomes these shortcomings by covering 9 diverse retrieval tasks with
    17 datasets including a diverse set of domains, query and document types
* We use BEIR to evaluate nine diverse SOTA retrieval approaches
  * no approach consistently outperforms all others
  * in-domain performance of a model does not correlate with its generalization
    * models fine-tuned with the same training data might [perform] differently
* trade-off between the zero-shot performances and the computational cost:
  * computationally expensive re-ranking models overall perform the best
  * More computationally efficient dense models can, depending on the task and
    domain, substantially underperform traditional lexical models like BM25
  * BM25 is the third best performing approach on our benchmark,
    beaten only by neural re-ranking approaches
* We publicly release BEIR and an integration of various retrieval models in a
  well-documented, easy to use and extensible open-source implementation
  * allow easy integration of new tasks, datasets and retrieval models

# 3 BEIR Benchmark

## Diversity in Tasks: the lengths of queries and indexed documents can differ

* queries range from a keyword to a complete news article
* document length ranges from long to a tweet

## Diversity in Domains,

* broad and generic domains, like Wikipedia, to
* specialized ones such as scientific publications of a specialised field

## Challenging Datasets

* We evaluate several datasets based on existing model performances and
  literature. We select tasks which we believe are challenging and are not yet
  fully solved

# 7 Analysis

## Dataset Annotation Biases

* The biggest performance drops in both dense and re-ranking techniques compared
  to BM25 are found in BioASQ, Signal-1M (RT) and Tóuche-2020 datasets
* possible reasons lies in the
  * construction of the datasets itself. In BioASQ 11 , document candidates are
    retrieved for annotation via term-matching with boosting tags (Tsatsaronis+
    2015)
  * annotation depth is shallow (approximately 5 relevant articles per query),
    whereas the total number of documents is around 15M, which
    favours lexical term-matching systems like BM25 (Liang+ 2020).
    * Creation of Signal-1M (RT), involved retrieving tweets for a query using
      8 different retrieval systems for annotation, 7 out of which relied upon
      term-matching signals and this causes a bias towards lex (Suarez+ 2018)
  * skewed length distribution of relevant documents as shown in Figure 4
    * All neural approaches have limitations with document lengths as they
      have limit of 512 word pieces
      * On the other hand BM25 greatly profits from longer documents as
        more keywords occur in them thereby increasing the chances of overlap
    * for Tóuche-2020 (Bondarenko+ 2020), majority of the highly relevant
      documents are greater than 300-350 words

## Domain Shift The MSMARCO (Nguyen+ 2016)

## Dot Product vs. Cosine Similarity

* Dense models require a similarity function
  * to retrieve relevant documents for a given query within an embedding space
  * during training dense models with the InfoNCE (van den Oord+ 2019) loss:
* the differences between the two similarity functions were not sys studied
* performances of SBERT and ANCE with
  * in-domain evaluation on MSMARCO are nearly identical
  * hE, zero-shot evaluation setup, the two models can perform vastly different:
    * on TREC-COVID, ANCE outperforms SBERT by 17.2 points, whereas
    * SBERT outperforms ANCE by 9.7 points on HotpotQA
* We re-ran the training of SBERT (section 4.1.3) and only changed the
  similarity function from cosine-similarity to dot-product. As shown in Table 5
  * significant performance differences for some datasets
  * For TREC-COVID, the model trained with dotproduct achieves the biggest imprv
  * for a majority of other datasets, it performs worse than the cosine-sim
* these (nearly) identical models retrieve documents with vastly different
  lengths as shown in the violin plots in Table 5 and Figure 6 in the appendix
  * cosine-similarity model to prefer shorter documents over longer ones
    * especially severe for TREC-COVID: a large fraction of the scientific
      papers (approx. 42k out of 171k) consist only of publication titles
      without an abstract
  * dot-product model primarily retrieves longer documents, i.e., publications
    with an abstract
    * longer documents can result in vectors with higher magnitudes which can
      yield higher similarity scores for a query
* relevance scores are not uniformly distributed over document lengths (fig 4),
  for some datasets, longer documents are annotated with higher relev scores,
  while in others, shorter documents are
  * due to either
    * annotation process, e.g., the candidate selection method prefers short or
    * the task itself, where shorter or longer documents could be more relevant
      * it can be more advantageous to train a model with either
        cosine-similarity or dot-product depending upon the specific task
