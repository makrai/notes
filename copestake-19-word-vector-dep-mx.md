Paula Czarnowska, Guy Emerson and Ann Copestake
Words are Vectors, Dependencies are Matrices:
  Learning Word Embeddings from Dependency Graphs
IWCS 2019

# Abstract

* good performance on both intrinsic and extrinsic evaluation tasks
* represent dependency chains as products of matrices
  * provides a straightforward way of handling further contexts

# 1 Introduction

* [dependency] in Skip-gram was explored by Levy and Goldberg (2014), who
  * contexts [were a concatenation of the word] and the dependency-label
  * Each context type was associated with an independent vector representation
  * labels were not associated with independent representations
  * intensifies the problems associated with data sparsity
* Turney (2012) refers to
  * relatedness as domain similarity
  * function similarity: the degree to which words share similar funcl roles

# 4 Evaluation 5

* We compared the performance of our model to that of
  * Skip-gram (SG),
  * Levy and Goldberg (2014)’s model (LG) and
  * Skip-gram for which the contexts are retrieved from the target’s syntactic
    relations but the labels are disregarded (SGdep)
* tasks
  * word similarity datasets, as well as the
  * RELPRON dataset (Rimell+ 2016)
  * differentiating between similarity and relatedness relations
  * qualitatively, by manually inspecting the types of captured similarities
  * extrinsic tasks: dependency-parsing, chunking and part-of-speech tagging
  * dependency embeddings are well suited for these tasks
    (Bansal+ 2014; Melamud+ 2016)
* All models were trained on the
  * WikiWoods corpus (Flickinger+ 2010), which contains a 2008 Wikipedia
  * Universal Dependencies (Nivre+ 2016; Schuster and Manning, 2016)
  * We tuned the
    * dimensionality for all tasks and the
    * number of negative samples for RELPRON and word similarity
    * for word similarity we based the hyperparameter choice on the SimLex-999
    * we removed all tokens ... with frequencies less than 100

## 4.1 Word Similarity Datasets

* The datasets used for this evaluation included
  * Agirre+ (2009)’s relatedness and similarity splits of WordSim353 (WS353)
    (Finkelstein+ 2001)
  * MEN (Bruni+ 2014) which consists of 3000 similar and related pairs, the
  * Rare Word (RW) collection (Luong+ 2013), incorporating 2034 pairs of
    infrequent and morphologically complex words,
  * SimLex-999 (Hill+ 2016) consisting of 999 similar word pairs and
  * SimVerb-3500 (Gerz+ 2016) which includes 3500 similar verb-only pairs
* The models performed best using 300 dimensional embeddings and 20 negative
* DM outperformed LG on all benchmarks and SGdep on all similarity [as opposed
  to relatedness] datasets

# 4.2 RELPRON

* RELPRON
  * introduced by Rimell+ (2016) as an evaluation dataset for semantic comp
  * term-property pairs, with each term matched to up to ten properties. Each
    property = hypernym of the term, modified by a simple relative clause
    e.g. dog has the property mammal that people walk. The full dataset
    * 1087 properties and 138 terms, with a
      test set of 569 properties and 73 terms and a
      development set of 518 properties and 65 terms. The
      task is to determine matching properties for all terms. This is
    * as an information retrieval [i.e.] ranking
      assessed using Mean Average Precision (MAP). An
    * alternative task is to determine the correct term for each property
      * Here, the evaluation measure becomes Mean Reciprocal Rank (MRR), as
* we constructed a vector for each property, and then used cosine similarity
  * approaches to constructing property vectors,
    * both based on weighted vector addition,
      which Rimell+ (2016) showed to perform well as a composition method,
    1. simple-sum (SS), is the sum of the words’ input-embeddings. The second,
    2. enhanced-sum (ES), makes use of the dependency structure

### Simple-sum composition 7

* summing the input-embeddings of the agent a, verb v and patient p in a phrase

### Enhanced-sum composition

* focus on one specific word – in this case, the head noun, which is the term’s
* There are two ways that we can view the head noun
  * as a target word,
    * the verb acts as a context, and the other noun acts as a further context
    * sum the head noun’s input embedding, the verb’s context embedding, and
      the other noun’s further context embedding. This composed vector should
  * as a context,
    * the verb acts as the target word, and the other noun also acts as a contx
    * sum the head noun’s context embedding, the verb’s input embedding, and
      the other noun’s context embedding. This composed vector should be close
* the following formulae [represent] contexts differently
  * For the dependency models, the formulae also depend on the semantic role of
    the head noun (agent or patient)
  * For DM, we have a principled way to represent the further context,
    through the multiplication of two T dependency matrices
    The input embedding E p is mapped by T dobj −1 to the output embedding
    space, and then mapped by T nsubj −1 to the input embedding space
    * This composition method (multiplying dependency matrices, and summing
      over words) can be applied to any possible dependency graph:

## 4.3 Similarity vs Relatedness 8

## 4.4 Qualitative Evaluation 9

## 4.5 Dependency Parsing

* we used the input-embeddings of DM, LG and SG to initialise ... the Stanford

## 4.6 Part-of-speech Tagging

* evaluation framework, VecEval (Nayak+ 2016). VecEval’s word-labelling model
* resembles the one introduced by Collobert+ (2011). First, it constructs the
* representation of the token’s context by concatenating embeddings of the
  surrounding words and then passes it through two neural network layers,
  followed by a softmax classifier

## 4.7 Chunking

* the chunking CoNLL’00 shared task (Tjong Kim Sang and Buchholz, 2000)

# 5 Conclusion 10

* [Our] Skip-gram-based DSM [is]
  superior or on par with Levy and Goldberg (2014)’s model
