Embarrassingly Simple Unsupervised Aspect Extraction 
Stéphan Tulkens, Andreas van Cranenburgh
ACL 2020

code to reproduce the experiments https://github.com/clips/cat

# Abstract

* a simple but effective method for aspect identification in sentiment analysis.
  * only requires in-domain word embeddings and a POS tagger, and is therefore
  * Contrastive Attention (CAt)
    * a novel single-head attention mechanism based on an RBF kernel, which
    * considerable boost in performance and makes the model interpretable.
* Previous work relied on syntactic features and complex neural models. We show
* simplicity of current benchmark datasets for aspect extraction

# 1 Intro

* aspect: a dimension on which an entity is evaluated (see Figure 1). While
  * can be concrete (e.g., a laptop battery) or subjective (e.g., the loudness)
* Aspect extraction is an important subtask of aspect-based sentiment analysis.
  * most existing systems are supervised 
  * overview: Zhang+ (2018). As aspects are domain-specific, 
  * supervised systems that rely on strictly lexical cues to differentiate
    between aspects are unlikely to transfer well between different domains
    (Rietzler+ 2019).
  * scarcity of training data for many domains (e.g., books), and, more
    importantly, the complete lack of training data for many languages.
* Unsupervised aspect extraction has 
  * previously been attempted with 
    * topic models (Mukherjee and Liu, 2012), 
    * topic model hybrids (Garcı́a-Pablos+ 2018), and 
    * restricted Boltzmann machines (Wang+ 2015), among others. Recently,
  * autoencoders using attention mechanisms (He+ 2017; Luo+ 2019) have reached
    SOTA performance on a variety of datasets. These models are unsupervised in
    * not require labeled data, although they do rely on unlabeled data to learn
  * We show that a much simpler model suffices for this task.
* We present a simple unsupervised method for aspect extraction which 
  * only requires a POS tagger and in-domain word embeddings, trained on a small
  * novel single-head attention mechanism, Contrastive Attention (CAt ), 
    * based on Radial Basis Function (RBF) kernels.  
    * Compared to conventional attention mechanisms (Weston+ 2014; Sukhbaatar+
      2015), CAt captures more relevant information from a sentence. Our method
  * outperforms more complex methods, e.g., attention-based neural networks (He+
    2017; Luo+ 2019). In addition, our method 
  * automatically assigns aspect labels, while in previous work, labels are
    manually assigned to aspect clusters. Finally, we present an analysis of the
* limitations of our model, and propose some directions for future research.
* conclusion
  * our model uses a frequency threshold for candidate selection together with a
    novel attention mechanism based on RBF kernels, together with an automated
    aspect assignment method. We show that 
* for the task of assigning aspects to sentences in the restaurant domain, the
  RBF kernel attention mechanism outperforms a regular attention mechanism, as
  well as more complex models based on auto-encoders and topic models.

# 5 Analysis

* ablation study to see the influence of each component of our system;
  * i.e. POS tagging, in-domain word embeddings, and the amount of data 
  * Only selecting the most frequent words as aspects, regardless of their POS
    tag, had a detrimental effect on performance, giving an F-score of 64.5
    (∆-21.9), while 
  * selecting nouns based on adjective-noun co-occurrence had a smaller
    detrimental effect, giving an F-score of 84.4 (∆-2.2), 
    * higher than ABAE and SERBM.  
  * Replacing the in-domain word embeddings with pretrained GloVe embeddings had
    a large detrimental effect on performance, dropping the F-score to 54.4
  * how much in-domain data is required to achieve good performance, we perform
    * about 260k sentences are needed to tackle this specific dataset.  
* error analysis, a manual categorization of error types. Several of the errors
  * Outof-Vocabulary (e.g. Somosas) or low frequency (e.g. Dhal)
  * Since our model is purely based on lexical similarity, homonyms and
    polysemous words can lead to errors. An example of this is the word
    ‘course,’ which our model interprets as being about food
  * aspects expressed in verbs, As the aspect terms we use are restricted to N
    * e.g. “waited for food.” Finally, 
  * discourse context and implicatures (world knowledge), e.g. ‘no free drink’
    does not express an opinion about drinks, but about service
* we surmise that our model will perform less well in domains in which aspects
  are expressed in a less overt way 
  * e.g. _As usual, Beaton conceals any number of surprises behind her trademark
    wry humor._ 
    * aspects, including writing style, plot, and a general opinion on the book
* future conted: Given the performance of CAt , especially compared to regular
  * how CAt performs as a replacement of regular attention in supervised models,
    e.g., memory networks (Weston+ 2014; Sukhbaatar+ 2015). Additionally, it
  * why the attention model outperforms regular dot product attention.
    * our understanding is that the dot-product attention places a high emphasis
      on words with a higher vector norm; words with a higher norm have, on
      average, a higher inner product with other vectors. As the norm of a word
      embedding directly relates to the frequency of this word in the training
      corpus, the regular dot-product attention naturally attends to more
      frequent words. In a network with trainable parameters, such as ABAE (He+
      2017), this effect can be mitigated by finetuning the embeddings or other
      weighting mechanisms. In our system, no such training is available, which
      can explain the suitability of CAt
