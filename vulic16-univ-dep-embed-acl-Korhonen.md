Ivan Vulić and Anna Korhonen
Is “Universal Syntax” Universally Useful for Learning Distributed Word Reprs?
ACL 2016

# 1 Intro

* DEPS-based embeddings outperform the less informed BOW-based embeddings
  in a variety of similarity tasks
  (Bansal+ 2014; Levy and Goldberg, 2014a; Hill+ 2015; Melamud+ 2016)
* A comparison extending to additional languages is required before any
  cross-lingual generalisations can be drawn
* questions:
  1. Can one usefully replace the DEPS extraction pipeline optimised for
     tools developed for English with a pipeline that relies on language-
     universal syntactic processing (UDEPS)?
     * yes, with only a slight drop in performance
  2. Are UDEPS universally better than BOW for learning distributed word
     representations in other languages?
     * no, as suggested by the performance in Italian and German, which sheds
     * a simple preliminary “post-parsing” selection of useful UDEPS
       contexts leads to consistent improvements across languages, especially
       in detecting functional similarity
* the “universal initiative” ... cross-lingual and multilingual learning (e.g.,
  multilingual parser development, typologies)
  * Berg-Kirkpatrick and Klein, ACL 2010
    Phylogenetic grammar induction
  * McDonald+ EMNLP 2011
    Multi-source transfer of delexicalized dependency parsers
  * Cohen+ 2011 EMNLP
    Unsupervised structure prediction with nonparallel multilingual guidance
  * Naseem+ ACL 2012
    Selective sharing for multilingual dependency parsing


# 2 Methodology

* simple post-hoc intervention into the UDEPS context extraction
  * arc collapsing from prior work (Levy and Goldberg, 2014a; Melamud+ 2016)


# 4 Results and discussion

* verb similarity is indeed
  * a difficult problem _in English_ as evidenced by
    lower correlation scores on SimLex [our Fig and Schwartz+ (2015)]
    * Roy Schwartz, Roi Reichart, and Ari Rappoport. CoNLL 2015
      Symmetric pattern based word embeddings for improved word similarity pred
  * apparently easier to model in Italian (Fig. 2(c)), and
  * a real challenge in German
