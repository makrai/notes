DistilBERT, a distilled version of BERT: smaller, faster, cheaper and lighter
Victor Sanh, Lysandre Debut, Julien Chaumond, Thomas Wolf
NeurIPS 2019 5th Workshop on Energy Efficient ML and Cog Comp arXiv:1910.01108

Comments:   February 2020 Revision: fix bug in evaluation metrics, updated
metrics, argumentation unchanged

weights available along with the training code in the Transformers 2 library
from HuggingFace [Wolf+ 2019].

# Abstract

* operating [ large-scale pre-trained models ] in on-the-edge and/or under
  constrained computational training or inference budgets remains challenging.
* we propose a method to 
  * pre-train a smaller general-purpose language repr
  * can then be fine-tuned with good performances on a wide range of tasks like
* most prior work investigated distillation for building task-specific models,
* reduce the size of a BERT model by 40%, while retaining 97% of its capability
  * 60% faster.  To leverage the inductive biases learned by larger models
* triple loss combining language modeling, distillation and cosine-distance los
  * ablation studies indicate that all the components of the triple loss are
    important for best performances.
* we demonstrate its capabilities for on-device computations in a
  proof-of-concept experiment and a comparative on-device study.  

# Intro

* Transfer Learning approaches in NLP with large-scale pre-trained LMs is basic
  [Devlin+ 2018, Radford+ 2019, Liu+ 2019]
  * several hundred million parameters and current research 1 on pre-trained
  * even larger models still leads to better performances on downstream tasks.
* concerns. First is the 
  * environmental cost of exponentially scal Schwartz+ [2019], Strubell+ [2019]
  * on-device in real-time has the potential to enable novel and interesting
* we show that it is possible to reach similar performances on many downstream
  * models pre-trained with knowledge distillation, resulting in models that
  * our compressed models are small enough to run on the edge, e.g. on mobile
