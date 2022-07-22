Self-Supervised Meta-Learning for Few-Shot Natural Language Classification Tasks
Trapit Bansal, Rishikesh Jha, Tsendsuren Munkhdalai, Andrew McCallum
EMNLP 2020 arXiv:2009.08445 [cs.CL]

* Self-supervised pre-training of transformer models has revolutionized NLP
* hE, fine-tuning is still data inefficient -- when there are few labeled
* can be improved by
  optimizing pre-training directly for future fine-tuning with few examples;
* can be treated as a meta-learning problem
* hE standard meta-learning techniques require many training tasks
  in order to generalize; unfortunately, finding a diverse set of such
* This paper proposes a self-supervised approach to
  generate a large, rich, meta-learning task distribution from unlabeled text.
  * achieved using a cloze-style objective, but
    creating separate multi-class classification tasks by gathering
    tokens-to-be blanked from among only a handful of vocabulary terms. This
  * yields as many unique meta-training tasks as the number of subsets of
    vocabulary terms
  * We meta-train a transformer model on this distribution of tasks using a
    recent meta-learning framework
* On 17 NLP tasks, we show that this meta-training leads to better few-shot
  generalization than language-model pre-training followed by finetuning.
  * self-supervised tasks can be combined with supervised tasks for
    meta-learning, providing substantial accuracy gains over previous
    supervised meta-learning. 
