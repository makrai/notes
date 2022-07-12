What Happens To BERT Embeddings During Fine-tuning?
Amil Merchant, Elahe Rahimtoroghi, Ellie Pavlick, Ian Tenney
BlackboxNLP | EMNLP 2020

# Abstract

* much recent work has examined how linguistic information is encoded in
  pre-trained sentence representations
* hE how these models change when adapted to solve downstream tasks
* we investigate how fine-tuning affects the representations of the BERT model
  * Using a suite of analysis techniques
  * supervised probing, unsupervised similarity analysis, and layer-based ablat
* We find that while fine-tuning necessarily makes some significant changes,
  * no catastrophic forgetting of linguistic phenomena. Instead
  * fine-tuning is a conservative process that
    primarily affects the top layers of BERT, albeit with
    noteworthy variation across tasks, eg
    * dependency parsing reconfigures most of the model, whereas
    * SQuAD and MNLI involve much shallower processing
  * fine-tuning has a weaker effect on representations of out-of-domain sents,
    => room for improvement in model generalization
