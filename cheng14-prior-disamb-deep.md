Jianpeng Cheng and Dimitri Kartsaklis and Edward Grefenstette
Investigating the Role of Prior Disambiguation 
  in Deep-learning Compositional Models of Meaning
2014

#1 Introduction

* compositionality in distributed representations
  * Early attempts: fixed algebraic operations such as
    * vector addition and component-wise multiplication [11]
  * relational words as tensors of various orders and 
    tensor contraction was adopted [1, 3, 4]
    1. M. Baroni and R. Zamparelli. 
      Nouns are vectors, adjectives are matrices: Representing adjective-noun
      EMNLP 2010.
    3. B. Coecke, M. Sadrzadeh, and S. Clark. 
      Mathematical foundations for a compositional distributional ...  meaning.
      2010.
    4. E. Grefenstette. 
      Category-Theoretic Quantitative Compositional Distributional [sem] Models 
      PhD 2013
  * non-linear neural network-based compositional approaches
    * recursively applying neural networks [15, 16, 6]
* ambiguity
  * Reddy et al. [14] propose to disambiguate each word vector before
    composition for simple additive and multiplicative compositional models
  * tested on ... multi-linear compositional distributional models
    * by Kartsaklis and colleagues [9, 10, 8]
  * this paper ... evaluating on neural compositional models
* Other works that combine NNs with WSD, but not in a compositional setting
  * [7] E. H. Huang, R. Socher, C. D. Manning, and A. Y. Ng
    * Improving word representations via global context and multiple word pts
    * ACL 12
  * [13] A. Neelakantan, J. Shankar, A. Passos, and A. McCallum
    * Efficient non-parametric estimation of multiple embeddings per word
    * emnlp 14
* Neural networks for composing meaning
  * recursive neural networks (RecNNs) [15]
  * recursive auto-encoder (RAE) [16, 6]

#3 Combining NNs with context-based word sense disambiguation

* each input word is associated with a set of vectors, each representing
  different meanings of the word in the training corpus. As input to the
  compositional network, we select the most probable meaning vector for each
  word given its context
* Our general methodology
  * essentially recasts the approach of [9] in a deep learning setting;
  * word sense induction step in order to
    * discover the latent senses of each target word
    * For every occurrence of a target word `w_t` in the corpus,
      we calculate a context vector as the average of [the ambiguous vectors
      of] its neighbours
    * hierarchical agglomerative clustering to them
      in order to discover sensible groupings 
      that hopefully correspond to different meanings of the word
    * As a vectorial representation for each meaning cluster, 
      we use its centroid
    * Up to this point, each target word w t is associated to
      * an ambiguous vector and
      * a set of 3 meaning vectors

#4 Experiments

#5 Discussion

#6 Conclusion
