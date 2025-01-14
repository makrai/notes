Linear Classifier: An Often-Forgotten Baseline for Text Classification
Yu-Chen Lin, Si-An Chen, Jie-Jyun Liu, Chih-Jen Lin
ACL 2023 Outstanding Paper Award

# Abstract

* Large-scale pre-trained language models such as BERT are popular solutions
  for text classification. Due to the 
  * superior performance of these advanced methods, nowadays, 
  * people often directly train them for a few epochs and deploy the obtained
* we, an opinion paper, point out that this way may only sometimes get
  satisfactory results. We argue the 
  * importance of running a simple baseline like linear classifiers on
    bag-of-words features along with advanced methods.
  * for many text data, linear methods show competitive performance, high
    efficiency, and robustness. Second, 
  * advanced models such as BERT may only achieve the best results if properly
    applied. 
* Simple baselines help to confirm whether the results of advanced models are
  acceptable. Our experimental results fully support these points.

# 5 Discussion and Conclusions
  
* whether to incorporate the validation set for training the final model,
  * For linear methods, we follow the common practice to include the validation
    set for obtaining the final model.
  * for BERT or some other deep learning models, the validation set is often
    used only for selecting the best epoch and/or the best hyper-parameters. To
    fully use the available data, we have investigated how to incorporate the
    validation set for BERT. Experimental results and more details are in
    Appendix H.

# F Differences between the Two BERT Implementations

* summarize the implementation differences of BERT
  between LibMultiLabel and Chalkidis+ (2022) in Table 7. Here 
  * we also try to reproduce results in Chalkidis+ (2022) by using LibMul-
    tiLabel.  For 
* LibMultiLabel hyper-parameters as follows.
  * default: This method references the parameters chosen in an example
    configuration7 from LibMultiLabel.
  * tuned: This method performs a parameter search and is marked as “our BERT”
    in the main paper; see Table 8 for the search space and the chosen values.
  * reproduced: This method aims to reproduce the BERT results from Chalkidis+
    (2022) using LibMultiLabel. We begin with imposing the same weight_decay,
    learning_rate, and dropout values as Chalkidis+ (2022) and also the same
    validation metric. However, for other parameters, which may less affect
    the results, we use the same values as default and tuned; see Table 7.
    Except SCOTUS and LEDGAR, we were able to generate similar results to
    those in Chalkidis+ (2022). To fully reproduce the results on SCOTUS and
    LEDGAR, we try to follow every setting did in Chalkidis+ (2022).
    Specifically, we replace the PyTorch trainer originally used in Lib-
    MultiLabel with the Hugging Face trainer adopted in Chalkidis+ (2022) and
    align some of the parameters with the ones used in Chalkidis+ (2022); see a
    column in Table 7 for these two sets.
* LibMultiLabel supports standard BERT discussed in Appendix E.1. 
  * For the “default” and “tuned” settings, we directly run standard BERT.  For
  * “reproduced” method: we follow Chalkidis+ (2022) to use 
    * hierarchical BERT explained in Appendix E.3 for ECtHR (A), ECtHR (B), and
      SCOTUS and use 
    * standard BERT for other data sets
