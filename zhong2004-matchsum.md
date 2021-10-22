Extractive Summarization as Text Matching
Ming Zhong, Pengfei Liu, Yiran Chen, Danqing Wang, Xipeng Qiu, Xuanjing Huang
ACL 2020 arXiv:2004.08795 [cs.CL]

* This paper creates a paradigm shift in neural extractive summarization
  * Instead of extracting sentences individually and modeling the relationship
    between sentences,
  * we formulate the task as a semantic text matching problem
  * source document and candidate summaries matched in a semantic space
  * grounded in our comprehensive analysis of the
    gap between sentence-level and summary-level extractors
    based on the property of the dataset
* new SOTA extractive result on CNN/DailyMail on a new level (44.41 ROUGE-1)
* Experiments on the other five datasets also show the effectiveness

# 1 Intro

* Currently, most of the neural extractive summarization systems: sentence level
  * score and extract sentences (or smaller semantic unit (Xu+ 2019)) one by one
  * model the relationship between the sentences, and then select sentences
  * Cheng and Lapata (2016); Nallapati+ (2017)
    * extractive summarization as a sequence labeling problem 
      * solved with an encoder-decoder framework
    * independent binary decisions for each sentence, resulting in high redundan
  * A natural way to address the above problem is to introduce an
    * auto-regressive decoder (Chen & Bansal 18; Jadhav and Rajan 18; Zhou+ 18)
      * scoring operations of different sentences influence each other
    * Trigram Blocking (Paulus+ 2017; Liu and Lapata, 2019), as a more popular
      * skip the sentence that has trigram overlapping
        with the previously selected sentences
      * remarkable performance improvement on CNN/DailyMail
  * inclined to select highly generalized sentences while
    ignoring the coupling of multiple sentences
* summary-level scoring:
  * Narayan+ (2018b); Bae+ (2019) utilize reinforcement learning (RL) to achieve
    * still limited to the architecture of sentence-level summarizers
* we compare sentence-level and summary-level approaches, we conduct an analysis
  * six benchmark datasets (in Section 3) to explore the characteristics
  * there is indeed a gap between the two approaches across these datasets,
* our summary-level framework (MatchSum, Figure 1)
  * extractive summarization as a semantic text matching problem. The principle
    idea is that a good summary should be more semantically similar as a whole
    to the source document than the unqualified summaries
  * Semantic text matching is an important research problem to estimate similart
    * applied in many fields, such as information retrieval (Mitra+ 2017),
      question answering (Yih+ 2013; Severyn and Moschitti, 2015),
      natural language inference (Wang and Jiang, 2016; Wang+ 2017) and so on
  * Siamese-BERT architecture to compute the similarity 
    between the source document and the candidate summary.  Siamese BERT
    leverages the pre-trained BERT (Devlin+ 2019)
    * Siamese network structure (Bromley+ 1994; Hoffer and Ailon, 2015; Reimers
      and Gurevych, 2019) to derive semantically meaningful text embeddings
* Our model outperforms strong baselines significantly in all cases and 
  improve the SOTA extractive result on CNN/DailyMail

# 4 Summarization as Matching

* content selection module to pre-select salient sentences
  * assigns each sentence a salience score and prunes irrelevant sentences
  * our content selection module is a parameterized neural network
  * we use BertSum (Liu and Lapata, 2019) without trigram blocking for scoring
* Then generating all combinations of `sel` darab sentences subject to the
  pruned document, and 
  reorganize the order of sentences according to the original position
