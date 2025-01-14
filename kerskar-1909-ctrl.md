CTRL -- A Conditional Transformer Language Model for Controllable Generation
Keskar, N Shirish and McCann, B and Varshney, L and Xiong, C and Socher, R
arXiv preprint arXiv:1909.05858

* control the generation process
* condition on control codes that specify domain, subdomain, entities,
  relationships between entities, dates, and task-specific behavior
* 1.6 billion-parameters

Blog link:
https://blog.einstein.ai/introducing-a-conditional-transformer-language-model-for-controllable-generation/

* two models are available for download: with a sequence length of 256 and 512
  * word-level vocabularies and through a sliding window approach
  * generate well beyond their trained sequence lengths
* Source attribution -- given a prompt, prints the perplexity of the prompt
  conditional on each domain control code (see Section 5 of the paper)
