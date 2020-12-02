Minh-Thang Luong, Hieu Pham, Christopher D. Manning
Bilingual Word Representations with Monolingual Quality in Mind
NAACL-HLT 2015 Denver

All our code, data, and embeddings are publicly available at
http://stanford.edu/~lmthang/bivec

# Abstract

* bilingual tasks
  * most often the crosslingual document classification (CLDC) evaluation
* preserving clustering structures of word representations monolingually
* extend the recently popular skipgram
* accuracy in CLDC task
  * new state-of-the-art accuracy of 80.3 for the German to English
  * a highly competitive performance of 90.7 for the other direction
    * [in this direction, autoencoder is the best]
* our models outperform
  * best embeddings from past bilingual representation work
  * by a large margin in the monolingual word similarity evaluation

# 1 Introduction

* representations where similar-meaning words in two languages are 
  embedded close together in the same high-dimensional space

# 2 Background

## 2.1 Monolingual Models

* Existing approaches to distributed word representation learning
  * nem tudom, hogy mi a különbség
  * neural probabilistic language models and
    * Bengio+ 2003; Morin, 2005; Mnih & Hinton, 2009; Mikolov+ 2010; 2011
  * margin-based ranking models
    * Collobert and Weston, 2008; Huang+ 2012; Luong+ 2013
* we use the negative sampling
  * noise contrastive estimation method (Gutmann and Hyvärinen, 2012)
* In our evaluation, we consider the sum of [the] input and output vectors

## 2.2 Bilingual Models

* Bilingual Mapping (Mikolov+ 2013b)
* Monolingual Adaptation
  * bootstrap learning of target representations
    * from well trained embeddings of a source language
      * usually a resource-rich one like English
  * bilingual constraint
    * Zou+ (2013) considers the unsupervised alignment information
    * derived over a parallel corpus
* Bilingual Training,
  * Klementiev+ 2012; Hermann and Blunsom, 2014; Kočiský+ 2014; 
    Chandar A P+ 2014; Gouws+ 2014
  * none of these work has [been] examined using monolingual metrics

# 3 Our Approach

* joint objective similar to (Klementiev+ 2012; Gouws+ 2014): 
  `α(Mono_1 + Mono_2 ) + βBi` 
* In contrast to the existing approaches, we use 
  the same type of models for both of our monolingual and bilingual constraints
  * skipgram model with negative sampling

## 3.2 Bilingual Skipgram Model (BiSkip)

* predict words cross-lingually
* four skipgram models jointly
* BiSkip-UnsupAlign where we utilize unsupervised alignment
  * information learned by the Berkeley aligner (Liang+ 2006) and
* BiSkip-MonoAlign
  * monotonic alignments

# 4 Experiments

## 4.1 Data

* Europarl v7 corpus
* (49.7M English tokens and 52.0M German tokens)

## 4.2 Training

* 10 epochs

## 4.3 Evaluation Tasks

### 4.3.1 Word Similarity

* datasets:
  * For English,
    * WordSim353 (353 pairs), MC (30 pairs), RG (65 pairs), SCWS
    * (1762 pairs), and RW (2034 pairs)
    * See (Luong+ 2013) for more information
  * German Word-Sim353 German counterpart
    * we first used Google Translate to get German translations
    * then asked two German speakers to help us verify these
      * we fixed 23 translation pairs

### 4.3.2 Cross-lingual Document Classification

* follow Klementiev+ (2012)
* train with 1000 and test on 5000 RCV-labeled documents
* averaged perceptron algorithm
* The feature vector for each document is the 
  averaged vector of words in the document weighted by their idf values
* A classification model trained on one language is then applied directly to
  classify new documents in another language
  * word vectors in these languages are embedded in the same space,
* transfer learning of models 
  from a resource-rich language into a resource-poor one

# 5 Results

* CLDC
  * we compare over
    * multitask learning model (Klementiev+ 2012),
    * bilingual without alignment model (Gouws+ 2014),
    * distributed word alignment model, DWA (Kočiský+ 2014),
      * learns distributed _alignments_ and embeddings simultaneously
    * autoencoder model (Chandar A P+ 2014), and
    * compositional model (Hermann and Blunsom, 2014)
  * our two BiSkip models
    * one utilizing the unsupervised alignments (UnsupAlign) and
    * one assuming monotonic alignments (MonoAlign)
    * both 40 and 128-dimensional vectors
  * our joint models [are] very fast to train compared to other methods,
  * all our models are superior to the DWA approach
  * higher word similarity scores can be achieved by simply increasing
    * the vocabulary coverage,
    * training corpus size, and
    * the embedding dimension
    * Past work have demonstrated that (Pennington+ 2014; Faruqui & Dyer, 2014)

# 6 Analysis

## 6.1 Nearest Neighbor Words
## 6.2 Embedding Visualization

# 7 Related Work

* dimensionality reduction of word representations
  * from a cooccurrence matrix of words and contexts
    * contexts: documents, neighbor words, etc.
    * using e.g. LSA (Dumais+ 1988) or LDA (Blei+ 2003),
  * clustering-based representations,
    * e.g., Brown+ (1992)’s hierarchical clustering algorithm
    * represents each word as a binary path through the cluster hierarchy
  * distributed representations,
    * each word is explicitly modeled by a dense real-valued vector and
    * directly induced by predicting words from contexts or vice versa
* bilingual vector-space models
  * those that make use of comparable corpora
    * bilingual latent semantic models (LSA)
      (Tam and Schultz, 2007; Ruiz and Federico, 2011) or
    * bilingual/multilingual topic models (LDA)
      (Zhao and Xing, 2007; Ni+ 2009; Mimno+ 2009; Vulic+ 2011)
  * those that only require unaligned or monolingual text
    * generally requires a small _initial lexicon_
      extracted either manually or 
      automatically (cognates, string edit distances)
    * e.g
      * work that extends CCA (Haghighi+ 2008; Boyd-Graber and Blei, 2009),
        * mapping representations of words in different languages 
          into the same space
      * bootstrapping style to iteratively enlarge the initial lexicon
        (Peirsman and Padó, 2010; Vulić and Moens, 2013)

# 8 Conclusion

* would be interesting to
  * extend our method to multiple languages
    * as in (Hermann and Blunsom, 2014)
* train on a large amount of monolingual data
    * similar to BilBOWA (Gouws+ 2014)
      * Stephan Gouws, Yoshua Bengio, and Greg Corrado
      * 2014 NIPS Deep Learning Workshop
      * Bilbowa: Fast bilingual distributed representations 
        without word alignments
