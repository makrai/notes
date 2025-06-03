Make Lead Bias in Your Favor: A Simple and Effective Method for News Summarization
Chenguang Zhu, Ziyi Yang, Robert Gmyr, Michael Zeng, Xuedong Huang
ICLR 2020

# Abstract:

* Lead bias it has a detrimental effect on teaching the model to discriminate
  and extract important information. We propose that the lead bias can be
  leveraged in a simple and effective way in our favor to pretrain abstractive
* predicting the leading sentences using the rest of an article.
  * Via careful data cleaning and filtering, our transformer-based pretrained
  * without any finetuning achieves remarkable results over various news
    * e.g. outperforms the pointer-generator network on CNN/DailyMail dataset.
  * With further finetuning, our model outperforms many competitive baseline
    * 3.2% higher ROUGE-1, 1.6% higher ROUGE-2 and 2.1% higher ROUGE-L scores
      than the best baseline model on XSum dataset.
