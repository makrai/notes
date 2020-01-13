Sebastian Ruder
Neural Transfer Learning for Natural Language Processing
PhD 2019


## 3.3 Sequential transfer learning 63

* arguably the most frequently used transfer learning scenario in NLP and ML.  
* with respect to the sr task: 
  * distantly supervised (§3.3.2.1)
  * supervised (§3.3.2.2)
  * unsupervised (§3.3.2.3) source tasks 

### 3.3.1 Introduction .

* We define sequential transfer learning as the setting where 
  * source and target tasks are different and 
  * training is performed in sequence, not jointly as in multi-task learning
  * aka. model transfer [Wang and Zheng, 2015]. 
* Compared to multi-task learning, sequential transfer learning is 
  * useful mainly in three scenarios: 
    1. data for the tasks is not available at the same time; 
    1. the source task contains much more data than the target task; 
    1. adaptation to many target tasks is necessary.  Generally, 
  * expensive when training the source model, but enables fast adaptation to tg
    * while multi-task learning may be expensive when training the target
  * Despite these differences, both inductive transfer learning methods are 
    closely related.

#### Sequential transfer learning stages .

### 3.3.2 Pretraining

* the most common scenario involving a source and target task (§3.3.2)
### 3.3.2.1 Distantly supervised pretraining .
### 3.3.2.2 Supervised pretraining
### 3.3.2.3 Unsupervised pretraining .
### 3.3.2.4 Multi-task pretraining .
### 3.3.2.5 Architectures

### 3.3.3 Adaptation

### 3.3.3.1 Fine-tuning settings
### 3.3.3.2 A framework for adaptation. .

### 3.3.4 Lifelong learning .

### 3.3.5 Evaluation scenarios .
