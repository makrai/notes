Probing Natural Language Inference Models through Semantic Fragments
Kyle Richardson, Hai Hu, Lawrence S. Moss, Ashish Sabharwal
arXiv:1909.07521 [cs.CL]

# Abstract

* abilities such as boolean coordination, quantification, conditionals,
  comparatives, and monotonicity reasoning (i.e., about word subst in sentence)
* unclear the extent to which they are captured in existing NLI benchmarks and
* we propose the use of semantic fragments---systematically generated datasets
  that each target a different semantic phenomenon---for probing, and
* experiments, using a library of 8 such semantic fragments, reveal 
* two remarkable findings: 
  * SOTA models, including BERT, that are pre-trained on existing NLI benchmark
    perform poorly on these new fragments
  * with only a few minutes of additional fine-tuning---
    * with a carefully selected learning rate and 
      a novel variation of "inoculation"---a BERT-based model 
    * can master all of these logic and monotonicity fragments while 
      retaining its performance on established NLI benchmarks. 
