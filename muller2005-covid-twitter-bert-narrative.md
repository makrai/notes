COVID-Twitter-BERT: An NLP Model to Analyse COVID-19 Content on Twitter
Martin Müller, Marcel Salathé, Per E Kummervold
arXiv:2005.07503 [cs.CL]

https://github.com/digitalepidemiologylab/covid-twitter-bert

# Abstract

* we release COVID-Twitter-BERT (CT-BERT), a transformer-based model,
  pretrained on a large corpus of Twitter messages on the topic of COVID-19
* 10-30% marginal improvement compared to its base model, BERT-Large, on five
  classification datasets. The largest improvements are on the target domain

# 2 Method

## 2.1 Eval

### 2.1.1 COVID-19 Category (CC)

* This dataset is a subsample of the data used for training CT-BERT,
  specifically for the period between January 12 and February 24, 2020
  Annotators on Amazon Turk (MTurk) were asked to categorise a given tweet text
  into either being a personal narrative (33.3%) or news (66.7%).  The
  annotation was performed using the Crowdbreaks platform [7]
