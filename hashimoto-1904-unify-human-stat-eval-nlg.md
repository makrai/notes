Unifying Human and Statistical Evaluation for Natural Language Generation
Tatsunori B. Hashimoto, Hugh Zhang, Percy Liang
NAACL arXiv:1904.02792 [cs.CL]

* How can we measure whether an NLG system is both high quality and diverse
* Human evaluation captures quality but not diversity, as it does
  * not catch models that simply plagiarize from the training set. On the other
* statistical evaluation (i.e., perplexity) captures diversity but not quality,
* we propose a unified framework which evaluates both diversity and quality,
  based on the optimal error rate of predicting whether a sentence is human/mach
  * this error rate can be efficiently estimated by combining human and
    statistical evaluation, using an evaluation metric which we call HUSE
* On summarization and chit-chat dialogue, we show that
  * HUSE detects diversity defects which fool pure human evaluation and that
  * techniques such as annealing for improving quality actually decrease HUSE
    due to decreased diversity
