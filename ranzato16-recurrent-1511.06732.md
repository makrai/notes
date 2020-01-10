Sequence level training with recurrent neural networks
ICLR 2016
Marc’Aurelio Ranzato, Sumit Chopra, Michael Auli, Wojciech Zaremba
  Facebook AI Research

#Intro

* It is ... essential that interactive AI systems are capable of generating text 
  (Reiter & Dale, 2000).
* RNNs (Mikolov et al., 2010) ... when used ... to generate text suffer from
  two major drawbacks. 
  1. trained to predict the next word given the previous ground truth words as
     input. However, at test time, the resulting models are used to generate
     an entire sequence by predicting one word at a time, and by feeding the
     generated word back as input at the next time step. 
   2. the loss function used 
    * to train these models is at the word level. A popular choice is the
      cross-entropy 
    * evaluated using discrete metrics. One such metric is called BLEU
      (Papineni et al., 2002) 
   * Training these models to directly optimize metrics like BLEU is hard
     because 
     * a) these are not differentiable (Rosti et al., 2011), and 
     * b) combinatorial optimization is required 
     * Prior attempts (McAllester et al., 2010; He & Deng, 2012) at optimizing
       test metrics were 
       * restricted to linear models, or 
       * required a large number of samples to work well (Auli & Gao, 2014).
        * Auli, M. and Gao, J. 
          Decoder integration and expected bleu training for RNN LM
          ACL 2014
