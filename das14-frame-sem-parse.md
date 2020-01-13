Frame-Semantic Parsing
Dipanjan Das ∗ Desai Chen ∗∗ André F. T. Martins † Nathan Schneider ‡ Noah A. Smith §
2014 Computational Linguistics

We have released our frame-semantic parser as open-source software.

# Abstract 

* Frame semantics is a linguistic theory that has been instantiated for English
  in the FrameNet lexicon. 
* We solve the problem of frame-semantic parsing using a 
  * two-stage statistical model that takes lexical targets (i.e., content words
    and phrases) in their sentential contexts and predicts frame-semantic
    structures
    1. disambiguates it to a semantic frame. This model uses latent variables
       and semi-supervised learning to improve frame disambiguation for targets
       unseen at training time
    2. finds the target’s locally expressed semantic arguments. 
      * At inference time, a fast exact dual decomposition algorithm
        collectively predicts all the arguments of a frame at once in order to
        respect declaratively stated linguistic constraints, resulting in
        qualitatively better structures than naı̈ve local predictors.  
    * Both components are feature-based and discriminatively trained on a small
      set of annotated frame-semantic parses. 
* experiments 
  * On the SemEval 2007 benchmark data set, 
    * [this] approach, along with a heuristic identifier of frame-evoking
      targets, 
    * outperforms the prior state of the art by significant margins.
  * on the much larger FrameNet 1.5 data set.  
