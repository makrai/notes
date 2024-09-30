On the Multilingual Capabilities of Very Large-Scale English Language Models
Jordi Armengol-Estapé, Ona de Gibert Bonet, Maite Melero
arXiv:2108.13349 [cs.CL]

* Generative Pre-trained Transformers (GPTs) have recently been scaled to
  * solely trained on the language modeling objective, have been shown to
  * outstanding few-shot learning capabilities in a number of different tasks.
  * little is known regarding their multilingual capabilities, given the fact
    * the pre-training corpus is almost entirely composed of English text.  In
* we investigate the multilingual skills of GPT-3, focusing on Catalan, which
  * outstanding performance, particularly in generative tasks, with predictable
    limitations mostly in language understanding tasks but still with
    remarkable results given the zero-shot scenario
  * We investigate its potential and limits in
    * extractive question-answering and natural language generation, as well as
    * effect of scale in terms of model size.

# 1 Intro

* GPT-3 training data: generally of good quality, it has not been filtered for
  language (in purpose)
  * training data contains many other languages,
    * https://github.com/openai/gpt-3/tree/master/dataset_statistics
  even if they account for a small portion of the dataset in comparison to
  English (93% by word count). Intuitively, one would expect that this
  quantity would not be enough to obtain a high-quality language model in these
  other languages, especially in the low-resource ones. Some evidence in this
  * much data required to train language-specific BERTs (Nozza+ 2020) Even the
    multilingual ones 2 such as mBERT (Devlin+ 2018) or XLM-R (Conneau+ 2019)
    employ large multilingual datasets based on Wikipedia or CommonCrawl. A
  * Catalan model trained with around 1.7B tokens (Armengol-Estapé+ 2021), but

# 6 Conclusion

* GPT-3 does, indeed, exhibit remarkable zero-shot NLU and NLG in Catalan. This
* hE the needed model scale and sub optimal tokenization make it less
  computationally efficient than for English. On the overall, this is a very
  interesting exercise of how linguistic structures (universals) transfer
  across languages. Given the large amount of tasks GPT-3 has been implicitly
  exposed to during the training procedure, handling a different language can
* future work: extending the study of the scaling laws of LMs (Kaplan+ 2020) in
  terms of cross-lingual transfer
  * similarly to Hernandez+ (2021).
  * Danny Hernandez, Jared Kaplan, Tom Henighan, and Sam McCandlish. 2021.
    Scaling laws for transfer.  CoRR, abs/2102.01293.
