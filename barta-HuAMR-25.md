* Abstract

* We present 
  * HuAMR, the first Abstract Meaning Representation (AMR) dataset and 
  * a suite of large language model-based AMR parsers for Hungarian, targeting
* To create HuAMR, we employed Llama-3.1-70B to automatically generate
  silver-standard AMR annotations, which we then refined manually to ensure
  quality. Building on this dataset, 
* we investigate how different 
  * model architectures — mT5 Large and Llama3.2-1B — and 
  * fine-tuning strategies affect AMR parsing performance.
* incorporating silver-standard AMRs from Llama-3.1-70B into the training data
  of smaller models does not consistently boost overall scores, our results
* these techniques effectively enhance parsing accuracy on Hungarian news data
  (the domain of HuAMR). We evaluate our parsers using 
* Smatch scores and confirm the potential of HuAMR and our parsers for
  advancing semantic parsing research.
