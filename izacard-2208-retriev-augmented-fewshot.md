Atlas: Few-shot Learning with Retrieval Augmented Language Models
Gautier Izacard, Patrick Lewis, Maria Lomeli, Lucas Hosseini, Fabio Petroni,
  Timo Schick, Jane Dwivedi-Yu, Armand Joulin, Sebastian Riedel, Edouard Grave
arXiv:2208.03299 [cs.CL]

* Large language models have shown impressive few-shot results on many tasks.
  * hE, when knowledge is key for such results
  * eg question answering and fact checking,
  * massive parameter counts to store knowledge seem to be needed.
  * Retrieval augmented models are known to excel at knowledge intensive tasks
    without the need for as many parameters, but it is
    unclear whether they work in few-shot settings
* we present Atlas, a pre-trained retrieval augmented language model
  able to learn knowledge intensive tasks with very few training examples.  We
  * evaluations on a wide range of tasks, including
    MMLU, KILT and NaturalQuestions, and study the
    impact of the content of the document index, showing that
    it can easily be updated.  Notably, Atlas reaches
  * over 42% accuracy on Natural Questions using only 64 examples,
    outperforming a 540B parameters model by 3% despite having 50x fewer params
