Do Language Models Use Their Depth Efficiently?
Róbert Csordás, Christopher D. Manning, Christopher Potts
arXiv:2505.13898 [cs.LG]

* LLM depth correlates with performance, albeit with diminishing returns
* do they create higher-order computations that are impossible in shallow
* we analyze the residual stream of the Llama 3.1 and Qwen 3 family of models
  We find: 
  1. comparing the output of the sublayers to the residual stream reveals that
     layers in the second half contribute much less than those in the first
    * a clear phase transition between the two halves 
  1. skipping layers in the second half has a much smaller effect
    on future computations and output predictions 
  1. for multihop tasks, we are unable to find evidence that
    models are [-nának] using increased depth to compose subresults
    in examples involving many hops
  1. we seek to directly address whether deeper models are
    using their additional layers to perform new kinds of computation
    * To do this, we train linear maps from the residual stream of a shallow
      model to a deeper one
    * layers with the same relative depth map best to each other, suggesting
    * ie the larger model simply spreads the same computations out over its many
      layers. 
    * All this evidence suggests that deeper models are using their depth 
      * not to learn new kinds of computation, but 
      * only to perform more fine-grained adjustments to the residual
* This may help explain why increasing scale leads to
  diminishing returns for stacked Transformer architectures
