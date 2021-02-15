BART: Denoising Sequence-to-Sequence Pre-training
  for Natural Language Generation, Translation, and Comprehension
M Lewis, Y Liu, N Goyal, M Ghazvininejad, Mohamed, Levy, Stoyanov, Zettlemoyer
arXiv:1910.13461 [cs.CL]

# Abstract

* BART, a denoising autoencoder for pretraining sequence-to-sequence models
  * trained by corrupting text with an arbitrary noising function, and 
    learning a model to reconstruct the original text
  * standard Tranformer-based neural machine translation architecture which,
    * can be seen as generalizing
      BERT (due to the bidirectional encoder),
      GPT (with the left-to-right decoder), and
      many other more recent pretraining schemes
* noising approaches
  * We evaluate many
  * best performance by both 
    * randomly shuffling the order of the sentences and
    * novel in-filling scheme: spans of text are replaced with a single mask tok
* particularly effective when fine tuned for text generation but also
  * works well for comprehension tasks
  * matches the performance of RoBERTa on GLUE and SQuAD
  * new SOTA results on a range of abstractive dialogue, QA, and summarization
  * 1.1 BLEU increase over a back-translation system for machine translation,
    with only target language pretraining
* ablation experiments that
  replicate other pretraining schemes within the BART framework
