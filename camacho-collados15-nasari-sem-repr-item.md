José Camacho-Collados, Mohammad Taher Pilehvar, and Roberto Navigli
NASARI: a Novel Approach to a Semantically-Aware Representation of Items
2015

http://lcl.uniroma1.it/nasari/

# Abstract

* either on lexicographic resources, such as WordNet, or on encyclopedic
  resources, such as Wikipedia. We propose a vector representation technique
  that combines the complementary knowledge of both these types of resource
* a novel cluster-based dimensionality reduction and an effective weighting
  scheme, our representation attains
* state-of-the-art performance on multiple datasets in two standard benchmarks:
  * word similarity and
  * sense clustering.  We are releasing our
* vector representations at http://lcl.uniroma1.it/nasari/

# Intro

* we provide improvements over the conventional tf-idf weighting scheme by
  applying lexical specificity (Lafon, 1980), a statistical measure mainly used
  for term extraction, to the task of computing vector weights in a vector
  representation

# 2 Semantic representation of concepts

## Semantic representation NASARI 

Our concept modeling approach consists of two phases. First, for a given
concept, we collect a set of relevant Wikipedia pages by leveraging the
structural information in Wikipedia and WordNet (Section 2.1). Then, we analyze
the obtained contextual information and construct two vector representations
of the concept (Section 2.2)

### Lexical specificity

* based on the hypergeometric distribution over word frequencies
* particularly suitable for extracting an accurate set of representative terms
  for a given subcorpus of a reference corpus (Lafon, 1980)
* Unlike the tf-idf weighting scheme (Jones, 1972), lexical specificity is not
  especially sensitive to different text lengths
