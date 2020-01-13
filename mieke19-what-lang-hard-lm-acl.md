Sebastian J. Mielke, Ryan Cotterell, Kyle Gorman, Brian Roark, Jason Eisner
What Kind of Language Is Hard to Language-Model?  

# Abstract

* Cotterell+ (2018) ... observed that RNN language models do not perform
  equally well over all the high-resource European languages in Europarl
  * inflectional morphology may be the primary culprit for the discrepancy (no)
* we extend these earlier experiments to cover 
  69 languages from 13 language families using a multilingual Bible corpus.
  * Methodologically, we introduce a new paired-sample multiplicative
    mixed-effects model to obtain language difficulty coefficients from
    at-least-pairwise parallel corpora
  * “translationese” is not any easier to model than natively written language
  * we ... fail to reproduce our earlier (Cotterell+ 2018) observation about
    morphological complexity and instead reveal 
    * far simpler statistics of the data ... drive complexity
