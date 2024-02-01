Mistral 7B
AQ Jiang, A Sablayrolles, A Mensch, C Bamford, D Singh Chaplot, D de las Casas,
  F Bressand, G Lengyel, G Lample, L Saulnier, L Renard Lavaud, et al
arXiv:2310.06825 [cs.CL]

* We introduce Mistral 7B v0.1, a 7-billion-parameter language model engineered
* outperforms 
  * Llama 2 13B across all evaluated benchmarks, and 
  * Llama 1 34B in reasoning, mathematics, and code generation
* Our model leverages 
  * grouped-query attention (GQA) for faster inference, coupled with 
  * sliding window attention (SWA)
    to effec handle sequences of arbitrary length with a reduced inference cost
* a model fine-tuned to follow instructions, Mistral 7B -- Instruct, that
  * surpasses the Llama 2 13B -- Chat model both on human and automated
    benchmarks
* released under the Apache 2.0 license
