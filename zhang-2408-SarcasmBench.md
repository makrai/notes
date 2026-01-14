SarcasmBench: Towards Evaluating Large Language Models on Sarcasm Understanding
        Yazhou Zhang, Chunwang Zou, Zheng Lian, Prayag Tiwari, Jing Qin
                            arXiv:2408.11319 [cs.CL]

* LLMs: the task of ``System I''~-~the fast, unconscious, and intuitive tasks,
  e.g., sentiment analysis, text classification, etc., have been argued to be
  successfully solved. However, 
* sarcasm, as a subtle linguistic phenomenon, often employs 
* rhetorical devices like hyperbole and figuration to convey true sentiments
* we select eleven SOTA LLMs and eight SOTA pre-trained language models (PLMs)
  * comprehensive evaluations on six widely used benchmark datasets through
  * different prompting approaches
    * zero-shot input/output (IO) prompting
    * few-shot IO prompting
    * chain of thought (CoT) prompting. Our results highlight three key
* findings: 
  * LLMs underperform supervised PLMs based sarcasm detection baselines
    across six sarcasm benchmarks. This suggests that significant efforts are
  * GPT-4 consistently and significantly outperforms other LLMs
    across various prompting methods, with an 
    * average improvement of 14.0%↑.
    * Claude 3 and ChatGPT demonstrate the next best performance after GPT-4. 
  * Few-shot IO prompting method outperforms zero-shot IO and few-shot CoT.
    bec sarcasm detection, being a holistic, intuitive, and non-rational
    cognitive process, is argued 
    not to adhere to step-by-step logical reasoning, making CoT less effective
    * compared to its effectiveness in mathematical reasoning tasks
