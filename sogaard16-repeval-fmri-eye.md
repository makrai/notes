Evaluating word embeddings with fMRI and eye-tracking
Anders Søgaard
2016 repeval

http://cst.dk/anders/fmri-eval/

# Abstract

* evaluating word embeddings as features in a multi-dimensional regression model
  predicting brain imaging or eyetracking word-level aggregate statistics

# What’s the meaning of embeddings?

* whether words are defined by their
   cooccurrences (Firth, 1957), the
  * contexts in which they are used (Wittgenstein, 1953),
  * how they are organized in the brain (Miller and Fellbaum, 1992), or the
  * referents they denote in the real world (Montague, 1973)

# Sprachspiel theory p2

explicit semantic analysis (Gabrilovich and Markovitch, 2009)

# Cognitive lexical semantics p2

* word associations norms
  * critiques of their usage (Faruqui+ (2016); Batchkarov+ (2016); Chiu+ (2016))
  * problem with word association norms is inadequacy (and statistical power):
    They conflate several types of similarity, e.g., synonymy and antonymy, and
    they are culture-specific
  * The hypothesis is that our mental lexicon is organized as a undirected,
    colored, weighted network,
  * WordNets low inter-annotator agreement shown by Juergens (2014),
    some inter-annotator disagreements are not random (errors), but reflect
    different, linguistically motivated choices
    * David Juergens. 
      LREC 2014 
      An analysis of ambiguity in word sense annotations

# Brain imaging, anyone? p3

* correlation between distances in word embedding space and EEG/fMRI space; 
  * or, perhaps more robustly, the P@k predicting nearest neighbors
    EEG/fMRI/etc.  using embeddings
* Evaluating the squared error of a regression model trained to associate the
  input word embeddings with EEG/fMRI/etc

# At last, a few experiments p3

* We evaluate the
  * Ew30 and Senna embeddings (Collobert+ 2011)
  * against
    * fMRI data from Wehbe+ (2015),
      * using the token-level statistics derived in Barrett+ (2016), and
        Maria Barrett, Joachim Bingel, and Anders Søgaard
        2016. ACL
        Extracting token-level signals of syntactic processing from fmri with
        an application to pos induction
    * eye-tracking data from the Dundee
      Corpus (Barrett and Søgaard, 2015)
* My first experiment is a simple one, merely to show how uncorrelated raw fMRI
  and eyetracking data are with SOTA embeddings
* For words w in a training split, I train a deep neural regression model to
  reconstruct the fMRI/gaze vector from the input embedding, which I evaluate
  by its squared error on a held-out test split. All vectors are normalized to
  the (0,1)range, leading to squared distances in the (0,2)range. The training
  split is the first 100 words in the common vocabulary (of the two embeddings
  and the gold standard); the test split the next 100 words
  * I use SGD and a hidden layer with 100 dimensions

# What I am saying,,,

* website: http://cst.dk/anders/fmri-eval/ where users can upload pairs of
  embeddings and obtain learning curves
* Marconi (1997) says lexical competence involves both an
  * inferential aspect, i.e., learning a semantic network of synonymy and
    hyponymy relations, as well as a
  * referential aspect, which is in charge of naming and application
