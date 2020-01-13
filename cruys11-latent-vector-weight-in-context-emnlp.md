Tim Van de Cruys, Thierry Poibeau, Anna Korhonen
Latent vector weighting for word meaning in context
EMNLP 2011

* a factorization model in which words, together with their window-based
  context words and their dependency relations, are linked to latent
  dimensions. The factorization model allows us to
* determine which dimensions are important for a particular context, and
  adapt the dependency-based feature vector of the word accordingly. The
* evaluation on a lexical substitution task, both English and French--indicates
  * better results than state-of-the-art methods in lexical substitution, while
    at the same time providing more accurate meaning representations

# 1 Introduction

* methods to tackle language’s ambiguity, ranging from
  * coarser-grained sense inventories (Hovy+ 2006) and
  * graded sense assignment (Erk and McCarthy, 2009), over
  * word sense induction (Schütze, 1998; Pantel and Lin, 2002; Agirre+ 2006),
  * computation of individual word meaning in context
    (Erk and Padó, 2008; Thater+ 2010; Dinu and Lapata, 2010)
    * This research inscribes itself in the same line of thought
      i.e. the meaning representation of a word is adapted ‘on the fly’,

# Related work

* Lin (1998) uses the dependency relations ...  as context features
* An overview of dependency-based semantic space models ( Padó and Lapata 2007)
* differentiate between the different senses ... in an unsupervised way, WSI
* Schütze (1998) proposed a context-clustering approach,
* context vectors are represented as second-order co-occurrences
  (i.e. the contexts ... are similar if the words they in turn co-occur with
  are similar)
* Van de Cruys (2008)
  * sense induction based on latent semantic dimensions
  * non-negative matrix factorization
  * able to discriminate between different word senses. Our approach makes use
* we extend the approach with a probabilistic framework that is
  able to adapt the original vector according to the context of the instance
* model the individual meaning of words in context
  * Erk and Padó (2008, 2009) make use of selectional preferences to express
    the meaning of a word in context; the meaning of a word in the presence of
    an argument is computed by multiplying the word’s vector with a vector that
    captures the inverse selectional preferences of the argument
  * Thater+ (2009) and Thater+ (2010) extend the approach
    by incorporating second-order co-occurrences in their model; their model
    * first-order co-occurrences to act as a filter upon the second-order
      vector space, which allows for the computation of meaning in context
  * Erk and Padó (2010) propose an exemplar-based approach, in which the
    meaning of a word in context is represented by the activated exemplars that
    are most similar to it
  * Mitchell and Lapata (2008) propose a model for vector composition, focusing
    on the different functions that might be used
    * a model based on pointwise multiplication achieves better results than
      models based on vector addition
  * Dinu and Lapata (2010) propose a probabilistic framework that models the
    meaning of words as a probability distribution over latent dimensions
    (‘senses’). Contextualized meaning is then modeled as a change in the
    original sense distribution

# 3 Methodology of our method
the factorization model, and the computation of meaning in context

# 4 Evaluation on a lexical substitution task, both for English and French. The

# 5 conclusions and topics that deserve further exploration

* topics ... we consider worth exploring in the future. First of all, we would
  * optimal configuration for combining window-based and dependency-based
    contexts. At the moment, the performance of the combined model does not
    yield a uniform picture. The results might improve further if window-based
    context and dependency-based context are combined in an optimal way
  * further evaluation, in particular on ... semantic compositionality. And
  * transfer the general idea ... to a tensor-based framework
