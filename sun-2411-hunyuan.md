Hunyuan-Large: An Open-Source MoE Model with 52 Billion Activated Parameters
 by Tencent
Xingwu Sun, Yanfeng Chen, Yiqing Huang, Ruobing Xie, Jiaqi Zhu, Kai Zhang,
  Shuaipeng Li, Zhen Yang, Jonny Han, Xiaobo Shu, Jiahao Bu, et al
arXiv:2411.02265 [cs.CL]

# The Batch

* A new open source large language model outperforms competitors,
  including the open-weights Llama 3.1 405B, on a variety of benchmarks.
* a mixture-of-experts model with open code and open weights. It comes in 
  * base and instruction-tuned versions, both of which can process a 
  * relatively large input context window of 256,000 tokens. It’s 
  * free for developers outside the European Union who have < 100 million
    monthly users.  You can experiment with it here.

## Mixture of experts (MoE) basics: 

* use different subsets of its parameters to process different inputs. 
* Each MoE layer contains a group of neural networks, or experts, preceded by a
  gating module that learns to choose which one(s) to use based on the input.
  ~> different experts learn to specialize in different types of examples.
  * uses less energy and runs faster than models of similar size that use all
    * Because not all parameters are used to produce any given output, the
* Hunyuan-Large also uses a shared expert — an expert that processes every
* there is a formula for the optimal learning rate based on the batch size .
  * The shared expert and the chosen expert see a different amount of data in
    each training step, so the team modified the learning rate for the chosen
    expert based on that formula.

## Results

* compared to four open source models and their instruction-tuned versions:
  Llama 3.1 70B, Llama 3.1 405B, and the MoE models Mixtral-8x22B and
  DeepSeek-V2.
  * Hunyuan-Large achieved the best performance on 15 of 19 benchmarks that
    * English, Chinese, math, and coding proficiency. For example, on MMLU
* Hunyuan-Large generally outperforms Llama 405B, achieving the performance of
  a 405 billion parameter model while computing only 52 billion parameters.
* Hunyuan-Large is among the largest MoE models we’ve come across
  * Setting aside Switch Transformer — a 1.6 trillion parameter behemoth that
    was built to test the limits of size rather than performance —

# Abstract

* we introduce Hunyuan-Large, which is 
  * the largest open-source Transformer-based mixture of experts model, with a
  * 389 billion parameters and 52 billion activation parameters, capable of
  * context: up to 256K tokens. We conduct a thorough evaluation of
* superior performance across various benchmarks including language
  understanding and generation, logical reasoning, mathematical
  problem-solving, coding, long-context, and aggregated tasks, where it
  * outperforms LLama3.1-70B and exhibits 
  * comparable performance to the significantly larger LLama3.1-405B model.
* archit
  * large-scale synthetic data that is
    * orders larger than in previous literature, 
  * a mixed expert routing strategy, a key-value cache compression technique, and
  * an expert-specific learning rate strategy.
* we also investigate the scaling laws and learning rate schedule of MoE
  models, providing valuable insights and guidances for future model
* The code and checkpoints of Hunyuan-Large are released
