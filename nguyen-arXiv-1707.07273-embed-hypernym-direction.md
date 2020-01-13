Hierarchical Embeddings for Hypernymy Detection and Directionality
[Kim Anh Nguyen](http://www.ims.uni-stuttgart.de/institut/mitarbeiter/anhnk/index.en.html),
Maximilian Köper, Sabine Schulte im Walde, Ngoc Thang Vu
https://arxiv.org/abs/1707.07273

http://www.ims.uni-stuttgart.de/data/hypervec

# Abstract

* model is able to generalize over unseen hypernymy pairs, ... by mapping to
  other languages.  
* Results on benchmark datasets show that HyperVec outperforms both
  state-of-the-art unsupervised measures and embedding models 
  * on hypernymy detection and directionality, and 
  * on predicting graded lexical entailment.

# 1 Intro

* hypernymy detection is useful for NLP tasks such as 
  * taxonomy creation (Snow+ 2006; Navigli+ 2011), 
  * recognizing textual entailment (Dagan+ 2013), and 
  * text generation (Biran and McKeown, 2013)
* distinguish between the hypernym and the hyponym in a given hypernymy
  relation pair (directionality task).
* Two families of approaches to identify and discriminate hypernyms are
  * Distributional count approaches
    * directionally unsupervised measures
      * distributional inclusion hypothesis (Zhitomirsky-Geffet & Dagan, 2009)
      * distributional informativeness hypothesis 
        (Santus+ 2014; Rimell, 2014)
        * hypernyms [are] less informative than hyponyms, and that they occur
          in more general contexts
        * Kiela+ (2015) introduced methods drawn from visual properties
          of images to determine a concept’s generality in hypernymy tasks.
    * supervised classification methods
  * Approaches of hypernymy-specific embeddings 
    * Yu+ (2015)
    * Tuan+ (2016): dynamic weighting neural ... term embeddings
* Our model is inspired by the distributional inclusion hypothesis
  * word vectors which represent distinctive characteristics of a hyponym are
    expected to be closer to the hyponym vector than to its hypernym vector
    * e.g. _flap_ is more characteristic for a bird than for ...  animal;
* We evaluate our HyperVec model on 
  * unsupervised and supervised hypernymy detection and directionality tasks.
  * graded lexical entailment (Vulić+ 2016)
  * generalizing hypernymy by mapping to German and Italian
  * outperform state-of-the-art measures and previous embedding models.

# 2 Related work

* első sorban ld. az intrót
* Hypernym-specific embeddings
  * Vendrov+ (2016) ... explicitly model partial order structure of the
    visual-semantic hierarchy or the hierarchy of hypernymy in WordNet

# 3 Hierarchical Embeddings 3

## 3.1 Learning Hierarchical Embeddings

### 3.1.2 

* problem: differentiate hypernymy from other paradigmatic relations 
  e.g.~synonymy, meronymy, antonymy, etc. 
* Incorporating directional measures of hypernymy ... by exploiting the common
  contexts of hypernym and hyponym improves this ...  distinction
* but still suffers from distinguishing between hypernymy and meronymy.
* distributional lexical contrast model in Nguyen+ (2016) for
  distinguishing antonymy from synonymy
* assuming that the magnitude of the hypernym is larger than the magnitude of
  the hyponym

# 5 Generalizing Hypernymy

* generalization in ... by 
  * relying on a small seed set only, rather than using a large set of training data; and 
  * projecting HyperVec to other languages.

