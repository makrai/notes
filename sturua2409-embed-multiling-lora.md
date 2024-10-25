jina-embeddings-v3: Multilingual Embeddings With Task LoRA
Saba Sturua, Isabelle Mohr, Mohammad Kalim Akram, Michael Günther, Bo Wang,
  Markus Krimmel, Feng Wang, G Mastrapas, A Koukounas, Nan Wang, Han Xiao
arXiv:2409.10173 [cs.CL]

* jina-embeddings-v3, a novel text embedding model with 570 million params,
  * SOTA performance on multilingual data and long-context retrieval tasks,
  * context lengths of up to 8192 tokens
* model includes a set of task-specific Low-Rank Adaptation (LoRA) adapters to
  generate high-quality embeddings 
* tasks: query-document retrieval, clustering, classification, and text
  matching. 
* Evaluation on the MTEB benchmark shows that jina-embeddings-v3 
  * outperforms the latest proprietary embeddings from OpenAI and Cohere on
    English tasks, while achieving 
  * superior performance compared to multilingual-e5-large-instruct
    across all multilingual tasks
* default output dimension of 1024, 
  * users can flexibly reduce the dimensions to as low as 32 without
    compromising performance, enabled by Matryoshka Representation Learning
