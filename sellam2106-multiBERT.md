The MultiBERTs: BERT Reproductions for Robustness Analysis
Thibault Sellam, S Yadlowsky, J Wei, N Saphra, A D'Amour, T Linzen, J Bastings,
  I Turc, J Eisenstein, D Das, I Tenney, E Pavlick
arXiv:2106.16163 [cs.CL]

https://github.com/google-research/language/tree/master/language/multiberts

* Experiments with BERT are often based on a single checkpoint. While the
* not always clear whether the conclusions hold for the more general procedure
  (which includes the model architecture, training data, initialization scheme,
  and loss function)
* re-running pretraining can lead to substantially different conclusions about
  * alternative evaluations are needed to make principled statements about
* we introduce MultiBERTs
  * 25 BERT-base checkpoints, trained with
    similar hyper-parameters as the original BERT model but
    differing in random initialization and data shuffling
  * aim is to enable researchers to draw robust and statistically justified
    conclusions about pretraining procedures
  * 25 fully trained checkpoints, as well as
  * statistical guidelines and a code library
    implementing our recommended hypothesis testing methods
* for five of these models we release a set of 28 intermediate checkpoints
  in order to support research on learning dynamics 
