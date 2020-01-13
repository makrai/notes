
SemEval-2018 Hypernym Discovery

# Introduction and Motivation from the task site

* Hypernymy 
  * contributes to improvements in 
    * Question Answering applications (Prager et al. 2008; Yahya et al. 2013) and
    * Textual Entailment or Semantic Search systems 
      (Hoffart et al 2014; Roller and Erk 2016)
  * [is] the backbone of almost any ontology, semantic network and taxonomy 
    (Yu et al. 2015; Wang et al. 2017)
  * [taxonomy is useful] resource for 
    web retrieval, website navigation or records management (Bordea et al 2015)

# What is New?

* Traditionally [evaluated in] Taxonomy Evaluation 
  (e.g.  SemEval-2015 task 17, SemEval-2016 task 13)
* the binary task [of Hypernym Detection] led to criticisms regarding its
  alleged oversimplification (Levy et al 2015; Santus et al 2016; Shwartz et al
  2017; Camacho-Collados et al 2017).
* we
  * Inspired by recent work (Espinosa-Anke et al 2016) 
  * reformulate the problem as Hypernym Discovery, i.e. 
    * given the 
      * search space of a domain’s vocabulary, and given an 
      * input concept, 
    * discover its best (set of) candidate hypernyms. In addition to making the
  * more realistic in terms of actual downstream applications, this novel
  * opens up complementary evaluation procedures by enabling, for instance,
    Information Retrieval evaluation metrics (click on the
    Participate/Evaluation tab for detailed information).
* In short:
  * General-Purpose Hypernym Discovery on three languages
    (English, Spanish, Italian)
  * Domain-Specific Hypernym Discovery on two domains (Medicine, Music)
