Alexander Panchenko
Best of Both Worlds: Making Word Sense Embeddings Interpretable
2016 lrec

http://tudarmstadt-lt.github.io/vec2synset

# Abstract

* interpretability of sense vectors by mapping them to synsets of a lexical
resource. Our 
* experiments with AdaGram sense embeddings and BabelNet synsets show that it
  is possible to retrieve synsets that correspond to automatically learned
  sense vectors with Precision of 0.87, Recall of 0.42 and AUC of 0.78

# 1 Intro

* ”classical” models
  * vector-based (Baroni and Lenci, 2010) and 
  * symbolic (Biemann and Riedl, 2013) distributional 
    * Biemann, C. and Riedl, M. (2013). 
    * Text: Now in 2D! 
      * a framework for lexical expansion with contextual similarity. 
    * Journal of Language Modelling, 1(1):55–95

# 2 Related Work

* BabelNet and UBY (Gurevych et al., 2012)
* McCarthy et al. (2004)
  * define a method to find the dominant sense of a word with respect to a text
    collection, in order to inform the most frequent sense baseline in WSD
* compute embeddings directly on knowledge bases 
  * Bordes et al. (2011) and Camacho-Collados et al. (2015). 
* Rothe and Schütze (2015) 
  * obtain synset representations in the embeddings space
  * [use] un-disambiguated embeddings

# 3 Two Worlds of Lexical Semantics

# 3.2 AdaGram

* Tian et al. (2014) assumes a fixed number of senses for all words,
* α was set to 0.05, yielding 4.2 senses per word in average,

# 3.3 Comparison of AdaGram and BabelNet Word Sense Inventories

* There are often considerably more BabelNet senses than AdaGram senses

# 4. Linking Embeddings to Synsets

# 5. Evaluation

# 6. Results

# 7. Conclusion
