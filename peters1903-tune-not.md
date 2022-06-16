To Tune or Not to Tune? Adapting Pretrained Representations to Diverse Tasks
Matthew E. Peters, Sebastian Ruder, Noah A. Smith
reprl4nlp arXiv:1903.05987 [cs.CL]

* how to best adapt the pretrained model to a given target task
* two most common forms of adaptation,
  feature extraction (where the pretrained weights are frozen), and
  directly fine-tuning the pretrained model
* empirical results across diverse NLP tasks with two SOTA models show that
  the relative performance of fine-tuning vs feature extraction depends on the
  similarity of the pretraining and target tasks
* We explore possible explanations for this finding and
  provide a set of adaptation guidelines for the NLP practitioner 
  
# 1 Intro

* Introduction Sequential inductive transfer learning (Pan and Yang, 2010)
  consists of two stages:
  * pretraining, in which the model learns a general-purpose representation of
  * adaptation, in which the representation is transferred to a new task
* in the adaptation phase. There are two main paradigms for adaptation:
  feature extraction and fine-tuning
  * feature extraction ( ) the model’s weights are ‘frozen’ and the pretrained
    representations are used in a downstream model similar to classic
    feature-based approaches (Koehn+ 2003).
    * enables use of task-specific model architectures and may be
    * computationally cheaper as features only need to be computed once. On the
  * pretrained model’s parameters can be unfrozen and fine-tuned ( ) on a new
    task (Dai and Le, 2015)
    * convenient as it may allow us to adapt a general-purpose representation
      to many different tasks.
* Gaining a better understanding of the adaptation phase is key in making the
  * we compare two SOTA pretrained models, ELMo (Peters+ 2018) and BERT
  * seven diverse tasks including named entity recognition, natural language
    inference (NLI), and paraphrase detection
  * characterize
    * conditions under which one approach substantially outperforms the other,
      * comparable performance in most cases, except when the source and target
        tasks are either highly similar or highly dissimilar
    * whether it is dependent on the pretraining objective or target task
* We furthermore shed light on the practical challenges of adaptation and
  provide a set of guidelines to the NLP practitioner, as summarized in Table 1
