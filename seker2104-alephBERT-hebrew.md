AlephBERT:A Hebrew Large Pre-Trained Language Model to Start-off your Hebrew NLP Application With
Amit Seker, Elron Bandel, Dan Bareket, Idan Brusilovsky, Refael Shaked Greenfeld, Reut Tsarfaty
arXiv:2104.04052 [cs.CL]

huggingface.co/onlplab/alephbert-base

* reported advances using PLMs in Hebrew are few and far between. 
  * The problem is twofold. First, Hebrew 
  * resources available for training NLP models are not at the same order of mgn
  * no accepted tasks and benchmarks to evaluate the progress of Hebrew PLMs on.
* we aim to remedy both aspects. First, 
  * we present AlephBERT, a large pre-trained language model for Modern Hebrew,
    * trained on larger vocabulary and a larger dataset than any Hebrew PLM
  * we present new SOTA results on multiple Hebrew tasks and benchmarks,
    * Segmentation, Part-of-Speech Tagging, full Morphological Tagging,
      Named-Entity Recognition and Sentiment Analysis. We make our AlephBERT
      model publicly available, providing a single point of entry for the
      development of Hebrew NLP applications. 

# Introduction

* in Hebrew previously reported results using BERT-based models are far from
  impressive. Specifically, 
  * for several reported tasks, the mBERT model results are on a par with
    pre-neural models, or neural models based on non-contextialized embeddings
    (Tsarfaty+ 2020; Klein and Tsarfaty, 2020). An additional Hebrew BERT-based
  * HeBERT (Chriqui and Yahav, 2021), has been released, yet there is 
    * no reported evidence on performance improvements on key component of the
      Hebrew NLP pipeline — which includes, at the very least: 
      * morphological segmentation, full morphological tagging, and full
        (token/morpheme-based) named entity recognition.  
* we present AlephBERT, a Hebrew pre-trained language model, larger and more eff
  * substantial improvements on all essential tasks in the Hebrew NLP pipeline,
    tasks tailored to fit a morphologically-rich language, including:
    Segmentation, Part-of-Speech Tagging, full morphological tagging, 
    Named Entity Recognition and Sentiment Analysis. Since previous Hebrew NLP
  * we confirm our results on all existing Hebrew benchmarks and variants. For
* morphology and POS tagging, we test on both the 
  * Hebrew section of the SPMRL shared task (Seddah+ 2013), and the 
  * Hebrew UD corpus (Sadde+ 2018). For 
* Named Entity recognition, we test on both the corpus 
  of Ben Mordecai and Elhadad (2005) and that of Bareket and Tsarfaty (2020) .
* sentiment analysis we test on 
  the facebook corpus of Amram+ (2018), as well as its newer (fixed) variant of
* In the near future we will release 
  * the complete AlephBERT-geared pipeline we developed, containing the
  * downstream language understanding tasks such as: 
    Information Extraction, Text Summarization, Reading Comprehension, and more.
* future research, we are pursuing a plan to investigate the effect of 
  * different word decomposition algorithms and input representation variants on
    the different tasks in the Pipeline.
