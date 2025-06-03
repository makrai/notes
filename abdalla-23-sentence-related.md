What Makes Sentences Semantically Related?
  A Textual Relatedness Dataset and Empirical Study
Mohamed Abdalla, Krishnapriya Vishnubhotla, Saif Mohammad
EACL 2023

Our dataset, data statement, and annotation questionnaire can be found at:
https://doi.org/10.5281/zenodo.7599667.

# Abstract

* The degree of semantic relatedness of two units of language has long been
  * applications such as question answering and summarization. However, prior
  * semantic similarity, a subset of relatedness, because no relatedness data
* we introduce a dataset for Semantic Textual Relatedness, STR-2022, that has
  * 5,500 English sentence pairs manually annotated using a
  * comparative annotation framework, resulting in fine-grained scores. We show
  * human intuition regarding relatedness of sentence pairs is highly reliable,
    * repeat annotation correlation of 0.84
* We explore questions on what makes sentences semantically related
* We also show the utility of STR-2022 for evaluating automatic methods of
  sentence representation and for various downstream NLP tasks

## 2.2 Existing Relatedness and Similarity Data Existing datasets created for

* sentence pair similarity
  * STS (Agirre+, 2012, 2013, 2014, 2015, 2016),
  * MRPC (Dolan and Brockett, 2005), and
  * LiSent (Li+, 2006))
  * ask annotators to choose among coarse similarity labels. This leads to
  * eg in STS 2012–2016 2: not equivalent but share some details and 1: not
    * despite claiming to determine semantic similarity, the descriptions of
      categories 1 and 2 incorporate aspects of semantic relatedness — an
      amalgamation muddying the waters with respect to relatedness
* SICK (Marelli+, 2014) dataset combines a labeling scheme from STS with those
  about entailment and contradiction. These datasets have helped make
  * a hybrid involving artificially created categories for similarity and
    entailment. For our annotations, we avoid fuzzy ill-defined categories, and

# 7 Utility of Semantic Relatedness and STR-2022 in Downstream NLP Tasks

* textual coherence and narrative structure
  * Often, sentences in a document are not paraphrases, entailments, or
    similar, but rather semantically related to each other. This
  * need for continuity of meaning has long been identified as crucial to lang
    (Halliday and Hasan, 1976; Morris and Hirst, 1991).
  * ie when generating a summary or a response to a question, systems must
    choose sentences that are not paraphrases or entailments of each other, but
    yet suitably semantically related. Therefore, being able to judge both
    similarity and relatedness is crucial.
* STR-2022 has already been used in some projects. Notable among these is
  * Wang+ (2022). Wang+ (2022) propose a new intrinsic evaluation method,
    EvalRank, that focuses on local neighborhoods (how well systems identify
    close neighbors, rather than how well they rank the full set of pairs).
    * they obtain markedly higher correlations between performance scores on
      the intrinsic evaluation and performance on downstream tasks (seven NLP
    * tasks including NLI, question classification, caption retrieval, and
      sentiment analysis)
    * ablation study demonstrates that using STS instead of STR-2022 decreases
      performance up to 10 points, leading them to conclude that STR-2022 is
      particularly useful in generating sentence embeddings for downstream

# 9 Limitations

* we used the most common methods for sentence representations (eg mean-pooling
  and max-pooling of traditional and contextual word embeddings). However,
  * hE other embeddings which are better suited for predicting sem relatedness
    (eg other order-aware embeddings). Expanding the set of embedding
* we explored the impact of some sentence-pair features such as i
  * eg lexical overlap, POS, and some aspects of sentence struct (subj & obj)
  * hE other features eg logicality and common sense reasoning on relatedness
