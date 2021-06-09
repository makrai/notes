Sequence level training with recurrent neural networks
ICLR 2016
Marc’Aurelio Ranzato, Sumit Chopra, Michael Auli, Wojciech Zaremba
  Facebook AI Research

# Intro

* It is essential that interactive AI systems are capable of generating text
  (Reiter & Dale, 2000)
* RNNs (Mikolov+ 2010) when used to generate text suffer from two major drawbaks
  1. trained to predict the next word given the previous ground truth words
    * hE at test time, the resulting models are used to generate an entire
      sequence by predicting one word at a time, and by feeding the generated
      word back as input at the next time step
  2. training loss vs eval
    * the loss function is at the word level. A popular choice is cross-entropy
    * evaluated using discrete metrics, e.g. BLEU (Papineni+ 2002)
    * Training these models to directly optimize metrics like BLEU
      * hard because
        * these are not differentiable (Rosti+ 2011), and
        * combinatorial optimization is required
* Prior attempts (McAllester+ 2010; He & Deng, 2012) at optimizing test metrics
  * restricted to linear models, or
  * required a large number of samples to work well (Auli & Gao, 2014)
    Auli, M. and Gao, J
    Decoder integration and expected bleu training for RNN LM
    ACL 2014
