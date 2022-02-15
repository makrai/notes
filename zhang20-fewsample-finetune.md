Revisiting Few-sample BERT Fine-tuning
Tianyi Zhang, Felix Wu, Arzoo Katiyar, Kilian Q Weinberger, Yoav Artzi
ICLR 2021

Code: github asappresearch/revisit-bert-finetuning

# Abstract

* commonly observed instabilities in few-sample scenarios
* We identify several factors that cause this instability
  * the common use of a non-standard optimization method with biased gradient
    estimation
  * the limited applicability of significant parts of the BERT network for
    down-stream tasks
  * pre-determined, and small number of training iterations
    * prevalent practice
* We identify alternative practices that resolve the instability of the process
  * re-visit recently proposed methods to improve few-sample fine-tuning 
  * the impact of these methods diminishes significantly with our modified proc
