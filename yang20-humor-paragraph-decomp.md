Humor Detection based on Paragraph Decomposition and BERT Fine-Tuning
Hao Yang, Yao Deng, Minghan Wang, Ying Qin, Shiliang Sun
AAAI Workshop, 2020

# Abstract

* Our approach is mainly developed on pre-trained BERT (Devlin+ 2019),
  fine-tuned on the task specific dataset
* We further propose a heuristic data augmentation method
  by decomposing a long paragraph into a pair of consecutive paragraphs for
  three purposes
  * Increasing the size of the training set
  * Improving the performance of long distance context modelling of BERT
  * Automatically find the punchline of a joke if exists. Our approach is
* evaluated on three datasets including
  * CCL2019 Chinese Humor Computation (XIAONIU Cup) dataset in Chinese,
  * FUN (Blinov, Bolotova-Baranova, and Braslavski 2019) dataset in Russian and
  * HAHA (Chiruzzo+ 2019) dataset in Spanish, which achieves
* competitive results on all of them. The experimental results demonstrate that
* tag the punchline if exists
* future
  * uncleaned datasets like tweets might be improved by a further pre-training
    on in-domain corpus
  * better decomposition strategies can also be a choice
