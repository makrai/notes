Pre-trained language model representations for language generation 
Sergey Edunov, Alexei Baevski, Michael Auli
NAACL 2019

# Abstract

* we examine different strategies to integrate pre-trained representations into
  sequence to sequence models and apply it to 
  neural machine translation and abstractive summarization
* We find that pre-trained representations are most effective when added to the
  encoder network which slows inference by only 14%.
  * machine translation show gains of up to 5.3 BLEU in a simulated
    resource-poor setup.  While returns diminish with more labeled data, we
    still observe improvements when millions of sentence-pairs are available.
  * abstractive summ: new SOTA on the full text version of CNN/DailyMail

# 1 Introduction

* Pre-training of sequence to sequence models has been previously investigated
  for text classification (Dai and Le, 2015) but not for text generation. 
* In neural machine translation, transferring representations from high-resource
  language pairs to low-resource settings (Zoph+ 2016).  In this paper,
* integrating language models with sequence to sequence models focused on the
  decoder network and added language model representations right before the
  output of the decoder (Gulcehre+ 2015). 
* We extend their study by investigating several other strategies such as
  * inputting ELMo-style representations (Peters+ 2018) or 
  * fine-tuning the language model (§2).  

# 3  strong transformer-based language models trained on up to six B tokens

# 4 various strategies in different simulated labeled training data scenarios

* largest improvements in low-resource settings but 
* gains of over 1 BLEU are still possible whith five million sentence-pairs 
* The most successful strategy to integrate pre-trained representations is as
  input to the encoder network (§4)
