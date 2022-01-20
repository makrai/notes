Handling Divergent Reference Texts when Evaluating Table-to-Text Generation
Bhuwan Dhingra, Manaal Faruqui, Ankur Parikh, Ming-Wei Chang, Dipanjan Das, William W. Cohen
ACL 2019 arXiv:1906.01081 [cs.CL]

* Automatically constructed datasets for generating text from semi-structured
  data (tables), such as WikiBio, often contain
  reference texts that diverge from the information in the table
  * metrics which rely solely on the reference texts, such as BLEU and ROUGE,
    show poor correlation with human judgments when those references diverge.
* We propose a new metric, PARENT, which
  aligns n-grams from the reference and generated texts to the semi-structured
  data before computing their precision and recall. Through a
  * large scale human evaluation study of table-to-text models for WikiBio, we
  * PARENT correlates with human judgments better than existing text gen metrics
  * We also adapt and evaluate the information extraction based evaluation
    proposed by Wiseman+ (2017), and show that
    * PARENT has comparable correlation to it, while being easier to use.  We
  * also applicable when the reference texts are elicited from humans using the
    data from the WebNLG challenge.
