Rethinking Embedding Coupling in Pre-trained Language Models
Hyung Won Chung, Thibault Fevry, Henry Tsai, Melvin Johnson, Sebastian Ruder
ICLR 2021 Poster

# Abstract

* We re-evaluate the standard practice of sharing weights between input and
  output embeddings in SOTA pre-trained language models
* We show that decoupled embeddings provide increased modeling flexibility,
  * significantly improve the efficiency of
    parameter allocation in the input embedding of multilingual models
* dramatically better performance on standard NLU tasks
  with the same number of parameters during fine-tuning
* allocating additional capacity to the output embedding provides benefits
  * benefits persist through the fine-tuning stage
    even though the output embedding is discarded after pre-training
* larger output embeddings
  * prevent the model's last layers from overspec to the pre-training task and
  * encourage Transformer representations to be
    more general and more transferable to other tasks and languages
* strong performance on the XTREME benchmark without more params at fine-tuning
