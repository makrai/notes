Dynamic Meta-Embeddings for Improved Sentence Representations
Douwe Kiela, Changhan Wang, and Kyunghyun Cho
arXiv:1804.07983v2 [cs.CL] 5 Sep 2018

#Abstract

* selecting what pre-trained word embeddings to use:
  better left for neural networks to figure out by themselves. To that end, we
* [we] supervised learning of embedding ensembles, which leads to
  stateof-the-art performance within the same model class on a variety of
  tasks
* [the technique can] shed new light on the usage of word embeddings in NLP

##7.2 Linguistic Analysis

* fine-grained analysis of the behavior of DME 
  on the validation set of SNLI. Figure 3 shows a breakdown of the 
  average attention weights per part of speech. 
  Figure 4 shows a similar breakdown for open versus closed class.
* observations: it appears that this model 
  * prefers GloVe embeddings, followed by the two FastText embeddings (Wp CmmC)
  * open class words (e.g., nouns, verbs, adjectives and adverbs), those three
    embedding types are strongly preferred, while 
  * closed class words get more evenly divided attention. The embeddings from
* analyzing [attention weights] in terms of frequency and concreteness. We use
  * preference for GloVe, in particular for low-frequency words. 
  * concreteness, we use the concreteness 
    * ratings from Brysbaert+ (2014)
      Marc Brysbaert, Amy Beth Warriner, and Victor Kuperman 
      Concreteness ratings for 40 thousand generally known english word lemmas
      2014 Behavior research methods, 46(3):904–911.
    * visual embeddings get higher weights as the words become more concrete
* There are of course intricate relationships between 
  concreteness, frequency, POS tags and open/closed class words: 
  * closed class words are often frequent and abstract, while 
  * open class words could be more concrete, etc. 
  * It is beyond the scope of the current work to explore these further
