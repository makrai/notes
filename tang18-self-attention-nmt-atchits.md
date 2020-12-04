Why Self-Attention? A Targeted Evaluation of NMT Architectures
Gongbo Tang, Mathias Müller, Annette Rios and Rico Sennrich

# Abstract

* Recently, non-recurrent architectures (convolutional, self-attentional) have
  * outperformed RNNs in neural machine translation
  * can connect distant words via shorter network paths than RNNs
  * speculated that this improves their ability to model long-range dependencies
* We 
  * hypothesize that their strong performance is due to their ability
    to extract semantic features from the source text
  * evaluate RNNs, CNNs and self-attention networks on two tasks: 
    * subject-verb agreement (long-range dependencies is required) and 
      * self-attentional networks and CNNs do not outperform RNNs
    * word sense disambiguation (semantic feature extraction is required)
      * self-attentional networks perform distinctly better than RNNs and CNNs
