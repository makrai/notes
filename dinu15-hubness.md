Georgiana Dinu, Angeliki Lazaridou, Marco Baroni
Improving zero-shot learning by mitigating the hubness problem
2015

http://clic.cimec.unitn.it/~georgiana.dinu/down/

# Abstact

hubness problem = default error

# 1 Introduction

* unsupervised vector-based representations of meaning
  * Collobert+ 2011;
  * Clark, 2015;
    Clark, Stephen
    Vector space models of lexical meaning
    In Lappin, Shalom and Fox, Chris (eds.),
    Handbook of Contemporary Semantics, 2nd ed. Blackwell, Malden, MA, 2015
    http: //www.cl.cam.ac.uk/~sc609/pubs/sem_handbook.pdf
  * Turney & Pantel, 2010)
* zero-shot learning
  * address the manual annotation bottleneck
  * domains e.g., images or brain signals where other vector-based
    representations must be associated to words (Palatucci+ 2009)
  * neural decoding
    * (Mitchell+ 2008; Palatucci+ 2009),
    * learning a regression function from fMRI activations to words
  * computer vision
    * retrieving words to label images of objects
      * (Frome+ 2013; Socher+ 2013)
    * language-to-vision mapping for image retrieval
      * (Lazaridou+ 2014a)
    * multilingual
      * translation pair vectors to learn a cross-language mapping
        * (Mikolov+ 2013b)
* default error
  * The presence of [vectors known as hubs] is an intrinsic problem of
    high-dimensional spaces (Radovanović+ 2010b)
  * `(*)` inverting the query: 
    * a képvektor melyik szónak a legkevesebbedik legközelebbi szomszédja?

# 2 Hubness in zero-shot mapping

* Original vs. mapped vectors
  * 300-dimensional vectors of English words as source and vectors of Italian
    words as target.  We have, in total, vocabularies of 200,000 English and
    Italian words,
    * miért 300 dim a forrás?, |V| = 200 000

# 3 A globally corrected neighbour retrieval method p4

* Methods for [downplaying the importance of elements that have a high hubness
  score] have been proposed and evaluated, for example, by
  * Radovanovic+ (2010a) and
    * bib
      Radovanović, Milos, Nanopoulos, Alexandros, and Ivanović, Mirjana
      On the existence of obstinate results in vector space models
      * obstinate: makacs, csökönyös, önfejű
      In Proceedings of SIGIR, pp.  186–193, 2010a
    * cited by
      * M Radovanović, A Nanopoulos… - The Journal of Machine …, 2010
        * Hubs in space: Popular nearest neighbors in high-dim data
      * The role of hubness in clustering high-dimensional data
        * N Tomasev, M Radovanovic… - Knowledge and Data …, 2014
      * Hubness-based fuzzy measures for high-dimensional k-NN classif
        * N Tomašev, M Radovanović, D Mladenić… - …, 2014
  * Tomasev+ (2011a)
    Tomasev, Nenad, Brehar, Raluca, Mladenic, Dunja, and N Sergiu
    The influence of hubness on nearest-neighbor methods in obj recog
    Intelligent Computer Communication and Processing (ICCP), 2011a
* We adopt a much simpler approach
  * pivot: more vectors in the source domain 
    * We map these additional pivot elements and conjecture that we can use the
      topology of the subspace where the mapped pivot set lives to correct
      nearest neighbour retrieval
  * NN_nrm
    * [we] normalize the vector of similarities of each target item to the
      mapped pivots to [sum to] length 1,
  * globally-corrected (GC)
* ha `(*)`-ban döntetlen, akkor cos

## 3.1 English to Italian word translation

* work on acquiring translation dictionaries
  * by vector-space methods on
    * monolingual corpora, together with
    * a small seed lexicon
  * (Haghighi+ 2008; Klementiev+ 2012; Koehn & Knight,
  * 2002; Rapp, 1999)
  * co-occurrence only with the words in the seed lexicon
    * (Klementiev+ 2012; Rapp, 1999)
* Word representations
  * cbow,
  * window of 5,
  * negative sampling method, drawing 10 samples
* Training and testing
  * 5 frequency bins
  * We observed improvements also when using solely the 1,500 mapped test
    elements as pivots, but increasing the size with arbitrary additional data
    (that can simply be sampled from the source space without any need for
    supervision) helps performance
* Results
  * regularization
    * without regularization as well as
    * with regularization
      * parameter λ estimated by generalized cross-validation (GCV)
      * Regularization does not improve
  * train size
    * For the standard method,
      * the performance decreases as the training data size increases beyond
        5K, probably due to the noise added by lower-frequency words
    * The corrected measures are
      * robust against this effect: adding more training data does not help,
        but it does not harm
  * frequency bin show that
    * most of the improvements are brought about for the all-important 
      medium~ and low-frequency words
  * elements with the largest hub score
    * tend to be “garbage” low-frequency words
    * in any realistic setting such low-frequency terms should not be filtered
      * good translations might also have low frequency
    * proximity to the test-set mean vector
      * Radovanović+ (2010b): hubness correlates with it
      * Hubness level is plotted against cosine-to-mean in Figure 3

## 3.2 Zero-shot image labeling and retrieving

* Experimental setting 
  * Images are represented by 4096-dimensional vectors extracted using the Caffe
    toolkit (Jia+ 2014) together with the pre-trained convolutional neural
    network of Krizhevsky+ (2012)
* Results
  * We consider both the 
    * usual image labeling setting (Vision→Language) and the
    * image retrieval setting (Language→Vision)
