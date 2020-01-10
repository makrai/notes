Ivan Vuli ́c and Marie-Francine Moens
Bilingual Word Embeddings from Non-Parallel Document-Aligned Data
  Applied to Bilingual Lexicon Induction
2015

#Abstract

* We show that our BWE-based BLI models significantly outperform the
  MuPTM-based and context-counting models in this setting, and obtain the best
  reported BLI results for all three tested language pairs;
* We also show that our BWE-based BLI models outperform other BLI models based
  on recently proposed BWEs that require _parallel_ data for bilingual
  training

#1 Introduction

* “more traditional” distributional models (Turney and Pantel, 2010),
* the skip-gram model with negative sampling (SGNS) (Mikolov+ 2013c)
   * simplicity,
   * fast training, as well as its
   * robust performance across a wide variety of semantic tasks
     (Baroni+ 2014; Levy+ 2015)
* extension of interest from monolingual to multilingual ... recently by
   * Klementiev+ 2012; Zou+ 2013; Mikolov+ 2013b;
   * Hermann and Blunsom, 2014a; Hermann and Blunsom, 2014b; Gouws+
   * 2014; Chandar+ 2014;
   * Soyer+ 2015;
   * Luong+ 2015
* shared inter-lingual embedding space
* Contributions
  * (1) from non-parallel data without ... pre-given bilingual lexicons;
  * (2) in the BLI task
    * from comparable Wikipedia data
    * on benchmarking datasets for three language pairs
  * (Vulić and Moens, 2013b)
    * outperforms  other BLI models ... recently proposed
      (Gouws+ 2014; Chandar+ 2014)

#2 Model Architecture

#3 Experimental Setup

* Training Data
* BWESG Training Setup
* Baseline BLI Models
  * (1) BiLDA-BLI. A BLI model that relies on the induction of
    * latent cross-lingual topics (Mimno+ 2009) by the
    * bilingual LDA model and
    * represents words as probability distributions over these topics
    * (Vuli ́c+ 2011)
  * (2) Assoc-BLI. A BLI model that
    * represents words as vectors of association norms
      (Roller and Schulte im Walde, 2013)
    * these norms are computed using a multilingual topic model
      (Vulic and Moens, 2013a)
  * (3) PPMI+cos. A standard distributional model for BLI
    * positive pointwise mutual information and cosine similarity
    * (Bullinaria and Levy, 2007)
    * The seed lexicon is bootstrapped
      * method from (Peirsman and Pad ́o, 2011; Vuli ́c and Moens, 2013b)
* Test Data
* Evaluation Metrics

#4 Results and Discussion

#5 Conclusions and Future Work
