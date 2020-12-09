Probing Natural Language Inference Models through Semantic Fragments
Kyle Richardson, Hai Hu, Lawrence S. Moss, Ashish Sabharwal
arXiv:1909.07521 [cs.CL]

# Abstract

* abilities such as boolean coordination, quantification, conditionals,
  comparatives, and monotonicity reasoning (i.e., about word subst in sentence)
* unclear the extent to which they are captured in existing NLI benchmarks
* we propose the use of semantic fragments---systematically generated datasets
  that each target a different semantic phenomenon---for probing, and
* experiments, using a library of 8 such semantic fragments, reveal 
* two remarkable findings: 
  * SOTA models, including BERT, that are pre-trained on existing NLI benchmark
    perform poorly on these new fragments
  * with only a few minutes of additional fine-tuning---
    * with a carefully selected learning rate and 
      a novel variation of "inoculation"---a BERT-based model 
    * can master all of these logic and monotonicity fragments while 
      retaining its performance on established NLI benchmarks. 

# 1 Introduction

* Natural language inference (NLI) is the task of detecting inferential
  * determine whether that the second sentence, known as the hypothesis
    sentence, follows from the meaning of the first sentence (the premise)
  * involve a wide range of reasoning and knowledge phenomena, including
    knowledge that goes beyond basic linguistic understanding (e.g., elementary
    logic)
* large-scale NLI datasets, such as the 
  * Stanford Natural Language Inference datasets (SNLI, Bowman+ 2015) and
  * MultiNLI (MNLI, Williams, Nangia, and Bowman 2018), coupled with new
* advances in neural modeling and model pre-training 
  (Conneau+ 2017; Devlin+ 2019). With these performance increases has come
* increased scrutiny {critical examination} of systematic annotation biases in
  (Poliak+ 2018b; Gururangan+ 2018), as well as 
* attempts to build new benchmarks that focus on particular linguistic phenomena
  (Glockner, Shwartz, and Goldberg 2018; Naik+ 2018; Poliak+ 2018a). The latter
  * questions such as: are models able to effectively learn and extrapolate
    complex knowledge and reasoning abilities when trained on benchmark tasks?  
* challenge datasets have largely been limited by the simple types of inferences
  that they included (e.g., lexical and negation inferences). They 
  * fail to cover more complex reasoning phenomena related to logic, and
    primarily use adversarially generated corpus data, which sometimes makes it
* a focus on datasets that are easily constructed and/or verified using crowdsrc
  * requires datasets that are hard even for humans, but that are nonetheless
    based on sound formal principles (e.g., reasoning about monotonicity where,
    several nested downward monotone contexts are involved
    * compositionality, cf.  Lake and Baroni (2017)) 
* we propose using semantic fragments—
  * synthetically generated challenge datasets, of the sort used in linguistics,
* we look at eight types of fragments that cover several fundamental aspects of
  * monotonicity reasoning using two newly constructed challenge datasets as
  * six other fragments that probe into rudimentary logic using new versions of
    the data from Salvatore, Finger, and Hirata Jr (2019).  
* our proposed method works in the following way: As illustrated in Figure 1
  * create a formal specification (or a formal rule system with guarantees)
  * automatically generate a new idealized challenge dataset, and ask the
  * three empirical questions.
    * Is this fragment learnable from scratch using existing NLI architectures
      (if so, are the resulting models useful)?
    * How well do large SOTA pre-trained NLI models do on this task?
      (i.e., models trained on all known NLI data such as SNLI/MNLI) 
    * Can existing models be quickly re-trained or re-purposed to be robust on
      these fragments 
      * if so, does mastering the fragment affect performance on the original t?  
* are there particular linguistic fragments  that are hard for these pre-trained
  models to adapt to or that confuse the model on its original task?  
* On these eight fragments, we find that while existing NLI architectures can
  effectively learn these particular linguistic pheneomena, pre-trained NLI
  models do not perform well. This, as in other studies (Glockner, Shwartz, and
  Goldberg 2018), reveals weaknesses in the ability of these models to
  generalize. While most studies into linguistic probing end the story there, we
  take the additional step to see if attempts to 
* can continuing the learning and re-fine-tuning these models on fragments
  (using a novel and cheap inoculation (Liu, Schwartz, and Smith 2019) strategy)
  improve performance?
  * mixed results depending on the particular linguistic phenomena and model
    * e.g. comparatives), re-training some models comes at the cost of degrading
      performance on the original tasks, whereas for other phenomena (
    * e.g., monotonicity) the learning is more stable, even across models.
