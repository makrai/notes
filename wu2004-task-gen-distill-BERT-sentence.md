Towards Non-task-specific Distillation of BERT
  via Sentence Representation Approximation
Bowen Wu, Huan Zhang, Mengyuan Li, Zongsheng Wang, Qihang Feng, Junhong Huang,
  Baoxun Wang
arXiv:2004.03097 [cs.CL]

# A bstract

* online deployment of BERT is often blocked by its large-scale parameters
* knowledge distillation is efficient in transferring the knowledge from BERT
  * plenty of studies
  * hE mainly focus on task-specified distillation
    * loss of the general semantic knowledge of BERT for universal-usability
* we propose a sentence representation approximating oriented distillation
  * distill the pre-trained BERT into a simple LSTM based model
  * without specifying tasks
  * transfer learning via fine-tuning to adapt to any sentence-level task
  * can further cooperate with task-specific distillation procedures
* experimental results on multiple NLP tasks from the GLUE benchmark show that
  * outperforms
    * other task-specific distillation methods or even
    * much larger models, i.e., ELMO, with efficiency improved
