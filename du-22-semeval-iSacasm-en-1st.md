PALI-NLP at SemEval-2022 Task 6: iSarcasmEvalFine-tuning the Pre-trained Model
Xiyang Du, Dou Hu, Jin Zhi, Lianxin Jiang, Xiaofeng Shi
SemEval 2022 Seattle, United States du-etal-2022-pali

# Abstract

* 1st in SubtaskB, which is to identify the categories of intended sarcasm. The
* ensembled: BERT-based, RoBERTa-based and BERTweet-based models with
* contributed the following: 
  * we reveal several large pre-trained models’ performance on tasks coping with
    the tweet-like text. 
  * excellent results without a complex classifier 
  * there is a hierarchical relationship of sarcasm types in this task.

# 1 Intro

Finally, we use the [CLS] token of the last layer of the encoder 
to perform fine-tuning on the final training dataset and 
ensemble them using the hierarchical way.

## 2.2 Adversiral Training

* by perturbing the embedding. For the calculation of this perturbation, we
* two different methods. The 
  * Fast Gradient Method (FGM) calculates the disturbance at the moment through
    the gradient (Miyato+ 2016), while the 
    * Takeru Miyato, Andrew M Dai, and Ian Goodfellow. 
      2016 arXiv preprint arXiv:1605.07725.
      Adversarial training methods for semi-supervised text classification.
  * Projected Gradient Descent (PGD) executes this process through more steps
    and additionally adds spherical mapping to prevent the perturbation from
    being too large (Madry+ 2017). During the training process, we adopt
    * Aleksander Madry, Aleksandar Makelov, Ludwig Schmidt, D Tsipras, A Vladu.
      2017 arXiv:1706.06083.
      Towards deep learning models resistant to adversarial attacks
* on both the embedding layer and the first layer of the encoder.

## 2.3 Multi-sample Dropout

* multi-sample dropout (Inoue, 2019) we use in this paper is an enhanced dropout
* It goes through multiple dropout operations and averages the output obtained
  by each dropout operation as the final output. In multisample dropout, 
* the weights of each dropout layer and classifier layer will be shared, so
* no significant increase in computational cost.

## 2.5 Ensemble method

* we adopt a hierarchical model ensemble approach. 
* First, we give the models corresponding voting weights based on the
  performance of each model on the validation set. The 
* weights are calculated as the square root of the inverse of the model’s rank
  among all models. 
* Then we conduct two votes, one for the first two labels (Sarcasm, Irony) and
  one for the last four labels (Satire, understatement, overstatement,
  rhetorical question).  In this way, we get the final output.

## 4.1 Pretrained Model Selection and Data Analysis

* For the fine-tune dataset selection, 
  we extend the dataset provided by the organiser with an additional 777
  samples (because)
  * The competition dataset reflects a long tail that Understatement,
    Overstatement, and Rhetorical question are pretty rare. 
  * There is an apparent hierarchical relationship between each label. We
    * primary labels (sarcasm, irony) and 
    * secondary labels(satire, understatement, Overstatement, rhetorical
      question). The hierarchical relationship is presented in the Fig 2 . 
* The standard BEC loss and re-weighted BEC loss are tested in this task. The
* result is shown in the Table 2. Models gain 
* a significantly 10.37% increase in the test set from 0.1417 to 0.1564 of
  macro-f1 score in the latter setting. We used this system as our baseline.

## 4.3 PGD is slightly better than FGM as a whole. 

* When the ratio is 0.5, PGD is optimal as adversarial rate 0.5, which increases
  1.98% compared to the baseline. If combined with the optimal multi-sample
  dropout method, the model can obtain 7.10% improvement, reaching a macro-f1
  score of 0.1675.

