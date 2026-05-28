Transformers are uninterpretable with myopic methods: a case study 
  with bounded Dyck grammars
Kaiyue Wen, Yuchen Li, Bingbin Liu, Andrej Risteski
arXiv:2312.01429 [cs.LG]

* Interpretability methods aim to 
  understand the algorithm implemented by a trained model (eg a Transofmer)
  by examining various aspects of the model, such as 
  eg the weight matrices or the attention patterns. In this work, through 
* we: a combination of 
  theoretical results and carefully controlled experiments on synthetic data, we
  * a critical view of methods that 
    exclusively focus on individual parts of the model, 
    rather than consider the network as a whole
  * a simple synthetic setup of learning a (bounded) Dyck language
* Theoretically, we show that 
  the set of models that (exactly or approximately) solve this task 
  satisfy a structural characterization derived from the pumping lemma. 
  * We use this characterization to show that 
  the set of optima is qualitatively rich; in particular, 
  the attention pattern of a single layer can be ``nearly randomized'', while
  preserving the functionality of the network
* extensive experiments: these constructions are not a theoretical artifact:
  * even after severely constraining the architecture of the model, 
    vastly different solutions can be reached via standard training
* ie interpretability claims based on inspecting individual heads or weight mxs
  can be misleading
