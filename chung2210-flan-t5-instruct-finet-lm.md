Scaling Instruction-Finetuned Language Models
HW Chung, L Hou, S Longpre, B Zoph, Y Tay, W Fedus, Y Li, X Wang, M Dehghani,
  S Brahma, A Webson, S Shane Gu, Z Dai, M Suzgun, X Chen, A Chowdhery, et al
arXiv:2210.11416 [cs.LG]

* Finetuning LMs on a collection of datasets phrased as instructions has been
  shown to improve model performance and generalization to unseen tasks. In
* we explore instruction finetuning with a particular focus on 
  * scaling the number of tasks, 
  * scaling the model size, and 
  * finetuning on chain-of-thought data. We find that instruction finetuning
* dramatically improves performance on a variety of
  * model classes (PaLM, T5, U-PaLM)
  * prompting setups (zero-shot, few-shot, CoT)
  * evaluation benchmarks (MMLU, BBH, TyDiQA, MGSM, open-ended generation). For
* eg Flan-PaLM 540B instruction-finetuned on 1.8K tasks
  outperforms PALM 540B by a large margin (+9.4% on average)
  * Flan-PaLM 540B achieves SOTA performance on several benchmarks, such as
    75.2% on five-shot MMLU. We also publicly release Flan-T5 checkpoints,
  * strong few-shot performance even compared to much larger models eg PaLM 62B
