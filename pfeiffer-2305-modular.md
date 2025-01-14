Modular Deep Learning
Jonas Pfeiffer, Sebastian Ruder, Ivan Vulić, Edoardo Maria Ponti
arXiv:2302.11529 [cs.LG]

* Transfer learning has recently become the dominant paradigm of ML
  * Pre-trained models fine-tuned for downstream tasks achieve better performance
    with fewer labelled examples
* hE unclear how to develop models that
  * specialise towards multiple tasks without incurring negative interference and
  * generalise systematically to non-identically distributed tasks
* Modular deep learning has emerged as a promising solution to these
  * units of computation are often implemented as
    autonomous parameter-efficient modules
  * Information is conditionally routed to a subset of modules and
    subsequently aggregated
* modules enable positive transfer and systematic generalisation by
  * separating computation from routing and updating modules locally
* We: a survey of modular architectures
  * unified view over several threads of research that evolved independently
  * various additional purposes of modularity, including
    scaling language models, causal inference, programme induction, and
    planning in reinforcement learning
  * applications where modularity has been successfully deployed
    * eg cross-lingual and cross-modal knowledge transfer
  * [Related talks and projects](https://www.modulardeeplearning.com/)
