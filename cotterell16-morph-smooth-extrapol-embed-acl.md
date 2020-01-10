R Cotterell, H Schütze, J Eisner
Morphological smoothing and extrapolation of word embeddings
ACL 2016

#Abstract

* We ... exploiting existing morphological resources 
  that can enumerate a word’s component morphemes
* latent-variable Gaussian graphical model that allows us to 
  * extrapolate continuous representations for [unseen] words
    * global version of the vector offset method
  * smoothing the representations provided for the observed words
  * embeddings of morphemes ... combine to create embeddings of words
* evaluated Over several languages ... on an analogy task, "skip-gram [LM]",
  and [okosított] word similarity
  * large improvements over strong baselines

#1 Introduction

* Our proposed method runs as a fast postprocessor [on] word embeddings

#7 Related Work 5

* Faruqui+ (2015) ... designed a retrofitting procedure 
* Wieting+ (2015) compute compositional embeddings of phrases, with their
  * additive (like ours) over the phrase’s words
  * Their embeddings are tuned to fit observed phrase similarity scores from
    PPDB (Ganitkevitch+ 2013), which allows them to 
    smooth and extend PPDB just as we do to word2vec output.
* Using morphological resources to enhance embeddings at training time 
  * Luong+ (2013) used Morfessor (Creutz and Lagus, 2007)
  * then a recursive NN (Goller and Kuchler, 1996; Socher, 2014)
  * Our model is much simpler and faster to train. Their evaluation was limited
  * dos Santos and Zadrozny (2014) 
    * a neural tagging architecture (Collobert+ 2011) 
      with a character-level convolutional layer. 
  * Qiu+ (2014) and Botha and Blunsom (2014) both use Morfessor segmentations
    to augment word2vec and a logbilinear (LBL) language model (Mnih and
    Hinton, 2007), respectively. Similar to us, they have an additive model of
    * embedding of the word form is the sum of the embeddings of its constits
    * In contrast to us, however, both include the word form itself in the sum.
  * all of the above methods [are] unsupervised
  * Cotterell and Schütze (2015) jointly trained 
    an LBL language model and a morphological tagger (Hajič, 2000) to encourage
* generative models of real vectors common in machine learning. The 
  * explains a set of vectors via latent low-dimensional vectors.
    * simplest of them is probabilistic principal component analysis 
      (Roweis, 1998; Tipping and Bishop, 1999)
      * a generative model of matrix factorization that 
    * Probabilistic canonical correlation analysis (Bach and Jordan, 2005).  
* Figure 2 has the same topology as our graphical model in (Cotterell+ 2015b).
  In that work, the random variables were strings rather than vectors.
  Morphemes were combined into words by concatenating strings 
  * then applying a stochastic edit process (modeling phonology)

#8 Experiments

* three experiments
  1. identify a corpus word 
    that expresses a given set of morphological attributes
  2. use a word’s embedding to predict the words that appear in its context,
     i.e., the skip-gram objective of Mikolov+ (2013a)
  3. use word embeddings to predict human similarity judgments.  
* 5 languages: Czech, English, German, Spanish and Turkish.
* lexicons we use 
  * MorfFlex CZ for Czech (Hajič and Hlaváčová, 2013)
  * CELEX for English and German (Baayen+ 1993) and 
  * Spanish, Turkish: lexicons scraped from Wiktionary (Sylak-Glassman+ 2015)
  * characterized in Table 6: 
* the noun and verb sense of bats are separate types in L

##8.1 Experiment 1: Extrapolation vs. Analogy 6

* uses embeddings for word selection
* task is to identify the unique word i ∈ C 
  that expresses the morphological attributes M i
* we ... choose the most similar unsmoothed word by cosine distance

##8.2 Experiment 2: Held-Out Evaluation 8

* evaluate the smoothed and extrapolated representations
* [whether] our approach improves the embeddings of the entire vocabulary, 
  as if we had seen more evidence
* cannot simply compare our smoothed vectors to “gold” vectors trained on much
  more data, since two different runs of word2vec [are] incomparable
* downstream task [with wide application]: 
  * the word2vec skip-gram objective on held-out data—
    as one would evaluate a language model

##8.3 Experiment 3: Word Similarity 9

* using the WS-353 data set (Finkelstein+ 2001), 
  translated into Spanish (Hassan & Mihalcea, 2009) and German (Leviant, 2016).
* Since in each language every word in the WS-353 set is in fact a lemma, 
  we use the _latent_ embedding our GGM learns in the experiment.
  [which] takes information from every element in the paradigm, e.g., _bebemos_
  rather than the embedding e.g. for the sp infinitival form _beber_
* In essence, our approach embeds a lemma as the average of all [infled forms]
  after “correcting” those forms by subtracting off their other morphemes

#9 Conclusion and Future Work 9

* Future work will consider the role of 
  * derivational morphology in embeddings as well as 
  * noncompositional cases of inflectional morphology.
