Understanding the Semantic Content of Sparse Word Embeds Using a Commonsense KB
Balogh V, Berend G, Diochnos DI, & Turán Gy
AAAI Conference on Artificial Intelligence, 2020 34(05), 7399-7406

# Abstract

* methodology is illustrated by two techniques using the ConceptNet KB
  * The first approach assigns a commonsense concept label to the individual
    dimensions of the embedding space
  * The second approach uses a metric, derived by spreading activation, to
    quantify the coherence of coordinates along the individual axes. We also
* relationship between the two approaches
  * in the individual dimensions of sparse word embeddings, words with
    high coefficients are (as opposed to 0)
    more semantically related in terms of path lengths in the knowledge base

# 1 Intro

* we consider several methods to generate sparse word embeddings from dense
  * sparse coding (Berend 2017), another family is obtained by
  * clustering, and a third family is obtained by
  * greedily choosing almost orthogonal bases
* combine word embeddings and knowledge bases. Such a combination has the
  * info from KB incorporated into a word embed ~ the construction of the embed
    * during (Iacobacci+ 2015; Osborne+ 2016) or
    * after (Faruqui+ 2015a; Glavaš and Vulić 2018)
* A knowledge base provides different tools to explore the semantic content of
  directions, and thus of the basis vectors (also referred to as semantic atoms)
  * simple or composite concepts contained in a knowledge base and notions of
  * semantic relatedness that can be derived from a knowledge base (Feng+ 2017)
    * relatedness notions based on graph distances and edge labels, e.g., using
      spreading activation, label propagation or random walks
* We focus on commonsense KBs, in particular on ConceptNet (Speer & Havasi 12)

# 2 related work

* Faruqui+ (2015b) and Subramanian+ (2018) are seminal in sparse word embeddings
* Tsvetkov+ (2015) introduced the evaluation measure QVEC
  * correlation between the dimensions of a word embedding space and the
    semantic categories obtained from SemCor (Miller+ 1993)
* QVEC-CCA (Tsvetkov, Faruqui, and Dyer 2016) was introduced as an improvement
* both QVEC and QVEC-CCA provide an overall statistical measure
  rather than an explicit interpretation, and
  interpretations are given in terms of a relatively small number of lex categs
* Şenel+ (2017) consider explicit assignments to word embedding dimensions, and
  * interpretability scores to measure semantic coherence
  * perhaps the paper most closely related to our approach
  * new dataset (SEMCAT) of 6,500 words described with 110 categories as the KB
    * ConceptNet is much larger and richer but also noisier than SEMCAT
  * no sparse
* Osborne+ (2016) introduced an algorithm for determining word representations
  that also encode prior knowledge into the learned embeddings besides the
  distributional information originating from raw text corpora
* Alsuhaibani+ (2018): word embedding and a knowledge base are learned together
  * The knowledge base is incorporated into the embedding's objective function
    (i.e., vectors of words being in a relation are supposed to be close)
* similar approach to utilize background knowledge in deep learning, e.g.,
  TransE (Border+ (2013))
* similarity of vectors used for updating the knowledge base
  * Gardner+ (2014) uses word embeddings similarity to aid
    finding paths for new relation tuple prediction. Evaluations on downstream
* Path-based methods for semantic relatedness are surveyed in Feng+ (2017)
  * Feng Y, Bagheri E, Ensan F, and Jovanovic J
    The state of the art in semantic relatedness: a framework for comparison
    Knowledge Eng. Review 2017 32:e10
  * Harrington (2010) considers spreading activation-based methods in ASKNet
  * Berger-Wolf+ (2013) considers spreading activation in ConceptNet 4 for QA

# 3 three types of sparse word embeddings discussed

* compares them in terms of incoherence and the overlap between word vectors and
  semantic atoms

# 4 the algorithm for assigning ConceptNet concepts to bases in word embeds 4

* different quantities from information retrieval measuring the quality of the
  assignments
* experiments evaluate the assignments for the three types of embeddings
* how the sparsity parameter influences the results

# 5 Spreading Activation and ConceptNet 5

* from the intro
  * develops the tool for the other evaluation approach: using ConceptNet to
  * measure coherence or semantic relatedness of a set of words by spreading
    activation
  * experiments evaluating words corresponding to bases in the sparse embeddings
* main tools used in various such applications are
  * seminal
    * label propagation (Quillian 1969) and
    * spreading activation methods (Collins and Loftus 1975)
  * Salton and Buckley 1988
  * Harrington 2010
  * Nooralahzadeh+ 2016: to Entity Linking in Text.
  * Berger-Wolf+ 2013
* filtering on the activated network so that heavy short paths are found
  connecting the starting nodes.
* we employ spreading activation in ConceptNet 5.6 to investigate the coherence
  of the dominant words in each base. Whereas earlier we were interested in
  * this time we allow non-English words to be activated and appear in this
    search process and in fact we give such an example at the end of the current
    section. We are interested if the dominant words in a base make a
    semantically coherent group compared to the words with zero coefficients.
  * 10 words with the largest nonzero coefficients are selected from each base
    * 10 words with zero coordinates are randomly chosen.  We call these two
    * both come from the 50k most popular embedded words (having the highest
      total degree) that appear in ConceptNet.
* Table 3 presents findings from our experiments. For the paths found, the
  average path length among pairs of top words (AP L t ) is less than the
  * the network activated while searching for a path is typically smaller for

### On the Average Path Lengths

### On the Spreading Activation Variant

* The variant we use behaves similarly to label propagation
* In almost all cases the path connecting a pair of words is one of the shortest
  found in the knowledge base and the activation helps us identify a heavy
  such short path
* future direction is to explore other variants of spreading activation.

### On the Alignment In some cases the top 10 aligned words with a particular

* incoherence of the top aligned words is reflected in the path lengths.

### On Polysemy

* In several cases, polysemy gives the short and heavy path
* happen when looking at paths for both top and bottom words and regardless of
  the overall coherence of the words in the group.  e.g.
  /c/en/trad – /c/en/music – /c/en/rock – /c/fr/géologie – /c/en/volcanology

# 6 brings the two approaches together by analyzing their correspondences
