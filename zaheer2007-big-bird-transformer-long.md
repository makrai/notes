Big Bird: Transformers for Longer Sequences
Manzil Zaheer, Guru Guruganesh, Avinava Dubey, Joshua Ainslie, Chris Alberti,
  Santiago Ontanon, Philip Pham, Anirudh Ravula, Qifan Wang, Li Yang, Amr Ahmed
arXiv:2007.14062 [cs.LG]

# Abstract

* BERT's limitations is the quadratic dependency (mainly in terms of memory) on
  the sequence length due to their full attention mechanism
* we propose, BigBird,
  * a sparse attention mechanism that reduces this to linear
  * universal approximator of sequence functions and Turing complete,
  * O(1) global tokens (such as CLS), that attend to the entire sequence
  * can handle sequences of length up to 8x of what was previously possible
  * drastically improves performance on question answering and summarization
  * novel applications to genomics data

## 4.1 Encoder-Decoder Tasks

### Summarization

* We used Arxiv [20] PubMed [20] BigPatent datasets for testing our model
* we focus on abstractive summarization of long documents 
  where using a longer contextual encoder should improve performance. The
  reasons are two fold:
  * salient content can be evenly distributed in the long document
    * by design in the BigPatents dataset [78]
  * a richer discourse structure and summaries are considerably more abstractive
* we warm start from 
  * our general purpose MLM pretraining on base-sized models as well as
  * SOTA summarization specific pretraining from Pegasus [107] on large-sized
* significant improvement.  Along with hyperparameters, we also present 
* results on shorter but more widespread datasets in App. E.5, which show that
  using sparse attention does not hamper performance either
