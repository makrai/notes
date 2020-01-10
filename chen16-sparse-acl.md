Compressing Neural Language Models by Sparse Word Representations
Yunchuan Chen, Lili Mou, Yan Xu, Ge Li, Zhi Jin
2016 ACL

#Abstract

* [neural] approaches are time- and memory-intensive because of the
  large numbers of parameters for word embeddings and the output layer
* In [our] experiments,
  * the number of parameters in our model increases very slowly
    with the growth of the vocabulary size, which is almost imperceptible
  * improves the performance in terms of the perplexity measure

#Intro

* neural network-based LMs have achieved significant breakthroughs:
  * more precisely than traditional n-gram statistics (Mikolov et al., 2011);
  * generat[ion in] tasks like machine translation, summarization, and dialogue
    systems (Devlin et al., 2014; Rush et al., 2015; Sordoni et al., 2015; Mou
    et al., 2015b)
  * [in] resource-restricted systems (Hinton et al., 2015), such approach is
    too memory-consuming and 
    may fail to be deployed in mobile phones or embedded systems
* we first represent infrequent words’ embeddings with frequent words’ by
  sparse linear combinations. This is inspired by the observation that, in a
  dictionary, an unfamiliar word is typically defined by common words. We
  therefore propose an optimization objective to compute the sparse codes of
  infrequent words. The property of
  * sparseness (only 4–8 values for each word) ensures the efficiency
* Based on the pre-computed sparse codes, we design our compressed language
  model as follows.  
  * A dense embedding is assigned to each common word; 
  * infrequent word ... representation by a sparse combination of common words
  * LSTM-based recurrent neural network (RNN) as the hidden layer

#3 Our Proposed Model

##3.1 Sparse Representations of Words

* We split the vocabulary V into two disjoint subsets (B and C)
  * B is a base set, containing a fixed number of common words (8k
  * C = V\B is a set of uncommon words
* Following most work in the literature (Lee et al., 2006; Yang et al., 2011),
  we represent each uncommon word with a sparse, linear combination of common
* optimization objective p4
  * first term (called fitting loss afterwards)
  * second term is an l1 regularizer, which encourages a sparse solution
  * last two regularization terms favor a solution that sums to 1 and that is
    nonnegative, respectively
    * as in He et al. (2012) due to psychological interpretation concerns
      Zhanying He, Chun Chen, Jiajun Bu, Can Wang, Lijun Zhang+
      Document summarization based on data reconstruction
      AAAI 2012 
* tricks
  * non-negativity
  * adaptive parameters that are resolved during training time
