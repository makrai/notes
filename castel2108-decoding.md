How Optimal is Greedy Decoding for Extractive Question Answering?
O Castel, O Ram, A Efrat, O Levy
arXiv preprint arXiv:2108.05857

# Abstract

* this approach does not ensure that the answer is a span in the given passage,
  nor does it guarantee that it is the most probable one
* we present exact-extract, a decoding algorithm that
  * finds the most probable answer span in the context
  * We compare the performance of T5 with both decoding algorithms on zero-shot
    and few-shot extractive question answering
    * When no training examples are available, exact-extract significantly
      outperforms greedy decoding
    * greedy decoding quickly converges towards the performance of exact-extract
      with the introduction of a few training examples, becoming more extractive
      and increasingly likelier to generate the most probable span
* self-supervised training can bias the model towards extractive behavior,
  increasing performance in the zero-shot setting without resorting to annotated
  examples
