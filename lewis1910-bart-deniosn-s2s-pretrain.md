BART: Denoising Sequence-to-Sequence Pre-training 
  for Natural Language Generation, Translation, and Comprehension
M Lewis, Y Liu, N Goyal, M Ghazvininejad, Mohamed, Levy, Stoyanov, Zettlemoyer

# Abstract

* BART, a denoising autoencoder for pretraining sequence-to-sequence models.
  * trained by (1) corrupting text with an arbitrary noising function, and (2)
    learning a model to reconstruct the original text. It uses a 
  * standard Tranformer-based neural machine translation architecture which,
    * can be seen as generalizing
      BERT (due to the bidirectional encoder), 
      GPT (with the left-to-right decoder), and 
      many other more recent pretraining schemes. 
* We evaluate a number of noising approaches, finding the 
  best performance by both randomly shuffling the order of the sentences and using a 
  novel in-filling scheme, where spans of text are replaced with a single mask
  token.  BART is 
* particularly effective when fine tuned for text generation but also 
  * works well for comprehension tasks. It 
  * matches the performance of RoBERTa on GLUE and SQuAD, achieves 
  * new SOTA results on a range of abstractive dialogue, QA, and summarization
  * 1.1 BLEU increase over a back-translation system for machine translation,
    with only target language pretraining. We also report 
* ablation experiments that 
  replicate other pretraining schemes within the BART framework
