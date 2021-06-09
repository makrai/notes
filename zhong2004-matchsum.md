Extractive Summarization as Text Matching
Ming Zhong, Pengfei Liu, Yiran Chen, Danqing Wang, Xipeng Qiu, Xuanjing Huang
ACL 2020 arXiv:2004.08795 [cs.CL]

* This paper creates a paradigm shift in neural extractive summarization
  * Instead of extracting sentences individually and modeling the relationship
    between sentences,
  * we formulate the task as a semantic text matching problem, in which a
  * source document and candidate summaries matched in a semantic space
  * grounded in our comprehensive analysis of the inherent
    gap between sentence-level and summary-level extractors
    based on the property of the dataset.  Besides, even instantiating the
    framework with a simple form of a matching model, we have
* new SOTA extractive result on CNN/DailyMail to a new level (44.41 ROUGE-1)
* Experiments on the other five datasets also show the effectiveness of the

# 1 Intro

* Currently, most of the neural extractive summarization systems: sentence level
  * score and extract sentences (or smaller semantic unit (Xu+ 2019)) one by one
  * model the relationship between the sentences, and then select several sents
  * Cheng and Lapata (2016); Nallapati+ (2017)
    * extractive summarization as a sequence labeling problem and solve it
      with an encoder-decoder framework.  These models make
    * independent binary decisions for each sentence, resulting in high redundan
  * A natural way to address the above problem is to introduce an
    * auto-regressive decoder (Chen & Bansal 18; Jadhav and Rajan 18; Zhou+ 18)
      allowing the scoring operations of different sentences to influence each oth
    * Trigram Blocking (Paulus+ 2017; Liu and Lapata, 2019), as a more popular
      * skip the sentence that has trigram overlapping
        with the previously selected sentences. Surprisingly, this simple method
      * brings a remarkable performance improvement on CNN/DailyMail
  * inclined to select highly generalized sentences while
    ignoring the coupling of multiple sentences
* summary-level scoring:
  * Narayan+ (2018b); Bae+ (2019) utilize reinforcement learning (RL) to achieve
    summary level scoring, but still limited to the architecture of
    sentence-level summarizers
* we compare sentence-level and summary-level approaches, we conduct an analysis
  * six benchmark datasets (in Section 3) to explore the characteristics of
  * there is indeed a gap between the two approaches across these datasets,
* our summary-level framework (M ATCH S UM , Figure 1) and conceptualize
  * extractive summarization as a semantic text matching problem. The principle
    idea is that a good summary should be more semantically similar as a whole
    to the source document than the unqualified summaries
  * Semantic text matching is an important research problem to estimate sem sim
    * applied in many fields, such as information retrieval (Mitra+ 2017),
      question answering (Yih+ 2013; Severyn and Moschitti, 2015),
      natural language inference (Wang and Jiang, 2016; Wang+ 2017) and so on
  * Siamese-BERT architecture to compute the similarity between the source
    document and the candidate summary.  Siamese BERT leverages the pre-trained
    BERT (Devlin+ 2019) in a
    * Siamese network structure (Bromley+ 1994; Hoffer and Ailon, 2015; Reimers
      and Gurevych, 2019) to derive semantically meaningful text embeddings that
* Our model outperforms strong baselines significantly in all cases and improve
  the SOTA extractive result on CNN/DailyMail

# 4 Summarization as Matching

* content selection module to pre-select salient sentences. The module learns to
  assign each sentence a salience score and prunes sentences irrelevant with the
  * our content selection module is a parameterized neural network. In this
  * we use B ERT S UM (Liu and Lapata, 2019) without trigram blocking to score
* Then generating all combinations of `sel` darab sentences subject to the
  pruned document, and reorganize the order of sentences according to the
  original position in the document to form candidate summaries. Therefore, we
