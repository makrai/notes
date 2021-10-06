Don’t ...: Topic-Aware Convolutional Neural Networks for Extreme Summarization
Shashi Narayan, Shay B. Cohen, Mirella Lapata
EMNLP 2018

# Abstract

* We introduce “extreme summarization”, a new single-document summarization task
  * not favor extractive strategies and calls for an abstractive modeling
  * one-sentence news summary: “What is the article about?”
  * real-world, large-scale dataset by
    online articles from the British Broadcasting Corporation (BBC)
* novel abstractive model which is conditioned on the article’s topics and
  based entirely on convolutional neural networks
* captures long-range dependencies in a document and recognizes pertinent contnt
* outperforming an oracle extractive system and SOTA abstractive approaches when
  evaluated automatically and by humans

# 1 Intro

* large-scale document summarization datasets 
  (Sandhaus, 2008; Hermann+ 2015; Grusky+ 2018). However, these datasets 
  * often favor extractive models 
    (Cheng and Lapata, 2016; Nallapati+ 2017; Narayan+ 2018b). 
  * Abstractive approaches, despite being more faithful to the actual task,
    either lag behind extractive ones or are mostly extractive, 
    exhibiting a small degree of abstraction (See+ 2017; Tan and Wan, 2017;
    Paulus+ 2018; Pasunuru and Bansal, 2018; Celikyilmaz+ 2018) 
* we introduce extreme summarization, a new single-document summarization task
  * not amenable to extractive strategies and requires an abstractive modeling
  * answering the question “What is the article about?”. An example of a
  * very different from a headline whose aim is to encourage readers to read the
  * draws on information interspersed in various parts of the document (not only
    the beginning) and displays 
  * multiple levels of abstraction including 
    * paraphrasing, fusion, synthesis, and inference.
* We build a dataset for the proposed task by harvesting 
  * online articles from the British Broadcasting Corporation (BBC) that often
* a novel deep learning model which we argue is well-suited to extreme summ
  * existing abstractive approaches 
    (Rush+ 2015; Chen+ 2016; Nallapati+ 2016; See+ 2017; Tan and Wan, 2017;
    Paulus+ 2018; Pasunuru and Bansal, 2018; Celikyilmaz+ 2018) which 
    * rely on an encoder-decoder architecture modeled by RNNs, we present 
  * a topic-conditioned neural model which is 
    based entirely on convolutional neural networks (Gehring+ 2017b).
    * capture long-range dependencies between words in the document better
    * allowing document-level inference, abstraction, and paraphrasing.  Our
    * encoder associates each word with a topic vector capturing whether it is
      representative of the document’s content, while our convolutional 
    * decoder conditions each word prediction on a document topic vector.
* Experimental results show that when evaluated in terms of ROUGE 
  * outperforms an oracle extractive system and SOTA RNN-based abstractive syss.
  * two human evaluations in order to assess 
    * which type of summary participants prefer and 
    * how much key information from the document is preserved in the summary.
  * Both evaluations overwhelmingly show that human subjects find 
    our summaries more informative and complete.  
* contributions in this work are three-fold: 
  * a new single document summarization dataset, abstractive systems;
    * analysis and empirical results showing that extractive approaches are not
      well-suited to the extreme summarization task; and 
  * a novel topic-aware convolutional seq-to-seq model for abstractive summ
