What does BERT learn about the structure of language?
Ganesh Jawahar, Benoı̂t Sagot, Djamé Seddah
ACL 2019

# Abstract

* we perform experiments to unpack the English language structure learned
* phrasal representation captures phrase-level information in the lower layers
* intermediate layers encode a rich hierarchy of linguistic information, with
  surface features at the bottom, syntactic features in the middle and
  semantic features at the top. turns out to
* BERT requires deeper layers for long-distance dependency information
  eg to track subject-verb agreement
* a compositional representation that mimics classical, tree-like structures

# 1 Introduction

* interpretability of neural networks in NLP (Belinkov and Glass, 2019)
* Goldberg (2019) shows that BERT captures syntactic phenomena well when
  evaluated on its ability to track subject-verb agreement
* we use the
  * probing tasks defined in Conneau+ (2018) to show that BERT captures a rich
  * Tensor Product Decomposition Network (TPDN, McCoy+ 2019) to explore
    different hypotheses about the compositional nature of BERT’s repr
    and find that BERT implicitly captures classical, tree-like structures

# 6 Compositional Structure

* Tensor Product Decomposition Networks (TPDN, McCoy+ 2019)
  * explicitly compose the input token (“filler”) representations
    based on the role scheme selected beforehand using tensor product sum
    * eg a role scheme for a word can be based on the path
      from the root node to itself in the syntax tree
      (eg ‘LR’ denotes the right child of left child of root)
  * assumtion: if a TPDN can be trained well to approximate the representation
    learned by a neural model, then that role scheme likely specifies the
    compositionality implicitly learned by the model
* For each BERT layer, we work with five different role schemes
  * left-to-right index, its
  * right-to-left index, an
  * ordered pair containing its left-to-right and right-to-left indices, its
  * position in a syntactic tree (formatted version of the Stanford PCFG Parser
    (Klein and Manning, 2003) with no unary nodes and no labels) and
  * an index common to all the words in the sentence (bag-of-words), which
    ignores its position
  * a role scheme based on random binary trees
* Following McCoy+ (2019), we
  * train our TPDN model on the premise sentences in the SNLI corp (Bowman+ 15)
  * initialize the filler embeddings of the TPDN with the pre-trained word
    embeddings from BERT’s input layer, freeze it, learn a linear projection on
    top of it and use a Mean Squared Error (MSE) loss function
    * Other trainable parameters include
      the role embeddings and a linear projection on top of tensor product sum
      to match the embedding size of BERT
* Table 4 displays the MSE between pretrained BERT and TPDN
  * BERT implicitly implements a treebased scheme, as a TPDN model following
* case study on dependency trees induced from self attention weight
  * following the work done by Raganato and Tiedemann (2018)
  * Figure 2 displays the
  * dependencies inferred from an example sentence by obtaining self attention
    weights for every word pairs from attention head #11 in layer #2,
    * fixing the gold root as the starting node and invoking the
    * Chu-Liu-Edmonds algorithm (Chu and Liu, 1967). We observe that
    * determiner-noun dependencies and subject-verb dependency are captured
    * Surprisingly, the predicate-argument structure seems to be partly modeled
      as shown by the chain of dependencies between “key”,“cabinet” and “table”

# 7 Related Work

* Peters+ (2018) studies how the choice of neural architecture such as CNNs,
  Transformers and RNNs used for LM pretraining affects the downstream task
  * all architectures learn high quality representations that outperform
    standard word embeddings such as GloVe (Pennington+ 2014) for challenging
  * these architectures hierarchically structure linguistic information, such
    that morphological, (local) syntactic and (longer range) semantic
    information tend to be represented in, respectively, the word embedding
    layer, lower contextual layers and upper layers. In our work, we observe
* Goldberg (2019) shows that the BERT model captures syntactic information well
  for subject-verb agreement
  * We build on this work by performing the test on each layer of BERT
    controlling for the number of attractors and then show that BERT requires
    deeper layers for handling harder cases involving long-distance dependency
* Tenney+ (2019) introduces an edge probing task to
  investigate how contextual word representations encode sentence structure
  across a range of syntactic, semantic, local and long-range phenomena
  * They conclude that
    * contextual word representations trained on LM and MT encode syntactic
      phenomena strongly, but offer
    * comparably small improvements on semantic tasks over a non-contextual
    * linguistic hierarchy confirms our probing task results
* Liu+ (2019)
  * studies the
    * features of language captured/missed by contextualized vectors,
    * transferability across different layers of the model and the
    * impact of pretraining on the linguistic knowledge and transferability.  They
  * find that
    * contextualized word embeddings do not capture fine-grained ling knowledge,
    * higher layers of RNN to be task-specific (no such patt for a transformer)
    * pretraining on a closely related task yields
      better performance than LM pretraining
* Hewitt and Manning (2019) recover parse trees from the linear transformation
  of contextual word representation consistently, better than with
  non-contextual baselines. They focused mainly on syntactic structure while our
  work additionally experimented with linear structures (leftto-right,
  right-to-left) to show that the compositionality modelling underlying BERT
  mimics traditional syntactic analysis

# 8 Conclusion

* future: if our results transfer to other domains with higher variability in
  * syntactic structures (such as noisy user generated content) and with higher
  * word order, as experienced in some morphologically-rich languages
