Simple Unsupervised Similarity-Based Aspect Extraction
Danny Suarez Vargas, Lucas R. C. Pessutto, Viviane Pereira Moreira
CICLing 2019 arXiv:2008.10820 [cs.CL]

The code for SUAEx is available at https://github.com/dannysvof/SUAEx.git.

* Aspect-Based Sentiment Analysis (ABSA) involves two tasks:
  * aspect extraction and polarity detection
* the SOTA in ABSA consists of deep learning methods
  e.g. recurrent, convolutional and attention neural networks
  * they require a lot of training data and are computationally expensive
* we propose a simple approach called SUAEx for aspect extraction
  * unsupervised and relies solely on the similarity of word embeddings
  * Experimental results on datasets from three different domains
  * outperform the SOTA attention-based approach at a fraction of the time

# 1 Intro

* Aspect-Based Sentiment Analysis (ABSA) [2]
  * 2. Zhang, L., Liu, B.: Aspect and entity extraction for opinion mining
       Data mining and knowledge discovery for big data. Springer (2014) 1–40
  * e.g. in _The decor of the restaurant is amazing and the food was incredible_
    * _decor_ and _food_ are the aspects of the entity (or categ) _restaurant_
* SOTA approaches [4–7] require significant computational power, such as deep NN
* SUAEx relies on vector similarity to emulate the attention mechanism 
  * allows us to focus on the relevant information
  * perform as well as the neural attention mechanisms
  * tested on datasets from different domains
  * outperform the SOTA in ABSA in many cases in terms of quality
    and in all cases in terms of time
  * limited to dealing with aspects represented as single words
* future work, we will extend SUAEx to treat 
  * compound aspects e.g. “wine list”,
  * improve the selection of reference words by using hierarchical data such as
    subject taxonomies

# 2 Background and Definitions

# 3 Related work 3

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
    results but at a high computational cost

# 4 SUAEx

* six modules depicted in Fig. 1: 
  * Filtering, 
  * Selection of Reference Words, 
  * Preprocessing, 
  * Word-Embeddings Representation, 
  * Similarity, and 
  * Category Attribution. SUAEx requires three inputs and
* inputs 
  * text from a given domain (which is used to build the domain-spec word embed)
  * test data with the reviews for which the aspects and categories will be
    extracted
  * reference words, which are used to determine the categories as well as
    extract the aspects related to each category. Next, we describe the

## The Selection of Reference Words module is responsible for choosing the

* The selection of the words for each group can be performed in three different
  * manual selection can be done by simply selecting the category words
  * semi-automatic selection can be performed by expanding the initial manually
    constructed groups of reference words. The expansion can be done through the
    search for synonyms or meronyms of the words that represent the category
  * automatic selection mechanism can be performed by considering a taxonomy of

## The Filtering module aims to select the domain related part from raw data.

* optional but it is particularly useful when we want to delve into a category
  and we only have raw data for the general topic. For example, if we just
* as a binary text classifier for the domain of interest, or simply by choosing
  reviews that mention the category name.  

## The Preprocessing module normalizes the input data and reduces the amount of

* The amount of data needed to train word-embeddings is directly proportional to
  the size of the vocabulary of the raw data. Since preprocessing reduces the
  * typical preprocessing tasks such as tokenization, sentence splitting,
    lemmatization, and stemming.  

## The Word-Embedding Representation module 

* vector representation of words will be used to measure word similarity in the
* can be generated using well-known tools such as Word2vec [9], Glove [10], or
  Fastext [11]

## The Similarity as an Attention Mechanism module receives two types of inputs,

* emulate the behavior of the attention mechanism in a neural network by
  assigning attention values to each word in an input sentence in relation to a
  given set of reference words
* For each group of reference words, it returns an attentionvalued version of
  the test data. This output can be used in two ways: to identify the aspects
  for each category or as an input to the Category Attribution module.
* e.g. cosine similarity is used to attribute the relevance of a given word x
  in relation to another word y or related to a group of words c. In this
  module, we can test with two types of similarity values. The similarity
  obtained from the direct comparison of two words (direct similarity) and the
  similarity obtained from the comparison of two words in relation to some
  contextual words (contextual similarity)
* attention values are obtained by applying the softmax function to the sim 
* Output1 is the test data together with the values for attention and similarity
  assigned by SUAEx. For example, if we consider three groups of reference words
  in the input, ”food”, ”staff”, and ”ambience”, Output1 consists in three
  attention-valued and similarity-valued versions of the test data (one set of
  values for each category).  

## The Category Attribution module uses the output of the Similarity module to

* assign one of the desired categories to each sentence in the test data. In
* we can test different ways to aggregate the similarity values 
  * average for each sentence or only consider the maximum value [22]. If the
    22. Vargas, D.S., Moreira, V.P.: Identifying sentiment-based contradictions.
        JIDM 8 (2017) 242–254
    * average: there are more than one relevant word to receive attention in the
    * maximum: the word with the highest score will get all the attention.  
* Output2 is the main output which contains all the sentences of the test data
  with the categories assigned by the Category Attribution module.

# 5 Experimental Design 6

* two experiments
  1. compare SUAEx to our baseline ABAE [19].We hope to answer the following
    * questions: Can a simple approach like SUAEx achieve results that are close
      to the SOTA in aspect extraction? and How does SUAEx behave in different
      domains? 
  2. runtime analysis of the two approaches
* we describe the datasets, the tools and resources used

## Tools and Parametrization

* NLTK 3 was used in the preprocessing module to remove stopwords, perform
  tokenization, sentence splitting, and for lemmatization. The 
* domain-specific word-embeddings were created with Word2Vec 4 using the
  * CBOW module, window size of 5 words, and 200 dimensions 
  * The remaining parameters were used with the default values (negative
    sampling = 5, number of iterations = 15). The 
* similarity between word vectors was measured with the cosine similarity in
  Gensim [24] which reads the model created by the Word2vec
* for the laptop domain, the training file provided by SemEval is too small and
  insufficient to create the domain word-embeddings.
  * Amazon raw data was taken from a public repository to be used as an external

# 6 Results and Discussion 8

* ABAE tends to have a better precision in most cases (three out of four datast)
  * can be attributed to the contrast in the way the two solutions use the
    attention mechanism. While 
    * ABAE only considers the highest attention-valued word in the sentence,
      SUAEx uses all the attention values in the sentences.  This difference can
* On the SemEval datasets, SUAEx outperformed the baseline in nearly all cases.
  We can attribute this to the role of the training (i.e., raw) data.
  * SUAEx only uses the training data to generate the word-embeddings
  * ABAE also uses it in the evaluation module because it clusters the training
    data.
* per aspect category are shown in Table 2. 
  * SUAEx scored lower in recall for Ambience, Smell, and Look because the
    reference words (i.e., the names of the categories themselves) are not as
    expressive as the reference words for the other categories
    * We can find more similar words for general terms like food or staff than
      for specific terms like smell.  
* Other works have also used the CitySearch and BeerAdvocate datasets. Thus we
  * techniques such as LDA [25], biterm topic-models [26], a statistical model
    over seed words [27], or restricted Boltzmann machines [28]. The same
* our method can assign high attention values to adjectives (which typically are
  not aspects).  This happens with the word _higher_ in our example, which is an
  * could be mitigated with a post-filter based on part-of-speech tagging.  
* Table 3's extraction was performed by selecting the highest attention-valued
  words of each sentence and by considering the category classification results.
  * This extraction can be used as an additional module in our framework

## Runtime Results. In order to obtain the runtime results, we ran both methods

* differences are remarkable – ranging x10^3--4
