Robust Cross-lingual Hypernymy Detection using Dependency Context
Shyam Upadhyay, Yogarshi Vyas, Marine Carpuat, Dan Roth
naacl 2018

embeddings and datasets https://github.com/yogarshi/bisparse-dep/

#Abstract

* Cross-lingual Hypernymy Detection
  * determining if a word in one language (“fruit”) is a hypernym of 
    a word in another language (“pomme” i.e.  apple in French) 
  * can aid in solving cross-lingual versions of tasks such as 
    textual entailment and event coreference 
* We 
  * propose BiSparse-Dep, a family of unsupervised approaches 
    * learns sparse, bilingual word embeddings based on dependency contexts
    * significantly improve performance 
      compared to approaches based only on lexical context
    * robust, showing promise for low-resource settings
    * can be learned using a parser trained on related languages
  * crowd-source a challenging dataset for this task on four languages –
    Russian, French, Arabic and Chinese
