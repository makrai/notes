TaxoLLaMA: WordNet-based Model for Solving Multiple Lexical Semantic Tasks
Viktor Moskvoretskii, Ekaterina Neminova, A Lobanova, A Panchenko, I Nikishina
ACL Main 2024, 18 pages, 8 figures arXiv:2403.09207 [cs.CL]

All datasets, code, and model are available online at this https URL

* we explore the capabilities of LLMs in capturing lexical-semantic knowledge
  from WordNet on the example of the LLaMA-2-7b model and
* test on multiple lexical semantic tasks. As the outcome of our experiments,
* we present TaxoLLaMA, the everything-in-one model,
  * lightweight due to 4-bit quantization and LoRA. It achieves
  * 11 SotA results, 4 top-2 results out of 16 tasks for the Taxonomy
    Enrichment, Hypernym Discovery, Taxonomy Construction, and Lexical
    Entailment tasks
  * very strong zero-shot performance on Lexical Entailment and Taxonomy
    Construction with no fine-tuning
  * We also explore its hidden multilingual and domain adaptation capabilities
    with a little tuning or few-shot learning
