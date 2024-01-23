Pre-training Tasks for Embedding-based Large-scale Retrieval
Wei-Cheng Chang, Felix X. Yu, Yin-Wen Chang, Yiming Yang, Sanjiv Kumar
Accepted by ICLR 2020 arXiv:2002.03932 [cs.LG]

* the large-scale query-document retrieval problem
  * given a query (eg a question), return the set of relevant documents (eg
    paragraphs containing the answer) from a large document corpus. This
* often solved in two steps
  1. The retrieval phase first reduces the solution space, returning a subset
     of candidate documents
  2.  re-ranks the documents
* the retrieval algorithm not only desires high recall but also requires to be
  highly efficient, returning candidates in time sublinear to the number of
  documents
* the scoring phase witnessing significant advances recently due to the
  BERT-style pre-training tasks on cross-attention models
* hE retrieval phase remains less well studied
  * Most previous works rely on classic Information Retrieval (IR) methods
    eg BM-25 (token matching + TF-IDF weights)
    * only accept sparse handcrafted features and
      can not be optimized for different downstream tasks of interest. In this
* we conduct a comprehensive study on the embedding-based retrieval models. We
  * the key ingredient of learning a strong embedding-based Transformer model
    is the set of pre-training tasks
  * With adequately designed paragraph-level pre-training tasks
    * Inverse Cloze Task (ICT), Body First Selection (BFS),
      Wiki Link Prediction (WLP), and the combination of all three
  * remarkably improve over
    the widely-used BM-25 as well as embedding models without Transformers. The

# 2 The two-tower retrieval model

## Related Works 

* Cer+ (2018) study
  the two-tower Transformer model as a universal sentence encoder. The model is
  learned with multiple tasks including the 
  * unsupervised Skip-Thought task (Kiros+, 2015), the 
  * supervised 
    * conversation input-response task (Henderson+, 2017), and the
    * sentence classification SNLI task (Bowman+, 2015)
* Humeau+ (2019) propose the Poly-encoders architecture
  to balance the computation/expressiveness tradeoff between
  two-tower models and cross-attention models
* Reimers & Gurevych (2019) fine-tune the deep twotower models on two
  supervised datasets, SNLI and MNLI (Williams+, 2018), then apply it in
  solving other downstream tasks
* all the above works that consider training the two-tower Transformer models
  on a limited amount of supervised corpus for the sentence classification
* we study different pre-training tasks and their contributions in the
  large-scale retrieval settings.
* open-domain question answering
  * Previous works consider using
    BM25 or other lexical matching methods to retrieve the top-k relevant
    passages efficiently and
    then deploy the more expensive cross-attention scoring function to find the
    answer (Chen+, 2017; Yang+, 2017; 2019a)
  * Das+ (2019) encode query and document separately with LSTM encoders. They
    * a training procedure different from ours and do not consider
      pre-training.
* Lee+ (2019) propose to pre-train two-tower Transformer models with the
  Inverse Cloze Task (ICT) to replace BM25 in the passage retrieval phase. The
  * retriever can be trained jointly with the reader/scorer. Nevertheless,
  * hE not outperform BM25 on the SQuAD dataset, potentially because the
    fine-tuning is only performed on the query-tower.
* Model distillation (Hinton+, 2015) can be used to compress expensive
  BERT-like cross-attention models into efficient two-tower Transformer models
  for large-scale retrieval problems. For example, 
  * Tang+ (2019) demonstrate initial success in distilling the BERT model into
    a two-tower model with BiLSTM as encoders
  * The pre-training tasks we study in this paper can be used as additional
    supervision in the distillation process, and therefore complementary to
    model distillation.

# 3 Pre-training tasks of different semantic granularities

* As mentioned in Section 2, due to the limited amount of supervised data from
  downstream tasks, a crucial step of learning deep retrieval models is to
  pre-train the model with a set of pre-training tasks (we will verify this in
  Section 4)
* Sentence-level pre-training tasks have been studied before. One example is
  * reconstructing the surface form of surrounding sentences given the encoded
    sentence (Le & Mikolov, 2014; Kiros+, 2015), and another one is
  * discriminating the next sentence from random candidates
    (Jernite+, 2017; Logeswaran & Lee, 2018)
* In this paper, we assume that the pre-training data is defined as positive
  query-document (q, d) pairs
* A good pre-training task should have the
  following two properties. 1) It should be 
  * relevant to the downstream task.  For example, when solving the
    question-answering retrieval problem, the model should capture different
    granularities of semantics between the query and document. The semantics
    can be the local context within a paragraph, global consistency within a
    document, and even semantic relation between two documents. 2) It should be
  * cost-efficient to collect the pre-training data, ideally not requiring
    additional human supervision.
* In light of the above requirements, we present three pre-training tasks that
  emphasize different aspects of semantics between queries and documents:
  Inverse Cloze Task (ICT), Body First Selection (BFS), and Wiki Link
  Prediction (WLP)
* BFS and WLP are newly proposed in this paper
* The training data for all these tasks can be freely obtained based from
  Wikipedia without an additional manual labeling process
* Figure 2 provides illustrative examples of these tasks

## Inverse Cloze Task (ICT) 

* Given a passage p consisting of n sentences, p = {s1 , . . . , sn }, the
  query q is a sentence randomly drawn from the passage, q = si , i ∼ [1, n],
  and the document d is the rest of sentences, d = . See (q1 ,d) in Figure 2 as
* captures the semantic context of a sentence and was
  originally proposed by Lee+ (2019)

## Body First Selection (BFS) to capture sem relship outside of the loc parag

* Here, the query q2 is a random sentence in the first section of a Wikip page, 
* the document d is a random passage from the same page (Figure 2).  Since the
* first section of a Wikipedia article is often the description or summary of
  the whole page, we expect it to contain information central to the topic.

## Wiki Link Prediction (WLP) to capture inter-page semantic relation. The

* query q3 is a random sentence in the first section of a Wikipedia page, and
* document d is a passage from another page where there is a hyperlink link to
  the page of q3 (Figure 2). Intuitively, a hyperlink link indicates

## Masked LM (MLM), the classic as a baseline

* predict the randomly masked tokens in a sentence
* MLM is the primary pre-training task used in BERT (Devlin+, 2019)
  Kenton Lee, Ming-Wei Chang, and Kristina Toutanova
  Latent retrieval for weakly supervised open domain question answering
  ACL 2019
