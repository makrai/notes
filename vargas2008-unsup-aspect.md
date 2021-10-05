Simple Unsupervised Similarity-Based Aspect Extraction
Danny Suarez Vargas, Lucas R. C. Pessutto, Viviane Pereira Moreira
CICLing 2019 arXiv:2008.10820 [cs.CL]

* Aspect-Based Sentiment Analysis (ABSA) involves two tasks: 
  * aspect extraction and polarity detection
* the SOTA in ABSA consists of the application of deep learning methods such as
  recurrent, convolutional and attention neural networks
  * they require a lot of training data and are computationally expensive
* we propose a simple approach called SUAEx for aspect extraction
  * unsupervised and relies solely on the similarity of word embeddings.
  * Experimental results on datasets from three different domains
    * outperform the SOTA attention-based approach at a fraction of the time. 

# 1 Intro

* Aspect-Based Sentiment Analysis (ABSA) [2] deals basically with the texts of
  * 2. Zhang, L., Liu, B.: Aspect and entity extraction for opinion mining
       Data mining and knowledge discovery for big data. Springer (2014) 1–40
  * e.g. in the sentence “The decor of the restaurant is amazing and the food
    was incredible”, the words _decor_ and _food_ are the aspects of the entity
    (or category) _restaurant_
* SOTA approaches [4–7] require significant computational power, such as deep NN
* SUAEx relies on vector similarity to emulate the attention mechanism which
  * allows us to focus on the relevant information.  Our main contribution is to
  * perform as well as the neural attention mechanisms. We 
  * tested on datasets from different domains, and it was able to 
  * outperform the SOTA in ABSA in many cases in terms of quality 
    and in all cases in terms of time.
  * limited to dealing with aspects represented as single words. As 
* future work, we will extend SUAEx to treat compound aspects e.g. “wine list”,
  * improve the selection of reference words by using hierarchical data such as
    subject taxonomies.

# 2 Background and Definitions

# 3 Related work

* SOTA in ABSA: Attention-based Aspect Extraction (ABAE, He+ 2017), 
  * used as the baseline of our work. ABAE relies on an attention neural network
  * a three-layer neural network.  The input layer receives a given sentence S =
  * dimensionality reduction is performed from the word-embedding space to the
    aspect-embedding space
    * i.e. the input sentence is represented only by the most relevant words in
  * as for an optimization function, The output layer is the sentence reconstruct
* In summary, each group of solutions for ABSA have advantages and disadvantages
  * language rules are simple but require manual annotation to construct the
    * domain-specific – a new set of rules is needed for each domain. The
  * sequence models, topic models and even some based on neural networks are
    supervised machine learning solutions. So, their 
    * quality is directly proportional to the amount of annotated data. Finally,
  * unsupervised neural networks, such as our baseline [19], achieve good
    results but at a high computational cost.
